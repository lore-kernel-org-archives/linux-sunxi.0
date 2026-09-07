Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CA03537FD;
	Mon,  7 Sep 2026 21:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815227; cv=none; b=qllskT0d1rLYMymzQ8RBnckm00wE6Yfrnw02IvRWBDlA5MkInLP/jcY4KtDmzUa9UkmGU4CdnZK5AoogO8QyDpXKCtsZg+kS+/quhyT5MkO7KSP3SrKPasmbj7LTRU0M7yNSj4a5nZ7yf7eCufaTAaxBmgwIfypJBCm+jROaTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815227; c=relaxed/simple;
	bh=sXdMN1kD8iJV+XcV6APRRD8LoDJo1v2nOb/3JiH2qGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IUa1t98q5tKII6/9veHUBM/bRiPdqiANwwDZyqfUTikaosSrp29FMJC8krpWY7FMjICDrOA7xqXwVr11GOOMtjll1YskCrWenRdEhpD+/JRyTZmpLvdudgJGNgT5X26kPHQ4HCpD5slVMIs4AUETJNwxI0djyfBCj+U2kpa2/ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECrK6cTu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECrK6cTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FFA1F00A3A;
	Mon,  7 Sep 2026 21:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788815225;
	bh=sXdMN1kD8iJV+XcV6APRRD8LoDJo1v2nOb/3JiH2qGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ECrK6cTu7CPh9bWDOFpyStK9JwECUtm4dEbWHNIYfYHBmjI2fk9KuaDkznzeKPD4x
	 1bPcsOldjK4ZBL3bAdAQwLeaD3WPDYxSgTPgr9DWP8dIjG94WoBPjR2kenFqa6cGZs
	 uldF9rQOhUjPnEarnyBQ4Gp0dSfQRqzyZo3EQyKSUaa8D3i5M5pfXwCXPLX4wHlqz8
	 jNpt0Cd4H1/ml881LtmT3BSR2JNmtg1rjrgeBk+e1G+3ztW49f1d6bZOu2cnd4c8qF
	 azHh+QzDmJedxYj1mKXUf4CS+BNnlw4fW1yJZKp1r+JsFmYIPCiBZl1BabksmzFUvm
	 pGzr07u6C693A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: mfd: x-powers: Add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-submit-ac200-mfd-v11-1-58dd9dc7f69a@gmail.com>
References: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
 <20260907-submit-ac200-mfd-v11-1-58dd9dc7f69a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 21:07:04 +0000
Message-Id: <20260907210705.20FFA1F00A3A@smtp.kernel.org>
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
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-submit-ac2=
00-mfd-v11-0-58dd9dc7f69a@gmail.com?part=3D1

