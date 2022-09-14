Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AD23D7C
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 14:04:47 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id o13so11776591qvw.12
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NfG2l9WC526IVwnGCqxG9cyBAaGANUZHGeBAi/89+hY=;
        b=l+UOXMPKD72+xeYTBEaelYgjwnNOC3elr9UGfszmBJkjjzEekyWxqARdq1kIvKb0La
         4N6+pkEt4rpPnWdn5RtBe/gBsflPlCpeI9AcC8SLl4i0/gBCmSROgv8yOsddWm9zQP2i
         zI9rePwo97rS+mO2XnX7czz4KAsapbffVN5cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NfG2l9WC526IVwnGCqxG9cyBAaGANUZHGeBAi/89+hY=;
        b=HwaPgR3bvaIYZx75KKP719OVsqhk4jPrwDUJNAWKrqyHTPH2vy+XMhoFoPEsp2ijBD
         hkNNQfce74P06Yj6rpvF8K0yuAZFo/ueXpQIk4UjoXake19T2cr/tF9jZmXUSEO5y4xa
         okY67ujCsCLAltDbL6vDbRsJmp5oCuyLrlToppddnikNOV1CITDOJf5Sw5IjiKyXvFpB
         ywubnh8rXq8jqifILqmLwy+6K2ClPPi41qzxL9vKneVxcP1m51+TCCAoY4NjslyJa1+j
         kobCR/pL1myqned128q/ar1Zoz6QyNGiQeeB5nGQFOzyjkdWpj1EXcGfVEB0ckn0kGD1
         QUXQ==
X-Gm-Message-State: ACgBeo1/olWXdjtU4FQmQHEjkYqFaN1fb1sJSyXLCMv8NHnBfWvFDcfs
	NBh2/YG59b3eoZzjtVIxHIYY6g==
X-Google-Smtp-Source: AA6agR78ZnCtiyJFrxran6itYGCAIWLa5F7EVn2TwVoawON3RKtlM/iYawWV9VESKzfT5+p3VAuyvw==
X-Received: by 2002:a05:6214:2387:b0:496:c9db:82b0 with SMTP id fw7-20020a056214238700b00496c9db82b0mr32090695qvb.111.1663164286821;
        Wed, 14 Sep 2022 07:04:46 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-f8ad-dcc3-5c01-45c1.res6.spectrum.com. [2603:6081:7b00:6400:f8ad:dcc3:5c01:45c1])
        by smtp.gmail.com with ESMTPSA id bk41-20020a05620a1a2900b006cdd0939ffbsm1775009qkb.86.2022.09.14.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:04:46 -0700 (PDT)
Date: Wed, 14 Sep 2022 10:04:44 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] sunxi: Kconfig: use SoC-wide values for some symbols
Message-ID: <20220914140444.GQ6993@bill-the-cat>
References: <20220913233217.24717-1-andre.przywara@arm.com>
 <20220913233217.24717-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8tZVdKiiYitVG083"
Content-Disposition: inline
In-Reply-To: <20220913233217.24717-2-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--8tZVdKiiYitVG083
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2022 at 12:32:16AM +0100, Andre Przywara wrote:

> Some configuration symbols formerly defined in header files were
> recently converted to Kconfig symbols. This moved their value definition
> into *every* defconfig file, even though those values are hardly board
> choices.
> Use the new Kconfig option to define per-SoC default values, in just one
> place, which makes the definition in each defconfig file redundant.
>=20
> We refrain from setting a sunxi specific value for CONFIG_SYS_BOOTM_LEN,
> so this defaults to a much better 64MB for uncompressed arm64 kernels.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Note that you forgot to CC the U-Boot list on this series.

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--8tZVdKiiYitVG083
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMh33kACgkQFHw5/5Y0
tyzjJAv/cEaytP9asm3HdknEeKubzIo7RSpNGNACvTYagW8B0BST6ipgBwpPJTs0
RsZIc8ac6xyc2tFhUJ62UQAF2EmBCdzVdLFlE2ASBGkXV9ThwSNaD1K6FRQ5H9da
6TGZL8N61/o9rmOtMib/0bYkUxligf7x9lwmVwEtnlFirfZqGYwju4uQLc8IyiEI
NkBX55CADgMXegHmAAy1LeGtpTtjy0DrdjnJNxDDxdiyzb1IADhKZsw0QFFkgkZb
t7X9ciUNbcvWScMEX7d+DBzL9hsZtyS6OKCMym9yWq6I3CI0Y26SGc4O8w4pzzaa
FVp1bm7wJtZTrd9tDcIYKt0fwY3fEbtFOgWIweS6oPwXwcPOK7OfLq7dAGA+88+S
QqIU5S6bKJRAl2d7PdssFjZ/mx1v1oscfQ0c9lQtS1QC60OMFWnRXGILKi7c+Dd9
QKwzB+yCg4nHF94JnpC8j0svPAnnkJLvkkB/T4LQ5jUnKDPFnHWr+tfXviZisJOR
mntaIYab
=s+FI
-----END PGP SIGNATURE-----

--8tZVdKiiYitVG083--
