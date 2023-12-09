Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB981C284
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Dec 2023 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="cF0n66WM"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5d4f71f7e9fso30668127b3.0
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Dec 2023 12:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702154066; x=1702758866; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1Ywbc59SoGFWkh+VV0sfia63x4zQwpBPPAic/Sw2WA=;
        b=cF0n66WMlyXpI4T16Hv5PID6Wij1bCBMHiLXzEKOGxOltqOtgHO/WJ1aECW/oNwb9q
         0uSU/JrpveMDk8nMXilawQFkBZjnIY4lPaLcJb+LmiPvvOJnOIl8gZvUXtP1F37FYP7O
         6BN4uZpyCOeYuL4X1GotgP7mpxbIf5Eem2eT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702154066; x=1702758866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1Ywbc59SoGFWkh+VV0sfia63x4zQwpBPPAic/Sw2WA=;
        b=fBNDMMOgfQovdrHSHjY7F6dnxljy6ZbYqvfGMvi/T0fl8qYXvqnj9yT4+ysIvsd0Qo
         a9fxon/vpFScWm43qkqq1meMLQbpl9AaD5UsXXPZ0hw0T/WiFonaRtcSg1o6fJ4z+aNb
         pITNldrwbX7gWQ5cfMiXAWZJHlAdyg9JT5fnMv29FwBt9lN7fKpGUjwzZVuuqYF34kdD
         ubA/GKNJevJ4w4IaD8EBMU3GxkmBGAMI/xN59gVy3UqRCMnSj+i8RynT+AZpczciJ3gP
         IFg//2K86kAcMeUQoTIWIk69f4SteAdMYjmY9vi40/gdgicqopWpnpXSnOWIzA9/xVDv
         f1jA==
X-Gm-Message-State: AOJu0YxDjbbzCBLvJzSWgxUB9SZLiMp+OUuWZ4PUPu+S75IyQtNKDv/T
	ym7/FZU+zm4VBL+WUV7f+Kw5pQ==
X-Google-Smtp-Source: AGHT+IEyZcrkXpXL9l74BXAmjO+CzDcOybfima/T+7Vz3AU8/bK/Iv6I0/nsPK7l2c78Q5HtAHsxJA==
X-Received: by 2002:a81:6002:0:b0:5d7:1940:dd66 with SMTP id u2-20020a816002000000b005d71940dd66mr1423767ywb.60.1702154066208;
        Sat, 09 Dec 2023 12:34:26 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-b2bd-da43-c83a-80e1.res6.spectrum.com. [2603:6081:7b00:6400:b2bd:da43:c83a:80e1])
        by smtp.gmail.com with ESMTPSA id d64-20020a0df443000000b0059f766f9750sm1698127ywf.124.2023.12.09.12.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 12:34:25 -0800 (PST)
Date: Sat, 9 Dec 2023 15:34:23 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
	Vignesh R <vigneshr@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	Bob McChesney <bob@electricworry.net>,
	Stephen Graf <stephen.graf@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: Add support for zBIT ZB25VQ128
Message-ID: <20231209203423.GF2513409@bill-the-cat>
References: <20231204005954.13201-1-andre.przywara@arm.com>
 <20231204005954.13201-2-andre.przywara@arm.com>
 <20231206162443.7f0692d7@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+GVDZS7k+Kz6TKJ9"
Content-Disposition: inline
In-Reply-To: <20231206162443.7f0692d7@donnerap.manchester.arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--+GVDZS7k+Kz6TKJ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 04:24:43PM +0000, Andre Przywara wrote:
> On Mon,  4 Dec 2023 00:59:52 +0000
> Andre Przywara <andre.przywara@arm.com> wrote:
>=20
> Hi,
>=20
> > Add support for the zBIT ZB25VQ128 (128M-bit) SPI NOR flash memory chip,
> > as used on the Xunlong Orange Pi Zero 3 board.
>=20
> does anyone have any objections against this patch? I wanted to take this
> via the sunxi tree, as this blocks some board support patches.
>=20
> IIUC Linux gave up on adding rather generic entries up for each and every
> SPI NOR chip, if there is nothing special about them:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D773bbe1044
> Should we follow suit here?

And we could then start trimming the table we do have as well, to
reclaim space?

--=20
Tom

--+GVDZS7k+Kz6TKJ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmV0z08ACgkQFHw5/5Y0
tyypGAv/fp8mDhATug2ZkhMrSnKG0/MmieE6zKWXascU7YMwIXJZb3Etpy5/SY6m
WsoXlE0MCZmgXP0UzLiCK1l9fTFDRRsuyW4Z7v4/xeijHgfuxL3qgjkLLY36sAET
ChnTS8sVqZ8k3q97+3lSpVMvfloWbAVZ2JbOd71HpGBOxRix4+4kWy0Lni61XVKi
kNGm8qHtu38puhooURH+q1JMK6z4M9lvS+WvjKwMDyVziTB62dErU4jwBbxAsHFg
xfDD/pCi4/jFbDohGmKlajo9nWz1SiObwuN0aW920b+JelXnZ3SlAqx02G3Kt8lK
IaGdKy1mm3ABFfwZosbztt8Qm5YkhYR5KecHtkpWuNWKQMeyic6U2TDAisnoDoz2
zEpbuQkoztdQQrBiHq4thOIlzEL3l+8/y7inlIG76+QeA7Zz7qz9Tw6BukSF9vTL
hHgQ1z05xeheMVRMXM1MPbwJKkvLS9c9WKxkq5Z+ZS9jGLoId1UhzBDWC/3hl37v
uZ97BSOu
=cR5C
-----END PGP SIGNATURE-----

--+GVDZS7k+Kz6TKJ9--
