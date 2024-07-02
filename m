Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948612C477
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 19:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949003; cv=none; b=pZ/2cU5QOX/8lPfBvAye0KkfY3nGKhfzKQDSfQWEndkSgB1qXRsPWp/+YKDvtpTCzM9wg0Ad53KzAOEit5qb20Q3LUcNHrZ6u7EoqcfbBwB+4hTpnjQwEfUpIT7ahyFsXb+H44kXZNm/Ke42m2syaojDft4hTqSFvo487NJQsaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949003; c=relaxed/simple;
	bh=iQfsNDwxQuKmM1LvRmrJ5KrF/yqZ29FfGhovA+NFxD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AiKOg8caTYCsia5DCScCeH3ViO9qoYKFdv71/zf/rcc0GJuZdYMT02vOqSut8C63MUp3Saf4CE1EemLm+fWEKkB9YbBL71R/7O2IwzgolbAzKv4xbqSru5iDGHRODCb+QWCThrdG6xe4dkaqvsxJ1JsLsesMM+sVZgpdpevC1kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEJlD1tY; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEJlD1tY"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d84546a05bso1041534b6e.1
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719949001; x=1720553801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIkm02pH4tYGv9UK3P4L+KwMHHNwtAihXpO73Co81yw=;
        b=LEJlD1tYg6Iu7tbhdvpLWaMEWv0qCzHZQqTuUb69xFn9Ogrk76XSLEgu1eUeQSxvRw
         v1lXbZ+Dv1jCUycfsH0FnTrQO+/gPMZUDTg6UAOCBz/kzT76rORw3VtRfHSr/AtcvJAW
         qAL6A2qHYLa75aO1IjK/x3RQ7vs8ozPwJmM5Xpn7SBX5iHBWDoMLKBccWlBqVMCp5JDv
         Jey1KAWl7vwmmloz94Ma67O6xRrN74+u2nlhN7/1wMEuTJY59+nwQjMkawEkVfc15bEg
         lZMbhJX5QPNe17LwEX9wLTeted7emyrOYyvT20dS1aM+Tr6YKnJrq/2ESDhlrycn+tLT
         D5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719949001; x=1720553801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIkm02pH4tYGv9UK3P4L+KwMHHNwtAihXpO73Co81yw=;
        b=VVO7eGyggo8lAEhvNmM9rfLI1SRGNYFGzg3HR1sThQTASMQIGFr28bnDdhAdI5eKlB
         5BJS5osZqWhbFFtvfwDBLIsYaZGoAOWz+rHKOxJtQjvuN/4i6i1CbVfpbKRP7tlRBjIp
         agXis17NZIbxVqxvluDN91i5ab2AM3AWxJKJbH7MVvqwJulfvFulXv7vi44+/VVAZhgC
         ClxAyjI+VioKpdCGYQ6j1fPifx2NNMU55/pg484yZqLZdOlgByyu6UrytrW4EZG9yIOk
         P8rjN6Y304nt+acObMDFphIuSv1IkjtOiHFmrmWmgzff2kB+RlE43Ray9SauRAq8/dWY
         Ss1g==
X-Gm-Message-State: AOJu0Yxw6ECQrC99Ep5vYoSuEYkvL5PjsMDhoGDgYpCeqEmSvntjAVXp
	rETVHCrXYw2t0jmGC6JqFjoAgPXLlu7tOdXKF65jwwiTExS4Tu7fl1QNfQ==
X-Google-Smtp-Source: AGHT+IHMNkVy2icivHQQ3ufaLkkXzGxFxtxYottOBg7ZAoK4buq0b1eW1wEk9z0uK0gO4r+1REzYhA==
X-Received: by 2002:a05:6808:159c:b0:3c7:3106:e2e1 with SMTP id 5614622812f47-3d6b2b24231mr14046094b6e.8.1719949000751;
        Tue, 02 Jul 2024 12:36:40 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62f83c92dsm1831335b6e.0.2024.07.02.12.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:36:40 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	ryan@testtoast.com,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 4/4] arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
Date: Tue,  2 Jul 2024 14:34:14 -0500
Message-Id: <20240702193414.57461-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702193414.57461-1-macroalpha82@gmail.com>
References: <20240702193414.57461-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
clamshell form-factor. The key differences between the SP and the Plus
is a lid switch and an RTC on the same i2c bus as the PMIC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  3 +-
 .../sun50i-h700-anbernic-rg35xx-sp.dts        | 34 +++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 0db7b60b49a1..00bed412ee31 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -49,5 +49,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
new file mode 100644
index 000000000000..0cf16dc903cd
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
+ * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
+ */
+
+#include <dt-bindings/input/gpio-keys.h>
+#include "sun50i-h700-anbernic-rg35xx-plus.dts"
+
+/ {
+	model = "Anbernic RG35XX SP";
+	compatible = "anbernic,rg35xx-sp", "allwinner,sun50i-h700";
+
+	gpio-keys-lid {
+		compatible = "gpio-keys";
+
+		lid-switch {
+			label = "Lid Switch";
+			gpios = <&pio 4 7 GPIO_ACTIVE_LOW>; /* PE7 */
+			linux,can-disable;
+			linux,code = <SW_LID>;
+			linux,input-type = <EV_SW>;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+			wakeup-source;
+		};
+	};
+};
+
+&r_i2c {
+	rtc_ext: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
-- 
2.34.1

