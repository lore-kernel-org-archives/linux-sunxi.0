Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCED5393
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Jul 2022 19:54:30 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id c3so6374287qko.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Jul 2022 12:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EKdcLxQqyBbwP9+ENU6AldTlBWMH6J2sxdxcNVl0/1o=;
        b=jCT3bO2GCqCwWB8Gz6P79oBidrzib7kK/yFV3QHYivqqIS/LgbGt6P+PTBMOHM9l5B
         +zR04GGWTSaWTXdZ1SRZR1XucrZR2zKcKnE6uBZGErGOXuoSvTUjEdqJ2LGhQa2cO/6C
         arIyLXPHsY6V96+jTktlLZsDtfYsid2G68MVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EKdcLxQqyBbwP9+ENU6AldTlBWMH6J2sxdxcNVl0/1o=;
        b=I3HIH5Sk6qjqdIkxpnohSrPgegDKj6wr7cHvykfrrQAC+cDVrYws4Wio02RG2Ccu/j
         aVnBPw4cSAZw+j2vDiATjBs3CXGmS51L7MABPPsDlL4MQdeBPkt7cmNFs9qVIE7TB5kg
         N/J/yHAzHdjsqs2n+NOH4bWFojms0BQDQPKh/I34wG3XZPZyn1lKwlwHzY5iM9YAmyn4
         27wuzR1TO+Ymz/nZIkZ1bHjFFunp4DIW07AOyxbqMEW5eHuK/UwCw84KbPwts8EvEhxr
         VVLFdbhPhEaBA0/JeEv0l2HKiyBU2dZ+NXFttSDT22NLd3DbGC9cyXj7QeymOuCJY/pW
         ynsA==
X-Gm-Message-State: AJIora/cNLuLlkG4epEttWWpVI6dgam5zNy//CL6KpJVusmUF8V4j/09
	CXkaPOcIgtyJLXGjFyY6iNZTxw==
X-Google-Smtp-Source: AGRyM1uk9116pIWnw3DLKOZgk6lOfTKEPXcDQNuYeIaD/4CPt0jTY3Job1u/9o+pzzD4NQXiXzglSQ==
X-Received: by 2002:a05:620a:400f:b0:6af:53bc:7311 with SMTP id h15-20020a05620a400f00b006af53bc7311mr22096158qko.305.1658260469647;
        Tue, 19 Jul 2022 12:54:29 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com. [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id q14-20020ac8734e000000b0031eb5f07b95sm11108588qtp.57.2022.07.19.12.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 12:54:28 -0700 (PDT)
Date: Tue, 19 Jul 2022 15:54:26 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	Markus Hoffrogge <mhoffrogge@gmail.com>,
	Michal Suchanek <msuchanek@suse.de>
Subject: Re: Pull request: u-boot-sunxi/master for v2022.10
Message-ID: <20220719195426.GL1146598@bill-the-cat>
References: <20220719135102.1497678-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GdngOFRSbIuZDyer"
Content-Disposition: inline
In-Reply-To: <20220719135102.1497678-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--GdngOFRSbIuZDyer
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 02:51:02PM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the sunxi/master branch, containing the first part of the
> 2022.10 changes.
>=20
> One prominent feature is the restructering of the clock driver, which
> allows to end up with one actual driver for all variants, although we
> still only compile in support for one SoC.
> Also contained are some initial SPI fixes, which should fix some
> problems, and enable SPI flash support for the F1C100s SoC. Those
> patches revealed more problems, I will queue fixes later on, but for
> now it should at least still work.
> Apart from some smaller fixes (for instance for NAND operation), there
> is also preparation for the upcoming Allwinner D1 support, in form of
> the USB PHY driver. There are more driver support patches to come.
>=20
> The gitlab CI completed successfully, including the build test for all
> 160 sunxi boards. I also boot tested on a few boards, but didn't have
> time for more elaborate tests this time.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> The following changes since commit 26f6f7fb5c0651d65afdee6d8ed36063606179=
a8:
>=20
>   Merge branch '2022-07-14-migrate-wiki-to-sphinx' (2022-07-14 18:43:51 -=
0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 25ba5be1c2b6324917254f0c22df1ad9d3d3c9e7:
>=20
>   phy: sun4i-usb: Add D1 variant (2022-07-18 23:48:37 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--GdngOFRSbIuZDyer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmLXC+8ACgkQFHw5/5Y0
tyxojwwAtSNCo30e8TY/mkTbcD6Bfax2I0jwKWvT0ryM03VfVp8rw7ZBhjJmMJ4f
zLCpKxfyShOZgHxDVM9LCVsdInnUH2PrZN3mkBSsAnMYsJ97MoGi2Q+3ikAPGI3p
rD2sEjUYBPYMF8ZDbeZf2xTH/G0PsKyeLKjs+mcNNvJqhjNHWn3iPzREgI7DL7Kw
j9KAG5RarSTcSHgsaBZNwvcMHoPpUuxO3ASow/Dd67WWguQqtBnrflRq0bqltDgk
HxPpBlkXHMxwsiXFmxiNLOp8IMi8pEYBRFbG0r4UO2UwDM+pmMDIGJ4Hdn66/fUL
p07C24CGjVM0oJMQxVzy0y4pZ3p5VskONFEj6Z0oUQCNn/uAidMox4YgNJyPnoHh
whvZqbbsJaBwG4ft+Cu28BGHaGLcsGJSv40xOmTU2jxSJrC1V77O2nubxEh3OmYd
F5WY06PMCT45S+G8AUOs4wcwNupK26ZaI9teNBJT/XQAXFJygGUz4/OMa6rMje5E
9d7KbalW
=4yLo
-----END PGP SIGNATURE-----

--GdngOFRSbIuZDyer--
