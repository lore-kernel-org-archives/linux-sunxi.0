Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68853262D38
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422036; cv=none; b=sbIy1Wa8pwErafgWKe8ySRASWMFGeZTl4HVDm/uScPffCpo5Lx8SUcu21rnHQMowwQPj5SJTfKB/0F7PVdRvSK1WQWhEl2CMXbgTT26cEjYM6OXAzb29EN/vme6UuKHk4KXmOxjvfvEhKBrGzyeOl3uzuFqWWeQzG1Ep53uh7PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422036; c=relaxed/simple;
	bh=DNgabINj0/zQQQgszmslDd1ZCNia1KB91/1Io5eaLn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tn2i/f45/s6SKBEev5kqMumxCnSn5T0nL8Vd+7xYr4z61wKHGNf1MymoLFHuO7KIduJVvqOT826TZpLBIKNbYGlacRuZ6pGNCCFwMem81+Og1MGLEZrYTz10a7g/GkH8h67w5cqAbFMsc2xJfdYmlsVYADxE76joqVkuExDUalg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdcP2TMm; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdcP2TMm"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5462ea9691cso5271961e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 10:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422032; x=1741026832; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=heP8tu0ZCh/Rz+nsytMurli7kJvo4BfOkz2KYfukdDQ=;
        b=kdcP2TMmiLeiwP8L1Y9TzUOW+7f0cf9KgNgHx0xJlkkwgcG1mEBh5RT8TkShfk5v+U
         5xpwu3Var8v8HRTeIDLynkuvw3q+sd/dzAG6eRRg14aZie5l7tpGPM7kgnLAi4UcJMzN
         2G7HvysgOKFXgsjHsZD5qqeeRKeAcS2eM1rTppJwKDfUZ9uR0sdPEOi8FLhWTze0WztP
         RUKhaqKSMKDzn5rEgB1oPWuAItsIF6Al1sjI1ou2XBegfg5UjCI2VdNhHyMBZU37piFC
         vBUi6sVrTtLSeYJJSeaw/hGW8935JJfDexf8c4295TVX2BFrUJlfAswWU7BQVMGzzgEs
         zULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422032; x=1741026832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heP8tu0ZCh/Rz+nsytMurli7kJvo4BfOkz2KYfukdDQ=;
        b=qS+CzHokdQomYXzf8kF+rwMiZgMcmAAs9jXOCEeK06matvnDbbHohzo1yZjVyAJL0F
         U7dIysOBJ4IPHhSxMugfM3T77MkkELMZ+B3EQ5WkgVz9z6Pimxh9ZmfD8c6jdhHmL8fm
         7lnE0ZRjNAvOmaEVuRqdIG4lKpqPpMRFX6lKyP0s/CCSnFqxc2oMZ3KmcE6qeGg97bcy
         QkRs0uM8CfhpX6akXs9fR6rGMZM9mMB/C7uNeaBazwASno0z3AgyWngTe8w+zkRX7SvP
         i8l4bPPNtLYa/oRpRW3mEGFkdd5uwNAsw05YmdSb1fm/BvxzeNg9OeIKkizzsyNfjUG1
         ql8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqWQEKvd8nJQ5QEk087s1euZ+lmTQDm8Oub66VIecJYuz7anUyUcdrIflc1/TM4FD7pnkgOQo74zgMAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs30TwpXukI3Sua9agc6SUIBQ0dmmUI6DdchPTl7DfR2To6J53
	UH3WjRQKP5Tagr4jLAWzImxTBki612dTKU/2sm7GP/Y2dBwwqNgS
X-Gm-Gg: ASbGncv+4TFATdtlkA8sEnz8s1XzqIBoBEavwOrlmi/6PNe3ZJTp6OEfP5Bhfzbkx1d
	YqLN27p3tTHVleG2e6GN9N8XrLOF785+pBlz2f+YNMw70aay7r9ONhAsbeKiFvyXKuscLjbGoiy
	GJer0Nq2NdyHQADd0Xukl1/PsYxJaIyD2L+KcYWhDDj0e+kH77ke2FsmuxyWhUgaEAYtjLvzrJq
	LpUb7MAg6ZAwkdD+nJCjHTRvTE6VHYfhKL2JFsG/6q2pdT3yX4m2ON673VkFiYCeFM/EOyNHIvJ
	vkZRD9xqpGi/+kjC1ttgVFgbPJ6xZGqZ
X-Google-Smtp-Source: AGHT+IEPWpkUpgPr0eB/Achjr7Rn3Tb0Ji8xC1A5AEo/ZmVuif3jXu4CrP1IlCZOVmjDn2HsR2pkFg==
X-Received: by 2002:a05:6512:280b:b0:545:1e2d:6b8e with SMTP id 2adb3069b0e04-54838f4ee02mr4841783e87.42.1740422032277;
        Mon, 24 Feb 2025 10:33:52 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452e4b08dasm3063356e87.87.2025.02.24.10.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:33:51 -0800 (PST)
Date: Mon, 24 Feb 2025 20:33:46 +0200
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
Subject: [PATCH v4 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <a3c579cc96b35cae04f6090d98c7672c48fa8347.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SN0UVbzzUhiLmzpo"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>


--SN0UVbzzUhiLmzpo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
drivers avoid open-coding the for_each_node -loop for getting the
channel IDs. The helper provides standard way to detect the ADC channel
nodes (by the node name), and a standard way to convert the "reg",
"diff-channels", "single-channel" and the "common-mode-channel" to
channel identification numbers used in the struct iio_chan_spec.
Furthermore, the helper checks the ID is in range of 0 ... num-channels.

The original driver treated all found child nodes as channel nodes. The
new helper requires channel nodes to be named channel[@N]. This should
help avoid problems with devices which may contain also other but ADC
child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
string didn't reveal any in-tree .dts with channel nodes named
othervice. Also, same grep shows all the in-tree .dts seem to have
channel IDs between 0..num of channels.

Use the new helper.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
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


--SN0UVbzzUhiLmzpo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u4oACgkQeFA3/03a
ocWbZQf9ENM9NOauYJv2UjhpBSTG5JItz5FY4Ls+WM6co9Ueho/lhcnSyp002koJ
D9fFrMq51TfFu2ABL7fETrJ9gmYl0dOTD7C/w2ayltZKZrPiBmmjnU+hLl/0eiF0
YAZAQTPVFUdTQSHmU+GnBa/ruBAyxjl81h54lON13X9gpP+IDqAhc+1IKXTSRA+Q
DfWzAYk/qTCA/S5UWjrUZXAu6Q7cG1YfvGw0m7FjryW3GEDvJ0OF9ejaLxpstlnj
3SQc3hqfmtgaGK9WoOGVOup4R92TRVwl27rmYUt0B6xOtZ3MBawR3ivKFCxF1ZG4
u+vpEVi1loNi09TGLVyMFz/RaxOgvA==
=RyMg
-----END PGP SIGNATURE-----

--SN0UVbzzUhiLmzpo--
