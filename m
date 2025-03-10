Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58436227EAF
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611244; cv=none; b=G/LkLe+5daUPqIvHhur/t/JnBN5Ig7ANYCPZpRwOJZ+hwVWono65Zc2nT3Eu6zovKPNIVXfvNZQhoYjh25MMASxeQcfAejfwmLOggTUyHnab/qDAfTDDahVAJaJE0qWE8GmZt9Nz08u9HSf4DQJGuf0qR8zK7/0OxhLcomffdaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611244; c=relaxed/simple;
	bh=mKOW0y7H+d8JdihJ/mXGS3CisQcR/M7PjYl0QDlLLdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AO3ZTjEo7wdGQJS0iA3dnwAAEsd9W+Ck1PsuenbNekgSSv3aoA7quaGwOqI3mi1gjkcpyf6HaL1/3nqn44Gj+yqwiJ/hjYHmxUgOecApIo/HHAbnChEux+RJGEnmD8hdo/xppXkqHRDf5iDB+4oM8p5HxX87Gf/EYXeh6BM+CQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TERYYXxh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TERYYXxh"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499c8fa0f3so1714759e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 05:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611240; x=1742216040; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URGQNwjZdhyHI49nCxv8neX1u2OWYbpIKZ53BGm8OOk=;
        b=TERYYXxhSSKvyIzhrwu1UAg0KvdCMIG/HwtLBQpTU7UxEdFRChZ5DBjgKg3wWzcf4O
         iNAGLIyxTz+LE3tznyuPz6ivVY1T8LhJ1KZe//bZD452n6Lofwb0WYdPsD318IL5TsR6
         g1sQbaKg1G4S7I8Gbbo802e02Rvo+xkZQHMqF1UCPIwV7+pdNMJzABA+E4URIJiJnKmj
         U0LRSK5iarUNTH0x38EJq3RAQ9z3wlWEoEuUNiLBX+vjrnPftGksUf5FlghKMCF0GVar
         NDFHZh3EWDHRJoK+aEvv28Jr/j9t5rERNYjfZoPLWaUclV/LekVxAFF3626yq9yUcK4n
         L/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611240; x=1742216040;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URGQNwjZdhyHI49nCxv8neX1u2OWYbpIKZ53BGm8OOk=;
        b=I7FGWX0OmTxyasn1p7FXhC/5ZtvYwFrnG0ikk7N+m2NOhSJpNN41AkZ4tAsP4t/SzT
         1jbgk4PArSGfCK81LiNBht/b1kJjmr/pN99EN6x1r3zvTmoUKDlT8FfnXOz9gBONkP6p
         YN5kdYa53wLvOOmYga1MZaUN+OFqzZHH0WDesBlddDeBawVZa80HKYHY/w/gBjKykoT1
         mz3J9lg1edUeQTKKDn4Moaa3mT8UZ5rKcuuICfh6dXwL2qQ+MeBgu48iT7oKZ+TFNTUi
         hNNee11HcvggNFlaAcNlCzxY8L746kk8/Sced2vIiQPT60Mjxb1fCOFr5F/ooyiltgv/
         J9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAq5zG2woaA3nIIDBvIfOLvnX7NyvdbLQppRONk8k47CuQaQGfhXjMD8E5Jgp600oj7RaxzyUMNtRyTw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2WFdNrb7v1gM2PsXpJk7B6alewtivLUWDoP+2YTyf7Mx/NIvj
	mI6q2HeLBwn8tYxcE1YUdZLmWvjw47gNXLVq3JanCs19cIF7wxVd
X-Gm-Gg: ASbGncuYhJdSaNGeBnMeJ3Le+7UOsKl5/KquEYu3PooeOhxkIYYoR3CQV4oZm+BpVx2
	gkvRS+bTBfC65l1puUyHWzYtfPQkWUqrLl+1jM45RRhhH+AOfmFDoUC5DQ7/LEP7n3OERoTpEGY
	D6Z9e1qIA/VvlSKjdewvlQU6ljNCaIVKufbcDX2MNC50s7y8Zq0dS9IJNyGjCzOkUJNUROq/dbn
	S7p0irIF89sh2Hlp4LpWhqGNVSNr+SUsWHKgI476EbdKywp7ActV5zXdV9If/jS/EVxi63JsvYN
	zCpEj4/Z4pB4df5T52h143PPzSRbw4EDKveZQTNsxbB69ejB+3s=
X-Google-Smtp-Source: AGHT+IFA0RtQIyW+e03BOnWNOQUvnrcxE5yBsLBwjPqTi5ZfcZSG1+DhL9uQlcM6UFbaXZyVT+qAtg==
X-Received: by 2002:a05:6512:2342:b0:549:8b97:75f2 with SMTP id 2adb3069b0e04-54990e2bdd0mr3668356e87.1.1741611240055;
        Mon, 10 Mar 2025 05:54:00 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bc4basm1458604e87.164.2025.03.10.05.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:53:57 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:53:50 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Claudiu Manoil <claudiu.manoil@nxp.com>, devicetree@vger.kernel.org,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Lars-Peter Clausen <lars@metafoo.de>, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-iio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Eric Dumazet <edumazet@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Lechner <dlechner@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	Daniel Scally <djrscally@gmail.com>
Subject: [PATCH v6 00/10] Support ROHM BD79124 ADC
Message-ID: <cover.1741610847.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="muBpqT72KPU1YOIU"
Content-Disposition: inline


--muBpqT72KPU1YOIU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD79124 ADC.

This series adds also couple of IIO ADC helper functions for parsing the
channel information from the device tree. There are also new helpers
included for iterating and counting firmware child nodes with a specific
name.

Series does also convert couple of drivers to use these helpers. The
rzg2l_adc and the sun20i-gpadc are converted to use the new ADC helper.

The gianfar driver under net and the thp7312 under media/i2c are added as
first users of the newly added "named child node" -helpers.

There has been some discussion about how useful these ADC helpers are,
and whether they should support also differential and single ended channel
configurations. This version does not include support for those - with the
benefit of reduced complexity and easier to use API.

NOTE: Patches 4,5,9 and 10 are untested as I lack of relevant HW.
They have been compile tested only.

The ROHM BD79124 ADC itself is quite usual stuff. 12-bit, 8-channel ADC
with threshold monitoring.

Except that:
 - each ADC input pin can be configured as a general purpose output.
 - manually starting an ADC conversion and reading the result would
   require the I2C _master_ to do clock stretching(!) for the duration
   of the conversion... Let's just say this is not well supported.
 - IC supports 'autonomous measurement mode' and storing latest results
   to the result registers. This mode is used by the driver due to the
   "peculiar" I2C when doing manual reads.

Furthermore, the ADC uses this continuous autonomous measuring,
and the IC keeps producing new 'out of window' IRQs if measurements are
out of window - the driver disables the event for 1 seconds when sending
it to user. This prevents generating storm of events

Revision history:
v5 =3D> v6:
 - Drop applied patch
 - Add *_for_each_named_child_* iterators
 - Add a patch converting the thp7312 driver to use the new helper
 - Styling and minor things pointed by reviewers

v4 =3D> v5: Fixes as per various review comments. Most notably:
 - Drop the patch making the TI's ADC driver to respect device tree.
 - Add (RFC) patch converting gianfar driver to use new name child-node
   counting API as suggested by Andy.
 - Add fwnode_get_child_node_count_named() as suggested by Rob.
 - rebase to v6.14-rc5
 More accurate changelog in individual patches.

v3 =3D> v4:
 - Drop the ADC helper support for differential channels
 - Drop the ADC helper for getting only channel IDs by fwnode.
 - "Promote" the function counting the number of child nodes with a
   specific name to the property.h (As suggested by Jonathan).
 - Add ADC helpers to a namespace.
 - Rebase on v6.14-rc3
 - More minor changes described in individual patches.

v2 =3D> v3:
 - Restrict BD79124 channel numbers as suggested by Conor and add
   Conor's Reviewed-by tag.
 - Support differential and single-ended inputs
 - Convert couple of existing drivers to use the added ADC helpers
 - Minor fixes based on reviews
Link to v2:
https://lore.kernel.org/all/cover.1738761899.git.mazziesaccount@gmail.com/

RFC v1 =3D> v2:
 - Drop MFD and pinmux.
 - Automatically re-enable events after 1 second.
 - Export fwnode parsing helpers for finding the ADC channels.

---

Matti Vaittinen (10):
  dt-bindings: ROHM BD79124 ADC/GPO
  property: Add functions to iterate named child
  iio: adc: add helpers for parsing ADC nodes
  iio: adc: rzg2l_adc: Use adc-helpers
  iio: adc: sun20i-gpadc: Use adc-helpers
  iio: adc: Support ROHM BD79124 ADC
  MAINTAINERS: Add IIO ADC helpers
  MAINTAINERS: Add ROHM BD79124 ADC/GPO
  net: gianfar: Use device_get_child_node_count_named()
  media: thp7312: Use helper for iterating named child nodes

 .../bindings/iio/adc/rohm,bd79124.yaml        |  114 ++
 MAINTAINERS                                   |   12 +
 drivers/base/property.c                       |   54 +
 drivers/iio/adc/Kconfig                       |   17 +
 drivers/iio/adc/Makefile                      |    3 +
 drivers/iio/adc/industrialio-adc.c            |   79 ++
 drivers/iio/adc/rohm-bd79124.c                | 1106 +++++++++++++++++
 drivers/iio/adc/rzg2l_adc.c                   |   38 +-
 drivers/iio/adc/sun20i-gpadc-iio.c            |   38 +-
 drivers/media/i2c/thp7312.c                   |    8 +-
 drivers/net/ethernet/freescale/gianfar.c      |   17 +-
 include/linux/iio/adc-helpers.h               |   27 +
 include/linux/property.h                      |   20 +
 13 files changed, 1471 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.=
yaml
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 drivers/iio/adc/rohm-bd79124.c
 create mode 100644 include/linux/iio/adc-helpers.h


base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
--=20
2.48.1


--muBpqT72KPU1YOIU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfO4NsACgkQeFA3/03a
ocUrtAf6AkAaWL1Jnt8D97sqQ8s0urKuXJ/Emcn098LL3HXfpGZ3oOnkjn8mfJAa
Ic6x2BRQXOvDu/hzU3JAm3mPKKFi0Ksp/pFf28GP9hKetp3mmL6juBUdRJeNzNPN
BqAVFgh+GGv8UT38XCSI/7+bh1i50mU+t12fCDl7m+vXEYA237ulDTN1wWN+Jhd+
HpAjCsUj7hqY2HRHGecTzWMFGXdjZFGJJzxgqnuo+D1e000IkpHx9/9jejmHPkUK
ADeKqj0nQCp2LV/Kx8r393w9/MmpSBOD93cjCjHeN6OizuKvesExCkZUJA9BvvaE
giS8zbsz3QJNWA1MoPkbsNQ26lL2+Q==
=+1Jo
-----END PGP SIGNATURE-----

--muBpqT72KPU1YOIU--
