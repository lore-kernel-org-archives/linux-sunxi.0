Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC4978F4A
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 06:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741846051; cv=none; b=GEw8Nu/LC4grZ5nUb91Itqn0sitdf0yNoHYX6Oovj9+UWuPdJcj26LO9/nYNR3jFi7nHPsCueeF1YXgMK0oCvlILu4YYKmcQfUk5SXJVbaoi2rhuC6h3BxsMM1XMHRhjfm0I/ym2KHGKD26VZe+mS3+sgA1BvCB0JmxjXsX6IIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741846051; c=relaxed/simple;
	bh=oY6o8II9iLNtAxXs2X/GMZFzCo3ZF6DKGHBUDkbm90U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THdoKcWiduw8Yru4UhAAaWe1VdEHlfJz2YMq0mVyKHrte4PNNumQOG49RJVzPKdCBfvnsJPe72DkhpNNHyEL/C6yXhdYnim81Uelv7iLRz0yTlLO+aPF01mG9oey+t5L1UQ0+Iu0ZVzAjV0Pdf5j5rc9uPce5w/sDVuMWEVwPQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hciY3SfU; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hciY3SfU"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5b56fc863so704621a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741846048; x=1742450848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fna2H3vwjdEZcl/b/bY1yvDSI46yeeVTssxA2eJJMgo=;
        b=hciY3SfUg8LyZ3ZIW5H9bma/NXz44Awfd2vPvEzGnDq9R30CwyHP61Y+QalA02kWEy
         jrPCfmm5qZO7QycNCcksnBJRZoXIjRZfDqEDs6lmZ059J3wvdtbrYZ5Ht3gtLXGMXO8U
         LywvyuqzBmin4k6N31a4jSEv6pGh+2DmMC4ucINquEQtBwFtb67fRHfFGtXftSZATnkW
         JEGNC3exr9l5+imk68Ms7LAfHeIgJLq2XBUFsFHbnVQtmcemfB+xtwlK5TKxazj8B8lr
         wLBT0mxv0BTl1MoVsTwNXMPHkvrdjEcUyjiI3UJIf5NVl5nCLT2b6/iBn9K5sVWcywT5
         m/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741846048; x=1742450848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fna2H3vwjdEZcl/b/bY1yvDSI46yeeVTssxA2eJJMgo=;
        b=qF3spDXoz0iND5Z0HcSWimif9SxWrenkRF2MRG3/d8zikXBo0F8HL8rhDjZNcK3geV
         eVoZfg4WXKuATOZsBAck7kJSQ815PO8F0aR2a3cF19px99sKGIVGrvaja2sQMXdkxJlU
         nydKcmzsas8uIr2m5W2CZyDqTeL0Nr6iErxUD70CqhoyURwxRe8TMIQMiACOs9fnmPST
         T00EGngegSO9omnHrsB6mLinZ8wtngh3SUniHcYihe5KwP2mVZ02CU6gKWeyYj/dUtgx
         juzPKt3ngJUUVAO77CuWh0s0OEOR9rZ7SqvaWVJnlRica341DSkT7cqSIvLyXn14sQrT
         REJw==
X-Forwarded-Encrypted: i=1; AJvYcCXCSa6dyEShBqDtVaN/zEEdyYuj/xS/P5jMH1Eym8dOz1mHgSutq/k3lJsvC/TAqdaZHQDl7bt7Vhs8dA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpJC4gn1KBLJUcGuZkl5J7uHSzPaTHZ8gQmvHlBvuUY49Qqq7d
	PZOIzRl+dXYU94OtcKBQrJmEggRuB6FHvnHnPgok+cVSd0NYVvu4TyN1+Q==
X-Gm-Gg: ASbGncshFq5PtFGZO+xeoe114p24SiOMUL09GNdHen4c465Whg1p8L+ddOIddteO471
	dLPvQxedUvnLr6b0/ctTdMqyjmljfZn3qZQHZ/+REMlV/rUNP5u5lzQlysOzlpdP8SOAOlgl2lp
	DyfNX0f+H4500/pVdhKM+gjxAqxZBOP5x3v71KmMoMrAyTUSADaNsMMfbZ2UMP79mFzT/Ue7kju
	XlKwwjOaEtRj1AUQO9oj7m9sUG/5fftE3l/wMHTaitvoIy+SrB5CUzrA25kUv8GH+fWFXV5tOea
	LCuOG7HpzCycobqn7YkiZ/3K9wbAXZ6I7lnEOCSjPBIPTTKV/8q+NXw7nufbDu0x/lOgbZ2S+qQ
	cSuvVa5o1BnZ/WGoayWl76rYNvH5QSRg=
X-Google-Smtp-Source: AGHT+IHhGz8J8Life4SG/qgqJ0ye1c0G+Al3baprNQ+dcPxYYmPbWk9QrWHvq7NPTGPL3KzA3Wv0eQ==
X-Received: by 2002:a17:907:c10:b0:ac2:7cf9:71a1 with SMTP id a640c23a62f3a-ac2b9ea16d2mr1529284566b.41.1741846047859;
        Wed, 12 Mar 2025 23:07:27 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aef85sm39791166b.20.2025.03.12.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 23:07:27 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Michael Klein <michael@fossekall.de>
Cc: Michael Klein <michael@fossekall.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: bananapi: add support for PHY LEDs
Date: Thu, 13 Mar 2025 07:07:24 +0100
Message-ID: <4637912.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250312193629.85417-2-michael@fossekall.de>
References:
 <20250312193629.85417-1-michael@fossekall.de>
 <20250312193629.85417-2-michael@fossekall.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Dne sreda, 12. marec 2025 ob 20:36:28 Srednjeevropski standardni =C4=8Das j=
e Michael Klein napisal(a):
> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
> Add the corresponding nodes to the device tree.
>=20
> Signed-off-by: Michael Klein <michael@fossekall.de>

This is patch 2/2. Which one is patch 1/2? I got only one.

Best regards,
Jernej

> ---
>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/ar=
m/boot/dts/allwinner/sun7i-a20-bananapi.dts
> index 46ecf9db2324..4976453ed192 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> @@ -48,6 +48,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
> =20
>  / {
>  	model =3D "LeMaker Banana Pi";
> @@ -169,6 +170,32 @@ &ir0 {
>  &gmac_mdio {
>  	phy1: ethernet-phy@1 {
>  		reg =3D <1>;
> +
> +		leds {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			led@0 {
> +				reg =3D <0>;
> +				color =3D <LED_COLOR_ID_GREEN>;
> +				default-state =3D "keep";
> +				linux,default-trigger =3D "netdev";
> +			};
> +
> +			led@1 {
> +				reg =3D <1>;
> +				color =3D <LED_COLOR_ID_AMBER>;
> +				default-state =3D "keep";
> +				linux,default-trigger =3D "netdev";
> +			};
> +
> +			led@2 {
> +				reg =3D <2>;
> +				color =3D <LED_COLOR_ID_BLUE>;
> +				default-state =3D "keep";
> +				linux,default-trigger =3D "netdev";
> +			};
> +		};
>  	};
>  };
> =20
>=20




