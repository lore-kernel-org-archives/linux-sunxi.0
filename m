Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377505;
	b=JxpxYo+XooSeFpm8tuw9szwRKRBLbnieMnmoXSmISCbnMvNq+rh7CX66QwJmWXsjw7ML
	 /7GpORefpxfuV63PLSGX7mIEe23c6RwrdU7E6/jwhNe7Tcwoicxq2QXLhF+ywt91SPfIH
	 /9fZSRDrLRZQp5zhf5ALog0rg304TfnKzqp6psyIUdjUqI1PvKUJ3rrdfXHyOVI3rKIc+
	 IW8E3SPKEWzQMH6znNoHcMEP3gEgAomz1PjgNJBM9Sqm6DOXuAHzBYHIHTbJI2dRPleOG
	 lj4AjeUES2+ObWlbd9NDemUq3hTXAIPTqVit3Y9kGTXZOPfkMHX4VzZDnYBEVQ0he5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377505;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6cU1bK+8ZDmix42zLdKvN0bdMM28L3RMkRnrpvPlPos=;
	b=c2JArcEikhyXq2HWsauyVF+g3Fs6JU/8PwfvHeLi7MAOMB4fgI+YpPQIIGNAQmNWdm1G
	 tMFUbzSvJXDV3vQV+vFT2qK8XZXrZWS9x8OCe0Eeb6V3vycj9kcEUAYWLxirBD7W3/GNC
	 GvQoP/LklBtkU6lv9xcxc/wWffiqG63wOP8idZqnRhf8PCy7qPaC02zvQXfNPc9pTiaDX
	 qGTtrTEVr+zWrVYCpeK/XvlKJ31EgAVeFLYsxgR5Rp404InS732Pgt9BEeO0ADrkDsA4n
	 FhBEvg6C0+qLgNJjJEqedegyIaTGJyO2Uhzjl5dfCKpIjUAps5VJXa8b2dHfwxzIYLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i7w+u4A/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB0606A31C;
	Wed, 11 Nov 2026 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7w+u4A/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9A31F00A06;
	Wed, 11 Nov 2026 06:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794377504;
	bh=6cU1bK+8ZDmix42zLdKvN0bdMM28L3RMkRnrpvPlPos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i7w+u4A/xPCnfsV+C50VtCECam+Ql7CRhguoOMml2mHC+wc6+eae/q5Tt8qihYjnQ
	 SMAvtbYtsCbidGoUFHMhJBC95awBpfQ/z/w8VQHtMovpdsVQI5/FRsspkBUkPXm9KA
	 HmWfZbNZ4CLus44PDzK16RAPnUaByWdpFiJ+Szk0pcu17lr7fjhe3EqJesqdKOsPii
	 Jjy9+UgbzUVJzm20tKkmM1/mhfGNSAX9EY65rXq98Gybh9pA4aWokrK7r+EVBXov35
	 Cot9DXATYmyDssVzemZmUEWJ7yhia1txBOpFk756OpUSCfFbCX7oiJUlC7berCCT0N
	 QJxbOtU8OhHNg==
Message-ID: <sashiko-outbox-208395@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c
 aliases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-h616-zero2-dt-v2-8-88d8030fc975@gmail.com>
References: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
 <20261111-h616-zero2-dt-v2-8-88d8030fc975@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:11:43 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: allwinner: aliases for disabled and unusable I2C
  buses
--

commit ba431251208e1b9ebd8e19b71da4c12196e7c374
Author: Arun Iyengar <aiyengar1990@gmail.com>

arm64: dts: allwinner: orangepi-zero2: Add i2c aliases

This commit adds i2c0 through i2c5 aliases for the SoC TWI controllers in
the Orange Pi Zero2 board device tree.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index d5d39bac59155..98fc83291dc83 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -12,6 +12,15 @@
>  / {
>  	model =3D "OrangePi Zero2";
>  	compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> +
> +	aliases {
> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		i2c2 =3D &i2c2;
> +		i2c3 =3D &i2c3;
> +		i2c4 =3D &i2c4;
> +		i2c5 =3D &r_i2c;
> +	};
>  };

[Severity: Low]
As reported by Jernej =C5=A0krabec on v1 [1], should these i2c aliases live=
 in
overlays rather than the base board DT, especially since all six
controllers are disabled here and three of them conflict with enabled
on-board peripherals?

In particular, r_i2c (i2c5) only routes to PL0 and PL1, which this board
already uses for r_rsb to talk to the AXP305 PMIC.  Likewise, the external
pin options for i2c0 (PI5/PI6) and i2c1 (PH0/PH1 or PI7/PI8) conflict with
the enabled emac0 (ext_rgmii_pins) and uart0 (uart0_ph_pins) nodes in
sun50i-h616-orangepi-zero.dtsi.

[1] https://lore.kernel.org/r/ekjxzCRpRcWPwcDw_lDV4g@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-h616-zero2=
-dt-v2-0-88d8030fc975@gmail.com?part=3D8
