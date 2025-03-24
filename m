Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B743E250BF0
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Mar 2025 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800446; cv=none; b=KOhXn67BhRK/VKiHMgFnfDf4gUy5I15VFaEuSWEfH9IcgsrX1mmqeB9zBlq4swduPxjqZoILoqWNGmCnqYGdoDyhmR5Vbgtu/wlUb4/OO6gzB7k6X5ldak3Ko7Fg6A3ICfYSMCaaBrjRw185aLGD/0TfLYOZR8LYTiNodq8ZCkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800446; c=relaxed/simple;
	bh=03F0ih1tk5WKssRMk6SjUSW/lpf6r8D8f+sSTU3X1SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7irCbWmm7yhR1+F74nXrcbDdd8fambuM23B/lZ3ZCNsUnPcM/qsNvfy8AePpvmVVOPAUro0W25BdRMAh0Q6f1+9Hraw3Vjv5qkcb157o1hv0ZjXBDZo/0gPDpAh+BHcsY6FDN8gptJ64SfiRFV4ERMbI4y6lg9FkKKII6QbCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4Sf1EqC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4Sf1EqC"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc0cd458so4408053e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Mar 2025 00:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742800443; x=1743405243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5zlbJSpWOHIuaaWvEqgFmQJc2MPl83PxDlEmoP1fD0=;
        b=P4Sf1EqCA0LVShHn3He8m/jMl6fbR0Bdp4zFSM8tdNHdIXuvqyhLH8OUDaz7inDU51
         P1tqGVW35KSsXfJ5ze7s/ecJAb8z5NUptR5r6/e8emLvzeo6D65c/yBD4Jse6MCDzE2J
         x7XxFfrMOAsWGxOjdj1TU0DMMes3Cf0Ik02s5NHBor0bZq6E7eHY1YLNSKnD5qWaKs0h
         Op2QvOlJ1uQG8Wo2RXOyU4erI18xd0PtNJS69ShGxzbxyDhXD8nl20x992gcRGkoEg/o
         gnSmYrsRmiXwyd5RqJq3TcJOtCn7tSEzyCc9YlMGQ/SYAJXXIdb3LIla4qUyu5v+hLDe
         ahEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800443; x=1743405243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5zlbJSpWOHIuaaWvEqgFmQJc2MPl83PxDlEmoP1fD0=;
        b=OKl34HgRyZ+lrLWz9H6ca09g0EGXmxqzon870h5AbRyznjMl6tpztTVhB5Tpy3K0HO
         dpLcb+9FDoBTyRyhWV/RyW/isZppkR38H3mhKn03m6RxIcx9uzcwwADIs7EiAw788NFk
         V+Ceubqg4md0O7+Dw91gii4FLpqCDOip44DXOWXxpAy1+zI7zXfoYYRbSWKi79sq/4fo
         T/99H5CtJvtNuZ21aI7y08ELbjTcAQYuui/fn6tYRx7ggrmTA6bNvYRhtlORQqk7dNZY
         ZbSLgZGCwPj+DeFG+UDQHUTPuCAjJcIbsa25ISPPf26Bq9zy4XxZJNUKfGPDs98ObScO
         2KVg==
X-Forwarded-Encrypted: i=1; AJvYcCWmnHSYGS/sPgq8YQsD4jdy7HCWB9EebrKfqsnJTTyi576td7dJgkcNzzuJqW9A0ZHjKejw0CU9kXWEAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl2hYSp2luiZ1lEKMLj1JTgw6xmUXYP+FpD0AkOrS/RMDMsZbw
	+NFUybQsm4XUGfz2Lc0RF0VQkjwRIHh+El/kTOMSjlgGi/prFlXI
X-Gm-Gg: ASbGnctnuix0pL+Hh50qTLN9GE3LXljFk0QUZrzOuf2jDt7P9ceNE19UTrZCFPn6h4/
	UffBW6JuU20gKfXa3iRobZiSMI1hu4Pqti0nLvCeTliT1NDCa7cRmisYfGGmt2X65IQjOUD1Efz
	IFmGz3BUPze5EWJH3I41mOuBnzuqtMk3r2K+54dOB6IM6L9PDrI8a4g4STUK6p2gggp6DK09+B7
	4fKVWmAODHO6s5UqnK3WolBEDCohFGMoPtom31f7tSOdjRe4BCqF1KGan40d/GhL2DD0/BmImBi
	2vMJQBbwUIaNCWOG7wFY75hfyAx8mgIPmYTgpNxHMef8QUCOfac=
X-Google-Smtp-Source: AGHT+IE0hw/y0ZYh+MtPyuslvaGnvl9GM9JaduCS84yGygiOiK+LICzgtUkhqkQ6zjlppVQT0t4I/Q==
X-Received: by 2002:a05:6512:3a8f:b0:549:8f06:8239 with SMTP id 2adb3069b0e04-54ad6509abfmr3719359e87.51.1742800442609;
        Mon, 24 Mar 2025 00:14:02 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65081a1sm1027115e87.163.2025.03.24.00.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:14:00 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:13:56 +0200
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
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
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
Subject: [PATCH v10 7/8] MAINTAINERS: Add IIO ADC helpers
Message-ID: <1263c954cfb74223f322a9c31bd57f13d5516680.1742560649.git.mazziesaccount@gmail.com>
References: <cover.1742560649.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ewp2VBF8ttFnYinD"
Content-Disposition: inline
In-Reply-To: <cover.1742560649.git.mazziesaccount@gmail.com>


--Ewp2VBF8ttFnYinD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the IIO ADC helpers.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
v2 =3D>
 - No changes
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
2.49.0


--Ewp2VBF8ttFnYinD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfhBjQACgkQeFA3/03a
ocXCSwgAxVnQyxRhTT58mImS7G6uU/aFQDiXlM08CUZ9gObNjgFta9MMnPovZwHU
Nr4fO3MvZD4foJ6OMB0MVKDZlTX6KOg+K2o/delnE1l+tH9PCcPnTSm8Fc5H83Oz
QwMNIhQbwKN06KMJsRyVW5iNLPIwil2Uf/3+Q4J7CNbglnrlXsocA00rke/9BFRE
K2Y5r3WxJapmyacQHa0xauNlv9kPViNh9Vy0VF2io+oy8d9hNMzfQpGM32xoqmC2
+UTIlAzEplINymAM/399yLCxCT6t2lH13ZrjeTiKsc38DvXHyz3pE6K/xX38RE+G
I+1fM4p0O/8GpMnKLKGyWhk0IyfBTQ==
=vwYn
-----END PGP SIGNATURE-----

--Ewp2VBF8ttFnYinD--
