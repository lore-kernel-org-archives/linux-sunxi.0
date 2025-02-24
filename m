Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FC3264613
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740421989; cv=none; b=oc+tZJyX8+GolJosn0/T0mTPr4i4U5P0FgplZwSbR2WAbDrTpFLIj7mFPl138zWKVLltcTiS7oATu6OdORNhd36rHiVu8ouuU15xWrEsE7VCG9cnBjgyq9iRuTLHKu7z4BR2LApshYggNv/VwLDYjm+DGNyaZ/uIAL0Svfw82AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740421989; c=relaxed/simple;
	bh=DxQZnEWKOJxTKJJIiD9R1K0zD2Ow0veeUtytjVV/gKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rw6zTI9cO6QeC8hEtuNBcpI7QWeHGGwS/FYMyAmTFbL7S6Vg9ol5S9LBXmlFfJK7gW2xKCaEip+PHZW3izz18C4LicVhAkz5YQfGyyfD9ILFoHD6e19UQu4kg0PwQQHKBONBMsQsGk+9sfsKp3k6mvQTSot9z8AA4rff0A761eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgOQ03ra; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgOQ03ra"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-548409cd2a8so2969540e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 10:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740421986; x=1741026786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SSOud79Vzi0uiSwrFzUVnpNiszCNIWd+xmMcmCt0CGY=;
        b=BgOQ03ragQvoj10NRO7Rmxt+poXaxZP9Pl0R9xLOg9wSYQqPZmS1X06HI6kOVnNkX+
         dDZOMR5Mmgmjovp7OYKPXkZ6+bgozyXFLZRsKzXT5I0BCoivT5Hw6tyy2Dg4NCrEqoJU
         Y3Cb6R+KLFjda3kLBoapQCbHnYOMozJgYk7BsGlem/FwADnvMV5ZFlNSmYt+oj5G6osk
         sDDmQ5YqO3JA5CKj04YPz2cEoRVGMN0Jt5WBM0Om3/gI1FmgHTJBlYYRpLdKXrYeMv3v
         qt+oQrjdiDNNprqiB/4dIxCPNH9BjK0tA4qpiIqArF1sMn3q6dXEaPazpUtwWJEJHxXQ
         sbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421986; x=1741026786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSOud79Vzi0uiSwrFzUVnpNiszCNIWd+xmMcmCt0CGY=;
        b=hk/Kk/1GFcSu09Erwx7BI30GHzABLJshZ9qo848CSZhNmNtj8h2JJmIAusCPPKnem1
         Epx4dLLOotDdhomOkguk95x3HqZa862kAjHDH9SfQ9tv5fR2IqR3tYe6fKjGW8ECCtJB
         dkPn2xSWKhXjvAFiSra4MmfoHMxwRiB3FVU1Z9/M1PN1DDH6scdv7xcytJRLwNn8h9An
         0Kho4oahYp6ArQU0mA7MQUxb4xXJYXuWdlnTYgn++80DUQXi3q5+XsaMz37jOy/X4qu6
         vQ1lQOXh+Fs9QleRyHwqwvnDTiWj6ZXukm+12ug5V3JDXefZPz7XNZvAikg3p9yV1XTH
         kFlw==
X-Forwarded-Encrypted: i=1; AJvYcCXKRUWNtYH9wjLe+Vpm+rkh4ohYeZIlXiSRFs5GVDlOlPs4GCY2Qbhr7oicFZ6Gi5K6lJAltqvgtvRv5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxilgG/o3TEEBCokOrm3rMpIJD8ZLSRfU6bEHghEhkPPmogTKQW
	HM/k2lSBMh3jbSP4SWeq2jlqW9Ki8XSSBLm3aCjQKN1rRMgFAJvj
X-Gm-Gg: ASbGncvI6FSRAwxvXsHDpvCwJUZUfmZO4Hi5a2DCHGUieEcH1mH6tqeLu66RhsA2U8C
	Lhr9TeiEoc34Rz8BvLY+lEbfHhD/ujXl8n97Bnx2M5nGlO0ECKFnxOUGPuyiGReCWCSoYhp4TVm
	So5nK59fqM+so56vvMHa/whHG8cVgQr6YRfanRfrFreQA4Mk+ya9JK4HoNP7TclDa85ygZF1fs6
	0ZVjxIC0+uqGsqw2x9rQyjkLKEMVu8/f4ZfkW8wJtqYxSHi9vSrwAtl69jgnwp2xW0a9cMSTjAA
	bjBHB0LaGA83A1nyXWyzXq5fGjPjARd4
X-Google-Smtp-Source: AGHT+IEb7m6b4nDvSqYxkQoqLJkKID/UW05aywoBDG1L44MOe5fbAylNbYH/ooMs67cDj3WL7N982Q==
X-Received: by 2002:a05:6512:2814:b0:545:60b:f38c with SMTP id 2adb3069b0e04-548510ed080mr34279e87.41.1740421986219;
        Mon, 24 Feb 2025 10:33:06 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461e731f02sm2539348e87.192.2025.02.24.10.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:33:05 -0800 (PST)
Date: Mon, 24 Feb 2025 20:32:59 +0200
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
Subject: [PATCH v4 02/10] property: Add device_get_child_node_count_named()
Message-ID: <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7y8fnmahBQr1cajK"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>


--7y8fnmahBQr1cajK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are some use-cases where child nodes with a specific name need to
be parsed. In a few cases the data from the found nodes is added to an
array which is allocated based on the number of found nodes. One example
of such use is the IIO subsystem's ADC channel nodes, where the relevant
nodes are named as channel[@N].

Add a helper for counting device's sub-nodes with certain name instead
of open-coding this in every user.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
v3 =3D> v4:
 - New patch as suggested by Jonathan, see discussion in:
https://lore.kernel.org/lkml/20250223161338.5c896280@jic23-huawei/
---
 drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index c1392743df9c..3f85818183cd 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -945,6 +945,34 @@ unsigned int device_get_child_node_count(const struct =
device *dev)
 }
 EXPORT_SYMBOL_GPL(device_get_child_node_count);
=20
+/**
+ * device_get_child_node_count_named - number of child nodes with given na=
me
+ *
+ * Scan device's child nodes and find all the nodes with a specific name a=
nd
+ * return the number of found nodes. Potential '@number' -ending for scann=
ed
+ * names is ignored. Eg,
+ * device_get_child_node_count(dev, "channel");
+ * would match all the nodes:
+ * channel { }, channel@0 {}, channel@0xabba {}...
+ *
+ * @dev: Device to count the child nodes for
+ *
+ * Return: the number of child nodes with a matching name for a given devi=
ce.
+ */
+unsigned int device_get_child_node_count_named(const struct device *dev,
+					       const char *name)
+{
+	struct fwnode_handle *child;
+	unsigned int count =3D 0;
+
+	device_for_each_child_node(dev, child)
+		if (fwnode_name_eq(child, "channel"))
+			count++;
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(device_get_child_node_count_named);
+
 bool device_dma_supported(const struct device *dev)
 {
 	return fwnode_call_bool_op(dev_fwnode(dev), device_dma_supported);
diff --git a/include/linux/property.h b/include/linux/property.h
index e214ecd241eb..a2770197f76b 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -209,6 +209,8 @@ int fwnode_irq_get(const struct fwnode_handle *fwnode, =
unsigned int index);
 int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *=
name);
=20
 unsigned int device_get_child_node_count(const struct device *dev);
+unsigned int device_get_child_node_count_named(const struct device *dev,
+					       const char *name);
=20
 static inline int device_property_read_u8(const struct device *dev,
 					  const char *propname, u8 *val)
--=20
2.48.1


--7y8fnmahBQr1cajK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u1sACgkQeFA3/03a
ocXtLggAgT5j/TSPxFsS/2C4xsWLs0/6SO9w6j9Ijy5MvfzcRBrH3Oc7aaWUzbrp
PPBZZzZYFn8NKT2exitsIOYpDFgQCSbwyf/+CQvoDcTfNw8NoEQwVYLV/oA3C/RZ
hBb0Rp5giodlJeN6mtzVfLQLTws+HRlrwogLb50yRxNWROlPMTDcAm3Mew6/MxqT
ULoEVgMmOIAOWFjvOw/HvD1qZnqrmMeIMk+5xyImS0JfN8S6AA8TJecvMLoXtq5y
e7jQrOztxk58RGrz6XQOmth61X7dQbAFu7SwuqTHeA8MtW4DQkhguM7B5eTOZqXN
YLmBzoJxbFu5Hh1nAFnl00fE/COr1Q==
=b5lW
-----END PGP SIGNATURE-----

--7y8fnmahBQr1cajK--
