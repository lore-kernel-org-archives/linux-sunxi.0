Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC97E2FAF
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 19:25:07 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id m12so41445398eja.2
        for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 12:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vdjAwHav9XHkb4OJTI/S/82n2MEHOGNSzd+9Q7MwBlI=;
        b=VJTyhp3yPi6WTFmkeb7a0Q1W9ISu0fgTvI5N9deWIgpATsg/N6NO69OeO7GRKxt1ch
         dmyAGpCDTB5+Zk6s7ITyrmG6Yf7Nhd+qxB16TcPIhCGPQWqvSz/Ijzx+bucXrtk/jgCo
         MXdSXzp876UaR+Dh6XwLtqpqAtq7AhtD4ZYb7KYdkWqJnIehLsrQ8kAYgJMOCfcdSzZ9
         pAp575NilIjAArMK0micLRvkpm8HTsIEKTcbs+16eiPsnGJzXzkfNJ/w3T3e/d1JTIEx
         cCWfGu0YKTd6sCqm4bEAMJYieHtRayKRNU7en0HVzVp5xcepNsnyRp3tAUrg4NScwH/S
         JiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vdjAwHav9XHkb4OJTI/S/82n2MEHOGNSzd+9Q7MwBlI=;
        b=aqo3agRH2F3Y+NCC0KuJHUtb8W9/oWUA24RDZPUEp7LNyvfinq+IsV2Wx+pS2INpCO
         +UxRPgccCnvgmlUDwYbjUgaYtgMu7RUz8gYRslZkxCMHUoTMZqynAI4bGFo4ECdy6Uu5
         eshhHgBP4KPK5DqVayb2Lr4oRJsLL7EIwaYCUg/QWxi/QcABzFB/nLzKMNPBp93b8q8p
         znNK89Efac5wjpSxwmdQPsKkZusGu+TBAqXF/DRGKYHj5PYjtOd6nd8UE5XDlcaCFH+l
         K02hy4f7APzlgejG4mSguNWvcSA70IjwN4f9NpeJBDvPzK6lYtq+Q2BsB/86TSTqJ/hc
         KSEQ==
X-Gm-Message-State: AOAM530clQCLZKj0TFBTEuFMqs7fsP2pLnNdfl0B3xYv8S59nxwFncEf
	0WQlVxPxZocyr/qDw6PinBI=
X-Google-Smtp-Source: ABdhPJx985AJNAIN12coIvRDsCCnCxb11Q2pIexJUFbevqajxiLAKNiXVG2c+BCNswJEgCbZbXu9EA==
X-Received: by 2002:a17:906:f894:: with SMTP id lg20mr7994685ejb.355.1620933906272;
        Thu, 13 May 2021 12:25:06 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id ch30sm2916975edb.92.2021.05.13.12.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 12:25:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Tobias Schramm <t.schramm@manjaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Tobias Schramm <t.schramm@manjaro.org>
Subject: Re: [PATCH 4/4] ARM: dts: sun8i: V3: add I2S interface to V3 dts
Date: Thu, 13 May 2021 21:25:04 +0200
Message-ID: <2916483.liAivg88ip@kista>
In-Reply-To: <20210513190949.2069235-5-t.schramm@manjaro.org>
References: <20210513190949.2069235-1-t.schramm@manjaro.org> <20210513190949.2069235-5-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 13. maj 2021 ob 21:09:49 CEST je Tobias Schramm napisal(a=
):
> The Allwinner V3 SoC features an I2S interface. The I2C peripheral is

I2C -> I2S

> identical to that in the Allwinner H3 SoC.
> This commit adds it to the Allwinner V3 dts.
>=20
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  arch/arm/boot/dts/sun8i-v3.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-v3.dtsi b/arch/arm/boot/dts/sun8i-
v3.dtsi
> index c279e13583ba..0061c49523f2 100644
> --- a/arch/arm/boot/dts/sun8i-v3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3.dtsi
> @@ -1,10 +1,30 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
>   * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
> + * Copyright (C) 2021 Tobias Schramm <t.schramm@manjaro.org>

It's uncommon to add additional copyrights just for one node, but ok.

>   */
> =20
>  #include "sun8i-v3s.dtsi"
> =20
> +/ {
> +	soc {
> +			i2s0: i2s@1c22000 {
> +				#sound-dai-cells =3D <0>;
> +				compatible =3D "allwinner,sun8i-h3-
i2s";

You have to add v3s compatible as a fallback (and document it in devicetree=
=20
documentation).

Best regards,
Jernej

> +				reg =3D <0x01c22000 0x400>;
> +				interrupts =3D <GIC_SPI 13=20
IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&ccu CLK_BUS_I2S0>,=20
<&ccu CLK_I2S0>;
> +				clock-names =3D "apb", "mod";
> +				dmas =3D <&dma 3>, <&dma 3>;
> +				dma-names =3D "rx", "tx";
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&i2s0_pins>;
> +				resets =3D <&ccu RST_BUS_I2S0>;
> +				status =3D "disabled";
> +			};
> +	};
> +};
> +
>  &ccu {
>  	compatible =3D "allwinner,sun8i-v3-ccu";
>  };
> @@ -25,6 +45,11 @@ external_mdio: mdio@2 {
>  &pio {
>  	compatible =3D "allwinner,sun8i-v3-pinctrl";
> =20
> +	i2s0_pins: i2s0-pins {
> +		pins =3D "PG10", "PG11", "PG12", "PG13";
> +		function =3D "i2s";
> +	};
> +
>  	uart1_pg_pins: uart1-pg-pins {
>  		pins =3D "PG6", "PG7";
>  		function =3D "uart1";
> --=20
> 2.30.1
>=20
>=20
>=20


