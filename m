Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B923F282F0
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Mar 2025 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800419; cv=none; b=NdFlEGpoz5O0pRYf/dFSETek3kQGQW+t+tBy30ntmXcUDSXuZIeCh2cBX2BRFjfbe5j0gdTrTPe2BEdYEHxwCC5sQbczxs4GCIGRGKiBmoaQJ6zoKyIIlxfIc0buXkP42B1g13D9YKFKQi40pw6rvyJnysSFBYl84nykMfLqNAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800419; c=relaxed/simple;
	bh=NSMSptKDxxA+mg30jX+nwXZbs8BZotVym0oijYtttek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVNVhXCSRBB/71SgIJ8TyOQGA3iVdMs/HeMux+BoUdWjGYy23HmRA1US1KM8aPa5HcvzxE5VHwYUe7ibcelgeY9XYdlLSYlf0rwRqW4pN1hx2/5aAJI47T8b7lGLNLJRedfs5siq+mZvLlGOWnuYdDHod6bk9COWkIBxHn4FzQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSfsIoT2; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSfsIoT2"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso35390681fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Mar 2025 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742800416; x=1743405216; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgmO3spMSV3ya0XSwKi8qyhViZcHQWh3KY5h+If7iMY=;
        b=YSfsIoT2XNyCkyFCVzvkOd6yrshzEDQGVo5HJqgsCKKOOkpWdTrQzmNjYjwQTYSJr3
         2TipcdGgLHitBr7yZZSRDytOeQfPEDocp7KuW9oSYQyChzis/IuXoRLob88zitGJqCFZ
         +Z6s0XZ8VDT8nIvtPZ2BAjQuowE1Wz2Qgw2ZcyrOLKmLMmKMG6eeYcWltNenL38DIIop
         OZlGVucFaeLExkk+nm7198QTZDHdMmOJcVhU5KdtS1lNDi8yyK8MLXFQA+/OxNfziPG2
         LqC0FZkDTg4M7KFJpTqjca4dHrI7eXZgWVUAJ9W8mOjC7fw780falYBSHAffNCeenybK
         lK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800416; x=1743405216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgmO3spMSV3ya0XSwKi8qyhViZcHQWh3KY5h+If7iMY=;
        b=Mx7U1mkXQrpELgcwTF82dgME7Y0OkfWcWmrSD4EKkxRvE3b/OvZgvxty1KIOrc5fJX
         9Y4GjVZsvAB8PHIHoZG7U9vkqXjSjDYG6GhZxmx7sxf46vkrsjkHGoQIG2kXa351Skyk
         EOiSkiHvblExO9tMHiIQs0dkkdpbdffo+UcV2gg8EdoexJcSr4cGoFQS6Ag/LchC/EhP
         raCsJD5/ivkTcVfSDWmdOAnLb6G0E6wX7v10Pe6IcX70rsbflLbrhnmgPY2Dj/jdsbiS
         s7l/6pfQr3MLbp1ojpEyGHALKEpKC8aE1YzwQyCV/N8oMYwP5Yf1kpiD9VV8bib61BlT
         PCyA==
X-Forwarded-Encrypted: i=1; AJvYcCX7c07Vhsg1x90gwejqHPORz3VBvTDJz5pA0N00pbycArBNsXRf2srTz1zwSJGGzz+fG9aRiJgYyb8LkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRXG1vpEnIzESyM0eV77gzMDvqS3hiXqGsbQacpyMRlCba/YWh
	pbEsEGPlQFcNCTa+FxvQaxUkM4Qjurvw9Qr53nvuMmvNmQevq+hg
X-Gm-Gg: ASbGncurUn5PxUS87P0iiuId6gl02pBThFWM1QIJJrjKdt6AokV/VQA7kj5Lwa/fbyF
	n9iEr4n4aZDOFeZ+WMGujMqkUmY/jLlMcCkOpBf+egljzLINuXkfxgIjs0iqjdPwV/fqtc/muQD
	kXsz5JaHdL49+Fk+NZTugHs3mTI+aj7O/7atbsX1D+maHYYkJ/G6tKQ/vn9rURAELHlB9ubqheq
	EEoJfgoerQRXyhc5E0Wj+fQX0nEgA+0It7gjJ5LUCQNp486RwwL5f1Hf5yDi9LOK1utDAkAPXin
	yMIBmf9DdpzdDv5sbwzuvGFjY32+bIPSHaCjVwb/YSp0PG/F3y0=
X-Google-Smtp-Source: AGHT+IHvmMZhQ7UINc12GkdV/NNFv5twVruKqPihFFYmoT9ixDrjCc0MP+dwSTZVKrnR+Hoq28l74Q==
X-Received: by 2002:a2e:bc1d:0:b0:30c:2ff9:913f with SMTP id 38308e7fff4ca-30d7e202fcemr42821831fa.2.1742800415667;
        Mon, 24 Mar 2025 00:13:35 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d913196sm12558171fa.109.2025.03.24.00.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:13:33 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:13:28 +0200
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
Subject: [PATCH v10 5/8] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <e367a803c0d625e60c9fca16c55a25eee06b5a89.1742560649.git.mazziesaccount@gmail.com>
References: <cover.1742560649.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sLfxLgpI+RSOHiBu"
Content-Disposition: inline
In-Reply-To: <cover.1742560649.git.mazziesaccount@gmail.com>


--sLfxLgpI+RSOHiBu
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
NOTE: This change now drops a print "no channel children" which used to
be printed if no channel nodes were found. It also changes the return
value from -ENODEV to -ENOENT.

Revision history:
v8 =3D>
 - No changes
v7 =3D> v8:
 - drop explicit "no channels check". It is now done inside the
   devm_iio_adc_device_alloc_chaninfo_se().
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
 drivers/iio/adc/sun20i-gpadc-iio.c | 39 +++++++++++-------------------
 2 files changed, 15 insertions(+), 25 deletions(-)

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
index 136b8d9c294f..2428ea69d676 100644
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
@@ -149,36 +150,23 @@ static void sun20i_gpadc_reset_assert(void *data)
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
-	if (num_channels =3D=3D 0)
-		return dev_err_probe(dev, -ENODEV, "no channel children\n");
-
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
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo_se(dev,
+				&sun20i_gpadc_chan_template, -1, &channels);
+	if (num_channels < 0)
+		return num_channels;
=20
 	indio_dev->channels =3D channels;
 	indio_dev->num_channels =3D num_channels;
@@ -271,3 +259,4 @@ module_platform_driver(sun20i_gpadc_driver);
 MODULE_DESCRIPTION("ADC driver for sunxi platforms");
 MODULE_AUTHOR("Maksim Kiselev <bigunclemax@gmail.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("IIO_DRIVER");
--=20
2.49.0


--sLfxLgpI+RSOHiBu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfhBhgACgkQeFA3/03a
ocWpAQgAtegzSV9b1MqKbin6TsL4sVZQhZBySnTY3uMGX61W160CWt2mo5soZW3q
gIRhD6/UED57xk8uEGDMZBfhh82692r/hNo8n7xviFaLGyNsjUHwrfTUU3P4piiz
oiUFe1ouZy6Wr0HDDLiH3UVA4d7nVInoRRQwjS+JHEYAgAW9uSZdEPFO8Rttu8Zz
SEJlDv0S/7tNWcOd/se0xY9q/wWNVscGP5HKoTnLyuhM9o2FGMyj3v7pE726ZTf3
18s85OQuuADurNKaLCC27j7SngXG09vpxygdfYde4/kBUluLoywjGtnCmYWU2ROh
m+SKv/ht5dpPDhR2XQbpUEu/wT3hTQ==
=/T4m
-----END PGP SIGNATURE-----

--sLfxLgpI+RSOHiBu--
