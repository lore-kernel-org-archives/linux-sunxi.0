Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6452BE033
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 21:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754077; cv=none; b=iom4Zj3MOhJ4QVdtQbFGg5rfZw905S3jHnR5WFN3aHtGcAx9OOXyNIMG4usS+u5sZuvIm8AzHpAlnNqo2vvl2i5nCmP8awIFfK2qzfgQcWEHRihkZdnPQLJUvjYWqiBoPW/l6TPTUdpmDhdlcxxdezn8Oj9CJba/diJ09fcFOI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754077; c=relaxed/simple;
	bh=t46Babqj/B+1dHlW5fmgPaxIjdyCrT3Rb/Vc6H+uGPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cd1uSuc81yljSWH82IFQVRi1h9mEvyClmiJJeNyUgvKAUk/zamNubYSijxSPSO4OkJQ/qOm8UNDP8tcRhd3ho47w8Z61DAeTNNFNwacYu2DbFa4uUW/GgqEIu3VX9QLYYIlPD9KYjset5bqYusxOmWNLGQd3/01M741LDIa+ymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOdpEJhs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOdpEJhs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47db714766aso3941006f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 14:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754074; x=1785358874; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/5F0oA5i8F/L34a9owjNm1QgCmiW32I4DyCKgmPKrs=;
        b=GOdpEJhsWDhcZEfR9EM5p1MIlFh+qjiVoLOap4PHaguWGfIhAA1Fd6It6/zQDf+qMx
         Qm9RhEy0yLdqXw/4aeIx27qzU9cel8nLFxpiwJuJRbev/CakX3Gw1F3waQq37OS8eOxB
         OsrE5f0suWO1pLrQdnJz1uo2cOz0dOP/L2MdCeEcN7ktnmxyUFwkGL30oqH9ZFueztwV
         gQ4ohNoew1dZjA0EJ0OOvUFrDCtKm3G9wLh6cnE7S5SXoU9/8F3un3m7mULVt0ttD8li
         rmRxNfqI2lf8LhSI3XyznCbQFF3mcx1Ql33a2jbsGs9g70ddK+dyU52nhmJEm97Vz6+f
         qQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754074; x=1785358874;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/5F0oA5i8F/L34a9owjNm1QgCmiW32I4DyCKgmPKrs=;
        b=K4irz04HbLkJwFaNEL0+v3emEZNQxSNN91GRITzMBTTnKdRL8XHP8SOVns5Myuif/Y
         q3Z+nqYupOvoEQioVdXV4XvOsp7JycESZ+Cvwr1JWhCSLAhDv6z3Cxx5VmwtGaaIEAwp
         rbszGUAEnc9p3OLUj4ekBAtyF2q/AG7loNOKZK05f83up8WKaWqnqhx+MB2NBDUixk3Q
         XpOsr5jv/YU+HJhYHo93M4IDZEkBDUrGaPeY+ubkGB/PUV/O4mxvxfGP1xDA9weJzEUP
         JETM+QVK55c4hNC09TtmS4vxFHBmyHwss2Z6FUdxfwbNJgJoInl2KK5R/TZlDfW84FeI
         WsZA==
X-Forwarded-Encrypted: i=1; AHgh+RqzNT8ETdrDEBqbeF+s/C5FyipykGv6Cb8aMsPSAJyA6X0+eipOISrabVm3QVGe2urUfxrpI1mLg4KJbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRnd0bXVPbJR6Pp2SlIFC0b+sAD94JT9dX/RRbj7inzXJtBYdb
	5YBBPmcwv3War0XG6OKcSYoMyxHk8jCrGWFcMdSxXDbF33AoEfCGbWNm
X-Gm-Gg: AR+sD11WoIkiWu50QNl1bJS+UclHP/sdSQuTW9Qp5L0ZNNwLIQ+Ir8FcwkbyLdh7Bmg
	hUFXMwE/DBkOiHNiqtkRz5PAlmqFOn72304J82lxW8arYqfoDSZ7S+DxDustL4NSGog4AMbedy/
	Ao5uSYP6h/MZl+yntZgsuf5pkMWl1A2O39OJD5lZwDOl9bYlNcApHVa++cK5eExe9dD9lBj9knU
	zXGIOTw2JEQiRYUTogtoe+wBExCXG5guSPJydTCvf+1t/rdise3bKM34W/R04fk4vLdUIzwzXcT
	I5HuWqhgQAoI78WxpJFqbv5CgB6qeHebw1CGFyU8jv7ULOSfnZWrm3nOKb01lIsPXO20ob2Erep
	Vh6KSNz71WwX1bQ0m2BJlUipqSwik7lSbrpCXFjPAGwqsKvXBP5WInoP/+gAunoF2uo/gc80cPB
	HjYeA/w+fFbKJRL1k4vMkea2GFs+x+/jI2aGs=
X-Received: by 2002:a05:6000:42ca:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-47f840c94dcmr5450029f8f.16.1784754074458;
        Wed, 22 Jul 2026 14:01:14 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm8610812f8f.29.2026.07.22.14.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:01:13 -0700 (PDT)
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
Subject: [PATCH v2 0/3] thermal/drivers/sun8i: Add support for the Allwinner A80 thermal sensor
Date: Wed, 22 Jul 2026 23:00:43 +0200
Message-ID: <20260722210046.2932498-1-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
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

The A80 SID is not yet supported by the sunxi nvmem driver, so
calibration data is unavailable for now and the driver falls back to
defaults, which produce plausible values on real hardware.

Tested on a Cubietech Cubieboard4: all four zones report
load-reactive temperatures (idle ~40 degC, ~54 degC under sustained
full load) tracking the BSP formula across the range we could
provoke.

Changes in v2:
- Guard the calibrate callback invocation in sun8i_ths_calibrate()
  against chips without a calibrate op (would have oopsed if a
  calibration nvmem cell were ever added for the A80)
- Do not enable the alarm interrupt: being level triggered it would
  retrigger at conversion rate for as long as an over-temperature
  condition persists; only the emergency shutdown interrupt remains
  enabled
- Note: the unconditional IRQ_HANDLED in the existing interrupt
  handler predates this series and is left untouched here

Philipp Rossak (1):
  ARM: dts: sun9i-a80: Add thermal sensor and thermal zones

Sören Hantel (2):
  dt-bindings: thermal: sun8i: Add binding for the A80 THS controller
  thermal/drivers/sun8i: Add support for the A80 THS

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  1 +
 arch/arm/boot/dts/allwinner/sun9i-a80.dtsi    | 68 +++++++++++++
 drivers/thermal/sun8i_thermal.c               | 98 ++++++++++++++++++-
 3 files changed, 166 insertions(+), 1 deletion(-)

-- 
2.43.0

