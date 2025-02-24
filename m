Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48308265CA8
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422053; cv=none; b=Q0uBjd1j3eobQnV4r8rghyLCj86dNrYZIeFIELvYHb5ftfWqXPgFU5HY63vqb2DcSz2sZywZxdqsjcdSq3DpXXcVw5ciT/TqYBhfhIBGWLzTMzxZbaEyceMRO1FK3KV2Hj6SI0wS/TYwV14eDwvn8KPkA1vlpDhz5EB2d0uiYMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422053; c=relaxed/simple;
	bh=JIpIZOP5vy73oO9iDSgdLJ1PBCR9YKveXma6mA77A/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3ox1uHJQuD3zCdy9wEq4X2349woF9yojWQiuwDucbxiTKIjtw1H9FSlWlgmTIoWBY7Awe2uN/UKn6BTbBwFSB0E36VI4vjDtDs0wTU1s7/7Jo5vrsmFfgwEprKaSEDq7gRF2+sl8x9rBnGMkDLue9vRS0HuM2Rz9Yiv23kqQKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILdDZKrX; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILdDZKrX"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a59so48971011fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 10:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422049; x=1741026849; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvtg9LiT9FPYIsAlfx6bzRkO3KM227JB/0Q4qpEPDEo=;
        b=ILdDZKrXMo3aIYfqM8+PrXmF7EB4TwylPcQY92LOorP7Y5ax2f716gGfz1T1lKaRxa
         Mpc49BUwdTdA2Yk02+0KCRkRYQy7Bd6qtHJy/4TBK/q8o3fve0dNpRpmU0E75cyVwrtD
         E8HMJ/3WwSGcLR+JvIbILQanIBzcl017d2xE+1Jmi77F+Ot4nRecZFSTF+JTyLVKIK6s
         pDhmQmDoFHI1BF/lR/cU0JKbL9uTC9aWLrsQ4wLESKfhGYMzdw/SyddaRowrjaWJw5zm
         a3z2U8NgWyffPLaboc/rAIdg+LvjUj2pi2YRKbcZ2i4g1Wb7OfmPxupaiEksQTnxS2FW
         ximA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422049; x=1741026849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lvtg9LiT9FPYIsAlfx6bzRkO3KM227JB/0Q4qpEPDEo=;
        b=KziJW/T5D0eubHRRPOwSQT5PHa0ZPCBSgoOu5j8FH+Se+2VfxW6KQC/jvnu8F5bu2L
         6o50XnOA2CtVSzR2OXXxAl2+1+glWGy/et5uRFXYlvDD2j9hiiPZ2gldhLqx6qqVElOL
         uFeiqjBLTjdrdfaWlQTEgQCcUrrN6KIokMr5cxIznPgURU/A7yg4S2myP2bhrfDdnqH2
         0VYgdduIvEaS//GVicW/8DeVVkUaUBQogc7T6opwgTDpANWTGT6MAMO0URJxJP/wytft
         73rEXcunjl/nZej6Rg31hrtK4G4C64ul2sndiONQIedO0wYSzjaF7Pz8qbR4Uhs9puge
         P73g==
X-Forwarded-Encrypted: i=1; AJvYcCWfXyQm3OnkMpDoe5iVuZXOdlqznAuWpKHlcDIHNucONaYqawkBWiji064RaZDAtpsqmVujCokG8w54ZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIoBRwNbNnOP528hUaZo0Uwc7BLX000zJLkGG/BlsAYuPX1eV1
	yV9oO1tmFNvyjNi3AID6QjvgG2mdARs/HwIeBTQBzYgScvJxNGDp
X-Gm-Gg: ASbGncuoJ4qcG8AAeEkW7ElOlyjMgdEjsmZcJFywsEpZbJqqV6DgskI5IX61nCtRsY6
	UWZWbXUk6bPOwloIEDOjFFiPn1hzpa419WD8K3WifMlIUfE5N256F0LiS6HydF0Vtu3LV3Nkham
	AFT0iNM67Ew/ZqLbl7BUKcY+IQr7Vbpvw5LwFgkr/ZVaN9JjXJbRxOaQXphNCpk20XXdQBY4+HT
	MKZuGaGQwtr2GyJCOAkYZd+zkr97/y8fgfh4L9xlfhjTOwvs6pWRgzc4s+ZXthLkkRjrhbPhsBA
	zCXnvSswwRfJKceY3Y+PhiYqrU0HuMyW
X-Google-Smtp-Source: AGHT+IEnOT33v2tdUxI89+C2mfa+nuzArxhmJ+3qGyLgimw3UzsP7sWa0GhRzJ9QUi85xzA0PWfy3A==
X-Received: by 2002:a05:6512:1244:b0:545:b28:2fa2 with SMTP id 2adb3069b0e04-54838edd962mr5783123e87.7.1740422049175;
        Mon, 24 Feb 2025 10:34:09 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ae82ecsm22381fa.98.2025.02.24.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:34:07 -0800 (PST)
Date: Mon, 24 Feb 2025 20:34:01 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
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
Subject: [PATCH v4 06/10] iio: adc: ti-ads7924 Drop unnecessary function
 parameters
Message-ID: <38d39befcca110132fd4349c87fcb5d7ff51a2c8.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8S99u4QPCxXt6129"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>


--8S99u4QPCxXt6129
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Device pointer is the only variable which is used by the
ads7924_get_channels_config() and which is declared outside this
function. Still, the function gets the iio_device and i2c_client as
parameters. The sole caller of this function (probe) already has the
device pointer which it can directly pass to the function.

Simplify code by passing the device pointer directly as a parameter
instead of digging it from the iio_device's private data.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
This commit is compile-tested only! All further testing is appreciated.
---
 drivers/iio/adc/ti-ads7924.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
index 66b54c0d75aa..b1f745f75dbe 100644
--- a/drivers/iio/adc/ti-ads7924.c
+++ b/drivers/iio/adc/ti-ads7924.c
@@ -251,11 +251,8 @@ static const struct iio_info ads7924_info =3D {
 	.read_raw =3D ads7924_read_raw,
 };
=20
-static int ads7924_get_channels_config(struct i2c_client *client,
-				       struct iio_dev *indio_dev)
+static int ads7924_get_channels_config(struct device *dev)
 {
-	struct ads7924_data *priv =3D iio_priv(indio_dev);
-	struct device *dev =3D priv->dev;
 	struct fwnode_handle *node;
 	int num_channels =3D 0;
=20
@@ -380,7 +377,7 @@ static int ads7924_probe(struct i2c_client *client)
 	indio_dev->num_channels =3D ARRAY_SIZE(ads7924_channels);
 	indio_dev->info =3D &ads7924_info;
=20
-	ret =3D ads7924_get_channels_config(client, indio_dev);
+	ret =3D ads7924_get_channels_config(dev);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
 				     "failed to get channels configuration\n");
--=20
2.48.1


--8S99u4QPCxXt6129
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u5kACgkQeFA3/03a
ocUP/wf/VssnGJzhil921kJivWyVXzSnMaeybHUgfqTjw5Zs8pEJEjyxYGmfB0di
tjOo9fM6CU6pCBZ3XAkIo/2gIF6tF/T1WqB3fi0FCoEaBom/Yi415/zqjSVEBEiB
Xf3hFCVZ4JdCkVfk30vXw7hRKFPg6gaVwl+pNTRVWUXEUUVAYuuUCHNcJm7Xl9t0
jBu2CWoYYda3OcfMZ0Ur8P8ilEnUuLQ1xUB9L5gTjS07zBUZKwGsXOUWcn1zzQl2
xBOhyA8kKiUUExnjupG8PFetjj2J96xvb8CKUhFYlL++kxVjSV69p5rrNGJNfoME
uHF7y3m7tQKmP0+oXv/AlOapJUp5BQ==
=3pau
-----END PGP SIGNATURE-----

--8S99u4QPCxXt6129--
