Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095DD2F81
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Apr 2021 12:45:15 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id m16so23593642qtx.9
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Apr 2021 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2pKn2RFVEeJgoNeENpbDkjzsF9tnvngGD5FGMHEjOoA=;
        b=DekecFOI4fsKY4lRt6D/LchMz0FZlhTWMupU57imsk4y2hVJkwhLAbwghMh+mL1UHr
         hBi6d3SVhqtwxs3zkeLhct4mP2cM9SuT0ND7MfL+joQQ08ZJYu0es3TFosbBt3ye3D/o
         BfT44M6P2qdora9ClvouRNeStG5fBaO8iIQNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2pKn2RFVEeJgoNeENpbDkjzsF9tnvngGD5FGMHEjOoA=;
        b=YHL/RgDxutvzFLLHvlLCBQRUgaE/cqYqcXqYX8FOyE0qsdnnPfBAUWK6TJkHkCZ0oh
         U86SfIM56fWANDfuQeSOL0l9aVlpUlup/O/w6dwbMKhAnPa7tTqyCF2CWexYlYK9AiV2
         SB5H+UplR+S6kGAcKVKg46PhhdTOofYIxgyUtsuYp2b4s00FsYRtmGt7G0521JLA31aY
         MnJBQj56MMAhwNpDpj3U/bC88kdHSvwaqvskGPdSYTJqWZkNQLjbvpvXiKZJPK9iJIXQ
         LiMQqz/oprtthnsk3pSHfoYf1t2P97jRjdWBRah0Mm/Hx9GTbnkbn+Qg013jr0NKDEfC
         lVkQ==
X-Gm-Message-State: AOAM532gRYi7j4PmveGNmHyYzDYWplZR9DJwklapXDe2NR73yOLDfjOJ
	KKk4iWMcp/Wbdwt/0rO/TsGwIw==
X-Google-Smtp-Source: ABdhPJzzI7Q+NClD5sGbW3xqSkStf0w/GvSZp3j3iQ5SgmYJjiXEisT/9mHKPeRR0bZcSWdf4Uq4/A==
X-Received: by 2002:ac8:6b96:: with SMTP id z22mr6300154qts.265.1618749915042;
        Sun, 18 Apr 2021 05:45:15 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com. [65.184.140.239])
        by smtp.gmail.com with ESMTPSA id l24sm3685617qki.119.2021.04.18.05.45.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Apr 2021 05:45:14 -0700 (PDT)
Date: Sun, 18 Apr 2021 08:45:11 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Arnaud Ferraris <arnaud.ferraris@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] sunxi: First changes for v2021.07 merge window
Message-ID: <20210418124511.GJ1310@bill-the-cat>
References: <20210416092200.7752-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SAQKKOKzaVNNKYjc"
Content-Disposition: inline
In-Reply-To: <20210416092200.7752-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)


--SAQKKOKzaVNNKYjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 10:22:00AM +0100, Andre Przywara wrote:

>=20
> Hi Tom,
>=20
> please pull this branch, containing the first part of the 2021.07 changes.
>=20
> This adds support for devices with R40 dual rank DRAM, and asymmetric
> A64 DRAM devices like the Pinephone/3GB.
> Also we enable automatic gzipped kernel support, and allow scripted
> DT overlay support. The rest of the patches are cleanups, but also
> some sunxi-specific preparatory patches for USB3.0 and improved HDMI
> support. The bulk of those changes will go through other trees, though.
>=20
> Build-tested for all 156 sunxi boards, and boot tested on a A64, A20, R40,
> H5, H6 and H616 board. USB, SD card, eMMC, HDMI and Ethernet all work
> there (where applicable), with the exception of Ethernet on the H5. Since
> this is already broken in v2021.04, I will send a separate fix.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The following changes since commit 45b3cf88da24206a6cb847efe837fddc120af3=
e8:
>=20
>   Merge https://gitlab.denx.de/u-boot/custodians/u-boot-fsl-qoriq (2021-0=
4-15 13:11:19 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 599177ed5139dbab112d0c9603e18382d0c642ba:
>=20
>   sunxi: video: select dw-hdmi in Kconfig, not Makefile (2021-04-16 01:12=
:59 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--SAQKKOKzaVNNKYjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmB8KdQACgkQFHw5/5Y0
tyzXgQv+K9MLLWCv2f5QQqYRBwXrH9MyeIhkDHTpd729ks770PowKkXwgD3R+jOW
scCESPY77DF16IH+xlOPy4jfy6POs/Yk4sunNJC78VPEEFoca8iaSB2JzDFFg97D
pO6bj8R32pEyu1Hd1mGywfwOswNFlw3kNtVD8Cn/xAlClFZvBtiXd/UplGaqql6p
nb0eiGGn/6o7geeDAFrULkZzGLtoCPJwAcuGkNARuxpRojOJuy7Zm8D7R1qjwSKC
zpfpP6nLTaiVojL7irIZF/DJqnldSAcPTi43/rnT3wueT0mzlWOidWQd4morcxwc
0Flc2/jQsCLC4JNmatC+pzjV/ccYxUnx2JbAGKCAAYi/CCNzhtQh7/z6Eqtrr6x6
ntl9wuTeA7iRR1hZP7SqUPXHZiLEM+NCztcZ211VA5coCmxMw1VXtchsm6USpXg6
RO0GZekM2Df6X3XOjw9AYhuIHSsOfgJcK1U/Y6FqbGUHp2vIlL87DtAgSj3O/cWZ
m9iD498Z
=+zrk
-----END PGP SIGNATURE-----

--SAQKKOKzaVNNKYjc--
