Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A116FBB
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 12:56:16 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f649db9b25so8438817e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 05:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747374; x=1689339374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1eo8xae+BqZ3lpEIIaUchjB8XrAbrJIJKlx1wdExKg=;
        b=UvakJ7HBiMflkT+GTjEx7eUO+ZF5M/UQXd9WYOPFbdf797iEVzkTvlUo5fVxcciifz
         frJ0ouFGcgjFa9YWRSIe+67tC6STTVHFInpiU6DWx7JycvqyFpcoN4zcnyxZ/GFmo89X
         /Y2GtqN8ou+4m+ruSsoEkhCqka+7FAvCPT952KSysXaUeJwBgXBUdFmUmMB8ycVGJKib
         x8AwMqtsLgjkSWGoqP5wXyMY4mlSH21j6BDJAweuFb7CYfOLbnUeujuox2T28XQw/Gwx
         /u2kc4UMqPnUnSzPUUJ5GIcG2yoUgSfruMBIymmtuI0krA+jr/ftSfQLdD9q8VQyZ0kf
         rPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747374; x=1689339374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1eo8xae+BqZ3lpEIIaUchjB8XrAbrJIJKlx1wdExKg=;
        b=i9xmD3XB7QZGrC5tnf8KmTKYlPrCoy5v5NQHuAH4CCbLokvWPbI/M7zVPk9cUIlVYA
         ex/QLai59ooSJXdb6jwt4IWCMpZvkQV2feMOcNnpYBvV755jpt2jknew8YMZ6SmgY7No
         MtPjyJ0d+UTB4QYnSZRrfroiA+ngVHdYqRH5LAzX1WQNyOJh9MWJYKX1BbvwGUvxeng4
         sbJy6yT8BSJcyp5+VNLDYfthg5DgjByBnoMSpEWZ13nlprjITiwOX7jYXsqSZy3Qg/aN
         9NO3hMjGaIDyODNiHeBKgoyRWT78L0r2v1GGWqPyJQh4Gmn8aTPTlwNGoRWGGnDabHJs
         uWlw==
X-Gm-Message-State: AC+VfDzD+MyGS4QpGEneM6HFVlOrXybT2Iin9Tvpp9U336bt5BDpstsA
	kh32K9VcJQPTTV1PB+lxSF0=
X-Google-Smtp-Source: ACHHUZ6Kw6DeSi90C1pJK+Ei/gwJ7+BPa9Ig7zhSqkWiZ2L26A4A6pgW4OZlts4EVAcsqL3514sjWw==
X-Received: by 2002:a19:f20e:0:b0:4f6:54f1:ea36 with SMTP id q14-20020a19f20e000000b004f654f1ea36mr7594684lfh.43.1686747374315;
        Wed, 14 Jun 2023 05:56:14 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm17402522wmr.2.2023.06.14.05.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 05:56:14 -0700 (PDT)
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
Subject: [PATCH v5 3/3] riscv: dts: allwinner: d1: Add thermal sensor
Date: Wed, 14 Jun 2023 15:55:21 +0300
Message-Id: <20230614125530.660597-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614125530.660597-1-bigunclemax@gmail.com>
References: <20230614125530.660597-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Kiselev <bigunclemax@gmail.com>

This patch adds a thermal sensor controller node for the D1/T113s.
Also it adds a THS calibration data cell to efuse node.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..9da1e4ddb662 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,19 @@ ccu: clock-controller@2001000 {
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
@@ -365,6 +378,10 @@ sid: efuse@3006000 {
 			reg = <0x3006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@14 {
+				reg = <0x14 0x4>;
+			};
 		};
 
 		crypto: crypto@3040000 {
-- 
2.39.2

