Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE962EEE88;
	Thu, 10 Sep 2026 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789000202; cv=none; b=hZAxreCbs86DVwSYvoKnBY2ldX03T+wUWT+F/fKyi2rWpph/C4QPS7EHL7YhkDEs5tLr7J/vWpSZmrzxDcDKbhdoCabPOB7OlI9ta8lnHixvdXgzMu31I+GpgkTeWIHQhQEkmAmCBAwc8I0DL4gt1VvKl60k1MxKEMl3DJk4nng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789000202; c=relaxed/simple;
	bh=9CZzpmzEYK1ZD6b226b0Q4OTdB9qdA5u4PhuJOj0VBw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M7/6tvXtz2A67M/8FcbRnsCU+axhgv5ZVr1eZqo02QqmzLI+DMMS4UvbVkR6kjqKAwAF4IweYvBGhi1HPVlR7lj57qdTJqliZAdypG3usIds32/YtTd4UeG2ejfHDR955uHfNYut7RnlKHCZ3Bi1m/Qvz05YIlcNs/uvjJ+SFHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4WTT8Be; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4WTT8Be"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093551F000FF;
	Thu, 10 Sep 2026 00:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789000200;
	bh=9CZzpmzEYK1ZD6b226b0Q4OTdB9qdA5u4PhuJOj0VBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j4WTT8BeTeNJ8YHmvqFIZ+9P7zSsfyEQ8+NYRHrmWvL7PpZOTTTkMKCfMNkLyCH8y
	 UB6bZTv+C1mSMp/1Byg1YCibdjkCV2csGOd8Eu7JYYOZe0zxXF2tMgh1EmdTNAjU3g
	 QvDMvPNj2fwENlZHRv7Bt3bNX2QqovpKjdpB2x3g6dyZdNkOTpEN/53atQmpSJsDZD
	 y2+jYn6wDQtb5ksj6fOyOmGUtdn1XJkFIj2/mYiNsR4wpP6ZEClCyYoJvW7AXucnFU
	 wAKH09F5YaF4epbJKseqZz5vvjjIBD4u67ktvh2I1toJeRLuSvndV9emsA6aSl77SH
	 Nm/fWrjjARysg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/2] dt-bindings: mfd: x-powers: Add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: lee@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260909-submit-ac200-mfd-v12-1-a44d6bc30a4f@gmail.com>
References: <20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com>
 <20260909-submit-ac200-mfd-v12-1-a44d6bc30a4f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 00:29:59 +0000
Message-Id: <20260910003000.093551F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-submit-ac2=
00-mfd-v12-0-a44d6bc30a4f@gmail.com?part=3D1

