Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D288D154BF0
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742226622; cv=none; b=YXpbgi0d1zfXznUeqPAiSe2hC41e/C3qWR92kTS/6p0d4vzziCcgzTUFAKBCRMHeu59JbnmlJ3n5tA0I2CacBLZOOxp/3GRiaBRwnQ68XSI5TMAu3GzbvACnoxINl8kfjyYuyXLqqBAj7C0Xad05u0S09d5bwDszwSmRB12iqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742226622; c=relaxed/simple;
	bh=zHMEyzh6bH7Z8CD2gG9sgjQrUTIsPbK+k7YB8FvOlFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sMJBk4neeuFA04P6ydy25FldkzNa3vHVACOs6r1i/st3YXZlx8bWIt7t8Yd553oWUypUWCKoOFxNlcCTViYOOt82AimgbxgLjkomHBWbsG+77Y5hSSk46RrOL7zvYh5A7+NP9nHLEj7rWQt//cY7BDpaVXCxrOBHeCqwr3Sb57k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMXtPggO; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMXtPggO"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso39238451fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742226618; x=1742831418; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNOayVZzruF25qo+UUG/I+wNtI3C4q8PUctq82MxRNY=;
        b=eMXtPggOTc/1ii+1PRgMlBZEmpfOYSc1n816D5jBbsK/20umkrg0FOxZBn7Iu0vQpZ
         /2Ueepb7Yh2Z46Ge68V2JP9KD73SSav/YoyBcQTY9He2sfFLzarIRYkC+H3xmlqdVKwi
         kH8vLYG5lZrY+U/iv9IG1s6QyOp1F51fEOjG6TssKeAS9HblY1G0xdEZ3N22RJbd+PWc
         gL65+tbepTcqbf+wzZoDEcg2A5Xk1LjhLO6GsNDUP1tRdSKkK7RUTUu+ThVwGf/6DUhs
         2YnJ5BGC2L3TYrMeJEOyT0dFtP9F9ZWiIlSbt0HBicS/olUaKh7SkCggA9LGa4NrBWbN
         BT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226618; x=1742831418;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNOayVZzruF25qo+UUG/I+wNtI3C4q8PUctq82MxRNY=;
        b=Fbe9HzDRAm+DDLUsrHYR50/AOvuz/aNQL3Go/YG/Ky3H4pVLLHzawCykMs8bdVG04M
         WqeTRLN2joQOb0DyzJGimmMYtU70gh8jgbUDTRVatG9F6FnNZ7b02GvSqGaLfxA1L12x
         W+M7yLNjYEXUr7dhkfb5ywZ9OIs/eknQTIt4eX4lrVrQSQE1Xjl3j4ipvnv9Dr49PZpT
         JVOWZ5ZXe958MjcSUDeB27RXfoMEv5GGxNNMUSGQIstXFf29g5g5K4bB4AqD827+JDO6
         jUBfN1+yu5I4wAW13YSeBABg+GXJuiGXKv4Yw8TbekPfa7Quyo9YpfZ/qei8G0Ve1CPy
         0cgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyAHKtyvnK8JIKwYR5ZuKEE4+YAwg3gT047a7kIwlQcW9wMWHgJtwDhyTSwYj/iuu3bBUGKGXEDcTISA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl2FmzNXTSay0MvXZyXaEAV+7YIACueZSktahbWYf61RuDLT/k
	jTQW5J6uvQ2TDbBOAZYqml9eklliqlxI8MlGRpfroVRyf7UTg6W1
X-Gm-Gg: ASbGncu8RefT6e8pRN/8vGLLPQL9Zu63ag+LUGaDh4hQrg+mJMu1nTtaOyrZdkuE6Bf
	FropuWTGK1srgTpfE8CuMEVGAncUj88MYeSuEcF0KC5TcmHSrn52TuLNM+B0iIYCsszPTyy8JGY
	z1pc2/Km9Ud72+Dz5PjIpzChvajUNVjfqna0mO0pbSgi4jG6hU3dys4YVFUUhTB1z4vipnV4/yx
	MrfAplXCn1Z9V9TMRqzISz0rNtoQQL8kRNcNX2Nto+2/qdGa5ZNx/58DaXpwz391jJs1Y3aNCjC
	68SV79UoaytanbuZj2EwwLRxpKLUC2tn/MoYyN121im6w4dejuY=
X-Google-Smtp-Source: AGHT+IH2J2dM6NscTQp0mvC9nLmPZNZM8W2TCQNJugI/Z/QfFfc9r6cbqFGCWfHK+HIO1hHmjRXrxw==
X-Received: by 2002:a05:6512:10c5:b0:545:d70:1d0e with SMTP id 2adb3069b0e04-549c38ef457mr7787694e87.3.1742226617402;
        Mon, 17 Mar 2025 08:50:17 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a9525sm1357222e87.238.2025.03.17.08.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:50:16 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:49:43 +0200
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
Subject: [PATCH v8 00/10] Support ROHM BD79124 ADC
Message-ID: <cover.1742225817.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BWiCDWUCN81RqMlJ"
Content-Disposition: inline


--BWiCDWUCN81RqMlJ
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

v7 =3D> v8:
  property helpers:
    - Fix the example in fwnode_get_named_child_node_count() documentation
      to use the fwnode_get_named_child_node_count() and not the
      device_get_named_child_node_count()
    - Fix the rest of the new macro's indentiations
  adc helpers:
    - Treat 0 ADC channels as an error in
      devm_iio_adc_device_alloc_chaninfo_se().
  rzg2l_adc / sun20i-gpadc:
    - Drop zero channels check from the ADC drivers using
      devm_iio_adc_device_alloc_chaninfo_se()
  BD79124:
    - Use unsigned for regmap values
    - Commit message fine tuning
    - Check devm_mutex_init() return value
    - Handle 'ALL pins as ADC or GPO' cleanly in BD79124 driver
    - BD79124 styling / typofixes

v6 =3D> v7:
 - Inline device_get_named_child_node_count()
 - Fix kernel-doc for fwnode_get_named_child_node_count()
 - Minor styling fixes
 More accurate changelog in individual patches.

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
 drivers/base/property.c                       |   27 +
 drivers/iio/adc/Kconfig                       |   17 +
 drivers/iio/adc/Makefile                      |    3 +
 drivers/iio/adc/industrialio-adc.c            |   82 ++
 drivers/iio/adc/rohm-bd79124.c                | 1138 +++++++++++++++++
 drivers/iio/adc/rzg2l_adc.c                   |   39 +-
 drivers/iio/adc/sun20i-gpadc-iio.c            |   39 +-
 drivers/media/i2c/thp7312.c                   |    8 +-
 drivers/net/ethernet/freescale/gianfar.c      |   17 +-
 include/linux/iio/adc-helpers.h               |   27 +
 include/linux/property.h                      |   24 +
 13 files changed, 1481 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.=
yaml
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 drivers/iio/adc/rohm-bd79124.c
 create mode 100644 include/linux/iio/adc-helpers.h


base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
--=20
2.48.1


--BWiCDWUCN81RqMlJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfYRI0ACgkQeFA3/03a
ocXCCQgAzu7d2zrfNNk6cQrDTPa0/2+0UBgC7HZTPhGxEJvxMi4HFI1fuzWLCfaF
J3FGed5QHehj+ZsdI52fVxJJTYWzecm57BSDhFPSR9sok/maMmQNvAmRYccP6oe5
zZvTmMshLHwR2FJW1LLWABosZN8FsLyi6WzHVPm6OIk4zbOGshorhaOw0oS5hwgq
Is1HmpeCufLxSBJKI6PQRzdLkw/hpvUjr7s27EJ//mIqOTBkm4IKi0gFT++9WPVq
+glx3kzTQif6rUmcDw5fwmbmBwSsJINvNfQP9hekKPKP4DAvS+HyPB6RJFFVc7/i
cz2sVMsoLJQZrcZh96jPzENM2ynhUg==
=HMoK
-----END PGP SIGNATURE-----

--BWiCDWUCN81RqMlJ--
