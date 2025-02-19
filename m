Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D561E0B61
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968336; cv=none; b=bwya1zWpvilKpsnY8Ue92Gf4O/e3pjz1P2Dl+zlM3O5zr8Is0KEyyMPYCZRc7MWS4xuEPbW3taPQRAuVdxWVmQpHEAfq9j1uq8KainlmLzRO9LX3lpj7gIPbrZ77VTxXV57revmlkZ/HoAB+OfvF4V4flqiVkYUERQGvDfOAtxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968336; c=relaxed/simple;
	bh=IBbz+wObyAhqTzMziGPirWIFuoReTJvh68cD9yxqDCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VviQqNUPYLMy2M1rqs7ONZqhSIoXfIfM95Jx5BdTHTt7y+lMWCa/p+v5Te+dPw2qHGZbwbN5xIWYU9MWH84ajWNYrrFCZtKP5Sj1wWP1UHyI2p5CNLOlMem7rqc83u9bJP3lQ7h/et/wCTrQw+TKhO51HJdNfuQToh5UCDMNHGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtP0FTAQ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtP0FTAQ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54622940ef7so3351810e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 04:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968333; x=1740573133; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=872sDDSaszSL1+yhyVainkn552F70TCEUEKtazE+wZs=;
        b=QtP0FTAQ/tIWu/nqrjw+T9/h01pcJ0gqp9VIAc1wg9aGekAGCrWUYo7N6Uv2Zuhzw7
         Pff9b2R0Xsu1ilJmUZW8cf7lUSZuReaaE2Ws0cqqN+sMgJcM1f7XFS+WfJEqci4tEuK+
         J/NyCj0msHSb5YZxIaMmpF6su/rrdxV8aKxUFSDLqvm/jW1sFutU9cGKm+KuZ8PqOXWw
         krDOqfStdJpP1IjWhmTv1TVFWVAZgc6s5x62pB1NEdNngdkn+lfQmLLvn+B4MFGPg3/2
         6zRmfRFrKI5RKZRDmuue1alTiAD6k0RdxWw7M/r9yOZyBPunViAgXSCcw9qWaybkNQWK
         HPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968333; x=1740573133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=872sDDSaszSL1+yhyVainkn552F70TCEUEKtazE+wZs=;
        b=MUo8EyfhwHYIPAxxy7QSlImcvM/dqGEDOIyEGPOmYkOKZH4FUcw/gsq0tqfdIVN0BS
         kiNhkNuuPdDKD5Yw9bGMtMKzTm3ejbLvCSmfm2QYUa2z/+bNvUx2PFejkqsZ265KR7ZG
         cDV6qe61WoRh9jU2E0YAVXAtKgiMVtmU+5tWJrBMYbzseRDbQ/YNpkjaaYOhOJKEvxdS
         owot94bQuUz8buO3ZEgGr1yt3UXW6wuBQgTtcnF3ioG7wMdGfUBtSXzGWCZlEiFZgpVE
         larlCYY1eV0uX0mnho6hZRJ/6Y8vGamtieVhwqi5J2h89GZS1RaoiIfVveLEvQcSpWvz
         6kcA==
X-Forwarded-Encrypted: i=1; AJvYcCXSSfyrIQJF1TrLXKY0mf7Bld1wgMxOycD0Il0BAX+s+m7m7InCIPAqjDeT0xbbxdLUKrl7qaZY/691dg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUahyVswDnPtyQJ3+bVboyDjz5kzL99t3zG+HvpgQ0qYOgGJAh
	LZQ/g3pOY3sPSFzfkZthacNUOcfWX1loVWfR4RD7wf87JLhf7McM
X-Gm-Gg: ASbGncsvAZTbFTFZlzaej2AU0L6r5DCnBsJGOgEPurJJuLOzB2/9al0oiN/eTqsd2/i
	q3ymhcEtgYuRNJ6q/mTrH/6vwpjn0Ufvkhi3TldAtqTDjAMwDHS+/Ln7LD5ETnJ13RiYa+U/MQC
	yuIPyu+WngjCEKWIQAQUXyzMRVBLvW0Xm3YZ14QjKzql1OLz97+7avHbFxTpDr/SjXXEVUl71Ew
	dav7Eo/0VdKJFW1e0l94MAzlW9VqBmOcoAQCzu6KiMHO6K1SMYkFUmrX16UxvLU8Ht3DWt/uDy+
	+5sqg2H4Zm1LLUR4nlFkaA==
X-Google-Smtp-Source: AGHT+IET+JJuBMU3Y/6jzse1ZgT54+aygXA9AXNLRXFpXqkVIx7/7mkYzYqgDRV3tj+3kjGQpH/r/A==
X-Received: by 2002:a05:6512:2249:b0:545:c08:e17b with SMTP id 2adb3069b0e04-5462eef2242mr1448277e87.23.1739968332998;
        Wed, 19 Feb 2025 04:32:12 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f6efbf5sm1596646e87.18.2025.02.19.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:32:11 -0800 (PST)
Date: Wed, 19 Feb 2025 14:32:06 +0200
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
Subject: [PATCH v3 8/9] iio: adc: ti-ads7924 Drop unnecessary function
 parameters
Message-ID: <3155f491753944d6511d058a09f6f6c505d551f9.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LHcdoEmAz0cVNgKv"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>


--LHcdoEmAz0cVNgKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Device pointer is the only variable which is used by the
ads7924_get_channels_config() and which is declared outside this
function. Still, the function gets the iio_device and i2c_client as
parameters. The sole caller of this function (probe) already has the
device pointer which it can directly pass to the function.

Simplify code by passing the device pointer directly as a parameter
instead of digging it from the iio_device's private data.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
This commit is compile-tested only! All further testing is appreciated.
---
 drivers/iio/adc/ti-ads7924.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
index 66b54c0d75aa..b1f745f75dbe 100644
--- a/drivers/iio/adc/ti-ads7924.c
+++ b/drivers/iio/adc/ti-ads7924.c
@@ -251,11 +251,8 @@ static const struct iio_info ads7924_info =3D {
 	.read_raw =3D ads7924_read_raw,
 };
=20
-static int ads7924_get_channels_config(struct i2c_client *client,
-				       struct iio_dev *indio_dev)
+static int ads7924_get_channels_config(struct device *dev)
 {
-	struct ads7924_data *priv =3D iio_priv(indio_dev);
-	struct device *dev =3D priv->dev;
 	struct fwnode_handle *node;
 	int num_channels =3D 0;
=20
@@ -380,7 +377,7 @@ static int ads7924_probe(struct i2c_client *client)
 	indio_dev->num_channels =3D ARRAY_SIZE(ads7924_channels);
 	indio_dev->info =3D &ads7924_info;
=20
-	ret =3D ads7924_get_channels_config(client, indio_dev);
+	ret =3D ads7924_get_channels_config(dev);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
 				     "failed to get channels configuration\n");
--=20
2.48.1


--LHcdoEmAz0cVNgKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1z0YACgkQeFA3/03a
ocUemwf9HQbiR77d1KNj4kGgWfMEpDY2y5qIlebPXJe94y1jkU+LPoFK/3yoptzd
1zmwZZHfvEO8pbuI5ZEkCVEtMIm8oD5KrC63b2fO3tB9AbXnHv/PIa7bGXmp4GRA
8qgD9c6WVzM0+j2WwUFzFq72g76QBdy+Ge46vYTR3FBmL4sNzrXOBlMYZ2SH/XcA
xbiF+7BSaInu5Xjlyg3hte9M1kZ99s+LzUDgNbE0Jv73W2vzK0bxqPbVZ+Jv/H30
hQ0EnHDjiZp1Jxmtcq6tkD4lzqD1OkLpToE3swDtstzlGyp5SXtx2npiiOKIebCO
XtHxNfk7lMQqw8ZSQdOZ/dCKUPnxWw==
=p/2t
-----END PGP SIGNATURE-----

--LHcdoEmAz0cVNgKv--
