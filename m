Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908417C77
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 00:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332046; cv=none; b=oD0JSMKs28csEifOFjR1W4JNQQ5Xe1Sxi+Mb20WC0dicO15v0Hj1dUEe9iYoGQ9PU/l3/E5rVoKDi8LCGh3JwHfoEEzKAgcPkDiR5EhI/c1WDctg61MROyRUswOnX57A/3qh/n28ORoXI04ws4s8p57CXg26Ny4LQS3Dg1vXzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332046; c=relaxed/simple;
	bh=Sr9C3AkfTXW+bU8fjxHLzXQi2OaODJymdItrPseCW/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRA3tPM4A5LuWWGECx/S/5MOflozrEICFVIbEkNVfs2hBJGn4Dhic4YLfqFrCT7Gbw5Bgs/1GQJjQjA1OJaRCikarHypKNL0twZoeCMKR189G3nLpNCwq7BNkSGxkIVmNT8XVovjCuAxB0AtUsV14UGdMFbJeIkDMO/AeYpNuas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmIHOsq0; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmIHOsq0"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3061513d353so15204531fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332043; x=1744936843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqMMUOwQC1FQBaxF5Z+cbkCBiisCIHbCIXU0D1pZnrM=;
        b=AmIHOsq0vCmxR9aMP2983a+RAfL40qYD/GIaFtq9LJDQLZVnTLXMULwuTymrHLBm/W
         HBhoc2+i5Ri2sywrPLc8Xi2tCuhU3SMhTA4jMTcZtWa+CR7zsrlhhPbS8+CX/K4Bopl8
         toqPMmtR5pa3dLZnnwKsC7m97hJ3cnqw6J3mm40RztgYa06Gdwonp4fFSe+eObB/odrL
         zF3K2j5beD+w2UqCNZOi7qZm1/JbIKYuLj9dAjU5wdFMzJdwXeDWgT0WBnBBB93pQ0jh
         EKtQNyUdhKfSL2enRC1e9r581jDWp9QinukekvV1yTLLB0uFcfeDjzUHRUNpCBdk21rC
         gA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332043; x=1744936843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqMMUOwQC1FQBaxF5Z+cbkCBiisCIHbCIXU0D1pZnrM=;
        b=NnuwPEmONYGtaHIZiILkwphqJsy3C33riZkjdrODVqVB8DhQYHhFOi88PhOu46tWWj
         HP2bt9XPcTF2SvMt1iEm5E64qIdnTi9ML2ighACOuuDh4IRuRxmnQ/9YWqo/bj00+i+r
         MNZuxxYzCThJmBCH2Q4TRIx5m+y5iMtfi13gf+DbSFgu+J1+3YgEO1Uc+wGs/SJutsdg
         FXLsZM3yarKagOwk8XAl4jYbxGUfKsnbIuTfqL+oFk0yOInFXaivNy4Xue9ioQmDixAn
         Q2CaDsxXu9oy6/AA1aIy0V/FczYozgqGDFEEnyjjdXqkeaaKmpIKg7aAkMbPmP4cQXnI
         WWNw==
X-Forwarded-Encrypted: i=1; AJvYcCUOYSVZRqkaeLYr3TNOFdhv4dzNV20VgsHEAR72u33fguVytOAUsUO+rLShWbr+5N8Ga4hExo12To6xog==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrC88lI3tC8LOcwVkVmVFm4YdCU5SyOLrGwKpIIxyQ/JYoE+QH
	HeCfKuGyKeLVOtGrIuZRVCavp+PPuvp+2iVdgiJP2A/t8BYi0dTG
X-Gm-Gg: ASbGncsWb33bakd2UbtxZOUrgiujmHEgF3grTwOiw/mfUD9DMLFWTapYD3dOeSlR0yJ
	pTKCgOjVjVDEWRk7X1NARFfGOxfkZCvUln61sjuniDK2sbBQ9sTk55Y1zVXiHGxedM1MPS/XuBf
	fiaYDdsjeSSipUn2xhMXmCKkpYj+9d/td5Zm4lIT2Kcm3oLV3miQ8w8wCZn2vGXvnuuH0+xCLv3
	35qTnr9+owDM61DGDqq59YmXx558x9SmfPYRv7o0WyWVDx3gao/2oWpeiFale7LKWqyYU+hHqHB
	mBiq4MZOKHXDNvGbolg2pcfC6k0ZXAvCpU3bEHSeHBf4j5Wa3Q==
X-Google-Smtp-Source: AGHT+IF33816+KiMMv+fNeFdW0EInDxjtilG9kyALznQ6Y0n6dpa1CvrQmH8HkK1cx1k6+UUsrWg3g==
X-Received: by 2002:a2e:a9a3:0:b0:302:2598:de91 with SMTP id 38308e7fff4ca-310499fb36bmr1693111fa.16.1744332042866;
        Thu, 10 Apr 2025 17:40:42 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:40:42 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 5/6] arm64: dts: allwinner: A523: Add thermal sensors and zones
Date: Fri, 11 Apr 2025 08:38:25 +0800
Message-ID: <20250411003827.782544-6-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, THS0 and THS1.
THS0 has only one temperature sensor, which is located in the DRAM.

THS1 does have 3 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu

Add the thermal sensor configuration and the thermal zones

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index d626612bb..4f36032b2 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -22,6 +23,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0x000>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@100 {
@@ -29,6 +31,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -36,6 +39,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -43,6 +47,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			reg = <0x300>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@400 {
@@ -50,6 +55,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			reg = <0x400>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@500 {
@@ -57,6 +63,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			reg = <0x500>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@600 {
@@ -64,6 +71,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			reg = <0x600>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@700 {
@@ -71,6 +79,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			reg = <0x700>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -171,11 +180,39 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ths1: thermal-sensor@2009400 {
+			compatible = "allwinner,sun55i-a523-ths1";
+			reg = <0x02009400 0x400>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+			clock-names = "bus", "gpadc";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			#thermal-sensor-cells = <1>;
+		};
+
+		ths0: thermal-sensor@200a000 {
+			compatible = "allwinner,sun55i-a523-ths0";
+			reg = <0x0200a000 0x400>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC0>;
+			clock-names = "bus", "gpadc";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			#thermal-sensor-cells = <0>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun50i-a523-sid", "allwinner,sun50i-a64-sid";
 			reg = <0x03006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@38 {
+				reg = <0x38 0x14>;
+			};
 		};
 
 		mmc0: mmc@4020000 {
@@ -602,4 +639,105 @@ rtc: rtc@7090000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <500>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 1>;
+			sustainable-power = <1200>;
+
+			trips {
+				cpu0_threshold: cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu0_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu0_critical: cpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_target>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu4_thermal: cpu4-thermal {
+			polling-delay-passive = <500>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 0>;
+			sustainable-power = <1600>;
+
+			trips {
+				cpu4_threshold: cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu4_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu4_critical: cpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu4_target>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <500>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 2>;
+			sustainable-power = <2400>;
+
+			trips {
+				gpu_temp_critical: gpu-trip-0 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+
+		ddr-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths0>;
+
+			trips {
+				ddr_temp_critical: ddr-trip-0 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+	};
 };
-- 
2.49.0

