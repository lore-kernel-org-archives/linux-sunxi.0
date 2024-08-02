Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7756376F1
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626572; cv=none; b=Fzzne4jGN8FzWCWI7UZo0c/8/LK8R6d/G1Rr4MOsRHR6J91CrtM5QuupTcwGr6g5MrvBP5M4Q0/TSsZ/7lQjMB27zzfjuMQYkU7N9i285h8K3olSK4MDTsszNDePhgo6mvCnzp5VPvH4hx4uJoe138yQeKXEuREYDzVha7VSkCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626572; c=relaxed/simple;
	bh=gZz9yj3GXXaj16bFmuLRWhj9n3hpFccCV2NppllFAJg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qf6DY7MOtT/cFUPLc+54lmR+7xbmIP7td/mbwrm9wZ9ppjWufSutXdPkBJzu2/Qq/ENiKIYHPbc5HeCfx3r5L+DD5fc4ZTURtjjBLriW9ssNAJZxVKX9hGa3peQo1Y8X9EPPbDtWTlzSSkCfAulXLaceIwH610FPd7fvW9CCkl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR/tpx8H; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR/tpx8H"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3db23a608eeso5595737b6e.1
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626569; x=1723231369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QvMGvJoG9kOmjhl8+GRwEU8yfqrtre7GVJ2bwQWQCa4=;
        b=kR/tpx8HOvsi6pdm8CjMVpExAarGwxmI0CS/tWxSdW+0/qZkZRhl61TdgAZBwuyhRn
         911HoYytGI4etVNYpBBJLm8VqzLW2credwCEWT22nog5bXt0gvmIyLdMQB3BVhbVNDmB
         luP670YVZqAegCRJqtEhleQbJKOfyyAoPD/FGYc+jTmrTytvmlypMb8R4rWanpQ11u6m
         TNcTgCFqUep6wOC6eZZzLFUSwbt9BK2hx8qfo9FhcZzFp+HP9psRnjP7V+qpNmcXwWWV
         DQQ8DMMK2oVDoJjKteCWCmmmVWV4u0WJve/K3jyDydoaRNapzF9jhBIc3PDCiEC7MUUL
         DACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626569; x=1723231369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QvMGvJoG9kOmjhl8+GRwEU8yfqrtre7GVJ2bwQWQCa4=;
        b=uM+uUGKqfyjcXB9n4r5qpEI/VIqPJWCKKn3wGyVW6spMd5viMXgb8vElPWzN0jUJiv
         kvZGLTwKRJsRCpwdqlgPgI+iXDQnnt2Z+RvmotPSef3pic7d038YF2J+tRk8iZVnSgh+
         OGjk5Eia5koATqZYbqYR0i353ykjzfx//chVc9gZaa8+T7OU+EZP2FOp9pyyWMLe583Q
         p0N0+Vf9uPK824doRFEMjrmf+onlooReZKOZJO+O2EhxQ7hN0pBWQbBAfNmgaTOL4hRO
         pgotGk5tCyVrcwwhWxcNOUaV1dLFS/NaSK/0xVhiQAlcblZKRddGw0lIGbGkCJBDiRIW
         yfcA==
X-Gm-Message-State: AOJu0Yzv3cWGgxE4EZgd5Ozke6XHvxg1skoYKHKuS3ngBU1uPYjyKS/x
	ovNmjsGqlG34Ku7pPIusVIpOlGKvqRCaVUXULr3HC1R2XjtTXzQDwzb9cg==
X-Google-Smtp-Source: AGHT+IE97Nhw575gDhtEqYkjlJLadE6szPpld+kIQm5cznFCVLtAkB1/xcfs0mJhHPLUrFXlBjqmiw==
X-Received: by 2002:a05:6808:bc6:b0:3da:a48b:d1e6 with SMTP id 5614622812f47-3db5580a11amr6332227b6e.16.1722626569544;
        Fri, 02 Aug 2024 12:22:49 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:49 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 00/15] Add Battery and USB Supply for AXP717
Date: Fri,  2 Aug 2024 14:20:11 -0500
Message-Id: <20240802192026.446344-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for monitoring the USB charger and battery charger on the
AXP717 PMIC. This required some driver refactoring of the axp20x USB
and battery charger as the AXP717 is somewhat different but can still
benefit from some common elements.

Note that as of now the charging current now value may be incorrect as
the scale and offsets were not documented in the datasheet. I suspect
the scale is 1 and the offset is somewhere around 450mA though.

Changes from V1:
 - Refactored against mainline to remove BOOST pre-requisite.
 - Corrected commit subjects for DT bindings.
 - Split refactoring and AXP717 support into different patches.
 - Added IRQ for VBUS over voltage. There appears to be a bug
   with the VBUS fault IRQ because it is assigned IRQ num 0.
 - Corrected battery driver to report POWER_SUPPLY_PROP_VOLTAGE_MIN
   and POWER_SUPPLY_PROP_VOLTAGE_MAX instead of *_DESIGN.

Chris Morgan (15):
  iio: adc: axp20x_adc: Add adc_en1 and adc_en1 to axp_data
  power: supply: axp20x_battery: Remove design from min and max voltage
  power: supply: axp20x_battery: Make iio and battery config per device
  power: supply: axp20x_usb_power: Make VBUS and IIO config per device
  dt-bindings: power: supply: axp20x: Add input-current-limit-microamp
  power: supply: axp20x_usb_power: add input-current-limit-microamp
  dt-bindings: power: supply: axp20x-battery: Add monitored-battery
  dt-bindings: iio: adc: Add AXP717 compatible
  dt-bindings: power: supply: axp20x: Add AXP717 compatible
  dt-bindings: power: supply: axp20x: Add AXP717 compatible
  mfd: axp20x: Add ADC, BAT, and USB cells for AXP717
  iio: adc: axp20x_adc: add support for AXP717 ADC
  power: supply: axp20x_usb_power: Add support for AXP717
  power: supply: axp20x_battery: add support for AXP717
  arm64: dts: allwinner: h700: Add charger for Anbernic RG35XX

 .../bindings/iio/adc/x-powers,axp209-adc.yaml |  12 +
 .../x-powers,axp20x-battery-power-supply.yaml |   7 +
 .../x-powers,axp20x-usb-power-supply.yaml     |   6 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  21 +
 drivers/iio/adc/axp20x_adc.c                  | 182 +++++-
 drivers/mfd/axp20x.c                          |  25 +-
 drivers/power/supply/axp20x_battery.c         | 597 ++++++++++++++++--
 drivers/power/supply/axp20x_usb_power.c       | 353 ++++++++++-
 include/linux/mfd/axp20x.h                    |  27 +
 9 files changed, 1132 insertions(+), 98 deletions(-)

-- 
2.34.1

