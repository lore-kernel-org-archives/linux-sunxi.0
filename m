Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CD5488200
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161085; cv=none; b=sjcfrbRTtu4yIkCnwUeF91OXnYuVjMl7AeZSUY6hAshs7NsAfPjd/ozhavk+HjJy2QpRRXBGCrN6Ok5XE1CNZafBfUgtrhk466qDPGWO7TL6ZWP0W6wvdqwnmW+L7TZ9kpKXdVV7qouVEij6EiD79//yDTYBWJiemVbTyR4DA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161085; c=relaxed/simple;
	bh=f74eJB9/Nuxhr40IU0wotj41meeuQyj2wg3FsczjbNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f70UFDKd85M54N23HdxwHxd0UOMNARDK8k2YjRun1ku5P0IEF1a1BERQgSp6dyWjVQXv286YfW2HXRLiN8xI/ZiA+nciXvcw1DwcEzh7ElUT7rgMHHfAVXL4g1zdzJ3jdDvV0k5c+7LMmBYBN6O9P9vak1ceCWHw6/OvUZumWLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT+svzsm; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT+svzsm"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff00b8d8so6322281fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 03:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161076; x=1790765876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wU3cdglOMO4fNUbFU6VE7Bg9T8/+Nhjntbc1rLwcCxk=;
        b=DT+svzsm4Hx5A1MyuTjBUCy3Q1AoKT12dzepmarH0Dwl8kPMfLzJSNwC4OwZKJ8359
         jEGNk9jrTuQIuaFfSiUqoXpFHZEaA1aMGOJPole2MGvXGgJZv5ygblsQ1kWxHhbp/51d
         AfLfe0yYdzwbHkqDQhnlyJo55QpF8KJsW6Uu6MwGRn2HOo0fHxfGP6GJ70cZ+epkXml0
         yLGbAMPjUry/6N83Ygu1MwN9XjdvIa4w6E0iSPzbVDwmdVOE/UAiqkOqZzpe1GllceGw
         HDsB5wDv+E7nWGCs03pS3FVbSFulFEPdij/Hy150iLfxdx8l7C/5tinlpGBBnMi5jgbB
         V1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161076; x=1790765876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wU3cdglOMO4fNUbFU6VE7Bg9T8/+Nhjntbc1rLwcCxk=;
        b=h80ZnhFlX6cvPgSpB4WdNVuQA2szuyhbyHOnZ+042/ampd1T/aTkiTEsaQG5/Oh/GO
         lj4PfaIpEntG4/9crGMK6eE5Nr5xv8cA76eOaJB4H7bCj6zJkHDNbg5L/mPnGLgUVA15
         v0AxMzqIyPb1PJtkjCm+v13Pc75CU0qr/ZJjOQOuBaipP4fHTFkQbGeIxAhNxiPGyMYk
         /7sdGCe1Ujf9uy1WQqaux5F7h5ljt4oX+RvXfAIXs/w+DruM260qVvYfs4aGzbD9VOV6
         NgIANYWTKlOVdHSpbnRLU1pc3oKo358w31Nfz7UQ1KzA87Vuxs6iuCL39pHJ56oyaAuE
         PVKw==
X-Gm-Message-State: AFuF++nx1shNiRS3zIgjzTNpUGUKNK0N+ZtsbLsVxqAFx0k5sUAIk4xi
	Wtya2UwUgZdDr63OFl2SkrQaBlji1dO6Vb/hpUpZooiS7wvS/1xbS0Xe
X-Gm-Gg: AYBFou1DzykCISmvZRvdVTUN0LK/Z4Mcku+uu/OcMpmk3M+eU2gkRWZTejJlR/ZoENu
	eQTwm/k5aucHJLA7y8mWAMz2jYi2idiXlD0Nz3nvOOLKpHv7QrO1Y/Yaaw9PcUATlj67DbfjyC1
	31Gb8EY5uzvDvPJNclphOW28Gg7gQaV/lv6yY77IdcZnpG42w9wy0uaFgAGfhJjI0ISv80uq1K1
	qGMRArguC0BogNURioHwzkeGMzqnpGYXRYzc85LTjXpUkmzrRc9wLVio1jjVDCLgSPpbu+bL8Bb
	aF6VlDygbDnOPN4vsX5LMFz3/7xI0TeBgIIat2xALG8GG1tkjizkEHlyebn5jjNJVFytx3H5Pvu
	q1NrNKJZXtS8ie6Nt947ukJuashndIkUIMg5/r9/0t9x2m5NhooEkF15faJ+QWoby0/9dPk8Rzr
	uxd/fnFIyfOSHv7/NljqWXPO0kFqZ6EtOt3NyUmh7Sbq1d60lHvpnR/HnQ8kRyuXZGAmGbAJ9YO
	Dsf+bwh+aMG4MOu9wTwdDPKSvKSEg==
X-Received: by 2002:a2e:be9f:0:b0:3a3:368:fb9f with SMTP id 38308e7fff4ca-3a63069666bmr5961811fa.13.1790161075789;
        Wed, 23 Sep 2026 03:57:55 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm506392e87.17.2026.09.23.03.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:57:55 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir <anykey196@gmail.com>
Subject: [PATCH 2/3] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion buttons and IR
Date: Wed, 23 Sep 2026 15:57:50 +0500
Message-ID: <20260923105751.435-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The optional 24-pin expansion board exposes two LRADC buttons and an IR
receiver. KEY1/KEY2 are on LRADC channel 0 (measured ~1.0 V / ~1.6 V) and are
wired to KEY_1 / KEY_ENTER; the IR receiver is on the SoC ir controller (PH10).

Tested on: OrangePi Zero 2W (Allwinner H618).

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index ff9b40352..1b690e3cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
@@ -189,3 +190,31 @@ &usbphy {
 	usb1_vbus-supply = <&reg_vcc5v>;
 	status = "okay";
 };
+
+/*
+ * Buttons and IR receiver on the optional 24-pin expansion board.
+ * KEY1 -> KEY_1, KEY2 -> KEY_ENTER (LRADC channel 0).
+ */
+&lradc {
+	vref-supply = <&reg_vcc3v3>;
+	status = "okay";
+	wakeup-source;
+
+	button-1000 {
+		label = "KEY_1";
+		linux,code = <KEY_1>;
+		channel = <0>;
+		voltage = <1000000>;
+	};
+
+	button-1600 {
+		label = "KEY_ENTER";
+		linux,code = <KEY_ENTER>;
+		channel = <0>;
+		voltage = <1600000>;
+	};
+};
+
+&ir {
+	status = "okay";
+};
-- 
2.53.0

