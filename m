Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C22D7804
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778444212; cv=none; b=ImH4tt78KRluW3LwH4A7eq0D2bmq2JEEkAnk9yfOSl1s/VlZED77ITElxv9ZVtAvIDUfXhjIgUpUpzcX05t0tdY4DQ1av8iRMCycsIw1YqwuRWkbKh73T0ygIxkLjozF9lyIZZavt0pB6EeFmk0WATC7DoePcGeULw5fXNkxNGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778444212; c=relaxed/simple;
	bh=OlrvUpfZIqKGu1fy1Yd1seg+mcVBashr1N60V4HpbQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ua8GlnCaG2E4aScZFxoDhn8M/9LSyMo1ILJewt3E80HkVD1RYTgyfgrNejrj2naW0UWFEW7SXJtm5vCTNH/4hTZOzUld8p1JZUnnm2SWdvtoN0G8pVg5jiqmMQYA1fdi4RXECuADyGMxWGi1kyHhfUr9CObw78wrJAU42kjW97I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIlTJWxA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIlTJWxA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso21790445e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 13:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444209; x=1779049009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NI3fN7QsJncCNnXfLt8QQqn69GGnzb/da19UX/jwp8=;
        b=bIlTJWxADnzDeTMw/2l525PMTfZZnnMHBAyX2JRsvSMOEH+wWsweo4DwiPpCZx5mKs
         7GqMGvS+aajWIvn2Ke0D68vbXmQCFhLFSAmtgp5qd5bCmAZBsUAQMj/qkw19hOvzIUDc
         JzOiQWhl3ywpbPF8Sq5zGHf93SYnf/ZUsT8V/76U2yq/lCx+zgFLYlJrUhG/e5AVY1zS
         oavBOUeKaNceQymw2Fn43f4KEsVP6/8uW+MHHRv3/M3SlJpl+m5zbNR7X21puQsW8DaW
         ejpp/rDYe9l8S3YXh9ZaoW4upv5lp+6xBjlxfA4RMvV47KDLpMKWQ8PR2TRaLhtJGiZ0
         1o3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444209; x=1779049009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NI3fN7QsJncCNnXfLt8QQqn69GGnzb/da19UX/jwp8=;
        b=oZy/tr1pI456kh2gzvOJG3hFfTDgw1QIN6aLnsq8Z4OeKF5E5OZ9lQ2PH0G/73aAUL
         BbH47km5vM5LVSmS03SaqBXfRD6FvD4Fy6vaBbwOlBjlmidCNTiJYD52QBEuBMiWIHZ+
         Zfm9GAjcp7J23v+IslI8EDnF5xYYTryqotjWIE3O6QhfEJtI3vXwSFUPHV5wLg7jr/Pa
         9u9pjKZ3Fn7tILymZXixPhGNyClsTGpSrhUd+FnpTBsx5zp0MrQ1qMvKWa1Gj7A96O2A
         k86B/NufavLZqUV6uvrx2oUndpCpuqqw+/ZgNL2B20JmOvxznPTLCLNtJJWJeyumXLV3
         dUww==
X-Gm-Message-State: AOJu0Yzhhp745j6XhQ3lS/T4XQ5TnOidOFPi01gyQoaLXthuTkmFAGYw
	xZYTSKARmiBuh+1s5nsnCRClo3djCKBOIb+liIcaQxu2KJSc/ecBr/jbrjZImw==
X-Gm-Gg: Acq92OGlm1snMKUUsYMdN/QpaWIt/PesMNgE2racAHJ04WBE5bX5c7zJ4SQRFX0bHla
	9zC3V15sEmEJ/aLDKphqoUJ/kRXn0+cJ6UFrE9KJgFVDN6hbYN3GgOC9SEpKEcyUX3koRNWVzAX
	I+AXcSf+CD3FE5GHK8Qo7Y9qsjvr2FxrcitFHHY52jew/VsYslX44YH1pLPkvW/xrFKK58Yiiwa
	g5rSf8fRVKJ/wAsc2RBK1jeDB41IW2y0XPeZydxzdUjSdQOuWrI3N+eymF9kBsid9nFP47xXrXV
	E7M4dnCbCpjQeqKn+Fylpoik3ylVoTgOWc9iDq1dhvZmrrDQSqlh6Ci6M54KSewsQOxH+0wLeiw
	soQNt6eUGcE89tvDdEKSs9WK4/CB0ng8NiAzNdpnVbvvwBlEakBDC7cRJ5nfYWZbzuayDQvBKLH
	VEwJAAp+r+/SlIuHRTvuxQfQWmORq223nf28fJiIELlfHqbI3CLEiL
X-Received: by 2002:a05:600c:3507:b0:48e:635a:18d9 with SMTP id 5b1f17b1804b1-48e706b2726mr104321595e9.15.1778444209019;
        Sun, 10 May 2026 13:16:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:48 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Add support for Baijie Helper A133 board
Date: Sun, 10 May 2026 22:16:37 +0200
Message-ID: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
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
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet.

Link: https://szbaijie.com/index/product/product_detail.html?product_id=23&language=en

Changelog:
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
v1:
- https://lore.kernel.org/all/20260503191842.2736130-1-alexander.sverdlin@gmail.com/

Alexander Sverdlin (3):
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |  11 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 162 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  94 ++++++++++
 5 files changed, 270 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

-- 
2.54.0

