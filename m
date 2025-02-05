Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39BADF71
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Feb 2025 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759951; cv=none; b=ei50TluVnHSubJ5OBwKi1CSOb19a4noNdJ/SdLpuOOFkyjv6fb0PmvobyJVv9QktwDrqd26rsoczJGNa9G8GeOYQUwjBI3tVhYnyuY9HXrRdCOUhdgPo/shBqnDIqOkN5J4gq9BI9NpNJDsIPpK19XasYb4+W/vf/+EbwlMeGBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759951; c=relaxed/simple;
	bh=45BY3DS1djtWDIlfvJbwSMK8G513VCijeE4jgdsghbA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XcWIUxrrpbt5uzO4wc+GEWWPiJ2DHccyLc5qZowdVE9lsyu5msoYUCwEcj2S6z2UUGOCottaNMXV2I7sFUcbm32aTWTk/c/TzUWttg9/Wajnf4TY6qVCOLN0gAS2uJxcjbkd0ZjamGxV+dwfKObNjX69je1u94oJ6XpVzuJqXFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjA4sTYH; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjA4sTYH"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dcdfa7df68so862883a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Feb 2025 04:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759948; x=1739364748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYwdC6FkM1FkoHrBLoPreNjUtz/aJNsrJlKRqn3rXe4=;
        b=VjA4sTYH1nPeEggHjBl83/e+zOihcYPUjuy1p8nC8BLD1MPL/FlC/RXDMTeVLKMmFV
         /WX8ADBBFQboX+OvxooNl0XlUTU/+6b8H+MOGkRmHWp5X42nYBYvnQJ5OX7ZnLNuK4e8
         4qsFunoi7t28FLBZ4sdGT153VQ47Ir1JBhPgNOKw9I6LHCd7CdyIEBSMkdspAet/D85f
         3OO/mQEEekco0VKTuIFs6hEXH2THns6kRtq2wf5OPYjttdZ6L0jNVqBmh/H4FJfxFdIs
         lzP5fVrWWBGZnzOfPklTPTlpwoe8O69Nv5+vEHJiNFHKHfcYFLJCCHwIFfzMGpDvjDV9
         lEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759948; x=1739364748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYwdC6FkM1FkoHrBLoPreNjUtz/aJNsrJlKRqn3rXe4=;
        b=w6jicER5s+pFBxhvWnZSjSxzWowHtg7lPHK5n7/kpEucUfbH9bK12zkZukxzaghvrb
         gWGc9vC5QoZ25HrFVNHYuwKqJan5jHKhGzfStld3RMkTxQD1Qf0ql4TgPJ8oDIW4GAzt
         uoBSC0brNgh7Zc84J8OiC2UU1Jk/NuDSSRHzriKH3dyNfk3dyve5rHSESjGVlfZxkisG
         pRTFxNcFIxLmB8dETsKwwm7PIqd0954msfxS+fjUTn20apNR/bysrIVCih66+Lih7od3
         7Exxmo71eNo8Uo9B7vseU11DPeW4t+bDNETh0aHqkR709quJpHoHpf6poUvYvCEVlU8+
         1Eyw==
X-Forwarded-Encrypted: i=1; AJvYcCWTBa4S4TyB/2lwRaDxfghCGVjGh2vcADq7wFdu9TFfQ7+17C7SVbKStzHZQrDNcg/WPITpPyLCVyoIUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlkOGjqTLgSS4VKl6pwPojQ+m66tZETddyWks/+u62Z/tHX8fx
	Ciks/Xs+4ZfoNb72r51+8jubWk4SprBB6La4I6mHp+h6wsqON0SN
X-Gm-Gg: ASbGncvZu2YBFEMWLDXWNZuJU7RL1MbKv7QDkD0DtJblwz6KpRMl1hUvDXLukbC/bpD
	tRNl604aYmhyILePc92kK68JUDYmdOHs+2xCkcxsM7AThdTtEBdZEWcsZoloSYTMz4yWawKdMaO
	07Z1uoQ4MBvbg4hcatHZKIV76P85bVp5u5yTIkd9tXHZCONfftbsJl1LnB5qnHkwE8jd+i+3QV6
	9woNZ25yjIBZppc92oB0qRR7q7Z4wFx9kznBGA5Z8YtD4O1JFLJaQWkBA7lU7Y1pmRQKsFFpIVi
	HRQIwCt+SY6VjTJ3zbh+Qarnw8kQSSso4jo36aqEveYThQ==
X-Google-Smtp-Source: AGHT+IGwwnpMG9KpubRS1ckqsKV0lRhKkSXdJJkp9LazwK0ad82cff1p5Us/UKXT3VoqZffwLnJ1uw==
X-Received: by 2002:a05:6402:388c:b0:5d9:8877:895a with SMTP id 4fb4d7f45d1cf-5dcdb732cd0mr3409724a12.17.1738759947712;
        Wed, 05 Feb 2025 04:52:27 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:27 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 00/10] Support for Allwinner V853 SoC
Date: Wed,  5 Feb 2025 13:52:15 +0100
Message-Id: <20250205125225.1152849-1-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V85x is a SoC from Allwinner with video encoding targeted for the field of
IP Camera. It integrates the single CA7 core, and a T-Head E907 RISC-V mcu.
The SoC has the usual Allwinner peripherals and a Vivante NPU.
V853 is a BGA package without DRAM, V851s/V851s3 has the same die with
co-packaged 64MB/128MB DRAM (in a QFN88 package).

This patchset tries to add basical support for the V853 device family.

Changelog - v2:
 - rebased on 6.14-rc1
 - add a needed gate with key support to sunxi clk
 - rewrite the ccu-r driver
 - fix license issues
 - remove the pinctrl binding, as it has beed applied
 - rework the pinctrl driver, use the new sunxi dt based mux support. This new pinctrl
   driver depends on the new sunxi device-tree based mux support patch series [1].
 - remove the new usb phy binding, as the v853's usb phy is very close to d1/a64
 - add a board dts
 - ccu: add module description
 - ccu: fix PLL enable bits, and min multipliers
 - ccu: change PLL flags to CLK_SET_RATE_GATE
 - ccu: use SUNXI_CCU_M_HWS at peripheral PLLs
 - ccu: convert the VIDEO and CSI PLLs from nm type to nkmp according to BSP
 - ccu: cpu axi clk use pointer
 - ccu: fix comments
 - ccu: swap i2s1 and i2s0 bus clocks
 - ccu: fix indentation
 - ccu: fix RST_BUS_SPIF order
 - ccu: convert RST_RISCV_CLK_GATING from reset to gate

[1]: https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/

Andras Szemzo (10):
  clk: sunxi-ng: allow key feature in ccu reset and gate
  pinctrl: sunxi: add driver for Allwinner V853
  dt-bindings: clock: sunxi-ng: add compatibles for V853
  clk: sunxi-ng: add CCU drivers for V853
  dt-bindings: power: add V853 ppu bindings
  pmdomain: sunxi: add V853 ppu support
  dt-bindings: phy: allwinner: add v853 usb phy
  phy: allwinner: add v853 usb phy compatible
  ARM: dts: sun8i: add DTSI file for V853
  ARM: dts: sun8i: add DTS file for yuzuki-lizard V851s

 .../clock/allwinner,sun4i-a10-ccu.yaml        |    3 +
 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |    2 +
 .../power/allwinner,sun20i-d1-ppu.yaml        |    1 +
 arch/arm/boot/dts/allwinner/Makefile          |    1 +
 .../boot/dts/allwinner/sun8i-v851s-lizard.dts |  196 +++
 arch/arm/boot/dts/allwinner/sun8i-v853.dtsi   |  656 ++++++++++
 drivers/clk/sunxi-ng/Kconfig                  |   10 +
 drivers/clk/sunxi-ng/Makefile                 |    4 +
 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c       |  120 ++
 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h       |   14 +
 drivers/clk/sunxi-ng/ccu-sun8i-v853.c         | 1145 +++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v853.h         |   14 +
 drivers/clk/sunxi-ng/ccu_common.h             |    2 +
 drivers/clk/sunxi-ng/ccu_gate.c               |    6 +
 drivers/clk/sunxi-ng/ccu_gate.h               |   14 +
 drivers/clk/sunxi-ng/ccu_mux.c                |    4 +-
 drivers/clk/sunxi-ng/ccu_reset.c              |    7 +
 drivers/clk/sunxi-ng/ccu_reset.h              |    2 +-
 drivers/phy/allwinner/phy-sun4i-usb.c         |   10 +
 drivers/pinctrl/sunxi/Kconfig                 |    5 +
 drivers/pinctrl/sunxi/Makefile                |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c    |   53 +
 drivers/pmdomain/sunxi/sun20i-ppu.c           |   15 +
 .../clock/allwinner,sun8i-v853-ccu.h          |  132 ++
 .../clock/allwinner,sun8i-v853-r-ccu.h        |   16 +
 .../power/allwinner,sun8i-v853-ppu.h          |   10 +
 .../reset/allwinner,sun8i-v853-ccu.h          |   60 +
 .../reset/allwinner,sun8i-v853-r-ccu.h        |   14 +
 28 files changed, 2513 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v853.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
 create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
 create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
 create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
 create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
 create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h

-- 
2.39.5

