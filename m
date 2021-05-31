Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8700B72
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 18:59:39 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id h24so8506120qtm.12
        for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0Bj3EXA5eXVelz5o13GutbU3HKUebMCicTKBU5T9KC8=;
        b=EFUvigUHxbjySYXNZk1SO/K98owwzVtmRgLXEaBaMtBGljxXnr/qXC6mDjy05u0vly
         vZY8NulUG+9RmRYSrUD+VvSTZdw4fnZczhVSU1I/q1w6E7jO278WMjWLQfqa4hqM3NoN
         j5HkrgP6i5NT64+igYXo7GYRn4hs8W8Tar44I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0Bj3EXA5eXVelz5o13GutbU3HKUebMCicTKBU5T9KC8=;
        b=Gao/fnD6k6SQXDsSKYrDJG/+BH4y6P0XRi852678gkjtbZAzW5yMeFbd6EtjVIdOdn
         A2zEKpI6FvSRjKjleGlB7GP3RtS1Uczi+BXEZ32Frmh+/R8J9vztx8SY7K897xaD7vaY
         vGs468EK9A3sP8Bzv98TGRGENF62Q8Y3xK3Xb8AAT2HQBobvIh/vShG7bntxozv18xhz
         ItdzGEyHQHfTIfRR7CSyPYY//FJPGdmriweLqE1TkWLX2JW7tRjjtELbsJAk+2k+ffR/
         M/XSYYw0FkUvtjCkQv6Gm5+MkYUTGi5LSXLyQrSrVezU2jjnH1ytdXhx/SpcqXUBThUL
         a+aQ==
X-Gm-Message-State: AOAM532H/aEOXejvPdLfRbu8h3FzfsQv14erzmhPgOxacOWTSFy+W7lf
	MhKhHBWtogf7qUaOvCL7pAMd8A==
X-Google-Smtp-Source: ABdhPJyUXfplXoG/kZxIktim9kH0DeNDOPcPWd95Wn+xHp+1QkL5X9iruLMNFpGeUVDom9He0W5ekw==
X-Received: by 2002:a05:622a:392:: with SMTP id j18mr16240865qtx.6.1622487577149;
        Mon, 31 May 2021 11:59:37 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b01-cbda-004d-7bb5-fc33-ef22.res6.spectrum.com. [2603:6081:7b01:cbda:4d:7bb5:fc33:ef22])
        by smtp.gmail.com with ESMTPSA id j30sm9997735qki.60.2021.05.31.11.59.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 May 2021 11:59:36 -0700 (PDT)
Date: Mon, 31 May 2021 14:59:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Simon Baatz <gmbnomis@gmail.com>, linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com
Subject: Re: Pull request: u-boot-sunxi/master for v2021.07
Message-ID: <20210531185934.GA14385@bill-the-cat>
References: <20210531002345.1335-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <20210531002345.1335-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 01:23:45AM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the master branch from u-boot-sunxi, containing the fix
> to bring back the SD card as MMC0. In the long run we are looking into a
> more robust solution, but for now we need to fix this, as this breaks
> the user experience left, right, and centre.
> Also add the one MAINTAINERS path addition from Samuel.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit ffd810487ec2ff6095edf3f3d058d7ed6eb85f=
f3:
>=20
>   Merge tag 'u-boot-stm32-20210528' of https://source.denx.de/u-boot/cust=
odians/u-boot-stm (2021-05-28 14:11:06 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to f264e796c06d7ce6c039bfc7255390309cbc5191:
>=20
>   MAINTAINERS: Add allwinner/sunxi driver directories (2021-05-31 00:39:5=
4 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmC1Mg8ACgkQFHw5/5Y0
tyzm7gv+KfKScNJqSXEIGc9amWZvSJ4fuiT1pKXC5M2gw8MAvbodFQSKwpaOBFgV
l7Z9akfGUG7WLbty05683W1CxIe4f49a1nbNNVkbFcZv4FOHkIe/9M+kHsJ4B6BD
kLqxygAlrWlw8QDYH9CxLoWZfCquEzD+GaBQe+9aOlMus+4fw7dA6mcnUc9COfWh
667kDYnEaSsxvQqQWSoefD4z4SDN4c/V0l7ahDGYtjMu3IkytIupxp1BJOXRTSYI
ArFm4HlxeRym2SZrdwgX1wxGXlGaGFjLj9WGxJXkg3rIsmzUGMk2NLDhmrwRoS84
zDA0pZyKU4kALNmZPS6cL69sR04Fwefbjkz1S/bww+/P4tBT7+fdGUXLPJUSYBgZ
q6zEi3QtNn91tw8jh85ZXCmXk6kRHYWDxPqbLD4faxnvrKGJswCCBE5+pEa/02yd
JXGquDH4bBE69qBfBJZxwoR+Q1IByFx9NzRyyFLAPMkdyEkJADwfuqDJoAim9X/n
7A6LP0zl
=ymwI
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
