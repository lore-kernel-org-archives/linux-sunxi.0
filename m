Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39940497B80
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162417; cv=none; b=lNHvOzxns+qxjvQKxTYRc3adL6DjMbIBbkijeNJC1LP4xqOradiwOvmsBUfOwRnWulWuAr8nkA1/iuMn6AxoOi2gzw/UhMposlLtpEn5/YJ6fd6NKtvjxKu8IjLmY7/6Bjpt5jaVegShp/QcO3gh0gcy3HIgrUEr5DJqLyS6WFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162417; c=relaxed/simple;
	bh=LzFzKdYIt7KQIiyurFYnhAFiegOmNQVla4mXTg3pu0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XEvJuLUvnRXYsoD0aLcHp9zPa++pVXO7daXMXk5E+6Wwab9UiYeX/dxLFfllwrRrfRD2cYqLbEpHE7P/hVdChTk53jHpwbe/gAzi/tXd7L9IKsg0YOYMrjOAH02R6zIqUmCm2Q9zG0AJ9H44yP0iuF5hUQFR8i2ZC3gDtw32ZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwpEB2qL; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwpEB2qL"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso693960e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162413; x=1790767213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=SwpEB2qLHDRQxela5CAeuiVxGDF3m1hC9fKX+o62LRQYpHdtr/jEcoPbrm5i9FaaEA
         xbAJerbDCnzHDoZbbO/wCWzBNe3G/gqVTaHh9qemyBhEkuM/iVlZMwICPJlaSm+HPUIm
         VczW2wtklQhyooic6lR7qngJJjw98BvSxLoCpf7WhdxlX7yr6vv1ghD+e7GUJ8Fx/DK9
         LNp/1VM7uroIK68HLAnV/QtvbR3FEIcYOLmT6iHIVP7uFRIL2VtMXt9Z2RyAhuEUlFhN
         0w5+h7HZlVtPXD3mNiMSMv4jAjavtAz5vnaIDU801zv1dF1FIzZDOJWDeW4IhWUzZp+6
         /59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162413; x=1790767213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=MutfOy2WTfKpMiXq4jgRWZigryqxlVzbIpQFzznXaPsFG/kod8P8O+5VRCLQhfASVH
         rGdvZN3FzD+H0/c1jQ6ARZaa1I8IBln1B4OCAlq215MMFBLKHamcZF5XaSkD7PG6sKuj
         7dCqgqh2my2iiiAhYfgD8rNM4owDuwQhK+apTSj46CDlS7pAD6n07rHTzhdNDzzRBfpp
         5sagliJDLCkG+P4Wbs8W+QuCsZcvEpk9Q7mfES9Ld4R4Qil0DZ9WD0GYGMqruU2qhytj
         ynvec3bganBtoQfswkhqVmOzAEx9d7fKqYxs7Q6DA/7tGWrwEzKor3zHkyS3bOcXqlkg
         TwDA==
X-Gm-Message-State: AFuF++k4hUR0d6eYnlUzbYcO75dxnyrXcZvsR2nbvby2anPHKX5yYjf3
	5LPUUW2ELdbgkowyFFV9qkIbbukQw89OeRTVH8gNfK9feo3JGognlQGXeKL/+BQaH2H7lw==
X-Gm-Gg: AYBFou18JDalJLTX0W0bBba0ks2jQxNQL75qx9ZUJGsVk5qLNS1TQROLLKUr5lbD/oF
	ej9DbciOg1JOSa8Unvy1tDWyhYvhPe15MIdExNa+pgykNMLdpKS+Z0tdLbxc88hkmGh2ME0EodY
	70h/lk8qsnBJ0QhCLQ9I2hcv5v0lu5+/roVc2CeqXWpQ6Wokezs+IzfEOIPq/z2sCRCKPxk2EoD
	NAF3N+hfrFDzk4L7JinsbJy6lkF3mSdO+Ma8Jag05dBFyTQyMsdjGey5uq0yztQA68NV/MElETI
	forTFyb1r8/fm+Rp+NPQPgQ38SJvgdf0EVVfCRoX7Jg6rDweRN73rOW41q5GXWKoKtRpqcB9wpV
	YDqAxY5lFKD4X6kHcJSnbcxbxbocShFs2dA4jl7y5TPriSdiR7ZnqI1RGa6H8VHAj1r3So9NWK/
	2zrIJr1kLjKdpp5OiJWgCBjiOl6lVeNQHjazutgmBJxrR8ElvauX1mPcAzhee3AoIQw/qhlNGtQ
	uqCzqa6DvF3Wr3k4aM=
X-Received: by 2002:a05:6512:3091:b0:5b6:4ae:3ff4 with SMTP id 2adb3069b0e04-5b8d8967f46mr778397e87.28.1790162412004;
        Wed, 23 Sep 2026 04:20:12 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8595cb6sm516505e87.82.2026.09.23.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:20:11 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion overlay
Date: Wed, 23 Sep 2026 16:20:07 +0500
Message-ID: <20260923112009.1062-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The optional 24-pin expansion board carries two buttons on LRADC channel 0
and an IR receiver.  Keep them out of the base board .dts: with the board
detached the LRADC input and the IR receiver pin are not driven and float,
which can produce phantom key presses and interrupt storms.

Provide them as a devicetree overlay instead, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  2 +
 .../sun50i-h618-orangepi-zero2w-24pin.dtso    | 42 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd646..e4576030276 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -57,6 +57,8 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w-24pin.dtb
+sun50i-h618-orangepi-zero2w-24pin-dtbs := sun50i-h618-orangepi-zero2w.dtb sun50i-h618-orangepi-zero2w-24pin.dtbo
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-yuzukihd-chameleon.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
new file mode 100644
index 00000000000..2d7e98e4b66
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+/*
+ * Device tree overlay for the Orange Pi Zero 2W 24-pin expansion board.
+ *
+ * The expansion board provides two buttons wired to LRADC channel 0 and an
+ * IR receiver.  These are only present when the board is attached, so they
+ * are deliberately kept out of the base .dts: on a bare board the LRADC
+ * input and the IR receiver pin are not driven and float, which can cause
+ * phantom key presses and interrupt storms.
+ *
+ * Apply on top of:
+ *   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/input/input.h>
+
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
2.55.0.windows.3

