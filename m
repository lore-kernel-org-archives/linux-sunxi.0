Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BA0A31
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Dec 2022 01:59:35 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id a17so5476932qvt.9
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Dec 2022 17:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vEzhKQ9S7TTWXnFW7Ynke55sgRZ60AaT6tbRnIj2Qks=;
        b=XThiif+k4JdtPGic4i7RCJUfFN3tsYoTPhcx3zo2IOH4MRVhtsXImkvK7RIL4Zq4mL
         GyRO5fA/EJgZB816iq1pwfCWJ7g95fe93xHyTATn/+RK2SUD0zY2ufeauvY6VJ8/JI6m
         vkrlcAM7spMKulcpx4O7YjsCxrKac1sxAfZT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEzhKQ9S7TTWXnFW7Ynke55sgRZ60AaT6tbRnIj2Qks=;
        b=ukEMwisrwQyUnkUrNec0qIGsQycBID0AR48Aqdfc9XSoJM6Muz2O9spXOb6MYPPb4E
         G91tD9Q7qGAh21v40hVoGfXnpCh91IEkOe0ZrAryjHHgd2PUiuBQHMryRI5pM5epI2LK
         pkrEodMJ5wKY5lz6uEV4N9SADusIPk2p7lywx38kSraVwzxMmvDNkIfh3LxwsJ3cD1kv
         AijZ+nMSlmTNJSGe025baF8YxZg4gF5Q/Mi3DeP/3AfVMAXHG19HY6lZc4lnJDXgm/Ot
         1cBR0pFXCCsnbZzkOEXnjuQ4C1c4GQk1blQxFL/oLBeLWbafLq7r8lal/AObBUa1+u4U
         mJ6Q==
X-Gm-Message-State: ANoB5pkDcPiBQJTxL3fKu2fd/UBBMOCiN2niIWQwaGsVL5M0Opa+VtJP
	MwiP8GdlmQw62/UCtJc+w5FDaw==
X-Google-Smtp-Source: AA0mqf5AlBkM5HG0Na/v3BSRbBC7Wlk8qkzsUZQwNahYVn7O22R6x5f28a90fvgfuWnvsyJpZh5mVA==
X-Received: by 2002:a05:6214:4411:b0:4b4:a3d6:6877 with SMTP id oj17-20020a056214441100b004b4a3d66877mr54508388qvb.28.1671415174094;
        Sun, 18 Dec 2022 17:59:34 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-d5a0-abff-1b88-4d34.res6.spectrum.com. [2603:6081:7b00:6400:d5a0:abff:1b88:4d34])
        by smtp.gmail.com with ESMTPSA id u25-20020a37ab19000000b006feea093006sm6061340qke.124.2022.12.18.17.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 17:59:32 -0800 (PST)
Date: Sun, 18 Dec 2022 20:59:30 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>,
	Mark Kettenis <kettenis@openbsd.org>
Subject: Re: Pull request: u-boot-sunxi/master for 2023.01
Message-ID: <20221219015930.GJ3787616@bill-the-cat>
References: <20221217015114.1264-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qi4r1fmdPaGQ093N"
Content-Disposition: inline
In-Reply-To: <20221217015114.1264-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--qi4r1fmdPaGQ093N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 17, 2022 at 01:51:14AM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull some fixes for sunxi.
> This cleans up each board's defconfig, and fixes the serial console on
> some Olimex board. Also we lose another legacy config variable.
> The rest are minor cleanups, that actually shouldn't change anything
> in the build.
>=20
> Passed the gitlab CI, plus briefly tested on Pine64-LTS, LicheePi Nano,
> and BananaPi M1.
>=20
> Thanks,
> Andre
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit c917865c7fd14420d25388bb3c8c24cb03911c=
af:
>=20
>   Merge https://source.denx.de/u-boot/custodians/u-boot-marvell (2022-12-=
12 09:00:58 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 64531496f990c2a63211c72b953dfc084b4c2589:
>=20
>   sunxi: board: annotate #endif lines (2022-12-14 22:31:33 +0000)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--qi4r1fmdPaGQ093N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOfxYIACgkQFHw5/5Y0
tyxE4gv/V19af/QHmt3Oy3Fp+frwSKHCI9kCDarj7JGNvfPKRWDoaMJGicEyNer9
DfTNyjLK8aU4F5pHOwQTNQ+ylSYpYMsAPoUeE5Zp+CfBwTsFuIrkOleYrdBSryVy
ziLoBEFWEPpi0EFb2WyBSWItGUBW7JAbLB8W8wLICxdI9ZoX8f8K0D7UGLZYo31p
PUzVvWhjq+5Bs0AT4skUECvGKhOlLT69mkmroafZDhbuorLidjlqYykS7g7YmrU/
QCr7irTGcXyqSHE506Ov00Qay7IbHQRayI9hF8nabVnLy/aU09juRshf1NnfUKkw
6ufErQyq79zNEUAyuvhGp1BDw+Ner1+1ZbM0CDUr5HmX3F+w+BeT0xT3fMGVFILs
cyjOuT0tZOhtDqR2TmXDV3uZBne58NkVfc3IcxmthcembpYTzUcdQ4uIsSyjTNXA
8gRgpiie3LQm/M8of5jI7xSU0qptpaKyNUYSg33s3l4zSVtWRBvuJ16tGSm/ZlNp
5F9ZHkNZ
=ctFx
-----END PGP SIGNATURE-----

--qi4r1fmdPaGQ093N--
