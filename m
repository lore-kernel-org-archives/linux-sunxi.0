Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82651C5F25
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 16:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745078882; cv=none; b=kf2bHaaOF6qQBUfZqci6AFjxss0K68H0JqBb9N66kXVUlNjJ6BGRT0sl6oT/ZFlP7eV15/wSXhG6yrP1iAS8c8xpqsPv8x/QowGDG5gNz0cWH/QrdLKUd/fJuohDAS64kbJiduV1r3EjxfxWvedLTJFAMLGewTDnbPaxslrjSGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745078882; c=relaxed/simple;
	bh=itlZfMiORUrDbh2i8HEMz92GLdhKMZH3i4NgvMs2yfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qc8yugjz7nEBD7ICluEmMUwX8d8XsXxFYw0ZG057mNTCIYmS2V3N+xYox14PuwjpscxrRp5DOwiNjp+khEBs5aHK8k11W1DMFD9Ti8HGvZMf1BEpG1WElTd4f8fmW4ssdO+7x11zuJp4NNz9Of4orZQnbeW9gsqFjnA2eSJjLlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrgo8m96; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrgo8m96"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913d129c1aso1911582f8f.0
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745078879; x=1745683679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cuSitV2YuumtHVL/ZIXcZnkk69oD+TSaZQMjbMoWuyY=;
        b=nrgo8m96G/gTeKZzTG8B0ApoZzR9bUPTtADixxcHnwjTaRmhnWie4WMhwi/31J9qKC
         4eO80AvoKbqxU8j6jly4j0R5w4DOOereQ6FwtH/YJBUlO2tpGX2K7q37SY8NeSDCM7x2
         pVpUd26SP+o5pG58i+WMawhy8Pm4+wpdfGi6jEL4+KCna5eo7Qa+oLV9OK8LZ6gsWXfr
         AFICOWtC6oDmeuRQ9KzBjb6OOPM+uJztFwGP68KjlAZChQ0NouoVBWgkz9dF+la9bFug
         sTTRLYXeB+pzAI6kq7OpLH2q67hklKkBdAqgnlnf1GDpHAJUVagchZtIcxBiHvoXwX2G
         8CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745078879; x=1745683679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuSitV2YuumtHVL/ZIXcZnkk69oD+TSaZQMjbMoWuyY=;
        b=v6m/ywV8S+aNUwX4Z64sWMkHFryqXu2miinj7eUwfHl/jro4J+hoJLlDdprgJplRF7
         Ezxarda4ReHixAFe5zBeAU5epXzldc6T20oAYSLnaSu96YHevWHbFMQEZ7Hzv43i1YLN
         AQZOsZrCQXuDbS6LRR6IU5aUmk0dN2ufdyqxK+TXkPxqXDwOVx+hEWrkRa+8qMrLUgBF
         lE2nqjjcLzheLAbF58WVh7tr1PfTr094gGQmVFuwgZrGhCHfX/4vHM2BdUKPKYW5QRvt
         wbGeAHstbu8ROtK4msVmVSegg0hd6bPqLPySpRrtwKsWaKSjjBxTiwPtCwAUeWSUuj+I
         9pqA==
X-Forwarded-Encrypted: i=1; AJvYcCXrgrcBsSjHTM1y8JoRH0psS2TMGQwtHyZVr+Fmxdez/9CDx+lAwlwuGzDPsj2FjaT2pYE1yrSCeEaMFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYdbyk4bvNc+7uJRcOv7jtmY49AbVPRKylzP9H581Pb+zMyc1C
	uRFGawcwBNMhs/x477HHKBm/U08ZWppPVqbaEYNog5maPyLGkuzh
X-Gm-Gg: ASbGncvhLiL2c6IYyXQCodnk4nJbS8lanYgwzEQAcKDzaWi3l/bUpVY2Zofts5wpsas
	Lqd654rPiuluZBR3hmG791470+Xjrk5sKpp/oxsWZFt9WVsb/dk/Ux8vlHYlm4QJE1QAslMPywg
	0wOdUM6RJpsfKaVhFHT4V1FYZUJaC9tCznk0RXF2Mm4JOjX5cQ1lKlWe1YtXTFPtR4J7Em/G4FH
	CqCbvd4LtNhNmbnOVDafcbtylh0bUH1okv/YyWI3+Rxs23ioWrt5ofEcmbSOimUAbPYKpMHU9mr
	wz2dFwHq+M7y/Lh1FjAPpgPesuRWy/wutqf3/s20Y0jNX2T2lVQG++TeJj9rSMWRne6Sb7okz+w
	fzmKDypxMrlxSe+a6stXuffcYY4pyIN1xD/tXi3XMN2eLOgLRsvMhoyzFrql59eHdFvrv5XCNp3
	o=
X-Google-Smtp-Source: AGHT+IHAPN9N64rdCZ+4Ferq3InaWnzLIdPCLXl/1Ga5fibN8lrQi8XSSi/NSOcGDYUSoS8vjr2zdw==
X-Received: by 2002:a5d:6da8:0:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-39ef89b5d1emr6024998f8f.4.1745078878880;
        Sat, 19 Apr 2025 09:07:58 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4406d5acce9sm66571445e9.13.2025.04.19.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:07:58 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [RFC] arm64: dts: allwinner: a64: Add overlay for Realtek
Date: Sat, 19 Apr 2025 17:07:46 +0100
Message-ID: <20250419160751.678827-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add overlay for the Pine64 Realtek rtl8723bs WiFi
module that works on the Pine64/64+/SoPine devices.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

I've looked at overlays for other vendors, such as available
for some of the Rockchip devices, and I believe I have this
mostly correct but would like some feedback both on if I have
everything needed for Allwinner devices, but also what's needed
to be able to use a single overlay across more than one device.

This is dependent on the following [1] patch series.

Peter

[1] https://lore.kernel.org/linux-devicetree/20250419160051.677485-3-pbrobinson@gmail.com/t/#u

---
 arch/arm64/boot/dts/allwinner/Makefile        |  6 ++++
 .../allwinner/sun50i-a64-pine64-realtek.dtso  | 30 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 00bed412ee31..be991f8d8110 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-olinuxino-emmc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-lts.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb sun50i-a64-pine64.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-realtek.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinebook.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.0.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.1.dtb
@@ -52,3 +53,8 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
+
+# Overlays
+sun50i-a64-pine64-realtek-dtbs      := sun50i-a64-pine64.dtb sun50i-a64-pine64-realtek.dtbo
+sun50i-a64-pine64-lts-realtek-dtbs  := sun50i-a64-pine64-lts.dtb sun50i-a64-pine64-realtek.dtbo
+sun50i-a64-pine64-plus-realtek-dtbs := sun50i-a64-pine64-plus.dtb sun50i-a64-pine64-realtek.dtbo
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
new file mode 100644
index 000000000000..51b57a46e23f
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2025 Peter Robinson
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&mmc1 {
+	status = "okay";
+
+	rtl8723bs: wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&uart1 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8723bs-bt";
+		device-wake-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		enable-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+		host-wake-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
+	};
+};
-- 
2.49.0

