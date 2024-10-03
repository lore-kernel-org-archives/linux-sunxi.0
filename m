Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB2C13C3C2
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Oct 2024 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954102; cv=none; b=ji1+DDxS+VoWtI1xB+RAVGC1rJicqV82G603x39bf61Dz3vh0dcpshCUmhSzm6xDaI8Vps+IbGiS5yazHPOAUi5AXWoSQhesHE3sZ/FUw99eA1w0PEF0kcdpPTrk7wB3QG62H4pov82A+jLP1AaM+1ihqENa/fyDTF0ObV0KymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954102; c=relaxed/simple;
	bh=WiaApKJByJkkbq30GzUGjXpAzo95nozGboie/erMrTg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=on+Hn70zTdFMKyyHgoquCtP9MAiWv2Jy4ctW/Rxi00c/LSQ5CsGrQ/l4FZGFpleRg5aNem8+VKeDa2BfAfOnd7xAk4n7iE5bmw4kXZFzV0IYz+qm+0KZcbXVK3Rox6roLhux6KHJKat5uDwIQj+80LzsXwjfIBSvITXia4/trC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17C08339;
	Thu,  3 Oct 2024 04:15:30 -0700 (PDT)
Received: from e110479.arm.com (unknown [10.57.55.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 602653F640;
	Thu,  3 Oct 2024 04:14:57 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Botka <martin.botka@somainline.org>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/5] regulator: add X-Powers AXP323 support
Date: Thu,  3 Oct 2024 12:14:39 +0100
Message-Id: <20241003111444.543964-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X-Powers AXP323 is a close sibling to the AXP313a PMIC, only that it
allows to dual-phase the first two DC/DC converters. This is controlled
via a new register. On the first glance that would sound like a
compatible extension, but any random AXP313a driver would not know about
the potential dual-phase nature of the second DCDC rail, so might want
to turn that off, spoiling the whole setup. So this patchset introduces
a new compatible string, without any fallbacks.

Patch 1 adds the DT binding documentation, patch 2 fixes some fragile
connection between PMIC IDs and an array. Patch 3 allows multiple AXP
chips, since the AXP323 seems to be often paired with the AXP717, and
there is some sysfs naming clash with the current code.
Patch 4 then adds the MFD bits, to introduce the new device type and that
extra register, while patch 4 eventually adds the new regulator device,
and takes care about the proper poly-phase detection.

One note: so far the poly-phased AXP PMICs had that setting already
enabled at reset time, so we just detected it and were good. However the
AXP323 on my board does not, so it requires enabling the dual-phase bit at
boot time. The BSP kernel does that in their boot0 (SPL) early boot code,
and the plan would be to do this either in U-Boot or TF-A for mainline.
But should we actually expose this in the DT, as some new property, to
give kernels a chance to set it? The rails in question power the secondary
cluster, so it's not strictly required at boot time, but it's probably too
late for the kernel anyway, given that SMP bringup is much earlier than
drivers? I would appreciate any thoughts here.

Thanks,
Andre

Andre Przywara (5):
  dt-bindings: mfd: x-powers,axp152: Document AXP323
  mfd: axp20x: ensure relationship between IDs and model names
  mfd: axp20x: Allow multiple regulators
  mfd: axp20x: Add support for AXP323
  regulator: axp20x: add support for the AXP323

 .../bindings/mfd/x-powers,axp152.yaml         |  3 +
 drivers/mfd/axp20x-i2c.c                      |  1 +
 drivers/mfd/axp20x.c                          | 58 ++++++++++++++-----
 drivers/regulator/axp20x-regulator.c          | 13 ++++-
 include/linux/mfd/axp20x.h                    |  4 +-
 5 files changed, 61 insertions(+), 18 deletions(-)

-- 
2.25.1

