Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7F5EC4
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 13:27:04 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id p63so3054483qkf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=weOoTPSP1ZH0lC+jy0QgeZIVrCv9j5HbfS62GUWtsGQ=;
        b=A04lsDfMbmDmBWWdU2dOpjDNYqen4BhksYrQ4Owm3u9rXQJLnb32jEvDsjg4uKIUmC
         Yo7DeblXtsoxN9PwmVLepmh2JHasfTkmFgNNTZwFj7HGmdOdnBEDEZzTJAJNPrjmEctK
         yS+J4esAp1aUE+XPQ20XN1EQxmcH59LTuNRMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=weOoTPSP1ZH0lC+jy0QgeZIVrCv9j5HbfS62GUWtsGQ=;
        b=Up/S5Lbv+qOlB1PUoXhVgY1XPVwL40kWVwkAdlyMN/6n9z91jgi3e45oFrf02n+Moz
         i0Fe/YMY/mqd6xMG6KMh59lMWGaw2Pg1RFef0tXraiSE6c2A03j538j/t6EgdeYJMLqU
         rT/iRJbgLho2l0JcRkYrmJ7DoY7b9xQkjLjVQn9rsQGhewGsYzFYZzfgvw5ic7yUufs0
         Og6eQWqyMD5m1TEw3VHTEh5Xu0tf+KkB6Rjv1HFE2IyGwUuOtQOEVfNfy32AoONlGdT3
         qE1cNqTBrcrxEAbH0hXe9iF7xOw0d+n21/P4ho6dxi4jpo4OJUE6mRuWN3ZrXB2d8bmp
         HjOQ==
X-Gm-Message-State: AOAM53266HYZPYLdRQ8VcdtsMHVp0JYqwwAnbWJw2gcE6XZkA4splez4
	XDPnMRH/fyO+xyI+bKQLTzbAAw==
X-Google-Smtp-Source: ABdhPJxJcfxi6THA6/RD1+MU2k4qKAlr3llQXW7T/JjPG5XhM9+D8ZcJ8fY9fZruPgaJOBB5qWW7QQ==
X-Received: by 2002:a05:620a:318b:b0:6a5:71b6:e316 with SMTP id bi11-20020a05620a318b00b006a571b6e316mr6318440qkb.433.1653485223037;
        Wed, 25 May 2022 06:27:03 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-25fd-0000-0000-0000-1003.res6.spectrum.com. [2603:6081:7b00:25fd::1003])
        by smtp.gmail.com with ESMTPSA id w11-20020ac84d0b000000b002f914fa980bsm1177987qtv.79.2022.05.25.06.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 06:27:02 -0700 (PDT)
Date: Wed, 25 May 2022 09:26:59 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master fixes for v2022.07
Message-ID: <20220525132659.GK13239@bill-the-cat>
References: <20220525003021.31871-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UBYeLQbK9sqbzZRV"
Content-Disposition: inline
In-Reply-To: <20220525003021.31871-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--UBYeLQbK9sqbzZRV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 01:30:21AM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the master branch from u-boot-sunxi, containing fixes and
> updates for 2022.07.
> The bulk of it is (finally!) some DT sync from the kernel. We refrained
> from syncing one incompatible change, as this would spoil booting Linux
> kernels before v5.13 with U-Boot's DT (via UEFI, for instance).
> I test booted Linux v5.18 and v5.4 with that new DT on some boards, and
> the headless peripherals (MMC, USB, Ethernet) seemed to work.
> The rest are fixes:
> - silencing missing clock warnings due to the new pinctrl driver
> - fixing "UART0 on PortF", allowing UART access through the SD card pins
> - add an F1C100s clock driver, to enable MMC support (SPI comes later)
> - some cleanups for CONS_INDEX_n in Kconfig
>=20
> Tested on BananaPi-M1, Pine64-LTS, Pine-H64, X96-Mate (H616) and
> OrangePi-Zero.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 6f00b97d7e5760d92566317dde6c4b92247908=
27:
>=20
>   Merge https://source.denx.de/u-boot/custodians/u-boot-usb (2022-05-20 2=
2:07:56 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 7495051219b64ec0e8fac8930586dc10666530da:
>=20
>   serial: Remove obsolete CONS_INDEX_n Kconfig options (2022-05-24 01:46:=
06 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--UBYeLQbK9sqbzZRV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmKOLp0ACgkQFHw5/5Y0
tywOdgwAuLol4qAq6LKu+kCA5iLq4YqFSjXSJR5QKTq2a3xTz3XR+QIJbOlbeaDI
z7LcVNGSIdM+Gi80GE7FM/WYbOs+TvW97TtI86kOr4TNzaxMuL5ay7DSSxSpg8C+
JIrUwi20QfrH2AOR/bpC+xoQKJItibY7g7Uyf24hqnHJyoS1RX8QLmoSGYLT+e/n
sv/RTO+ZHkSWcxwvLmTtmaHUsTAp48xi1TIUjsC0dmRcKbN1KMQnsc9A/jiLiUQ/
V4+6am5lYPnevSDYLiv8jg6AxRnQ/ALrWc7dE/7mhkBofa2H3V0h2enhukAs+mIQ
rRVvIfSfCafC2bnKvF1awXMpnb14ZWJZDVEPE5q6tdTroSWm6ZBC3Lc1KvTp2qYc
W8/DYyw7JB8zHLabkn6vhaeflOad+i2drmlWox6imvRNIkOvPw2MVZ+DVNS/ugxw
G8tNYlsZKCYFIKR/qqPMniA+ZdvajpjlJe4VJNhlKFMd4LxtrqoihABJ7iIchKuj
BoXeJX41
=4uYs
-----END PGP SIGNATURE-----

--UBYeLQbK9sqbzZRV--
