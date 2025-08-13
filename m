Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC5C27462
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 23:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755129390; cv=none; b=gEc1c9cRr1aCt7h1gXlJzS6ShKrMFrbEQW2Sg+vxaBNQJokZHSWJu/WBYWjr9j4X4fNJ1bT3d2gb7BwMZKkMQvvwotbyyttaBlhysu8jA2hR4objIJV4ND6ZuHYCw82kysVvTSJaISUqyCjRcmvoUFO0VQClOlb5UbwEUVGvtQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755129390; c=relaxed/simple;
	bh=0gMaOXiwCkO8Yv/bNLAgqvbF38VbP+tWgQlGJwyd+y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fnD18sfmXavjBMaV8EnLSdYO3F3eKq9wmhh8Vf71lritiZoOcrRphBOHydNEtgl8NFm0qmM7oXwdTjwMjeQl1Rwp06aWlbsjLityHzGGXiQ19qr4+RLWjaePnoPSDOyZquaZGLwF3mQur04HMl3/Yd4c+SP2FhXuDzivzum6ASY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B603D1595;
	Wed, 13 Aug 2025 16:56:19 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 262E73F738;
	Wed, 13 Aug 2025 16:56:26 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] regulator: Add X-Powers AXP318W PMIC support
Date: Thu, 14 Aug 2025 00:53:27 +0100
Message-ID: <20250813235330.24263-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the X-Powers AXP318W PMIC, which is
used recently on new boards with Allwinner SoCs (the A733).
It features 9 DCDC buck converters and 28 LDOs, plus the usual ADC,
interrupts, and power key components.
I am marking this as RFC, as this is untested, since I don't have hardware,
but at least the datasheet [1] gives enough information to get the review
and discussion started.

Patch 1 adds the compatible string to the binding document, and adds
the additional input supply properties.
Patch 2 is the MFD part, describing the regmap and all the interrupts.
So far we support the regulator and power key devices, the ADC and
other pieces will follow later.
Patch 3 adds the voltage regulator rails, this part is crucial to enable
any board using this PMIC, as we depend on those rails even for basic
devices.
Based on v6.17-rc1.

Please have a look!

Cheers,
Andre

[1] https://linux-sunxi.org/AXP_PMICs (link in last line)

Andre Przywara (3):
  dt-bindings: mfd: x-powers,axp152: Document AXP318W
  mfd: axp20x: Add support for AXP318W PMIC
  regulator: axp20x: add support for the AXP318W

 .../bindings/mfd/x-powers,axp152.yaml         |  18 ++
 drivers/mfd/axp20x-i2c.c                      |   2 +
 drivers/mfd/axp20x.c                          |  84 +++++++++
 drivers/regulator/axp20x-regulator.c          | 159 ++++++++++++++++++
 include/linux/mfd/axp20x.h                    | 127 ++++++++++++++
 5 files changed, 390 insertions(+)

-- 
2.46.3

