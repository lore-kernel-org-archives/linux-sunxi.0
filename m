Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968681FA0
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 18:05:43 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso31030155e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Aug 2023 11:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258741; x=1691863541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYdoFc7rP2Qn0GrAVsnewk5f2j5o1yVoLkw8kbLJjy0=;
        b=r3Txk5RV5wSnvM9sUhJh/haq7s/rvtUErYBNeUGXZvyxG28S5pVHmusx9El8fjzzOe
         8d+FE5hPEyvs6E8G708I/QCAREgKXVfvQssxNDWoYgjFC91e/qQv7JPBnvHddK5GuU/u
         3r0ciKiuXdQpfn04ssBtDdwhkOrCPgF94itvMf4pV0ee8NBV7gE82gIDTSvSOCiCghQ7
         DI4HZoNJEaQGng6dUKIkv8kUoBRQu/+PB9b4/F6GIOnwnJ5Xk2uTAuT5jpxW0HoCSWc1
         RYStqJSmsIqGj464x8bUbin0bxRPm2TY5Cv9GtH1+nQoBAzbe6Y46Fn19RnmSOmP8Cdb
         pG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258741; x=1691863541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYdoFc7rP2Qn0GrAVsnewk5f2j5o1yVoLkw8kbLJjy0=;
        b=H7nxlnJvAxpAot7TzBMIjsAUBE8ZaaHDqQ4MJ1vL3/maUGeBsQ2zMiGdyVks0NZJmf
         FPdDrJId8iyQkKVu2WOfowkWyjUuBmoh6PNkRiPCcbQGdFeGGxtYHJ8YtGvz+CKy0y8Q
         vtxQU4u80WmsvYwmMg8KM6JYx24QkZ/IrSz/tg+FZ7F9SXBFxhHQ8y4srmabC8gI22Us
         RoknICi3hGzdcyPPz0kVp/BVbMVWVMHRpaPkR/DAHC7B/L816oJSQ0l8IS10BOdB/R1n
         9lczc9KiHdSrlVeipApAZ7gjyqAWn1AnQ2x/74ezwCf1r6pMo7xTkI1jSJ0X4U0W2wC2
         lS8g==
X-Gm-Message-State: AOJu0Yy3dhDRTNsO4leBAH5wAvNbdmaLENpTQg4mHM6fh3BYqXm3S8rO
	JNv7WUFeWT9hPLZRLWwgjZ8=
X-Google-Smtp-Source: AGHT+IEhVL7vlQWncytTyM/13d+OkFFEwfUKiR3bSl2fOgd9CDDE30po2p9SosJ2ijsdOWBwvqj4ow==
X-Received: by 2002:a1c:7205:0:b0:3f5:fff8:d4f3 with SMTP id n5-20020a1c7205000000b003f5fff8d4f3mr3949613wmc.7.1691258741186;
        Sat, 05 Aug 2023 11:05:41 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:41 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/5] ASoC: dt-bindings: sun4i-a10-codec: Add binding for Allwinner D1 SoC
Date: Sat,  5 Aug 2023 21:05:01 +0300
Message-Id: <20230805180506.718364-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner D1 SoC has a internal audio codec that similar to previous
ones, but it contains a three ADC channels instead of two, and also has
a separate clocks for ADC and DAC modules.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 64 ++++++++++++++++---
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 78273647f766..cd9e2ca5783c 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -22,6 +22,7 @@ properties:
       - allwinner,sun8i-a23-codec
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
+      - allwinner,sun20i-d1-codec
 
   reg:
     maxItems: 1
@@ -29,15 +30,9 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: Bus Clock
-      - description: Module Clock
+  clocks: true
 
-  clock-names:
-    items:
-      - const: apb
-      - const: codec
+  clock-names: true
 
   dmas:
     items:
@@ -103,6 +98,36 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun20i-d1-codec
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: ADC Module Clock
+            - description: DAC Module Clock
+
+        clock-names:
+          items:
+            - const: apb
+            - const: adc
+            - const: dac
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: Module Clock
+
+        clock-names:
+          items:
+            - const: apb
+            - const: codec
+
   - if:
       properties:
         compatible:
@@ -111,6 +136,7 @@ allOf:
             - allwinner,sun8i-a23-codec
             - allwinner,sun8i-h3-codec
             - allwinner,sun8i-v3s-codec
+            - allwinner,sun20i-d1-codec
 
     then:
       if:
@@ -229,6 +255,28 @@ allOf:
               - Mic
               - Speaker
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun20i-d1-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - LINEIN
+              - MIC3
+              - MBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Mic
+              - Speaker
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.2

