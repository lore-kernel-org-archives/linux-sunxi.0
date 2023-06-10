Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34953171A4
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 14:18:14 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f7fc9014fdso20468165e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686406693; x=1688998693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iADzhJzSziS7zTAopdQl1F1LJEpxTBMZdMAeH9fjzio=;
        b=pkzfO/5sjuHYso+oiyL7XG0FVK9wYghdGfliIDHkuHEiBLv06cMTld/rPbe9ZcWq89
         q5zfw/OPDhI5rl8hUlLsjSD/Y3sE0DDEpJXtoWttBEwADBgfV97tRv9SkNXEMh7sVweQ
         iOgdA5YtlapviAswCw34D/Ex9EcTRe6FG98PT+Ygta0VcuxrnKxRD8afLvwDWVVaK0sL
         6H82RYlSoRjAKTalAG1Pr+6X4qIpg8x5kues3GSMOIxOtK3bVT+r9oL6G7dMMZ6FAMUp
         6u8yvU+TJvHddmSXZmzCR2YmUdWJXRTYJk0lXTsID5AHjF0kE2PlcO6JdJqMBkjFbgjq
         lZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686406693; x=1688998693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iADzhJzSziS7zTAopdQl1F1LJEpxTBMZdMAeH9fjzio=;
        b=XT1EKQ4ZyV+fuX6E+T1FkaRPKbmhc7uUrRsblATsaKnuQTI33NzaGroaLfUtS6Zs1+
         gN33uqd9EVprsYOKJbkFZH8pn3yWk3LEU7dSPs/EOOVtJmh8q/UL7IDUSlD/xKWcDiUO
         vAGxYOD2FIr8wZCAGHGCO8wt2sr0JSLrJ5oYbLQwq5+8qV82U6nVf44+7/m1l16FJ7BJ
         +1guZ0dNdv81Zh4sf8NuEUdwTnGNSv5/xBMnePRWegg3omoYJFivuVYlR0xvzEtSXGW0
         HfZqVRIjQf4kM/yV+UkaLvwRo9awyIcYq5P5wfraO65FU3FQEnJj2oDuvFHL0fsgKyhW
         aPww==
X-Gm-Message-State: AC+VfDyCsE0HLciEp0QS7LyLVbZ21MWTzeDRhIwI77Py52ZbnHTQ4Ab+
	3kvJNUHCun9ppGj3p9BuKOU=
X-Google-Smtp-Source: ACHHUZ6H/wa1UlSMhfTLRDVrB5/B+5RG6Gcpeun3sxfNKg2oFLWcPXNnSrhggzGAV8XE2nKtgJxfLA==
X-Received: by 2002:a05:600c:290:b0:3f7:3991:e128 with SMTP id 16-20020a05600c029000b003f73991e128mr3027448wmk.2.1686406692941;
        Sat, 10 Jun 2023 07:18:12 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f735d6fa74sm5841488wml.9.2023.06.10.07.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 07:18:12 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/3] riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
Date: Sat, 10 Jun 2023 17:17:33 +0300
Message-Id: <20230610141739.999268-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610141739.999268-1-bigunclemax@gmail.com>
References: <20230610141739.999268-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Kiselev <bigunclemax@gmail.com>

This patch adds a thermal sensor controller node for the D1/T113s.
Also it adds a THS calibration data cell and thermal zone.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..b893f3325554 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/reset/sun20i-d1-ccu.h>
 #include <dt-bindings/reset/sun20i-d1-r-ccu.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	#address-cells = <1>;
@@ -138,6 +139,19 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ths: thermal-sensor@2009400 {
+			compatible = "allwinner,sun20i-d1-ths";
+			reg = <0x02009400 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>;
+			clock-names = "bus";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			status = "disabled";
+			#thermal-sensor-cells = <0>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
@@ -365,6 +379,10 @@ sid: efuse@3006000 {
 			reg = <0x3006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@14 {
+				reg = <0x14 0x4>;
+			};
 		};
 
 		crypto: crypto@3040000 {
@@ -843,4 +861,12 @@ rtc: rtc@7090000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths 0>;
+		};
+	};
 };
-- 
2.39.2

