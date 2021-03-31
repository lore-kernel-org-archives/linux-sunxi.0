Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35E70
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 13:47:07 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id u8so14406547qtq.12
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 06:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xILDzSXrdLhyzd6vqBRvTFCWGztmAST9NuCt6ENsTxE=;
        b=Z2blJA7Rz9DPoG8MJaAVxVf/nSyNiCtHBN2n33Gngd2KouhL0naBTm5MAXLUprAv1a
         3z1cu1yTNKuohRjsL2/vmbhgb9RsZvmOQ+krqjSBpr/VoWP860vp6DbwK2CWb3YURD3W
         NZxoBuDFgYKm+DtOWWDWuBFYNo6mB6n5SWBdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xILDzSXrdLhyzd6vqBRvTFCWGztmAST9NuCt6ENsTxE=;
        b=VWYyNa9r1y+1uzVFFWIy1PXNaEJrxn8Rj5J6PQ1v4ea159C7YvFwQZFkKkDi9fxqCf
         CBnFmSmmSrIaNHBnADyYYQ53b6W2ZY0xH8280CAWXFYddyaDGpwxu54NoAL28TGeO2du
         T9hI6yZne8w4J9hPgTzLp7VQZM0slEukUb8v3tmYh6RcbTlfl8CoMhRwGRNrO9JeE+fV
         fmLiaI79o3xCXFCk5Vg9NSY9Tmb1oZb6apBhg0ZlCk80XZ6MIaOuxsxUIxsyNQjqukGY
         8T20vxkUFGE4uXMrB3FUAzferoEyguYYSHv49exG4vtVc/7i/QWQgSyDVc/OrgjE5Fmf
         TcxA==
X-Gm-Message-State: AOAM5330fHhIjHnBComY04gk/XrrGWzUCca/zvU+5W3j/uIPIoxtMkF6
	jgnY2kMKYE/7JqM3iDN4nUCrWw==
X-Google-Smtp-Source: ABdhPJxza/Oe4w8TiObL+H9v/KH+gDx5gpxFz73zPsyjkvXn+KR09YwtNc/uBN2Hb1hED3Wyz/5PFQ==
X-Received: by 2002:ac8:5a0d:: with SMTP id n13mr2470910qta.211.1617198426676;
        Wed, 31 Mar 2021 06:47:06 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b07-927a-2125-7fff-a673-e6f2.res6.spectrum.com. [2603:6081:7b07:927a:2125:7fff:a673:e6f2])
        by smtp.gmail.com with ESMTPSA id s4sm1370310qtw.18.2021.03.31.06.47.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 06:47:05 -0700 (PDT)
Date: Wed, 31 Mar 2021 09:47:03 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] sunxi: Last minute Allwinner H616 fixes
Message-ID: <20210331134703.GY1310@bill-the-cat>
References: <20210331100229.23557-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lJODnkcj8ZHgs3lk"
Content-Disposition: inline
In-Reply-To: <20210331100229.23557-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)


--lJODnkcj8ZHgs3lk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 11:02:29AM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the sunxi master branch, containing two fixes to make U-Boot
> match the H616 TF-A port, which has been merged this morning.
> The link address of BL31 was changed last minute, so we need to fix this
> in U-Boot as well. Since the H616 support was only added to U-Boot in
> this cycle, this should hit the v2021.04 release still, to avoid
> compatibility issues.
>=20
> Booted to the Linux prompt on the OrangePi Zero2 and on a Pine64-LTS,
> build tested for all 156 sunxi boards.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The following changes since commit d8eafb16c85bc3b5d85d7ba8ebb1438cc0ae16=
8f:
>=20
>   Prepare v2021.04-rc5 (2021-03-29 17:20:13 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git=20
>=20
> for you to fetch changes up to 62acef239f77583f3083f8c842ea2d28f4a1623c:
>=20
>   sunxi: dts: H616: Drop reserved-memory node (2021-03-31 09:50:31 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--lJODnkcj8ZHgs3lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmBkfVcACgkQFHw5/5Y0
tyw3bAv8CT8dmwUouxzgmBSXWbq+7gtmcZlSxsH4+VofYxexfjgrL+nkSOHeXtO1
hysmn1d3NOkkvVlBKEqWnuk8KU7OGmcyGvWsDFKZdaQQB4Q0irMmENmD5JtzfyGT
CoCWG5Jtxz2LYSc84YZSXoQrzlbIH8eL71zX0JQctbP/Tgdq9e/JY32lk5nclLz1
leYG9cbr2z5dpT8jnDIXocmONU7b1ay4aC+R3xoXcCf4Jg6Jp0C/YSRChSzQ0Ipk
GnhtpDR8HV7aPyZ6GIJQ9WvS10qa72x8KJogyWpqI7PifmRtv8UXLzvo/GrrNNvR
if1rFvTGbmz/WCkiX+POg7WMtZw70hsgQlMYyqPAKTHK/D6n3E7ySIfWRYG0/9Vm
madIT7XyC7k4zLv7Naw8q1OdWpye/HPGvhxlB3Fec95BiSwfRdYbZ+xaLVt/BaLw
Jtz8a7EfA7DXbgO47a9YHtijjxncxoThmgkr4d39Fb/zBLgAZZx+n/vsj9HwnJiN
rYgjgrJB
=GJcE
-----END PGP SIGNATURE-----

--lJODnkcj8ZHgs3lk--
