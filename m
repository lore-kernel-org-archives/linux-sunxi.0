Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B91F199
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 18:05:00 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-579d5d89b41so24704747b3.2
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 11:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1689962700; x=1690567500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=giqllqhz6MHYFmGCnSn4DK4LtkqpuHVwHdQhWdWXOmk=;
        b=gBT/FvbJ8AmuINcCTZXWqbp6tUrRD8CCnVA9qNhlA6HDJcyUh6BGzkAa3GF0zntrkv
         gFw5XTPxZt4nNWQVU9fw9FsXwQZRL0e93gfkvB/c7KipcLeOrikwXvhskEevde+d2e94
         P2qUHxW3NN9k2+1i+lqJekpSGQnFA0wYiIx2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689962700; x=1690567500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giqllqhz6MHYFmGCnSn4DK4LtkqpuHVwHdQhWdWXOmk=;
        b=iY9lG5J47qaabesv1R8P0345MJIDhj0wk2ifVd//koIxH9dUbUoRLHsCAErDNTxWdf
         irj/wowQOa2/ueBlhfbj5y526LTe7xgPvMnhZZJZ0CqdaVH/ta/GXLCK5Pbnl3NTZR4P
         o7Pa+cYLqJ6zCEhOIk07Yiltn9s5d/0sJRj0djXfwOK/Oaig/WAJkGCyh1gejlYoltPT
         5+XJQElFdZalBd+cWWNtF7e6YvUVIrvVyL5h2BFw46+MbtpEx9tCcjQ0fZLMPwf4r4bg
         mfVNwVuink9L/2ss/hTn7hpio7ez/bJp9u3n13C0LEymSNs2oyl8PtYhtsV6jthV+1bI
         KzyQ==
X-Gm-Message-State: ABy/qLYczL4m+7HGCVaWBmpoNQuMA/Mvim1hgaIFUYpZX+QLjp72FpKB
	oXzNQAceAvAi+8BGJiVrjnlfhQ==
X-Google-Smtp-Source: APBJJlEZEqtNdlHRZ2S+P457Wx8mTCWTmFZ5EuT3019E2PPKdamfHNlMbzU4boFpdORPvKrD67QxNA==
X-Received: by 2002:a0d:e20e:0:b0:577:1560:9e17 with SMTP id l14-20020a0de20e000000b0057715609e17mr824651ywe.35.1689962699758;
        Fri, 21 Jul 2023 11:04:59 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-81e1-2dbc-e68b-5ea0.res6.spectrum.com. [2603:6081:7b00:6400:81e1:2dbc:e68b:5ea0])
        by smtp.gmail.com with ESMTPSA id s65-20020a0dd044000000b005832fe29034sm1031671ywd.89.2023.07.21.11.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 11:04:59 -0700 (PDT)
Date: Fri, 21 Jul 2023 14:04:57 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for 2023.10
Message-ID: <20230721180457.GE3630934@bill-the-cat>
References: <20230721134857.4676-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vjKDcZDgNeKWjDP8"
Content-Disposition: inline
In-Reply-To: <20230721134857.4676-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--vjKDcZDgNeKWjDP8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 02:48:57PM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the first part of the sunxi pull request for this cycle:
>=20
> For once this adds USB support for two SoCs: the H616 and the F1C100s
> series. The rest is support for LPDDR3 DRAM chips on H616 boards.
>=20
> Gitlab CI passed, and I booted that briefly on an H616 and an F1C200s
> board. I don't have an H616 board with LPDDR3 DRAM, but reportedly that
> works for Mikhail, and doesn't regress on my DDR3 boards.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 0274eb61e1f2a8e053fb028b6c668c67c0b75b=
9c:
>=20
>   Merge tag 'efi-2023-10-rc1-2' of https://source.denx.de/u-boot/custodia=
ns/u-boot-efi (2023-07-20 10:19:04 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to ecb896cec75e98d6e5f9bcbf0a87976119443985:
>=20
>   sunxi: H616: add LPDDR3 DRAM support (2023-07-21 00:54:19 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--vjKDcZDgNeKWjDP8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmS6yMkACgkQFHw5/5Y0
tyz7uwv9HIkYmF7cN8B4IJPiweFNlNqi8AAzD8UXnOHJsBlUhehzmV72QNDJQXWO
JjkTOFMBqjDmugrI4elz95FchyZqM++rAvD8r688wJOQSCVc9iYZc6i7Oofb5Amk
8S440SDs0/5ZpcOXft6XCEKi/nYWjuaYtRnGnIuz2lX31EfUthHy7SiES5Q8Axyh
07RyE+WCJBmsiDVtcKAfqrRAHr8qbg/G1/QNpKulnFSUV8x26xmZAGNgwtRNQ6m2
rv4j2pdrNR/IEoS8on/goCKodCQxmnE1/lq7XI6UXr1kfeiLszXvhlGbrwPCwLpQ
VUdtWJfaEVyqkuIlzNin0kaIG+O4w1VeEj4SrTaYUl/upWNAYNwg7OZqFSZJLPjU
lOfuNfFGG0icscku9/ihOLYNz1QzIEWuSWQl3YO7lYmZzvQn7VWZryVs/zibHAEA
rbVppG7jlgdd45zrp8IdobHHJ2suVSQwtYRneDWwrDr0u2f+9ZMF7Ba02Hx4u9KL
1+EqYNYM
=8ieF
-----END PGP SIGNATURE-----

--vjKDcZDgNeKWjDP8--
