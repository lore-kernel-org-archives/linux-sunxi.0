Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071B41E1A2B
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968351; cv=none; b=OccsPvE9ZV47Iw3nhDVtXvDlVSRB7YvBTozu5/TA3XIIAldZhH6NgZ39gdSvVhglSWtQS33eyM8V82DFna4cheVUBQmxdcq+uNHbus1huG14Q4KqhMvWfiqMDhbL0wp9RW3xpQq8v0htAdi8QKiWp7rhpWexspqgt3zi1Uv8psM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968351; c=relaxed/simple;
	bh=H48Lkeq71Idm7qh8MQ4iHSeWtKwyxrxWrUPyhfQpTto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FK83F8LKfMfHhxzTrFRSPo8OODshVvrrWHgY/oyO4ZNrJjBK3kosDUTkNHkNQ2oYtt7ROC+EnoIdBQWAiRn1ppS1WWORNzKVtphtCz/+ndd/PqJWRy77FjWUWgAd6mIKi2gRBHxJb6SrY7us02bGUVfH6LlfNt20+zQ8h63iljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkK/M+BX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkK/M+BX"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30a2dfcfd83so32471991fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968348; x=1740573148; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0DYvjW5f0VauVHlYQoEoi+1LNEnpUSDiH5KvYpk6CeA=;
        b=SkK/M+BXw87l8kA5R/qDNFVZoaErTVmDaArqVaXlhsUL15mpEAKWBUe4fixOzIWFvu
         4Hi7S2PcYyNE2Er/qPQRYAqGd9isbKdQySmmAoW6KDjjNbDykEGGtUkZ7Y8RMrTMnkxL
         ShZ49yVjWY/TqMpmAl/UmnLRyAlf5Sp8d1UlS3cHhQ58IXVj5i/JGbAFRHrMH38tZhjr
         s9UFZVMIvjl5R70HxhPYeVJRqt4f+JKKei970fVKjzN1P+3YpcignN0W/kIVXeyYgw3Y
         TGLXASax0sily5KvkXIJRfecrTgpINbCvOW5hlNPs5IVr+5IgCSmVnzRZMFZzvlNa0y2
         +fPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968348; x=1740573148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DYvjW5f0VauVHlYQoEoi+1LNEnpUSDiH5KvYpk6CeA=;
        b=ZOxY1kwyNtgKKRTFji/EVhZKbiHcc74pVC1BPsaXV3Wyfc//KjkRFge74N62WXwK8T
         D2SG1bVrKbw0OB0Ea33MH3RV5uJ3DeOBGP85hJrCj2XCFlGdW9yH+io7hosUfgApvoM0
         TXl9MqMu8Kjr6Epo0Q0MF3OBarwAI9o2Ym/86qpj0Qeq6g3B+qNy5NgvbOy4PpOFHID+
         LHql7AsX7rq2lk9ptH7PC7Kr2SKiBxLpzTNb2XlR6mO8zCsiZXImwNq2ELGNeuGZcOzk
         BOoWTbKOXeSDup5Z3J2nc7ipzKkx+kGVH1mBtAEu65GK03qPMKmHsG0IogAf/x+Qy924
         5dqg==
X-Forwarded-Encrypted: i=1; AJvYcCXnvb0EKuKOTc7232e7D6ezLjHgPgcnia2ekdndsjv0z6Vofv4gnAnTVCk5sJU3te7wfqVvL3xXeTqRVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVeKkbOmPh1zgTAKxttrq651i/dGa7VLLzkYtJK5UElwDiIMkp
	xpY35KUar1bOdAwdYBfX1XYJN2ZLGUWQNgCNdgEKjSw+Vw1kiWZN
X-Gm-Gg: ASbGnctDYfz9aljZcwVJpPMd/z8cT0WqkFCKFztZ5WoJ6QfU/IPLTMZNV4iPY2cGgz0
	1q6hhzoSeQJTv3Cp472bmZCsze3ALyF/WVHjQVUQBaAru5DU1XNBrcVvEIkU5jc4PNY+n+lnCDQ
	OI5Bq+WD2Oh+BHNCjF+up32kZfNULQvgcZzlj/KLGkHMXKUdEI4AuZDgStBNhHplDZdFqIRpcCz
	rZSfVeTWqi2BcHwkATBqIgtR/qxeYN2ZZjFk6fMGlAjzfxC0FbDuB2zgQCEjd/eF2r2dFBcOs2W
	7o2RlnhX6zHx9D/Pfj3sRQ==
X-Google-Smtp-Source: AGHT+IGpj+sXTk9ydInkrFSzD/8u3Ea569jfA3qPAyfTIDaLYJDMfGIteoPF8DQijF1k+5z6DuXOPg==
X-Received: by 2002:a2e:9905:0:b0:308:f01f:181f with SMTP id 38308e7fff4ca-30927aff022mr48385981fa.31.1739968348109;
        Wed, 19 Feb 2025 04:32:28 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a344c8900sm9350131fa.22.2025.02.19.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:32:27 -0800 (PST)
Date: Wed, 19 Feb 2025 14:32:23 +0200
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
Subject: [PATCH v3 9/9] iio: adc: ti-ads7924: Respect device tree config
Message-ID: <3279aa9348e7149bfbd433daaa201f2eb5873e1f.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vg9phHNLX0RbBtPD"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>


--vg9phHNLX0RbBtPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ti-ads7924 driver ignores the device-tree ADC channel specification
and always exposes all 4 channels to users whether they are present in
the device-tree or not. Additionally, the "reg" values in the channel
nodes are ignored, although an error is printed if they are out of range.

Register only the channels described in the device-tree, and use the reg
property as a channel ID.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v2 =3D> v3: New patch

Please note that this is potentially breaking existing users if they
have wrong values in the device-tree. I believe the device-tree should
ideally be respected, and if it says device X has only one channel, then
we should believe it and not register 4. Well, we don't live in the
ideal world, so even though I believe this is TheRightThingToDo - it may
cause havoc because correct device-tree has not been required from the
day 1. So, please review and test and apply at your own risk :)

As a side note, this might warrant a fixes tag but the adc-helper -stuff
is hardly worth to be backported... (And I've already exceeded my time
budget with this series - hence I'll leave crafting backportable fix to
TI people ;) )

This has only been compile tested! All testing is highly appreciated.
---
 drivers/iio/adc/ti-ads7924.c | 80 +++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 43 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
index b1f745f75dbe..a5b8f7c81b8a 100644
--- a/drivers/iio/adc/ti-ads7924.c
+++ b/drivers/iio/adc/ti-ads7924.c
@@ -22,6 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
=20
+#include <linux/iio/adc-helpers.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/types.h>
=20
@@ -119,15 +120,12 @@
 #define ADS7924_TOTAL_CONVTIME_US (ADS7924_PWRUPTIME_US + ADS7924_ACQTIME_=
US + \
 				   ADS7924_CONVTIME_US)
=20
-#define ADS7924_V_CHAN(_chan, _addr) {				\
-	.type =3D IIO_VOLTAGE,					\
-	.indexed =3D 1,						\
-	.channel =3D _chan,					\
-	.address =3D _addr,					\
-	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW), 		\
-	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),	\
-	.datasheet_name =3D "AIN"#_chan,				\
-}
+static const struct iio_chan_spec ads7924_chan_template =3D {
+	.type =3D IIO_VOLTAGE,
+	.indexed =3D 1,
+	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),
+};
=20
 struct ads7924_data {
 	struct device *dev;
@@ -182,13 +180,6 @@ static const struct regmap_config ads7924_regmap_confi=
g =3D {
 	.writeable_reg =3D ads7924_is_writeable_reg,
 };
=20
-static const struct iio_chan_spec ads7924_channels[] =3D {
-	ADS7924_V_CHAN(0, ADS7924_DATA0_U_REG),
-	ADS7924_V_CHAN(1, ADS7924_DATA1_U_REG),
-	ADS7924_V_CHAN(2, ADS7924_DATA2_U_REG),
-	ADS7924_V_CHAN(3, ADS7924_DATA3_U_REG),
-};
-
 static int ads7924_get_adc_result(struct ads7924_data *data,
 				  struct iio_chan_spec const *chan, int *val)
 {
@@ -251,32 +242,38 @@ static const struct iio_info ads7924_info =3D {
 	.read_raw =3D ads7924_read_raw,
 };
=20
-static int ads7924_get_channels_config(struct device *dev)
+static const struct iio_adc_props ads7924_chan_props =3D {
+	.required =3D IIO_ADC_CHAN_PROP_TYPE_REG,
+};
+
+static int ads7924_get_channels_config(struct iio_dev *indio_dev,
+				       struct device *dev)
 {
-	struct fwnode_handle *node;
-	int num_channels =3D 0;
+	struct iio_chan_spec *chan_array;
+	int num_channels =3D 0, i;
=20
-	device_for_each_child_node(dev, node) {
-		u32 pval;
-		unsigned int channel;
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo(dev,
+					&ads7924_chan_template, &chan_array,
+					&ads7924_chan_props);
=20
-		if (fwnode_property_read_u32(node, "reg", &pval)) {
-			dev_err(dev, "invalid reg on %pfw\n", node);
-			continue;
-		}
+	if (num_channels < 0)
+		return num_channels;
=20
-		channel =3D pval;
-		if (channel >=3D ADS7924_CHANNELS) {
-			dev_err(dev, "invalid channel index %d on %pfw\n",
-				channel, node);
-			continue;
-		}
+	if (!num_channels)
+		return -EINVAL;
+
+	for (i =3D 0; i < num_channels; i++) {
+		static const char * const datasheet_names[] =3D {
+			"AIN0", "AIN1", "AIN2", "AIN3"
+		};
+		int ch_id =3D chan_array[i].channel;
=20
-		num_channels++;
+		chan_array[i].address =3D ADS7924_DATA0_U_REG + ch_id;
+		chan_array[i].datasheet_name =3D datasheet_names[ch_id];
 	}
=20
-	if (!num_channels)
-		return -EINVAL;
+	indio_dev->channels =3D chan_array;
+	indio_dev->num_channels =3D num_channels;
=20
 	return 0;
 }
@@ -370,18 +367,15 @@ static int ads7924_probe(struct i2c_client *client)
=20
 	mutex_init(&data->lock);
=20
-	indio_dev->name =3D "ads7924";
-	indio_dev->modes =3D INDIO_DIRECT_MODE;
-
-	indio_dev->channels =3D ads7924_channels;
-	indio_dev->num_channels =3D ARRAY_SIZE(ads7924_channels);
-	indio_dev->info =3D &ads7924_info;
-
-	ret =3D ads7924_get_channels_config(dev);
+	ret =3D ads7924_get_channels_config(indio_dev, dev);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
 				     "failed to get channels configuration\n");
=20
+	indio_dev->name =3D "ads7924";
+	indio_dev->modes =3D INDIO_DIRECT_MODE;
+	indio_dev->info =3D &ads7924_info;
+
 	data->regmap =3D devm_regmap_init_i2c(client, &ads7924_regmap_config);
 	if (IS_ERR(data->regmap))
 		return dev_err_probe(dev, PTR_ERR(data->regmap),
--=20
2.48.1


--vg9phHNLX0RbBtPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1z1cACgkQeFA3/03a
ocVfdAf/dJeRANmjD6kr3+nUZ8APPdoSBvKQHSWTTYvnKXYCZEJYrZk9e+UN3UAo
82YkKYpUqhArK45Dzjx9OS42+5NLtA2ejvZnApSvg6Zl6Qzth/UNCa0EKgJwLS5F
E1XAjDOuGlow3lkWtpGalu54LEEKLUMwlq0I18J/MKhrZAlp3yF63+GC5Bt0AwpE
9wUmQ1L13Hb/zSD+ub50UVmcPDAG3QCPzF5XFqCIJZX4UzDX7m0hh+cMYICn/92q
fb/f5L9zxO72WukfiX49W81NQ9bfBmyJyYTE3nnoPr2fvMxtq8PAQPqvklzBkF+9
ZzSYdwAyy4wq0CNST3K+ZG81JWsZoQ==
=/Rhj
-----END PGP SIGNATURE-----

--vg9phHNLX0RbBtPD--
