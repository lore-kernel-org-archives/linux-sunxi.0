Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E62F21
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Feb 2022 13:07:15 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id o10so4694622qkg.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Feb 2022 05:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TABvgR1gXslwUnHGE9z5F1pcL066abJ22TmuCZ9qqXM=;
        b=VMhQjL7Dp6QSyVL7hXittS8iPzs3nKhgDSOoqEoOVZbtFg7YgxaCfX4bde+NQRWS5b
         uncpWwkqvtytdynMjF+jQy1tZyxpijROJv5Uul7eGUrQV4qaCusyUjvR8Qs1Z0UzP7ws
         k5XQr4OI84V6bIrWr0WBGQmon/JtKLPXTdgA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TABvgR1gXslwUnHGE9z5F1pcL066abJ22TmuCZ9qqXM=;
        b=jkGF4xnsSxS6PdNrvN4g8St4q2hIHGhMa8sET9LUDzX4ns36I8gSIbkcv7pWUSkduE
         iUaLGy0hzg171I74jiD7f3lP/XWoCC1eysS8bpvgiVFg8u4RgpdNL9SDZw2s1FFMBoN7
         lihB+F8RvTjk8hLy5yr7NUlqUMg7ZR9E7pwODzh6QdOGz4nSDCr+ZDbCZ0emAGNCniuW
         gfwQ/gb3jOkYcPnAwn9L7hVR0IJYmL1BDA6gAvHDtqR1U9FIugOEABGlVUSpAHiSBlsf
         LtWssetqwK3YbI43MifzRlBlQ9SXsbjgQ+tvIKZnJOtTkcCbuKwi40fZLAZZDKQsQFwL
         arzg==
X-Gm-Message-State: AOAM530ucfnIy6XyTKgoiERQ9tCWCcbO93SejyP/st783EnbLdZfFmDm
	2ekewSeQl668e8SWJ3XORmGyYA==
X-Google-Smtp-Source: ABdhPJz10Y7/mcjXBddk/cneCk+Pu6i9C89RENOKH72X6+BpJggv+kvtWtbdYs6G3iWBr5gKvuCEyg==
X-Received: by 2002:a05:620a:25d2:: with SMTP id y18mr1408803qko.522.1643980034493;
        Fri, 04 Feb 2022 05:07:14 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com. [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
        by smtp.gmail.com with ESMTPSA id bm23sm1021464qkb.25.2022.02.04.05.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 05:07:13 -0800 (PST)
Date: Fri, 4 Feb 2022 08:07:11 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Simon Glass <sjg@chromium.org>,
	Samuel Holland <samuel@sholland.org>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	George Hilliard <thirtythreeforty@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for 2022.04 (part 2)
Message-ID: <20220204130711.GO7515@bill-the-cat>
References: <20220204013311.3235-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uXqDGoDRqNOsF677"
Content-Disposition: inline
In-Reply-To: <20220204013311.3235-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--uXqDGoDRqNOsF677
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 04, 2022 at 01:33:11AM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> this is the promised second part of the sunxi PR for 2022.04, albeit
> technially outside of the merge window. We were working on this full
> steam since the beginning of the year, and it deserves to be merged,
> I think.
> The main attraction is support for the F1C100s SoC, which sports a
> venerable ARM926 core. Support for this SoC and the LicheePi Nano board
> has been in Linux for years, and U-Boot patches were posted mid last
> year already.
> The new SoC using ARMv5 also means that the bulk of the new code should
> not touch any existing boards, although we did some refactorings first,
> of course, which actually cleans up some existing sunxi code.
>=20
> Compile tested for all 160 sunxi boards, and briefly tested on BananaPi M=
1,
> OrangePi Zero, Pine64 and Pine-H64. Tested by others on their boards,
> including F1C100s and F1C200s devices.

So, this failed CI at first because of no MAINTAINERS entry for
'licheepi_nano' but I've fixed that up.  As a custodian, you can turn on
CI runs for the sunxi tree by, and I don't have the reference at hand
sorry, going through the project menu under settings -> ci/cd and
enabling group runners.  That said:

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 006fddde01da7e8b3c7cad4a35f3245edc894a=
b4:
>=20
>   Merge https://gitlab.denx.de/u-boot/custodians/u-boot-fsl-qoriq (2022-0=
2-02 09:16:49 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to b6ffd58e45043b822844345d4ca9b2cb1e2917b7:
>=20
>   configs: sunxi: Add support for Lichee Pi Nano (2022-02-04 00:09:57 +00=
00)

Applied to u-boot/master, thanks!

--=20
Tom

--uXqDGoDRqNOsF677
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmH9JPgACgkQFHw5/5Y0
tywcNwv/fb0SvxK77RS/FoPolsXBD9xC33LzuitIZJf5sh81X3F0ETwn0eJxkh4n
mn2zo0zQ2Hmj+zlE4P+7SbUbHvxQXKjAeMJFHBFC1pp2l1rbbSw0vpP0olP8kEzr
ZdPB6UUfEBuftfEjODil06lcl/o8fV9U42CkRPAIpATnJSQNlkqaacGZqJrJgvT4
vYs0VhlUaUyDUwpQOk12zC4Mizv2FNGS+oUXFLAqNp549ba5qZuYB5GkyMQYIl2Y
Q2nnXwEAWR/CbnwI8+DfjCIYBszG5IefroH0Xmv2/zIZoZE+2jph66N+nJfnkOrd
Fw9NVTpyrDhH84dhRTo5c3QI07nkm7v1w/pNP/GLvQ4phArIsJfcfd9ocxxv8ZEZ
NdLLAcVHYon5OSb8WOuH6iriO73Bh1qazr1gVS75t51fZygnmLhwI8ZO1ssSacO/
B/RXzKKO+Whixc4LtPOq6kF+Ck8ZpY+jWs1oKD2q1WVeFCOb1EBTolKIX2/JHHfW
SQ4xbo4B
=+UCw
-----END PGP SIGNATURE-----

--uXqDGoDRqNOsF677--
