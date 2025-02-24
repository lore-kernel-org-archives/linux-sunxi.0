Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D9264A60
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740421935; cv=none; b=DKs9VJhgvS20uADUHeHicWFYiYQW3m/33xe62tK6ravHEoe+FsKCiESRX7bwosBJ0//pAuJoRVX9HaHx4XBtilQxtPsvdGXhALYn6wz6u/7N+gG7PbhKz1ty++71j+jj78U0QkZKyXc4f61jDSzpKgmoLZ5JgdQ8kZVHtVm4ofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740421935; c=relaxed/simple;
	bh=4MLcmJIBvKKZweH+r4aizHk9WzkqSH1/Ftb5joBdaRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PdQAUhTwdmPmaqt19mFhYxeERQkJy7wKntI4OfK9x1IhsVbhF6I9dAb3usZemGSQ2F2P9wRtZRorUhcpavQRiAvId9N1gOHS5GSLdrrVoIq6TRWd/XT2iqfja3lUadSGS94mKMWfs0lCn+AzphJPj4Q6mcMo6jPFxk1sMh2yUXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZpAnWy8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZpAnWy8"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-545316f80beso4260631e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 10:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740421931; x=1741026731; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXIG3rwFkUBNHGVcpVvR3tMHmQkVgrY0k20PaQNNWQE=;
        b=BZpAnWy8230lypMVqhyYJ/CDZtlTpOZJQ0MPdW8IDgVwQ2C7z/LKK/JGziqrh4EBf+
         DM8/bVBLAGXfpEs6wUGZFkV7H7jBEyxrHwjUY26u4iYrXG2WEk4Wu4gBmUa37q7jg6FT
         fvHWakiBThqkP2/rkOdhIXHfoxNMkIdvxaBNfRrNVfabX2OuLG9lQNlMTIq318VE9YkH
         Fsyle40iBa29dpMJ76Bn0+1YORTeQPw3jIk2XuwoJiE+VSSGswfIXcq8jhpiQHgHjVBt
         AV++YyrgbfO+sarYTRhwOkNvLuTspjGgTv/CqIEY3GNfgcf6FOS4rj8PsSymWzpYVhRB
         t4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421931; x=1741026731;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXIG3rwFkUBNHGVcpVvR3tMHmQkVgrY0k20PaQNNWQE=;
        b=LwCkE5IZIjFK+lTkGE9SKcZgGh9aJYSXwibux/csPsw5KdO9At7S9UrYROaUDjpjbr
         V8eahoEWSnYXurLFiHTTUstCu0oR0R8wYOfzkHiz7S9Hdm32FhRXKWF1tBRQdfnfeYds
         kv2NTlHM0ImvYLpQHQWVPXnVyIt1/mLRmWNZYzLInUNPnKHQ4+buDydDgZItCDN/IpQ8
         dJ/OC4efQID/FGBauvh+/PqR9kAOv1INn/HZQymF9E9aEPkraZICFL0e2lFLhR++IVf7
         eaGS3oizObDP/6J36u3X5uVAS7RJg5Vn6B58tYHtKmR7MX+fVX7O5n6uWlJf7kQGKNgY
         BlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGfangd6rP/3ZzDUwLZy+Fjk/3KwH9Io1NQCZRLOw+x9IyxYLpohlgJoSltA9dsweBeCQ6pag0D1Qrgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHGf9lDRAF3SXcexV4B4xyz8U522SDrPBvfrYVTze3nZmS47G0
	wYYWqcuR9grh50C5ETEq8D2jFRgerGvUlvxEsGL+/pzPnPvBqP37
X-Gm-Gg: ASbGncvqXpbyistjSN/2Dt8LLH4dNeU7A+g+GD9t4xoPTqa6H/PwSuP1+8Ogl9GFG6r
	czturUjSsZWu48a3uDAqHJG8H+kX47Plk7MZ3tnjS+eja/Pf2d2XqZTnS1b9qQHUTQbpSBSqzra
	vYKhBcVvYm1a5fYPPP8smjD00lL++BJI8NeitpcXXm0EI2+L7YL/5YrKXCfWGdyU9QYClSyxIMr
	jRZiklg7eVzMLJkdRH/DoX6m41Gu8qRJfqHrOP8YY3YLSoh0ixzNT1+uTc5K/9mm1+NactMt7IR
	ktpU9MLm6RpfP+39nr9AgCZ7oWJLd0yL
X-Google-Smtp-Source: AGHT+IFELQkBGEK3YIrY6vL2x7pgcre/YMocDwlofZQfU5axSRRV9108mGH1oEpDjZ+YLNE5cZW//A==
X-Received: by 2002:a05:6512:39d0:b0:545:944:aae1 with SMTP id 2adb3069b0e04-548510cf671mr29523e87.12.1740421931035;
        Mon, 24 Feb 2025 10:32:11 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545280ec98dsm3214737e87.42.2025.02.24.10.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:32:10 -0800 (PST)
Date: Mon, 24 Feb 2025 20:32:03 +0200
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
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 00/10] Support ROHM BD79124 ADC
Message-ID: <cover.1740421248.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gHB9+0TKqLctmFZy"
Content-Disposition: inline


--gHB9+0TKqLctmFZy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD79124 ADC.

This series adds also couple of helper functions for parsing the channel
information from the device tree. There has been some discussion about
how useful these are, and whether they should support also differential
and single ended channel configurations. This version drops support for
those - with the benefit of reduced complexity and easier to use
API.

A few of the patches are examples of drivers which could utilize
these added helpers:
 - 4/9 converts rzg2l_adc to use helpers
 - 5/9 converts sun20i-gpadc to use helpers
 - 6,7/9 makes the ti-ads7924 to respect the channel specification give in
   the device-tree using these helpers.

patch 8/9 is small simplification for the ti-ads7924, and it can be
taken independently from the rest of the series.

NOTE: Patches 4...7 are untested as I lack of relevant HW. They have
been compile tested only.

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
  property: Add device_get_child_node_count_named()
  iio: adc: add helpers for parsing ADC nodes
  iio: adc: rzg2l_adc: Use adc-helpers
  iio: adc: sun20i-gpadc: Use adc-helpers
  iio: adc: ti-ads7924 Drop unnecessary function parameters
  iio: adc: ti-ads7924: Respect device tree config
  iio: adc: Support ROHM BD79124 ADC
  MAINTAINERS: Add IIO ADC helpers
  MAINTAINERS: Add ROHM BD79124 ADC/GPO

 .../bindings/iio/adc/rohm,bd79124.yaml        |  114 ++
 MAINTAINERS                                   |   12 +
 drivers/base/property.c                       |   28 +
 drivers/iio/adc/Kconfig                       |   18 +
 drivers/iio/adc/Makefile                      |    3 +
 drivers/iio/adc/industrialio-adc.c            |   89 ++
 drivers/iio/adc/rohm-bd79124.c                | 1114 +++++++++++++++++
 drivers/iio/adc/rzg2l_adc.c                   |   38 +-
 drivers/iio/adc/sun20i-gpadc-iio.c            |   38 +-
 drivers/iio/adc/ti-ads7924.c                  |   83 +-
 include/linux/iio/adc-helpers.h               |   22 +
 include/linux/property.h                      |    2 +
 12 files changed, 1470 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.=
yaml
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 drivers/iio/adc/rohm-bd79124.c
 create mode 100644 include/linux/iio/adc-helpers.h


base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
--=20
2.48.1


--gHB9+0TKqLctmFZy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8ux0ACgkQeFA3/03a
ocVH+Qf+PVSPEXpY6uBYLMku5n+QutsoR3rKRhpzdBZ3Tj+hKJn8+FyCyt+2G/vK
5/D4Svsjq8DAF4yPWYmDk5HZi5zgofR9KWOmI/VgO6amTBx3bZEScWCoyj2i7VYf
O0XCQ06tXbm7nmotSiQkY7VDXaGhfZPMU3nj+xUQ84iZTbTPOI8Os8RiPfstISiM
cnfScD22RKz+5zHt5oqSBmZHB0jrWHzeXGZF+3gZQ6502STKMTfu76PBnpJkc56S
XbSq9SH9cH0jorWT0kYQyqc+7Bsv0SY9LwHP2ynDDmD7PBIF/sA2FbOy3Mk8P+54
jdNn0uGJKc5cEqbL6o1tg85PP6ztuA==
=H7qR
-----END PGP SIGNATURE-----

--gHB9+0TKqLctmFZy--
