Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33F230FC1D
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 20:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247719; cv=none; b=LbgLKsz+CNThK3nbBE2BUsZUrR9ZX9+HIcuY7s/OmHnfZuMlX5Fe7CuOIRojMYMgZ80jTomixRhTFpZjyiMRiKUpX8dwWcGRh39Cmbr+MBYWMEBmkbS69KBZZ2FDZy+V7XTO0RXgpHTfVxoUjam3qn2EYxo0ZhZ21WX+kBG5S4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247719; c=relaxed/simple;
	bh=JO+qHD5fj0WouneCV14Ifbg+BmtRQDIQUKCwXRyHI9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdddRzb+ZargcHJ6M3JvU/7H8sRgjlzKQqdX8vOtus1Dtc/niPrDLUS9flKfvzRvx9PxFapcL5O3VtdYjx0CqV1//mbyN7XDVUh7h01mrb9rLGfrW23t6RLhnGmxrNtDx3qyYEv9caTew8TnVwIaGDna7yk64LiVgn3cisPNC/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P25mJ/Ey; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P25mJ/Ey"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b7866869so2707925e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 13:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247716; x=1782852516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQf/A4ruU9gIb5FvsawDggEwo1Hergfzti0vWW30RV8=;
        b=P25mJ/EysX25DcpwDaJtpazpLlaJi6Q28ljSkVKQ5F2kSyrZuSW8MrvgGpEswNwjdp
         FNq9dEeqpM5e2oNp++MVbUxIlDBCndj0vyOd37zwumtJCpOlJOJ4rdrAGGqFQoWSpmIi
         Ky2ktBUzGSxo95swtd3yqC5fVMflc1vKPRS4mOVnFCm+1mI3fUNlKsBodOoT+x/utvaT
         aHnPCsop/mhBqtxxmY1uAsCkq67qFjhYNcfUpKYLDJXpsTSO1gV4BGtW7EuXijM8YxX1
         px14bYni7HaK6JCVvi9vF0kSL7EE1uty30pf3IOxSVA7QaN0Up85mjYS8VidKNNsAIa6
         L9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247716; x=1782852516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQf/A4ruU9gIb5FvsawDggEwo1Hergfzti0vWW30RV8=;
        b=E4Tjh9aCfV2Un2U2/ErwsBcf2ubEI6T/2zFfwI6LskBo2EbPgmEA+/WS91QD3oZ3+C
         UmiRo3Kkw/iBqfgnrb3AwgP7wXvW+XLX83h0GhEj08bQ6qLnuBt1em/di6WpG9y04aYI
         OdSZiIyDvY7a9e9ygnd1Yd7RhFpC1hfzNwiQCpQWc7DSiD7iBKyoVcDOZhFiwWIKZYT9
         DkY+hlgoFuBdUoeE2R5HaEJE9UDaZ9aKaw/uS29Dtn0qiOsfS1hrxvYPSrWxzhgrRAlA
         vJhx7UnLAm3eZ9Hv2aoFZFiWU3lkkYiqn+eqAOCc6bEicvT98+9LOl2O2RbKUZdX5Hdh
         4hVg==
X-Forwarded-Encrypted: i=1; AFNElJ8kuJCfOULZTW/zVAGrsKe5/BhDlXRA/To4Hdm2bK8AKnzzbv97Nwm7TY+Y8fOTwxexxRHw3Df15OvBRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBMg8HEzXeG9hUBmawY+j1CeZ/w6s4X1zdQNd4hYJBYIuSLQDP
	OK1n/zindk8nXd9KY1lf4e6j2W7gwC5ANvwgwNHC+zxu9OAhECrjs1J7
X-Gm-Gg: AfdE7ckXSrNapBQA5tozL0xC1OqRYudwsn17Jw2O2b13PWd+nSRumItESrU34kXTQY9
	SFKDEQ7E6GVDHNhsvmypWunVlNCsB2rZ5FYP4F4/qtTZHWG4snEAat+cZq+T37bv7w0a+3RtpM4
	H0PoC9cXYEDY6MfCbEjzHHR+wo9xdfwh6EMfAHSBbGfubJKOTLi+Gw4Vrt9AonOzNVbtMwgrsBb
	FD8YTGx3hNkN5u3BGHzzOurIiaAAypuIPNVz6Q1BfBAzJBZZNnOfVm6lm3TOF9VyJY5dfMIHu+2
	xUMEfvcvscvxSlA8FRf8C+PMj0Fe5Ip1l2Aj7fTI+CUl45GOZSGStSqfViavJ+3TtpdF7m/L9I5
	01BInuZNe4F0k39bNyVcg7TgN7x28tElxYtkcTAnwg4Sr3fHAlWYECg/rQqwLRFvZ6Vm3PYrXaG
	Dx8/33xJD6V5y6BFuDaCUnwaPyDo0fX0fEPt9liXTqTQ==
X-Received: by 2002:a05:600c:8208:b0:492:5030:5e7b with SMTP id 5b1f17b1804b1-4925b3533bemr68648165e9.10.1782247716007;
        Tue, 23 Jun 2026 13:48:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:34 -0700 (PDT)
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
Subject: [PATCH v5 0/6] Add support for Baijie Helper A133 board
Date: Tue, 23 Jun 2026 22:48:12 +0200
Message-ID: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
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
v5:
- sun50i-a100.dtsi: reflowed "compatible" property of lradc node
- dropped "reserve RAM for ATF" patch [v4 6/7]
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
- https://lore.kernel.org/all/20260605070923.3045073-1-alexander.sverdlin@gmail.com/
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

Alexander Sverdlin (6):
  arm64: defconfig: Enable Allwinner LRADC input driver
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
  arm64: dts: allwinner: a100: Add LRADC node
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../input/allwinner,sun4i-a10-lradc-keys.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  10 +
 .../sun50i-a133-helperboard-core.dtsi         | 197 ++++++++++++++++++
 .../dts/allwinner/sun50i-a133-helperboard.dts | 148 +++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 8 files changed, 366 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts

-- 
2.54.0

