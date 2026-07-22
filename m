Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040C3DAABD
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 20:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752441; cv=none; b=LpDiVB2/sfXaTVkP805C2gdiQhnB0ZFjTc5VPJUQMoAXNOG8ANOXzPvO/fnhQ7UkiNc7+Fzn/zsdvOqcjh12SI7v3PJPEvBoVCXzowHKKmr2FUWNLraXjPhcFOdZtce7bDho+yLWRQHPMrWh0MKNieBaaCLfP9N/S65H4eKAPOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752441; c=relaxed/simple;
	bh=jmoCVhQ8DzIGiKmzKU0sXQH0a1YiKOKD1szhVoiS8N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gMgfaucv0afTCNoS+GLdQaIBMGf5XUn5dBrJeBArVZ8Fd/IBpYWf7S/+S2/u84yocwrzq69xUIj3C2K5qcQSzvxcb/uM/e039SYyYmHJ99fb6WTX/BnBSntzZsvrdcABtikG9c9u/7z6iXG/08koOCPJDqJKlWSeToFMe1FOx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAwI+RN3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAwI+RN3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso29290445e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752438; x=1785357238; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPNYOvoeyuyNbMmH40+o4vpJO4lwHxLJGrBhXaLvXKU=;
        b=CAwI+RN37Q1LdQjwnI6p0AZnY49CSG6UQMn24FRtezTl0yxfcLDUkhuzgzV93p95zZ
         JFWLT0XCXcMcHnbYf1JEvpkAMXuk7uawks/2iMpkbvxLslFSmM0aXZn1DspQaT7LUhj3
         RMdYjVeXE5mCK0Mxj3zrampFpzNT0xHfBhFY67pw0ydpBnwkYfoJAZtREDdoMvAhPbyD
         uMWL0ISKldLx1QxnWItAtdYc4eBBzmjDgdweq0I0stk69vrRBZhSgjldyvFAdcN9z95G
         uIu9E03hOgarYwhZUKkLkADjWqs3/xvggqweJ1+hsVdeOM7qt91WLzBy3ASEoGq73sNf
         3TKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752438; x=1785357238;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPNYOvoeyuyNbMmH40+o4vpJO4lwHxLJGrBhXaLvXKU=;
        b=RM8qTEFaRYK8RfMoDIinMWo2kywJFtMAknHifJ8bbVr4FvGWjbVo8VyV9djos/iLC+
         LtGsPQm1CDL8UPj2sMFP6HUoohE3HyoQWWSbDfZFyxkIvKqpCMaS6RDLwDtirGp+Oo4o
         bBPQHo1RmwcDPRdChb34IXNdVMfJgvWD90BnmK0P2O3danPcVjDC/REZdGTDlzan9SnI
         YIPQskWgal2h0XIePqNq+jD8ac3NN7Zr5yRrBSTr/LD7wMkGTdYVF7lDGj5zoY+2yjyQ
         +HHKmtUCiT89rv4SqsEqwDRQadg3FdR7hiHtg4Af/LeaEIpFJ6FL6u5ey0wHoRXqkjet
         BscQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9mFCqrP2T9kVGR5YjFANgdNHClrmUZYUyJA9xWBL4ked/WGNvFEQMDLdnrtp+PHusG9DRR5nI3ngvAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWLhpuNuLcv5GmpOgVogAZziJWEG9Wur8lEh0Ko981mzAUV8jy
	/6dSDrq6Py5EkiWZZohm2mIO1xJr6kx1IUuZosR8smQlcSDaRWEXuST3
X-Gm-Gg: AR+sD11HsqrBI020sNhV2FOOUFfssDi1Ho4pRJIDjNC+1q+5/FAKS1PAAlw9j8x1rMJ
	Ul4/OVdO0gyiMo6Q4aaR3TVSUph+53d9Mibmb2KdvUQmAXSvaRPA4mG/cc5HrZcIRpNovIszw2d
	gpPZo6yN2WRhS939sfuLwvKIAO/EwuouQtJ4xz0a37jbNul2qrCu4d3+ZK+CJgwcW2cE6Spgy/H
	ATaF+dt/GU3SiXrm9aPIVvckgjj+MkQGKzIhkLR/WAFLhMSVzo5reE0jq7JZoe883GlZb6kex4O
	yCcFSh4h6vBiUOYi5siClbUjcCr3lHntqKbJbxg25rX1InIgPiRSYnrF8J6mIvwiie+ptRy+tW+
	1YbZWxqc5FpgV2l5HTpPztbN5j6Knt3eCXqbk2pI2jmn/46UQqEvJFXWHw8y2jHHdi6gt00mMx9
	gT6FvF0GORHSqF8NVm+r4PDGz3
X-Received: by 2002:a05:600c:c4a2:b0:495:4e17:cad5 with SMTP id 5b1f17b1804b1-49573ce96aemr2250455e9.26.1784752437615;
        Wed, 22 Jul 2026 13:33:57 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab2f0a2sm63134945e9.1.2026.07.22.13.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:33:57 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	FuginInsanE <FuginInsanE@googlemail.com>
Subject: [PATCH 0/3] thermal/drivers/sun8i: Add support for the Allwinner A80 thermal sensor
Date: Wed, 22 Jul 2026 22:33:38 +0200
Message-ID: <20260722203341.2917852-1-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: FuginInsanE <FuginInsanE@googlemail.com>

This series adds support for the thermal sensor of the Allwinner A80
(sun9i), the last SoC of the family with an in-tree DT but no THS
support.

The A80 THS is an early relative of the A83T/H3-era sensor generation:
same register semantics, but the block, bus gate, module clock and
reset line are shared with the GPADC, the THS registers start at
offset 0x40, and there are four sensors (big cluster, DRAM, GPU,
little cluster).

Philipp Rossak posted a driver for this hardware back in 2018 as part
of a larger THS rework which never landed for the A80; Armbian has
been carrying his DT patches ever since. This series takes the
mainline sun8i_thermal driver as the base instead: patch 2 adds a
chip description derived from the vendor BSP (register init values,
protection thresholds and the temperature formula), and patch 3
revives Philipp's DT patch with a fixed interrupt number (SPI 115 as
in the vendor BSP - verified on hardware, the original SPI 31 never
fires) and critical trip points.

Two A80 particularities are worth calling out: the data-ready
interrupt fires at the conversion rate on this SoC, so it stays
disabled and the sensors are polled, with the interrupt line serving
the alarm/shutdown events only (as in the vendor BSP). And the A80
SID is not yet supported by the sunxi nvmem driver, so calibration
data is unavailable for now and the driver falls back to defaults,
which produce plausible values on real hardware.

Tested on a Cubietech Cubieboard4: all four zones report
load-reactive temperatures (idle ~40 degC, ~54 degC under sustained
full load) tracking the BSP formula across the range we could
provoke.

Philipp Rossak (1):
  ARM: dts: sun9i-a80: Add thermal sensor and thermal zones

Sören Hantel (2):
  dt-bindings: thermal: sun8i: Add binding for the A80 THS controller
  thermal/drivers/sun8i: Add support for the A80 THS

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  1 +
 arch/arm/boot/dts/allwinner/sun9i-a80.dtsi    | 68 ++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 93 ++++++++++++++++++-
 3 files changed, 161 insertions(+), 1 deletion(-)

-- 
2.43.0

