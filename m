Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E21FC0FD
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741850339; cv=none; b=SpiFCBxcHDSMQJmbq6tYbvurVnBJUKeugospe3RwTPAOKJqtiCL3rj/e/AJC7YA/ReksxrW+bDEz4BKu38gHLr4NcdkMghp+DS3z3B3w1Y75rkon+iHaAEoWpR+N+yZ15f/HAJNNx+a7owP+FQLoFkEUYqL+wP6inZCtpg+jsro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741850339; c=relaxed/simple;
	bh=Py6P5qIQMYgTW/EN6fjs6QOlBpfBZ8Vn3jJYYY3XtRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7i+8/gV1yMgfvpjb1liDja21NvI1XPNzZSUXXVfVnm0vtYp3iyPT3ZooicZZlPszO4Bgi2+E5vfCAzP5U4DCJdWjUSUp0jgb2iBVAL4oBUaU4yyyyp2jNnhIlect8f+/Xs+K0CHUcUzuNN8s3YrSwCr8a62xu1sfd5D/BgeIHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eo2tAmdU; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eo2tAmdU"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bee1cb370so6769921fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 00:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741850336; x=1742455136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFD+DcpWsMqfiQV+ZB7bRLNZX1LXyd6tXIeA6qREGzs=;
        b=eo2tAmdURbTsohY3I7N9oshjZPa9SlxvJR+MJdkmcabr8HfnzSRnLAN7C7VVeDzCdG
         JwvwaVZA3BU3FvOHGYZ7ttuxK5kswaA4UUY0G1UefYlCTcnDvo+lSqshiqMttV+0qW+O
         Kx2G1dn82SmXi7es36TyzzjwGw7aQeqcVNQmukKX7Rq9+bLuniAJpQqal0NPxhgJyz+k
         W+VeYmRvKX6/EMqxLpFh/fArOtg7bi/xsCmqzZDq6m92zCB9Zj4Nr623717e1N/SOCor
         ye8wCztcUNCPLdyP3Ena/1P73MoYVRIjhKW5y+hObx1jJYaK88vBd0C25XpfBV0oB1V1
         RdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741850336; x=1742455136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFD+DcpWsMqfiQV+ZB7bRLNZX1LXyd6tXIeA6qREGzs=;
        b=KPfDNfchEITwn88WNc1YeDYn7wUgF/fsvAV7/GF3Jok8/xwqxEbHr0MmycOdeml6a5
         78dmB16Hh+C9C898Nf3PKoucuU6hLvEbIRI2KJ9RZy7RSg5xAYReauN2EMiMWUnzKcSm
         1rh0H4xrcdtLC/mNLd3fqYIP0w6BjUP6U2Gi5qDxQFwAdaw/TFqF2KtSgKRYKcCpLlJO
         mZHPMGM9rZZIFajbOWlIH1OMfIcyyKy+i7NyWVoxOTkyM+k/Lw1HO5hqOeHd6/+HNEaS
         +lkoRKFjXeoxgqL62P68XdwTXTSCmq7hUQtCNvCLF4LWylSwgQId7KIiy3HigUfj6N7P
         Qs9g==
X-Forwarded-Encrypted: i=1; AJvYcCVriaFv+k5ysVBMkIijmHmpcOaeVgQ6mQzT8ulKuqYxORENeuNrEYg4lLn0pAdiRBXLK1Xgdbyp4le6Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwppxU3QGJ9pjW/Xn1x4ATuEu5iS3l8wEq7REortFbg49RY616H
	fOZ7ikt1CRv3rAStr9Jej0HYWFvpGU+z/OZND5ASow/4IUMTWW3P
X-Gm-Gg: ASbGncspJ5UmWB/VouTygwJOWK7qvOY1x4X/tKdobBxK++fQbIuIJITVLOpopKthoRP
	49kUYwve+bzxkvKtV9UxZikp6wFn8EEd4VTwVMLAtwPGRFZZ0JAqxXlqkNfsPrv8Zpj7OZl72EA
	zA9M7bBJr4Sz5UlknBboGlMF8TUT+nLFst/nTPOd7TOshukWgEd0HDqEjFIhF77O9HP2WyV9om9
	QPlLK4i0lDBIsIzSIMXVi2VZ7qYDf9S0nFUMz/mWwyQx1im4qXNf7pnNnDfAThR9YdffA5lYciS
	RwMBMC3TLzTZEMECDMneckFq2WOKBP4EDtxr0N+4LGIh0EmdpG8vDFlpTHrOQQ==
X-Google-Smtp-Source: AGHT+IHmLCwaOiAyND+HYla9YJ6Owuf2FrMyU+QZHQM+mLQ3MEh0Yx2JRunjCA8pnIPh1yD8DBMFSw==
X-Received: by 2002:a2e:a543:0:b0:308:eb58:6591 with SMTP id 38308e7fff4ca-30bf460589fmr89888051fa.25.1741850335814;
        Thu, 13 Mar 2025 00:18:55 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1ec0f4sm1170341fa.109.2025.03.13.00.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 00:18:54 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:18:49 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v7 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <df0b2b53affbef5ccb7219328cc15db3ba843737.1741849323.git.mazziesaccount@gmail.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CG41A4IiURwLiNo+"
Content-Disposition: inline
In-Reply-To: <cover.1741849323.git.mazziesaccount@gmail.com>


--CG41A4IiURwLiNo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new devm_iio_adc_device_alloc_chaninfo_se() -helper is intended to
help drivers avoid open-coding the for_each_node -loop for getting the
channel IDs. The helper provides standard way to detect the ADC channel
nodes (by the node name), and a standard way to convert the "reg"
-properties to channel identification numbers, used in the struct
iio_chan_spec. Furthermore, the helper can optionally check the found
channel IDs are smaller than given maximum. This is useful for callers
which later use the IDs for example for indexing a channel data array.

The original driver treated all found child nodes as channel nodes. The
new helper requires channel nodes to be named channel[@N]. This should
help avoid problems with devices which may contain also other but ADC
child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
string didn't reveal any in-tree .dts with channel nodes named
otherwise. Also, same grep shows all the in-tree .dts seem to have
channel IDs between 0..num of channels.

Use the new helper.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v6 =3D> v7:
 - Fix function name in the commit message
v5 =3D> v6:
 - Commit message typofix
v4 =3D> v5:
 - Drop the diff-channel stuff from the commit message
v3 =3D> v4:
 - Adapt to 'drop diff-channel support' changes to ADC-helpers
 - select ADC helpers in the Kconfig
v2 =3D> v3:
 - New patch

I picked the sun20i-gpadc in this series because it has a straightforward
approach for populating the struct iio_chan_spec. Everything else except
the .channel can use 'template'-data.

This makes the sun20i-gpadc well suited to be an example user of this new
helper. I hope this patch helps to evaluate whether these helpers are worth
the hassle.

The change is compile tested only!! Testing before applying is highly
appreciated (as always!). Also, even though I tried to audit the dts
files for the reg-properties in the channel nodes, use of references
didn't make it easy. I can't guarantee I didn't miss anything.
---
 drivers/iio/adc/Kconfig            |  1 +
 drivers/iio/adc/sun20i-gpadc-iio.c | 38 ++++++++++++------------------
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index e4933de0c366..0993008a1586 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1357,6 +1357,7 @@ config SUN4I_GPADC
 config SUN20I_GPADC
 	tristate "Allwinner D1/T113s/T507/R329 and similar GPADCs driver"
 	depends on ARCH_SUNXI || COMPILE_TEST
+	select IIO_ADC_HELPER
 	help
 	  Say yes here to build support for Allwinner (D1, T113, T507 and R329)
 	  SoCs GPADC. This ADC provides up to 16 channels.
diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gp=
adc-iio.c
index 136b8d9c294f..bf1db2a3de9b 100644
--- a/drivers/iio/adc/sun20i-gpadc-iio.c
+++ b/drivers/iio/adc/sun20i-gpadc-iio.c
@@ -15,6 +15,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
=20
+#include <linux/iio/adc-helpers.h>
 #include <linux/iio/iio.h>
=20
 #define SUN20I_GPADC_DRIVER_NAME	"sun20i-gpadc"
@@ -149,37 +150,27 @@ static void sun20i_gpadc_reset_assert(void *data)
 	reset_control_assert(rst);
 }
=20
+static const struct iio_chan_spec sun20i_gpadc_chan_template =3D {
+	.type =3D IIO_VOLTAGE,
+	.indexed =3D 1,
+	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),
+};
+
 static int sun20i_gpadc_alloc_channels(struct iio_dev *indio_dev,
 				       struct device *dev)
 {
-	unsigned int channel;
-	int num_channels, i, ret;
+	int num_channels;
 	struct iio_chan_spec *channels;
=20
-	num_channels =3D device_get_child_node_count(dev);
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo_se(dev,
+				&sun20i_gpadc_chan_template, -1, &channels);
+	if (num_channels < 0)
+		return num_channels;
+
 	if (num_channels =3D=3D 0)
 		return dev_err_probe(dev, -ENODEV, "no channel children\n");
=20
-	channels =3D devm_kcalloc(dev, num_channels, sizeof(*channels),
-				GFP_KERNEL);
-	if (!channels)
-		return -ENOMEM;
-
-	i =3D 0;
-	device_for_each_child_node_scoped(dev, node) {
-		ret =3D fwnode_property_read_u32(node, "reg", &channel);
-		if (ret)
-			return dev_err_probe(dev, ret, "invalid channel number\n");
-
-		channels[i].type =3D IIO_VOLTAGE;
-		channels[i].indexed =3D 1;
-		channels[i].channel =3D channel;
-		channels[i].info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW);
-		channels[i].info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE);
-
-		i++;
-	}
-
 	indio_dev->channels =3D channels;
 	indio_dev->num_channels =3D num_channels;
=20
@@ -271,3 +262,4 @@ module_platform_driver(sun20i_gpadc_driver);
 MODULE_DESCRIPTION("ADC driver for sunxi platforms");
 MODULE_AUTHOR("Maksim Kiselev <bigunclemax@gmail.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("IIO_DRIVER");
--=20
2.48.1


--CG41A4IiURwLiNo+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfShtkACgkQeFA3/03a
ocV0VQf/bSuM20DCboJT//bmPStw7rxp+5V2qaPIPPnR8lochMA4g+bGRDCxrPCf
njoGMR4SXx8lAo7qTKIKI38WiXEGZt9UWZ3ChcTOJ1TwK70piBL85trcp9wYOsv4
OTug6csBzfPFoWg1KdCGBnh83jGkbNv/Wz0PqqKSQfXY1ZCK+VGLc+BZtYvpjkoV
DpvAnntsFD98gpmT+iKgOOx+oIGzcf/qm1URB0hBJRHtLmrp4Y/9ddzEXWcglEJe
eLLAe1ioYE4+qdj0PaRgfMN4dOEhnz+QaweILOQAfpjz2LCXEZMRQA65Tt/gqzGZ
bI6YQp3BPyhLIPUXiwks1S5EJmPyug==
=mpTG
-----END PGP SIGNATURE-----

--CG41A4IiURwLiNo+--
