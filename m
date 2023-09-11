Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B543E11716
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 14:10:13 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-27405bafa2eso838678a91.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694441413; x=1695046213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TG+QQTyt98Cm72ivgjgEOlvbZ6Se1TfTAJhHJ/imZoc=;
        b=MzgwtbRlJf++ywD1raiGWKY8pg3l7Y4H5MYJCGqiIlBO9HdbR9OLLtl9K/FiOZOmxt
         GxB3xEEHFsC7w0fYjliKf/oe1jBuqq/4xqQSYKmQQK/LAsplwU/qK7gmji3My+uwyz0B
         C3RJfgCYbX4Ohn+dmDVmzraZ+uFjpIg9ap0SMQQ+FRLz+/vpYWojXiogmYZiXcJT3ub4
         8NCyP8772AXEJ0puy9ZZELDRUT67zDl0Q55qZx5BWXtAqFZBTiQOeGUJStdzv+XAwLf2
         jBBWFIW2n50qYTmygveHehtZV/6VFrXmD7i+29YkIvarV9QKX/T+9y1k59BhsompH7Uj
         qmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694441413; x=1695046213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TG+QQTyt98Cm72ivgjgEOlvbZ6Se1TfTAJhHJ/imZoc=;
        b=D7Fv0a8jrBM29ebFfFTWUQg/vk7ddlPr1yO6Uj+CuyMndUAJ2GJtdmWRblr42mOz0F
         LAgfZeO8VdyH+v2LIIRFjo4oUuLqqnCMt/7oXurtX9BTl60vIpvLB4+MXVWFU7LX61Yn
         CbR12I1PM/OrGWDP6n/FUipCmAjVvlTose6VUeBLaqbevipGYxvhJSRM6vFYL/KZ74SF
         Vsk0RTepD9JFTruwilqYXYYR2Bgwj7SlBt2gx3x9Ywwx/1ktY8CdQUdSMfocQcBcGTqD
         L2b9Y2PeYDWAiXr9iT2LfeFfr2Xv2nkKpiCHhbgX9gn2ZP1wW8KeygDZZFXYjFN/DuPS
         ODtg==
X-Gm-Message-State: AOJu0YyA1DX76JKPPB+oHvGbs/b/wqZDhF+KWZzYSgAhnmhPkY5u2gsa
	fxVI2+CERvAqZSbAf9P1xW8=
X-Google-Smtp-Source: AGHT+IFT4CEbs6SG9WihA55ZqVVaa3LXFeCN3WNFsIoBVr7gxXea0G3VaJfy+znmNvPWvXDNljjNPQ==
X-Received: by 2002:a17:90a:ff11:b0:263:f435:ef2d with SMTP id ce17-20020a17090aff1100b00263f435ef2dmr7794285pjb.10.1694441412732;
        Mon, 11 Sep 2023 07:10:12 -0700 (PDT)
Received: from LT05.. ([165.173.5.104])
        by smtp.gmail.com with ESMTPSA id mj11-20020a17090b368b00b0026fb228fafasm7509866pjb.18.2023.09.11.07.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 07:10:11 -0700 (PDT)
From: longqi <longqi90@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: longqi <longqi90@gmail.com>
Subject: [PATCH] fixes the pin settings of two LEDs on board nanopi neo plus2
Date: Mon, 11 Sep 2023 22:09:59 +0800
Message-Id: <20230911140959.2046340-1-longqi90@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: longqi <longqi90@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index 4c3921ac236c..0cb7a07ab1de 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -26,14 +26,15 @@ leds {
 		compatible = "gpio-leds";
 
 		led-0 {
-			label = "nanopi:green:pwr";
-			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
+			label = "nanopi:red:pwr";
+			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
+			linux,default-trigger = "default-on";
 		};
 
 		led-1 {
-			label = "nanopi:red:status";
-			gpios = <&pio 0 20 GPIO_ACTIVE_HIGH>;
+			label = "nanopi:green:status";
+			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 */
+			linux,default-trigger = "heartbeat";
 		};
 	};
 
-- 
2.34.1

