Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416941C6A8
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721681733; cv=none; b=qjbO+n9Sn/WBGeuwZOzOoYBryBBMMecZXVaJ3HuiRqgvkL4DBFgccSfT8ezNrgZHuKVBZQjHNiOXZJgaIxoGuln7OBRpOoo4CqV3iXJkLEXNXnCgvRKO1pMR8FcGvlPk1k7lH+W4eLZPxqgMK7OfrFXWKHRBeTX1QbkwOPH7qDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721681733; c=relaxed/simple;
	bh=jsUHexksoByqvy5GER9YIilq8psp5584Ip+Y338o2Gg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=FlibgdIkkfjroamb5o58W8ZNLcRy/suZ4h5jLeYXnHJOGQ0aFE7pW4mBqOyKKk5a7X3n6HuLFSNP/8ZNOmmZxXBIjw8IQhSSSsUsCEb9naGFFPJTw7V+P3ycn6QyViq+03Tm3dBOaDf6Ig/ZywHFSrtwIy/cWn82Ruvte383uHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=nQnj8tkF; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="nQnj8tkF"
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 7904A42D705
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 22:55:26 +0200 (CEST)
Received: from zimbra21-e3.priv.proxad.net (unknown [172.20.243.171])
	by smtp5-g21.free.fr (Postfix) with ESMTP id CF3C960134;
	Mon, 22 Jul 2024 22:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1721681718;
	bh=jsUHexksoByqvy5GER9YIilq8psp5584Ip+Y338o2Gg=;
	h=Date:From:To:Cc:In-Reply-To:Subject:From;
	b=nQnj8tkFSOnsuB4gePxfyr/3QxuXVIiXdeeJe14sVSNpI/6l8dPBNFWUnljwTCINB
	 QvGpxtrPbIgzGgN/g38dwg8bs/5IGa02ofhm23cTGBckEkH1z81aDQzduy/aMAEgyP
	 gOe5mVQtwXMMhWH9GP0iz9oYoUADEp71oQ+XIP4UrM0Qq/SchOw2NbEt3kixGqSVbS
	 Fyy3WA9ko4+MgLO+Rhr4DTf40tE97UV3BRUt/BdAW4guVJ+UkKgZagrJa9manc7LtU
	 wzGRxhLYmb/VX1H0ZzgMBc7I9vMEQa2aHJVSi3hSYATQHLlwmo6px1xg14KJGpVpv7
	 0E3g6sF/m1/6g==
Date: Mon, 22 Jul 2024 22:55:18 +0200 (CEST)
From: michel.promonet@free.fr
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev
Message-ID: <1952918170.10546380.1721681718378.JavaMail.root@zimbra21-e3.priv.proxad.net>
In-Reply-To: <CAGb2v64ANoSb==Ni4XYf7nrD-ktZLJejc2JfQ8+JE2eOqvjG8Q@mail.gmail.com>
Subject: Re: [PATCH] sunxi: add csi video support for nanopi-neo-air
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - GC126 (Win)/7.2.0-GA2598)
X-Authenticated-User: michel.promonet@free.fr

Hi ChenYu,

Thanks for your feedback.
As the documentation of nanopi neo air seems to only describe CAM500A/CAM50=
0B using ov5640, I was wondering this was acceptable.

Best Regards,
Michel.

----- Mail original -----
De: "Chen-Yu Tsai" <wens@kernel.org>
=C3=80: "Michel Promonet" <michel.promonet@free.fr>
Cc: linux-sunxi@lists.linux.dev
Envoy=C3=A9: Lundi 22 Juillet 2024 07:01:04
Objet: Re: [PATCH] sunxi: add csi video support for nanopi-neo-air

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
