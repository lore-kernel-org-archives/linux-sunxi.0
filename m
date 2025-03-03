Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126E11FC7FF
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Mar 2025 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001594; cv=none; b=DjTL4YtvQWA1r5RL8fQint1HBqc40XIXOIUuu9By86+nTs05ruE6C7EoCNOJ5tnaMBMDUK9TbRgDTtJ9tgVD8+qYuaifu/lI31TRfipO5wqe3wzhw69ClKBlQOkILS1y7j+sZKwBtTbmH3XS4kCyfs5GpBoexxIcLIRPatnLJmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001594; c=relaxed/simple;
	bh=qY4K5AlxxWkcTPDlFeU8FDxqWCpkT0NIf9/vZt+9LAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWjV2Quyx75UHUOEQpNcjUw4D7zUJ7zhNm4VGiKOMPK3c59262z9jXitdfbUw2AfbMnkW7/prXfmjcgv4tQoGLxazq9NQNPmLFO9WvZxbsYjVWL1u1FBx7DGYJzh/FX5EyY2ZIkSpBiNA/Em5E5NUTbAU1kzoai9p2TwbBGkaBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD54l8CG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD54l8CG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so5030331e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Mar 2025 03:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741001589; x=1741606389; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jr7uWyzHUY99eCAGXzsJFETrGHISY9L/T3cghzdv3dw=;
        b=WD54l8CGy/Rkljqz5CF0tUHONwaqdtI84c1O/OqNjfw+miHszHNn2lx/WG/98L1v1I
         bjB0SxdnmBN9Kx4o0xP3LdQDNQ2npTT7Aq3KOzk5Q2h6Dao5Iaxom8corynfHy3U2OvT
         PXUyoo5wkLJPVPlEoGaiHw2x8Lej4Ha5bnkz1CwhhTfsU8t1zmmEPrLwsqvDcE372Ato
         d3vjusBjBXW3OHgH66sNo6tLyHYMX1TPZu+//GD9F8i43/x+SufqMWkLi6eqoI25OkGY
         +KG5Ejl7f7gp8H383kbd+nvdtp6qM3IKKjM/9HaghELivvAQjcyVa00Vl7c5DZL2y0in
         JSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001589; x=1741606389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr7uWyzHUY99eCAGXzsJFETrGHISY9L/T3cghzdv3dw=;
        b=IYTzrEJV5p6mjgXwXpjHJppS/gPW7Kft4fDQ9b21C6+p8WfwLOugZE347pqoVeLZYo
         I5qmfR0P3dklB4lz2eJ6INR4mGhoIkfv5xPj5/G/hSjG02txFh+0bW9LAcZhovhcotkd
         jVLoqpMtqbAKEEe7mTG4qmRFgZip6xkSNTm725Eum1kbiPMWlzDv0wApLUvDpfWpSyJN
         4U43K0jLlQd2wczUZgfzFxRr2/kb8lVZGRkCTjAx13RvNHoaKFjtldAKQoc999dia1AT
         67RIUU122+b0aLDaymef6pR+QiD8WvTFpjXkSVDpw2iCuBtd+nP3njR6GiFFrKcnZQzE
         z7jw==
X-Forwarded-Encrypted: i=1; AJvYcCXiO0l1oGia9sQvY6B1W2Gy/x25P2FA4/k1kBKDaMFZCn6XuggeHyqIoGtgLuCCR5cuOppPmJ0jM0tPVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKqqOc0w+oQp0wDh70n1nqYp7I7zTfThIUZ7sHWOA8KaRRGgNt
	NP1byXuy9d/TGKTerBntUM2+bZcwfI5O/96iR5jLvMJmmk+jAWgK
X-Gm-Gg: ASbGncuuxbdRgLJbxBiTbPaX8jtGY0t7gQZ7U6ziNQHURKnLZ1z5On2qgQiOZT/94mP
	ANXzyDL56jeMmtRIF5cXDKIjHjNZeFqxWnNREzPn+jhEFi9gpvCLY6u0srVwwdYnbgE3+/btfm0
	lLPLugDqI0rxsoitVXYpoc0t/ceLRuo1+uZKW0HjFTBG7PP9Ki50cahPAbSNa1WzWlTlREFQVmU
	JD9eP/wAJeoKz4+mAJL9FtwmmVKBil5jGwNiwjq3anm4fcH+dkrR9ASrN7op4HAW1JM5F6itAE3
	48Yh8enYTjudWU0qtyeQjSXejF02FDuDfCi420T5lUsvtxu2Rx98X9FVmIOPSNyC34WDF0XqFfN
	4PTSLkyjX2Sw=
X-Google-Smtp-Source: AGHT+IGzOR5aUmDt+a/MXoTy+5OLlJ65L1UVO+lQK86VsDtTaAuu0JJFF79k+4B/QbjhjBDZ83bKrA==
X-Received: by 2002:a05:6512:398e:b0:545:3031:40aa with SMTP id 2adb3069b0e04-5494c129d52mr4959258e87.9.1741001588885;
        Mon, 03 Mar 2025 03:33:08 -0800 (PST)
Received: from mva-rohm (mobile-access-2e8451-125.dhcp.inet.fi. [46.132.81.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494ab017d0sm1112555e87.84.2025.03.03.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:33:07 -0800 (PST)
Date: Mon, 3 Mar 2025 13:33:02 +0200
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
Subject: [PATCH v5 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <aabd8836dbe54ef54730d1cd112edb52a57cd353.1740993491.git.mazziesaccount@gmail.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H68W2IZGPpj37wy+"
Content-Disposition: inline
In-Reply-To: <cover.1740993491.git.mazziesaccount@gmail.com>


--H68W2IZGPpj37wy+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
drivers avoid open-coding the for_each_node -loop for getting the
channel IDs. The helper provides standard way to detect the ADC channel
nodes (by the node name), and a standard way to convert the "reg"
-propereties to channel identification numbers, used in the struct
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


--H68W2IZGPpj37wy+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfFk24ACgkQeFA3/03a
ocW3swgAxdspJKGNebP1wZLtgdUEjveykgvwtguklkaV129G98UZsW3m94ma/8m8
qTIwg6fC53R3rsy0PgoGQA0rzgCLxLs5SyU7dJ9VBP0rtd/W1QuLjlB2lSWWQ0VZ
iHEMHTpXN0UECsPhnjdx2AkIV9OhXogF1lUE5SPWmFBwNMqTMN9kuyNmlN3oyi22
TE/xmHUroVD1hbsnX5LaMIWNC52jrANcg2/fxs6gnXbHvRnlAjxU/07S1p2YEhaF
NB0fjePrXCd1vcb7wlozyiQxfZzRqH+qtkExmCstmeb+TgLHTokJUZu0JlUmSt91
L0Chh63By3LN3Z0zGlOnGIyhf5FcwA==
=Wlf0
-----END PGP SIGNATURE-----

--H68W2IZGPpj37wy+--
