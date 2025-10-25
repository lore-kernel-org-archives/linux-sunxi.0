Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3435B138
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Oct 2025 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761366719; cv=none; b=PgkKFt/RCWU8n05MStvZ/F3de5pisY9+u9rkbmwTXPS7KhW2C75VNjr9MqNf1Rt8n4JUN81q+2hNxavrtIoJzLB8jUld6arKKv0JDw5Nq3QdjoECP3PV30cuEkeOCtQNZ5T3BnJCuZgtej5wy7wbDqmIXdBPDx2bezkb23jRULY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761366719; c=relaxed/simple;
	bh=TyC97LahORynCpDNYYasLXMe/KE5E24maIVQwa1LxhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BsRwJGevXr3aFdMbHEfWowahHFs7axthqCNzZJme6ONirc45qO6emKTwzW8lFKbJ7ir+7hOaSjphHVVGQwnZ2rOh0tEynR3+ox+iKSgLjmarjL01gq5VQgKa7TpzZTDVYbBntJ3HNARw3eNeJIwVhqTVeBPXsklI66/8HRrdUqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6petbw/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6petbw/"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-378d65d8184so37576351fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Oct 2025 21:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366715; x=1761971515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEVFVM/l2psTi4+scJeyVhhgmazdGrNFi6gMHZXJLQg=;
        b=L6petbw/sUqKt8nt2Nu2yLd6UG4UTanTUG6Yxp3dFHM+XS8t+EFZuf9ursnvjYd7QA
         6oiPoNW2FRyjutILSLv47VnCFmjey+Cl4ydTOO7LsRAjhtZ2QVDivn1v2YSOsrRaiitb
         0zFK7v/n6akoFo6Bmm62bRqInnKBc9sEZlO4vYfZpKEEBmglhPQXz0IbvQpAWPqIrb/G
         kCz42rwQNmjaw9LT9my2+7dRB4rtGYUw23QB+GhQ3UxUL8LBPVkz84AmxjczwYIhqCr/
         UNvSgRmViXOPcUp+arx/7FnH8tPOEiO7kVm50rK5S61YWysDVXh+lX4kWDqntrkPE+DP
         iUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366715; x=1761971515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEVFVM/l2psTi4+scJeyVhhgmazdGrNFi6gMHZXJLQg=;
        b=H8r/L0Amm8AtJlHtI7+kijTD05ulGH13VjwiNSDO1GMD5asfe+bJynjQRjSkA5rOXM
         NxCykLc2sdKssSss0dqXYZyQL0dZY0LERyHOp/ck0MDqLeAG2wmHPQ2ys/ssNCwIUbge
         94pEiXOkTGs8TokT2K4sJ6tRe1Uetn2bLi+LJzwFdKHiGLMYuLoI4LNWHMEDgaEShaAY
         /dmeqFCA7oBB5IPKH9FB/bSKiePwaEt6WIbXO9SzNtrP/xE+1lUhsAIncF9o8JHvOOi0
         ceacXRQaOixgc/0rwqQMrrNs9ftrq2mEZQEeT0ACCEjaYrSncNOIQMQ0iIK42dYAFD8u
         ln5g==
X-Forwarded-Encrypted: i=1; AJvYcCUMJ53IfhT9V93erCa+zWXzIBf0jUGsAyMANe3rd0X/cTh0WQ7adkKimdkw4aorTTkE3yc4Lfd+H3Vxeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwR8M7PTEephP67JTdplxl/ALlsID8R6GBQoRpi7NzfxA1eKFG+
	8rUiGMuZJ83uHzvxMeQ2Nbp4pXrkNEiLE4/eQTxe5UwCawyXA7GcZALH
X-Gm-Gg: ASbGncsnDUnHN/1xv9rkuQa/p6KwBn6oNW27myyVi/GrEUEuakFWSPP70SInpnnytri
	reNAFLhuu9FI1k+QaORczOW1CACXXdJRnpOvoHMX2E+3AQrkV+TnueYEdsEKSi++32kuCI4pAxu
	89hlaEtgSD0ximuvaCseeVfreMJPU2Kykc4wyzYdwFJ/shWtyxOSoL7wnLYVXenK8GPl+lbNKeK
	TwqC9PIVKfb/AbUM+EgZdOhJY7UyPffeF07j8JrMONHZx4/fQRd3vytHZHYj/U+nkBYGSLSM8fx
	1AYBfYaMI8gg2w5+IVYfL6XHONr03NCVNtAp/zLb3t/jpFt0TVThudpBaXuoQod/U6n05oaU1e7
	owGgl8ncBpxtzNveZGTjt2sdfjeqq2HcagRzpMtXzWwAoucxJlhou7njAaCstWksxo+ikkttTVk
	fr
X-Google-Smtp-Source: AGHT+IFXzz4JrbCccLfkZ2ZXGDknqpjtngSJ7wok4+tdSDfFKxhBjVek1aHX+t+1GLDollUvLiPj9g==
X-Received: by 2002:a2e:bc25:0:b0:378:dd60:38c9 with SMTP id 38308e7fff4ca-378dd60520emr22966101fa.38.1761366715050;
        Fri, 24 Oct 2025 21:31:55 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:31:54 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Sat, 25 Oct 2025 12:31:23 +0800
Message-ID: <20251025043129.160454-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Based on 6.18-rc1.

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

Mikhail Kalashnikov (6):
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: add gpadc clock
  thermal/drivers/sun8i: replace devm_reset_control_get  to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  Allwinner: A523: add support for A523 THS0/1 controllers

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  56 ++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 154 ++++++++++++
 drivers/thermal/sun8i_thermal.c               | 234 +++++++++++++++---
 3 files changed, 401 insertions(+), 43 deletions(-)

-- 
2.51.0

