Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B12718B47E
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500008; cv=none; b=kdlkOOgtIsFZMSHCEU5nruwaYUyF4dAn8tGqbP6JVTP9hUaUbq2KsL4XcWaZ0/dobtzpuXXEfqNN1d8YV+nu3T8CsUl3XTfo71z+hc/W4iSye/B+kaGbeF9WgefLOt3snd4xAKMmY5baVxrv5lg6xDhfYXxpzyEZvLkzMsR8Bpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500008; c=relaxed/simple;
	bh=l1x9b2hctR2WDpkifu0IEUFYsP/9MX9JX8s1GvEUSYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QCWugj/1f+C3ag8zQLuWq0smlvJ8Eau6wDgh564FgeBHeFt23BG6C5rw62jlh0iRW5SJYyA2tkk7SjhRqMjUDnExq8L/tWfCllUaOOVBaTaoJl+eXRb1IChb7VAva515euSOomRufG4iIr5DLJRvLVOR8V5Oot38xeDHnPQlRhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ai8QafaP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ai8QafaP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so12241848a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 08:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740500005; x=1741104805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+eEISZt3JOScjhtFEQZpKgi6d+Uc1Zsb3iM25CqS+g=;
        b=ai8QafaPsqOGb7Uqahizslo7ZTP7JH/Ay1uzpez+eZJ+WASODE5EURACqusnbcM8wS
         zqu5R2hvN1hlfhZ55PG2Zg9fvFeoejeRE7E5QWNYfpEtdB8FL+btsbwC+EF2RA8OijHk
         DM7cgNKuYm4NdBtxqj+Wr2qkBMEbAqoPyJuvE0qUa9lEnoAu+Rnqjyp+zpdhNBjKe2zN
         GfjU/v2INeEbgFXrGy4rFx6hDRLiyvtDEVtxmNtPxn7nbKOXnYpXoewcpZWlCSsZrAKW
         BQ9GJynSTJEe5xPYiqLYe5TfC7qdxkrETKv921lVtuaev6w22H2xDqpSrs3Wpby7RTA9
         NpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500005; x=1741104805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+eEISZt3JOScjhtFEQZpKgi6d+Uc1Zsb3iM25CqS+g=;
        b=B9/kvxooQ0EeU4JCa/Md+6Jw4XwFdRKRtIIwOrE6unAULBc03fWX0JVbOBZBsuJ6aO
         nVWAMX3gOA02z7RJ4v8wUTycclEYrzsEIv6tdbwQWLSSzt7eEUxdAt+Eiu6DGyKUbqK6
         n6sQ0PbxFMtf+slKGCYyNODxc5xQARGKqgo/4QPuyNZyVjbbuuelCH//KPEz+yU+Uc+H
         8zHKedhKklUn5L7bTDa/LCeclZOQVrevo41D7ny7khSe9jRebn52mipKRBLxDM5P9eDj
         NziSOfJmR3QJJrCvw7QwZu41lzpA8NB8oD9bsEb2/MvVeFedCoRVlYHVvI49u+udRiBo
         Zw6w==
X-Gm-Message-State: AOJu0YxMurebdIEf/i4rZqsgpWoH/3qRGULPm8KhfX+UevJ6fkeh4MV4
	rUJ/e+81cKaH18iillV2i4DcaU5Hzcbhg7O6mroZVWg8SvH5jKDB
X-Gm-Gg: ASbGncvkKAJtOQs5Cmz0HipLlDp9lM/LNrnWSn0Fs8TFFZ8xaLHEjuAfy7W9oL68YE6
	n+2orzT6XFpBWUhkp5L65rTSqxnX76cnx7Gze9CWBOIWHZjkXNZoAZbGzCLx19XvYPWO829j/18
	r78R+UTsYRHFvC3fxk7redYhQoEYzRkWi7rGVXAgc9DXQ6GcjXBLBTDsozxJLGHgF5dE9tYl94u
	2fmW3yw+eweyY3dk2R1YWSPTrIvBbQVhYs6+x6ZABAc4QdcwrLb1KTm3e5KH8P3Eqd6ZPC2tmTN
	KyWOHu4q/o8oxSe+dO+xde+qG4Lwr1Ci3X/d/LY+h6VHsup4MApzfKKm8v7kEV0iFQReXUwypja
	EFA==
X-Google-Smtp-Source: AGHT+IFIILcYvOtLM6P/RoqbO55kp3W0YqwRvqh8xqIktLfjpEV6p6teoo2txU+Fn1NEQa0aCpxTag==
X-Received: by 2002:a05:6402:358f:b0:5de:5cb3:e82a with SMTP id 4fb4d7f45d1cf-5e0a1116e25mr23929151a12.0.1740500004235;
        Tue, 25 Feb 2025 08:13:24 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8602sm1390888a12.64.2025.02.25.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:13:23 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
 devicetree@vger.kernel.org, samuel@sholland.org, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject:
 Re: [PATCH 1/4] arm64: dts: allwinner: h700: Add MMC2 for Anbernic RG35XX
Date: Tue, 25 Feb 2025 17:13:22 +0100
Message-ID: <6132364.lOV4Wx5bFT@jernej-laptop>
In-Reply-To:
 <DM6PR19MB3722684AEFDAC7C57927F58EA5C02@DM6PR19MB3722.namprd19.prod.outlook.com>
References:
 <20241018160617.157083-1-macroalpha82@gmail.com>
 <1884930.atdPhlSkOF@jernej-laptop>
 <DM6PR19MB3722684AEFDAC7C57927F58EA5C02@DM6PR19MB3722.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 24. februar 2025 ob 19:17:42 Srednjeevropski standardni =C4=
=8Das je Chris Morgan napisal(a):
> On Sat, Feb 22, 2025 at 11:44:39AM +0100, Jernej =C5=A0krabec wrote:
> > Hi Chris,
> >=20
> > sorry it took so long.
> >=20
> > Dne petek, 18. oktober 2024 ob 18:06:14 Srednjeevropski standardni =C4=
=8Das je Chris Morgan napisal(a):
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >=20
> > > Add support for the second MMC slot on the Anbernic RG35XX series.
> > > The second MMC card is connected to MMC2 (WiFi if present is MMC1).
> > > The MMC logic is powered by cldo3 via the power domain to which
> > > it is connected, and also has an external 3.3v GPIO controlled
> > > regulator required for functionality.
> > >=20
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 27 +++++++++++++++++=
=2D-
> > >  1 file changed, 25 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35x=
x-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024=
=2Edts
> > > index 80ccab7b5ba7..e2039fd76b3d 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > @@ -18,6 +18,9 @@ / {
> > >  	compatible =3D "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> > > =20
> > >  	aliases {
> > > +		mmc0 =3D &mmc0;
> > > +		mmc1 =3D &mmc2;
> > > +		mmc2 =3D &mmc1;
> >=20
> > Please drop those. As a rule, we don't have it in any DT, since there a=
re more
> > universal to identify root partition than a relying on device order.
>=20
> Would it be okay at least to keep the mmc2 alias mapped to physical
> device mmc1? Confusingly enough, this device is such that mmc0 is the
> first mmc card, mmc1 is the SDIO wifi card (not always present depending
> on device), and mmc2 is the second mmc card. That way the WiFi at least
> when present is always predictably at the mmc2 alias.

This is standard for all Allwinner SoCs:

mmc0 -> SD card
mmc1 -> SDIO, more or less only wifi modules
mmc2 -> eMMC or SD card

Such ordering is due to mmc controller capabilities. And no, no exceptions
for labels.

>=20
>=20
> >=20
> > >  		serial0 =3D &uart0;
> > >  	};
> > > =20
> > > @@ -175,6 +178,15 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power inpu=
t */
> > >  		regulator-min-microvolt =3D <5000000>;
> > >  		regulator-max-microvolt =3D <5000000>;
> > >  	};
> > > +
> > > +	reg_vcc3v3_mmc2: regulator-vcc3v3-mmc2 {
> > > +		compatible =3D "regulator-fixed";
> > > +		enable-active-high;
> > > +		gpio =3D <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> > > +		regulator-min-microvolt =3D <3300000>;
> > > +		regulator-max-microvolt =3D <3300000>;
> > > +		regulator-name =3D "vcc3v3-mmc2";
> > > +	};
> > >  };
> > > =20
> > >  &cpu0 {
> > > @@ -186,10 +198,21 @@ &ehci0 {
> > >  };
> > > =20
> > >  &mmc0 {
> > > -	vmmc-supply =3D <&reg_cldo3>;
> > > -	disable-wp;
> > > +	bus-width =3D <4>;
> > >  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > > +	disable-wp;
> > > +	no-1-8-v;
> >=20
> > Please leave properties in same order to minimize patch size. From
> > what I can see, only above property is added, which is not needed anywa=
y.
> >=20
>=20
> Acknowledged. I just figured I'd alphabetize them, but you're right
> it's a bit anal.
>=20
> > > +	vmmc-supply =3D <&reg_cldo3>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&mmc2 {
> > >  	bus-width =3D <4>;
> > > +	cd-gpios =3D <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> > > +	disable-wp;
> > > +	no-1-8-v;
> > > +	vmmc-supply =3D <&reg_vcc3v3_mmc2>;
> > > +	vqmmc-supply =3D <&reg_cldo3>;
> >=20
> > Is this another SD card slot or eMMC? You configured it as it would be =
SD card,
> > but mmc2 slots are usually used for eMMC, which needs different configu=
ration.
> >=20
>=20
> Physical bus mmc0 is the TF1 slot, physical bus mmc2 is the TF2 slot,
> and physical bus mmc1 is the SDIO wifi card (which is present on most
> but not all devices in the 35xx series).

Interesting, 2 SD card slots and no eMMC. That's a first for me.

Best regards,
Jernej
=20
> > >  	status =3D "okay";
> > >  };
> > > =20
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20
> Please let me know about setting alias mmc2, thank you.
> Chris
>=20




