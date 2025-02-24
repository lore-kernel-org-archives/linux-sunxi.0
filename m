Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D98264A68
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422006; cv=none; b=I0hjDgTpPv1Zd3v5M5W4GQrUFI696PnCdYxMsij4p4slhNffRIlT/tHu7n9kcPwhTyDahaF/DbdK1pCPyvdCYCVsq8TcNbZAuTscOA5CJkicmZqfutHLeTtKQbP9HdrPjtA90Ba6voC+NyE9p0mDB9DBJ0wLQllgYOC0srKzT94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422006; c=relaxed/simple;
	bh=Ev0eYz4sPpsPFrs2YtL4T+4Bm2liPGWxuhoDXr1Jpok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZvzXkYlARqbdt1QQojELJHPkXEn8DYBoMyamLqQlvs/7rmu6L78vEsRDQWukfIAwllFxaYlSfn4SncUzxp/uS9As1Dy9MYWNlqerGf9zXKbjfydZT2El2MNh5/SsC/8HtoS4FLG2FhcykpXpzqpmnveSyph1ZTogbEG58bWvsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0fhLahC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0fhLahC"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-548409cd2a8so2969873e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 10:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422002; x=1741026802; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=va2pvWmTusgEpgeYLRyDeBT6KWSDeENhUBZHU/VVNr8=;
        b=T0fhLahC2wu4Z7M0n3EUd+9vgNOoaGzlRBM0gsWs08eRuoRmv9HpF5HKxuO//X179D
         zbbItGemkPOWkDGg+xyLSqtaIf3RTj/nqb17/Sfc84j2VK2pJeLKSeMtRmkNau5nzv8m
         pHycXc3/i8eR5hVy+dMlKWUVdNpnQV7laQCTZWwC2o4mRin0gKwfdHUXAcOVyKscWJWB
         4qxrmlRjATtkS6dgTEWvzfi3ALIFCK5gxN8QC/8/Rkjj8ioigxjkchjjxs9SIWP7krVJ
         whWHr+vJelMxbYb8N6nPwO7AaDl7PwxjeGkweIHxHw7bTQat3WiLYp0eZkBCFnq1SY4D
         8ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422002; x=1741026802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=va2pvWmTusgEpgeYLRyDeBT6KWSDeENhUBZHU/VVNr8=;
        b=CEfaczGKXURzJiybAQ51g5JeEix6ikq5kVhql1Phss+/tgg3l8wUVuNFOnLgl1yyMS
         309TDiyCexQmbiHbA9bdkqJlLf5+I1uAaplAUYQyd54ISjY6D5MKxRI6Rm6Wutfd+CGf
         X7P5ubTspSTwCqs+NrFrWnTfMRrluuGd2uV3WKx4gmD6YO51Nx5kqYf6vVMsZP+kGduj
         Uyj7Dqpkvuc0PgLc/+10HjWf3ZvpE3tEXWbiKTITZhYzWPbV+dB2t6sBjtb2mlo+8CQw
         KGPkYF5fuONtwJRbXPqzn1UfQInsNpiCDNZeWOK0mJIHgyoq4QAt+qZ6GWWMjnMzFjRg
         X6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI2Pz47MxLzfocatCUH3JgDNj9AzRP/O6dVX0IRkPxOi8LtQ1oNl1j9nYj1kztwHWQw+Su+BYSNPQ8dw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuO1LdVxw/QhJftgxxG+jmeG0BaZt3RB9dZg5Qr+CpUuI/hELp
	7bppPDdAeRntNjxcRe/RMcysKWmmR33/NXItKMUPNwOzr/GE5g0d
X-Gm-Gg: ASbGnctzxMD2UJhq9O5FdbmYeflU35pLEqPAR6MFjHWGPp4G5f2vy+BuitI8TEKuk1y
	BhfPeojCqj+f4nGXVLUbooreIseTzyVuLUoXFmI/vY2KF2ikc+aNHv+ZP+f5TjqirdPLSgSgyIT
	19hB0upAemEQ98oKcdXyJSm+SBFfot7y+/PLsKXcaMMOZTQE3lGrIyUz9qPtp1W/U5UITRdYuE4
	I9elaTwCgkHf9pVm8OOUq7DDEUnh3LuF6jALLSHFE8ueDWNINv2XiaLz3ux+ydBiKXXXrW5hvS6
	4fXXQFC0ZNdyPuFBCZ5xqkyANNa58RW4
X-Google-Smtp-Source: AGHT+IFU/BAE8/JP2/pFWB6uj3X2U5hpIcR9yw/fgE/bh3vrS5xv0stjrRkIhM1Vu3CupP2zc9Z8ug==
X-Received: by 2002:a05:6512:b0a:b0:545:d72:95f0 with SMTP id 2adb3069b0e04-548510dd0efmr39333e87.24.1740422002020;
        Mon, 24 Feb 2025 10:33:22 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819ebdf6sm46721fa.35.2025.02.24.10.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:33:20 -0800 (PST)
Date: Mon, 24 Feb 2025 20:33:16 +0200
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
Subject: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xF5zIPCTVvd4fOx7"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>


--xF5zIPCTVvd4fOx7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are ADC ICs which may have some of the AIN pins usable for other
functions. These ICs may have some of the AIN pins wired so that they
should not be used for ADC.

(Preferred?) way for marking pins which can be used as ADC inputs is to
add corresponding channels@N nodes in the device tree as described in
the ADC binding yaml.

Add couple of helper functions which can be used to retrieve the channel
information from the device node.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v3 =3D> v4:
 - Drop diff-channel support
 - Drop iio_adc_device_channels_by_property()
 - Add IIO_DEVICE namespace
 - Move industrialio-adc.o to top of the Makefile
 - Some styling as suggested by Andy
 - Re-consider included headers
v2 =3D> v3: Mostly based on review comments by Jonathan
 - Support differential and single-ended channels
 - Rename iio_adc_device_get_channels() as
   iio_adc_device_channels_by_property()
 - Improve spelling
 - Drop support for cases where DT comes from parent device's node
 - Decrease loop indent by reverting node name check conditions
 - Don't set 'chan->indexed' by number of channels to keep the
   interface consistent no matter how many channels are connected.
 - Fix ID range check and related comment
RFC v1 =3D> v2:
 - New patch

iio: adc: helper: drop headers
---
 drivers/iio/adc/Kconfig            |  3 +
 drivers/iio/adc/Makefile           |  2 +
 drivers/iio/adc/industrialio-adc.c | 89 ++++++++++++++++++++++++++++++
 include/linux/iio/adc-helpers.h    | 22 ++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 include/linux/iio/adc-helpers.h

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 849c90203071..37b70a65da6f 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -6,6 +6,9 @@
=20
 menu "Analog to digital converters"
=20
+config IIO_ADC_HELPER
+	tristate
+
 config AB8500_GPADC
 	bool "ST-Ericsson AB8500 GPADC driver"
 	depends on AB8500_CORE && REGULATOR_AB8500
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index ee19afba62b7..1c410f483029 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -3,6 +3,8 @@
 # Makefile for IIO ADC drivers
 #
=20
+obj-$(CONFIG_IIO_ADC_HELPER) +=3D industrialio-adc.o
+
 # When adding new entries keep the list in alphabetical order
 obj-$(CONFIG_AB8500_GPADC) +=3D ab8500-gpadc.o
 obj-$(CONFIG_AD_SIGMA_DELTA) +=3D ad_sigma_delta.o
diff --git a/drivers/iio/adc/industrialio-adc.c b/drivers/iio/adc/industria=
lio-adc.c
new file mode 100644
index 000000000000..d8e9e6825d2b
--- /dev/null
+++ b/drivers/iio/adc/industrialio-adc.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Helpers for parsing common ADC information from a firmware node.
+ *
+ * Copyright (c) 2025 Matti Vaittinen <mazziesaccount@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/types.h>
+
+#include <linux/iio/adc-helpers.h>
+#include <linux/iio/iio.h>
+
+int iio_adc_device_num_channels(struct device *dev)
+{
+	return device_get_child_node_count_named(dev, "channel");
+}
+EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
+
+/**
+ * devm_iio_adc_device_alloc_chaninfo_se - allocate and fill iio_chan_spec=
 for ADC
+ *
+ * Scan the device node for single-ended ADC channel information. Channel =
ID is
+ * expected to be found from the "reg" property. Allocate and populate the
+ * iio_chan_spec structure corresponding to channels that are found. The m=
emory
+ * for iio_chan_spec structure will be freed upon device detach.
+ *
+ * @dev:		Pointer to the ADC device.
+ * @template:		Template iio_chan_spec from which the fields of all
+ *			found and allocated channels are initialized.
+ * @max_chan_id:	Maximum value of a channel ID. Use -1 if no checking
+ *			is required.
+ * @cs:			Location where pointer to allocated iio_chan_spec
+ *			should be stored.
+ *
+ * Return:	Number of found channels on succes. Negative value to indicate
+ *		failure.
+ */
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+				const struct iio_chan_spec *template,
+				int max_chan_id,
+				struct iio_chan_spec **cs)
+{
+	struct iio_chan_spec *chan_array, *chan;
+	int num_chan =3D 0, ret;
+
+	num_chan =3D iio_adc_device_num_channels(dev);
+	if (num_chan < 1)
+		return num_chan;
+
+	chan_array =3D devm_kcalloc(dev, num_chan, sizeof(*chan_array),
+				  GFP_KERNEL);
+	if (!chan_array)
+		return -ENOMEM;
+
+	chan =3D &chan_array[0];
+
+	device_for_each_child_node_scoped(dev, child) {
+		u32 ch;
+
+		if (!fwnode_name_eq(child, "channel"))
+			continue;
+
+		ret =3D fwnode_property_read_u32(child, "reg", &ch);
+		if (ret)
+			return ret;
+
+		if (max_chan_id !=3D -1)
+			if (ch > max_chan_id)
+				return -ERANGE;
+
+		*chan =3D *template;
+		chan->channel =3D ch;
+		chan++;
+	}
+
+	*cs =3D chan_array;
+
+	return num_chan;
+}
+EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DRIVER");
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Matti Vaittinen <mazziesaccount@gmail.com>");
+MODULE_DESCRIPTION("IIO ADC fwnode parsing helpers");
diff --git a/include/linux/iio/adc-helpers.h b/include/linux/iio/adc-helper=
s.h
new file mode 100644
index 000000000000..5d64244f1552
--- /dev/null
+++ b/include/linux/iio/adc-helpers.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * The industrial I/O ADC firmware property parsing helpers
+ *
+ * Copyright (c) 2025 Matti Vaittinen <mazziesaccount@gmail.com>
+ */
+
+#ifndef _INDUSTRIAL_IO_ADC_HELPERS_H_
+#define _INDUSTRIAL_IO_ADC_HELPERS_H_
+
+struct device;
+struct fwnode_handle;
+struct iio_chan_spec;
+
+int iio_adc_device_num_channels(struct device *dev);
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+				const struct iio_chan_spec *template,
+				int max_chan_id,
+				struct iio_chan_spec **cs);
+
+#endif /* _INDUSTRIAL_IO_ADC_HELPERS_H_ */
--=20
2.48.1


--xF5zIPCTVvd4fOx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u2wACgkQeFA3/03a
ocWTugf/U1pTmo4p4LmDyyZYpi+D/ws4cKRUHOYY95vJckFOlwmOyc9U8dRpKI07
CFWsUcrb775GbqfUGpnkaq6C9Dyshlv+5vR0jWcdV515Q5z9qHNr7e4ZOrvdu+/O
6jEE8Hipav5vG4H68tsNCS75NO7cLDgC2JeelX2ry90AkDVOKxJKlyhfi3ZEOIvw
S9Ijn6lg54WX7n3OwKScW6jfnMAOvblou4tprOk9IniYGwCKrvaF6SCT+2QdD+5/
l9+0JnbuM7wmW9OOIBoUFBO+xOOYK33VSlcFFmpfcsz2rH3Cvhd4itABZA1GnapM
y18XWpd9QPm2V4txHMpe+vT46UYnnw==
=+wbV
-----END PGP SIGNATURE-----

--xF5zIPCTVvd4fOx7--
