Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461B171A4
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 14:18:22 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30ae61354fbso1822278f8f.3
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686406700; x=1688998700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsgeyxXBjiNCCbFnpasARFFtGQuGGzV0SKK6yZWlTDw=;
        b=Rj0iUZ2JsSMmbPNyoSYt7fdUnvvw9nf6RiHw08J+SEcYgRC/iwFSL9KNJbdd3Q+zbM
         UBC8+ntx2FCVoagNvELVpTs8l6Xir7IwKaGrdYAIL0tJ+fAMzpdzLg+iKSGjxj2bZ2uU
         2f+F9WMXgjBEbxxuWGWFMLjBDTjp+V5nkv501v7Ycyd/wQt8N5AgIehxPmoK+m5G2bAD
         PBFsI5EgiiElObE7IEWbHxZrIKS1DsOwjT7UsMlDwOKRZBInEZW3GEkAqGjPoFNRdooa
         /zPO+XaI3R+hFQtPY4OKj/DqUCFEdXfW+jvnYs9CznNbNvrEbmk27jmbHFW4IH67tYDV
         luFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686406700; x=1688998700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsgeyxXBjiNCCbFnpasARFFtGQuGGzV0SKK6yZWlTDw=;
        b=MPlZYQieoHrBreuw+NyxEWxmQuvVyHuYxu8gDWSju+mMVGAb7WKNDVxp5bTcXVf6mq
         zOsATo+ZyXhclhGmPSwIHs5TkuTD3E5ZfNEYu6vKotc0NhCqCWJX1lzr87ACHr+wBJTK
         1h9BUw1C4a7WnvfY/12r3KWjtOaavOC/qGVfZftAyo80lC1/KcE5Ze8GFpBnMNXnB2fU
         g4enm3fNrBxRC6OU5rjkSdULPIo6CCIczkkRfXDOqXQZp/S4K1epEb2Dy2hFddrA2OTo
         sGfMHcLlNdXg7rUP5aZGTRYqmGc9VLfXbEoyJth5m1S0HvWZVu3wekbFIz/nIfpiazW8
         K8FA==
X-Gm-Message-State: AC+VfDzWs98vgzbe19EHVGeJBKRFUBYiyMmGORFEarpFw8hlJHPKG5gV
	XHJQ0uKbVh04eZEpnvkcwZw=
X-Google-Smtp-Source: ACHHUZ4vkkb5KY+PTVEJLFWo4HPZMMW0IRT2iCexNNKegDN6VCG+CWKglNTWFqypntcWouyqTLcFrg==
X-Received: by 2002:adf:f886:0:b0:30a:f0d8:e32e with SMTP id u6-20020adff886000000b0030af0d8e32emr1127222wrp.18.1686406700522;
        Sat, 10 Jun 2023 07:18:20 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f735d6fa74sm5841488wml.9.2023.06.10.07.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 07:18:20 -0700 (PDT)
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
Subject: [PATCH v1 3/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Sat, 10 Jun 2023 17:17:34 +0300
Message-Id: <20230610141739.999268-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610141739.999268-1-bigunclemax@gmail.com>
References: <20230610141739.999268-1-bigunclemax@gmail.com>
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

