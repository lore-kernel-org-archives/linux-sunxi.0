Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0CD29E
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:30:07 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ad810be221so635393166b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695583806; x=1696188606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uegV/6/zQE8HABESltJplBPPeOrCrEYD8pBkTSK6Xc8=;
        b=Zj3La0pgIjenFLOE/gite3sD8UjvfPrspuzr07WmFELiNLBJ1b//koBEug3jh24pOz
         /9V1IrpNMibvHVpXDkbjNoBBtZDloFShu5LHgh3wXR0Z80Y5OS1Fhykq7XeQyV8EDBkv
         kQaZtV3cYFKyj+8bdNx765J63n1LFRc7f+D02brRSODWwT1Jt9CuWdJu1UyJTPvw00vZ
         V8c9NLWmZOJgrX3KHh0ce55oPI1HfH84R+Ocm/xShfOFhp2iapCqxZiruJ30cpsZ4Y0T
         irb3fZZ9Va7JQCWhYDefyJToK3DASW9hqhL4MN4VbZNYblhLHR29Uc0gI4xe2a9qoXtB
         m6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695583806; x=1696188606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uegV/6/zQE8HABESltJplBPPeOrCrEYD8pBkTSK6Xc8=;
        b=KhklSXQmI7HIQ1uAjTOmeWItD9zxdSfXGX4d3EPtfscFQJ/mg9auAQ5rKYeYOQ8k78
         j0+g/X4J05bK8pVGtD2A11LYkS+Xgy98+JKV4HTkOF6MJoF4WpNjIZf1o2wFto7Ezlja
         4342oSotVbgXa5R7LIopCjJ679f/6uJPCtHzOngqrCMx0CriFo9wDvHABPifrT/TLRic
         XCnCY+IBldKqjpn4Ymc+HEUUylF4af8/3SipAlaOg/fm/j6OIr8V+jzuudlVmc5B1iFv
         zgifvHvnTN4NTpgu35I8y0wQLtKm6wWG/k/OY0n5zgmkr888HucU9CfHvttgO+Rb3GuF
         AsGA==
X-Gm-Message-State: AOJu0YxN0N8dbXaxijUO/Ya8DNWk1JT6R2FdIhIWAlyDllkdiKim9nyQ
	77nzxG9AHCQv9oyxOdQrGApBknIsUA/EWA==
X-Google-Smtp-Source: AGHT+IH/R2d9hfkFWuD+vF1uvLthvReN7rN3+88k2WDRPwF9nKHjqkihElcmj4QlDO26v7lW1IpP/w==
X-Received: by 2002:a17:906:20d4:b0:9a2:86b:bb18 with SMTP id c20-20020a17090620d400b009a2086bbb18mr3813711ejc.26.1695583806172;
        Sun, 24 Sep 2023 12:30:06 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709061e8a00b009adc5802d08sm5289132ejj.190.2023.09.24.12.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:30:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
 samuel@sholland.org, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 andre.przywara@arm.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V5 1/4] arm: dts: sun8i: V3s: Add pinctrl for pwm
Date: Sun, 24 Sep 2023 21:30:04 +0200
Message-ID: <2697958.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230921135136.97491-2-macroalpha82@gmail.com>
References:
 <20230921135136.97491-1-macroalpha82@gmail.com>
 <20230921135136.97491-2-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 21. september 2023 ob 15:51:33 CEST je Chris Morgan napis=
al(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add pinctrl nodes for pwm0 and pwm1.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/d=
ts/allwinner/sun8i-v3s.dtsi
> index 3b9a282c2746..c87476ea31e2 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -414,6 +414,18 @@ mmc1_pins: mmc1-pins {
>  				bias-pull-up;
>  			};
> =20
> +			/omit-if-no-ref/
> +			pwm0_pin: pwm0-pin {
> +				pins =3D "PB4";
> +				function =3D "pwm0";
> +			};
> +
> +			/omit-if-no-ref/
> +			pwm1_pin: pwm1-pin {
> +				pins =3D "PB5";
> +				function =3D "pwm1";
> +			};
> +
>  			spi0_pins: spi0-pins {
>  				pins =3D "PC0", "PC1", "PC2", "PC3";
>  				function =3D "spi0";
>=20




