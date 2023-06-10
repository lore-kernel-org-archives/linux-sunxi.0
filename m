Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2C320FC
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 20:36:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so21216125e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 13:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429375; x=1689021375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsgeyxXBjiNCCbFnpasARFFtGQuGGzV0SKK6yZWlTDw=;
        b=oUeElQHhNEZYn7UmTCYVdAIuxvdnK05pup+LGf26JjI6Jtiz54aN912t5s9bF4NOfq
         BHjhJ3iZIVcn5/NxcOH0qvw6+6nLxkEm3dZ1xkxTlvq/C2Us/uPLKAb8FdeQq9ee/rjK
         yhkh8aL4lbbNruqdQpM4nooNdEBcx05Ndk3kUQ9vKn+/jjFeBaOuyaABt8OlOEm3zyaq
         gIOkK6ekJgZIw6qbuNDrvFD0153UCmIpIcz3GW9dJIVSUPiODl+d0ZeFZPIZz3jVEfFC
         BDisGdMneISNyl0Vi0cXnGB9JExaK0L3EzNF6A7S5dAS33f+dRTMd7rVzGZUK7wZzHLf
         IJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429375; x=1689021375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsgeyxXBjiNCCbFnpasARFFtGQuGGzV0SKK6yZWlTDw=;
        b=UZ7rhtokQA9QKPx2t5imRIUAgg8bZiGERfHP6GPuCEMlwOAR4Ksk73iP9MvY1Vh/4h
         bcjPPTmQrItxq7mTB1uki+HUt/Wyck3kefEpK/pRXuz+gq5W5bViJOQXUmDN65LtD/3L
         JOIQExSIheuKpQNHayQe0JI7fhynVfhBrE0L8re9lhHyXZvh2TH8oCZSEfgD4bkJH8Ea
         sNHyfO06yRq92tSsAY6Y/VooQ4U13wgFT3bv5qx93Qk875R560C3ZgI8lFp8hrPV3jRz
         Sx51M+G4Rkpb7AoE2VuZg3AM4cJQfOjfPJn1cvhW4SgcxDw2ivfsDXcLzE9brNmfe6ix
         XNbw==
X-Gm-Message-State: AC+VfDyvpvkCa5dJbSYL12G4ODaZ2bgjLYpBrCfHLB9YwvJW4BmXMJgx
	CmOkh4/a0Uoc+50rSdippyU=
X-Google-Smtp-Source: ACHHUZ5Nsi32LCrv1wkY3Q1YnwLUja35YD1C06qrqpyjQaRiaaIadIbfPyOvjjEdr7k5omq1qnotNw==
X-Received: by 2002:a05:600c:2144:b0:3f8:946:115d with SMTP id v4-20020a05600c214400b003f80946115dmr2992226wml.30.1686429374960;
        Sat, 10 Jun 2023 13:36:14 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003f42a75ac2asm6572867wmc.23.2023.06.10.13.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:36:14 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Sat, 10 Jun 2023 23:35:42 +0300
Message-Id: <20230610203549.1127334-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610203549.1127334-1-bigunclemax@gmail.com>
References: <20230610203549.1127334-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Kiselev <bigunclemax@gmail.com>

Add a binding for D1/T113s thermal sensor controller.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index fbd4212285e2..001faa37fc27 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -16,6 +16,7 @@ properties:
       - allwinner,sun8i-a83t-ths
       - allwinner,sun8i-h3-ths
       - allwinner,sun8i-r40-ths
+      - allwinner,sun20i-d1-ths
       - allwinner,sun50i-a64-ths
       - allwinner,sun50i-a100-ths
       - allwinner,sun50i-h5-ths
@@ -61,6 +62,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun20i-d1-ths
               - allwinner,sun50i-a100-ths
               - allwinner,sun50i-h6-ths
 
@@ -84,7 +86,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun8i-h3-ths
+            enum:
+              - allwinner,sun8i-h3-ths
+              - allwinner,sun20i-d1-ths
 
     then:
       properties:
@@ -103,6 +107,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun8i-r40-ths
+              - allwinner,sun20i-d1-ths
               - allwinner,sun50i-a64-ths
               - allwinner,sun50i-a100-ths
               - allwinner,sun50i-h5-ths
@@ -159,4 +164,17 @@ examples:
          #thermal-sensor-cells = <1>;
     };
 
+  - |
+    thermal-sensor@2009400 {
+          compatible = "allwinner,sun20i-d1-ths";
+          reg = <0x02009400 0x400>;
+          interrupts = <0 90 0>;
+          clocks = <&ccu 0>;
+          clock-names = "bus";
+          resets = <&ccu 2>;
+          nvmem-cells = <&ths_calibration>;
+          nvmem-cell-names = "calibration";
+          #thermal-sensor-cells = <0>;
+    };
+
 ...
-- 
2.39.2

