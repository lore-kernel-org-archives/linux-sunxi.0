Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152B1EDA07
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Mar 2025 11:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001477; cv=none; b=mhRaV3HVIN6Fj8rbhy4g7hYcdaH8nRtWSV77nKblGnIHdqmQIVYSavtwxKJ4XUM/CAu0rWp7q9yeFpfY+b2bxfmF7OMSvfHsE+GZYrtMyH5UaqXWXf5oDvmhbxuSSSWivQTyvjbe6yqgQtPAdvhB5o3Bm1zBihZv1CzdMB2Xz4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001477; c=relaxed/simple;
	bh=uE+73JXciPA+V7kPRV8XWL/c5IUQ7yVFJ3PFc8BY5Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=taYeVRf/0QyEkAgz9btwlyjFY3S6yqedH0dvmcfR/cQCcrpOq9JEqoUubV6gSn1F4egjGaRxYBRlQtpZU/+ndxt8LFu/VCxtnT+nlaaNj+YSBF+q1tdVQjV0E1nZv5pNoPuiQIV0fbVg7qckDC2KCymva5D1dMIUlLgBG6FVM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LetCOCOk; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LetCOCOk"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54964f8ce4bso1070053e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Mar 2025 03:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741001473; x=1741606273; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKXywdzc/Et4yJtFDduOL5DqpXRTEQpflOuvO6/QFtE=;
        b=LetCOCOk0BXebkUjMahhnZAgIhIjKKX47oRTmCvkNwIqVyl060qLDOty+jtbk694A1
         Q9e2D0EuBWRo/aPVgkbNjUIqqTfuVrp1ZWq5ekvWKrWLjFVVUeh5/8CbehrEdMRmgfHZ
         4hwV9DtZ7kAPEzpXCiuhP2TZwXe++eSf4yufB/KID2vZ7rKIadn3OpjrVjpa7rCZ7ghQ
         atQ39ddOjGxpYcU7ENEJy5ESAcMNOZpWkofyc/8SqF86W1XueU2vcr+YkBRGL6v6DOmO
         NE90wuP6wrI+jicHko9B01oiZkc2M4TGJqGZKFaEayQCwxGXmpEtHQcrOYb7Q1mNA/5q
         0zqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001473; x=1741606273;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKXywdzc/Et4yJtFDduOL5DqpXRTEQpflOuvO6/QFtE=;
        b=ZhsfqEsNoC3L8KFqW6/pld3s1WcKK8GEfqgij21eEUbXn8TtVoi4aPddUqCSvfIZoY
         TW8kGBX7II0Wfz9SX5lneKf5sNMh4qbfFBTNpV7w5zqKB3qyKbAr2jMJNBzANcK5OwnI
         50WXoV0JY+U7uKo0Cbyk/jSZvvK06b2+f9AxjmPQw5tVqaDbK8src78Lc8QC6XohqwS1
         e/KyEflcaTfXA3Xlu6mMxjXonZ3jZLO1z6xRGtkVWQKmdKIAnEiYnwkjWiyU3Am8+mRJ
         dpPkal4Bp+hmBkQ1cbXKb6fp+SV1i1Jg0rHDYZgoLNfnAcoPm4DLakZA2Wzhq3iqtp1O
         rttA==
X-Forwarded-Encrypted: i=1; AJvYcCVxPyV+ppEv7QCqjJTrOujgMU2XjnedPOXVx4z3NzmqPa1gSigG/665nM0TJkSVBngulMmTMX72MtaQ+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDnqVrmJQwdssBLyqlBs0hj8ONcxrk483JbEXlCdgXI4NHs3t0
	kVEggvT76NLK6uv8U5Yu17i46oZ0kvjipb5gtQbCY9dldPFL3llx
X-Gm-Gg: ASbGncv9SHuxdwMOd3RJ0iklhwvuPMH3h/0WZDQ1BakZa23RVjPvSnVv8DQB5gTjIFW
	7yxfF8Zrv1+EWuxre27iMX0VbMHYWwE8P4A9ZE7RUm4iEOMLJ0Q1TYiN2Z3cudtyLcoJdRsueHb
	j0xFhFYk9BBocergnb5EbnBDbo4vQQPDpUv0PhaeE+pe6AyuQdDxHial+gMKyOYZ9OJ9I7XFeI3
	IPju/OY716CpkSGiYyIAEpHGiA7+NLX2N0JKFvgJlrHNWEDb8D+rBmBCybeT+lLMTZf3/5LYEdD
	auFQpNYWuQZQOr7sY/e2ZLuqFjZgea8nLLM7by00Cij+iLPrSVGHAdjTV2KMHKrKtS2loF8Rtk0
	jESYFE6kPf6M=
X-Google-Smtp-Source: AGHT+IHy7eVfyRfz75KlXzMg33WQpUvOMs2XoHaFWGcBRo3/jfRN7pYYEQKL0JaanfwqklYifmbf2g==
X-Received: by 2002:a05:6512:3c92:b0:53e:39e6:a1c1 with SMTP id 2adb3069b0e04-5494c38bde7mr5379294e87.43.1741001472861;
        Mon, 03 Mar 2025 03:31:12 -0800 (PST)
Received: from mva-rohm (mobile-access-2e8451-125.dhcp.inet.fi. [46.132.81.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495cb976e7sm595497e87.56.2025.03.03.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:31:11 -0800 (PST)
Date: Mon, 3 Mar 2025 13:30:59 +0200
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
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH v5 00/10] Support ROHM BD79124 ADC
Message-ID: <cover.1740993491.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ok8G6d4pd5Kde/Tf"
Content-Disposition: inline


--ok8G6d4pd5Kde/Tf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD79124 ADC.

This series adds also couple of IIO ADC helper functions for parsing the
channel information from the device tree. There are also two helpers
included for counting number of firmware child nodes with a specific name.

Series does also convert couple of drivers to use these helpers. The
rzg2l_adc and the sun20i-gpadc are converted to use the new ADC helper.

The gianfar driver under net is added as an RFC patch to use the newly
added firmware child node counting function.

There has been some discussion about how useful these ADC helpers are,
and whether they should support also differential and single ended channel
configurations. This version does not include support for those - with the
benefit of reduced complexity and easier to use API.

patch 6/10 is small simplification for the ti-ads7924, and it can be
taken independently from the rest of the series.

NOTE: Patches 4...6 and the patch 10 are untested as I lack of relevant HW.
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
v4 =3D> v5: Fixes as per various review comments. Most notably:
 - Drop the patch making the TI's ADC driver to respect device tree.
 - Add (RFC) patch converting gianfar driver to use new name child-node
   counting API as suggested by Andy.
 - Add fwnode_get_child_node_count_named() as suggested by Rob.
 Changes which were not proposed by reviewers:
 - rebase to v6.14-rc5
 - Do not include all recipients to all of the patches.
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
  property: Add functions to count named child nodes
  iio: adc: add helpers for parsing ADC nodes
  iio: adc: rzg2l_adc: Use adc-helpers
  iio: adc: sun20i-gpadc: Use adc-helpers
  iio: adc: ti-ads7924 Drop unnecessary function parameters
  iio: adc: Support ROHM BD79124 ADC
  MAINTAINERS: Add IIO ADC helpers
  MAINTAINERS: Add ROHM BD79124 ADC/GPO
  net: gianfar: Use device_get_child_node_count_named()

 .../bindings/iio/adc/rohm,bd79124.yaml        |  114 ++
 MAINTAINERS                                   |   12 +
 drivers/base/property.c                       |   57 +
 drivers/iio/adc/Kconfig                       |   17 +
 drivers/iio/adc/Makefile                      |    3 +
 drivers/iio/adc/industrialio-adc.c            |   82 ++
 drivers/iio/adc/rohm-bd79124.c                | 1108 +++++++++++++++++
 drivers/iio/adc/rzg2l_adc.c                   |   38 +-
 drivers/iio/adc/sun20i-gpadc-iio.c            |   38 +-
 drivers/iio/adc/ti-ads7924.c                  |    7 +-
 drivers/net/ethernet/freescale/gianfar.c      |   17 +-
 include/linux/iio/adc-helpers.h               |   27 +
 include/linux/property.h                      |    4 +
 13 files changed, 1462 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.=
yaml
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 drivers/iio/adc/rohm-bd79124.c
 create mode 100644 include/linux/iio/adc-helpers.h


base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
--=20
2.48.1


--ok8G6d4pd5Kde/Tf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfFkusACgkQeFA3/03a
ocWURggAh0aahWuhR4X2pAbWcrvLlgY0D9RSlfBWXUHB68G1gPrJjp5CTgZLemkh
d8hIvugJVz+G6zfkewr+abXoQbFlTjXSnKUUB6DAt0uoeJolaV6QxfNX9JwyLhMH
v5nQ2dValRMeFZVoh1hUCXjtrTFJCjBeGKqDb2Rb17SxjzYk09ObnyIJRh4MABsl
pyiO6m0xFOLr5vjd7f2sygWRigBYQPuDyTcre5WG0o3vNBTlEfr9BmR8aPNGFaJs
7KvjqfOj8BGczBrxIHCUxMiNkEIGCKODg1dMdm3VBLI03/Uy3LR73AEqzX3wjEY4
BBEZarVDoaTTVCmV9HvB+kvmJdW1GQ==
=xpnm
-----END PGP SIGNATURE-----

--ok8G6d4pd5Kde/Tf--
