Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D47E
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Oct 2022 19:02:52 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id t16so307927qvm.9
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Oct 2022 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I2Ip7Djv0Q9eFymNDGQP94+4ys1J4ZSzCOsoH7hICZE=;
        b=sMQfE6+aBPAmEOo2JqP2ZBxyfYQiEwmhVHboEqHdEaiveKNoxGITSzrebxDoa3wGOR
         ZJWSQqZ+jiK0NO257fDRQYf5q7WLPnEtsUrRFOlwEHim2+Ilg9I7X0MyYo+/P6ESkQYe
         5i8p6limhnksAuXyYZqkOThXc2XxbgHOQCO/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2Ip7Djv0Q9eFymNDGQP94+4ys1J4ZSzCOsoH7hICZE=;
        b=1UGhBRtzjvvxCwkN6eeCvzJFXOPFleNSmoH4bl6QhF0K3os9TR0fV8tlfpW7ojLgOI
         tREAp3HrQW1sWzrAXEG36azjuvXuEM+Q8UaJ1qSGQ7JrDrx4QGGley3nLmzP5RSZI/GW
         i2wbuHKLQUzplfPJl6x0HDVdrUmzXU0p/HYe+URVB9VMG+vo/1EHu4YdDy9T3slCSvO3
         J1eaL1ASeDrh6saKGyFArM/PEanuTTNrZoDX3eYZUrHQTYAO8bafkl6eqRKN60l7U0wR
         9OLNW8gjtREtLmVurkbKbE9/BgwAa45x/aOXcDrVqdBpvPhemy5dMNuf+oJh5Q/ZaqoG
         urYw==
X-Gm-Message-State: ACrzQf1EzEGdXMXy7OCKSQYa5yiXloAklwibURmVKKDk5nii6k2aD3ju
	V4JKctmFtk5LjBBD3K5bkdnBpQ==
X-Google-Smtp-Source: AMsMyM4lkHvVcO3abdbtPm5tEuemrvxFFLg/ueJ2UGGa8jfjUXgTtLX+qbHH4jf8HK9Wrh76dPR8iw==
X-Received: by 2002:a05:6214:c88:b0:4b1:7083:2fca with SMTP id r8-20020a0562140c8800b004b170832fcamr12868686qvr.3.1666292571725;
        Thu, 20 Oct 2022 12:02:51 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-6da6-ebf4-33cc-5bbb.res6.spectrum.com. [2603:6081:7b00:6400:6da6:ebf4:33cc:5bbb])
        by smtp.gmail.com with ESMTPSA id c8-20020a05620a268800b006cfaee39ccesm7855338qkp.114.2022.10.20.12.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 12:02:51 -0700 (PDT)
Date: Thu, 20 Oct 2022 15:02:49 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Icenowy Zheng <uwu@icenowy.me>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: Pull request: u-boot-sunxi/master for 2023.01
Message-ID: <20221020190249.GS2020586@bill-the-cat>
References: <20221019235427.8253-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LtMyRIzzNoTBiuto"
Content-Disposition: inline
In-Reply-To: <20221019235427.8253-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--LtMyRIzzNoTBiuto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 12:54:27AM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the first bunch of the sunxi pull request for this cycle.
> Beside some rather unexciting sync of the DTs from the kernel tree, and
> some Kconfig cleanup, there are some improvements for the ARMv5 Allwinner
> family, to support boards with the F1C200s (64MB DRAM) better. We will
> get actual board support as soon as the DTs have passed the Linux review
> process.
> There is also support for the X96 Mate TV Box, featuring the H616 SoC and
> a full 4GB of DRAM.
> Also we found the secret to enable SPI booting on the H616 (pin PC5 must
> be pulled to GND), so the SPI boot support patch is now good to go.
>=20
> Passed the gitlab CI, plus briefly tested on Pine64-LTS, LicheePi Nano,
> X96 Mate and OrangePi Zero.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit e2ff1d0fa777b11ad6b26432cb7613ab433b15=
d6:
>=20
>   Merge tag 'efi-2023-01-rc1-3' of https://source.denx.de/u-boot/custodia=
ns/u-boot-efi (2022-10-16 20:23:47 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 843ed983a07ee5d8d4e4ac5baa39fc53f12b5f33:
>=20
>   suniv: add UART1 support (2022-10-19 14:15:02 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--LtMyRIzzNoTBiuto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNRm1MACgkQFHw5/5Y0
tyx73wwApeOCM3lFDgtm/wg/Hxk6mk5TaBFnmGif7Y3fO1kXIQDPY8k/Ei/OSqb/
dTLdiajdhU1PH5c/EsoRflF8MLWXhzwtktm6wxsFZenSKpV8pZ0siTU6rXQOhBdy
6xI5vwVdf8+o2ymyEI/4eriKVGwHR7NnERazR69w7H1tjVKcFihxBvS5jEGkT6UU
cZRoY7l1R6PDClMok3aDvH5rrydo7r/CkkJjGe8oqayBjT7jitLnkkF2EZcLeuXP
ZXOZH+kCZ5hmFNySAEFw/8baa7X/XQxA2C7n+zzvoWCshvbr4pdZuuQRuOa5hM6z
ve3uNHUegEm5y3Myj0PKkYnvymjBTz/cyauQ/TtZWFOREPfcGqiFbUP5YOKRh0gB
SiLbhMq6V/jj/KE2edYqy3pLdfkNaabyZUIolCV7VTBLLLwQyBHf9rJ9eZDyatqP
EdX6BAxJFEjLEZ6yZ+p3EfVu6raVF0Njvm4ao7pUOFHnPzQQBR52EhfgQmJKEhxt
buteSr2M
=g4D0
-----END PGP SIGNATURE-----

--LtMyRIzzNoTBiuto--
