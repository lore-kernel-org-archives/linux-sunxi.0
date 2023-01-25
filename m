Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A134C84
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Jan 2023 16:48:44 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id r14so1462645qvx.4
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Jan 2023 08:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt8w/YQQtZfIu+tdGm/xb2nXj1O21/aZKrrLPFbo9MA=;
        b=Yhyi5FfOEJo/C60IZH9Ebc8j5e9LqsOab8ExeXrAYk4Hix1WI2kj0+5C1gqvA/ylhK
         Ts6Rmo7PpAdOCftcGaj7QbLv46iUqTmio9GGrXF22eM5Fv4yTL6IpvJ2ku+2vG558xGN
         vuSi9Xd4f1fROn4f0cCYKDrgBKvwyx61DUW7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt8w/YQQtZfIu+tdGm/xb2nXj1O21/aZKrrLPFbo9MA=;
        b=ndrs36qrpEx2h/ffMgQDw/az77o9xcbzx9ypLnlgV7s3ykpWzJmaYlUq+rXbwuxRb7
         lpHiJrBnrjCfbRQQTKifyS3H+4vSc9czSukMAQnri2hD8YQqECXHYtHHAHQUrNkO2svV
         uONNuFDXUUdQu8rst5plb/JrZkD9TjCFUkDN/mHDzD5GQNE5Ii30Sx9uQQu1FqIey9Xj
         klVpEd55jyi6jJm4O166mmzJ5DN0agmE2Wmk+UwOc2y9dOcbhZ/6ZHoFru3f+SysF7vT
         DJg4Q1ACUr5w1GVxnDBVxHr5YfUsH3rOhaI+yWH1/eArG6ljWZHeEDK4hcCdXk1slzrK
         RZPA==
X-Gm-Message-State: AFqh2ko6cP9fTPd9y/D5yF0ezy7v8uGy+H57/1cJMrN90oqEyEMCf4Lo
	iJWYrL5QNlKJ2fiDR7PA4cQ6IQ==
X-Google-Smtp-Source: AMrXdXsEhwstxy9qcpz45hRLZarDBPAUl5iHrEnXo1w2VreNmmGOLUKCdK+li74n6r6jEz1yaTwgUQ==
X-Received: by 2002:a05:6214:5811:b0:534:2684:dbeb with SMTP id mk17-20020a056214581100b005342684dbebmr48019378qvb.43.1674665323018;
        Wed, 25 Jan 2023 08:48:43 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-bae1-07f2-e77c-42e1.res6.spectrum.com. [2603:6081:7b00:6400:bae1:7f2:e77c:42e1])
        by smtp.gmail.com with ESMTPSA id 128-20020a370c86000000b006fba0a389a4sm3797071qkm.88.2023.01.25.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 08:48:42 -0800 (PST)
Date: Wed, 25 Jan 2023 11:48:40 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for 2023.04
Message-ID: <Y9FdaPfuSttXblhs@bill-the-cat>
References: <20230125015940.16995-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DCXMgyrFmwQ+Q6yZ"
Content-Disposition: inline
In-Reply-To: <20230125015940.16995-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--DCXMgyrFmwQ+Q6yZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 01:59:40AM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the first part of the sunxi pull request for this cycle.
> This contains some fixes, and the first bunch of some clean up patches
> to get rid of legacy GPIO and PMIC code.
> Highlight is the DM AXP PMIC driver, which is required to convert some
> drivers over to use DM regulators, and also is required to get rid
> of some less optimal PMIC setup code in Trusted Firmware. This isn't
> enabled by any defconfig yet, but can be enabled manually and works. For
> the full glory some patches are still missing, and this requires more
> testing, which would be simpler if the core code is upstream.
>=20
> I couldn't get the gitlab CI to pass, it seemed to time out in the last
> step, when building all ARM(32) boards. I built all sunxi boards with
> buildman locally, without issues, so this should be fine.
> Tested on an H3, A64, R40, A20 and H6 board.

Note that you likely need to change the default timeout from 1h to
something like 4h, in case you get one of the slower runners.

> If everything goes well, I will send a second part later this week, some
> patches still need some review and testing.

OK.

> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit dd31cd58b02729807934cb699b164b1f873662=
0f:
>=20
>   Merge tag 'efi-2023-04-rc1-2' of https://source.denx.de/u-boot/custodia=
ns/u-boot-efi (2023-01-20 14:23:20 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to cd108f2795777d3cca1d0f00c50bb92f766f6591:
>=20
>   video: sunxi: dw-hdmi: Read address from DT node (2023-01-23 01:18:31 +=
0000)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--DCXMgyrFmwQ+Q6yZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPRXWYACgkQFHw5/5Y0
tyxw4Qv+NF6xzienlVrfhuO0nLlmfUR7o/V/Vze4mMgsHotudSOrNddgEUkuaQ97
DetH+czMhxANn45PqGaJ44XQuKaz9KBwpyqefVX8L+7aCpWdPC1y3dsmtYQ7s8mA
cLm13u27bDGXwvl1cdwaNeR5TUIWamkeVs9CA4yNsda30aGXgVNQgMKkWyW+m4eo
uYCTXUPDcb9A3JkwiPJYHzmG0++FyZq8t/eprg6RBnUszVizh0hnAyCP0zJbuA3A
98h2MTR16U0RVKUVTHW1eFYOHhaN033R1EBEHEfQpT5ChTcM5r7CP9vn5b+5tLdL
JYqvIso7+WhkB35zmtzh5TFso1v/b9UALmOkTMdzEBfOVO3lObbSy3kDCv8S7nx3
dM89b+pX8gqbaU4ywbrw6FlPpZ+3geJmedR/zgA9o8kZsCCCP7qJIITdjBVwkeeT
y/Ml7Yg7Xy9NwVk2WL4MIx5leTgOYKITZka2/s/GH77OGvQH/cpMTneM1AH7CG6U
jjRkVKb7
=q1qT
-----END PGP SIGNATURE-----

--DCXMgyrFmwQ+Q6yZ--
