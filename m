Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8E52853EE
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552480; cv=none; b=T45oXuwjBUwZI+ouRHCRcqO+QIWntRO+oUoqpXZy1vSHeugS960Rx+60R85XYMzOLUVd1L0+1yUdab0nVl5XMwKJXslvXOYiJ/o9T9m9Lt9IJ3iW3uHPn3t06QmuLm0HvxZ0rGO0xvsJ3sa42j/6tg6QAtmIavrdo330YIdowOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552480; c=relaxed/simple;
	bh=zImvd/kgd1afrH/UXH2667AxFgtQy1j88l6X4nP2wM8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gFO1XO89ulspgNleaysNCNJ7DoejIgMzlGy1FHlIW+cYl1RK1L0xBrae81yY8ogIqABjLOl3IpJD8CIvXT0cKfp5lXzObQpCGNpddKns2msvreiil9ZENpNGZXK2Ej5m4fmGyjFMnsZ8xEhzbHIdix0b9Wy0SzhisFzl9p7Mwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7kKDDfQ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7kKDDfQ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5550dca1241so5771199e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751552477; x=1752157277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=;
        b=J7kKDDfQkR7UcmgJ1zrHU8Bs8G6rsQO09tp3ty1ZNFdEDOopxzxV9CuMN+eMj9w2hD
         jWMHB+VNU6aS9gad34dVsWnmwHqwpx9p7sr6cOktyDVrc5siBxTevnJID0hUvb7C2rqV
         7BKOHJn/mEM4TfQNAb6F2XKEPILwKGR3kSi1U6rH5tBjq+j//lKF0VNzuDZy4HMnhQ8Q
         Bi31J4cHW2wY1Sh4QW21/QCCz7VZoSYVgCA9V4iKyJKR8HvcxWjN/QumD7Ewys83Gsu/
         pmqnJojoYJrjCHJmqtkxl2c1EhcjBMfK7S7t4p4fLFhIMyaq4w5WJeb+L7RVktXWWGIy
         Xoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552477; x=1752157277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=;
        b=DAbq7qM2MMUrZnxL3wPF8m5eNeO63ywyFLwejJXeaLrEkRFSFT2p6KzAd074cfNUkX
         XEBpUjO8SOUicnwvB6HWUuD4dxG+kWGxOKQGYFf7CmtVR9YiW4c0L8kYksjAzgwTgDz2
         1p94C6Hrbeutg/Gdtq0gNF6moWqzjGFACQGzFMaEiK9F2fw+P1g0RZbpyOnA0t1NMEF8
         1FV2IfvbxHXlRkHtGYDpXrtQasBEl8AjMXfkCAmVhRqkt5tYUsA5CutCwukDd1iIf3Yk
         gwDKA1nEbL+AddP2bwpl2s/QyV7fSHpbrzAclCuVC/Vjc+qjh5pa7WlYjn50ziDcbLVT
         9Hqg==
X-Forwarded-Encrypted: i=1; AJvYcCVQn7LRXGuwukCPKPv1W1xP3C2RG0yVyCTAApe89eoF8baF1E7thGOqb3aCm/hHM7v2kZzC7CtkOgUbmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5A5MoO8TiiQ9EOIR9h599D7OyCy3OLIJbXfVMwfqmQCOhVlp8
	3EIacIDBp5Rd5MZjYnxH09i2akSUBrvHLE25P1Z5QyQAYte3qnMHdl5lOTH2JJwNWBKmN/oH
X-Gm-Gg: ASbGncuhOK946c1L5tBYhEPDEuwDnbd0S3WY0Cyq97LObzwH9Z382M/GH9d0GZxu2Dz
	bOBBG6IXCPk2M+tZ/4q11QCxSOtpnrmvPaQKweQItyPm/N0g8LrLGtmcV/z6tXURvHi4su3NSIG
	E5hAFY8UMLAgTqWxZMd3wAR7/hKJ1RNqoh3SfgNN6QHxHzI8b0TEYMWCxI06t/OgVsQuQQmbtok
	yNwTjhCczL0GOL6zoQdMEe/DKA48RObSo+5pNyufCXIJ7g3/B+AFWuOzF+UonY5PFBJm8fWc6Y0
	vSHeilQ4oqa6aCF/oPfWl9hwx1oz798iYZbGuxHjltOPsDL298ajrkFnPSoQTsgqBLJJkhs=
X-Google-Smtp-Source: AGHT+IFUX1eZbzcysBzHHtBsEBGjLX6NVKG8N8wt7URL6mkGsrdwM/ImOqWq0Nxkz3QPURabSYjy1A==
X-Received: by 2002:a05:6512:2307:b0:553:2868:6355 with SMTP id 2adb3069b0e04-5562ee3f0d8mr1549077e87.18.1751552476789;
        Thu, 03 Jul 2025 07:21:16 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a861esm2483058e87.97.2025.07.03.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:21:16 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/8] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Thu,  3 Jul 2025 22:20:32 +0800
Message-ID: <20250703142040.2639742-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
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

Changes:
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

Mikhail Kalashnikov (8):
  dt-bindings: nvmem: SID: Add binding for A523 SID controller
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: add gpadc clock
  thermal/drivers/sun8i: replace devm_reset_control_get to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: A523: Add SID controller node
  arm64: dts: allwinner: A523: Add thermal sensors and zones

 .../nvmem/allwinner,sun4i-a10-sid.yaml        |   1 +
 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  49 +++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 162 ++++++++++++
 drivers/thermal/sun8i_thermal.c               | 240 ++++++++++++++----
 4 files changed, 406 insertions(+), 46 deletions(-)

-- 
2.49.0

