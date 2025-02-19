Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90B1DE4C6
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968306; cv=none; b=BiemhVLSbk5G1JiAE01bLlN+WK2gDomlUhCk5Ki6onLL6JtcLeQvKfDjQhQ1v1814qoaKhs7quJzftGhIhAWae0jyswgOcbCHZJa6ya9epwuL+ct2h//0WKVei12+CLuq5cQjJ4s1wFGtK5o8BsT+LjPhYyVXHbJq6p97tjoIWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968306; c=relaxed/simple;
	bh=nx5txx/Kg5W/IwYSUOjcsemEGNxj/YYzmzKKdPde/cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKdfIA7D4GCIYNIlE1iaaEr0Ah9NqYTRwYXFYUu4Ijmo9+UuDRXdjwLMBbGTgI4ENDsrex1r2ibCCpdGXAicp4eXIbPaPNs8NZr+zpavicU8VYl3+lklimHAo5hSVsZf75F2p76L5NTu7rDCilZuKNOMi4LjWe+jCqaacjytqlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lak1397o; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lak1397o"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54527a7270eso5222441e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 04:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968303; x=1740573103; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWwxIm6ZCjF1USQojkSFaiOLUy9epdYG89n1EjgogqY=;
        b=Lak1397oHdNIyADeHNg5gqI0by1J0oPgDskjBdxrieVhzMOPdudXD/M5DlVTAF4h7f
         f8rAkxJ8U0jRxe3h9ipssNFeNUmlDdSag82n1ZnLufQvZpdAkjMYGQ5bQWM+AN0W2EM0
         RSuMNzZn7fhi10tIQlJAwPMCjmksqomHl1atSDp/1egwbQGi2cQ735PIsp/qBJ/KbA8F
         MTxUZzK9vuftUzkONcXQ+zilULIZP0jW/Vw1IQNjZhu8e4uoPiWvEv4JkmyAaImCMNDG
         XcRyf3nqpfsrSzHsWF3nJ7XnswlMOjd6uauP7VQbURrVZW6gFiLvr2Dqj9QcjZR+NjG4
         3sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968303; x=1740573103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWwxIm6ZCjF1USQojkSFaiOLUy9epdYG89n1EjgogqY=;
        b=AmJS1B3FbGnY2g7sROLi3iEt7VITRFJ9spvDLkOuApGmVW1kAx/Fq/ZD0pj2TpGzDK
         LueA8Vcia+vSYOaTbDRiNuPM1JGN/ipM8zYk9tIecLJ13lIdc+ZmLljef5/za/86aGFY
         V8hJddIKj14TeqWvfkgA9q54FIt8e+RihE5a2Pv8ooKooN+Jc0twgMQicwoyfuYglHmb
         vq/LAje2/XZV9zzVfcWajmlIwZ4cYpyBGyolW2PoJC/GstF2V9iJcZ/OVxGMpQejKvrj
         adlO9gKJDrxqcSenGVgUFgwR63z/NNQh8TSDdoOIHTDBD5ar/VzVGfWeZO5DeA2grJeo
         HGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyrFHry65Il3q5nJLxeTStrrcCFeWH41jgAiRQ+2AeGN4EvXuDbxi25aXlJ+zfIiRWpqNg17KJRo0/yQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVyUlk8IUxCDmPJMkeVfFxkhR0Aw+RZvpSNkCSPe8b+sCKYxJD
	hPh6lNBsz88EPZRiWrqgntJoFgJzP7vUV0DKQyYCHYqMFXg7vzK1
X-Gm-Gg: ASbGnctqouvurzXnYInZYajLiBn2NGpuxpIR3Pc+ZQ8cKGph2cPniOewxUpXu/EZt9t
	rIGQ3RwhZ5ZpoOop0wRQi/1JF6cEX4UpfhknYRr/BSDT5Mi+hgFXjnOe3fnbRax02cM8hpTl9Pf
	N0YC+IeEcBMB9ITHDa9/AFpDGtNutpcsAF9EvtrcUVpRYnYxWrAbRmYDSbiq03WmVsV9fDZSnNJ
	a6aVGW42xkn/L9hcK4oAUdFlVhqKkr0XrUTwh9mIm/wDAmJPIcF+7A/CrEoAWa9nWJENOJAA458
	+lCQqX1qJRkFEleEyspnuw==
X-Google-Smtp-Source: AGHT+IG3W//1SoXeekfyezOA2c+1vtKbVddXk84fyMfPvHE7Xk/Tk638LkqZRnBlykN65C1+4lMkfQ==
X-Received: by 2002:a19:2d11:0:b0:546:27f0:21a7 with SMTP id 2adb3069b0e04-54627f02773mr3187290e87.49.1739968302667;
        Wed, 19 Feb 2025 04:31:42 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5453961f67fsm1390216e87.23.2025.02.19.04.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:31:41 -0800 (PST)
Date: Wed, 19 Feb 2025 14:31:38 +0200
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
Subject: [PATCH v3 6/9] iio: adc: rzg2l_adc: Use adc-helpers
Message-ID: <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5nSFiMwsXV6h6VCl"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>


--5nSFiMwsXV6h6VCl
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
child nodes. Quick grep from arch/* with the rzg2l_adc's compatible
string didn't reveal any in-tree .dts with channel nodes named
othervice. Also, same grep shows all the .dts seem to have channel IDs
between 0..num of channels.

Use the new helper.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v2 =3D> v3:
 - New patch

I picked the rzg2l_adc in this series because it has a straightforward
approach for populating the struct iio_chan_spec. Only other member
in the stuct besides the .channel, which can't use a 'template' -data,
is the .datasheet_name. This makes the rzg2l_adc well suited for example
user of this new helper. I hope this patch helps to evaluate whether these
helpers are worth the hassle.

The change is compile tested only!! Testing before applying is highly
appreciated (as always!).
---
 drivers/iio/adc/rzg2l_adc.c | 41 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index cd3a7e46ea53..3e1c74019785 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/iio/adc-helpers.h>
 #include <linux/iio/iio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -299,20 +300,34 @@ static irqreturn_t rzg2l_adc_isr(int irq, void *dev_i=
d)
 	return IRQ_HANDLED;
 }
=20
+static const struct iio_chan_spec rzg2l_adc_chan_template =3D {
+	.type =3D IIO_VOLTAGE,
+	.indexed =3D 1,
+	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+};
+
+static const struct iio_adc_props rzg2l_adc_chan_props =3D {
+	.required =3D IIO_ADC_CHAN_PROP_TYPE_REG,
+};
+
 static int rzg2l_adc_parse_properties(struct platform_device *pdev, struct=
 rzg2l_adc *adc)
 {
 	struct iio_chan_spec *chan_array;
 	struct rzg2l_adc_data *data;
-	unsigned int channel;
 	int num_channels;
-	int ret;
 	u8 i;
=20
 	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
=20
-	num_channels =3D device_get_child_node_count(&pdev->dev);
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo(&pdev->dev,
+					&rzg2l_adc_chan_template, &chan_array,
+					&rzg2l_adc_chan_props);
+
+	if (num_channels < 0)
+		return num_channels;
+
 	if (!num_channels) {
 		dev_err(&pdev->dev, "no channel children\n");
 		return -ENODEV;
@@ -323,26 +338,10 @@ static int rzg2l_adc_parse_properties(struct platform=
_device *pdev, struct rzg2l
 		return -EINVAL;
 	}
=20
-	chan_array =3D devm_kcalloc(&pdev->dev, num_channels, sizeof(*chan_array),
-				  GFP_KERNEL);
-	if (!chan_array)
-		return -ENOMEM;
-
-	i =3D 0;
-	device_for_each_child_node_scoped(&pdev->dev, fwnode) {
-		ret =3D fwnode_property_read_u32(fwnode, "reg", &channel);
-		if (ret)
-			return ret;
-
-		if (channel >=3D RZG2L_ADC_MAX_CHANNELS)
-			return -EINVAL;
+	for (i =3D 0; i < num_channels; i++) {
+		int channel =3D chan_array[i].channel;
=20
-		chan_array[i].type =3D IIO_VOLTAGE;
-		chan_array[i].indexed =3D 1;
-		chan_array[i].channel =3D channel;
-		chan_array[i].info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW);
 		chan_array[i].datasheet_name =3D rzg2l_adc_channel_name[channel];
-		i++;
 	}
=20
 	data->num_channels =3D num_channels;
--=20
2.48.1


--5nSFiMwsXV6h6VCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1zyoACgkQeFA3/03a
ocWHCAf/YmLAVSPgwswmrRWqz/6pjhuv610FR5ij5LBJpCnqYRyZLarfrvl9wcqv
TTCcYhjdCPhVOu80WT2YqFubquPgz8f4oduQ1juw0tGKZfO7LZzCI2TXimej97mF
lmEtgVU4ld3GPb2IXHXd18ywltxMLYPZoLBohejO33QpC2hBnWmVDJL/Fg8qqHZx
5BnbVgaXBeoOoi2VC0qcwDn83R8v/3zayOOCdHOb/6af+qCZmPsiCquF7UrYzarK
MWIM3P+ia0B+pFsb4DqDSuMyizM2Atff65RtQAw5WMkEqjIqeMKGcnAkFb4FBjGJ
G7kQtilO1w5CkblgWsYKAGUBxfFw+w==
=VttU
-----END PGP SIGNATURE-----

--5nSFiMwsXV6h6VCl--
