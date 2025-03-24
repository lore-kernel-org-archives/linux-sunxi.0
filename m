Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230EA2505C2
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Mar 2025 07:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800394; cv=none; b=QenND1CJFB7ii9RrOmZF+/1DbwExOK1FQe/bJOJVRWM65NaLKZMsnnIZyVBQYlELnCzn0YbayFyXcpJwMfjbA8HZhpGrZ3ohCUljSpPxMKfJLobuy+7bL6rpIh9T5v9CQ5wN7nICfKRTUjYh3263jIAULafAIpqA44x4MuZm+uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800394; c=relaxed/simple;
	bh=D6nk1nH5I6XlGeSiHhyIRhoTfx2sFbu0BOWX0NE/a6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOA4ACZhgEu1iopqgWjl6HXYcsg1/qEHGzY4u+gpBoKG46b8oorfplCuzkIgElhVqyxw2gSTrI84EmNWiRfaUboxF8H+sKQvnR4XSKrwJzngrQmTdHOdAU8mmGyECr3EtPNiNMIbLt4v72KQO4h4W1STyVvSDu0NvRSU+zEh4Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7s4xJ66; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7s4xJ66"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499d2134e8so4935957e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Mar 2025 00:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742800390; x=1743405190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ozanmv/QqYBgGPCgM2crebgxBT9NUAtaVOJ4kP5Qos=;
        b=Z7s4xJ66NdcqKs4Fo0x7LCC6WmSKKBJx3YvZ2+EBNDeDdTnqlpFHZlbXPOZJliLuJl
         3oNr2c8q4wVNOCnm3b+jmKDS7RWlaVQOhRsyYdUIHhRRL0MH0nDxD5dsqx1GdmvWReNn
         AQb70lsIs9SPTW5ZGMh0zn8ZzYOt+fHWAILdIQ9c83IfHkKt4GJ1DkWG/9rbIW6ONOKy
         I20AxHJqt0b9X+FmmFtyQ9P2gVlOSV+XFUe/vzp7RIC2RPl+yZnUNNXpTVfQ0RSTftE3
         1nqFfl3M7lcTittSOEn2YWwooDRVgzfP0m0VjOHqpjkZvkZVErcdi3NAfRhOsRBCpTda
         X4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800390; x=1743405190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ozanmv/QqYBgGPCgM2crebgxBT9NUAtaVOJ4kP5Qos=;
        b=DtWphDjDsI0uSFdII4+0EAr38y5ySZEYN14Ww9VCG1yMuQVd9269daEcQj62O9rtSJ
         Pr4S41VoMZzmZy9KWypcI6Ys8GcMI2vspBk27+stSgNu6PvNvUhFv7XZClAukBB8L4wE
         +Znbuf54hATE0Ank6iE8/HSjjJx8vm1uKb5R8lXzk5gAfxIKNCq2hLBVJ+8s8fcIAMtK
         xyv3Oikw+vMXDGfUzJoesJYwriVCgNxbedtbiqHUyggoZ5yLTODcIiAwu/J/MjtH0PII
         kPpASIV+Nz8e6BxQaEbuCYMjFn0EhiNAj0e2iES9gdnuJjto9kwsU4KoRtiRnsVk5uzS
         tORg==
X-Forwarded-Encrypted: i=1; AJvYcCVF3cKd8cc+gRxXCn8Rg9rfE4uYvsOIM/ozFDjbkpoP4+qkDC1z9FJFe9tNoX3hG44UXXcOKBQnB4Jh+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLgIO9qqV8TK3xmpEZruuOUL+9VZHHXg6h5mfet11uQGbxcsp8
	XnMatXZqBiwUj/pLvCX0hZ9XE1OOuSOr9nce+la5X6oVrzMswn+d
X-Gm-Gg: ASbGncvZPfJnqJusny0s4zMF4iUPNfCMbdaylpIn2fR0z9ycFX6PFDheQh6XL1loMv3
	eMLHcOBuGer7BpOgf0doVT3qykXbU6SeFfY/cCeqD/zR8m0xZstbQ4o5qwza2kO6QFmcFIwVClN
	5z55RDI1c5/iBfc2kHCnGJEYZzHi9Z4TOSU8jNYFV2G1nes8wLybYF/Q+UtQe4mgwQCcIquyhx1
	xqUVzofGfCYLlUD+bJkUDY4wKxxSgTM9vU0NDRtXpWOLdkkBbD30GpaKAL72k0/wgTlCcqA1yVh
	yl3edDTdeYRkDiiINEgCBuofeJte6WoOWjwjhWCra5fW/sBUbaU=
X-Google-Smtp-Source: AGHT+IEyGZx7uvcqc+LiYB4BDlalqv4N/7ztabAEMx6CrAGNkPjAjUIgTEKN8x5EkF3GXgji3nzWBA==
X-Received: by 2002:a05:6512:6c4:b0:549:8e5e:9d8e with SMTP id 2adb3069b0e04-54ad63fc0e6mr4283316e87.0.1742800389666;
        Mon, 24 Mar 2025 00:13:09 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6508252sm1046478e87.179.2025.03.24.00.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:13:08 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:13:03 +0200
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
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
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
Subject: [PATCH v10 3/8] iio: adc: add helpers for parsing ADC nodes
Message-ID: <f1d8b3e15237947738912c0d297b3e1e21d8b03e.1742560649.git.mazziesaccount@gmail.com>
References: <cover.1742560649.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZzLqSZ9m2D84frF1"
Content-Disposition: inline
In-Reply-To: <cover.1742560649.git.mazziesaccount@gmail.com>


--ZzLqSZ9m2D84frF1
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Revision history:
v8 =3D>
 - No changes
v7 =3D> v8:
 devm_iio_adc_device_alloc_chaninfo_se():
 - Treat all negative values for the max ID as 'don't care'
 - Return -ENOENT instead of '0' if no channels were found.
v5 =3D> v6:
 - Adapt to changed fwnode helper names
 - Fix spelling
v4 =3D> v5:
 - Inline iio_adc_device_num_channels()
 - Fix Indenting function parameters
 - Combine the max channel ID checks.
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
---
 drivers/iio/adc/Kconfig            |  3 ++
 drivers/iio/adc/Makefile           |  2 +
 drivers/iio/adc/industrialio-adc.c | 82 ++++++++++++++++++++++++++++++
 include/linux/iio/adc-helpers.h    | 27 ++++++++++
 4 files changed, 114 insertions(+)
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
index 000000000000..b4057230e749
--- /dev/null
+++ b/drivers/iio/adc/industrialio-adc.c
@@ -0,0 +1,82 @@
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
+ * @max_chan_id:	Maximum value of a channel ID. Use negative value if no
+ *			checking is required.
+ * @cs:			Location where pointer to allocated iio_chan_spec
+ *			should be stored.
+ *
+ * Return:	Number of found channels on success. Negative value to indicate
+ *		failure. Specifically, -ENOENT if no channel nodes were found.
+ */
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+					  const struct iio_chan_spec *template,
+					  int max_chan_id,
+					  struct iio_chan_spec **cs)
+{
+	struct iio_chan_spec *chan_array, *chan;
+	int num_chan, ret;
+
+	num_chan =3D iio_adc_device_num_channels(dev);
+	if (num_chan < 0)
+		return num_chan;
+
+	if (!num_chan)
+		return -ENOENT;
+
+	chan_array =3D devm_kcalloc(dev, num_chan, sizeof(*chan_array),
+				  GFP_KERNEL);
+	if (!chan_array)
+		return -ENOMEM;
+
+	chan =3D &chan_array[0];
+
+	device_for_each_named_child_node_scoped(dev, child, "channel") {
+		u32 ch;
+
+		ret =3D fwnode_property_read_u32(child, "reg", &ch);
+		if (ret)
+			return ret;
+
+		if (max_chan_id >=3D 0 && ch > max_chan_id)
+			return -ERANGE;
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
index 000000000000..56b092a2a4c4
--- /dev/null
+++ b/include/linux/iio/adc-helpers.h
@@ -0,0 +1,27 @@
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
+#include <linux/property.h>
+
+struct device;
+struct iio_chan_spec;
+
+static inline int iio_adc_device_num_channels(struct device *dev)
+{
+	return device_get_named_child_node_count(dev, "channel");
+}
+
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+					  const struct iio_chan_spec *template,
+					  int max_chan_id,
+					  struct iio_chan_spec **cs);
+
+#endif /* _INDUSTRIAL_IO_ADC_HELPERS_H_ */
--=20
2.49.0


--ZzLqSZ9m2D84frF1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfhBf8ACgkQeFA3/03a
ocXEwgf/bsT8bKSc/pwyGC9GpiLlvmQmUVX8mzc1mk7tJIla/vsy4BDTVjm8/GtI
xB/hFbDrgMh81rZjyICAxVYGoBzZqzhIkKlU+SwR25l5rIDowdyMQB8XIgxhCpWy
39dAXT+LKZkFeNxoyQi+llFfgw3VGeA4mhKCoaVJM774tRWju8jC3P7ByjCufezN
Ji3iURItZ6MTpPvTVr4i3qVvDKJqiPN1Xhh0PHh5OMUM6vlsidD6mQOQ372IeJaW
ySDvx97BRge270gLioAak7/5QeWH4/KOOkVmi9B8WqOgZ75g5SdMt8/EMlnBjLWf
ASGYIOLD2bJDk9SKCEEBU8pqBj58sg==
=WsME
-----END PGP SIGNATURE-----

--ZzLqSZ9m2D84frF1--
