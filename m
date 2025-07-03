Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2C2EFD9B
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555530; cv=none; b=Cqgpu9GM9eBMWu88T0E23MtDeKZr8Xl7kp9tQwT5UaCrJfgBUPq+Lsn7f3FnkFKOXEE03F0XbKZwdlBE5T4YGPfR1OGl3RbiKhogblcwoaAzPbIl79XYTqxAbZGo/P1+11dianON3lRQnXsRe/vJyDxTv66H/kjehrdbL2vTsQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555530; c=relaxed/simple;
	bh=zImvd/kgd1afrH/UXH2667AxFgtQy1j88l6X4nP2wM8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YI+wY2bJfn5Ll4KjOJLl+QHDRYbLagOAr1n6ASq8ayCNNGgNLKIflgzTsgoWQzqYa1vfU6c7wbc/6t7L+cNkfF2U+zDEfdSPQCDxvrEQ51TgeNs2IvMfY2tQSE3+JEvaIcxQjd3BTCsPudLoLcihr0QrlYIa5uflkNpqAAUQkgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/mqg1+w; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/mqg1+w"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553b6a349ccso50534e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555527; x=1752160327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=;
        b=B/mqg1+wgrLAgimEbiI3ttctwrtRQXcYnPq5J0QmodNK40R2FiCWfHB9lrpYeLmalI
         s3CjvHSoEuXoTFhd/oHU/2m3w4MkvBEVHu9CGalfgTwvtgg5YrefhBQnvHaRNyMztM13
         D6StCvLyzrhtf6vZ5OFOGx3MdBUY7+fOShRpYVkLYnGY2XgljyOl/O0x59xnt7yvBtsi
         VKOIiD2lcK0qB4CIeYDWQ8Yxr8yASlWgsLx37bjhzvUHI1k5xx8Zv7MCuu6H/UwQsbF0
         nSpW2If4XDBhx06xaj3hDM18uYXD6MaB8jtp8WqipOjAXTe/GbdVyl5a+5bAHWXAjtxE
         UPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555527; x=1752160327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=;
        b=ToyE5eG0n1oDLF0nbfyVMxDSUmjSHB6QJHAr5wb8LI0d95F/L3ZVwrdUnsW/4u+Sjt
         Cdl6Lm76SmWjbDFKDBBliODpN7M1PycBmIKlHCQeQ6k0eOIu4kQ3asfowCGooAFzVyAd
         aWXObQx06STXhrqcbGAoKFjGYmZjJ92kPQlizEEtSgIpGuUY7l4ZMTGspcHm5SmCVjnX
         iu3TpXBaBEenlLj2L8EkZRoP/KLu1WwP5b/YvkPG6gib2sdH2/nEWLdXSEGg5JCkjvkA
         l99V5hyDHQqBRk9LGFl8RxbTsZc+T0g22Tvc0KhTedn46kI1l15154bEyDug/m7aW/yW
         9Ubw==
X-Forwarded-Encrypted: i=1; AJvYcCUIdeRge4Sq2BzOJJSy/fCNwAVzjy/g4bKG2b3lxznNEwLtMBW5yP9mFcSyQdgy0jPu+Ufh6SD/1Di/eg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy3XFY1p0TJqiR3m3U+F/x9kEhAHIZOddxG64Qb+VfXFs9eb/9
	Uz1z984MUzculASTVd2woz1ygFCPqKo9f1iu67EGaXrRCNUve67jwqNi
X-Gm-Gg: ASbGncvdq3k3ZrWiauCsvX2Gzqh1w5MtIPZ7NRTg8Cssja0jiLohMo3vqka02GDVh6i
	n7hPB18AfpmCJlWSg8Vhx+KqMDRq0jtAuOnne6TX/RgKN/heBiM7bQ7trMamrTH1CUiNwLBy2F/
	oZHkyzclKBvaOKM8aaoAaTUjKxcPlikHff22eg0J9aelpFDhi3QTX/N+ebZMh5OSfbkw+R2+jpk
	NJv45i+/AIwBT3h/7aIudHECnkwsEN87cIoEZUNRbQitUZwDRfkD5CiWzTFXkZALWC5xcdzxhiM
	5jgNn+5wLoEjCLUFKzCnlGF8G8d/qHDrPENdXkKwblUspypKL9FobDQTbWTubvf8uW8PGIo=
X-Google-Smtp-Source: AGHT+IFObnwk1CUw/4SeBMAwtqp40i0kVp9nyZ7PpPHlgqYkcRXB6haIqde1G0SGKx5hXuFwxxb7Og==
X-Received: by 2002:a05:6512:4025:b0:553:297b:3d4e with SMTP id 2adb3069b0e04-5562efc934fmr1450440e87.52.1751555526425;
        Thu, 03 Jul 2025 08:12:06 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:12:06 -0700 (PDT)
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
Date: Thu,  3 Jul 2025 23:11:24 +0800
Message-ID: <20250703151132.2642378-1-iuncuim@gmail.com>
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

