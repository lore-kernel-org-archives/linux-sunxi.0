Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7D1261B8F
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Oct 2025 04:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761366735; cv=none; b=QUKIpBCgz9t9IZqpw6OTx9zQVnzlVD7s+p83WOITaE/ecmxWdTWZXF0wxYO33OEdqW1vm+4iXJZiKOpD5Jbsoli8PgcOLss86ytL0Wxk0g/Vuad18ZIeAjqR1hhdPP3Q00vgUO9yuMihvnU3rzvvIdgg6l4xtZBSRFwriMUCNuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761366735; c=relaxed/simple;
	bh=LxsKOmVaDzOSy8bwwU0rWY43UlPO4MkzptnRxF9FP4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JToJJcjltuNdjnOjIlNTFEmWZq7tBrWd6a+BKj1cSuUovnIovgISU7UIsen4XAC6MCvsk93BgKHNsExCYXqa3ZL8CTm/hvVjy2qN+kwg9OqjA4zukZdCXypw/bI6FFT0IDMWnMRay45DxAA0Lyvu5IUnU9nA1kAqsDW24qtamVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwKf4EmY; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwKf4EmY"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-378e0f355b9so15551451fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Oct 2025 21:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366731; x=1761971531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuZHP6YFsCwwA4TkyjhYi+XmEZKmSYURob9jZc/v+s0=;
        b=dwKf4EmYzHRokYeo01W6aRNiUbBxpqWukKoBAjKrsr21qyv4fvfvv8r8FC0fRGLFIn
         xy8cwnM77VLu80gvaYIoH/G1JbffxPND91EyaiFDMx7w57Dxf5fePgikVPhf4Pn1rER+
         4jhsW9zoF/8A5zNkYpRTOfhGhf+5cbhXzSScB/AHwJDuf21g0FrmGhY6Kj0o1uZx97yj
         T+DjkydMlva6JN/kFgrVxo9QorRJTmxGxC8nzGztwIhe3/7SZyXdRH0fx2g22ALfJbnT
         DburLIF/ltWcgWJjgGNgfaphag5QRSHP9Kdy+M02Ddklj3GSwGmdpam/X1mU8m/hmOjI
         l4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366731; x=1761971531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuZHP6YFsCwwA4TkyjhYi+XmEZKmSYURob9jZc/v+s0=;
        b=eLieKkVbuKs5QzpnbsdagdDlb3M/gCwMWb6OHjkqMkKllnkkZcBOuFIs2z4F2aNhWF
         hGE3GpLXnTyJGHmFYlIhgBfa0uFSdqRyaVJ1ftztoMqzsJApSQcl3J85vlXmhaxDcv9P
         dc4L+j9kfMcWhuzTRRquG2XI3DIUU6yKjglIVuFxaxwiOb16dRVIYgbwutaGWaWM9O5b
         PXRTpardNscqaMVQ1/ySi7v+NKr82KqIJ+7ytFcBaN8+NpKzcNz69+Cv3nD6ZQdqQ0Fw
         YAm5qfK38uCG+3l33BT8YrGE9DO6afjpQOTAnMD01liLzXKsM0CEcAz45Rw999/KqXM4
         LM4A==
X-Forwarded-Encrypted: i=1; AJvYcCUwLs2fM7HaxlhAWU7BD5ExNhfTL82d4RjTXcR6Ujfjh7YUm4Ocw2WdPisAoywasiTH8LR1+FSIFhYlJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9Ni57j6zw+LeRvPLnSpjFR9A0v6liH0x6hA5mLc5JWq2Mxpvk
	ZUQZxW/wpaDlMtA7MQurIsGO2FeHvpiQibchcLHbOh/Qs5WC02NHYOZD
X-Gm-Gg: ASbGncv/d5WTYflgJnIQvPegi6GU1YVqra0/pTvVWEoypB9pyonT1XQciAVRip92+yd
	UKNNQKEjqwTIvx9+gzlzOrZ1dH3gfmY88fKmzsVZplQSEVngisIIctIBUaIXBGcwMOr6jPD+lGs
	qG7v3xayybriBRPQJgr/Tfq1zG7e70yxiUi+vidGoQfiEDNbe5Ou0y0uAUz0bKoC9uGOJoYtX5g
	JJjU7EDkjTz+SEGGjflk2sRgzxG1DGw7qkcC5xDQSDRmDwFcv6aH1IdR3ZLLzE3/LoL97zbgGN3
	cTx5j5n97tOfXfJGX1fFIBhsVG1uvSMRA/WipDzFDQoiUKIwfpRt8Pqogc6lOFA66vjwazymhrd
	K+LtFERYYiwdSglrJlRCto9m0Bhihx0OmKerONNG1Phndfi3pnskc7/pHgRcsl/evmPOPjbmUJf
	0o
X-Google-Smtp-Source: AGHT+IHidqK20asSnkSoaYA0Ua+IEXaUMgtNo1d+OXf+4JbTCbl0aR8F8Cd5djjk9glXI6+3c84fFA==
X-Received: by 2002:a2e:a916:0:b0:376:4430:b545 with SMTP id 38308e7fff4ca-378e4648542mr13761041fa.49.1761366730866;
        Fri, 24 Oct 2025 21:32:10 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:32:10 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Sat, 25 Oct 2025 12:31:24 +0800
Message-ID: <20251025043129.160454-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025043129.160454-1-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
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
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 56 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..b2f750ef2 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,18 +24,23 @@ properties:
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
+    maxItems: 2
     items:
       - const: bus
       - const: mod
+      - const: gpadc
 
   reg:
     maxItems: 1
@@ -47,11 +52,16 @@ properties:
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
@@ -107,6 +117,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
@@ -132,6 +143,32 @@ allOf:
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
+          enum: [ bus, gpadc ]
+        nvmem-cells:
+          minItems: 2
+        nvmem-cell-names:
+          minItems: 2
+    else:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+        nvmem-cell-names:
+          maxItems: 1
+          items:
+            - const: calibration
+
 required:
   - compatible
   - reg
@@ -176,4 +213,17 @@ examples:
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
2.51.0

