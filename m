Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C64DF47
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 20:01:30 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso86207261fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585688; x=1696190488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/sEzFSU1WeZTVMeaZJF4z8FtiU96nb3S95OQlSjSS0=;
        b=Khdw4CLCVGzU/RGFMAvvjkl2LVxQd+S23axNGDA6QVpTSZltgiUcFQlzXJi0b/NuDw
         yZ6xdaTiiZ6PExy7FiHwrr01dtoYZWST94VhCSTXQIpLC5XhdWxoJO4VQ5EYIjXQHxAG
         OstFnMDShh8LDLns1m23rlxFcfThAnduNIHtgsWlBCBOjDH3Y2n+EBuAlxYFyUbFBDhp
         QLjCB0ZQsSji1lEOHXYdZmv4BiIa113J+lCg8aAenFrfeBVaV+E5P3ULhq5pTTiIbDJf
         PpNGEvqhEwx+yv5ux8uQtrw43/vnTHTMcZNkxGL4CjftETkA9hds4N4OWpJA69hxFHVM
         XLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585688; x=1696190488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/sEzFSU1WeZTVMeaZJF4z8FtiU96nb3S95OQlSjSS0=;
        b=IK9dKNRpI+K617NsAy2GuEGBRfZX3OGuOPR84sOyoGdne9JIjhzc67jAiuCKNz+TVK
         Z5Nx+JsrEeT7hFfJ3cO/3oPlbs5BbCRmeSipfvRGAzam4MPAkdWo58n+3oDsf6+wjV62
         TlmnPX6DcygwZ1blEYQvoKiiCi+TmbwkrXhKPk7Hf0E2uw7mqkqZ8YMIGlMVh/hANFUs
         i1KhdVuYx0RKmqjK3e5Wr+L4RoXY0dRycgQTK7RQ8CZP9EzH1+oWz4PV1HxfEXcWxzsB
         crrnncCigv69Vs1fCgG1Cugamf70Jk0EEVHujIgbH+VlCIaDbxjaFLEPoG0Nv4d1wuu4
         Z+og==
X-Gm-Message-State: AOJu0Yyt7qGeB5N9aPPLA00qTtg2RXE/vz0CQ26aXYJh6aMFkrcBacqh
	23Y021sujTZcCFoZeYWlXs0=
X-Google-Smtp-Source: AGHT+IHXra175J8cJCP1mYtvO6y1HC5Qd13x962DSEgj/v3iYxK9Qz6wXvUiRAobb0w7iX71A52zWA==
X-Received: by 2002:a2e:b78f:0:b0:2bf:cf44:dde5 with SMTP id n15-20020a2eb78f000000b002bfcf44dde5mr4102294ljo.30.1695585688175;
        Sun, 24 Sep 2023 13:01:28 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id l15-20020a1709067d4f00b009920a690cd9sm5340296ejp.59.2023.09.24.13.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 13:01:27 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] phy: sun4i-usb: Fix a W=1 compilation failure
Date: Sun, 24 Sep 2023 22:01:26 +0200
Message-ID: <3520089.iIbC2pHGDl@jernej-laptop>
In-Reply-To:
 <0bc81612171baaa6d5dff58c8e009debc03e1ba8.1693735840.git.christophe.jaillet@wanadoo.fr>
References:
 <0bc81612171baaa6d5dff58c8e009debc03e1ba8.1693735840.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 03. september 2023 ob 12:11:06 CEST je Christophe JAILLET napi=
sal(a):
> With gcc 12.3.0, when this file is built, we get errors such as:
>=20
> drivers/phy/allwinner/phy-sun4i-usb.c: In function =E2=80=98sun4i_usb_phy=
_probe=E2=80=99:
> drivers/phy/allwinner/phy-sun4i-usb.c:790:52: error: =E2=80=98_vbus=E2=80=
=99 directive output may be truncated writing 5 bytes into a region of size=
 between 2 and 12 [-Werror=3Dformat-truncation=3D]
>   790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
>       |                                                    ^~~~~
> drivers/phy/allwinner/phy-sun4i-usb.c:790:17: note: =E2=80=98snprintf=E2=
=80=99 output between 10 and 20 bytes into a destination of size 16
>   790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Because of the possible value of 'i', this can't be an issue in real world
> application, but in order to have "make W=3D1" work correctly, give more
> space for 'name'.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index ec551464dd4f..e53a9a9317bc 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -782,7 +782,7 @@ static int sun4i_usb_phy_probe(struct platform_device=
 *pdev)
> =20
>  	for (i =3D 0; i < data->cfg->num_phys; i++) {
>  		struct sun4i_usb_phy *phy =3D data->phys + i;
> -		char name[16];
> +		char name[32];
> =20
>  		if (data->cfg->missing_phys & BIT(i))
>  			continue;
>=20




