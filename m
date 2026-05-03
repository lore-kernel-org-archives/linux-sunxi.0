Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EA1391835
	for <linux-sunxi@lists.linux.dev>; Sun,  3 May 2026 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777835932; cv=none; b=F3dab2IFrhNXHSEBCaV0NCeF+AOAiXqpWNUkdMX9MXaS+b3xdsprSeeGPc0yzkIB+duIseOBvFYkSEz3pfdMYS2cVr3iyscVniAzQKdYfg+tZhvgM6oVGTkFeCjrxU9JVic6My2d1fcLNsJuy5tgziLw+5ZiKxwoO9z4TbgMaZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777835932; c=relaxed/simple;
	bh=X8wMLDqKz/DqODvYXvtH9vp9dZqC++Dh/8QnPTP2z7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0gRvIuusN/yjBH02Z7opJW85ch63lMV9TXYkGfms1hw/1to4qaFv9WoCU6J9G3hNrz0OwfZ8RvhkcaHcwKyrebSX4AvbIg0CBhxlCPXQEMYq1ev1aWdxk4eWLxRNfOXWOVR6910bD7HixnzgcTjZ6BMjInkYLy+j1cIV8GXg34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2yB412j; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2yB412j"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so45107855e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 03 May 2026 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835929; x=1778440729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMCDw9wXTxDgto5dOfbGsyssZJSrE9wLKmOGf2pkLYY=;
        b=b2yB412jF+u2RwzVQbFY98r5ZNfR7FTS5lfxupTm/ciT3+kV2Xb+thzp/nvfpukvRj
         vh3kF7wUfi632oVbQPeUW3vAh5uMrAljM1p8RXJ3SVlZz41Yme1C6BP34BjGU6E/9Cqj
         0PNYkfvWjBGFoNumIoPWdeksBSBXY4/sYZS8KN3RNEZ6QkYB1V/0ZECyn+uJromMp3Mm
         spWmCu270hji2RKdH32qRbCI6Bt2qnVlZHEXc2iRAPyObKL3Tu9gSD7YLzH0+b+xLxFq
         vRGlM9Y7dcK4KdV4GzfwkkN2WuJBnI+7CL5qAP8uMNeCIt6/Q1kK1JtWno6va7xgfUSe
         tWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835929; x=1778440729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMCDw9wXTxDgto5dOfbGsyssZJSrE9wLKmOGf2pkLYY=;
        b=bIagZbOmEWkvJ8YzvT10fZj083u+MiMITzPmB7X2UOer86hE5E+vwGbWcNxGNbamou
         82r63joQfyn+5TQCW2RR8UpTRvIqYiY4EIvnQhfCSZG49yT7+B9A8i3uY4zOU7b2JdCI
         8umXnkghRHRF0AqPZpORLdt+kwrjcDpoQM7dz/1elY/+gNsLdJtSZPIwux6Vw3cSABkx
         xg7oUhUu4QeTfQZ1RP2NhpG+5E6hZim931z2B07bZfQ7i2FtYvY+OQ0kCYssmdtpTKAi
         /rFAqPbK1f6H+MN3rfeqBL/2IG6Ni9+7eQijaVN3sk+q8qBFuBT/R5Um3t/NO95pPn7s
         zEGw==
X-Gm-Message-State: AOJu0YzDZEOO34ONCTXp5H6gQwwgVTY08TuCDUMqnIU0kHkhfAH6py8u
	hMuJhYyZBkL9cEeoI9kswe6w64bF9QL0SfttSFQUncaJfghNoNXsnWvLus8+jA==
X-Gm-Gg: AeBDiet91UKKhiNMVmbw32uiQuXmdXY4VRQHITwQW4kpmbDzSArqp96rpqIArgdhSF5
	vCumcFAuYIHovYfDN2jz6ylOfayKu9bITTbUoAV9iCjehLvJsCJseb2XQxR2To01NR/QnuDLRP3
	AzKQA0BnRsnEw6OR56RTLn6sQhjxvb8vd3WwBuy1cG/AWWPGCFTlZsXwNMjdrokjB77BLJ8Um/p
	LSBn+cV6H8ZzHoCVWVz6XHgl8fZ7ccMj6rEbCBg4cS25HDv5LQiYGqI9jQXnh1x+S9EMDlOschn
	fQT+yeThBHWUEh4KCsARNZUHbSKklDA7vLo6tIGgZ/GQyua/pumxxzIfsQVhT0Zg4N1rQmoeN4b
	M5/SnX0a0qcOh999I6l3NsltMNBd6bjKTtoNffbxjrG04oXQQ3RuibxCPwIu33rJpXdJfGd32Mo
	7Te4C2oFzejDXcGiqvlf53lJ9LB2MPHv08Ov5gCeyO0fvuwE7kdwNmRoIkVkEW9/g=
X-Received: by 2002:a05:600c:8906:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48a9867a7dfmr82025435e9.27.1777835929008;
        Sun, 03 May 2026 12:18:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:46 -0700 (PDT)
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
Subject: [PATCH 0/3] Add support for Baijie Helper A133 board
Date: Sun,  3 May 2026 21:18:35 +0200
Message-ID: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Alexander Sverdlin (3):
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 159 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  93 ++++++++++
 5 files changed, 260 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

-- 
2.53.0

