Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819D23C8C7
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 05:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777870993; cv=none; b=gf3S3VR5/vb3P+NQukKDasWFMrQQaYO/x4C9f+V7sPiQeErBks6Pu9ANVfAhpxfQWyuj3EkwYemrIlnNS6QFqgektpiSZsykwdqs1lfdQ1zOK1xODvpLex+geAUEruAKp4544MHup5M8/COSLQlL0oEoxTmxVJFUOyVSoccL7l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777870993; c=relaxed/simple;
	bh=agt5GECVqOdh9CtCVZmq7or6bJXZGyJ3eUh17LzI/BU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5Zex3DzVjCCChWpXP/jbsZS7eTEfAgLINMk08S6p0eWnbBVGRb12pGaBhQVUvGWK3i0auUR2SeD9M4Wd1L35s8U8ewN3ZzfGAIQMfZdsKCsEqiF9vgapKsSEKGECuFVpj5CWYo5y1YoTSBTX855JFkczgZ+8Ip9+zg7ydGK220=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpOSqQ1e; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpOSqQ1e"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-362e50b4641so2092186a91.0
        for <linux-sunxi@lists.linux.dev>; Sun, 03 May 2026 22:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777870991; x=1778475791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8oi2Y54Hi+TOCHwR4zL5LgXe3sseiIfUSaKMjLYxQ0=;
        b=qpOSqQ1eiImkA/dOK+XaJ7mG5XBJdtAYd07+RRm3PHlcVTp+R1R1SLyCmYxFIxZ5vT
         s/qmYF28UWQXCdK9ZATLnvvRR9lCIdwmsKnBiJIYLD7e5SJ/udNGQgJiktLF3Zjnkk0O
         /FPLVFRRD/cuv690lBfenLkavwkTRlUbJZbWIhwZbi9d3HBgHi6X+6UlJMIz0qi755tg
         Lr9MMUOwrdCFCUdZjULEjSnJpxSFkEKlkc+s4MUgKPF0Do8sUIswtZuhpoeibju4xBY6
         lhIX5eKopO95gSqypgORPYIYQnhYiitg54paZ08KejQUiQWUmu09PqbOIt1zP04OBFQL
         jW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777870991; x=1778475791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8oi2Y54Hi+TOCHwR4zL5LgXe3sseiIfUSaKMjLYxQ0=;
        b=F6MI5+4VkUPNRCgwEyjH4fYsaf3ko1Gv21BJXVfPJrxGxxnemj14P1Fg9L3iPl/Vn6
         Is4T0N+3JqKldoNcpsX/HENgypIpo8/kG6prpmP6TlnyiPNhrBSShjbPU4z7T6Mb3HT1
         6Rrb/qljswBUlbk+FtlWx71OIIAVmbauoJlWez3jGAH1vr+sjX78vUsqQ0IPOAHu+wPj
         rnpR1bciXdbFXBtlA9P3uL3fKjV9EoLM15E7Wlu4uBPF2q011nCbjBNZ+ThcgbSv03sU
         99y5wkkX26YNE4WslEy68IzxtuVIMAPGz4g1bztdpUFG3PQCoWgAzxsmRUBVGXkQu5k4
         jSYA==
X-Forwarded-Encrypted: i=1; AFNElJ/uY2XhMcwlalY9pZrWvsbGXCneHtK/uMq99I0uCQy91Ln7UaF5fS5x+R8s+Co5XNfPHpxa9LIWhqsqOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRbvU17zskQqA5u5JraqBpUbiiNK9D/Ii2WTSYLWyzcL7MTqvQ
	75dms7Cbb/xOu04wWVuzhYox5P8y4KDA8WVIClpfPjU3iFEd5gFmGMT7EF7FBktvG+UM+Q==
X-Gm-Gg: AeBDiet3WrVLdaxmgKNPUM1DbVzeCROLh+psKwSH18J9vI3mpq7SNT3msYNFHxbRthc
	oRRqIW0m1kJBFyviE3sTP7rW09rY5sjs2207Utc0dqFch89Uj2D78ULVccJsDBFux9KXJmwlGVe
	7ykE8hey2xZwLePkTRnH2Gfm67JGh0JOCx8BjMiY4YLqrK1KheflDpdar23tWB29bkLLiROr7G9
	j5lnBUe/FETBcRdohK2Dq+y+HS7B+E4EBfVdA6btriTWDciIDDGTdlzOgNmHpkke1xESEx/1NrA
	BC82MllZRTtVbnoy9l5X0iWuLofwhEswvnKiexzraKLF9geL0zyXFexwduQ6thnnMvCWYLQSma7
	F0xyqtCtd0edUz7sMs7TmsMYk9lhLfoOBHWUActC1ER05dZKym+b0qrjSAjgY5EKjP6bv6TuVbv
	DaXw==
X-Received: by 2002:a17:90b:35cf:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-3650cec0ce2mr8747896a91.20.1777870991576;
        Sun, 03 May 2026 22:03:11 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:03:11 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Mon,  4 May 2026 13:02:40 +0800
Message-ID: <20260504050245.646078-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Based on 7.1-rc1.

Changes v4~v3:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - gpadc replaced to mod clock

x) thermal/drivers/sun8i: add gpadc clock
 - removed

2) thermal/drivers/sun8i: replace devm_reset_control_get to
 - no functional changes

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - no functional changes

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - gpadc replaced to mod clock

5) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - gpadc replaced to mod clock

v3 https://lore.kernel.org/linux-sunxi/20251025043129.160454-1-iuncuim@gmail.com
Changes v3~v2:
x) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - previously accepted, therefore removed from this version

1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added changes as requested by Rob

2) thermal/drivers/sun8i: add gpadc clock
 - removed undescribed changes spaces to tabs

3) thermal/drivers/sun8i: replace devm_reset_control_get to
 - changed the commit description to the version suggested by wens
 - added reviewed-by tag

4) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added spaces in the description block before "*"

5) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - added alignment of functions in compliance with open parenthesis

x) arm64: dts: allwinner: A523: Add SID controller node
 - previously accepted, therefore removed from this version

6) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - no functional changes

Changes v2~v1:
1) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - added new patch

2) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - changed clock order
 - added additional nvmem cell with calibration data
 - added requirements for new controllers
 - added description

3) thermal/drivers/sun8i: add gpadc clock
 - removed unnecessary call to clk_prepare_enable() since
 devm_clk_get_enabled()includes this

4) thermal/drivers/sun8i: replace devm_reset_control_get to
 - original function replaced with devm_reset_control_get_shared_deasserted()
 - removed some of the repetitive code executed by 
 devm_reset_control_get_shared_deasserted()

5) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added possibility to get calibration data from two independent cells

6) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - removed magic digits
 - changed description of calibration data procedure for A523
 - changed numbers of array elements with calibration data

7) arm64: dts: allwinner: A523: Add SID controller node
 - fix typo (sun50i->sun55i)

8) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - cell with calibration data divided into two
 - added passive trips for gpu
 - added information that information obtained from BSP

v1: https://lore.kernel.org/linux-sunxi/20250411003827.782544-1-iuncuim@gmail.com

Mikhail Kalashnikov (5):
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: replace devm_reset_control_get  to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  Allwinner: A523: add support for A523 THS0/1 controllers

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  54 ++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 154 ++++++++++++
 drivers/thermal/sun8i_thermal.c               | 226 ++++++++++++++----
 3 files changed, 391 insertions(+), 43 deletions(-)

-- 
2.54.0

