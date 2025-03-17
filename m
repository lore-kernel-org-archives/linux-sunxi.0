Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AFD17A2EA
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742226706; cv=none; b=LrnEIAt7Qn9yjcVvxM+ZSJWrt0xr2Jeoy7Cq4NvxTC3nIDkyzAKZPUf5gpdAMP+QmMLjUYP3Wh9Lmk2l7YI0n9eu1MdBVGGXNPcopNStVAJlRWpO6a3bXY4243c9D+ZNIwUgWU508d4ZpNq4znAcFEDolseN6QiojC7tdvm2K5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742226706; c=relaxed/simple;
	bh=Oh4plqYxXdIyOPcR3vPrbHY1zS/ykJMjhXiKqSvBciA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRTfUHsTCmAR7ol7H/59VNSGtq7H/IiVj8XGHcC4CNaG9WDkdFUXY/R52pf4d7zG1XaDJ2U+d4WGhx4RE8lMyzJ2N98mmzVm2TxCWfDU45FLdGwUcBuULdw29D7anzFE86rYit1Gz1ei8zoI3XjPQd4tbWI9ho7t6e6DMkm/bhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IplsFlfv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IplsFlfv"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549a4a4400aso4826885e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742226703; x=1742831503; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qZp/H4slk78IiHDNm1oAqEElmdRePMABQQlvBKJ8MF4=;
        b=IplsFlfvtiNoaug04MF8I2CDL6xL7vzoeLLcDa4wHzCvLQmuEEMr6tO+nqZOJtGGom
         fUtOUC6Vh7QISrdXPvfRt9tBiaA3Vhvrw1IG61igFyItEXZhUwJBpKwPVtZOYTDCk5jF
         SAiHdi2PYpXi9tKhgvGLShVAS2tp3LxQjr3PNVHjgF1ks9rUEb4F/hJK1leRyDgousd6
         nJnWlXHN2rVAxBjCoP0Xrn/+AkAQkTRxuXBPn/aWnZbbn2Q6ekdI0PBggfWuNWWqyKpb
         zOcS0UMAif3gKpi6e5i1/JpwDTOytb+l84XsF8muVXg/fyQ5OwYYtVJyeKicpn/kqtQt
         aF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226703; x=1742831503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZp/H4slk78IiHDNm1oAqEElmdRePMABQQlvBKJ8MF4=;
        b=Dq33Dx6pLXFAE9Dmd+nfYE5vYXWQaapoKmPqot/m/c4DCQvGzSyADDMwIAFuu7zYGX
         PZPfZkIWsgy063CFHVZ6OwOdzKnfsGD6OQp/ulRLuBnpe9RoI0/VYlvRWTmtIBz8F5zS
         7ss2I3+EhuPJvqz/6Cc3xORyQk9Nn2sJu5LWB0TeZXKQ0aVAr2Yb2n+SwP2zrPRu2x1z
         Kgp9z/wVPUHx8wxTTIt79B3/zBHT//9PtkDKwp9VTt5fzFmG0WVCVQ4n9LctnIxloPnC
         B4gtIUSzeQ2ve219k1tE29vYMVSGAA3MFd/6xPOM7+cLBqDqYWy0McdmK+OPdOvsLbuO
         bo7A==
X-Forwarded-Encrypted: i=1; AJvYcCVYmcMEk+rFjr13FWcurF2WTYkeiqqlDRPDW8SDW6KH8rL/HyrLgg8eu8HtNOFIlZxTzHNzRkDQWwwSew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHu9ju1CxQjP44OdKHcaZosRaiHRAw+vQGqBjmgHjC3k2iImmq
	foJLeNH62ExqheDWFR/8hsV5SXJ47Gx/RByjlI1lRgrtUvxaBYrp
X-Gm-Gg: ASbGncsU3KY7rv2e/7ORwac3SCIT95pCE2NZXT1EwkHBO7LhvBxp3PnhibEay+A0u9+
	tpDQYhZrf00ny5UZOunE1KJuTpg6HH0SwVcLy65oy41vDlOT4fZbdtB+rk8qPyrW7cMvSOOgC+m
	J6jHlxLt4Vo046NJ3JneIbsHTHNkB4HlloabtsT1kP5RqiiLCQiyKebJ2F4gspCd+5wEgnAvJ4M
	pBGVmWEed6XkwLloTTujKSaJ2O3uRylop6QycU4mhjAD+zQ8TunPJfAk8uYw06betrIisIbpvOO
	bMgtGV94bk6bjtOixZfhCIu0lzHrKPZTZjhxBd0m2E15H8xCcFGs86ZRx9oRjQ==
X-Google-Smtp-Source: AGHT+IGvE83lD5O75qXN7tU8+BEUTnVmyQ+DR7gPnljh2efy53y9OxWZRbn1FAQt9KPWJXz11ev7ZQ==
X-Received: by 2002:a05:6512:398a:b0:545:2335:6597 with SMTP id 2adb3069b0e04-54a03d02bcfmr277694e87.50.1742226703043;
        Mon, 17 Mar 2025 08:51:43 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c0a39sm1359539e87.65.2025.03.17.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:51:42 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:51:38 +0200
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
Subject: [PATCH v8 07/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <a94e347b7a1dde5329bd20a34f2be99c598bf5f5.1742225817.git.mazziesaccount@gmail.com>
References: <cover.1742225817.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jMWN2jjOy9xOrAbO"
Content-Disposition: inline
In-Reply-To: <cover.1742225817.git.mazziesaccount@gmail.com>


--jMWN2jjOy9xOrAbO
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
2.48.1


--jMWN2jjOy9xOrAbO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfYRQoACgkQeFA3/03a
ocXx1QgAlMDxwtisjRwLvP8KziloblMOlFslOnZ48Q2HXhA3yRy/A2Xx0ls1xQJp
ChvCUhSiCnQbRqhx8R/4teE4qVQVNynkfbQ2Nv6S9/dc6O4SK7fPqRC0CKk8veFz
bcVWJjuVASjtXvT1uzWgPJIgnDrLeURUNeLuWDEpI5QOcc2P9eiyNOM6gi4GJRNO
v24yX4+JJ9+zC1x7o+er+8PvhFMfqNFQB8ne6YGKs8BobomFtN0OSNEaJB+9LUbr
VopSHM181zpElcvGxK9KpROKKQYANHZTf5jMq43PS+rsiifxT3YjneZ2KmRO2OJ6
RXM+hI/GkXu3MN8wUvzZ898RghADng==
=dZAB
-----END PGP SIGNATURE-----

--jMWN2jjOy9xOrAbO--
