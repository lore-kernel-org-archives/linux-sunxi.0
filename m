Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F0046A60B
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142213; cv=none; b=bT7bHEi011wA8Kb3z8Nhyeb0O149KRiIgwreVuIU5dzX9SREzJX9tF/nTpkw0MGzR9HbYYPypKJD0ztkngdia8zdttv2CJl0amoEAD0slQA0SNTEbvnMe7nmGyKIQ4p4ku879Y9yOMfROwunlSoxlW/d16xB+Xd8Of3b0cBfkuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142213; c=relaxed/simple;
	bh=ai9MfUDsLMrOANsUSxxVfX+O4G/JDDcBHOLTt7LkqcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ba/FM/XvzLhIPESskEnOQ3XlqQa57hmEAlyYm+Z4ewn+jS5IFmX/nuompcCt+BYgcKGTQI/arBMmJg4v4mcqYMEY4BevoDBhk0NlXblfaSE5W9JU5cLPMqbpuJ9nWkUhPi01Oj0lQKY4RGEuDVdQ5fwgTqeFRG9TSArfjRrtduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsRThJiA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsRThJiA"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1223071f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 02:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142209; x=1792747009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KTdYf650btZ39bV7YwPDv6HMsfHiIuQdDKLBGUjjZY=;
        b=AsRThJiAEsLYgvBwq/RFWiZgzQHo2VKUeJElnEkuCeOTt2FcdxhZq+uPhQlE5uuBS8
         puEQw5PrpX7YjXbGP7pehpzOJd8sD7cKHBQQJQm3KyXErlMzAcIVLDhFD1L2hvfUj8EV
         rZMz3izqBsz7TfIQ9eqJW7E1YgMBmbDnQssSdPGre1P5kx0xQ7HtrCWThnLWltpeLEV5
         P7mh3Nikb8Mc5TOdDVsnjZfC5En9m66bwxIMpwn+QCNnPb3UGZ7c9r+k8boAPCdYmuMY
         Tz5oUGagdMZ0gkTpjLyTz+8lfKiPZ0bnzRND8oY8PRAwM1N+xlfsLJMWUd4kAu/BmkVg
         +W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142209; x=1792747009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KTdYf650btZ39bV7YwPDv6HMsfHiIuQdDKLBGUjjZY=;
        b=wsfZ0bSAlxOEXBUXj+PihW7EwmQDwhHemFjowYv5W5AyCOnBafoO8lWImFCJ1GFaGV
         rezy8I+P/8UjaSJY2SF8udRHI1EJC3YNBW79nXHotcb5opWdoScDB3aRH5whAXtZM9aj
         nBocP7SMDMF+StUfviSS3m0lCVxtaca+ftKR6y5EFI2CJQYZ5SCu34cs3Mk+0gf9zJi+
         420vstwK+rD9gbhPALt1v10VX0gjQ+ASzDH6ihznjUvKnrutg1Tf2KfrCQ2jA/GWsBEu
         VOVHwBjmtgFiZasmRlRc6oYrUmv/M5m/FCoaHzAhxOsBG+WMlZQTrSpnTiRDq6jniS1C
         WA8g==
X-Forwarded-Encrypted: i=1; AKwUvBxNWPYc8WyLDkChqlyfof/lheQEKiFdqclDwvxsgXsrP7CPG0mwv45aqIg+QSduu4PgQixVe/r2VY3J2g==@lists.linux.dev
X-Gm-Message-State: AFq9FYL/ykew9YQuO/AnnmHR4Y/Oe+jCLsBwAgz5xs2bhPr/RITyjjk/
	3x1o4f7NHxwlW9C2h2HKpVegjj4OXZUmJ5E9yR5kR8jSPJEFEW6MJzI+
X-Gm-Gg: AYBFou0BQCnl79aKhguN2TPeZQOd+afBmFbGHj7+q0GDldZEBcnxoqX1Vv+kwS9+nVg
	lD+q6jjVUkPZ3T5r2g2xcT0WnP0Xh6n3QXX6oqvPIULaXmvmv8Eh3UkZS7tRU8dAuSYXHogDAw7
	eq14wgTFdpk+7+hq8QjE2e0AFDu2db1o0FRicm31K3aSa24cLGu2WRvkde5F2fXd+EOijiTRCyf
	uEYn7I5jU4gRABs95p3b6GUXX6yaMs+wecT1JfmWg+nse9btMt5Aqp9g7GyB2SbyE1DRVI17wDw
	goQe0U5FOR/fi8g4BKnZstAij2IMc508WFDPiWTdoMwhbOPoLmFj4FDm6B/yUl7zpaY1MsSmGWc
	nfhJDa6fT8NSNjL4u/uMyZxNL1OLa664kE07zCx272Gmabma7EzB4jUrNsB3gbFwRxUq/TXAA6y
	4RcaMZ34qocPMn5lzkFESO0FRv5ngl6BD9NsvYRzF5MmkV72RMNQHQa3F/1u8=
X-Received: by 2002:adf:e014:0:20b0:48a:eeb7:5e5c with SMTP id ffacd0b85a97d-48ddf064b52mr19497686f8f.32.1792142208964;
        Fri, 16 Oct 2026 02:16:48 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:7d8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm3692331f8f.29.2026.10.16.02.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:16:43 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/7] sunxi: add the Allwinner B288 and the PocketBook Verse
Date: Fri, 16 Oct 2026 10:16:01 +0100
Message-ID: <20261016091608.121842-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This series adds SPL and U-Boot support for it, and one board:
the PocketBook Verse (PB629).

The DT is still under review for Linux. Until it reaches
dts/upstream, the last patch carries a copy in arch/arm/dts.

Tested on a PB629.

Pablo Mazzini (7):
  sunxi: add support for the Allwinner B288
  sunxi: dram: support the Allwinner B288
  dt-bindings: clock: add the Allwinner B288 CCU
  clk: sunxi: add the Allwinner B288 gates and resets
  pinctrl: sunxi: add the Allwinner B288 PIO
  mmc: sunxi: B288 mmc0/mmc1 run off PLL_PERIPH0 2x
  sunxi: add the PocketBook Verse

 arch/arm/cpu/armv7/sunxi/psci.c              |   9 +-
 arch/arm/dts/Makefile                        |   2 +
 arch/arm/dts/sun8i-b288-pocketbook-verse.dts | 114 ++++++++
 arch/arm/dts/sun8i-b288.dtsi                 | 292 +++++++++++++++++++
 arch/arm/include/asm/arch-sunxi/cpu.h        |   1 +
 arch/arm/include/asm/arch-sunxi/cpu_sun4i.h  |  16 +-
 arch/arm/mach-sunxi/Kconfig                  |  14 +
 arch/arm/mach-sunxi/board.c                  |   4 +
 arch/arm/mach-sunxi/clock_sun6i.c            |   1 +
 arch/arm/mach-sunxi/cpu_info.c               |   2 +
 arch/arm/mach-sunxi/dram_sunxi_dw.c          |  97 +++++-
 board/sunxi/MAINTAINERS                      |   6 +
 configs/pocketbook_verse_defconfig           |  10 +
 drivers/clk/sunxi/Kconfig                    |   7 +
 drivers/clk/sunxi/Makefile                   |   1 +
 drivers/clk/sunxi/clk_b288.c                 | 101 +++++++
 drivers/clk/sunxi/clk_sunxi.c                |   5 +
 drivers/mmc/sunxi_mmc.c                      |   7 +
 drivers/pinctrl/sunxi/Kconfig                |   5 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c        |  22 ++
 include/dt-bindings/clock/sun8i-b288-ccu.h   |  82 ++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h   |  45 +++
 include/sunxi_gpio.h                         |   1 +
 23 files changed, 827 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm/dts/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/dts/sun8i-b288.dtsi
 create mode 100644 configs/pocketbook_verse_defconfig
 create mode 100644 drivers/clk/sunxi/clk_b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 65a7532545336e4b73e049a69436e255da7df961
-- 
2.52.0

