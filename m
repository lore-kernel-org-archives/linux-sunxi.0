Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4498E3815D8
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521863; cv=none; b=cjyvjP/0XAA3zn0hyksaZr2TvnVCzOZ9QOpjxeE7MoqMbf3jO9eUNdqMoxO+05aHmNQRzbDh86u/h6omhCDTIKFCtezaDAag1U5/J/TyILsSb+4I1sYanZ+9o0cwWcp3PWz5g7iKpFZLm5td+9p6v4iiMa8q5zGpwyyKS/y3anY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521863; c=relaxed/simple;
	bh=PUxQWVb7GawpwSubmFAbFA2TUxRXX1OHgxmy1E0FpUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/GzElurBDjYKcbDaM5qqV/qf2KgI5rq3FmjsHD8DzJ39SW4vQ4uT7Rm/GfohWT1rBn7MN3BTGr5cB7bEwKAv4Srk+gId+QOP6pNkY9RVb7ACgt3eRz5DLAnT2EMMT+irNgEezFutJeAeDE3Mj6dPdfFJNTRxk/r6LFXS2S+Qqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEb5OiYs; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEb5OiYs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1023607f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521859; x=1791126659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iq7QY59go/yg3a2RnQSLtv6/NhXKFuv9l2HYC5eUWJQ=;
        b=VEb5OiYs8ELOhVjZq2ISFRU/2CVX8nt6DdTTEwI9haXOGUoB7ZRWQBzHeNfcAChXLZ
         ClP3sHCDNVcW7bFsqYhB5qTW8sZAuCtH/UCg8E6zZFoYSXQZzpg+eF13TrV2UxMHIDKX
         SVIrcphjKJPJvR+RTwQ0w7+n5jqiS63ET884LpQSHjZpY91+aTNQl4AUlnPK0kFWLW54
         /AnMMvQl/ehtiffEZI+d3dblyiommc4ibGC4gjm36G7lQaMhwUVnfSPqqs5ghPt50wqG
         u+V+1KMYxNmK7dnlS6zOsXma7YzwvnyfaPjjUHrL6+TmcAsBu+DD1L9ESl6DJ55Uvz7j
         TyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521859; x=1791126659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iq7QY59go/yg3a2RnQSLtv6/NhXKFuv9l2HYC5eUWJQ=;
        b=0TU5iaMxPuiyfbcQa3Fio+Xwdkz/RfYHJzx29V4sz22tNuVhv3JqlvzmVWNL7gfTEd
         Ymf6MbsL0mElgGa4WZv3bPr8hZDI8SLAgeMQ1n5or3jt+z0QcIBpidedVrSSlqd6chgi
         IOtPtVoP8yu+pwqIBzzwls5Pdhy9Ul//vbwBppJvph//D2LGcLAi0I8IJ4QIGa4XewqU
         E9B/XWpngZlD/gdQ4IawiEG6VAFGNyz+ZNyvg872s0k49W/6SDBZ7YQt6nl/Jjtak9B+
         obUd+JpEXRuwCZteF7FIw5PtuhY8aBXyS0gQLRpm2KJGrtdgk7UVOsad1Q/BxKtqzhtx
         sn3A==
X-Forwarded-Encrypted: i=1; AKwUvBzLyvH1dy2DJPt2cI69WCegBYlZOzok5lcp/FfNKl3f6OFqJj6zTWOqhSVlwQ7kBG2tJMW2YIzpIuJXqw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIe0hjS3MnfbRZ288H6AnGSS9fm21djUV6BWumqUn3Z0HU9LjSE
	1Xs4QAHJCVg/jS2dGgORvlS91OCDqbEvm21ZaBtUK4Ybm/LYefTJxBoB
X-Gm-Gg: AYBFou0orubVgCyWsRz+JBQ4tm8tePGewRaEQ+N9JqR91WVPffGLV1azWsCgJE48S99
	/GQ3wf9p5v37bIA+EodKMBaZa08Nk3x3vnkUYX2fBWm51mDk9ueS/Yb6wj0IEo8BCz/vuSF1ATY
	qYLTdgQNV13qHhQ8LEHLoiebwjWNwQsP5Uvddrc2UWIrqdpNxYbHQFTRT8pUYGws8/k+84jY4vG
	dL7bcARim0S3pbC+o02jlR4H0NDpU511hWekMa5YHFzSoyBHmtNBNjyAChgoYrZPVE7puxDlTys
	49Xj4IkFLgxz+9olnLaCnfycuTHllRMSrvAuc31FM0Zw8q8Nysjxd+1wo7O18EZFTqsnJqwSMyF
	6LsaSM+RBjXo8tc6M3NExLx/EqKNw3pOfPyOJvexZqUFO0T96aLndiFrbE1c/zlcq5HbijGxhMA
	aHwlNzM5k7+taxvhZ99gwSy/qdYZtJk28Apng9Q8Eshau4S24nFZLpChNolvH7EJfxpuzkXhZxj
	hAoc0jOnLfW+T60DB/UsyvydWVcz/smwNwPONejUpw=
X-Received: by 2002:a05:6000:402a:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-4888bc1a693mr4386678f8f.39.1790521859115;
        Sun, 27 Sep 2026 08:10:59 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:10:58 -0700 (PDT)
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
	linux-mmc@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 00/11] ARM: sunxi: add Allwinner B288 and the PocketBook Verse
Date: Sun, 27 Sep 2026 16:10:05 +0100
Message-ID: <20260927151016.186493-1-pmazzini@gmail.com>
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
I2C, MMC and NMI compatibles, the SoC .dtsi, and one board: the
PocketBook Verse (PB629), a 6" reader.

The B288 is closest to the A64: most of its PLLs are bit-identical.
The clock and pin descriptions come from Allwinner's BSP, cross-checked
against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.

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
  dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
  dt-bindings: interrupt-controller: add Allwinner B288 NMI
  dt-bindings: arm: sunxi: add PocketBook Verse
  ARM: sunxi: add B288 and the PocketBook Verse board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |   2 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  23 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   2 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 122 ++++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 304 ++++++++
 arch/arm/mach-sunxi/sunxi.c                   |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 660 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c    |  53 ++
 drivers/rtc/rtc-sun6i.c                       |   1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  88 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 21 files changed, 1337 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

-- 
2.53.0

