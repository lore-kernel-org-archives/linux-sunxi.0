Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9233F39F5
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 07:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643400; cv=none; b=i6nVyFeHp+F3f/G+DN9stWCgtZ5Gwa2FmiWmLvO3mG5aMAhMqEA16ohrAyShHmyvHZXnHfrSZHy8UM4k55F86UrfReMzfCNk1Es1mBrfj3r+GEXNOGGKi14yKWdRns9LoKbYzJupKIu0s8bVf4AE0I82n8JgkdWMho2vVIDwnOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643400; c=relaxed/simple;
	bh=kPxD2xqtkEPZer9DS0+UOtR3laxKhWE3HZkrB9dL9dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pFzXQoR7/4orYbL7tZElmF1iYNuW19kDagVvnL3IzSOcBogxPdpZcb9W1deNdfmOBTSC/aSSe90Lk7yB2H9FIl/ttLmRU16TCsDixs7c4fv6thVXoItixTrIY85mY3Y3EgXWqcD29uGuRYcmDu1/kZynxCxgdOIhGnzAS4Q1rLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7sBH7bA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7sBH7bA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso12885485e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jun 2026 00:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643397; x=1781248197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wf5wsEaBEbi7V4bTOA8WpiI2FMdMe2pmDS666iTnCU=;
        b=l7sBH7bAI/kitzpypenkhc3fiO75YZVHhZ3qJgfPN5/L7SVuKFZDUWrkXY3R7o5wPY
         hJJsle0JZF5ubCF3Kdk8TAyGZcKRUNRw5wecQUvLRCULVyCezwJmpMZfsIllE0uozW55
         EGAqXKKllIlso36RifPFfX2rBRscSk1G+5d6kMhOHqWESDdQ8rbneOpav12wwjEdMlHp
         jwZRSxYHx/b6g2TPnrrHk+ldOqqcHq30epIj9BqedW6Ol6E9g6A6a7BU7akV1jZ4SgJF
         ym4tTs7STXLDwPY2zwIrN0FKZ3uNQCLVJIuOKkrUcXNiP7Myf9VXdhUuGRMLBicve/bq
         3/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643397; x=1781248197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wf5wsEaBEbi7V4bTOA8WpiI2FMdMe2pmDS666iTnCU=;
        b=Q48pV1rYKFsrQf+Psj0hUyExtVLeP7s3LDY7AHt+yETS0CgvEe2Bn7v+JQoD+HfU2C
         BpZNdPfa9hybqjEW57B9aojqIqnyRgk7cPzxkAJjJxeTvyg4DRMG2M5CE1WQWfNXbAVc
         o+SOlnekA53/1m3SAZs/KOrFqIIJ7EAg+3M+zstLh+6+TOfW+W2rVrRQbvfxrG2JKvJ2
         Ig/BeLg22dU9u76EZT3w2WN+mWxXLP/0m/AHDr7zBDqhnNcK15qtNjW/K0iHFX9Yg7ah
         yAUnn11jhprvbpRV7N64xZOjI88XUkS/oFRtsNfTzshSKgPhW3EF4E/X9CD1YsWJ2yTT
         U+oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9kG+KTzqml2B58PwUepAcT9cbidzw1lFzsaLGy6vTM7ezwRV5zR3uHGjFWSOF45U32xtFIViWqkT3ng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCZqE3fstDofNOynyrABm4Zqxg6NirtLlA/4nKbTFpx1vheYJK
	Xn1SHS3LDxa3wfhiNcf265R9igWDGFQlvqZSSWwfSJTKvVKVh2FwR0Sl
X-Gm-Gg: Acq92OHJdeQO+CFrBzjoDMRJPpFvjfsP4QQk/K5SPEqIPnj2pszmN5RQ4teduDI19S9
	ZQf8zCUEja8OOKRIUwtB2L14uLSALVfD7L8X2RF3poiCfXE5aNAYkEte6W4S7j3R2q0byy+e1t0
	5OJXhCeYJDRcAHa9zYlo5TXwmSuwS4ty0k/xfAbhplWpnJTGF0HpVC/rdQeqsrjTQXmhr4O0VEJ
	s1TauRw9VsSf1pUjw3h2BN+H0cAW/7WRk0xVb8yGGTNGt68GtgaLbtWo/PvjLaiLN7gw/GPLfUE
	pz3yGaaDOMkkWc6YS3tkPFoQ+j6a2KovttebhPHmiFkj4lvWMMxBlt1Sdf9aMjFalhiEdcpcAeu
	tlsDw+ugoLXT9TjSFudvswSIdSelGGh4//J1Bom+Tq9bDkv+z2EgBStA/JJIl/IHkzNaF3ezWqy
	Si5w0QQ1IJ88Z1zcQlyb8gKdrSA2c4V9ANd32CKt2OJjh40VlsaXC4BVorAjofcUIsPg0EgfTsE
	cdwvmZQtMSmEUNWw8aO1A==
X-Received: by 2002:a05:600c:354a:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-490c2607c39mr29819615e9.31.1780643396855;
        Fri, 05 Jun 2026 00:09:56 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:09:56 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 0/7] Add support for Baijie Helper A133 board
Date: Fri,  5 Jun 2026 09:09:14 +0200
Message-ID: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
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
v4:
- reserve RAM for ATF
- sun4i-lradc-keys: Add A100/A133 compatible
- dt-bindings: renamed "Baijie Helper A133" -> "Baijie A133 HelperBoard"
- dt-bindings: renamed "baijie,helper-a133" -> "baijie,helperboard-a133"
- dt-bindings: introduced allwinner,sun50i-a100-lradc
- reserve RAM for ATF
- renamed "sun50i-a133-baijie-helper.dtb" -> "sun50i-a133-helperboard.dtb"
- added "model" property into root of sun50i-a133-helperboard-core.dtsi
- added "cap-mmc-highspeed" and "max-frequency" into &mmc2
- added "x-powers,drive-vbus-en" and "*-supply" into &axp803
- dropped all "regulator-enable-ramp-delay" properties
- replaced &reg_dcdc3 with a "polyphased" comment
- exact DRAM voltage in &reg_dcdc5
- disabled &reg_dcdc6 to avoid "[   31.710641] dcdc6: disabling"
- added &reg_vdd5v "root" regulator
- added "disable-wp" into &mmc0
- commented &usb_otg
- assigned usb1_vbus-supply in &usbphy
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
- https://lore.kernel.org/all/20260517234134.2737320-1-alexander.sverdlin@gmail.com/
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
- https://lore.kernel.org/all/20260510201644.4143710-1-alexander.sverdlin@gmail.com/
v1:
- https://lore.kernel.org/all/20260503191842.2736130-1-alexander.sverdlin@gmail.com/

Alexander Sverdlin (7):
  arm64: defconfig: Enable Allwinner LRADC input driver
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
  arm64: dts: allwinner: a100: Add LRADC node
  arm64: dts: allwinner: a100: reserve RAM for ATF
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../input/allwinner,sun4i-a10-lradc-keys.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  25 +++
 .../sun50i-a133-helperboard-core.dtsi         | 197 ++++++++++++++++++
 .../dts/allwinner/sun50i-a133-helperboard.dts | 148 +++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 8 files changed, 381 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts

-- 
2.54.0

