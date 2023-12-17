Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C443C49F8D
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 21:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aF1pLHLP"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e23a4df33so1984509e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 13:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702847368; x=1703452168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEmC8yzpg0VqIzMb5nxgOtA5V+BfOBifdcCXQ6xHVfo=;
        b=aF1pLHLPQ/54wo8nHBWEaBRSs7eNnBpgT6g/7N4kAjwGx7w2wJvH0i/IBK/yuTE4y2
         opzJiLWHZnveOhAeXO4vQCrD9FOSxLcezhATXbPr5J8PdflV1FMae8iL4Hg0azckeoLI
         06AIJ49Ecf6kypJb5YVMN99h8GC7e688/A6KNMjmutlojWjiylfqPN10bxjQlPsJvsWY
         gIxmNtaIf7CpLWjxCvkCGWBoIGHI7JtyspAne3VfZ9oCYT9RYA2V7vQKQO9CE59d1Jb3
         +3VgzqDxf8G0NbdtH3kamdlOtTvnYEMPq/Uc4EvQ93Z35XTmxhyPz7cooPTz4qlHTJLX
         N6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702847368; x=1703452168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEmC8yzpg0VqIzMb5nxgOtA5V+BfOBifdcCXQ6xHVfo=;
        b=jjDbctqrnvHf2yEXAhnqL3xEPCZ8nyGU9IFX8DtKJB6GUmdBT5N9dQLWbTiBckxfhN
         uu8SXwNSFqbgYzLcEO8yFygOvBzjbkRjlzijgm8rcBSk6nOmIPWSCPN6QhYDK0G/rF4c
         qc9lXw+FiGSvzZwqCvsQXnGsi3I1dO3WnCUbfqYlEPSkUhxsDzsqWaD0prjbnZ95hsDs
         XTkukrAcMb3HXGD/wYxnG5opPfxzJcPOxrhSznBfcFrD36QTSbvJR22+IsE1q6rxoDgD
         t+QKlL/p+jUFjRlcGgo1XsYXa/O7qsa0FUg3wPxXRY9AuZSh2xbIPwE8orDaY7Q1I3Ab
         uYNw==
X-Gm-Message-State: AOJu0Yy1wwFheTAaOLHkQ1TTP0MXRRPBBmoLYaK9Vv7rNM89BuragUZj
	HA4+Ari/FuGQj16uHxDIEf8=
X-Google-Smtp-Source: AGHT+IEmHz+jRu9UqOYO0LhhslWbwSbg09nII/aLGLXumsvPqPzNtDYWNyrCPwroyrvzHYdz6tqJSQ==
X-Received: by 2002:ac2:4c15:0:b0:50e:3b2a:a7ed with SMTP id t21-20020ac24c15000000b0050e3b2aa7edmr29915lfq.16.1702847367506;
        Sun, 17 Dec 2023 13:09:27 -0800 (PST)
Received: from wpc.yadro.com (188-169-139-214.dsl.utg.ge. [188.169.139.214])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm13316096ejc.64.2023.12.17.13.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 13:09:27 -0800 (PST)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: 
Cc: Andre Przywara <andre.przywara@arm.com>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add thermal sensor
Date: Mon, 18 Dec 2023 00:06:24 +0300
Message-Id: <20231217210629.131486-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231217210629.131486-1-bigunclemax@gmail.com>
References: <20231217210629.131486-1-bigunclemax@gmail.com>
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
index 5a9d7f5a75b4..6f5427d9cfbf 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -166,6 +166,19 @@ gpadc: adc@2009000 {
 			#io-channel-cells = <1>;
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
@@ -415,6 +428,10 @@ sid: efuse@3006000 {
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
2.40.1

