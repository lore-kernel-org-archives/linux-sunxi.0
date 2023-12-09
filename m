Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D4182BE
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Dec 2023 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="rd1wmXzd"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5df4993c25dso7762157b3.2
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Dec 2023 12:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702154619; x=1702759419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFON5U0/7Mg1/j67NcKPOi2zPmmEBsdFl5OeKzZIyvs=;
        b=rd1wmXzdFfAAN54Y/KiIjW2fxfJ9qqP/kIKYXMT5kUe1tsAXVAUAtAxpe1JWp0TEcW
         75Y3qzOMvQ6JLjqznTA36UbzTwCUdED72vBthstavUTh7XUYMayWDY1mQp1DS2MvBSeL
         hOxYMDzWb2uiLoUw+c8oyJUb6+wwstBoi6Kig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702154619; x=1702759419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFON5U0/7Mg1/j67NcKPOi2zPmmEBsdFl5OeKzZIyvs=;
        b=p4jodOlDjgzonRSToQDFADshozNeW6VsxkTSJStLXMT+gqviKM7t9IdSHrkl0z4NBg
         1VChnIKL/5qgiywugVXvlpuBKZvwbmioJovdFfldVDfM8rpA6XYEKyQPh69eYhRDHhoZ
         mfWyBOK/fSG610B69e1m+jusC5KNaB++LAowITidtnX5TARHFKZq/bKNM2sg21Nn1wEk
         2924H5LG6tX3Itq4JwkXkqHbby3SPUH+ZPtX2eS9uTUhZDCA0hGEIBfZRGju1e3hCGH1
         OIY7QeeM/Df6bHgAqJc+tq125MKhXjrQrT/CX4bSr2VlAnqMi4kLTV87KQ3QIX8Cil3w
         2zfg==
X-Gm-Message-State: AOJu0Yzw4McuSqdaq1jxRYJsIkohY1NPsQgWFzpvBsuJ54740J1CERUx
	yQT2V+0gWSLA31eae3YNick8oQ==
X-Google-Smtp-Source: AGHT+IG0/GTB+acj7or/xwv+2RdXIJo14a4qntaKBJL+WuIUxXNcwPGLv64tQxIb3/K6v6ScDuDDJA==
X-Received: by 2002:a81:8145:0:b0:5d7:1940:f3e9 with SMTP id r66-20020a818145000000b005d71940f3e9mr1786993ywf.81.1702154619670;
        Sat, 09 Dec 2023 12:43:39 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-b2bd-da43-c83a-80e1.res6.spectrum.com. [2603:6081:7b00:6400:b2bd:da43:c83a:80e1])
        by smtp.gmail.com with ESMTPSA id u205-20020a8160d6000000b005d647048e54sm1691648ywb.111.2023.12.09.12.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 12:43:39 -0800 (PST)
Date: Sat, 9 Dec 2023 15:43:36 -0500
From: Tom Rini <trini@konsulko.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Simon Glass <sjg@chromium.org>, Vignesh R <vigneshr@ti.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	Bob McChesney <bob@electricworry.net>,
	Stephen Graf <stephen.graf@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: Add support for zBIT ZB25VQ128
Message-ID: <20231209204336.GG2513409@bill-the-cat>
References: <20231204005954.13201-1-andre.przywara@arm.com>
 <20231204005954.13201-2-andre.przywara@arm.com>
 <20231206162443.7f0692d7@donnerap.manchester.arm.com>
 <20231209203423.GF2513409@bill-the-cat>
 <3c6b3fe41f54a2d2a391d433684e80d9@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iOe8zp/rmOp7wQZd"
Content-Disposition: inline
In-Reply-To: <3c6b3fe41f54a2d2a391d433684e80d9@manjaro.org>
X-Clacks-Overhead: GNU Terry Pratchett


--iOe8zp/rmOp7wQZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 09, 2023 at 09:37:28PM +0100, Dragan Simic wrote:
> On 2023-12-09 21:34, Tom Rini wrote:
> > On Wed, Dec 06, 2023 at 04:24:43PM +0000, Andre Przywara wrote:
> > > On Mon,  4 Dec 2023 00:59:52 +0000
> > > Andre Przywara <andre.przywara@arm.com> wrote:
> > >=20
> > > Hi,
> > >=20
> > > > Add support for the zBIT ZB25VQ128 (128M-bit) SPI NOR flash memory =
chip,
> > > > as used on the Xunlong Orange Pi Zero 3 board.
> > >=20
> > > does anyone have any objections against this patch? I wanted to take
> > > this
> > > via the sunxi tree, as this blocks some board support patches.
> > >=20
> > > IIUC Linux gave up on adding rather generic entries up for each and
> > > every
> > > SPI NOR chip, if there is nothing special about them:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D773bbe1044
> > > Should we follow suit here?
> >=20
> > And we could then start trimming the table we do have as well, to
> > reclaim space?
>=20
> In general, yes, but we'd also need to consume a bit more space with the
> additional auto-detection logic.

Maybe part one of the series is backport that logic, part two is remove
all the easy to remove tables? Or at least a number of them so the
series is a wash and then a targeted series of drop-an-entry and cc the
person that added it so they can run-time verify it's still fine?

--=20
Tom

--iOe8zp/rmOp7wQZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmV00XgACgkQFHw5/5Y0
tyxMDwv+I2oTjp1BXaWqlh3KB+J8HSkzsepYAqGdISCwhL492417y2tJBqmBwHkn
DZZN/T8j/1//JEIsb1KyL4LDkZ6EYisd9LNdhzhcXlFDqU9F9dXpql0V98sV+/+q
JFRlmcN9COlzOEtpDsFahSUeXlZnp+binzSNiEGM57tHGZHt7MzG3j9WuriXtwkk
+J6BX/zbNImD7dbkuBu2wK5ncbPY+0z5OdrCr5CF731EhMirPsVk63B3dp9PBrzH
eHghn6UrYLPgrPEzMFqsqe83I5StKP8lClhsr4CF5cdiavEYfLul+jHDj1qOA+Gf
N4cJpRlJyGoWdMoD1g5YXHsL0Sq77DWazMhKRqmpS6IVbPYRvwZ4GDUxtH4R9ecI
U0Fxy5MHfVxn6dVSomgjzztZDrRTtKvRBCn3YZowjDC3Lm9u7yT5n8jTJc1H8+7x
Fqf0Sd5Ph92cVFPugYKZH0VLeM3vfIwrzwNioHG41cx+2h02nUvoEiMClwspKfhJ
Gngmlt7I
=INBM
-----END PGP SIGNATURE-----

--iOe8zp/rmOp7wQZd--
