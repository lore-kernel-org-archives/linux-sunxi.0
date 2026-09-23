Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9DB49CF2D
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161664; cv=none; b=m+XjyLTAhNAZV+K3ue94n7Gk0mCr/+6f9G6c6dQpGDZ2mD4JSJ4NT+R0PQDFoai/qdv0g0r2jPQS1gwZT/y4O2QRUgY1ZhmltPKc0ZnT0elHNRiOtI0mYA7Y3yNx5N15VtzOHSpl+9rVdX5O3NEIzzxVthdzhfxWi9pFBHMxOhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161664; c=relaxed/simple;
	bh=LzFzKdYIt7KQIiyurFYnhAFiegOmNQVla4mXTg3pu0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CBShz9VUDsDpfjpIbE7zO+6GbiBVTCRjUNexHVy/xb++MFqlgQ+A2n2oyuY1HZSD/HyLNJs+ElcjgBUd4kgnfJEmapI1BUalzpCBphH+8tw/TCQAlJVftQ1QWu6w7jdDIB7x1aj3M3r9uOQLL57tEQoJcRDXuetoOn3Gol8DPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UH7q6nc4; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UH7q6nc4"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so653787e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161660; x=1790766460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=UH7q6nc47mPARTZCOpfpySd3gMvHZmrkNXZOCb8mwqMEwIKDGSKRAjQUIy1LqlWTTB
         /cST/NH2fxo6YHPNgPH6WSjWBa85A7A51Gf5CnYiVCb/uYQZO/6TNhzMR369fN8zrXmu
         ofOmwF4o8IFljqe5n8QjqYaFaHhIMIOd2MpAppd+R2Akw1aHefxh40qUzJdyXEkYTNXw
         P5UMFx/cwY71RzxcwOq1hIY/mHzYIJr6rM7QawtZ19dTKkM1ru5EMwGU5C0uz02998Aw
         pTqQL18WU62DxuQ9+/J9yivJMoM4qCTDjn42vAYunBc+VhHBqa5iuxXY0SXQKzDE9UWX
         9mBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161660; x=1790766460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=RaThJIO6UagdaaKyStz/UsBZp6ojm66G4/QxeVNuMZiudNTYkJ7sEUftEWHlQdr9jY
         G4ryPYRIwl8cGJEhDcrAAcSW5/nto/unPJpwtmyfmqfkqa8gf+KhCN+rckZEXV7cGzE8
         EmI5tCfJlPysqYB8PqP2JTA1vN5JeF3MnDUIYT6dSTk9k9ts7Tb8cqLDVWE963TRAAcG
         0Wo5LUG1RUcne2PkkM2LgCm+j+PVs1FTTLuKvmgikeGY0KLMjXlI0HlHlCreYkssrr8a
         TNvNfv7mjj8vZO2mE/bpqe8g2yx4ExkkkDhUwGGz+Pe3aVAf535dwHTFrSvrZwSwjiXl
         xk0w==
X-Gm-Message-State: AFuF++nuveWnTJPGRHoGzbUgEs5tXrDafedGFbVF99auxBW8cwC806AD
	GrmBaAQr1vDpo8kT4XgANNpKJqg3W5a9Xqx4mqeTVxsnQYaqcF5jgym1X66s+WlY/hxSEg==
X-Gm-Gg: AYBFou3DTzokPepTfhuvHJ1TMR+7uNHoHqh2EWdn4KFPqzgNOYp1UBcyOZUWZ8UBJGR
	Fg2nT8HoZWTef6QYY5rgADb5eIi0DlsUGjGJBWcfrDYD6KQ3cjX8Zyb561J2w4wmt5kWeW4GNvV
	SOdf0/2IECEliHNl20ZZbYzlo9Z3+p5WT5Z9UW7IOg7XYNnWhRAKfCfbbss9VtZvj9H4wbINIYY
	XzAWgHmRsiHHoSs0zuPqF+rI6kbIajj2/L0n9z2VEw6BMF7grVpFSQ2asEQdoI26JQgaN/xXIaO
	HJbLFbirw9MrFsgoKzwtSIRQjYwJbNRIdiVuMQllsU0V+BN7ddae66E5zG6TA1e/7zBYjxujiIW
	sCyUDYon72ZPHf6xKj20YHOSwAxU4Irvdqermk4btx8EEANPqdWi9hI6tPM/vZE2wcbQj2WHECI
	Jff6aikMT+csBMbZnF+u6/rDkzmWTdOSMNkiwIOkL5y5ieLDsIVpPHb1AcZh8VxCxvpmlzGhgmT
	gyd8HIoww9p34/4bvVM
X-Received: by 2002:a05:6512:3e01:b0:5b6:17b6:2224 with SMTP id 2adb3069b0e04-5b8d89779f0mr771643e87.23.1790161660218;
        Wed, 23 Sep 2026 04:07:40 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d858f2f4sm521750e87.65.2026.09.23.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:07:39 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion overlay
Date: Wed, 23 Sep 2026 16:07:35 +0500
Message-ID: <20260923110736.10-1-anykey196@gmail.com>
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

