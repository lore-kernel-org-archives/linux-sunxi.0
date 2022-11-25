Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD57E
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 04:01:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 681D45C009B;
	Thu, 24 Nov 2022 23:01:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 24 Nov 2022 23:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1669348875; x=1669435275; bh=ABZhlJD5S/ZKX7Bf8fIlM84g5
	HAFuIAnCW2oNys0fZk=; b=E/xlqJyRjXELgidPjDVX3pkVBthvO9UTTBJmoGZ6/
	v4VGLZmEtYIkEmtrdptKGpRNk7LpSFG7pG7ZgXJtppBnatVrzos/T7Wz3P5yHFMH
	39n7CrAYOK87X7377cG0K3iD/Z2/e0Nc1PHOVpPWXhviQWP4GPYH7fSWmT+RwXdV
	b9RHEhWFrY1drViap8B/WePKFXJVoRYtim3c5IMb9x3GVRDgLWxBMDekIAqDbppd
	+xH+qi1ZdRGpyfH51leOmTVaYTwX0y9iLSwOiBpX4DWfNAVfwHmD1BAaPJvbZAS6
	P6+VFIq9PdAbn0GibCCj9lMLhaRqkW6oGVtLi2t8QIxKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1669348875; x=1669435275; bh=ABZhlJD5S/ZKX7Bf8fIlM84g5HAFuIAnCW2
	oNys0fZk=; b=ucHH4tyW5BMnD0GQOXFrwSYuVyZbmNkC+8oU7CA14OSXCDUHb8Y
	SsKiudJbN7r0ntju67eSWj2vEmYARg8edW7cfGtIpKUd+KXsEEnJvVCfKT5EnN35
	Kl/7XKXNKG0Tfo8arm8wljS57yJEkp1T0kFif+QkJ+wz+cFc2z1ONxQmFKPvldxb
	iJfW2c2NAP+REW/6roJpedafTinWbrOoyPRmhwbpwtoQr/I5e4N6u4zWcfEpVlmR
	7cbYLm2KkcEls+ywN5pLGeEFMAD4CH/ZMhLs9HtJgRRPGDE8LyOUdRAgBHRf1dA5
	qa4kzBf3HnMFm5IUQcC+aV+OTpk+PGBh9lQ==
X-ME-Sender: <xms:Cj6AY4WqKQVxki08UUYjXbA_YVxOQP3UdJOIdV3ox_wAWqcfU4jyow>
    <xme:Cj6AY8k0g3JX9-ZQIcia63ouJezgsQOefCzd2mfBMlz7J1Ix_JESPgKqK5Qu40S_v
    PNIW6-ybIGvJh4MRg>
X-ME-Received: <xmr:Cj6AY8Zn9pHSIt6efqdR4iv-BrZdhABj11tYcE45-m2m9NBVIF_8ti66uPRKaNHBnNC4CuR5D-PKy81Uzh75bGprglJwpSOPJGEO7Jb_cXJa67Sw2ipHVeo7t48_Zuz5hezZug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeggdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeehhffh
    keekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Cj6AY3V_kSp5i8Ngzo0w3JEhsF7fr4B7bgU_IGfrrsYIhbI5ZHAcgw>
    <xmx:Cj6AYyknlgoP9cEFHzAstcgM9Xopss4LRwRkC1xrcPMybS6HWFeBBw>
    <xmx:Cj6AY8ce0JHyKeuSoekw5DbTFjQC5l4cKLUMezOrNHsHnayfe16Ymw>
    <xmx:Cz6AY9-IvxEoRjs-7OhPs63nX_mESO2Fw3reBDMDUVMRl21IbqN5kQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 23:01:13 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 0/4] regulator: Add support for Allwinner D1 system LDOs
Date: Thu, 24 Nov 2022 22:01:08 -0600
Message-Id: <20221125040112.18160-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the binding and driver for one of the two pairs of LDOs
inside the Allwinner D1 SoC. I am splitting up the series to unblock
merging the SoC devicetree; the analog LDOs are not required to boot.

A binding and driver change is required for the SRAM controller, to
accept the regulators device as its child node.

The example for the regulator device binding is in SRAM controller
binding document, per Rob's request to keep MFD examples in one place.

Changes in v4:
 - Fix the order of the maintainer/description sections
 - Replace unevaluatedProperties with "additionalProperties: false"
 - Drop the analog LDOs until the codec binding is ready
 - Drop the analog LDOs until the codec binding is ready
 - Remove unevaluatedProperties from regulators schema reference
 - Check the compatible string instead of the node name

Changes in v3:
 - Add "reg" property to bindings
 - Add "unevaluatedProperties: true" to regulator nodes
 - Minor changes to regulator node name patterns
 - Remove system-ldos example (now added in the parent binding)
 - Adjust control flow in sun20i_regulator_get_regmap() for clarity
 - Require the regulators node to have a unit address
 - Reference the regulator schema from the SRAM controller schema
 - Move the system LDOs example to the SRAM controller schema
 - Reorder the patches so the example passes validation

Changes in v2:
 - Remove syscon property from bindings
 - Update binding examples to fix warnings and provide context
 - Use decimal numbers for .n_voltages instead of field widths
 - Get the regmap from the parent device instead of a property/phandle

Samuel Holland (4):
  regulator: dt-bindings: Add Allwinner D1 system LDOs
  regulator: sun20i: Add Allwinner D1 LDOs driver
  dt-bindings: sram: sunxi-sram: Add regulators child
  soc: sunxi: sram: Only iterate over SRAM children

 .../allwinner,sun20i-d1-system-ldos.yaml      |  37 +++++
 .../allwinner,sun4i-a10-system-control.yaml   |  28 ++++
 drivers/regulator/Kconfig                     |   8 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/sun20i-regulator.c          | 150 ++++++++++++++++++
 drivers/soc/sunxi/sunxi_sram.c                |   3 +
 6 files changed, 227 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/allwinner,sun20i-d1-system-ldos.yaml
 create mode 100644 drivers/regulator/sun20i-regulator.c

-- 
2.37.4

