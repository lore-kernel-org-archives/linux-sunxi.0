Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1C7227E96
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611404; cv=none; b=a7ZRD565sS5fNlndcxgBNW68EHrsEKVtqo4Qj/hDoVXAT7uR9oky8cUxowfYuSIuPHAZBuQRCII2S9ADU0NZTdVZKPKc/biyS2HcglpyWvxqp8J62tyWk+eCHGYVC7wKc4MwMDyhzc88TEr31FQRk/pHDOdHsdf6lboK3Go20Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611404; c=relaxed/simple;
	bh=9XEoIzTALm7hh7yrSVv2U09laC08ux9o8z1W2L0FrfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEQ0gyClo4ZQPN1AOgc/ALV1qgtaqeICFthdp0vUw0CQD9dZwexmWQ3AFWRz8vZw6dsXGe23eQNt5y4BAr55WrTBC4DaC2uBZd37Cn3KyuQg629qVhKX6aVNkgS5bsnBqVyTM0jwu/Ufh42b2dQckMOPpzciZD/dBJQT0HESGbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DocebC9D; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DocebC9D"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so5053016e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611401; x=1742216201; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PcfEYtrJz5zWQt9AvTA5zPr+o4Ysr+2unMZ2MALKhvA=;
        b=DocebC9DdSqjoHE0HCOjBYQToiHuh9Y+GxsUAC8pALmiH4SFfhTdsnd75tIUvpeK2d
         u2ttNyWQdRpxXu7iDNPZsEfAKmkWLJe5f0PO/zXoRQM2cfmiMK3ATXQagPkgeoXYPuG6
         BZYlPHi7IWXmT80pkE7NpJ+OfkO8U79cqnenRqJCEkKttp4NkxrzznxW/DtjcEpdkxLH
         ddzUrg6cSdXY3oNzwflSroTqfHOnBOzQ7VoNjuaBOZtCEGGsaPNtcC25zQOq7ti6luan
         5Evy7liKhmqthG0S00sE4dUJi8eMcg7YoE4NyQw2XAczhghQmUSK5GO4VG+LuAM7tK01
         /44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611401; x=1742216201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcfEYtrJz5zWQt9AvTA5zPr+o4Ysr+2unMZ2MALKhvA=;
        b=S41DGlh6zp/0YAoh3x8ATNH68Z67Xcdjye4sBli6Jm3+bZX+XBtTAcbMfDXqAsv2qC
         pH0XKdI3eHRSz8ofAkMq+8POe2WOo5vVY5JEg8hjn8GP0FlP29QRJNYtOVffGxnLtq5t
         2xIT6EtzPSfmQA8M3zd/Ea0Q72NeecQyBJtI5RSqW3nZo+h6wGo87hC9xyLofm1T76za
         LeJWdvcaRttfGwoWJfXsoVto3isTD874RJY/b8F4VYjZ4xKV/pOhxXYZ109jUcHovBJ8
         jtmtuk9qOYmzHVFW4D6yBLj1vtBHvLGm65UgnapN0dlfPb9mSh+KeUEpcCjqAiMUXxaJ
         MgXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3jMiUQFaWcqlDIr1zLCA5qsoH9sO6TTUgrueP6m5Gvj0xqA81XycXdzxcLWVFjOTagMhvS34k9AexhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRc07mQKlWCM7t4tlN3YRDvFsqs4cReYzbWBRNJ4aD0+C23uHV
	ARnmUdv6gj3DLNGckJc3XX7yhOcDEjswMUPj05zQFDRI//+kV6qC1xyHqg==
X-Gm-Gg: ASbGncuZd2czQlm+6DUGqXusuTdGYtJ8BgJyl8TaLDSW0+qMywV9gboJG9oltR1iU6+
	gpxNw0teV7lC/jwUhArMgYGkbdwu1rSDgzz7xBXWVTNbKMe5SNCEpVCZ2S8f/p3wgbQHTf4InPW
	yESSjl+3uAmWp66RSaNa32fgIqprnb4spLGwXuA370LRCQT0RtYbEGDcY/1kA0sMWkolSIVZ736
	+L8iI06cXR8QsZqBRPGsz5qRjXIX3CNYuCLS4+Pt6mtrzi0dr7tyf4+IztRMk7N1vjyIgJDH1XV
	xLB2Fqv3e+3No+9scPfFGUbjNpOK+obmZwmjt0T9t4pC3PvMfeE=
X-Google-Smtp-Source: AGHT+IFRmSf5GiiM8bfzTIfNKKyhDwDuNOYO808weMLsGD1nweR4GVyow1Hcgy16MeoRt06G5yQKvA==
X-Received: by 2002:a05:6512:3993:b0:549:792a:a382 with SMTP id 2adb3069b0e04-549910b59bdmr4168207e87.32.1741611400636;
        Mon, 10 Mar 2025 05:56:40 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae58e22sm1449802e87.86.2025.03.10.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:56:39 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:56:35 +0200
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
Subject: [PATCH v6 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <06e8f4f84731df9fc5d6f324e74fbd1bf83a81d5.1741610847.git.mazziesaccount@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JowyB6chBVFkTBVR"
Content-Disposition: inline
In-Reply-To: <cover.1741610847.git.mazziesaccount@gmail.com>


--JowyB6chBVFkTBVR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
drivers avoid open-coding the for_each_node -loop for getting the
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


--JowyB6chBVFkTBVR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfO4YMACgkQeFA3/03a
ocXu2Af/T06ImH4ZvUrc2LEWGPWz5jQ32YPvoizwaT8sxZSy0oMBQhUDltshWQbl
CoMzoDJ/zWVNxpzjAU+SrP2mOtUdPlLzUCGLSqryEKoj3eNXHBfBGDdhHXOKl65p
mYldt4ydWOcrGDUUypWWG3QLyCDj6w0D6vtMbNzvW+Ue0cUk0+QxZT8iDMRFEAi5
+sJQp7TNbaTGFd0kjvr0o/FV5PPjW8kRWaG9cZJ8f09xgjMAdGIgcLfogw+RrTme
vv1G1ighu6XHhJDdpHJ/OufusDu46tWJBa4HwCXc7osBfXiGuvAW0YjrZiOOg5Bs
b/8opt91KLvW/AZ7SvVmj4p+2A8aug==
=oACh
-----END PGP SIGNATURE-----

--JowyB6chBVFkTBVR--
