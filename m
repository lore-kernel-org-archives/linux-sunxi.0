Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A03932B115
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311356; cv=none; b=m6ICsRMnXCol6jurhzf86R0g/mSOMrEwNfTw5zrdhbG4Lxerax0tcWnIAPeAKSXnceDzFyYiWEp1p3Jjl2nvZ2ekA288PygkdgnJNj2hWEALLtQtEuJ2v3MiO+asUQcPhxBnKFvn5atPvIa8Z4KPhVy4NHFmWXlm1ePS/9rbR34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311356; c=relaxed/simple;
	bh=X50q29zW18mDiJilwD4ZnVc1TBJYKHZ54bN7CfyWkJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qA/KX7z+ch7vwUw2I5QHcUlIJ259es/a0/R7qILAfsCLu54s2mZSXoBFTq8B+nQ1XIBdDyJZx5YFvjHmNjCWV4F4YSe814uCwgYoFpbXvUZ9DS1YqSwS4KJFNZzoWjdUupd8VwILGSxYhJ3hr8dWrSloe1kEeKuwjD3pbiv1u8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5rJcrim; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5rJcrim"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so1910249b3a.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311353; x=1789916153; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLxxag6YaoEYXvuMdxlM7z9b6lVW4mPCbnkS4JP7U90=;
        b=S5rJcrimL097S1t1ShBCXkvcmk9dulcS3yHpw19GSK/hQaAuSxu1rU2W2N+05psxR2
         1+AaPpLCgKC5x3AGRl3aQVN+238MumFN1nioebgijle52fGPU5Sm3/yKqCojKuvcxszw
         LMozlg6FPX3j4ndHL/GcN4mNvEltkQSUqo/GdrjbWBKUumwC1I9Vz/j2KxtcBZhZSx8o
         xFX89bRb3lruVCcnYY1dVVXsFoyU3hUOWbsHs/AgMxeRzR9spPOApVZkfz916s2yiVWC
         9x/zogwnUTtUHXXQTPiQ3m1/DWhdCCEbmXYmPgLwqff7shMGfAODElbLKdU7xOFU4IZC
         apuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311353; x=1789916153;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLxxag6YaoEYXvuMdxlM7z9b6lVW4mPCbnkS4JP7U90=;
        b=A870vzGIUNGDneLHoFFYdeiyls2Le8/SOMmxFPrzD+tseIivh90xEvOY/+bVsoWOcH
         A7OLnnxsU4mStpPe85vHl+5en+hjVxYQp2DLnd6j1p92BQdAX7NW6c48J8Zn2SMNM9vs
         6QRuPadN5athjTeH0T3G7mFrqZCGHxWHqCueymnDDtCq57x7TIdDFS5fwHi70LhBCtH2
         R/D7SdAQXBfM+y0SSTcZXp2X7gM2sJuajajnA8jXA59oxyWPumI/3mR0myuRvoGV9oJu
         3kzZjOX4wxbdWLJkB40cu9U4f0o+a1wl5oscFUWENrCUD2z2SCs5m5racRGlUAEwdZui
         +L1w==
X-Forwarded-Encrypted: i=1; AKwUvBx50oXHC0uNlsYPCBqN8+NVMSw7eXrsv2Re2KkE+uFdodSNzjOJvRcygumwDUTUKEiV2A1ITkZEUzu4jQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lr66EMIZV0qrVNx1XF4eAdckahexOMSkBheh5ucgy2HJXaEIKN
	QQg2+1aM8qUuSUdCV3zmZSDAGfcQjtP6gXXaRXE4QvECL0vmvrZ7CwBM
X-Gm-Gg: AYBFou23jQRqoy8tbZg4oMwaQmXzzwYNjV2ajZIcShxhAi9Dsvxxmq76EPwWB9am/fO
	h3iqTeYBoTS6uLPOdA8JH1WLBsD/l8eeetfKEhv4HjeyrAv9pQ/t6eBZac6lsoruFP22DBS0jQr
	H68eQzjgIfSMCt60j2wmcucTQmTA3g9tTmVp6TK8zxp0VKhEfpSOTj4ze+jZd1kyTw7hm83GgYf
	qylABJC37VjUFuheJfONAG3pnU1yzArTcXVKNQ+2HbCtOmIOO6xs+oWoLQc1idMiBwEF6/blbqG
	fROHXS1vrLIJhQUkvqBBc2/yDfZqt6Bl9IpcAIqQ4AGF/VAmlMajWLXMdixD1cxWt9uzK6URxZf
	PowOJv423FCyiduf8qbikXx4kU9NPZiakuDZ40DNz0m5lQhCkI1VaSbtVFQKEsyCwsbduk3ZzXA
	sYFJn3HslhbctcBCduWw3wBvENxj18aY8IOaQWwoks/LZx9YXVPpiAF48b15Pf6X5Z
X-Received: by 2002:a05:6a21:6f88:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3daed33102emr23944156637.13.1789311353349;
        Sun, 13 Sep 2026 07:55:53 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:55:52 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 0/5] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Sun, 13 Sep 2026 22:55:22 +0800
Message-ID: <20260913145527.18148-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Based on 7.3-rc2.

Changes v6~v5:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - removed the redundant clocks constraint for the A523 controllers
 - simplified the else branch to maxItems: 1
 - dropped the extra example node

2) thermal/drivers/sun8i: replace devm_reset_control_get to...
 - no changes

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - skip calibration instead of passing a NULL pointer to the calibration
   callback when no calibration cell is found

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - THS1 has four sensors; added the ths1_3 (NPU) calibration data
 - renamed the scale/offset constants to match the BSP naming
 - check caldata[1] instead of caldata[0] for the factory temperature
 - use SCALE_BELOW as the calibration divisor, as in the BSP
 - documented that the BSP CAL_COM(5000) is applied through ft_deviation
 - updated the commit description

5) arm64: dts: allwinner: sun55i: add thermal sensors
 - put nvmem-cell-names on a single line
 - dropped unused trip labels, kept the ones referenced by the cooling maps
 - renamed the "gpu-trips" container to "trips"
 - added the npu-thermal zone for the fourth THS1 sensor

Changes v5~v4:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added empty line between what and context
 - clarified description
 - added missing period

2) thermal/drivers/sun8i: replace devm_reset_control_get to...
 - updated Reviewed-by tag

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - removed dead IS_ERR(caldata) check
 - replaced NULL/IS_ERR check with IS_ERR_OR_NULL()

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - clarified description
 - added Reviewed-by tag

5) arm64: dts: allwinner: sun55i: add thermal sensors
 - fixed patch subject prefix
 - clarified description
 - sorted thermal-sensor nodes by base address
 - added empty lines between trip nodes (DT coding style)

v4 https://lore.kernel.org/linux-sunxi/20260504050245.646078-1-iuncuim@gmail.com/
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
  thermal/drivers/sun8i: replace devm_reset_control_get to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: sun55i: add thermal sensors

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  34 ++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 172 +++++++++++++
 drivers/thermal/sun8i_thermal.c               | 242 +++++++++++++++---
 3 files changed, 403 insertions(+), 45 deletions(-)

-- 
2.55.0

