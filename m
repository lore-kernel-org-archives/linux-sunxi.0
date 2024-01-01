Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F144C2CC
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Jan 2024 00:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANlfJhWP"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso5258265a12.3
        for <linux-sunxi@lists.linux.dev>; Sun, 31 Dec 2023 16:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704067209; x=1704672009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1INtN/KwPq/Kh+/tuqCsXKBvEKli+VsBh43RgsVDQQ=;
        b=ANlfJhWPaeU42YyN67IgTOowHUi/eDrU2kISiueZYK5L8Qs2NYPs9aFloerLMzjyQy
         4rWBcHlX3P4LVFCbhPt9MKICbBlj3qjabhizBhgmhhU43RTU4NkC4ub1Z7ysm7kCtvHM
         R3G1czb1NCPmgnX3nLRA0pVH+FKKKlN6jmHzc/4q305IcV4xpIoTqQBd5Dv7OS99epV3
         E03VCi+TJm0mYnq9aPNcXk8yNWHku0n6Y7oT4X7fsbeSHU8gdwuxOPbiHoRrFOT+3xZt
         7V2kmAI2h5TzK3QBmKx/zUyvUhUZYmKCar6t3hquc0Eosbi4eqguzuVaLN2v8L0dI/kT
         Sz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704067209; x=1704672009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1INtN/KwPq/Kh+/tuqCsXKBvEKli+VsBh43RgsVDQQ=;
        b=ihksfVIjNVScMWE9EUzd1VW1sOOu+t2xyvIwdOUOsk1aUz6p5f/rxVce1g1ZZALuFm
         MFTFLT6oTtd9VWkNOCU6Pik86jwPK1pMdr38aSF0nSdmHghPfJ4Ivjc7+ljy0ZICeeeh
         HA0zxC2AhwoTrjB2IoWKQYPA93knOTWNwCGKEgMqpgzb8yYIh3ixobe52fN0Xo4gyv8J
         SJrFtWqD/b0XweYMm4RmWaKlchBsFv4jRekL4CIt8gj6zJizslDKDDI0M53bd9/btad4
         FslP1VRWlGgxPbCwhh39s+X0VT2cQy1zUXBdXSf7TJNlE0VUEudh/g181Oxh0kAFaiUx
         nFkQ==
X-Gm-Message-State: AOJu0YwvmqxUWZPa0qkhdPH1o9TSkS6QyNBkQq5B7QUTbi6XztCaREj8
	Lkhmuj08Wqrx2MFvJrHG8ZHzZhFh1MYg8w==
X-Google-Smtp-Source: AGHT+IFXEcZGbkvUmUE7n3yK8GOblmtp1rqPhnp6R3fS+jw+w58DxQeZOYGzzaX3pnL0cE39+XGT6g==
X-Received: by 2002:a50:96cf:0:b0:555:f39a:8c90 with SMTP id z15-20020a5096cf000000b00555f39a8c90mr829490eda.35.1704067209415;
        Sun, 31 Dec 2023 16:00:09 -0800 (PST)
Received: from tux.Home ([2.223.42.238])
        by smtp.gmail.com with ESMTPSA id ek20-20020a056402371400b00555f49e7080sm2710514edb.56.2023.12.31.16.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 16:00:09 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: anarsoul@gmail.com,
	tiny.windzz@gmail.com,
	linux-sunxi@lists.linux.dev
Cc: rafael@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	daniel.lezcano@linaro.org,
	peter.griffin@linaro.org,
	klimov.linux@gmail.com
Subject: [PATCH RESEND] arm64: dts: allwinner: a64: Add thermal trip points for GPU
Date: Mon,  1 Jan 2024 00:00:08 +0000
Message-ID: <20240101000008.65747-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without trip points for GPU, the following errors are printed in the
dmesg log and the sun8i-thermal driver fails to load:

thermal_sys: Failed to find 'trips' node
thermal_sys: Failed to find trip points for thermal-sensor id=1
sun8i-thermal: probe of 1c25000.thermal-sensor failed with error -22

When thermal zones are defined, trip points definitions are mandatory.
Trip values for the GPU are assumed to be the same values as the CPU
ones. The available specs do not provide any hints about thermal regimes
for the GPU and it seems GPU is implemented on the same die as the CPU.

Tested on Pine a64+.

Cc: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 62f45f71ec65..07963eea1bf0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -243,6 +243,29 @@ gpu0_thermal: gpu0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 1>;
+
+			trips {
+				gpu0_alert0: gpu0_alert0 {
+					/* milliCelsius */
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu0_alert1: gpu0_alert1 {
+					/* milliCelsius */
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				gpu0_crit: gpu0_crit {
+					/* milliCelsius */
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 
 		gpu1_thermal: gpu1-thermal {
@@ -250,6 +273,29 @@ gpu1_thermal: gpu1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 2>;
+
+			trips {
+				gpu1_alert0: gpu1_alert0 {
+					/* milliCelsius */
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu1_alert1: gpu1_alert1 {
+					/* milliCelsius */
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				gpu1_crit: gpu1_crit {
+					/* milliCelsius */
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
-- 
2.40.1

