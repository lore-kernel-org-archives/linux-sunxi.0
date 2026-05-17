Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB271A6813
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 23:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061284; cv=none; b=FQRXU57EcnR4LVucxnxyPqkaTwEVDN8jvdGnL/3yvyHHUfW9YVXZBTtBqN5U3/09BDIGAbBZhRSrvspE7n3RQhN5fsEvLAXm5pQvf5UHk0c8We0eSZEYjJTDz7dh9bHhYcTyPL7uGAuz+ffkC1bNC1PgRXx3q6DCR/hTu6Try5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061284; c=relaxed/simple;
	bh=FlwlRdiPsdotnda3euc5BVRVjmtCHnYbDG20q6ghTio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clcVXJJtE50phC8Lc1UABZXjHkNI3TflchoVuad2UjveYWvdgE9RMR0HuWXZFJNz0MBme1q3R/3Ah8E+EAJzmvkme47nrspqvwaU2n7WQH/qY3/vMNv9cAbqkWlfHSgf/Xit/qhU4qLbnZbg2kaP6PYJ0hfPj6jPZZfEs5PoMk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2NKDcPV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2NKDcPV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45297094718so1245608f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061281; x=1779666081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cV5K+hC6U/LO0fJpISy/X05UeT2K9Cbw0OM6/rSxBSo=;
        b=D2NKDcPVrkgvCLCRG4BoZAUTFgAOIKsFXLShJ0qxMdUy7IkrtOhClBP4P0Zg1RypZp
         adNiizMQvyaqPNkz4VSJvrBMoJdHKJgiSaBs2pEtiAMhTERfMLVb47oJU+A2OInvnABB
         K27MG3xpMWkVBWYFfhhiBuaf2ftfBod5CgQU50bZ+kMhzUEG7OFuNRCSVvw3H0CZYc+J
         hDLcaJKGh5zeCF+3CDdjhoAl9w/j6wOmwMcpAFIHTUYGzB2O3hIWGd0vGklc8Tr6Zi+2
         /ycWZN5o0OaC+/UUh4aa1cKUmvGLLsloBwIWtuMLdql2jR1yHFQAkjHm01HiHOEi/ln1
         Wktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061281; x=1779666081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV5K+hC6U/LO0fJpISy/X05UeT2K9Cbw0OM6/rSxBSo=;
        b=Q+MVH4S6ABJgijvO4t0YKmJBRLpnPvLrZxgDeX/keFJYcs+tsCEMIkqC78NtXn8vhF
         Ecq11j27vSiI5cZ+UqegXNtYBLDg6c3ZJfpY6HyKGbl9V3jymXk4mPQzryyCS6bWOtXr
         L6JkfTdgFosHHDG2/IufTBzsM5cYzBCBwGMQW33WKuPsmlp/uP6lt9HQQ0EyX+kML3Gf
         Db9Xj4o8MYAIwGpELlVGc2jY8RJVq4xbi2heKphRisUr5q112AJsi6eifscRS5Rmx/ug
         qmw+YckM96MEB9fFVubzSmTQKTi3It8OijWChAtmJHXD8dYc08JcydAmU98G0eqBv42O
         jE6Q==
X-Gm-Message-State: AOJu0Yy7lhFkz7y1SlaYHbcctZi8jngbhn11gY3Tj12ZeK9YCXSf7PVD
	jGxNJhhrEBcJhXx4ImoLUmNqP/xIikEpw1Jxel0axOwxmlsQ8iSVhC7IR1e9i3fP
X-Gm-Gg: Acq92OEvUP3u8oSrAXq91dumNY8IlkYU+OlmHTxwwA9/NojLRrwB7lb6SDeQcjhIjpX
	VXMbZz52TDxvTnRln0EVleH41/z/Gxuk53Yj9AL7bXL0qZ2b32nMt8PswFZCrGBxV06GP3Uh29M
	IDqnHouvDwBuUMwwehoH4y9WJmIVij/c8kTIkmo+4iUL7adRlOjp13jNib6b2/l8YyaR8BUkilp
	GyKCGdo4VvLmZsRCt5ncGSuv2ieCTXWchiLLfhATBOcrTudV6ajEkIWYQT15exYGcuClt1ysgZw
	UeHdijo/ccFzswM0qb73m9cXeRjE29N/CGJBj4jcwpNUTWYB43vo83rNDJQ1I41Cf25SdMskpOE
	SPIDVTSnWC4deTcc+Gjx6Ro/96S6czBTFvA9wFB84LNmVwywJ1xpbqv0YR1TlfBHacNjI9nbVY0
	ogzDn9mm7E0sKEDrgF8HZA2Xxy5eS6M6Kv8ft15VnXlyUkpFFFJt206pTgtXVVdtYNRR5oWX1Bh
	95mJ3WO+kI=
X-Received: by 2002:a05:6000:25c6:b0:446:189c:ac4e with SMTP id ffacd0b85a97d-45e5c59f684mr18961084f8f.34.1779061280824;
        Sun, 17 May 2026 16:41:20 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:19 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Add support for Baijie Helper A133 board
Date: Mon, 18 May 2026 01:41:26 +0200
Message-ID: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- USB-C OTG port in peripheral mode (via onboard hub)
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet, LRADC-connected buttons.

UART1 can only be used for Bluetooth module, but BT-WiFi combo Allwinner
AW869A chip has not mainline driver currently.

Link: https://szbaijie.com/index/product/product_detail.html?product_id=23&language=en

Changelog:
v3:
- added lradc node to sun50i-a100.dtsi
- enabled LRADC driver in arm64 defconfig
- added my copyrights into the newly introduced DTs
- all DT nodes sorted alphabetically
- all always-on regulators commented/propetly named
- all regulators got proper voltages (not default ranges)
- ADC-sensed buttons K1..K5 added
- re-labelled "eth_phy" -> "rgmii_phy"
- usbphy 0 switched from host into peripheral mode (downstream from an
  onboard hub)
- typo sun50i-a133-baije-core.dtsi -> sun50i-a133-baijie-core.dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
- https://lore.kernel.org/all/20260510201644.4143710-1-alexander.sverdlin@gmail.com/
v1:
- https://lore.kernel.org/all/20260503191842.2736130-1-alexander.sverdlin@gmail.com/


Alexander Sverdlin (5):
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  arm64: dts: allwinner: a100: Add LRADC node
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
  arm64: defconfig: Enable Allwinner LRADC input driver

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |   9 +
 .../allwinner/sun50i-a133-baijie-core.dtsi    | 190 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   | 133 ++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 342 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

-- 
2.54.0

