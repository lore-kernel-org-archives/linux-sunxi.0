Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581C29E11A;
	Mon, 20 Jul 2026 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584237; cv=none; b=AJTn/mDDMcd/PYwTt0uTXfFAa4voH3lRbcXne9d5Fs8EOUI/V+cAM6fFRFaE61Nqzzjzno3s69wRNfiau9Ipq53uythHTsBBe7Xx7GD9xARQQX9Rt1us3QGU59tVEA4tgk5jITgwDRRTRoXq6ZULqOheHEbrkv35ZW8lpqzouyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584237; c=relaxed/simple;
	bh=nVoGvxS1rjJ51IrKp5QuNbCGzuMUZcFMo2mKY5sSpeE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OP9MC7MqTj7xcSBBexxsXl4CCwEjOjcR2TXzU7Lg1JhaZHuHkWEs+9cUZTK1Mc6VDRm+4RjH3p0DXhKX1/BrASBEmHuhZEWgag/+0bYJm12RkDEO/QC8LY/tDxfk+qbaj/ZEaq7OEmyRMJ+bcAjb3dn3rHQ0X61DN1KF5CzrTvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7JbpoTK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7JbpoTK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2D51F000E9;
	Mon, 20 Jul 2026 21:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784584236;
	bh=xMUKVBXh5rsu7TlwPZ4371ZVHvwu6FpUPmSCHa4i4xE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H7JbpoTKykQYyagR4VZOMJwXLIxcxAFVrC2tjhiEakwwC7USl+FZh4ZbSq2cGnXZV
	 7AiBdkrQ4qNYWh6jgGqd2oS977dXn5WWTn6DDrStsZoaPq8Gx7j4Gm2bAwhn6v6qhr
	 lkVB/r5gZZe6nF9O3qEa2AKtSpQ2igdSEsOunCigJDFcf+Vlalr5UsTcDO9Bm3Unwr
	 DrqJjZ4IrwwcXKM5PXQ2ONa8gUFggCdhexjipIfFKlanZ+OTfrJ5WzdwfXhH6/o8FT
	 IOYTkIbT7W6tKTHalhyPT7Em5fAcMDq7V+gvbCxVKer7msnKwsWd3dN1Z0a23LyXTS
	 GkNXdQIC7rmNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: a523: x96qpro+: overvolting eMMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260720213832.3763-1-andre.przywara@arm.com>
References: <20260720213832.3763-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 21:50:35 +0000
Message-Id: <20260720215035.ED2D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Bumping the eMMC IO regulator (`reg_cldo1`) to 1.9V inadvertently =
misconfigures the SoC's IO bank (Port C) into 3.3V power mode instead of 1.=
8V mode, creating a logic threshold mismatch.
--

--- Patch [1]: [PATCH] arm64: dts: allwinner: a523: x96qpro+: overvolting e=
MMC ---
commit e4c261c388d6e406babdf0d56ac61d104d537230
Author: Andre Przywara <andre.przywara@arm.com>
Date:   Mon Jul 20 21:38:32 2026 +0000

arm64: dts: allwinner: a523: x96qpro+: overvolting eMMC

This commit changes the eMMC IO regulator voltage on PortC from 1.8V to 1.9V
for the X96QPro+ device. The goal is to improve eMMC stability and performa=
nce
without drastically limiting the clock frequency.

> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arc=
h/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
[ ... ]
> @@ -194,8 +194,8 @@ reg_bldo4: bldo4 {
> =20
>  			reg_cldo1: cldo1 {
>  				regulator-always-on;
> -				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <1800000>;
> +				regulator-min-microvolt =3D <1900000>;
> +				regulator-max-microvolt =3D <1900000>;

[Severity: High]
Does bumping this regulator to 1.9V inadvertently force the SoC's IO bank
(Port C) into 3.3V power mode?

Looking at sunxi_pinctrl_set_io_bias_cfg() in
drivers/pinctrl/sunxi/pinctrl-sunxi.c, the driver uses a strict check when
evaluating the voltage:

    case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
        val =3D uV <=3D 1800000 ? 1 : 0;

Since 1900000 is greater than 1800000, this evaluates to 0 and clears the
PIO_POW_MOD_SEL register bit, incorrectly configuring the IO bank for 3.3V
mode while being powered at 1.9V.

Could this mismatch alter input receiver thresholds and drive strengths,
potentially causing signal integrity issues or long-term hardware
degradation?

>  				regulator-name =3D "vcc-codec-sd";
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720213832.3763=
-1-andre.przywara@arm.com?part=3D1
