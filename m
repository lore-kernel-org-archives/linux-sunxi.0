Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D637E54E
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4H++3WC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-336445a2749so275852f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 12:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702499194; x=1703103994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGV9ovWt1T0TxLyTUNl8lJVAhcl8IWinEHZFMqlV8R0=;
        b=L4H++3WCWCnyjSWBdarj2N6JNz+Ahg4ka9X3isN1mZWyiRsZ3QtV0yU97OfzAHmLoz
         zNicUn/xaeSgRK2fv9/2vioONQiseZbU+tulMRi1mOocDdU78UPyMTw+I/w/5rX1JqD/
         XLKaW0RyvcuUxBPGfF4/DfQAVKy3aURoaQvD235GLJjflbD8F4OYjxBM7hREibxuc7V/
         xObnOkDwRSkXlJ3q4a6kNuk2CTZRvc8h3o3448jooAnNxbgC6RHUzgxYhotih0cswhSm
         JXwXI33rTJRwCJbCQqXYz7V828ULvZZ8Vrz0DyfHtuGIOlc7XgUnSOA9v/d3//fYFxp5
         ltng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499194; x=1703103994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGV9ovWt1T0TxLyTUNl8lJVAhcl8IWinEHZFMqlV8R0=;
        b=UJJQcaT9HmnvWzB1bHCgB7/rwfkYZP0xzDI/IKWbbzeq1Ny+qzu7MxYZVjKNzJ0yAq
         2rG51fPUJItR11bh/VmS++62bdLSV2snEJWk3MAa4956aUElZSEpmdVzegOyEFLqvH2Z
         7raPRWisBypiFKYZHLLQApt3RXWjpu3mz57eRzRgmSckX6AzrEzbB3LzIWBuK7mfUMSa
         w7A7csGrMo/hMNkWgIqzUvINqifsIKae6kNKnIZahRm4QPrdCDlqYxa27zCY7aw4wAZB
         QlOHS2PLNAJHe8WWon5TNjUYPJ33uZ+rBc3Tp24foZTJ37UT3nqVQ+x5aiBiubuLka2I
         x0sg==
X-Gm-Message-State: AOJu0YxU7MroTFhpWBJs0oCtRrx18uFP/SaaArOCAFti29nMoV3B/fLN
	mgizXADPQ9Zm5NJfabS40Gg=
X-Google-Smtp-Source: AGHT+IGCl2qoP1T/NnW43knX1fCbT4M6OGvmsXKs/O9+AOQvHcSiKP9r2rbiyLldtzfSqmLZwS+qiA==
X-Received: by 2002:a05:6000:194f:b0:332:ce52:6388 with SMTP id e15-20020a056000194f00b00332ce526388mr4258017wry.14.1702499194241;
        Wed, 13 Dec 2023 12:26:34 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id m11-20020a056000008b00b0033332524235sm14110534wrx.82.2023.12.13.12.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:26:33 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject:
 Re: [PATCH v7 7/7] ARM: dts: sun8i-a83t: Add BananaPi M3 OV8865 camera
 overlay
Date: Wed, 13 Dec 2023 21:26:32 +0100
Message-ID: <3780932.kQq0lBPeGt@archlinux>
In-Reply-To: <20231122141426.329694-8-paul.kocialkowski@bootlin.com>
References:
 <20231122141426.329694-1-paul.kocialkowski@bootlin.com>
 <20231122141426.329694-8-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Paul,

same comments as for patch 6.

Best regards,
Jernej

On Wednesday, November 22, 2023 3:14:25 PM CET Paul Kocialkowski wrote:
> Add an overlay supporting the OV8865 from the BananaPi Camera v3
> peripheral board. The board has two sensors (OV5640 and OV8865)
> which cannot be supported in parallel as they share the same reset
> pin and the kernel currently has no support for this case.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../sun8i-a83t-bananapi-m3-camera-ov8865.dtso | 109 ++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-ca=
mera-ov8865.dtso
>=20
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index a0a9aa6595e4..980ac88634e3 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -278,6 +278,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a83t-allwinner-h8homlet-v2.dtb \
>  	sun8i-a83t-bananapi-m3.dtb \
>  	sun8i-a83t-bananapi-m3-camera-ov5640.dtbo \
> +	sun8i-a83t-bananapi-m3-camera-ov8865.dtbo \
>  	sun8i-a83t-cubietruck-plus.dtb \
>  	sun8i-a83t-tbs-a711.dtb \
>  	sun8i-h2-plus-bananapi-m2-zero.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov=
8865.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov886=
5.dtso
> new file mode 100644
> index 000000000000..0656ee8d4bfe
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dt=
so
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0 OR X11
> +/*
> + * Copyright 2022 Bootlin
> + * Author: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/sun8i-a83t-ccu.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	/*
> +	 * These regulators actually have DLDO4 tied to their EN pin, which is
> +	 * described as input supply here for lack of a better representation.
> +	 * Their actual supply is PS, which is always-on.
> +	 */
> +
> +	ov8865_avdd: ov8865-avdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-avdd";
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +
> +	ov8865_dovdd: ov8865-dovdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-dovdd";
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +
> +	ov8865_dvdd: ov8865-dvdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-dvdd";
> +		regulator-min-microvolt =3D <1200000>;
> +		regulator-max-microvolt =3D <1200000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +};
> +
> +&ccu {
> +	assigned-clocks =3D <&ccu CLK_CSI_MCLK>;
> +	assigned-clock-parents =3D <&osc24M>;
> +	assigned-clock-rates =3D <24000000>;
> +};
> +
> +&csi {
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c2_pe_pins>;
> +	status =3D "okay";
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	ov8865: camera@36 {
> +		compatible =3D "ovti,ov8865";
> +		reg =3D <0x36>;
> +
> +		clocks =3D <&ccu CLK_CSI_MCLK>;
> +		assigned-clocks =3D <&ccu CLK_CSI_MCLK>;
> +		assigned-clock-parents =3D <&osc24M>;
> +		assigned-clock-rates =3D <24000000>;
> +
> +		avdd-supply =3D <&ov8865_avdd>;
> +		dovdd-supply =3D <&ov8865_dovdd>;
> +		dvdd-supply =3D <&ov8865_dvdd>;
> +
> +		powerdown-gpios =3D <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
> +		reset-gpios =3D <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +
> +		port {
> +			ov8865_out_mipi_csi2: endpoint {
> +				remote-endpoint =3D <&mipi_csi2_in_ov8865>;
> +				link-frequencies =3D /bits/ 64 <360000000>;
> +				data-lanes =3D <1 2 3 4>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi2 {
> +	status =3D "okay";
> +};
> +
> +&mipi_csi2_in {
> +	mipi_csi2_in_ov8865: endpoint {
> +		remote-endpoint =3D <&ov8865_out_mipi_csi2>;
> +		data-lanes =3D <1 2 3 4>;
> +	};
> +};
> +
> +&pio {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&csi_mclk_pin>;
> +};
> +
> +&reg_dldo4 {
> +	regulator-min-microvolt =3D <2800000>;
> +	regulator-max-microvolt =3D <2800000>;
> +};
>=20




