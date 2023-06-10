Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF792564
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 20:42:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f7378a75c0so21262145e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429768; x=1689021768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hJFlrCte5GBR7MpsYIzaf+ErbhQyTaUpl+j1hGve08=;
        b=hAGLVXUPDF5zyNI17sP6N86ZIevxQyBN2PRxHG+BXQcTj+CJCRxJmBXJWVIbW/RGox
         6odcZPSmqTpaMgwsFcFJA9RpPKihrTA5F7KLJH5TuI4s0QlMpeRaqtUggy/0Zk43ofWH
         4gFihZMNwpaJyZmr+Kbb4Om4g0+yWemPhiw63/x1JMLepoFwqvccLGfhm+/cYoEXbf5X
         c4iSVQkbjRkUk1QWP4RbME58NEhBcUK80MKaq+W73JlPlGdTox3d6CIE/m/HXZdetro4
         UkwHDWB1djzvqd60Xekl0NenCKkppmD3ifKoAzCdGL0MoYqEHcPopwuW3AOcNAtV85Dr
         VMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429768; x=1689021768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hJFlrCte5GBR7MpsYIzaf+ErbhQyTaUpl+j1hGve08=;
        b=Dwq9nxV/GcaTyAXjRU9nilgulNC6+/xRlPnNtIVkssNOqhmdzyGbCVKHDHBW7qoDHS
         hxSuirbpIsAS24yWWx/oCaGvrq7BT5yJACUUJdI8moGzIybMwK9bP2RchyfsBRlFvwM5
         9htHbnn5UFJw4J/LtOGArhkCq0OaavBIl6pYqaMXYS0b3V1ZMwHH6CQSug0PFkQP8Ok+
         9xOD7dDqB4/4RqIPHVtQbDC20eHAs5SuMR1WZA5kWINEzttIM+bY5kDU1EaXAgi6AevA
         In+Y1fFuE4xyZD3L92AQPw/MnlYIvMvsFtU0BdQTCPyAW35JN9u+DT6YLG4eB9RG4qzc
         Ts0Q==
X-Gm-Message-State: AC+VfDx6YdsOIdHh3XLNsuzVmcjk0haUbwqLuBT+QPoAUwG33kvRBXJN
	EE2ZQ5Y18uUq0Flh6piCCs8=
X-Google-Smtp-Source: ACHHUZ7VpOD/P9K1c9pzM/fet25ba5bKHkDD2WlG/ssQv8LH2i8o061I1aGWlrW6vmqAo8m/dVIn3g==
X-Received: by 2002:a05:600c:211:b0:3f7:ed1e:5a21 with SMTP id 17-20020a05600c021100b003f7ed1e5a21mr3426704wmi.38.1686429767895;
        Sat, 10 Jun 2023 13:42:47 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f605566610sm6547733wma.13.2023.06.10.13.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:42:47 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Sat, 10 Jun 2023 23:42:18 +0300
Message-Id: <20230610204225.1133473-2-bigunclemax@gmail.com>
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

Add a binding for D1/T113s thermal sensor controller.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
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

