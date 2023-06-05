Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D25E1369
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jun 2023 03:58:11 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f736e0c9b1so11992985e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Jun 2023 20:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685937490; x=1688529490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1INtN/KwPq/Kh+/tuqCsXKBvEKli+VsBh43RgsVDQQ=;
        b=CNJgdIQWmGpb04ERz1Ys1nZrFf5/mzRxPH6KaKPjMO/3ffHex71sKR7RzjL48hpK23
         7nGHLu+rmyyzYpb/kRA1/17nnxrMFAT0PuuxqWCtMnWJZB2fyxvreBAWcjNc55O32PVY
         vl+6m3g9FI7LaUsjVyfboXH2VuXHRFE3Z0hPlkHGcRdmg255pieg9l+0prOmR/AnRMvI
         pYX4RsS/sxwLEPA/5IneiOqDd0fblgwJ5evcpRLsfl81aaU/F+23pDwIhXYD9pgRzkjW
         F5u/VYEE6E2x8G0sBGYcVEJHMsP0DzY2ckxmZBQBJSYZmm9z5dpoj8ETASH5ezPYTL5H
         W2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685937490; x=1688529490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1INtN/KwPq/Kh+/tuqCsXKBvEKli+VsBh43RgsVDQQ=;
        b=mHMXgR+GPqpass5eO/Ic30OVuqS4Heek5mk7jly7WPhfVROZYQSA29T31MiwDhp2ud
         27VX/1fFdMcS1doLFv0/rxVKNYf2X7lY0c7rDIUKZGmHpLUvNkL6L//0ewC0eRlFkUKj
         bDkvbE0ccmAhORichzADuE4TMO7z3/uBIH6cO8nuc6IBct3y6fck7vJ55tN20GVmjM2X
         rA3n0SKEpgm7fTWLodu0pZ+c2j0mFYOTwjhayIVCW6DUKFEZDI4817n37gDZcT5HgL2A
         o167LJ3Xvkzbujm+WHsfmrfBcLqL24o3s9Pqr1AIMP/dsOKNUDDo8DdcYfqkismLlQBw
         o0iA==
X-Gm-Message-State: AC+VfDzq4DYleO4hcaJkCRhY0P/HQPrGydVsCsODKUr5/qmMM99Ovonv
	sqYOFRpa7mYvxZz0wYk0t8xOmu+FVtjED1r5aEpVBV1V
X-Google-Smtp-Source: ACHHUZ4DJGhaMm7brMwF3P8AN9X/VOOOSJlkXVvH96yVnAEoah1Hx3Zw7Ukr9AL0H+eD7KQMt0LyCw==
X-Received: by 2002:adf:fb45:0:b0:30a:ee5e:5cf5 with SMTP id c5-20020adffb45000000b0030aee5e5cf5mr4968771wrs.31.1685937490193;
        Sun, 04 Jun 2023 20:58:10 -0700 (PDT)
Received: from localhost.localdomain ([2.223.46.74])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c1d1200b003f61177faffsm22761574wms.0.2023.06.04.20.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 20:58:09 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	daniel.lezcano@linaro.org,
	peter.griffin@linaro.org,
	klimov.linux@gmail.com
Subject: [PATCH] arm64: dts: allwinner: a64: Add thermal trip points for GPU
Date: Mon,  5 Jun 2023 04:58:08 +0100
Message-Id: <20230605035808.594686-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.40.1
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

