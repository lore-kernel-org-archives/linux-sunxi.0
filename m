Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9A628ECFF
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649366; cv=none; b=LxJOcWvvPL2JwhM97EzITsZ+soicgNzMt4KPKHd+865qKhJBYlyJNSTA2jH8xApKwv1m3iLsAZbee9XCgoUt3oB2j/yS6xXrcRXpdLzhNNQiqUZhHDghWk+P8NX0mnBkAdeK2CuwL9mzb+6bzfYeceNUsDvWKsfDAc0r/oKmbXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649366; c=relaxed/simple;
	bh=jNxw4qfsxNuQ4Z+Xll2+D80lh0Nv01Lue2RSitNK3+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhYzPkWiqG4+XS9onHjbFOUEQQBLWyjJeVUsvaA/bmCLSJ2xoKCYHPA2DO+qIBtUTKBiQXf79K3pj1nhk9ipuKGjIwZN9Q1P6p35LtMuGmOwWdLijm0oFaFzSs0sJhb+Aq95DvD9/rYYEcyE6A8o3J3tp3sPfdHV/74WFy8WRgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNlswzsj; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNlswzsj"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7300069c447so136090a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649363; x=1747254163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O5IKDOodRu44GGCb4BG8zpMxyESHszk53bt91Bq6Fc=;
        b=gNlswzsjiQep0MFCiDaLWJpK+3ZcArc51xBBHwaveLxcuWGHREBb7ZNeAPHc0Ot9Hp
         +sHoPsnfYHvmKowzqZt3JcTdaHkalbyF5rkHtUbLP6mnFuQvRFWCqjN2OEUNSD7oXkYP
         sa9OJ3gRJVNN5WIIPjP4gddUFPVhd//sDniXv59wPOVUugK8Vdn40hEfM7GScxunm4Z9
         JU14V5ZK8FYaXnkw6EGmGtm7ekn9nARiKGJ3Rh1hmVxXzMWePTJTz8Br3W/iC4BXGZZt
         mamW/696ZuvTYB/aYlq34bumCWY8s62EDd6IYrnVTv9oaXHeeJ8yOQhhfmGE9twevc39
         i9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649363; x=1747254163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O5IKDOodRu44GGCb4BG8zpMxyESHszk53bt91Bq6Fc=;
        b=NZvy7xIbljPEJJGSzhVogTaU7rrd17Lo6TyETYZi0M0iqcWm5JpAC/TavQp5LfUDIz
         XbzHuD0IEga/LPmfo4ajHQRHQ1pKpvqMehD8gjtSf8YHv5lpRw+m3nUk1NUJK8cF+TEx
         a6kdzmYRuwjAzwKKdcGysdHi+cDlMvlxCL++16TBSb+3CzxIsUC7yoMk/c8HYOJkjhsK
         bWFO9ZgPhemE0EKJsRTlCyFiyBAGVAECPv0w4Ok5ugz//mK392fYJPpyisBOA5ida6Hx
         8n5AZqGs5aVAn6RLibXB98PipZQY+FEt2KmfKBtuEvwQslVIiiVLzbMTXoeR6DvND/s3
         m8pA==
X-Gm-Message-State: AOJu0YxY3Q+knYwa62i7ycLge5D5cqDvb7qwot4qTR22+i2mByjWBTzo
	rDiSDPnmhk30H7KdjT8ueDA0An99vpOyHeCsnKjs1X3uylHUygIMOqWE3g==
X-Gm-Gg: ASbGncusREE11uqf4LKX/0FoLgzfkHpTdolk+UbjpCe8B1Ft78cE3UgbNfq88wW1doE
	P2mmpchY+VNPRUUr6vUhr+fENb1HHlYx86h7F5yAVbUWEpFo0FTJrHvM6Fw9RCWo5j5AiHlna4M
	cTcG4JF/cOzb+rGW5Wjwi+FksQY1uIpNBQUq3BF1c2QH1I1G6rCWdyOIhJg2jLALsveaWCmgfb/
	YpcMEK2y/vnCBsrVS70NHPaQGGJFYkOCaPnf4dkgnhdZv6oITJX/n14oVbIHb9uupGkpw31hmal
	BoCtkbPYu/qXtDVvN+817A+cRQzLLniOxXAE46zqGHXymspX6Gp1842KITg9
X-Google-Smtp-Source: AGHT+IEOq3je+wdHKClXriTnH/qW1I0Dd/fwjIaZZ5wgaKePHeaYweMEfsDSEKSVXN1KtPnla+IiCg==
X-Received: by 2002:a05:6830:280e:b0:72b:cdcd:628b with SMTP id 46e09a7af769-7321c900e1fmr477585a34.20.1746649363335;
        Wed, 07 May 2025 13:22:43 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 21/24] arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
Date: Wed,  7 May 2025 15:19:40 -0500
Message-ID: <20250507201943.330111-22-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 has a display pipeline similar to other Allwinner
devices, specifically the A10, but using a newer display engine
revision (DE33).

Not all output pins are exposed on all package variants, for example
only the H700 and T507 have LCD pins exposed, but all variants support
HDMI output. However on the die these are connected to a display engine
via a TCON TOP and one or more timing controllers (TCONs).

HDMI output support is not provided in this series (but will be in a
subsequent patch) so for now note this within the relevant node to
prevent a DT compiler error.

Add TCON nodes for the TOP, and the LCD and TV timing controllers. The
timing controllers are compatible with the existing R40 driver.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 542d129da9c3..129ce78ae5f3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,9 +7,12 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -912,6 +915,142 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h616-tcon-top",
+				     "allwinner,sun50i-h6-tcon-top";
+			reg = <0x06510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>;
+			clock-names = "bus", "tcon-tv0";
+			clock-output-names = "tcon-top-tv0";
+			#clock-cells = <1>;
+			resets = <&ccu RST_BUS_TCON_TOP>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_top_mixer0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_top_mixer0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv0_out_tcon_top>;
+					};
+				};
+
+				tcon_top_hdmi_out: port@5 {
+					reg = <5>;
+
+					tcon_top_hdmi_out_hdmi: endpoint {
+						/* placeholder for HDMI  - remote-endpoint = <&hdmi_in_tcon_top>;*/
+					};
+				};
+			};
+		};
+
+		tcon_lcd0: lcd-controller@6511000 {
+			compatible = "allwinner,sun50i-h616-tcon-lcd",
+				     "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06511000 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon-data-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd0_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					tcon_lcd0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
+					};
+				};
+
+				tcon_lcd0_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
+		tcon_tv0: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h616-tcon-tv",
+				     "allwinner,sun8i-r40-tcon-tv";
+			reg = <0x06515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb", "tcon-ch1";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv0_in: port@0 {
+					reg = <0>;
+
+					tcon_tv0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+					};
+				};
+
+				tcon_tv0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_tv0_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+					};
+				};
+			};
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-- 
2.43.0

