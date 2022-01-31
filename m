Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785BB2CA4
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 02:27:16 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id i19so11581467qvx.12
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 18:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ngk8jvWLj3Za0mUF8RENCe9Xd0wCoe7alukpo0cK3Zg=;
        b=duoPgmvWpkyLHpWioH+/DgSgOrbSV0GaCfeNn5LUmhpaWAEgTagsdey8Ps+FLehZWH
         ArX6jqLDj+fg7qCO0tafM17p45aa9ntF8/dXOw+Jm2tlSvoiIWykNNSU+zZoJRtN2+R8
         Q1F48V4RnGYY98PxMPiBMXImLWpuwQoHrH3hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ngk8jvWLj3Za0mUF8RENCe9Xd0wCoe7alukpo0cK3Zg=;
        b=lprlLs3SVqvSlx2GJdZBbzaLwdTduqnLH903w9a0LHA/zcUY00BkAx2lFSvcKMiPPt
         mUSWfK86/CVEbabcOD+l/hsvhvVrL6RFV3HnxDINk/0lxwAzYp4TZb0TW5ymilzelSEV
         39Y8la/pgQnGMXGrDVKUjD3kIzz4Wn8cyuQ6amCs9o74n1l22QTc7kF0bYLzSgnXNUGF
         hYKqGYFCXkcCDqS4nD3g3q706mqLupfvQMFGGIlmW5a3X5xiGE1ewTMBTfo3Sb2A8ylY
         uwB5nBoCLsg82jRWU6r+ntPp20UrakigPpYMJBfXRa7FVMv9EMlt2JaPzPmK3Gi9Pv30
         NaFg==
X-Gm-Message-State: AOAM533frXFU5Gc22matmdmh/wzu5YPA9OmQqJyhItZZe9Orr/1wpiAJ
	AcCI9wM0x2RxAD0g4TdyXKCN9A==
X-Google-Smtp-Source: ABdhPJzGCGNUlvIEMw4Zqi+3X55FK8XgU9K9MjceNYSgR2v7hZQvD2rEZcvmoSgNHsQkRXmKoWRXog==
X-Received: by 2002:a05:6214:e4c:: with SMTP id o12mr15975099qvc.57.1643596035344;
        Sun, 30 Jan 2022 18:27:15 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com. [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
        by smtp.gmail.com with ESMTPSA id d22sm1450813qkn.112.2022.01.30.18.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 18:27:14 -0800 (PST)
Date: Sun, 30 Jan 2022 21:27:12 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Daniel Wagenknecht <dwagenk@mailbox.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for 2022.04
Message-ID: <20220131022712.GF7515@bill-the-cat>
References: <20220130221056.6659-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WiG3HOh2BFypK78Q"
Content-Disposition: inline
In-Reply-To: <20220130221056.6659-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--WiG3HOh2BFypK78Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 30, 2022 at 10:10:56PM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> a bit delayed, the first batch of the sunxi pull request for this cycle.
> This is mostly collecting some patches that were lying around for a while,
> plus some recent fixes. Nothing too exciting at this point, but of course
> they should be merged nevertheless.
> There is the much bigger F1C100s SoC support coming up, which I hope to be
> able to send in the next few days, along with the removal of sunxi's
> lowlevel_init usage.
>=20
> Compile tested for all 159 sunxi boards, plus briefly tested on BananaPi =
M1,
> OrangePi Zero, Pine64 and Pine-H64.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 98a90b2730696c1ba773359b7944f6685ae133=
44:
>=20
>   Merge branch '2022-01-28-assorted-fixes' (2022-01-29 13:42:58 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 50d5c6428fc280c095b0edd1a612b3661b5db77d:
>=20
>   mkimage: sunxi_egon: Allow overriding the padding size (2022-01-30 01:2=
5:00 +0000)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--WiG3HOh2BFypK78Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmH3SP0ACgkQFHw5/5Y0
tyxf0Qv/aSxh5j9FoVqZc8oboSYIC+VCv0DaEMqytbg3VdolcCfFFIudBXLQ4rBF
FDo76XW8LcTdsehql8MzNWw8/K8FVp5PHV70t+6DAOxp8cOXspp2te8dppjjQoZ/
ha46l3Mj7evtBg5OihE2TAVkhayYmgsWSBz7NhYaCSM5RQ2pN+soRPM7LbnYn3QY
Jr6s1TwBscfB4GKDGP/LA/VqvN4l5MFYp/SYwkNbGxqILhKd0VooKVtUdeolUJQD
wF+JWAIsSniMBsIuWUgnT/ppXJ1BhMtmgTF4Yyo1ISwatDBkCW/R9bA3z/lQIRwN
Pq2DAVUAU+rVA0nRaeYG31HeOrE29mlS/f4wn4/NH/Lcmy35rB0W+82uf4iS/JF3
iThcq6HIwb8twdom5NgKrPxTs91+6Inm79NzcXeM1272hRCWRos+0n56EfaDPm/z
VnOboU5I6hDZMM8V2HYqR+YJtn5kZatTGU3DV8wfDvYKX//StzyQbWurOnuEO5PJ
MrsE7W8T
=zumY
-----END PGP SIGNATURE-----

--WiG3HOh2BFypK78Q--
