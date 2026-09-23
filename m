Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8638DC68
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160743; cv=none; b=RYvhGG+JGPMTUGbGPjO1pECRfVByU+TJtmXXdJ8+KyP7AwHIhBhNHHtOcy9JXVd5vRwCoqk4/srqvTw7sM8NPvtvWoSlULqXtpTwjBRLQCh7RTKu0mIrVJET7V/vVn5fhpjemMi3JFvI4QgjDmIdzIy7/Qfu0f3d4/AeWLWx5CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160743; c=relaxed/simple;
	bh=OYgwkeWjfaPzXeZYfd3LbE9wNpgo6gIQfwCz7/uINqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fcc8ohsDkH4H6kKKf7WBKUvQChMHbsQKOqoM2T4IAj5IQUlXAl/vyu76Motv6EsY/gbLAy0ZEGTBDQMinBL2ecbTj+EfdIh+RqBLgMzuS5PHrGK/5aVYI0h4MdJWJE/pJjrHQjs3QQlAKxYzRcejqHT9eil6vucQypihg9mMPIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuJb4KWP; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuJb4KWP"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso604616e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 03:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160734; x=1790765534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jd3pD5snZnHs7zfXJzo2aSY9ZvIn735yOScE5LBtrBM=;
        b=ZuJb4KWPLk4g8j7TFh0a73ivmi3y1DaQ9e5KY27bYL6f0X22nGG+qf/Y6+Pa4U4JS0
         LJ0nM8mVS8aTVvBeAWeBfUOcNdOduuJArCvbzcLJy9COGFG2wNzNCiwukpRyulRvl1M5
         fK5t68jwaX45HbkR1m8lQ4wvo17ikjzp8IV3TO3q1qWkqmrX1SgdxFhZNGlKUURTvHGs
         sUMbkOLZLKG8QsjMJpBsoXvjHpgj4N1WN4ZTruFSMK9i2VcLCHPxpjZth6NF7eBzpHZ/
         49Cnr4ukFfoaW5+NaLfwRRJGv2zL0JcpYa9G5hVYDN8WiDEf5VApHnh4w5PCCnzht2Tj
         W/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160734; x=1790765534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jd3pD5snZnHs7zfXJzo2aSY9ZvIn735yOScE5LBtrBM=;
        b=PSFBqo1zyXSRT8TZ/N0MULZMa7YENUQ18HiOMZfmWB/K8e9PYCxuKWB9dZQzOTvL63
         ZHvGIAwI+1uoLwFUU+VvioPTGaxRc28japfkUJKRJnGjuL4yaKjJtbDGHSpZJwjdJSNK
         4RHEanhtJbePNHh6jB4cXaJy8yiQBm1l5hONrpuQlK47L6RDfhuhm4WTMDcG4X5GZAok
         JtVJT8xXa3JstX22hMz6taVVnEvmzbz7N4d2mRJWN4lkkY72254QQ1JeCRneVav0LkTH
         CUbKEbFlirehBC8dFzOTSGGrGeh4KRcCEVQADJ8SEoPZ5JAfrL3Ley8PBg51S3DxsuTu
         Camw==
X-Gm-Message-State: AFuF++lvJEsf/sAveW9hW4Z6uf+qZ8e2icWTbiqaXsEeBtNf8x4+ihmf
	V+0PGnfpMtEIAbXHEyeYnJ8kqlAsFMWkKRFH7keAcmMRK0B4k++tqqoM
X-Gm-Gg: AYBFou3SEGCvSY88LvoPycthzl67tHfC9bT7Lc+ZjX1BfBUbxCqFEiwPXpQ79xqtIBD
	gfEfveoK1u1bPBjw1SM4bamZ8Z95qtPX1UAEA4M93mUfWGRrx2WfJelRl2FckplhUnREipOkBMu
	XygenjkhMCN8pqIcorTOPc2ZtC0zpY6okI172ntc3xxySIdnjz3+8EQg/EIaHb+b3VeXh/esXwS
	UVHzY7p2vTP8tNBL1MDELJT59jle2eMw4S7JsPoC3MjQfXck8Zf110GuQsuGyi7JA1C5DM4UPjo
	nD1oGma3bc17ReFaYvdrvtCeUQHWbP316KlvoxLK2c4mUhJq4J6V8LYFAABfaL8T6Z1wO/BbBcC
	qDwFYwe4ui4wWqVtiZx8CfDuhNaG8ZhRfbeqABshI7zr0vec05bRP6Y8eqISknltKyaYRbkwkeg
	geeRLXl1tOVPGrrfWdfQHN1VdRjctjsZQpHzClPbeg/A5NZw+7isBJNKK73JKgpisdZOLKElnEG
	A5pBVubbSvYeJNVIYjKFyCBWBu5RK2GL9sh9TnN
X-Received: by 2002:ac2:5696:0:b0:5b8:bc5e:b583 with SMTP id 2adb3069b0e04-5b8d89c6344mr856658e87.59.1790160733833;
        Wed, 23 Sep 2026 03:52:13 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552dafsm497428e87.7.2026.09.23.03.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:52:13 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladnwx <vladnwx@users.noreply.github.com>
Subject: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion buttons and IR
Date: Wed, 23 Sep 2026 15:52:07 +0500
Message-ID: <20260923105208.198-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladnwx <vladnwx@users.noreply.github.com>

The optional 24-pin expansion board exposes two LRADC buttons and an IR
receiver. KEY1/KEY2 are on LRADC channel 0 (measured ~1.0 V / ~1.6 V) and are
wired to KEY_1 / KEY_ENTER; the IR receiver is on the SoC ir controller (PH10).

Tested on: OrangePi Zero 2W (Allwinner H618).

Signed-off-by: Vladnwx <vladnwx@users.noreply.github.com>
---
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
@@ -189,3 +190,31 @@
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
2.45.0
