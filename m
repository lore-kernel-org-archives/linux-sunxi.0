Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89825C8A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:11 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 115FD4033A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873730;
	bh=fcG/L5ODzpr+LI/EAJmGBh5z8kctn/2OPAueI4k16fY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ZmSRjHB2IkArs1+3lyCYWfB5SbGzhC/YasYmAVZALW2QioKqGWo9XOsJfQlVgNvtg
	 o0UbWBXm9nEo9cyegCZ+RC/L9Y3Ombg1aDQDmDwCGvTbGAzOCRaPUcb8Ro38wyWNEH
	 eGHRy/g959Rp3BEa1ZvqYWsxQLHHN/iN//XrDsg3JNkFQcFrtcK6x+VJJuSYU/5WbO
	 VCi4mDEbtN8737/85Rto4M3Tww9PqO41yeiKirPLOl8oiUu41YhBxPDcurKJLpkks1
	 K1ydY1eolW3+U/tO9LhHHgZxCL4ddlB/qep1y4MhESCk55IAea/wTwLdFJ0ohNCBlS
	 7uNbloPPahbZg==
Received: by mail-ed1-f71.google.com with SMTP id n7-20020a05640205c700b0040b7be76147so11055110edx.10
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fcG/L5ODzpr+LI/EAJmGBh5z8kctn/2OPAueI4k16fY=;
        b=J5hxN/XubWK8hvUmRZMM/0a7AlOHKA4QkudSWAtaiXgny8IUXoAClyumokVzqKrnzi
         slZzxMPs7i8QN74ktVi6NwF3ck7swrREASanWI+tCRPNxtSXNu0MAb39B/YCHetFmKpn
         9Wt3/2iaD7sjE7WBuf2CnSuu6dFseu39F+XkPPQCdkmCU7N5re9oVupqdg9QM5LVPw+Z
         Fo4bS2X5EASWa0qfusVQoit75tU/ZsGSDWQkfDedW8rxSQX8zXDzGvz17itMVvEne7H8
         66PFBlPCRbqtmC9br1mH4+hbBEveT3DKCGFJaLFLAQ04iZ/LaFJ/H7AIPGZ4E0ZvHBV7
         JTBg==
X-Gm-Message-State: AOAM531cmbQ7SG31Oqaw7CCNh89CphPNNYqs3aHt3MGTgFpae6pv/rf3
	RbdOQrHYe2A4dEEu5jyguAeebJf37LVkxt19FOOKQzeTvD4hFJ429QAASWf4AsGdjgXcxMssUI4
	gfH41sgQ8aYsqIpzvvQgCXPsenwes1YOosHQE8Ex2
X-Received: by 2002:a17:907:1b24:: with SMTP id mp36mr543867ejc.519.1644873729726;
        Mon, 14 Feb 2022 13:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl9EVISrmS6C69YAe5K0Xxu1OTn1NN475W1VUcNCLsva3N5oY9yHZqeVlKnpSoM0+sjZgNNQ==
X-Received: by 2002:a17:907:1b24:: with SMTP id mp36mr543835ejc.519.1644873729549;
        Mon, 14 Feb 2022 13:22:09 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anson Huang <anson.huang@nxp.com>,
	Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
	Rahul Tanwar <rtanwar@maxlinear.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Yash Shah <yash.shah@sifive.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Vignesh R <vigneshr@ti.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 06/15] dt-bindings: pwm: rockchip: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:45 +0100
Message-Id: <20220214212154.8853-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include generic pwm.yaml schema, which enforces PWM node naming and
brings pwm-cells requirement.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/pwm/pwm-rockchip.yaml | 74 ++++++++++---------
 1 file changed, 38 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
index 81a54a4e8e3e..a336ff9364a9 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
@@ -51,42 +51,44 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
-
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - rockchip,rk3328-pwm
-          - rockchip,rv1108-pwm
-
-then:
-  properties:
-    clocks:
-      items:
-        - description: Used to derive the functional clock for the device.
-        - description: Used as the APB bus clock.
-
-    clock-names:
-      items:
-        - const: pwm
-        - const: pclk
-
-  required:
-    - clocks
-    - clock-names
-
-else:
-  properties:
-    clocks:
-      maxItems: 1
-      description:
-        Used both to derive the functional clock
-        for the device and as the bus clock.
-
-  required:
-    - clocks
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3328-pwm
+              - rockchip,rv1108-pwm
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Used to derive the functional clock for the device.
+            - description: Used as the APB bus clock.
+
+        clock-names:
+          items:
+            - const: pwm
+            - const: pclk
+
+      required:
+        - clocks
+        - clock-names
+
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+          description:
+            Used both to derive the functional clock
+            for the device and as the bus clock.
+
+      required:
+        - clocks
 
 additionalProperties: false
 
-- 
2.32.0

