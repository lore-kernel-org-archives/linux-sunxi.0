Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA864BA1D8
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 20:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232073; cv=none; b=HYDnriNREmTqkae8mYpDM6CqnCF+AhHa3c2wodLRT9S3Y07MnomML6Q+ZeOotTbGkWdDudKyjOmzQ6YVMf/wvikuN5F/YgvdSLrjWwNtCr/4X4Gq1khv9wbz1llFjlEdoPMjF4BnNWX7/YG3HZyaquxR2nAI9wzJQCm9OousImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232073; c=relaxed/simple;
	bh=vyjTkoj7j9nxAAMFzNtiZqtsGSfD+2Kyb3Sj1miR6HU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EZNlM05u1iSl/JO6O0qyuOkTNstk3joKWjXTca4MM1ycrtB5/DT8pf6fPxw0YapeFWu+TG8LprBoFCtxT8OENm+BdJn5sZ4hlM2qgHVEPLq1Q+JCXgNi0K/6UZQsxrX3KCb8MNM3M76PhxmhzMwNmYc+k69X9LtrDMq5UJUeQbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbLN4iTy; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbLN4iTy"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e1b09e0c7so327668466b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 13:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232063; x=1791836863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7axOho0K/uDLrMIbHkmVZuTbDKVS4ybpfgzmkJPTMs=;
        b=BbLN4iTyRV+9MJsmIjMh4iTeJSQ/9aeG6DFJBurPyF8G8gUoOLg/oHAjVFKGXnbNo3
         OfVaeTxIX3XK48rebZghwjtb50iWeCV1fAt93IYkh0ywPBPQ9+vlTwxcFLKc5fZmT0KJ
         VkHZOL5yNoMLxS0CEVEehnIJOMvpDBWmrRPR9ELuZMBuugGYcxFExn8kISPIimlRAyCF
         FO169yaKAXqkqXLv/sdiEx7gRtHNhKgnpjD5QJf/lbXZguPZPbKIg1Ci0ehCcukCR5uW
         rNnTz/LEZaiOzWvrZZHa2WLgYIEgyXFBN90tTrwYyA4WrbNL+6seE6DrBDPbRiSirETZ
         DuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232063; x=1791836863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7axOho0K/uDLrMIbHkmVZuTbDKVS4ybpfgzmkJPTMs=;
        b=nWKTxWWp8RHYbXs4DficHOeVqB6clxLshYYqHyszvegTvR8q0zOvRSsnbeONT6VJn2
         +9g0vECY1mgoXGLRGKQw+DFbArpg53ZN4WJ0g9FLD3cBNIWYGsmvyfWdhvLZNIe7bazh
         oNHIToi1wMQx9W13lPtfGja9KrvlXNsgLBv8X/7XnbIYco7cCwTRzYQloLFVJ6Ix0k3J
         eerrE36aJk1SgTWzd8FHkkgzYbPLjiffa17H/3+lmloEor+Yld+rzuc5M90ZAe5IgkjQ
         fxyrqQguLP7A9X8RphMQwL5WWKmPIynmlgblR3Hykg41QdHclQLNpiHLxPz1QZ1t4CpX
         zkkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPTu28ThFCWlOx/LH+/xTw7hZSjdMC6nCGB5iHqM3caPXN4f5K0HTMBP0AeR88xBPelp/LZP8PaJ7g7g==@lists.linux.dev
X-Gm-Message-State: AFuF++kG2VlrCBW29lhobUZV9EAldB4+6Zrjv+kEba7B8fzGYK+kTZ+R
	4wVBnV+yAGmovNn9UuhcuLUj7nmZmz8BjrsY95Rl0Xtd6uxqrXGKR6x9
X-Gm-Gg: AYBFou2vradXzlzzbzZBfxCl//1RpH2cVY6qtL0FS/A2Rf0nHgjRTDbHT0XNfSZzQu/
	MuMuqcrv4LVfAdpd2hJc+Zk19y+NaA4gSIZRXOSEYVT9KPxe5GTtbxdWFCVro9WIf5TDCFX0FTO
	SjquAZ2HBP0lmUCdTckcxmwG8tNHGysBWw7wwHRQuD6I6IYXtcM5kZEAkeelPFomIigjFpTfp96
	qtjXjLPOtdIohWMgRBt6J8N+6CYR6+gvGw7wxCxP6Q+Mvhk1YC4SRFKixQQEDftnCHoZoFHqd0P
	Dmgmce0Yy22fMG/8vH6N6FGgupFDTveEtVqMAu9Zv529UiV1q3dZsiIpKYtP+I7GzDhcn2zNy+v
	yO6HWGQ+1oRDTmeEsU1NWRCpNaymgcWqV1RI7jOkbMZG7U3gef9umgJM93kv5St3CkQ8Lc8Px1Z
	yu/3QumrKFii7s/row/9Ng9xhJMluuZF5NAA9hKyFH17eCTzgVc7Ina8UB0llfLR9VRVb6i9Mjp
	d2BclC8alPeJn6A/NeHVPj9uTV8HRYV597ehly2EaQ=
X-Received: by 2002:a17:907:6e94:b0:c29:8d4:7c03 with SMTP id a640c23a62f3a-c2e4af4330amr1014256666b.26.1791232062936;
        Mon, 05 Oct 2026 13:27:42 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:27:42 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 00/11] ARM: sunxi: add Allwinner B288 and the PocketBook Verse
Date: Mon,  5 Oct 2026 21:27:20 +0100
Message-ID: <20261005202731.153971-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This series adds the CCU and pin controller drivers, the RTC,
I2C, NMI and watchdog compatibles, the SoC .dtsi, and one board: the
PocketBook Verse (PB629), a 6" reader.

The B288 is closest to the A64: most of its PLLs are bit-identical.
The clock and pin descriptions come from Allwinner's BSP, cross-checked
against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.

The pin controller relies on "pinctrl: sunxi: dt: number the IRQ banks
from the first one that has IRQs" for correct PIO interrupt mapping.

Changes since v2:
  - Drop the MMC binding patch, applied by Ulf.
  - Rebase onto sunxi/for-next.
  - Constrain the RTC clock outputs and pinctrl interrupts in the
    bindings (Sashiko).
  - Add a B288 watchdog compatible (Andre).
  - DTS: drop the memory node, the arch timer workaround and the
    sunxi.c entry; add disable-wp and the eMMC 1.8V modes; DLDO1 no
    longer always-on; mainline pin function names (Andre).

Changes since v1:
  - Add this cover letter.
  - Drop both new bindings; add the compatibles to the existing
    allwinner,sun4i-a10-{ccu,pinctrl}.yaml instead.
  - Rewrite the pinctrl driver in the DT-provided pinmux style.

Pablo Mazzini (11):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver
  dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
  pinctrl: sunxi: add Allwinner B288 pin controller driver
  dt-bindings: rtc: sun6i-a31: add Allwinner B288
  rtc: sun6i: add Allwinner B288 compatible
  dt-bindings: i2c: mv64xxx: add Allwinner B288
  dt-bindings: interrupt-controller: add Allwinner B288 NMI
  dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
  dt-bindings: arm: sunxi: add PocketBook Verse
  ARM: dts: allwinner: add B288 and the PocketBook Verse

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  22 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   3 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   1 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 114 ++++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 290 ++++++++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 644 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c    |  49 ++
 drivers/rtc/rtc-sun6i.c                       |   1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 20 files changed, 1287 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

-- 
2.52.0

