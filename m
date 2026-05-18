Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9D37CD4F
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134729; cv=none; b=oEPGKDFgW8UUI0TaEXngy7bC2rm9OGTD3ruqwgBQXDddkp8kPyj4W7XORc3FBBIIoDoHVPCi2tPFVbjfU6klqqIRvNsCmRo1ty8IfhlvTgTSkouBb99fTtX4D8SWeATUMOJZDuQQS1y3CnwViWIG1Bz75qq33iNQV1FyEf40qtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134729; c=relaxed/simple;
	bh=vb2AgGc35TL/XGOXSGbcvOchFSZiLg5xVi3rxt9C3Jc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FmuDBGU4IXIc2Krewugs6ISI/F0BeZgkQHFueixiAmiAZx/36iaAUwwIXbdo2PMzolzDuPb4XiCONeKp4CR3AAh/jf4QvDrXFAXFxGOKumRx/1C2Y4hsXYe8NOBDwZsSrWc/BtRklgVqTTM0lOfnHW+Di3PwdvcOMv+I3+ij/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdjDqxC9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdjDqxC9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so150486f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779134727; x=1779739527; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cAkY0vj7iSY+sZjzSMZGpI/xkJ9Jb7vUa4k3TiZjewI=;
        b=PdjDqxC9R8V0LAUt22yC8xohVFZW61wADsa1RO1sFNlXPm5wbasb1l1PvQHxURuNRs
         EwGYkLdSuuQYNZ/C6AKKJve2dIsPW4a875XjY7p9Cb56Dxf5V7mZcFMDJ+V26yqmyx5E
         39yO6hx9ihd2Q6J+Cco7MUPM64BpH3iO33aLdQU28lDUui/j+HQePEejfcAedStZdy7A
         05Wmri3scMfXNPpmtG2Hzt3fPAk0Y+I0aSfHYGMflywbMF9avUaYhooMobFnZZwiNQhe
         mmjLF90dpur6ewy7PxP/JClYP8dZ2JOofVh9gB4ZCHkq61xSv1HCrBXw+9nu9JBtrj0B
         0zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134727; x=1779739527;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAkY0vj7iSY+sZjzSMZGpI/xkJ9Jb7vUa4k3TiZjewI=;
        b=XWolBaIfyK252Os+KZfxHMFUb8XnOmDAvD7nN7ufKubOu5u2JwjZGJs4Qw8+Av3Feq
         9/kzRjZA/JJX3CPO0a9deHv76DB+IUmwbEo8vE+pMGvanJ+VYdKCaKWWoTFScBxG7JSZ
         X1pstkx0FyO6lih/NDynRZCuXGTFTyGB19DeZ+t1XPcUUC5KYlj7terxfmaW8weUxXST
         llX6SUGPl15TuydAOkyKJaQNmpZZmBo8MWIc7CPH/hhhziCbIlIhstOpj0hnZBg8y89j
         u3lwnfb4/vuhsdNeDiG62MbYDrb/hGlaYs0+O506BmMDTSQmWaGxCYkstopXFU0tE3It
         GfvQ==
X-Gm-Message-State: AOJu0YzaamSGAiT1PlKAaKIezssGAR/n0xC63OLSzc36gdFIQ46FoMKm
	ls7Jv8NOTkU+c9ZpgIASDBSUi2bAZcTUUgzKQD3CD8TvF9vkTTN+xW+ZdHakBYsQ
X-Gm-Gg: Acq92OEnf07HMvLVczvrWqHCDuVpaufyhupw8ebrU96n6U9Ao7gIqMBkLwjCKJNbQsi
	GziY/18emibNwKoL11o9MFaTW/ubd+OEiXQTlSftMsnXF6+fsCV7+Sj/gTrRAJc1DDe7UStdYe/
	mLOezVi2pmKNFRl50zfRYnGNe5r3WiU+1DIH0Nw3bo1fpBINXXrmXFJBYZ6iYl36hAX5NwTrXAv
	BIB4mo+ejBGv3Q1si/dyOssEpxbXVwiQu8OzwmyeAWi2gPlFo70NYyY+X1ylim3UPhjVjPI09mA
	0CP9kakljkt3X40xXSXszCHBbDb5sQ6/VpMxY4RqW0gHdAnGQrCcxF3nfCnngLR/1KotorKPx7Y
	gVqRp77cDJsAAtNOdHGM4SGf++f7Zxxln0mLr/E5CnSwrhsF6vyT5vAjJeWViH4I8DEz9/iiN91
	QgjkVMb+vyGVbhY1tUesxVbs7wMfOcjxfp/mO1kIuSfxcrnaN80bsaOx1xbbtxReXnr+24KOwcX
	/g=
X-Received: by 2002:a5d:584c:0:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-45e5c587281mr26781621f8f.23.1779134726576;
        Mon, 18 May 2026 13:05:26 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm40825454f8f.21.2026.05.18.13.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 13:05:26 -0700 (PDT)
Message-ID: <04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 22:05:25 +0200
In-Reply-To: <agr9m_tidBr6Cu2h@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Paul,

thanks for the review!

On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
>=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi =
b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > new file mode 100644
> > index 000000000000..65b094f30bf5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi

[]

> You should add:
>=20
> 	chosen {
> 		stdout-path =3D "serial0:115200n8";
> 	};

I actually have it in .dts, but it's theoretically possible to deploy
the core board in a way that serial0 is *not* a console, so the above
probably will not be valid in all cases in .dtsi.

>=20
>=20
>=20
> > +&reg_dcdc2 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <500000>;
> > +	regulator-max-microvolt =3D <1300000>;
>=20
> Should be:
> 	regulator-min-microvolt =3D <900000>;
> 	regulator-max-microvolt =3D <1300000>;

0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?

>=20
> > +&reg_dcdc4 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <500000>;
> > +	regulator-max-microvolt =3D <1300000>;
> > +	regulator-name =3D "vdd-sys";
>=20
> Should be:
> 	regulator-min-microvolt =3D <810000>;
> 	regulator-max-microvolt =3D <990000>;
> 	regulator-name =3D "vcc-usb-sys";

I'm a bit puzzled here: datasheet says 0.9..1.0v
and it has no "Typ" value, similar to VDD_CPU, but
VDD_SYS is not part of OPP tables, so who is going
to adjust this? Or shall it be just

regulator-min-microvolt =3D <950000>;
regulator-max-microvolt =3D <950000>;

?

>=20
> > +};
> > +
> > +&reg_dcdc5 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <800000>;
> > +	regulator-max-microvolt =3D <1840000>;
> > +	regulator-name =3D "vcc-dram";
>=20
> Should be:
> 	regulator-min-microvolt =3D <1100000>;
> 	regulator-max-microvolt =3D <1100000>;
> 	regulator-name =3D "vcc-dram-2";
>=20
> ALDO2 is the main DRAM supply, this is the second one.

Core schematics mentions 1.1V/1.2/1.35/1.5 on this rail...
Currently U-Boot has CONFIG_AXP_DCDC5_VOLT=3D1100, but potentially
this is adjustable, right? At some point LPDDR4 chips they
are soldering today will be unavailable. And in the current
market it will happen rather sooner than later...

>=20
> > +};
> > +
> > +/* DCDC6 unused */
> > +
> > +&reg_dldo1 {
> > +	regulator-min-microvolt =3D <700000>;
> > +	regulator-max-microvolt =3D <3300000>;
> > +	regulator-enable-ramp-delay =3D <1000>;
>=20
> Should be:
> 	regulator-min-microvolt =3D <1800000>;
> 	regulator-max-microvolt =3D <1800000>;
> 	regulator-name =3D "vcc-pg";

Do suggest to drop vendor's

regulator-enable-ramp-delay =3D <1000>;

in all cases?

> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > new file mode 100644
> > index 000000000000..ccbca5d0a40c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

[]

> > +	aliases {
> > +		serial0 =3D &uart0;
>=20
> The is best added to the core dtsi.
>=20
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
>=20
> Ditto.

But it only physically materializes in Helperboard, the carrier.
Potentially this one can be left floating or used for something else.

--=20
Alexander Sverdlin.
