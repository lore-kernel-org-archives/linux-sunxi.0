Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E233569F34;
	Tue, 22 Sep 2026 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095044; cv=none; b=REGkPRO88cSLK5NZcJV/b2UwicdNR70VR39x4K6GRGy6Wzg1Ofx48KqOoXp0aAZvEy2KOqupU7l98NjxCD1PGySqM+nc2u5IPvsWHrnPAi/ava34WvMPs4ikCu1RLhykijJrJNoUj5u53WbCtHrBXlqbz8BLJIFyYZZgpfIE1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095044; c=relaxed/simple;
	bh=QlgXjnmC+ZLQMy3wyhUxwQ10iQVD4+WbtwwK6V+B6lM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TCNcmfmB+x9bOlYYqzhlscMGPbxRYOx2vXqkA3/1HHGuuJK8mljVmTN8U58wCcFNyfimYEIRVxPR5MtLBkE78maUkRAfKUV9+YQofvxIUijupcUXrYXdQV8BNr5umLFqGqKG5KCh9fmZ6BKQQxFAxqOxyGYJzHjTCTnOuMcXvsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ld6BjzS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ld6BjzS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DD91F000FF;
	Tue, 22 Sep 2026 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790095033;
	bh=QlgXjnmC+ZLQMy3wyhUxwQ10iQVD4+WbtwwK6V+B6lM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ld6BjzS1M44L49FUBvzZ3J4aMfILlJTG/QKQbLnHS/HeuGhWJQd3jIEQwfEIcJCHT
	 xFrtNJY36uCNotZ5EN7q50i23d6OirexJNMWH4ARdtQRnVpAkqwK89eXsoWqcCWmTp
	 j8xo0CYSiRX7yllu35YuQi3VpWi6yCVCcYydGVM5xl0LLArLpjGJH5n2erdoWSyqCZ
	 oyk0lRtEbHE1ASObdtweo6Y9kja3wabdvG1tvhI9kUKb1EPf5arOeAfk5b5B49p90E
	 WFiDJfbL55oAxT/aBjPrLs3J9/gaFbOsfclrk1O/ZQEv4PpjWfSgak+SluAfMTZ/9f
	 uMDEO0ojBbPtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/2] dt-bindings: mfd: x-powers: Add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260922-submit-ac200-mfd-v13-1-8832afd2481c@gmail.com>
References: <20260922-submit-ac200-mfd-v13-0-8832afd2481c@gmail.com>
 <20260922-submit-ac200-mfd-v13-1-8832afd2481c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 16:37:12 +0000
Message-Id: <20260922163713.39DD91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> The AC200 is an I2C-controlled mixed-signal companion IC containing
> audio, video, RTC and Fast Ethernet PHY functions.
>=20
> Describe the shared input clock, audio DAI, TV encoder display graph and
> optional bandgap calibration in one parent node. The codec and TV encoder
> do not need separate firmware nodes.
>=20
> AC_LDOIN and TV_VCC are distinct 3.3 V supply inputs. Describe them
> separately without requiring different external regulators. Require the
> audio supply when the DAI is described and the video supply when the
> display graph is present, while allowing PHY-only configurations.
>=20
> Describe the optional shared INTB connection without an internal
> interrupt domain. Cable detection status remains readable over I2C when
> INTB is not connected. Include wired and unwired examples.
>=20
> The Ethernet PHY is represented by a PHY package on its MDIO bus, with a
> phandle back to this device for access to the package control registers.
> It therefore does not require an MFD child node. The input clock must run
> at 24 or 27 MHz when the Ethernet PHY is used, matching the rates encoded
> by its documented clock selector.
>=20
> Co-developed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-submit-ac2=
00-mfd-v13-0-8832afd2481c@gmail.com?part=3D1

