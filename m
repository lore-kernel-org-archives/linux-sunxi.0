Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A1F3D6693
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781350630; cv=none; b=X83YCWJ0hsOsqvKQ2LH8s5MD4WmwIkE2NC55vS2sbk9g8LGJhL51LZCg3Je+kv0qQarF0iBUIt63U+ua5JyE5K7LdZxj6ti+I2AswmrXgTZ/gW0FzorU7tGTHVdQPnYHy66yOvSp4elpyyKC9GZLN4JkExzuNxuXaH3pRr0Ns9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781350630; c=relaxed/simple;
	bh=wlS7xKgyO+XyXN6dNATrd0asFAwdvMwxkQainFP9a4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B9FK7QTFEcP6rVDDsXS5sWHx95rHu/qxIE/foYiB5hdSYfLj2LRyNy8iAz7h1OQG3HqvYbQUlhgI8Ae17iSYsuK4wHu3nVwlWwM9umL7Xg9dj72mnSJdX62GXd4N9W/44q+x9u8QQt2rE2viwMKVdDH9n7zVJLcNNW5Muy9SsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1Mwh0GV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1Mwh0GV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso13146935e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781350627; x=1781955427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFT4S6YWGOqkBEGH8f7ZvRxrjPmCEGESiSX2o/TWj+Q=;
        b=R1Mwh0GVRRo7LC/P8cW0WJqDlDJoCn+OXMD9UgaONKx/ChiBP76/AUcFGN6d7XDlif
         HZ9zBAfCoGgd7BscmOWxfaWaYusikOvhVL5vC2qF+IchzBWKNBaA7gUvb/mWTtsF8AXb
         K1Fp0HTv6KrDu2F4URUwTFwfb1RPvHDnNs/4fVzCwWcgFemQ4j/a6la+nfEXfkD6DqMp
         UpuoRWbyuDE9ToTr2FNtXJd7g2uVxuOhrXN8lfy16hdxN/wrgxINZmCPvPB3Bl2P5MBC
         8LMy3avTlotXJ+T9ODKUrGDVA4512UtJWE04Wu6nxgEsXYBbY+apeSd3NzZnV/nHkmTZ
         xM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781350627; x=1781955427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SFT4S6YWGOqkBEGH8f7ZvRxrjPmCEGESiSX2o/TWj+Q=;
        b=EWMEjpqBYYKhn3oo9TufifQwmCj8tcmK2FdERRFoU/EI6+wbyA1xmxQP04NQdJ0Zrg
         z/7QWxIAEH4b4KtssPd/UCzulYtfOhRrRDg46XIDQyyOzcrxrIyFeGy6HtNHiDpuWf3T
         +bC4HCbPBBgAmSJ6WXGx0qevNwM6VtvuVmPOMS+WJIZbd9Ot698lj2T9fqRjJpFm4ggn
         abfFNd0gn/auHHFAy13GGqDlFIMkX/LioCiehD12HkQJdSrTuh8m3LjZHH4O/Gk6n9J/
         xVBrfrCpFmQTjsp2lN0eyAJghQwglTxOq/pOoWxxk+2USUQIrjxp8q/wnkwDuetNtspk
         ziTg==
X-Forwarded-Encrypted: i=1; AFNElJ+OL8T9HcRvOm9Wic70m+Iv+Be8T8gv+G9kC8Oy3+RDsdHZdn5CIoyqxuSevgWwFjJTRj8tCM9ARv27lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaDziIK21eLKdVF52MTLS3VntLDVCgS0QzhBX9r4h/jh52CBMs
	04/8GLMTvimDCBmN/VP31nyDfpJD3ek47B88uCutyk6NW4lJd8Qi6EDA
X-Gm-Gg: Acq92OH188ZXva1A+trp5VONjDcnIFX/lYhirLsiLAi28Xsa0S1OFnvHmk/Q23YV+gG
	9QBLNAzVSFDCMqyuR0NRAVILJan1X7+0NrRqryJlUmwnI0y1pzjGyWS9yoVWqMAs/UI6yIqu1Wt
	jlBVtyNZ4r0fJ6+n3h7a0MvEmr4M+pL9Zktt+1uYLXsq6pXft5KH/561kmFzP6CVQZ8klRETHpd
	x+AwbWDA2b4kNnKUQS4KxWNuoHrL77PekOnvHPJSBD6XOhMd+aPx49jBSHvp0MYw6HBR8nGWgqk
	R7t66ttP1wJbL7putMThTFXTUXbSCIHDLXYFNyJglIdrmr12XPUpL+15UuxWNZpCcxUWvfZkRrr
	1Dexj7APYeqNMrOGmXCWEITCbYmah4tC0ZNOJ832aYr1rXHeg8gvQ09bpfKmKqBOMfLfq8WTL1o
	k/U4WqXlWckurYn/GeKUd9yP7G/71aJiAC04PLr/J3Zxlx
X-Received: by 2002:a05:600c:83c8:b0:492:1e36:d16e with SMTP id 5b1f17b1804b1-4921e36d1a9mr50171305e9.36.1781350626544;
        Sat, 13 Jun 2026 04:37:06 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922033dd3esm67812295e9.8.2026.06.13.04.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:37:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, enzo.adriano.code@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: add Radxa Cubie A7S
Date: Sat, 13 Jun 2026 13:37:04 +0200
Message-ID: <yDDIdJcZRCmL2YwI2Wv_ng@gmail.com>
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com>
References:
 <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. junij 2026 ob 11:42:16 Srednjeevropski poletni =C4=8Das je =
Enzo Adriano via B4 Relay napisal(a):
> From: Enzo Adriano <enzo.adriano.code@gmail.com>
>=20
> Add the Radxa Cubie A7S board description with serial console and SD card
> boot support.
>=20
> Ethernet remains disabled until the GMAC210 wrapper, clocks, resets,
> MDIO, PHY reset, PHY power, and link behavior are proven.
>=20
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
>  .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts   | 48 ++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index d116864b6c2b..824cc35152db 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35=
xx-2024.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 000000000000..453761a96323
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"
> +
> +/ {
> +	model =3D "Radxa Cubie A7S";
> +	compatible =3D "radxa,cubie-a7s", "allwinner,sun60i-a733";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		mmc0 =3D &mmc0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&mmc0 {
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	no-mmc;
> +	no-sdio;
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	uart0_pb9_pb10_pins: uart0-pb9-pb10-pins {
> +		pins =3D "PB9", "PB10";
> +		function =3D "uart0";
> +	};

Besides sashiko bot comments, these pins should go to main A733 DTSI,
like it's done for other SoCs.

In any case, it's a bit early for DT. At least clocks should land before.

Best regards,
Jernej

> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pb9_pb10_pins>;
> +	status =3D "okay";
> +};
>=20
>=20




