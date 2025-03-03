Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D37E1FBC8B
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Mar 2025 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001656; cv=none; b=X0cyoYnuIogNWz+szXUxy1FVprBlQNiDUfUjF/vCldHuFmOWD5ocLFZldRD8R79QB6S1PrFgK4yFFpym7GcX+VvbaIsDYmcuMi5XiFFKhi7LQtzz2QE6J6hVF8eKKYQssz3p1FuQEPiE7QFLuBwn1b4Bidnbl8nBy6Gr0ZrzTyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001656; c=relaxed/simple;
	bh=h/6aNDKIJEJax3YQY4YtbeLa1xekm6VvSIFc00ga2qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjqdfL4xdG+Jy82vmxx0U5OZ2+wu+V6kvN2iYK4YtaPFdX1AM50RdEcrK/7SkP5eQHssfw2S/l/V4DF+DkHG7j/FdKm+XZuWFKlcz7JD1bqdb4gjFRp5/yAL9Mouhl06eqffo/AalbFRQA1AiholJuWbNz1nDLor7fVOBnJw8vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhFxELIa; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhFxELIa"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30615661f98so45009571fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Mar 2025 03:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741001653; x=1741606453; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jKyByvqg+jAL9PKNdpeqdSWpvScxjw4N93b4UfEb/Uo=;
        b=OhFxELIaBUgPF2P03hhpyfdIQ1NigJnoyoAYP0CGKbRHMM6DNiVTGgzLwkdBUDNnYG
         LKfw0zWc5pNwmDJsG2zngvRy+E4LBjym2cTmMm+zv0bhx7XisUxh1cxYkdtvB/KiXFgj
         5zRjbsMx1V9mKNKFSlp4Zv19fmyx8S9CMyIbKesCrwXbF5BBQfgnVwI2WzigMilTnV+D
         0Y3Q4ECeNhjMKKpfMLZFqIwCbKJBLxzpoCFT/pwDTfPRGAiDrU/GM3qK0wPAUDOjo8eA
         1IrcGEKme8pRPYwFBjwMJ+rtwJ6EjQDeTEZvXh9PWW98hnVKV4iKsRZkmkuDCft0NYfP
         QzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001653; x=1741606453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKyByvqg+jAL9PKNdpeqdSWpvScxjw4N93b4UfEb/Uo=;
        b=pHa+2pv2JXVQLz/DbRt5V6eWBSP0s8+5NJM0oD0SA5yvXi/QQ3Jj1Wjq4pNQXAPt5f
         K/Gn0ZMyC0WufOv2600DpZLONGBJNAvqysrSpYgpWgmuGElMgAog9C67HI9APHyJQ/Di
         YeL+utQqVoAOICBl+ycE0it+8FnyB1w6kBLSuA7044RRMcvb3eCDl+JC+l0WlAWG4NKv
         /QzDvNJ+QVIEqEUKIGBI9djTFcyiEU02lKQ+T08kRbhtc7a/1JXRZ6J65gKVq98dQK7b
         czsWzqTideI8N6H4ZyAMSrkaypXZG/RyRnpFiz+4MXGG/OIaZAsRxwwoAEFKdNcUcJum
         5WRw==
X-Forwarded-Encrypted: i=1; AJvYcCXcnmnpkM2SkbjgQCG4LmgR4gE+qZKb3SbfK+EU3fIl/HCu9FSPNmoXjqCDaULDcZPLXXwTdek4cVzovQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWv6EP7cu7eIQzss2LLa0S/PBciWFWDjsDTwHqPtXvzDoaUxn+
	bBqOII+q2HOmfB9DVeCsTuc1XlcXzf8+lHRky/YsVtUAR9quWrZ2
X-Gm-Gg: ASbGnctgRMkQ9RGXPBVK+GiI2EyQ1hguSpZumXAy3IZ6USpfM2x13QEJkwnC79Fx4N4
	H1+taKE+UmJ0Ttn8D72PadVt3BJrMm5fBMpBIxZY4fs0Ka+HLz85HCEu+9cIQPlrRO/i1c2Xqop
	KFSR3pxs/I6hew8HqFUVehNY3uzPs4HQZcpYFPjSPPG8FSDFIW+H6JFpYc7xg+kG0ojx8Y3LNwR
	JQKgxaiE/SwVjY7HkosQr9vRYI6nXq8Ef/RanpFB6PEyQElZhoZdbuNYJJNn3RoAS6/K4IXhK/O
	yNq+TwDSQamW/1lc2Q7ZAwaWLV6fByZYz+pFPsNanOW8d96Itu0vMkIMsRN7wlaM+PPQKyrPLYu
	PYy0eRTfEgnY=
X-Google-Smtp-Source: AGHT+IH2q/EQ50OKDdOvQmK3DgcD8QV9qiZg9HjaiRlsRxpoAX3Icmu9TOCjXHgkc5dFCtxPesT+sQ==
X-Received: by 2002:a2e:9515:0:b0:307:dc1f:e465 with SMTP id 38308e7fff4ca-30b9326b162mr42530121fa.22.1741001653116;
        Mon, 03 Mar 2025 03:34:13 -0800 (PST)
Received: from mva-rohm (mobile-access-2e8451-125.dhcp.inet.fi. [46.132.81.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b86875b76sm14035841fa.91.2025.03.03.03.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:34:12 -0800 (PST)
Date: Mon, 3 Mar 2025 13:34:06 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v5 08/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <78c18b224cd18b1bd83eea51c7e52dcea28e3d50.1740993491.git.mazziesaccount@gmail.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5Rvc/P61F8vV1THI"
Content-Disposition: inline
In-Reply-To: <cover.1740993491.git.mazziesaccount@gmail.com>


--5Rvc/P61F8vV1THI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the IIO ADC helpers.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
RFC v1 =3D> v2:
 - New patch
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..5b96fb864227 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11208,6 +11208,13 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/rc/iguanair.c
=20
+IIO ADC HELPERS
+M:	Matti Vaittinen <mazziesaccount@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	drivers/iio/adc/industrialio-adc.c
+F:	include/linux/iio/adc-helpers.h
+
 IIO BACKEND FRAMEWORK
 M:	Nuno Sa <nuno.sa@analog.com>
 R:	Olivier Moysan <olivier.moysan@foss.st.com>
--=20
2.48.1


--5Rvc/P61F8vV1THI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfFk64ACgkQeFA3/03a
ocUpgwf/SNY3Pn6d3XX6wgquUJWMeNypZTRBxzVX+t3Nm+6wYifiTOOpcNdIYHfV
UEO/B8hbJ6BzXcUxHFFEUnq5pTr/a1gbQvg+rtBnZiXV95/wnLJjJgx9guw7IW48
BjUoZhymuhP201Y3/EzSSXwe7MnrOTaUfcTwBxZQSsipdd8PK9co9V1EzEGGIeO+
LqTyj2W1KqdWOE5qqnTZhzLj3fdEYfJoxyUdXWiHJEcmDyoc9qZ0HNnsLa59j5Co
d+8xCLwqyB6CFOJWkl7gL/92nAyFvn1XzEvpuQGyz2Ouoo1cZexz/6s+UvexWkuo
Hh1QZj0U9ni99bqIrOfrEk7zUk5lMQ==
=gikD
-----END PGP SIGNATURE-----

--5Rvc/P61F8vV1THI--
