Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9102C21A17
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 19:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfCZDLnL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3232be274a0so2368068f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 12:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697224904; x=1697829704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxJuvqrlrMiNG1ulmdPZtrlk8o7WsHfPxtKGTiZjzss=;
        b=EfCZDLnLf437GBknPveGk+dQNwYB8Kr6EH1IwRN7q9VmvF8baLSphH807mWQjaA1bS
         5ua2MU+4ncEX0m6PGX+ha5smvb0/yWBELtOZkJabbLq5HTGonp3zc7xyNMTRmEKsqK4A
         FmKG7DUuwrdH0g/kUBMRWaMQRK7kX/Rv7wm1pD1Gkk4yRxmgAOuLmtL85oCAtSyxoQUD
         h1yhNuL4iY8NAGK9Go2yU8oJUKPlEvt2L2PcMEhci4tpJBi0dz9QJS9BIiOuu9bwfFzC
         AgQYdbwTzk19zM/NIMwPJFTyFeEw4wJ7GIwReMY8giHYuNlbYUrlFnC24pxmpoW8CIoT
         8EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697224904; x=1697829704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxJuvqrlrMiNG1ulmdPZtrlk8o7WsHfPxtKGTiZjzss=;
        b=RCIufe3gEwMuPoxQ7J4r/yXJZuuJ/T8wwPJsy1bM3cw73QapSIzgMpkjEnpXLPUGVU
         UkipfeB0bJ+eM1He695HSv1A314ziWmfR/R/KsEMWokL4WgR8k+gu7c2X7Y2ApPwSjc+
         zc/6MFgZDk51lz6qHJy0aagZp2KAlNT7Cw/PR5D66v4VOn0m8DE5QQV1IIlRv0tUWrqY
         Dat91Y4L2pXTZDaDqw6XQpvLqz3HTogXgMwTdaXmTH4l3J0eeChyNnyUi89GonaPfyS4
         UGw07LRatRog20NLBUJDcmCn+cHbiTadx1CnLIhzIBUQ2VmE0k3DcO8orzqRDEgDtcqX
         nr6Q==
X-Gm-Message-State: AOJu0YxkZzwXPggrEwestVjADsjjKAjfQ0SJ94pfZTUG4e/F3Y4jLyJW
	2MqMuhvPmGBckf+pU3/zTAo=
X-Google-Smtp-Source: AGHT+IELDlyPz7gN5vyh6szAavsAMEHQMOCMaIDGJwmShMWPYZa5uXJZDWsPkLOjZ0lf9lhi98Ixag==
X-Received: by 2002:adf:b353:0:b0:317:6734:c2ae with SMTP id k19-20020adfb353000000b003176734c2aemr905155wrd.11.1697224903581;
        Fri, 13 Oct 2023 12:21:43 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id o9-20020a5d4749000000b0032d9523de65sm4071755wrs.48.2023.10.13.12.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:21:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: conor@kernel.org, Julian Ribbeck <julian.ribbeck@gmx.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, julian.ribbeck@gmx.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, robh+dt@kernel.org, samuel@sholland.org,
 wens@csie.org
Subject: Re: [PATCH v4 1/2] ARM: dts: sun7i: Add Iteaduino Plus A20
Date: Fri, 13 Oct 2023 21:21:42 +0200
Message-ID: <22045443.EfDdHjke4D@jernej-laptop>
In-Reply-To: <2242644.iZASKD2KPV@jernej-laptop>
References:
 <20230929-given-making-f3fac6afb176@spud>
 <20231006090154.9289-1-julian.ribbeck@gmx.de>
 <2242644.iZASKD2KPV@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne petek, 13. oktober 2023 ob 21:18:00 CEST je Jernej =C5=A0krabec napisal=
(a):
> Dne petek, 06. oktober 2023 ob 11:01:30 CEST je Julian Ribbeck napisal(a):
> > Iteaduino Plus A20 is very similar to Iteaduino Plus A10. In fact it
> > shares the same breakout board and the Itead Core A20 on top of it, is
> > only adapted to support the dual-core A20.
> >=20
> > This commits enables the following hardware:
> >=20
> > * HDMI Video output
> > * USB
> > * SATA (untested due to lack of hardware I could attach)
> > * Ethernet
> > * MMC storage
> > * UART
> > * USB OTG (untested, because I don't own an USB OTG cable/device)
> >=20
> > Signed-off-by: Julian Ribbeck <julian.ribbeck@gmx.de>
> > ---
> >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> >  .../sun7i-a20-itead-iteaduino-plus.dts        | 104 ++++++++++++++++++
> >  2 files changed, 105 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/allwinner/sun7i-a20-itead-iteadui=
no-plus.dts
> >=20
> > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/a=
llwinner/Makefile
> > index eebb5a0c873a..39af5ad94590 100644
> > --- a/arch/arm/boot/dts/allwinner/Makefile
> > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > @@ -124,6 +124,7 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
> >  	sun7i-a20-haoyu-marsboard.dtb \
> >  	sun7i-a20-hummingbird.dtb \
> >  	sun7i-a20-itead-ibox.dtb \
> > +	sun7i-a20-itead-iteaduino-plus.dts \
>=20
> This should be .dtb.
>=20
> Other than that:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> I'll fix it while applying.
>=20
> For future reference, please follow proper patch submission procedure:
> - each revision should be sent in separate thread
> - each new revision should contain changelog, either in cover letter (when
> there is more than one patch) or below --- line in each patch
> - compatible description patch comes before first usage (I'll invert order
> when applying)

Sorry, I won't apply it as yet. How was this tested if it didn't even built=
 due
to mistake in Makefile?

Best regards,
Jernej

>=20
> Best regards,
> Jernej
>=20
> >  	sun7i-a20-i12-tvbox.dtb \
> >  	sun7i-a20-icnova-a20-adb4006.dtb \
> >  	sun7i-a20-icnova-swac.dtb \
> > diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-itead-iteaduino-plus=
=2Edts b/arch/arm/boot/dts/allwinner/sun7i-a20-itead-iteaduino-plus.dts
> > new file mode 100644
> > index 000000000000..c9f9b0275381
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-itead-iteaduino-plus.dts
> > @@ -0,0 +1,104 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +
> > +/dts-v1/;
> > +#include "sun7i-a20.dtsi"
> > +#include "sunxi-itead-core-common.dtsi"
> > +
> > +/ {
> > +	model =3D "Itead Iteaduino Plus A20";
> > +	compatible =3D "itead,iteaduino-plus-a20", "allwinner,sun7i-a20";
> > +
> > +	hdmi-connector {
> > +		compatible =3D "hdmi-connector";
> > +		type =3D "a";
> > +
> > +		port {
> > +			hdmi_con_in: endpoint {
> > +				remote-endpoint =3D <&hdmi_out_con>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&ac_power_supply {
> > +	status =3D "okay";
> > +};
> > +
> > +&ahci {
> > +	target-supply =3D <&reg_ahci_5v>;
> > +	status =3D "okay";
> > +};
> > +
> > +&axp209 {
> > +	interrupt-parent =3D <&nmi_intc>;
> > +	interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> > +};
> > +
> > +&battery_power_supply {
> > +	status =3D "okay";
> > +};
> > +
> > +&codec {
> > +	stauts =3D "okay";
> > +};
> > +
> > +&de {
> > +	status =3D "okay";
> > +};
> > +
> > +&emac {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&emac_pa_pins>;
> > +	phy-handle =3D <&phy1>;
> > +	status =3D "okay";
> > +};
> > +
> > +&emac_sram {
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi {
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi_out {
> > +	hdmi_out_con: endpoint {
> > +		remote-endpoint =3D <&hdmi_con_in>;
> > +	};
> > +};
> > +
> > +&mdio {
> > +	status =3D "okay";
> > +
> > +	phy1: ethernet-phy@1 {
> > +		reg =3D <1>;
> > +	};
> > +};
> > +
> > +&mmc0 {
> > +	vmmc-supply =3D <&reg_vcc3v3>;
> > +	bus-width =3D <4>;
> > +	cd-gpios =3D <&pio 7 1 GPIO_ACTIVE_LOW>; /* PH1 */
> > +	status =3D "okay";
> > +};
> > +
> > +&otg_sram {
> > +	status =3D "okay";
> > +};
> > +
> > +&reg_ahci_5v {
> > +	status =3D "okay";
> > +};
> > +
> > +&reg_usb0_vbus {
> > +	status =3D "okay";
> > +};
> > +
> > +&usb_otg {
> > +	status =3D "okay";
> > +	dr_mode =3D "host";
> > +};
> > +
> > +&usbphy {
> > +	usb0_vbus-supply =3D <&reg_usb0_vbus>;
> > +};
> > --
> > 2.42.0
> >=20
> >=20
>=20
>=20
>=20
>=20
>=20




