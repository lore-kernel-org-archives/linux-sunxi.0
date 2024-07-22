Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9D828E7
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 05:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721624479; cv=none; b=kz61G/cvYrVsfzIIfZTDJah+RaCD86urPFBQu345cbVujyvBTaraiI9WHgIS/Z5tTnDAm4u9pl7UNU6PGexjKVMbfDg829bL73SRX2tdYfk+L/EfkFPs/ELyUOpnDcryxj5Ysxb7q7wZLrgiO8aB9CACyYI2EqSRADYCM06I/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721624479; c=relaxed/simple;
	bh=sddsde6IU7VujNwf1wY+ARhIj6J6QyHgZE7VsppWB2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkQP9ycH2NstDK9PvFdNn/H++w5g895Ii2UDx2Wg/hOZEwUP+pAGm3Bxd4cKagrkF+exquuF9p0kEooT21N99e9pT2PFlViCKRbILdKokcNYSsOQ3DYprj2SbtBDgIUvi1rFiPsTlPe75eDKYs0iowvEvrn2nLMbcU3FGCgk7ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CA1sqE+C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CA1sqE+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2314C116B1
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 05:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721624479;
	bh=sddsde6IU7VujNwf1wY+ARhIj6J6QyHgZE7VsppWB2M=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=CA1sqE+C7xA9KPwnBDPNT3YaYcCcEhBCkDam+tT7QgfrybswWzos8/nrSffEhGl7M
	 DCiSrtKybylq+IQdeXDnoqKMmYyG6/4OUI8ZlV3WzeMYICimhryOQqXC/629HgkzML
	 BxNgIiqj1hipFSowbviwmEy+RV9I3s5smPhRw9khl1a8ianbiKAa7Blogx9aaprCjI
	 YkkdfqI+RfFJj1S91hDAIia6unU783e30lqH4kjK3FtV4rG5vATHQYLZc7yywmxI+K
	 ZfljFymWpnFR7rEUvY8xkx3zaamYrgwUR3ldzbhTBvW7S2+CB8qG0vy6V79XEGjjGq
	 3ry/R0AcplbAw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eeb1051360so38909231fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jul 2024 22:01:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YwEkOFSbFmVZvEN7+RAzmcY2TNjxfrc1EL83qKMLY4xeAr9DgUh
	J62LAz80O/kXW4VQD+dzEDG1PkB+RxcNXKJy3oCji6OyztBmQ+CnIz6KgE3BmpVlqruLmuO1yri
	la+foEYGfqwXZXGoKFDWxNeIU+nE=
X-Google-Smtp-Source: AGHT+IGVd4/rzZOAHUEZ1s+YbzxfaEfc/bxI8iDfRi7X+ojPQmbf7S4m2JTqpK3mdzNOcVPFjI+nZoHA2MA2vYVr37Q=
X-Received: by 2002:a05:651c:1a0c:b0:2ef:2dac:9078 with SMTP id
 38308e7fff4ca-2ef2dac92e3mr21027081fa.16.1721624477223; Sun, 21 Jul 2024
 22:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <michel.promonet@free.fr> <20240721174832.11916-1-michel.promonet@free.fr>
In-Reply-To: <20240721174832.11916-1-michel.promonet@free.fr>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 22 Jul 2024 13:01:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ANoSb==Ni4XYf7nrD-ktZLJejc2JfQ8+JE2eOqvjG8Q@mail.gmail.com>
Message-ID: <CAGb2v64ANoSb==Ni4XYf7nrD-ktZLJejc2JfQ8+JE2eOqvjG8Q@mail.gmail.com>
Subject: Re: [PATCH] sunxi: add csi video support for nanopi-neo-air
To: Michel Promonet <michel.promonet@free.fr>
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 1:49=E2=80=AFAM Michel Promonet <michel.promonet@fr=
ee.fr> wrote:

This is an attached module, not directly on the board. As such we won't
accept the change to the board dts.

Also, this is not the correct format for a patch. This needs a proper commi=
t
message, and your Signed-off-by.

See Documentation/process/submitting-patches.rst.


ChenYu

> ---
>  .../dts/allwinner/sun8i-h3-nanopi-neo-air.dts | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts b/ar=
ch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
> index 6d85370e04f1..bab171e1d449 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
> @@ -77,6 +77,39 @@ wifi_pwrseq: pwrseq {
>                 compatible =3D "mmc-pwrseq-simple";
>                 reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
>         };
> +
> +        cam_xclk: cam-xclk {
> +                #clock-cells =3D <0>;
> +                compatible =3D "fixed-clock";
> +                clock-frequency =3D <24000000>;
> +                clock-output-names =3D "cam-xclk";
> +        };
> +
> +        reg_cam_avdd: cam-avdd {
> +                compatible =3D "regulator-fixed";
> +                regulator-name =3D "cam-avdd";
> +                regulator-min-microvolt =3D <2800000>;
> +                regulator-max-microvolt =3D <2800000>;
> +                vin-supply =3D <&reg_vcc3v3>;
> +        };
> +
> +        reg_cam_dovdd: cam-dovdd {
> +                compatible =3D "regulator-fixed";
> +                regulator-name =3D "cam-dovdd";
> +                regulator-min-microvolt =3D <1800000>;
> +                regulator-max-microvolt =3D <1800000>;
> +                vin-supply =3D <&reg_vcc3v3>;
> +        };
> +
> +        reg_cam_dvdd: cam-dvdd {
> +                compatible =3D "regulator-fixed";
> +                regulator-name =3D "cam-dvdd";
> +                regulator-min-microvolt =3D <1500000>;
> +                regulator-max-microvolt =3D <1500000>;
> +                vin-supply =3D <&reg_vcc3v3>;
> +        };
> +
> +
>  };
>
>  &mmc0 {
> @@ -141,3 +174,55 @@ &usbphy {
>         /* USB VBUS is always on */
>         status =3D "okay";
>  };
> +
> +&csi {
> +    status =3D "okay";
> +
> +    port {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        /* Parallel bus endpoint */
> +        csi_from_ov5640: endpoint {
> +            remote-endpoint =3D <&ov5640_to_csi>;
> +            bus-width =3D <8>;
> +            data-shift =3D <2>;
> +            hsync-active =3D <1>; /* Active high */
> +            vsync-active =3D <0>; /* Active low */
> +            data-active =3D <1>;  /* Active high */
> +            pclk-sample =3D <1>;  /* Rising */
> +        };
> +    };
> +};
> +
> +&i2c2 {
> +   status =3D "okay";
> +
> +   ov5640: camera@3c {
> +        compatible =3D "ovti,ov5640";
> +        reg =3D <0x3c>;
> +        clocks =3D <&cam_xclk>;
> +        clock-names =3D "xclk";
> +
> +        reset-gpios =3D <&pio 4 14 GPIO_ACTIVE_LOW>;
> +        powerdown-gpios =3D <&pio 4 15 GPIO_ACTIVE_HIGH>;
> +        AVDD-supply =3D <&reg_cam_avdd>;
> +        DOVDD-supply =3D <&reg_cam_dovdd>;
> +        DVDD-supply =3D <&reg_cam_dvdd>;
> +
> +        port {
> +            ov5640_to_csi: endpoint {
> +                remote-endpoint =3D <&csi_from_ov5640>;
> +                bus-width =3D <8>;
> +                data-shift =3D <2>;
> +                hsync-active =3D <1>; /* Active high */
> +                vsync-active =3D <0>; /* Active low */
> +                data-active =3D <1>;  /* Active high */
> +                pclk-sample =3D <1>;  /* Rising */
> +            };
> +        };
> +    };
> +};
> +&i2c2_pins {
> +   bias-pull-up;
> +};
> --
> 2.43.0
>
>
