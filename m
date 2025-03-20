Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE5F1F03F2
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Mar 2025 08:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458873; cv=none; b=DjSDyLr6ycekdgWFywhkNa5PnizRwgYHmek/YMnJ2n+h1dcdF5ffMkosjLBmqB1b4mnueBsoGkdvjrpuBCIIK0QAFokiQgtyFYxSjYc8zv+mEDvcz2brZUVUm0kciH7TmpVgKHhAAxeroq+Wweh2n0xtOy8sZD4yrGov+4FRNV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458873; c=relaxed/simple;
	bh=9RDEkfUAtOtIDvk2ej8pElhGQ26MOiuQJ/PWR+OiWEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saQd4jNIOnn4jq3i9oJszmGMOEEfdFoPPgcMmWl4c4IANtakaDAolV9PCpCxLEiAgUkmnvPB+gflSnGgXReiEjzUVZx9F7S9cmiAX4y7ZN604KjvwMxP+OMltTYeoybWPK/KfVnSWarLF/NhN/PW4uGFzgLUhiC/XjQKVl7Gvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUNtaMsN; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUNtaMsN"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54954fa61c9so719165e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Mar 2025 01:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742458870; x=1743063670; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8YCQKSCMbcpjqvqGVAud+bsNcc/Isbjy4a8q5O0R/8=;
        b=jUNtaMsN4cJOZ3y2o81osSXiKyJcdH7fnO8QH/6OnU8lf0JiycvOcBLpQMV7FPtKAH
         GXKQGk6P+T23AGZM6V07jsWCETCHTtonhvb6wrztsOnkXBpbvhK3QN0eE6AiYP05Alxh
         KQeitxNN4VjCIXvywR514e+Yvz8U3nqKooUNgJjjH/1aMeaxWFh78aCObL4SO7D/R45n
         Fr9E5pzKqTTCHn3D28ZKiRgkaYLfCIhkxb+eYVHu+pITz7X2bwkPfDx25DsBneShWylw
         KrV7EtvKB9kMOmuFJO5/fQHT7zWJuZfuxdJP2m0aWmDJp3Uuk66bo292fHZZgSeCV9nc
         77xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458870; x=1743063670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8YCQKSCMbcpjqvqGVAud+bsNcc/Isbjy4a8q5O0R/8=;
        b=RU9p0Nl4Ba/KlLAfc+bG+94L8f4JgnvJiA5XpEsQwlGI9ffILTRKp4wo6f67GI4mTD
         eMtBxMmjIjcvAauB4NMG0tx7qYm96K4V4CZYHzSCMSWKh0Pnz7Npc8Qd94vNB0DDnx09
         gtNRszFSGSgLkp3Dexu7bAKlCmNFrpzLaiadzn9F8cXPaSPFpwhqO/lzjIbuou61rcxE
         0L4Nnt9er9qYI3yPZOXT/NqWB/fHvtF/1Fq4ZVeM4ELCTU1nimccVQgn7+CX6vrhXz1D
         NMfSbMj4C4Gr06O9YP2vxEDfkpU5wCv8yjge4lY9VjgpJiBTvlGG3vqi7Xmfah1dUAPY
         rpRg==
X-Forwarded-Encrypted: i=1; AJvYcCX+aIXCGGgZUo2b5VMIsisHQHRVhDtRcSUMqJfvAoZGHoSHsRfVxpBsV4Ax8jv0t6kj5Um0jYNnqqj2Kw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyutfjiXAObhWkraSl2fZO+XYx46qkiCjbYWnOAG86vyfFnOglh
	EutOV4zbf35fiRGEHQV+UDZX/lj7e3Oe7W/4pyYi562dfcT0pWGo2WuK+A==
X-Gm-Gg: ASbGncsehsD3Y25nCcbqRO4Iv6N7ytThOYaCjRL7A1yYlRF7L2XKJdn9+S/YTjV9GqD
	CrUoHFqLI+QlOvPNuof36696bfLh7JO5LOhGilGjRUOIJ1g+srhxagoKm1txumI1h2gJMPCuECP
	i56YAlhcOltZ2kYJMHX30XNJ8EyuL6JUGYyam7UPc4mo0cVkFGCS11IPUkoMLEKUJXHA+ozo1yy
	Tbe6WWkxbDSWTqvAtN5FWfIorqdF1C+xg3QGw6yz0xQS+O/nqzeVYnSCo/afiqtxHL74MXxMEKp
	yZy+TKHRooTP5lq84x+M1Yjeo9bIG1adKwsdnikxzXNzQ9PzUAo=
X-Google-Smtp-Source: AGHT+IEtQcDT1hKcr/hyPc4GQAHaaV6Ce4tKlVEIYYQ9CJsshWPNPgEWDxvASx6328HXCmwcR69h0Q==
X-Received: by 2002:a05:6512:ea5:b0:549:8d16:7267 with SMTP id 2adb3069b0e04-54acb1a3327mr1879960e87.10.1742458869558;
        Thu, 20 Mar 2025 01:21:09 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88536csm2134374e87.177.2025.03.20.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:21:07 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:21:02 +0200
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
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v9 2/8] property: Add functions to iterate named child
Message-ID: <fd959b10904a401d3f6fb855933be1a4750ef670.1742457420.git.mazziesaccount@gmail.com>
References: <cover.1742457420.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YRU/gfTfRaKrfWT3"
Content-Disposition: inline
In-Reply-To: <cover.1742457420.git.mazziesaccount@gmail.com>


--YRU/gfTfRaKrfWT3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are a few use-cases where child nodes with a specific name need to
be parsed. Code like:

fwnode_for_each_child_node()
	if (fwnode_name_eq())
		...

can be found from a various drivers/subsystems. Adding a macro for this
can simplify things a bit.

In a few cases the data from the found nodes is later added to an array,
which is allocated based on the number of found nodes. One example of
such use is the IIO subsystem's ADC channel nodes, where the relevant
nodes are named as channel[@N].

Add helpers for iterating and counting device's sub-nodes with certain
name instead of open-coding this in every user.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
---
Revision history:
v8 =3D> v9:
 - Drop the fwnode_for_each_available_named_child_node() as suggested
   by Sakari during v8 review:
   https://lore.kernel.org/all/Z9mQPJwnKAkPHriT@kekkonen.localdomain/
v7 =3D> v8:
 - Fix the example in fwnode_get_named_child_node_count() documentation
   to use the fwnode_get_named_child_node_count() and not the
   device_get_named_child_node_count()
 - Fix the rest of the new macro's indentiations
v6 =3D> v7:
 - Improve kerneldoc
 - Inline device_get_named_child_node_count() and change it to call
   fwnode_get_named_child_node_count() inside
 - Fix indentiation of the new macros
v5 =3D> v6:
 - Add helpers to also iterate through the nodes.
v4 =3D> v5:
 - Use given name instead of string 'channel' when counting the nodes
 - Add also fwnode_get_child_node_count_named() as suggested by Rob.
v3 =3D> v4:
 - New patch as suggested by Jonathan, see discussion in:
https://lore.kernel.org/lkml/20250223161338.5c896280@jic23-huawei/
---
 drivers/base/property.c  | 27 +++++++++++++++++++++++++++
 include/linux/property.h | 20 ++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index c1392743df9c..f42f32ff45fc 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -945,6 +945,33 @@ unsigned int device_get_child_node_count(const struct =
device *dev)
 }
 EXPORT_SYMBOL_GPL(device_get_child_node_count);
=20
+/**
+ * fwnode_get_named_child_node_count - number of child nodes with given na=
me
+ * @fwnode: Node which child nodes are counted.
+ * @name: String to match child node name against.
+ *
+ * Scan child nodes and count all the nodes with a specific name. Potential
+ * 'number' -ending after the 'at sign' for scanned names is ignored.
+ * E.g.::
+ *   fwnode_get_named_child_node_count(fwnode, "channel");
+ * would match all the nodes::
+ *   channel { }, channel@0 {}, channel@0xabba {}...
+ *
+ * Return: the number of child nodes with a matching name for a given devi=
ce.
+ */
+unsigned int fwnode_get_named_child_node_count(const struct fwnode_handle =
*fwnode,
+					       const char *name)
+{
+	struct fwnode_handle *child;
+	unsigned int count =3D 0;
+
+	fwnode_for_each_named_child_node(fwnode, child, name)
+		count++;
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(fwnode_get_named_child_node_count);
+
 bool device_dma_supported(const struct device *dev)
 {
 	return fwnode_call_bool_op(dev_fwnode(dev), device_dma_supported);
diff --git a/include/linux/property.h b/include/linux/property.h
index e214ecd241eb..3e83babac0b0 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -167,6 +167,10 @@ struct fwnode_handle *fwnode_get_next_available_child_=
node(
 	for (child =3D fwnode_get_next_child_node(fwnode, NULL); child;	\
 	     child =3D fwnode_get_next_child_node(fwnode, child))
=20
+#define fwnode_for_each_named_child_node(fwnode, child, name)		\
+	fwnode_for_each_child_node(fwnode, child)			\
+		if (!fwnode_name_eq(child, name)) { } else
+
 #define fwnode_for_each_available_child_node(fwnode, child)		       \
 	for (child =3D fwnode_get_next_available_child_node(fwnode, NULL); child;\
 	     child =3D fwnode_get_next_available_child_node(fwnode, child))
@@ -178,11 +182,19 @@ struct fwnode_handle *device_get_next_child_node(cons=
t struct device *dev,
 	for (child =3D device_get_next_child_node(dev, NULL); child;	\
 	     child =3D device_get_next_child_node(dev, child))
=20
+#define device_for_each_named_child_node(dev, child, name)		\
+	device_for_each_child_node(dev, child)				\
+		if (!fwnode_name_eq(child, name)) { } else
+
 #define device_for_each_child_node_scoped(dev, child)			\
 	for (struct fwnode_handle *child __free(fwnode_handle) =3D	\
 		device_get_next_child_node(dev, NULL);			\
 	     child; child =3D device_get_next_child_node(dev, child))
=20
+#define device_for_each_named_child_node_scoped(dev, child, name)	\
+	device_for_each_child_node_scoped(dev, child)			\
+		if (!fwnode_name_eq(child, name)) { } else
+
 struct fwnode_handle *fwnode_get_named_child_node(const struct fwnode_hand=
le *fwnode,
 						  const char *childname);
 struct fwnode_handle *device_get_named_child_node(const struct device *dev,
@@ -210,6 +222,14 @@ int fwnode_irq_get_byname(const struct fwnode_handle *=
fwnode, const char *name);
=20
 unsigned int device_get_child_node_count(const struct device *dev);
=20
+unsigned int fwnode_get_named_child_node_count(const struct fwnode_handle =
*fwnode,
+					       const char *name);
+static inline unsigned int device_get_named_child_node_count(const struct =
device *dev,
+							     const char *name)
+{
+	return fwnode_get_named_child_node_count(dev_fwnode(dev), name);
+}
+
 static inline int device_property_read_u8(const struct device *dev,
 					  const char *propname, u8 *val)
 {
--=20
2.48.1


--YRU/gfTfRaKrfWT3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfbz+4ACgkQeFA3/03a
ocV5kwgAqP6S8zt8MaFdvTnQ26ACvVcKar6Gy2oM/5KkY544czu7VyYtNPYp0dHi
PIrWhfxOMHKsPcqMHe4nHxSVVjFKdBBMq/6/kNS5AEqSiMSnP7XgPo25MtyEwwSI
bECHybECCeTuPpaYlNSY6mKDaefr0IyZEiJbG6vlAnUd3nZ1LhGMzNAkllSsPI4f
nQrXBfIldS49i5cjLFfkybaia7iKsOheKcafo3TniFyUFIm55dG5v5yv6Eh2Ofwf
RfvHs6Do3ThWkOOtVY/AlxWqkSD63Hq//vXaZJ7T4GAiJNHGFI+GJ8JcKy6gfI+o
ZUBbkH6QfVjUCMha/CCymXxh4aIvrw==
=xACW
-----END PGP SIGNATURE-----

--YRU/gfTfRaKrfWT3--
