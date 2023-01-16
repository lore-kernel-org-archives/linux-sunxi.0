Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4373723A8
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 14:25:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7FB8C14;
	Mon, 16 Jan 2023 06:26:06 -0800 (PST)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 086C23F67D;
	Mon, 16 Jan 2023 06:25:22 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Mark Brown <broonie@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Martin Botka <martin.botka@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	martin.botka1@gmail.com,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] regulator: Add X-Powers AXP313a PMIC support
Date: Mon, 16 Jan 2023 14:24:58 +0000
Message-Id: <20230116142501.767142-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the X-Powers AXP313a PMIC, which is
often bundled with Allwinner H616 or H313 SoCs.
I have taken over from Martin at least for this revision, as he is busy
at the moment.

Up to v5 this was speaking of the AXP1530, which seems to be some internal
name. The chips we have seen in the wild are all labeled AXP313a, so we
go with this name here, from now on. This is supported by the fact that
there is an AXP313a datasheet, but none for the AXP1530.

Patch 1 is the binding documentation (just the new compatible string),
patch 2 adds the MFD bits (mostly describing the extent of the regmap),
while patch 3 describes the actual AXP313a register definitions.
Since this ties neatly into the existing AXP and generic regulator
framework, the patches are indeed only structure definitions, there is no
new code.

For now I papered over this "fixed customizable" RTC-LDO regulator in the
same way this was done before for other PMICs (AXP803, for instance), I
think we can fix this properly with a follow-up patch, for all instances.

Please have a look!

Cheers,
Andre

Changelog:
v5 .. v6:
- change name from AXP1530 to AXP313a
- extend commit messages
- drop AXP*_FREQUENCY register (not used anyway)
- better vertically align struct definitions
- rename IRQs to match names used for other PMICs
- add RTC_LDO regulator
- use decimal numbers for selector ranges
- use macro definitions to name some values
- force DC/DC switching frequency to be fixed at 3 MHz
- change LDO source supply to VIN1 (as per datasheet)

v4 .. v5:
- Use alphabetical ordering in mfd
- Correct { placement line
- Replace spaces with tabs in 1 struct

v3 .. v4:
- Fix indentation

v2 .. v3:
- Move AXP1530 dt-binding to alphabetical order

v1 .. v2:
- Remove RSB support.
- Drop .id = 0
- Add dt-binding for the AXP1530


Martin Botka (3):
  dt-bindings: mfd: x-powers,axp152: Document the AXP313a variant
  mfd: axp20x: Add suppport for AXP313a PMIC
  regulator: axp20x: Add support for AXP313a variant

 .../bindings/mfd/x-powers,axp152.yaml         |  1 +
 drivers/mfd/axp20x-i2c.c                      |  2 +
 drivers/mfd/axp20x.c                          | 61 +++++++++++++++++++
 drivers/regulator/axp20x-regulator.c          | 60 ++++++++++++++++++
 include/linux/mfd/axp20x.h                    | 32 ++++++++++
 5 files changed, 156 insertions(+)

-- 
2.25.1

