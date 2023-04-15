Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9605BA29
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Apr 2023 05:07:24 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id cm23so11366080qtb.3
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Apr 2023 22:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1681535243; x=1684127243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lPOp0UPVASB7SkI1EX8IysvmfZ+t0ycmVj775oCx/xw=;
        b=QPSZsFvVMf0EN1g0WRhx8lo9rkBWSB6OCOLUw/8M5KN5mXw/obUF0kWTxAZAwfaTll
         y/PAS26EomGJ3K9TNA54yUGZa4hZ4L7/vilQlw3YsTfEOnMyMJF3OxJ/+6u4fRZHl746
         PuLWl6n3C/G2H10a9TsxuSjurCD/mfK7IDnV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681535243; x=1684127243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPOp0UPVASB7SkI1EX8IysvmfZ+t0ycmVj775oCx/xw=;
        b=E57W3a3v4d8Hz8MUzTkCbv1P3ks+kx0JHxIth86CSwNm2pGjl4H/h4TRf0D0Ep7RWH
         0PhQmTU0otKINPjGvAtS9UvSP7xdALw2UX3XMolMLb1NqqqIPN96KapfNld43DYtNS8a
         Pc9Cn1RNmDbW6s94l4erVSkzrK4kcx3pLhBf2pGlHb7YOTPWVbqic2ftC4//fpxJ87vD
         1z5jSEJ57MF4/7N6THT6V8cQKWl5J1cx+dZzsfN0ozMSXc47n2W9C+J4xX879YibjaI8
         OWwm9/wXT4RDnEXPJZpoMhuBjFkGO93Q/js/+s04y8zHEVVEHl03tht59P9ptn86PqmD
         BugQ==
X-Gm-Message-State: AAQBX9dFxIQCJxvSyWPCNsM8dMwdpJjudYKnsslenajube1g83ZGusBA
	6OUD36jYs/2tNXWVJVR9GPx7ZQ==
X-Google-Smtp-Source: AKy350Z4J+FLl3nyuYmPqceF5bZKUZ1NegmHDPcT4jF0ZZn2Q+akLCbnHolBOAvUzIOUFaPiOPAJQQ==
X-Received: by 2002:a05:622a:11cc:b0:3bd:d2f:8de4 with SMTP id n12-20020a05622a11cc00b003bd0d2f8de4mr12117480qtk.15.1681535243476;
        Fri, 14 Apr 2023 22:07:23 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-700d-debb-9345-f658.res6.spectrum.com. [2603:6081:7b00:6400:700d:debb:9345:f658])
        by smtp.gmail.com with ESMTPSA id o19-20020ac84293000000b003e390b48958sm1713647qtl.55.2023.04.14.22.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 22:07:23 -0700 (PDT)
Date: Sat, 15 Apr 2023 01:07:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: Pull request: u-boot-sunxi/master for v2023.07
Message-ID: <20230415050721.GA1134230@bill-the-cat>
References: <20230413102048.1627141-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JlyJ+6YPtgGcA0yV"
Content-Disposition: inline
In-Reply-To: <20230413102048.1627141-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--JlyJ+6YPtgGcA0yV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 11:20:48AM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the sunxi/master branch, containing the first part of the
> 2023.07 changes.
>=20
> The biggest change is some refactoring of the H616 DRAM driver, which
> allows better fine-tuning for each board, and is the base for pending
> LPDDR3 and LPDDR4 support, needed by new boards.
> The sun8i-emac Ethernet driver sees some refactoring that enables it for
> the Allwinner D1 EMAC IP. The sunxi HDMI driver is now using more DT
> properties. Also the early SPL code now supports some odd H616 SoC
> variant.
>=20
> There are some more patches pending, that require the final review
> touches and some testing, I will send a separate PR for them later.
>=20
> The gitlab CI completed successfully, and I boot tested a few boards with
> different SoCs, via FEL and SD card, into Linux.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> The following changes since commit 9e804638bfe2693a908abf066ff66c251572af=
a7:
>=20
>   Merge tag 'for-v2023-07-rc1' of https://source.denx.de/u-boot/custodian=
s/u-boot-i2c (2023-04-11 09:29:28 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 5fc892e83f34a0b082ff46d3cc411d6813c1f726:
>=20
>   sunxi: A64: drop boot0 header reservation (2023-04-12 00:17:22 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--JlyJ+6YPtgGcA0yV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmQ6MQkACgkQFHw5/5Y0
tyyzrgv/dNCSGyzo5+bIJVpj8ZwdtpXtHOWzd339Q877Z6GOZ4ZeQwkvICPcLtHd
a41G/nqm7s+DrF+M2/3OQV8Jy5DF72IUU1osGEksfnn8EdGvSF/RH90f1qmAxmSF
VyVeK08/dlihTBHZb00im9aaVNuxABaybXIFypJFPHzWXptTd5zbOL6fYktzakWW
imnx6AG0Yu4fdS7hou34WTm4JsmLcdIdH71PLmJmU6uRn3atnRF1FDUugmE/HRxD
jyc+u1o3KgrFBu3v0J/MZx6p+Oh+o9jBKNTH6I/+/yKi88ucNdWIlEQQoSPE0HfV
eu/InejGG4iHfr14K9koyK9xbRu/v0Ba/4S8nquYC+NGXncx9jIesjn0/oIkR0Ce
SEHIefWdGE/1skcYJO+3hxyzjUBN9/GzhHRA5ZSjpLXllacELCvZ1JAqpYTsUzan
CVH+pmWKDUTXscVPNYgfOzj44rmnJx5DtlmPpPNQvGHfhYokvt7jlp6w3jTXGRXS
kegeMdM0
=c1Zl
-----END PGP SIGNATURE-----

--JlyJ+6YPtgGcA0yV--
