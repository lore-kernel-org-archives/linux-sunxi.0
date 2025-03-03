Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F281FBCAF
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Mar 2025 11:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001544; cv=none; b=IjLnIs8EWAtqFdj719qO2OZ4I+3SZ4EvtjVPSMOWY5/HTiTvKnF2i4/NVMeWFYI2v591kx+y09R5VPXwDrfCPkkA4iL0GJe7n58MommhouaW015+3iFodYLKGFGKm3QVynSL2v6drsHtwblFsZFJXvMEGl5rM835IXkX/fDNqg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001544; c=relaxed/simple;
	bh=K4tBMQnaHMfsnGq5yH+1iVycU2fZaA/iBWkZbbp1u4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8LnGZDkPejqzuimnzUjNyupSRIoLTQV0T6AjgSpaF1DEyeHMzgJFzDmR6C6Y2wBmOzR2s+6o5XRpIWbYXogvFdRiq/5qD0Dowxf5EdLTyXparVsYqQVSxJTwq8YhDch93b12IbsJc+bm3W/HuNSuuS0JSqNUzUf/lcN8h55Qh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJYjP0zd; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJYjP0zd"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bbbd0ea7eso7908381fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Mar 2025 03:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741001540; x=1741606340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtBChGL3VlgSfzXhFjLcRU34BzOSwfeij0YOo0Xrd7Y=;
        b=nJYjP0zdaGlYJNENqzm3Uo9PrLdg14yipzoK/WvZjAbcWEX15vRL7hnFh77g0DN6tR
         c3db/5vY3RLAMRDy+Wg7xsXd8KuUm+YZSZoZ11P2sH7FmZ+ODioDv889sZslgVYfgruh
         TJ0XDSrp2SYX2TTZTVdXDqnWOEv/763QlJ8B+HUuMDcyRgH7cFtqOlHXNZP0+RPQKekM
         5IJDazQEqo8zWd/lT8wXBqOgHWxNuueOQhbykP73tL98A3eKMkRrezo5DTBgIs+Y2wGG
         YQSBtrcvL2vAmI298omlRwmbyFZhKWiy7dg4u69S9T/aRzasPKHl9B7FeirHoUzM1g1D
         SXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001540; x=1741606340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtBChGL3VlgSfzXhFjLcRU34BzOSwfeij0YOo0Xrd7Y=;
        b=kRH6B1VB2ikJgjVAs+697Ekekn/6F8HM7wTFP6TLQF57OVCZChINRNb4sov4xwd/4E
         B2r6SHhw/hd1S1Ed2b+tUodqnuGAZmP5zUkPiCTLT6DTT8/ykFvaNlAaOHzfEd87LVEo
         xGPWg3Izr0yXvD8elpjlkCvTv0h939urj4yINHAaD7wRE+Tj1y5QDJKkJS2jXytVFxAi
         J5NOFttzRtHpoD/n80Cs+wCVP655TJZpmfkIWvm16qiEwtDfhY2UL0SW+pbk438oa7TK
         IUYMxxekQCUA5B48Vc0K5JwRQUyDZIfxfAFEiaZaShCKDzEjpOHyJEPwTD2y+5PVPQkk
         m9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtwl4QnAlhRCM34jQXlVgpzLtTthxzA1GXUSPXiKdH1mEpFphm5ZWKbkGAGudArOri4JtF35whIUbfTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIZk48NmkpJzjQznWBl5yx0qPPJzu45LfhQndKM2R7EJU5Fanu
	HbuprEO4CGbJ9KUVMd38LWmiOjEyzVrzgDoNFrGbVaqHgVx5k0DX
X-Gm-Gg: ASbGncvkHpZHzqmqeV7xT/FoQd1uSYCq8uvim5ly4nYUkgwitoOci+mjoOZox8bo8tm
	enOGEnzSN/MArCNsBhmPzfHjqg4h1yjdGt8qTFDTGTAj6jbm0d3SRgr/3qma6IMUEYj44Uc5xxD
	FDUMI83NaYi7ztD+RBH4L+ZzQEwro3vcYG1DjX+flWMLsrSeql432ZORzXzmaf+tCHuGUC2gnMR
	ALZW8j7vcVXKokKSGk6C+L+fxduGvRqLjusDer5+W1+piMkwHn9khsK8enNZF+RYodoIH4Rzjmm
	J/Df9GEHiiVDnvHJNat1u8XKMF1eqXrW7cXkDxUP7JPaEAWn0vo4KFtUPofNOr1PM2zU2/uEh8V
	84Fi1JJlfOAc=
X-Google-Smtp-Source: AGHT+IFLEDrP5BMqyi/QYjEYMZ1pICg9oq6il8b+Tt5IsjAulwVVVhkiZFRC9rVJrJAglId4UhYVLA==
X-Received: by 2002:a2e:bc23:0:b0:30b:bf18:91b2 with SMTP id 38308e7fff4ca-30bbf18952cmr9389191fa.3.1741001539821;
        Mon, 03 Mar 2025 03:32:19 -0800 (PST)
Received: from mva-rohm (mobile-access-2e8451-125.dhcp.inet.fi. [46.132.81.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbb7f2b69sm3425911fa.29.2025.03.03.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:32:18 -0800 (PST)
Date: Mon, 3 Mar 2025 13:32:12 +0200
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
Subject: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <e71c63c2f61135f9a8c7884525aab2c48f1e84c2.1740993491.git.mazziesaccount@gmail.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xqvnd4i6gfW+Zz1G"
Content-Disposition: inline
In-Reply-To: <cover.1740993491.git.mazziesaccount@gmail.com>


--Xqvnd4i6gfW+Zz1G
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
index 000000000000..7bdae5330224
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
+ * @max_chan_id:	Maximum value of a channel ID. Use -1 if no checking
+ *			is required.
+ * @cs:			Location where pointer to allocated iio_chan_spec
+ *			should be stored.
+ *
+ * Return:	Number of found channels on succes. Negative value to indicate
+ *		failure.
+ */
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+					  const struct iio_chan_spec *template,
+					  int max_chan_id,
+					  struct iio_chan_spec **cs)
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
+		if (max_chan_id !=3D -1 && ch > max_chan_id)
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
index 000000000000..403a70b109ec
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
+	return device_get_child_node_count_named(dev, "channel");
+}
+
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+					  const struct iio_chan_spec *template,
+					  int max_chan_id,
+					  struct iio_chan_spec **cs);
+
+#endif /* _INDUSTRIAL_IO_ADC_HELPERS_H_ */
--=20
2.48.1


--Xqvnd4i6gfW+Zz1G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfFkzwACgkQeFA3/03a
ocXuBwgAuRQ/tlZSOf6SLet+xxTrkc8Ao08JwLFpdY3kORBcf8Syd5R2/3ALMsmM
jcpwo1ZbsawPz+ypEbE1c9M7x+L49rdIE9F2DYUEGzqcemWfaeyDatgytn3VKbz6
x/Wq961wfy5ntkyxrdNlcV5WNSwIFNNt6qH5O3SwGM63yVjjyPlthmXvEVZYRS0e
ujDFFqBGcReOBDTNpG3TV0ozv0xFZQpmBPDIyBE6XWQK6JS85fy4zQ4HltAX8gfL
bfXcPg7WnKHLvy1bQLVtF8JqyckD8QiqcT1fUznqWpxfJ7EkFhvWULWXLB6eKQYR
fmvISMGCkMrTFeC6oaojYKHIbwlA+Q==
=FJAk
-----END PGP SIGNATURE-----

--Xqvnd4i6gfW+Zz1G--
