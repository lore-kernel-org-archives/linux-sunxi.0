Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0534C9A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 16:14:38 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id o5so6558860qtr.11
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 08:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zXbzOW9vqHw/K1Q9k6yy0yRpYeY1QdbvLhI2EuGw0dA=;
        b=rTb4FjSDwgH/N8lkcMeHxt/OmJCxWnYNbMP3z27ekai5E2Q99NSTHKG5IEBIKQKgOL
         Go573GkyXJyLOZ7N5B93IB/A2IXka1ZZyQvPoI8EBF7UGwmoc5YnOVIhhltdAovq5MV9
         Plw76hcgQRsUNifGNLa4RKz2VffYGQk5zGWoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXbzOW9vqHw/K1Q9k6yy0yRpYeY1QdbvLhI2EuGw0dA=;
        b=3PrSX4BDSIWDStVJXsYAPOS9xtheAnZShJzcH2hI2HNoHydMi0XgkOGew8izzRlC/V
         HLIq9RghQ1hTS+4+QLhWGCQrp2JT7/5BD6ykTE+xTHARqjp4xjCo5YajnoZdHDuDPO2q
         8s6hlx9vmsYgUB4H21tDR+JHWaDDB4DEY1uPSAQSgJrnwnu7cbZdalFDSbuOHRIqSpQf
         PZIT1KRVvUNpHqRCOrrVrexM+jFR+3+vWtrgXsZJD2He3/SHpzzD8udU3TwwJSNtzPiY
         qjn1bE1YqkDQyrjb7DPd6eM7KIzfu0ibN1J26v/hXg38u4bXcDopXZgwLOY1x4ukCCl4
         1PXA==
X-Gm-Message-State: AFqh2kowr5VpEJ7naAk8pLV20HEbAhxmAvvJEe012CzfWRv34vgPQXqu
	E7wKeDOhVXAWR5ItoPmtoFRtfw==
X-Google-Smtp-Source: AMrXdXtCO5EPwpZogGGjKYdtBomHlmeVCsUzTc91K33HHrQWo0feCj9Nh7H1eoug1MqeppPoOtcYZA==
X-Received: by 2002:a05:622a:400e:b0:3a8:15d2:6e8b with SMTP id cf14-20020a05622a400e00b003a815d26e8bmr3770044qtb.33.1673972077365;
        Tue, 17 Jan 2023 08:14:37 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-3487-94a5-6d7e-19f3.res6.spectrum.com. [2603:6081:7b00:6400:3487:94a5:6d7e:19f3])
        by smtp.gmail.com with ESMTPSA id w17-20020ac843d1000000b003b62bc6cd1csm4239478qtn.82.2023.01.17.08.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 08:14:37 -0800 (PST)
Date: Tue, 17 Jan 2023 11:14:35 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] ns16550: Fix DM serial operation with non-DM SPL
Message-ID: <20230117161435.GF3880571@bill-the-cat>
References: <20230117120938.818180-1-andre.przywara@arm.com>
 <20230117131518.GW3880571@bill-the-cat>
 <20230117160914.7c2ba373@donnerap.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mBuDz+cd8w/hvK2v"
Content-Disposition: inline
In-Reply-To: <20230117160914.7c2ba373@donnerap.cambridge.arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--mBuDz+cd8w/hvK2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 04:09:14PM +0000, Andre Przywara wrote:
> On Tue, 17 Jan 2023 08:15:18 -0500
> Tom Rini <trini@konsulko.com> wrote:
>=20
> Hi Tom,
>=20
> > On Tue, Jan 17, 2023 at 12:09:38PM +0000, Andre Przywara wrote:
> >=20
> > > Commit 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to Kconf=
ig")
> > > moved some NS16550 configuration variables into Kconfig.
> > > Among those there is CONFIG_SYS_NS16550_REG_SIZE, which used to be on=
ly
> > > defined for SPL build runs, but now is always set (thanks for Kconfig=
).
> > > However this breaks the gating logic in ns16550.h, where we *override*
> > > this variable for DM build, as we learn this setting from the DT inst=
ead.
> > >=20
> > > As a consequence, we did the register shift twice: once when building
> > > the register struct (as required for non-DM SPL builds), but then also
> > > again in the driver after we parsed the reg-shift DT property.
> > >=20
> > > Change the logic to match what the comment says: only observe
> > > CONFIG_SYS_NS16550_REG_SIZE when not using DM, and ignore it otherwis=
e.
> > >=20
> > > This fixes U-Boot proper for all sunxi boards, since they are relying
> > > on this driver being build non-DM for the SPL, but DM for U-Boot prop=
er.
> > >=20
> > > Fixes: 9591b63531fa ("Convert CONFIG_SYS_NS16550_MEM32 et al to Kconf=
ig")
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > > Hi,
> > >=20
> > > this is admittedly a quick fix, to get sunxi booting again. This whole
> > > code around the register access looks somewhat bonkers, to be honest,
> > > but at the moment I don't have time to rework this.
> > > Another possible "quicker fix" would be use a separate variable for t=
he
> > > register shift, so that we don't have to redefine a Kconfig variable.
> > > Another idea would be to get rid of the struct for the registers
> > > altogether, to remove the hacks about when to shift.
> > >=20
> > > Cheers,
> > > Andre
> > >=20
> > >  include/ns16550.h | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/include/ns16550.h b/include/ns16550.h
> > > index 243226fc3d9..e9e2aeedd16 100644
> > > --- a/include/ns16550.h
> > > +++ b/include/ns16550.h
> > > @@ -26,11 +26,12 @@
> > > =20
> > >  #include <linux/types.h>
> > > =20
> > > -#if CONFIG_IS_ENABLED(DM_SERIAL) && !defined(CONFIG_SYS_NS16550_REG_=
SIZE)
> > > +#if CONFIG_IS_ENABLED(DM_SERIAL)
> > >  /*
> > >   * For driver model we always use one byte per register, and sort ou=
t the
> > >   * differences in the driver
> > >   */
> > > +#undef CONFIG_SYS_NS16550_REG_SIZE
> > >  #define CONFIG_SYS_NS16550_REG_SIZE (-1)
> > >  #endif =20
> >=20
> > Does:
> > https://patchwork.ozlabs.org/project/uboot/patch/20230110161946.3816866=
-5-trini@konsulko.com/
> > work for you as well?
>=20
> Unfortunately not. This changed condition there does not trigger for
> sunxi. If I hack it that it applies, but only to the proper build, it
> works, though. But I don't feel like adding to this #if even more ;-)

I've got a version that does work, now, on my pine64 plus, and I've
asked Quentin to test his Rockchip platform that was also broken, before
I post a new version there.

A better long term fix would likely start by seeing which non-DM_SERIAL
cases we have, and what they need, still.

--=20
Tom

--mBuDz+cd8w/hvK2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPGyWcACgkQFHw5/5Y0
tywpywv/UU4IE9gxGqRfOwALIJRInKUNqb7UztDaIW3mVJlRyIjqBhLBS0zgwIHU
qVCecjU72CjP+BM6OgzBu9/DrRePvsgSyxWuBXA9d4zLLWM42NxQQSjzlFzLQrLl
7OTNPLVoRU8gtvdDb3N8iWViEKD8M7Rj86xHcWqEdpD9Vz059rgKjDFA9KJFOlom
kT6pKQIib1dg98JGeiAhbwRKEmKvvetzJCs/xMjUxqPgFPvOhpROM+mVoTjq9bih
LE0HUrtyFuR8G3Qr8g7+QodaXMlffkLJHKMVTjlqzS5ys8xIExGr10Z+r4Sjnab5
I7OLfVtOzSo4xtp12P0YHjQIo+O/q3190Hc0OAOFPSIU3RUXr02AOACBZEHOkC5M
SoY9cEn0iKrEQLN2i+c5TNtS1ZgXWBGYG2ywiPY1Sf5Own6J/CYD8rgMleB5AlOe
01J3W1j9UcgthrkIHclSWumI5qlrVtowXYUbp+15vUqVrBxfCyUZz0qgua/zajuH
lzepEAh3
=5xDc
-----END PGP SIGNATURE-----

--mBuDz+cd8w/hvK2v--
