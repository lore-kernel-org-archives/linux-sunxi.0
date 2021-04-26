Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D52F80
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Apr 2021 15:04:01 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id z25so19057357qtn.8
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Apr 2021 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9KyrzqUOUBU40/ev/23mlG5dLF4zNwXBlYDVSsywvto=;
        b=UEqMDlMRJsS0jK2Mxi596bi4kUPx0+xl576bykUE2gvQcbMqvOAslgomhfAPP+ZhnF
         oK1FXjzt5xc1ccZRxUSfsXsbyLL0NUtIkQNbqjKDYYQnTjlXBCMHleMALVKyFMtyc+bP
         cNS/4J4XTQORcveKmtrTXLaUK7JLCUP3jK7xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9KyrzqUOUBU40/ev/23mlG5dLF4zNwXBlYDVSsywvto=;
        b=BTkq/da/aoPkecmxcLzG8I2UvZxjTMc0pd5Gwh1eswn9BizrvSxhKMj8AYlQYUhMYg
         d8WCM+42XGEFnPO7asDahP0XH04yhRNSx3XMe1kDBvxOeri7GMuLDhtygaNg6p9jdTPr
         OOrX+tuK+/BnxKL9VgIXDXbFGdD2FArfgu5CguSHLRY+qp1d7B7AyB1N1UVo4MLkOgY3
         KJZEVX7BYDlQ3/YVW+nI+NLh7s1zUjUbOJQ7+vA47Fq61KufSOv1iSeJ0Aok7fjJjyHq
         o/B0s1XzJmPbQ7oKhk1uZpG7LOtKfrbMCZEiNHfd/OQfIZMHkpsNOynfAYuz+rnBmlhk
         zluA==
X-Gm-Message-State: AOAM5329BXnU5E7Y/PVHF+mBZodj1UyR4qm1gdjmryA4HCavplYY2znV
	VupwNOjrrswi07tT5y8/+cK5YA==
X-Google-Smtp-Source: ABdhPJz8iuso78WlTdjtQpQRaBos9LXUcAX3zna0EylxRw8Zw8ppnyA9BgYcKLLplfUCjW8mO+e78A==
X-Received: by 2002:ac8:470f:: with SMTP id f15mr2074695qtp.5.1619449440950;
        Mon, 26 Apr 2021 08:04:00 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com. [65.184.140.239])
        by smtp.gmail.com with ESMTPSA id d204sm214450qke.3.2021.04.26.08.03.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 08:03:59 -0700 (PDT)
Date: Mon, 26 Apr 2021 11:03:57 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Ivan Uvarov <i.uvarov@cognitivepilot.com>, u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] sunxi: Remaining v2021.07 merge window changes
Message-ID: <20210426150357.GG17669@bill-the-cat>
References: <20210426105058.6237-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <20210426105058.6237-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 11:50:58AM +0100, Andre Przywara wrote:

>=20
> Hi Tom,
>=20
> please pull this branch, containing the late part of the 2021.07 changes.
>=20
> This fixes the broken H5 Ethernet and updates the R40 and A64 DT files,
> so nothing really critical.
>=20
> Build-tested for all 156 sunxi boards, and boot tested on a A64, R40, H5
> and H616 board. USB, SD card, eMMC, HDMI and Ethernet all work there
> (where applicable).
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> The following changes since commit 4dda435131251a94b29afd52f010cf1ec5a7ce=
b2:
>=20
>   Merge tag 'mips-pull-2021-04-24' of https://source.denx.de/u-boot/custo=
dians/u-boot-mips (2021-04-24 19:39:14 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 647b392bf20614006917d5fcd3390347a668eee5:
>=20
>   sunxi: DT: A64: Update devicetree files from Linux 5.12 (2021-04-26 10:=
12:35 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmCG1loACgkQFHw5/5Y0
tyzctQwAt/CM3nyAhdcN3WS9Bt8SEVPYCUbGs6/xXrZkzrVDFcoKNNcP1kr9nsDu
8krRz5mNUSMSgyTR4PEe+sLHhAKDJPKAxBwLqC4MGvjOi7uskeyjA6P3P3oXgPE4
1eg0agGXIpC4J2JXu50mVsw3IhOSoJl2acx2U1fV0WQc4Y006pZvXqpg37sw33VO
qEP57FK1FCIjsXw0AwhDbdLDgoJgEDmHr5S/SIeR+suSd27/3FhUioNhVI+NMyZG
jmoKP0S2SSqzhw0BScUM0KIBj0OONR/eR3IU8lXOKNC6bixfBHS7anZERDNLW2Ab
JPQj73aIs9FGxW2JP/ds5qepTBqb2SoqOiidexYP061SrqS/rI6V0N1neJkXnEJM
LITaPGp+7DVMr9C4fCtfBgZEQK7Blu5HE0l5ZiyKTaTyGCNNb3Ohkl0YM2lYhVvy
lh4P5NKCzh/VsToKqJBHlpitWG1HtxKPt5BnHGKTyMbzsioIsRdLSnLJXDls3k9Z
sISGowGf
=hgPL
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
