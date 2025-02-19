Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6BA1E0B72
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968270; cv=none; b=GMOTYx9mQTKQ2rwro8FiFyQN7dVxcY916K3bqtBo0CAhog2rWp0jAks951wLX2xihwWx0JRWUrASTTBInWECLPl6qHMAJVE9TeTWJbXC8saXDMOZfVdFheS4u7ih5UfTBr9xfRA6cosyOsumWZAjMtD3wvJnR63SOflljpEcxF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968270; c=relaxed/simple;
	bh=I3shXO9b9Bf/a89JD+NZvm3W9P/MGQLFbKoUjj5IlzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txet8K/Ki2V+umjLgAnJNBzVGTuOw0spuTKCmvf1wDFUDVYI/a659UMOftqS9JLMEuTihDiKuYwIzvDLwlpjHnYWcoQk6xYOBSnHJdXCRU6NhpfITr0AUttbPVNIhONlt08CbbkltCOpWAqHtPXKOMadXuyxqX7A6cinb8xGc+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+++mIZ7; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+++mIZ7"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54527a7270eso5221859e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 04:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968266; x=1740573066; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XNzXBsdWjpLDVsAJfw/fASRvRFeX+ndkn8tRpPOZpL4=;
        b=R+++mIZ7KzghUVUTXizk1oKASdpWVm5wWZP+oOZVDiYecPnwQLN/F/MVuCj0Aqwly3
         1RX50QJFtRquF+niIBD9s7p/0jMBBRW3H0IskT9oSnmekpLg9c6qzkAzKo6Tdc3gMgce
         UH654MF5AihRY2E3whEHFXH6Opa4QVhruuWfK1yl7Qz5bzRbcRIlcophlgS1xqU3M2zD
         cB2d1soHkxm2+vpxjaqyjSijYxiJj1tNnn3jXwseoF13VWDDY/dRQZ/MRTsO4yWCWtAj
         HXvuvc8hRkwzFDKslODqJnh9Ixxc2pi6MMgBa48J+U5iAqN/8gEmutfoFafhUBbhJd3Z
         zqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968266; x=1740573066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNzXBsdWjpLDVsAJfw/fASRvRFeX+ndkn8tRpPOZpL4=;
        b=RBXyjs7So+Il5/LfIz4r0tszK/qVikrKlzMA+cF49NXTpOgC6MOm9gUTKIy2cgl3k8
         SjTsYLdy3pfIb3rhS+funmZ4hIxTY0vBCMLl0aJHKUyW1Xfj4PBkK0yiV+RDps0CZKOU
         SZUmdF38/miuhuY48doQlvlxPZmZ5Q1l1cnVJBZVUBvLrMvV/CzsI9fmL9IQeqRaQhgm
         zh3DphEJGFO1y40kq1t1w1DKGLODay8Du3SFUyMj1Tv4BXjgewnVzVuHdey8LlAyDLrW
         NE8O3Q/zwxM6YWiW4vk44Ec0x0LRj/SXNhk/7DQVDgfVGGjEA/pEyBhr0DCP41b9b80o
         4VeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF+KdOjIQE6ZnnGEdaNhnDAZhTVf84N6JIwkBfb9aGf0IjmTukyz1CGPbW7MtoTZOfQ4MQLvpu4NRtmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTnAE7zoxmll4my1DhSPSKZudWnlxmYszPA9zSE8rSUXqkh/U5
	65c/mn4Pp46tkO8XF55TEybVuT6wELUy/zGEkmfu6TmMkSNGoQpb
X-Gm-Gg: ASbGncuMeZiOhJ+NPruYUCd6cSpVsMNK4rK9caM4wTsZKuCzFK/NGV+KO0kKEJOf594
	OP7PaXOTFrDJ4QJ2a7F+4zmp98CTNcn2Ga1qHB5NIkqoIlybV8jSTh65SdskCK8o60Ky+yvTF7n
	l6weIMvWDTg/RWpl3rBopqlCbzAbcCaHlMpo8NCOVMgddLLb6MI+arVl438P4Aq/vB87fXYKiMm
	v+L1yLYcuEKLnMMLdx9l1e5GDDGkFP6RhUTuDli4/til4SEkKpnBam4hDO4/97wz54l1mXeBXia
	psVr6hVjtiwVNm2LVhLNCg==
X-Google-Smtp-Source: AGHT+IGbVYVIJzf3Ky5RtSpHDBC96A6gAGmLe92KwdhKJGUa87dA9Nei6u7W+ae65z5/SkdH7rRhrA==
X-Received: by 2002:a05:6512:114e:b0:545:b9a:b4b4 with SMTP id 2adb3069b0e04-5452fe8fd01mr6567349e87.52.1739968266349;
        Wed, 19 Feb 2025 04:31:06 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461cfe3a7fsm1193290e87.34.2025.02.19.04.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:31:03 -0800 (PST)
Date: Wed, 19 Feb 2025 14:30:58 +0200
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
Subject: [PATCH v3 4/9] MAINTAINERS: Add IIO ADC helpers
Message-ID: <65fa17207c7c716d66efb95733e6a37512465605.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x07A89EJB3DmszZV"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>


--x07A89EJB3DmszZV
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
index a87ddad78e26..bfe2f53fa74d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11099,6 +11099,13 @@ L:	linux-media@vger.kernel.org
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


--x07A89EJB3DmszZV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1zwIACgkQeFA3/03a
ocU7HwgA0cGcPRNsovTvGC4vVEpqkMwltUbKNh1IXuvWu9i//o8vPhyV16w0TJ1q
qXjZOjCBIzR/Gh0OORKYMUYpGOlunAk49/h1mv5EeKEbg9H5buLgthjE7aBj1O48
fhz+HOVKIUJY9y7IkFjtVLqR6pHJfAjpqZ8HuubNkEKHegztdPvE8VjhB/4HDrxO
GAgNaEuUevO9/7tBnDLyr1qpo6PkVkIZqAziP0ApIdf7l8hlmabuc4XYpvu4U6xZ
pOpexx7LK7PCUUoaTXZX2sWrIxoEEQiM75Q5PPZvPvzftLgrCeDWy0u3syV9AO/J
p3ZuHFMAMr3oTFvth9KbobVJNmSfPA==
=TOaW
-----END PGP SIGNATURE-----

--x07A89EJB3DmszZV--
