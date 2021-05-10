Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597170
	for <linux-sunxi@lists.linux.dev>; Mon, 10 May 2021 15:36:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id l24-20020a7bc4580000b029014ac3b80020so11425711wmi.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 May 2021 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DCpPKQQtVHN6Q0vpt3tKbixt7PhCNgy2etbsKBukc1I=;
        b=ZMkLyMX3rDPOkgqMB9fjeXWZoXQZTa0ifibSohT7pRqUnr5gM6xNdYct19XVX6U5Zh
         0Hmbck/4PR97bWYuag4XHtYdg7G/oYgATi+JiOkZdyzmIj8/B9G1ukqIedDhuf87BPEj
         8r4zm8zSEhVEt/C1xFYk3dR2sIrWsOq6FS7osS37N9f6P6iH2vPyFG3Z/FjlX2a0BYZI
         Kq6lysbfD1zDrc2eO2uBn0zES02brjhsN0J1ebtCz+JHYNu+iBJbXDXZm+FmN/bllgvs
         4XZQIP6bmxf82M7D0In8Os9+fVHQ14xvUGSFqKEJxqr49EmnetuJq43ozlWJHYyKVzc4
         oMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DCpPKQQtVHN6Q0vpt3tKbixt7PhCNgy2etbsKBukc1I=;
        b=q3WgOByudsRfa16QgXSTk9GL/nz0pG8PWluK2dE1wxjY0IQKgsXvM+QFNL9t/uR6jb
         GRcLromoU9vUMa4W6kOfuThyGuw9fl+imNtuNbzol3/vHVj211qhoDBvoN2eu9RUo+xd
         ZqB8o7neG2an3YUkJIB2U4OL4hKq4N5PWA/Yergx9Y581yHM/CVvXc094+Hvk/7eOlwB
         0jXh6TXIFJlbZiKg+76EbmTsTXvv28FC4WDtXhtZbTnSdH19CWBLa70F1v0be/rV7fgQ
         58PQexKtKRLArl71KrpP2kmY/jRZ7uf9U20qHoQQ/xXrb2pFf0GQUyPGs6oJ1H4AEzU/
         7xHQ==
X-Gm-Message-State: AOAM533LRL0WM0iWptfkLDP5pNn+fYkGYqy1/StwiZq5IrrxI3O9yST1
	5J+CBN20oBa1Svj1ResKkY5Jess8yPJdUw==
X-Google-Smtp-Source: ABdhPJzSMGmiZQyruI0eV3oQIEAih/1uVxrR2C0KRp8YEToZyRG5D/Phewxe6KUT38eW7WN+QRa11w==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr27225340wmj.46.1620660967515;
        Mon, 10 May 2021 08:36:07 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id l14sm24202080wrv.94.2021.05.10.08.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:36:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Corentin Labbe <clabbe@baylibre.com>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] arm64: dts: allwinner: Pine H64: Enable USB 3.0 port
Date: Mon, 10 May 2021 17:36:05 +0200
Message-ID: <5404798.YEtBip1y79@kista>
In-Reply-To: <2288435.7XXmsQVVxE@kista>
References: <20210510130119.6534-1-andre.przywara@arm.com> <2288435.7XXmsQVVxE@kista>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 10. maj 2021 ob 17:30:44 CEST je Jernej =C5=A0krabec napisa=
l(a):
> Hi Andre!
>=20
> Dne ponedeljek, 10. maj 2021 ob 15:01:19 CEST je Andre Przywara napisal(a=
):
> > The Pine H64 board features an USB 3.0 type A port, which works just
> > fine.
> >=20
> > Enable the controller and USB PHY in the .dts to make it usable.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arc=
h/
> arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> > index 1ffd68f43f87..9061c9913f4c 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> > @@ -89,6 +89,10 @@
> >  	status =3D "okay";
> >  };
> > =20
> > +&dwc3 {
> > +	status =3D "okay";
> > +};
> > +
> >  &ehci0 {
> >  	status =3D "okay";
> >  };
> > @@ -332,3 +336,8 @@
> >  	usb3_vbus-supply =3D <&reg_usb_vbus>;
> >  	status =3D "okay";
> >  };
> > +
> > +&usb3phy {
> > +	phy-supply =3D <&reg_usb_vbus>;
> > +	status =3D "okay";
> > +};
> > --=20
> > 2.17.5
> >=20
>=20
> Exactly the same patch was already proposed by Icenowy. In short, PHY is=
=20
> powered by internal power and doesn't need phy-supply property. It's=20
connector=20
> that needs power supply. One of her latest attempts can be found here:=20
> https://lore.kernel.org/patchwork/cover/1058917/

P.S: Maybe wait on outcome of https://lore.kernel.org/linux-sunxi/
20210430031912.42252-1-samuel@sholland.org/T/#t which may change USB3 node=
=20
form.
=20
 Best regards,
 Jernej


