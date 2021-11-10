Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7906F72
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 19:11:15 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id b17so2512292qvl.9
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 11:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+JKiGXhO7+/0SotObWJ+8jbYCgyu95BMMiyUmhIsevs=;
        b=WrgncsjUnmdQiIWH6HiXK59wwBmAla9PJPuzMzLt/Ui9qQH8tjOvsD/qbol1igAUuW
         jdFvxkgT+L4PhZsD/mIvXtMlaMvXMjVGdHqWMihi+Jtamq/XsQvOAawR419L6PN1QwrQ
         sds/YCUfnqoOj7DTcLQNbmLxHjsriKd6ClUhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+JKiGXhO7+/0SotObWJ+8jbYCgyu95BMMiyUmhIsevs=;
        b=ysInV3YVfrAizQ44pQcKJUAg+3Y3ywX5hRt8P6P3w15PCWheUVDqxLvVIElM0uk74Y
         Z3GMs7XmWKHLxsVDd7vYIq18JnPgOXjmf2dq6LeXgpKvD7EzALpvUs1Xg6J3O64PRCSC
         hefBe9sDyMmBr6PRE9uGxtK+qB0IDi3lftW6t5wSDZMVcgOjV2kWZEwpyXRBGtU4+YdN
         pozgelRh/naNWVQQdjcuxH2pN5ODia/ekS9DhnUJwsn+sjZsggagMNMcPv+ar8YaBE7C
         ILz636Tj2JyVmgjrFdoDui0HfPgLMk8T8s+gZzFQ0smO9sdM5Zze/018J+byyjViOkvk
         nxcQ==
X-Gm-Message-State: AOAM532dGOXRnZVn1AHIgf33nZgTfVi6oEZ6rUHcEa3ldb9rCDrVbYtm
	wghyvTwwUWPq637TIP8IuiP1oA==
X-Google-Smtp-Source: ABdhPJxhaQ14DoQ54wmWEZgFgkDVLQKT1rznr8U8GPfA+E9DZe83oytaMmfC34tHSPYvDnSmS7Wwvw==
X-Received: by 2002:ad4:5ae5:: with SMTP id c5mr1313572qvh.29.1636571474387;
        Wed, 10 Nov 2021 11:11:14 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b01-cbda-45aa-b284-65f8-b590.res6.spectrum.com. [2603:6081:7b01:cbda:45aa:b284:65f8:b590])
        by smtp.gmail.com with ESMTPSA id m68sm323965qkb.105.2021.11.10.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:11:13 -0800 (PST)
Date: Wed, 10 Nov 2021 14:11:11 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Simon Glass <sjg@chromium.org>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: Pull request: u-boot-sunxi/master fix for 2022.01
Message-ID: <20211110191111.GI24579@bill-the-cat>
References: <20211110015114.32585-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qtRU5Vj7VSlupYLV"
Content-Disposition: inline
In-Reply-To: <20211110015114.32585-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--qtRU5Vj7VSlupYLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2021 at 01:51:14AM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> as discussed, please pull this patch to disable the watchdog on sunxi
> boards by default. The watchdog only got enabled in this release cycle,
> and its short period breaks actual users (Debian installer).
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit e8e9c6f48400989c5fc54467576f8d535bd713=
e6:
>=20
>   Merge https://source.denx.de/u-boot/custodians/u-boot-samsung (2021-11-=
09 15:05:33 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 86798ee0c148db248d8e3e9b6395bbe9e24d9149:
>=20
>   watchdog: don't autostart watchdog on Sunxi boards (2021-11-10 01:38:07=
 +0000)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--qtRU5Vj7VSlupYLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGMGUQACgkQFHw5/5Y0
tyzfIAwArXhF27ykCLbFLnNZ6/+q3Jzb/KTSkiEyfLaRukb7c1z7/T+zcBi2hrJo
i2zFL2q/TQAnmctaS8d6Y6lVnJDjGGDBdFOAz2R8Xg1AF45h+QsWj0GpYqJpNsKz
80mEsD1l47uxrpN4qrXWGvIFz38zBqC2J00HbmeJZY16r3STekYafZK65sJRaJU3
OXdtClizk26q5ctrXZiVLHtmVjYmMqt9BvWIlGo2CXgyjNJuFa+g92u/LTN96kjy
LAeoyLEsySgUg+kupwTlkloQOqHZ4/8fi8V4o5c85Yjhbj4oux0IRJCgoJtzMDEt
apbCmVZAlfYvNL+eYfbjgvwD7wrHEBZIEyZleuB/I9GzIIh3BUkXPfNPvEGbTZU6
kSPar8cF812GeETokpelophZN+5JL0+d0224pSwS3KiSfFHzMFIepLtD1qogyUIc
cBrPtD+BQY1TImFdXDO6ChUOnZ1pSxFNhuWFj7GMIJI7R3ID+XHa9ahllmVABqqu
r9zPTMdU
=McNo
-----END PGP SIGNATURE-----

--qtRU5Vj7VSlupYLV--
