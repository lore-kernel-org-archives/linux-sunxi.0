Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36AF19F43A
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555566; cv=none; b=kYpZstPuaTGFIwZr2MB7t4lFGt9i/wTASLIgcQBlVNgBn7apz4sDKNv6a86zClkM+BE6F/REzGPSY5TP+l2pxOP+b7GSjjXDXzonsJiijNeKEvVSzblHwROcizbfekbx0wBEQXdpvbPoxUr4YPkRz5hhEdJ1DRHZFRtW4IFNKrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555566; c=relaxed/simple;
	bh=+dyKOZdFK0jZ1XO+OBIaaB4l4t8HcKQncpEBdDjx5Cg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2hym78vj3PHMNq1eZi7qPu3PNaiLizT89+tw6S42V8Wqk+CosC5+WmZyAbvRgUaPz7NViHB7f/JkHReJoD5pobrfcO/fa7td7DzvwUfadgJufHAF+9ayX93LCN15lcs0qJ5wU8aZccTGJixkPyWF3bPTmVayyHAIjpBWl+XOnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAe3GiqG; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAe3GiqG"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so226381fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555563; x=1752160363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lnk4S/ZRBOAWFeTLBV16c83HbawKBbnUkwVc1Pl3Jgw=;
        b=HAe3GiqGmQuxcWVOK2X/wXZmCBbzKZUDb4UWo3Rc9IF1Sj6Vfzo+pw80h2VeEnXrh/
         edBX8HUmzwKMDhpL+W0SF6GNGUt11+1RnrD7PXGV1JsCmyyt0fRGaIMN6fL0aBaQj8Cg
         oNsNNosdaGxtyW4HW996iUGW/feRcOvSxFd4AGru/8/mRKoBfG2gs3SHgYzo2W7CnHcu
         UtmnX7/r2jQZWaR5saD02oo+u1tkMA76Z1n+iAWxl4UKlvxgUxJPCkWl++/F3AJESK92
         X6rinqux/uiTfpN50BLJYRj6+wTJ1uge6dbvK+C/oXZ3Fiudd1p7W0+RPdtOqjhYddT5
         L5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555563; x=1752160363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lnk4S/ZRBOAWFeTLBV16c83HbawKBbnUkwVc1Pl3Jgw=;
        b=OLs927HzYMcgL90oEMajnn972ttD8awDFG0ptGdRTNS6Q/1iX4bd9Z/qVinQdNXmOG
         m35cJ6BVFgxf6mH3Eerb9awOa9EQMg+Pfo4wJy0sTpwvZee9+94W4kJIxBuWjpRyBchJ
         Ehu+498HW5KOS2mCVUS49DvhHH4mC1PmitaZ75nEoZ8878TAEmrtumeLuav5P3raxwar
         ltR4aBdnoB3jQRwJ2j83rtXjCrL6/vsKmks6ToTScHavtGBEYvOzKqkjWLVLECwnxyNx
         WJIG1VIDMx/GJ0CjBBI2g/Dr8iwYxSa2YffxsRbNqwZ3QcMF6mperBoobwCyeGixQaq4
         Hi7g==
X-Forwarded-Encrypted: i=1; AJvYcCXK60pQa0rSR1k4u8lBjIwCtcirJTff+PpQC8y/PICIXTQjHIVGYgcf5jCo0efi4TpxU1l0CSgNmzlIuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIIIE+frUybg1nHczoIHqjK9/49NQvFIMjkN3PsueFf3UVazBU
	Gim0mfBNtHV0R6azt5iTQfU1V3vIt9+N3UHMgYWFxeCI8x9uzkSh2Kxu
X-Gm-Gg: ASbGncupxl9Z07nptgfp8SftBz5ruuwuhZAPf15I59egDbpU2Ng9UUUOmAKr7MEpLQp
	yVhoREE2gOt0Dp8OI2uJZEgcojSnUB8VlKGJbro9OhQ2wROHEnvxWdFi0+LsqFevmBmztDYl/k9
	DzYArXfcG7Ug+o1YMsCfokNXHNJSapqFDEKRnvyyyvRHtmV0Zq/vYLx7bgjGw5DC6Ppk+AhnLxi
	9Mlw7pPVktMY+X22bKM3CoM2IXCK+XmBPEYNT2TE72IT9/FcVsd7G6XF7+W3dKYr2lU5Ar2aDi2
	kZW6TlDeIs03Keh6E4aBfzmQglTaD+7fiUTmEIsHGsacILa7EnaXttos5slEFPtUT+wpGT4=
X-Google-Smtp-Source: AGHT+IE4N9EPjYoVrJU71eRGRvfZjYij50QTT9ow8waF9KaIqcuDsIxMjitoZssy/2WBO9PRt9Qedg==
X-Received: by 2002:a05:6512:3d89:b0:553:2bf7:77ac with SMTP id 2adb3069b0e04-5562837286fmr2805513e87.41.1751555562586;
        Thu, 03 Jul 2025 08:12:42 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:12:42 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 2/8] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Thu,  3 Jul 2025 23:11:26 +0800
Message-ID: <20250703151132.2642378-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
description of the thermal sensors in the A523 processor.
The controllers require activation of the additional frequency of the
associated gpadc controller, so a new clock property has been added.

The calibration data is split into two cells that are in different areas
of nvmem. Both controllers require access to both memory cell, so a new
property nvmem-cells has been added. To maintain backward compatibility,
the name of the old cell remains the same and the new nvmem-cell-names is
called calibration-second-part

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 49 +++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..80657435a 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,18 +24,22 @@ properties:
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
       - allwinner,sun50i-h616-ths
+      - allwinner,sun55i-a523-ths0
+      - allwinner,sun55i-a523-ths1
 
   clocks:
     minItems: 1
     items:
       - description: Bus Clock
       - description: Module Clock
+      - description: GPADC Clock
 
   clock-names:
     minItems: 1
     items:
       - const: bus
       - const: mod
+      - const: gpadc
 
   reg:
     maxItems: 1
@@ -47,11 +51,16 @@ properties:
     maxItems: 1
 
   nvmem-cells:
-    maxItems: 1
-    description: Calibration data for thermal sensors
+    minItems: 1
+    items:
+      - description: Calibration data for thermal sensors
+      - description: Additional cell in case of separate calibration data
 
   nvmem-cell-names:
-    const: calibration
+    minItems: 1
+    items:
+      - const: calibration
+      - const: calibration-second-part
 
   allwinner,sram:
     maxItems: 1
@@ -107,6 +116,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
@@ -132,6 +142,26 @@ allOf:
         - clock-names
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun55i-a523-ths0
+              - allwinner,sun55i-a523-ths1
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: bus
+            - const: gpadc
+        nvmem-cells:
+          minItems: 2
+        nvmem-cell-names:
+          minItems: 2
+
 required:
   - compatible
   - reg
@@ -176,4 +206,17 @@ examples:
         #thermal-sensor-cells = <1>;
     };
 
+  - |
+    thermal-sensor@2009400 {
+      compatible = "allwinner,sun55i-a523-ths1";
+      reg = <0x02009400 0x400>;
+      interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+      clock-names = "bus", "gpadc";
+      resets = <&ccu RST_BUS_THS>;
+      nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+      nvmem-cell-names = "calibration",
+             "calibration-second-part";
+      #thermal-sensor-cells = <1>;
+    };
 ...
-- 
2.49.0

