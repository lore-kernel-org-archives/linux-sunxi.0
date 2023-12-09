Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA7187C
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Dec 2023 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="TFLsMbED"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5cd81e76164so28084827b3.1
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Dec 2023 05:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702129343; x=1702734143; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k07CcomtJDYPb55SlJ6Z885uOCBygGmPBpbd7cdpYtg=;
        b=TFLsMbEDQzyaihSbUJ5XcoH40WtwQtQoKNRNs7T3byWeTBIG/fDFb+gTkbl4o7TuKT
         1O4VI7PNYZYMDggtIf6xpOQF7D9wYwL+lQfYR8+NpnDBptN0e89+RMR1up9YgNdicnwy
         YPbc5vZC4biY4G5XWWL8iEyEbHaI8o+bwka6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702129343; x=1702734143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k07CcomtJDYPb55SlJ6Z885uOCBygGmPBpbd7cdpYtg=;
        b=uDRRdPH6pUNYm3OG4oTCQaKQTESjBwarDz3BFMXk/Bi7G8fC2OzpX+0TQYiUQmOsbQ
         9A/YJuAyfIo+Lz5GgOQB85xyRuFJw/8k7ZhvQlWCLj44/usFB6j8TwnBLIU4ZaxvXm6p
         fbLDuLXiIwDKPUQpPdbEPDz+ScliudRd7oProGcdm5Y49Bu0veGv+whLq1g3JjHbGKCD
         Twx7uSRKbFEKUkbKdKvws8D3lX+7bhrsSP7CxgOjMmhql2baCu+kO43UJC4flemfokiT
         td8Zgcen4Wa9NZF+xmAy0Q12SyxYYI4xBtUG+Ih/KwLFD5QNw8cmnzSRGXQa5bYm3glO
         OOig==
X-Gm-Message-State: AOJu0YzNtOffSRcQFqze5ZUwRlYYMMdBWHK/KEjfgq5MAlraFYUfXQux
	i2WzVtQbDhaKjDeajd8bkf0z5A==
X-Google-Smtp-Source: AGHT+IF6OZn7n87mpGkxTMEcvQAc2FyXdNmn5AnL4O8ohep6WaK64Y5xmtBazy28DlCXMZtVYFc8lg==
X-Received: by 2002:a0d:d956:0:b0:5d7:1940:dd63 with SMTP id b83-20020a0dd956000000b005d71940dd63mr997282ywe.57.1702129342761;
        Sat, 09 Dec 2023 05:42:22 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-b2bd-da43-c83a-80e1.res6.spectrum.com. [2603:6081:7b00:6400:b2bd:da43:c83a:80e1])
        by smtp.gmail.com with ESMTPSA id p140-20020a0de692000000b005d14e254367sm1466292ywe.80.2023.12.09.05.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 05:42:22 -0800 (PST)
Date: Sat, 9 Dec 2023 08:42:20 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Bob McChesney <bob@electricworry.net>,
	Stephen Graf <stephen.graf@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for v2024.01
Message-ID: <20231209134220.GA2513409@bill-the-cat>
References: <20231207135240.2070795-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8MFTg2JB2LiRfRMF"
Content-Disposition: inline
In-Reply-To: <20231207135240.2070795-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--8MFTg2JB2LiRfRMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 01:52:40PM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the hopefully final sunxi changes for this cycle:
>=20
> the first four patches are actual fixes. The last three patches add
> support for the apparently popular OrangePi Zero 3 board: multiple
> people seem to be champing at the bit, so I'd rather give them
> something real instead of people using random trees they found on the
> Internet. It's actually mostly the new defconfig file anyway, so the
> chances for regressions are very slim.
>=20
> Gitlab CI passed, and multiple people booted that on the Zero 3 board.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 2f0282922b2c458eea7f85c500a948a587437b=
63:
>=20
>   Prepare v2024.01-rc4 (2023-12-04 13:46:56 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to d2e1cc69a24719e9939a84dc42bdf281af6ec35d:
>=20
>   sunxi: H616: Add OrangePi Zero 3 board support (2023-12-06 23:09:17 +00=
00)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--8MFTg2JB2LiRfRMF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmV0brYACgkQFHw5/5Y0
tyzhiQv6A45ZVWEKORJ+6bohUsCjBAYCh2w8nThigXsaLKUrM/cVbTNmDrfau7xL
LfId0sDyJKXQ4s+O0daSsCO+s0LZK2nV32kQxaRKPjGQ0uaUYz75rlCji+OkshvM
dzePWMmgkDBNrYQCGfZs+yTifoOWvaQ3N8XHCT9Fc3jSQ6/B6TuU1tHz7Mwm3XkE
TVKQqBhQQks2T0lUqfzk7h8vHzbyou3TcdWjZrvxZfe4f/Jfvit5TOyiO89TNyxz
UZNZWf9/RswXTgaIwVnbPG3RDST23lwkObbKnBrULs+tW/cBOI3eFeZ/r74tFeSZ
kUL6y6LsWGpUOMnaXsLdxIQU+pilcLgFxyBR4KubjA6DibxLVfJv5ELHFgVChF5p
yuaCWGEpjrRLPoqqVjrYpXdsSIVcCtIQ9SyW1H5kvzAA5SUnc83gAp9Rg42A2plS
R1I7I1jcpYl2FNkzad69Lzr67AY+yMHpm6ISHuTuaulA90K/pFnz+IxsVuFpC47C
KU3SR6o5
=wHrd
-----END PGP SIGNATURE-----

--8MFTg2JB2LiRfRMF--
