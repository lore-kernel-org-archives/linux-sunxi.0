Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454472564
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 20:43:06 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f739ec88b2so21705075e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 13:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429784; x=1689021784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++GIztv4naBcPicwbwUH4k+fuc5iv8tnHanmi3MA+54=;
        b=kpQA3nekPL+98p6cmI9mnzaVKKHSve6cxGy1RhXCla4biUstK0AKaCtI/Yd8gbQI9C
         sKvam+wssABxv9MLaA8kl5BJhpNt80OT9bNZPqEmuKvB7Y1ZlMAjG5j1EByVLPBFSquv
         XZYWdbif7Djrbj3cU6/YT0/+uIqkCKD0uhA31WONT9nr87Vc+mqKv1p723rj55+9H79T
         Kk8WI4Y4aYbVsEMcYPZ5hDCoMCTI0rh34BEzenayM7ndQUqivI9EIRPkk9GG396NAB47
         brloEtunNG2rvV8Q6S66JAxklc2EW244yyggOBvkLx2SDrPU2Xds3WhVzhas6d7dA5jX
         9ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429784; x=1689021784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++GIztv4naBcPicwbwUH4k+fuc5iv8tnHanmi3MA+54=;
        b=X0MtTkB13zRA1i2gTaHi5dF1mcvZBgKmFWJ+aOY4MFgcfsxSd3vsAHc29hMZDOrPl4
         lpxW2YBjpmTOLMvvc9KZ5SdXgyTQ0S2hLXNKnipPUq5xLHJgfmfSDkGwflZQk97Kk2MY
         931AXHZPEH4TulCu2UJge83/x9VVCzeZbnHPojpBnYNeIKoP2lTP01OMnOZE38jFKMUl
         ye+XQyVKJaA1v6l8iz6AJwHimzpgwiQDPc/B4QGdgJbfhoeQqD0Dn9aTC6PqG+Xk7JQ4
         9XOgWXpxxODoreWy5/jfL87/TgzASFEeW8tn7RIy+M94zEpUHb70FzU62ZTCbEzud2qB
         MyLg==
X-Gm-Message-State: AC+VfDx/tutXCKdogG5BVa/10CYLSmKv5ElIe2p4cFnTfQjPzXnLr1xc
	2JAd5Odm08WGMjy/yhklHtk=
X-Google-Smtp-Source: ACHHUZ5WccjoBrBdIgxWWjOpvDDn0XwQ7s5E509S893oS/vgBLryWQLqdG2psuevCq5s/c2CFP1CqA==
X-Received: by 2002:a05:600c:28d3:b0:3f6:48e:92ca with SMTP id h19-20020a05600c28d300b003f6048e92camr2906917wmd.39.1686429784280;
        Sat, 10 Jun 2023 13:43:04 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f605566610sm6547733wma.13.2023.06.10.13.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:43:03 -0700 (PDT)
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
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/3] riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
Date: Sat, 10 Jun 2023 23:42:20 +0300
Message-Id: <20230610204225.1133473-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610204225.1133473-1-bigunclemax@gmail.com>
References: <20230610204225.1133473-1-bigunclemax@gmail.com>
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

