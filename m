Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C13D39FFE
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Sep 2024 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461185; cv=none; b=f3okR2tymYY80UE76yJtPINn9cwTb7DtJtTCiDTcpdCZ5Faw+5iShm09tHeRO5c0QRXpGijiE7Fj2a2/ULCc91QwLiMdXuhPBXVqU9xXxxgUFGUx/pqvr00LaWWdqyLpvuY2ds2Eph73WLievohNHpNohgD4+tujU3fP1zmFnTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461185; c=relaxed/simple;
	bh=ejmddjJBp/VN3a1tR67jUIYLmC/HDRY7n6DCwVqTJ9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JymzbUQO7YWwv0eq8agqXWOzjh+wy3gB0UzPkqbo4p1ymrOyOKcXjKV5zEFDE1MCS+eRq09/LRXmVbo9yDAFJe1IN3L9OXHM5kIDlU0VqA0qC8BEord1Xa2bLk7B2uaov8SzLu7HgTkq49jnu+aC1Z1D+Ebm3c9tUpSTzY1sdA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LinGMG40; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LinGMG40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB28FC4CEC2
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Sep 2024 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725461184;
	bh=ejmddjJBp/VN3a1tR67jUIYLmC/HDRY7n6DCwVqTJ9U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=LinGMG40Wz9H7GclfqZAkkozmWfM8+mLDyDG8aT30sVrb07fewPyhrZomXl1ul7o4
	 mWlFC/t65f4uaWBX/BqPuRolyp/MEFG4wwIp9e5dJ74RC0ADwgG9+RNCI40wjaVK1K
	 7v2DMDh7Dkk5IMFEhub5aaVNybcIHFgqkR7cuZ7xQw/LWDpb4MLDr341QYiay1JDzS
	 iTjtCYV/DPO9iLLUtGOdm5McLNROWU2nVxQVcxJyrB+sTDCFKbwwvwKqpCNsUVTGJj
	 EjzrY5DqsBWY649He1EPVzeuU0duNS1qNIRQC9t1wJbkvaWDViYPROlo4xXvF+nb/6
	 +OYVdv9YpcLPw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f409c87b07so85484271fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 07:46:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YznyAXcxoM+skoKTvzeq1S+hS0Fa+Itx3EOJl4YzUbzKMq05XY8
	PL1A2gp0Ry+tyqzI+yC3yhpowOOikJUTeq/S+MMnwyTGnqpUXLkQIBU/kR+RCKorX2RSXqnx03H
	uD6R/LkUlwFBF0m3zKAYRnx14aaM=
X-Google-Smtp-Source: AGHT+IEW8WFbL0pX3yjDwukWxykbb7IowS8YXEVF0VRA2zL/HVjJnhcTedLn3MqmJ5F711AqmJRLyCk5HbwyeOqnQvc=
X-Received: by 2002:a2e:be21:0:b0:2f3:af4b:224 with SMTP id
 38308e7fff4ca-2f6265504cemr110492871fa.8.1725461183244; Wed, 04 Sep 2024
 07:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGb2v64ANoSb==Ni4XYf7nrD-ktZLJejc2JfQ8+JE2eOqvjG8Q@mail.gmail.com>
 <1952918170.10546380.1721681718378.JavaMail.root@zimbra21-e3.priv.proxad.net>
In-Reply-To: <1952918170.10546380.1721681718378.JavaMail.root@zimbra21-e3.priv.proxad.net>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 4 Sep 2024 22:46:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v665-z58XuVZ2rtQvDiCXZfF1BVuF1XLUiOOafsy5r__fQ@mail.gmail.com>
Message-ID: <CAGb2v665-z58XuVZ2rtQvDiCXZfF1BVuF1XLUiOOafsy5r__fQ@mail.gmail.com>
Subject: Re: [PATCH] sunxi: add csi video support for nanopi-neo-air
To: michel.promonet@free.fr
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 4:55=E2=80=AFAM <michel.promonet@free.fr> wrote:
>
> Hi ChenYu,
>
> Thanks for your feedback.
> As the documentation of nanopi neo air seems to only describe CAM500A/CAM=
500B using ov5640, I was wondering this was acceptable.

It could be the user has no camera module installed. Or they could have
found or made a pin compatible one. So we should not make the decision
for the user.

ChenYu

> Best Regards,
> Michel.
>
> ----- Mail original -----
> De: "Chen-Yu Tsai" <wens@kernel.org>
> =C3=80: "Michel Promonet" <michel.promonet@free.fr>
> Cc: linux-sunxi@lists.linux.dev
> Envoy=C3=A9: Lundi 22 Juillet 2024 07:01:04
> Objet: Re: [PATCH] sunxi: add csi video support for nanopi-neo-air
>
> On Mon, Jul 22, 2024 at 1:49=E2=80=AFAM Michel Promonet <michel.promonet@=
free.fr> wrote:
>
> This is an attached module, not directly on the board. As such we won't
> accept the change to the board dts.
>
> Also, this is not the correct format for a patch. This needs a proper com=
mit
> message, and your Signed-off-by.
>
> See Documentation/process/submitting-patches.rst.
>
>
> ChenYu
>
> > ---
> >  .../dts/allwinner/sun8i-h3-nanopi-neo-air.dts | 85 +++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts b/=
arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
> > index 6d85370e04f1..bab171e1d449 100644
> > --- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
> > @@ -77,6 +77,39 @@ wifi_pwrseq: pwrseq {
> >                 compatible =3D "mmc-pwrseq-simple";
> >                 reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
> >         };
> > +
> > +        cam_xclk: cam-xclk {
> > +                #clock-cells =3D <0>;
> > +                compatible =3D "fixed-clock";
> > +                clock-frequency =3D <24000000>;
> > +                clock-output-names =3D "cam-xclk";
> > +        };
> > +
> > +        reg_cam_avdd: cam-avdd {
> > +                compatible =3D "regulator-fixed";
> > +                regulator-name =3D "cam-avdd";
> > +                regulator-min-microvolt =3D <2800000>;
> > +                regulator-max-microvolt =3D <2800000>;
> > +                vin-supply =3D <&reg_vcc3v3>;
> > +        };
> > +
> > +        reg_cam_dovdd: cam-dovdd {
> > +                compatible =3D "regulator-fixed";
> > +                regulator-name =3D "cam-dovdd";
> > +                regulator-min-microvolt =3D <1800000>;
> > +                regulator-max-microvolt =3D <1800000>;
> > +                vin-supply =3D <&reg_vcc3v3>;
> > +        };
> > +
> > +        reg_cam_dvdd: cam-dvdd {
> > +                compatible =3D "regulator-fixed";
> > +                regulator-name =3D "cam-dvdd";
> > +                regulator-min-microvolt =3D <1500000>;
> > +                regulator-max-microvolt =3D <1500000>;
> > +                vin-supply =3D <&reg_vcc3v3>;
> > +        };
> > +
> > +
> >  };
> >
> >  &mmc0 {
> > @@ -141,3 +174,55 @@ &usbphy {
> >         /* USB VBUS is always on */
> >         status =3D "okay";
> >  };
> > +
> > +&csi {
> > +    status =3D "okay";
> > +
> > +    port {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        /* Parallel bus endpoint */
> > +        csi_from_ov5640: endpoint {
> > +            remote-endpoint =3D <&ov5640_to_csi>;
> > +            bus-width =3D <8>;
> > +            data-shift =3D <2>;
> > +            hsync-active =3D <1>; /* Active high */
> > +            vsync-active =3D <0>; /* Active low */
> > +            data-active =3D <1>;  /* Active high */
> > +            pclk-sample =3D <1>;  /* Rising */
> > +        };
> > +    };
> > +};
> > +
> > +&i2c2 {
> > +   status =3D "okay";
> > +
> > +   ov5640: camera@3c {
> > +        compatible =3D "ovti,ov5640";
> > +        reg =3D <0x3c>;
> > +        clocks =3D <&cam_xclk>;
> > +        clock-names =3D "xclk";
> > +
> > +        reset-gpios =3D <&pio 4 14 GPIO_ACTIVE_LOW>;
> > +        powerdown-gpios =3D <&pio 4 15 GPIO_ACTIVE_HIGH>;
> > +        AVDD-supply =3D <&reg_cam_avdd>;
> > +        DOVDD-supply =3D <&reg_cam_dovdd>;
> > +        DVDD-supply =3D <&reg_cam_dvdd>;
> > +
> > +        port {
> > +            ov5640_to_csi: endpoint {
> > +                remote-endpoint =3D <&csi_from_ov5640>;
> > +                bus-width =3D <8>;
> > +                data-shift =3D <2>;
> > +                hsync-active =3D <1>; /* Active high */
> > +                vsync-active =3D <0>; /* Active low */
> > +                data-active =3D <1>;  /* Active high */
> > +                pclk-sample =3D <1>;  /* Rising */
> > +            };
> > +        };
> > +    };
> > +};
> > +&i2c2_pins {
> > +   bias-pull-up;
> > +};
> > --
> > 2.43.0
> >
> >
