Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F86C1E5B67
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968320; cv=none; b=G0+X8HEfTzCDT8ktv6AbJXWhHuWKiDcPZXKrFRQUaFudolbJEZPQNiB+DgYWWd46Ls5qWHb6RO7w7FNxRwyskILqJGuA3YWsbZff85yujXZGLg2jpu3OLfGdBBPWk1EfsXIBUfb3eaq5VKNbNZtJeoOlBNBVuGe6Jm69Flk3EuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968320; c=relaxed/simple;
	bh=U0JRwfZpNRp+812FgOW9ZHl/nMZWKI1NbdstILYPpaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua2Fbz5yfHqSJZfv+L20iul7LOjux1yKmdLSloRo9eW36+PEq4YkDrceqyqM9+nVWx77JpLkYt4U/w4VXsyteigeFpuZPAiwROm5B14E/YcSExJkPWUs34pD8tT/yjYp2dcaDE5cMm09iFm2a95Ggr8ojaCcWeRWiNFErE768Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH9GBEn1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH9GBEn1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-546237cd3cbso3311712e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 04:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968317; x=1740573117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/8lsdpKrVRGvDk8bdsIYhaiCtFIej4Yk5OWrIJakDc=;
        b=SH9GBEn1Hu9fLSEouaAbD+SEp/AQt32EFM9ecXc36FqNgxIt7EHTmmwV6H30aXraFd
         4ssC2hCs95CWzJLpVg+iveWdIHTELGisO1agGZshXYKUXVxw/iiyXNUl4mQSzhuiQBkW
         yVJuyVDNtC3Rz8To9cE4mjS4WMeqKpxc7hCcBfoaQJxQ2AXg9mGuPyuE1yvY9bvScCar
         9WeMvdnqtp4cGlpH5z9m8uUTJJiYWZflX/Ed1Jp90JPo7aB4vmgJpyGf7ss9MOAFqWt2
         WRVP8ccGUsH795UiEvWk4NPaj5Hf4yfoxBWXOHMmzXaRsgw40tSPLf5BfmtpJckd1Q0E
         dDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968317; x=1740573117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/8lsdpKrVRGvDk8bdsIYhaiCtFIej4Yk5OWrIJakDc=;
        b=Icskywv9IjWOIyojOm6MgirQBeVa0dR+GtDFL/Qm5zTjPt66FD6Wn3X799/xcbrXaH
         oqD+hDaqqPkjQ6EKy7yDnzTXJDi6F1JjWCH9LR0qzvpEhFMPmkILr8ZSikP88szVT0WK
         RiME3V/4CWsJuOPaLfTLiuwLQffD0gA2LL/mOIKcdKgD57N+gglKV3sOyKIkLb0p4eX2
         tE20fvKevu2ZqlSAivYZEYnJ7psrDODx612uur5qATBJpdrdOg6ux//RGO5v9J8KCl8G
         dIkNB9dG+kd4OyIEz+ExyO3796BjlYG/KeufDI91AVfuIgAnLZkYBEcodiHYqsNzBXqN
         k2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa1silYbvr2BlK+eBLAWxSGsTmUr2R0uFpU0LUuVHieADPPbcO2JFAT6/5OQbvz4aOez9Pap+yislRCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvYaI5kROs4mkw8xiXV7mBhIxOD9Ub30rn6NSbQcX1FNxZaAzM
	E4cFeF5yOja+ybINbp40qYw/bVqCu2gP76A5f7jYFrPtlXJVP6dk
X-Gm-Gg: ASbGncs/QLnh0VbzUwyW55nY5wMCMxkp5lYGfauT88cp2rsXJLf5l25yKn0RlLLuVfZ
	Lw4wOLP0Nl7MBx0Uay96O0PpLCAi3gEalnmrxoVVo7V3EerrNhvyy0166uPgABk8PZJei9mjPAi
	t5uN84tyH0IwJ/D2v7U8VwcFyQxwYorfr4oXnRG7lfKh2hP6jbdkHibXU+OmqZ2w4LqYMihPmsY
	vrTTetoXEH26s2cFqaK8uVQ5qVxTdDPV8YdfoOXz2NDTTg6a/jnTRO1rby2ngsl6t1Jym2qIfZC
	WWjbJfx+iUbafQmRDUmnSw==
X-Google-Smtp-Source: AGHT+IHxBzOtMjJ6R20Hyns4SI3S/h1XqzVvWjCS9fdPX3gfnk60+xs7fGA4Wr7UNOkuWHPHq9EJQw==
X-Received: by 2002:a05:6512:1286:b0:545:2950:5360 with SMTP id 2adb3069b0e04-5452fe570a5mr6750403e87.22.1739968316988;
        Wed, 19 Feb 2025 04:31:56 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461db6474bsm1137730e87.58.2025.02.19.04.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:31:56 -0800 (PST)
Date: Wed, 19 Feb 2025 14:31:51 +0200
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
Subject: [PATCH v3 7/9] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <21b9af362b64a1d9c2a13cc46242dd6955996c46.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s1x8TMYhsB4jne8Z"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>


--s1x8TMYhsB4jne8Z
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
 drivers/iio/adc/sun20i-gpadc-iio.c | 42 ++++++++++++++----------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gp=
adc-iio.c
index 136b8d9c294f..36d48d95f029 100644
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
@@ -149,37 +150,32 @@ static void sun20i_gpadc_reset_assert(void *data)
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
+static const struct iio_adc_props sun20i_gpadc_chan_props =3D {
+	.required =3D IIO_ADC_CHAN_PROP_TYPE_REG,
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
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo(dev,
+					&sun20i_gpadc_chan_template, &channels,
+					&sun20i_gpadc_chan_props);
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
--=20
2.48.1


--s1x8TMYhsB4jne8Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1zzcACgkQeFA3/03a
ocVCEQf/apaKkLHlAvNzeV+JKHo6yZDGv6rn7zx2MXDtaPiound3ykKHcgPY498P
38ikuU9ndRbuvC8VnJgdM3Zl1/A2LwH4Oucpkf8YfLiOg0lhowQdvdENcvbDGGX2
55HgTmhlDc/ZalxeQw+BskM+IMTdXdc038K9MiwtpghKgqRCpSc42+qlLlf+PKOV
OmHPs56Ieg7eljc1b/BtnXQLsoEIV9c4G4TmD0RZ2HweNAcoIKgJDGgfj9HsISUf
0A0Py6UOsR5makm7tLhBfAzDd+qhixmrtt2tZZYSIF7h9mnMd7S4+CtJMWdAj4fG
PQSvCuR17XsboEperUGS7DRuGu4tuA==
=t+wj
-----END PGP SIGNATURE-----

--s1x8TMYhsB4jne8Z--
