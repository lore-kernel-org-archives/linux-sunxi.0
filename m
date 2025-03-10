Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B8F229B02
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611429; cv=none; b=hp84rHFfSfAobX5diwB0FIxzF1OiaAeSWxBPBDDXbwocVfhDqgfsX7llezyfpl3DxFF46PE/XC/VS3n3+RabbjtzGrgpJZ62AwUFyveN3VcoFT0HxxCT2xxdnjBBNg9UtZ/5VNkB995FSvmFsDGDLCYY6ZEtV1peEcA0WJzIjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611429; c=relaxed/simple;
	bh=TDKDDPzUaodJtc5UW4XdfLKZzE9wHy3a9yu8RMvuGOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djlbETLcKdLuVKVn/OXW+SPF7HC4p0K/Rp5DmvjRjNzayr+eBLH8FzlNQsmH2ZHZ8l/C0W9RQOaJW3Na9T9enLf2hJ2BY9eE+mwHraAJX0vLASIVp17qc6gBiL5Am6MhnQJOvOR2IaG6NXK1LMj1dl3uccih+IQSkjEEUKTCT8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsTTYw9l; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsTTYw9l"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5439a6179a7so4135226e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611426; x=1742216226; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3YGvj5iF7isPICFknfIGBgf8Vkx+OSuL7svbCQwNvKw=;
        b=NsTTYw9lIppe9ShEHSr6vKdMzfoiUNg+2G+itRwLRlY7n8GnPUEReEpp/jX+cYR6TC
         A+vpY4bDB2E/gFmb6CX8D9WiKh6W4vaB8tz9+SWapihm+JMFgzh7q8+IMsfWzBn3y9DM
         ZXTjivrcnMFYtZNVX9unj+42Q1ttnpL2foIdDuLjF5sjDvVkWdTLxQFoON1AdXZnoaRR
         TZDcTaTbB9EY3Ip0zItEYsGf/LAeAUfdsC06IjEZW2YBFkJRt3Aw6b7tDzg0YP/+DoJN
         I2o1Bfj+oWezqB8dSMtCqGjLg0Q1MHo4waSvXFInO5X45TrCL05iy9HtzwhlN8YmhJXB
         H47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611426; x=1742216226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YGvj5iF7isPICFknfIGBgf8Vkx+OSuL7svbCQwNvKw=;
        b=CU8c9XZegtuB6Af1Srnnn97+mwfx6ynR0mfJdks+vCVZ4AyTlEw88Cfeyrnsiwi871
         C3VFC5YDYzUCJ7Qev1zz9rF9fktJVdjqiZXPjbVH3ExQ06TNs/g31c4r61dWGXmUH0Wd
         FWD7yQvUbJ8x0mFnzJCb5K0AGrnsmJkKxlyKuf2+4hGI2v/zBSPrXWmBYBUtAoo/PrUZ
         9qE+HyBVovreYMDh/mPfgZmxpVbwaJgdq9eEzjotLL8jqR3Qgys6ktDgusauQV8pWY5K
         4LL+Nz30qfxt6ZPAFqtdCdR/+UvOQ8aLOcrRMa9GCh+QPiQ8cR+CC7xrmILIM+q3puY0
         q6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8CbVPYIXqumr8DsVOKOi2bK1LtkVnobmZYYuFeqhnMc9Bxv6rZhxlKYQSnpnIsFWoFCMVL34i532EHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8QJDEA+TRZ7fZzQIC0oBzHqZhUwayB2CvCQ9SmCrM4Au1WALk
	Ai57gb8tDzU52mH8VlLnB5qVFaCnm5ZH0oUnyatsut7orI0LHQYx
X-Gm-Gg: ASbGncsfZ/ocU0iJ/XY7IGXTkbZYpTMj2OTzCVH9OqWe8fAI9hpjavTTNw3w8i3hQRP
	ux5P7Tn28pBr+TCzN6QJL9AmMqyufHOoRjmTBmv2JnTdZJIOom4tFKsHmEoa83IGFKU5tKBOBP9
	2Da9PZF1sn/Wtdf4xXmV+o1BShkx7/AGRsEfCPKjq6AVa8pvqxQdPOZIo/0u+qmkSbw+Dc5UXrk
	BxeLuWP00XljibpJdg+OW1PkibK7gmjX4F+zZj+5YCqb2U/6I5dhoQ6bFX+Scno+Ww/nihTA4CF
	Bll7z3tP4K3kc8GXpqvarkz6KzkGSU/oYNibwq4WVNaGukDik0QY1qCCGWbAYg==
X-Google-Smtp-Source: AGHT+IF1vXuuBbI7nLmEiCd1MxAiAY5UstFD2g17yL/xAwUgcupEf5SWUE4YyitfHSkIrkHA8dJSBQ==
X-Received: by 2002:a05:6512:b0a:b0:549:8c0c:ea15 with SMTP id 2adb3069b0e04-54997d99dbemr3607673e87.0.1741611425535;
        Mon, 10 Mar 2025 05:57:05 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549a17fb84csm548493e87.250.2025.03.10.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:57:03 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:56:59 +0200
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
Subject: [PATCH v6 07/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <e180c9de76bc478b5f25ab6f5f22377cd359d485.1741610847.git.mazziesaccount@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w5HoDH4+gEC/QhC5"
Content-Disposition: inline
In-Reply-To: <cover.1741610847.git.mazziesaccount@gmail.com>


--w5HoDH4+gEC/QhC5
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


--w5HoDH4+gEC/QhC5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfO4ZsACgkQeFA3/03a
ocWNqAf+IQRt3DbNgMIf3rJrd2r+owYri/t5E1ozJOi1oIR58An+x6UmSCHr5dJv
cDtlgGwGxpuGc3iPKf37jVUxxk5kp6JLA8NCuBXKc2tLL1Qc70DU7f19BKuoSsK1
eizo1NIesoCze4Rl/q7Fnkh+KjVhvmqjM7N7L8e7z54XTXxlWnKzXXVuEcYW2DBZ
qgaMrb1PiAebugxTKLNi5Vp83oR83dfsWOggg99Tcoy8YLRckErdPegMIo2wnG3f
xRvwu6TPWSHBpWdBM/WGvHbViyzVDblOoLkhGZ/Mgc0AY7LYZDQ/Q1hiSwl2W+27
let2ZeX5sAhxe8/7wNcP++cQwQTrJQ==
=+UhA
-----END PGP SIGNATURE-----

--w5HoDH4+gEC/QhC5--
