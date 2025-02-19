Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18851E0DCB
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968289; cv=none; b=gvwS6rmm1P2vG0BOX8+sqGLOyRZeA7SW1I9vvRPhg8rhednfiIaYSA9Zt6tGGvB/V1nmiw6i0CyU6PBR1mhLGR0h/YeSmdr4IYl+cVsZYfKqYMepgB37NEfLCQ5QzrJ/CrH3fGjo5LoNm90b6qAPo+MchboAr10mQ0sI8sEfblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968289; c=relaxed/simple;
	bh=l4lUpmHuMR9617shjfZBPRDF5NOsdDEGA4OIBTz+Rhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvRpAI3AIcXP4Schep2KcZfBspTxZVhg6lewub6SvrUOr135qMeY6cPY4l6OHqpPZe/4eRQ4wdUTqmLmT0CoB/7ixtny79DrkEZRaTiunp/Zk5aqYHI/OzhZf74r/36rETcVM5AgbmxeEl+jacTxF2xwS5q0QIc/OwziiW5YEK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1ZK+H4Y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1ZK+H4Y"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5439e331cceso7633284e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 04:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968286; x=1740573086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9YlWf0udibHi5PYSeWM2mVi7/K2aWeL2dI07eP9SBw=;
        b=K1ZK+H4YO65W2NN+/Xoa3zilHYyxf/FF7lqocD6O8vX0d8JcIZMfejL/+svWoHt1Se
         cA/eck/FvEd0JAC1q9/zjDvF/sIQVRGSYepFWYQhU7F/2i3AGT9ICkCdtD8yOo+bZx4h
         1JU7gu45UoY9KTBPDG63V4i2ByM3MJRw4IV13sL7p48Cdzb05p81Ve171po89wexZ0ks
         zIIh/iousd65WeonFcyEFH5Wd05mEJlpLWHm30YkHgE7W9Md8KPaBFmV3bF++2E5f0Jk
         htcNYulCZqFEsJ1npzRRBBVSYIBcdKxc9D6oFewAAof8P/qNTuR5uC5NRcvLQr4V3uSi
         Rcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968286; x=1740573086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9YlWf0udibHi5PYSeWM2mVi7/K2aWeL2dI07eP9SBw=;
        b=HdyVvlKQOHeO+Ka7LwsLAJcqRrFyiYgimoMIpau9ZMwu7dBqFxV46svoPJ4H74+cid
         NEnIM1UwIO6OUaGS0fyLsPVqPSA9FUoslWcLY//TCWJmlYCdXbJEndXsqJUQe/LJcAR9
         3uqHLBGan5j4jqMMmSdnxp0oZZzCuxelUa/Y49m4kAs0mmhx0e6I7fcMZ8g8UDQiPk3G
         KGOzg3tkeLo1zc8zl+z699DCOFwI22x3AyVdivkVCJ81NXR48/GrlCYuD95M28BFExUd
         4YUxequE/xGM5UnbnByHKItS8NCAuZaaekwVBW040+Cgc0fS1QfdDHk4r3/sFGMqdh/1
         iCDA==
X-Forwarded-Encrypted: i=1; AJvYcCW3gLAlUIGfQllpRP1QPMI7gXPxyn79mjBoPOEV0WZGpZIaBVScYpXb+NdjF3RuacQpA3vsXObeUmaaDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdRtG/tAgn9HuX137wuo4YeJrKxyja+LtpNZpG6gMJKioYl5tQ
	3/kpujw0cpYfgPqpQdu6CSZnV2G+gsQWJEJxExbMWqbYXyd2/Hal
X-Gm-Gg: ASbGncu/p89vQFUoZVlyEP60QEkX4Ra+POzwkF9bLsJDnJiwPXjjrI+ORgah5wOyQ1P
	v5mczElvxjD/Z2ZvhMMmYoQX7/OLXbzaS9Ik9svz6vR1YaqoH386ZxEUzVjKATUHWnA4fZYnNax
	Wno9V9NeWnvM6swnCXOo4SO3vdps1ZRKOoep4/vyKybjzre8dKmkKXblhHLjxt7G70CzTlA42zt
	zxUH7nKfmdsUXHjjiqw+IVgt+GjvQ74sDtzTuOiDnvd7lqEGD0ItmEj03V24z2yDsY6LyZYOfAd
	gaIIp+8qczEZNO1yoMBtwA==
X-Google-Smtp-Source: AGHT+IECGLbBg8/Gfg56YN71xZxnO3b9XbM0HqSAvG6g7x6DJxq2h38ifv+YIKS+tWOSHyQD921kRg==
X-Received: by 2002:a05:6512:131a:b0:545:cc2:accd with SMTP id 2adb3069b0e04-5462eee4789mr1463016e87.20.1739968285827;
        Wed, 19 Feb 2025 04:31:25 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f08332bsm2121536e87.48.2025.02.19.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:31:24 -0800 (PST)
Date: Wed, 19 Feb 2025 14:31:20 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v3 5/9] MAINTAINERS: Add ROHM BD79124 ADC/GPO
Message-ID: <33dd64a9f43ded7809e9d96de81c975cf9d68a5c.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cgogUbgcoimvAkuI"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>


--cgogUbgcoimvAkuI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the ROHM BD79124 ADC/GPO driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
RFC v1 =3D> v2:
 - Drop MFD and pinmux drivers
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bfe2f53fa74d..2021327e665e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20299,6 +20299,11 @@ S:	Supported
 F:	drivers/power/supply/bd99954-charger.c
 F:	drivers/power/supply/bd99954-charger.h
=20
+ROHM BD79124 ADC / GPO IC
+M:	Matti Vaittinen <mazziesaccount@gmail.com>
+S:	Supported
+F:	drivers/iio/adc/rohm-bd79124.c
+
 ROHM BH1745 COLOUR SENSOR
 M:	Mudit Sharma <muditsharma.info@gmail.com>
 L:	linux-iio@vger.kernel.org
--=20
2.48.1


--cgogUbgcoimvAkuI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1zxgACgkQeFA3/03a
ocULuAgAjZavIzHTPjKXGVeBG0YHgO77wmABK9DsiC/qVjVCqjKymrPlKSOoz6De
5KuSLf6blVfl4g3VNLi+25yKc4rOctFr5iyTV5pWFzIhidkV55fw3PMIYnYL/foR
+iRaRpl8okONUYuxsiSQLZe2IRTrforggRQXW5JGu+PLTzlEgcZ4Gw5t1bDijmFC
3jNohUynNb8Iw/5w2Hnj0mqL+Z18jb1hZoJF9M2Ns/mPwQonGf0yi6Q+4kNzp86y
YE4yqyf/e+fzMC7Q7hUzGvRonL2iulD5a5D7XR630YImkpeMwLEM0DZGqYAO7qTT
252ljGVsQsIiefcFr0UagxfopFPVuQ==
=V7e1
-----END PGP SIGNATURE-----

--cgogUbgcoimvAkuI--
