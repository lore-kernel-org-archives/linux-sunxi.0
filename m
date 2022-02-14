Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF737FB
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:23:14 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5D94D3F1B6
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826609;
	bh=RUrvha3jd75o7xb7qinVq9MRNe4Hz0+UgFNjZM5U/KA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MwFtOB/nEfHDWBMbfaet3rRGfkGMeYjtynHsOh7ppn2Xz+WwurZ1PVjDRwW+aNA31
	 NzLtt5h91kV+od0OAH+P/lSe6XSE9g4b285RwAgeSZbSpv5g2tpK8RoR4E9OF6opKG
	 xWUrdZGA0f8aAjvlByzZzkqd3s1V7k09B3mxQqChv45uknxAE5rqfBrQURigDo+LzJ
	 BlpjkzztZowY6m8dfUB4pZKY09x+rjHEe9gKRAV5ZqnUnbTeosyd1Uyq8Z3JlC2UB+
	 9VmOz14W3ghMpBO2aiZ3GFJLC8gX5k60QRmeqq0oEwCMhIp6vJ2tHAIDxx3WEbseup
	 7DvKQjsbTb25w==
Received: by mail-ej1-f69.google.com with SMTP id ky6-20020a170907778600b0068e4bd99fd1so5483068ejc.15
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RUrvha3jd75o7xb7qinVq9MRNe4Hz0+UgFNjZM5U/KA=;
        b=UyRyUj8UM1Ngo5KG9rLBWXqG/sM4mgjxIesrBLOLO8k6n7IOmh0hsyprbOx+KhsTfm
         78cZ8KqroMgnM1h26sbfN0tJjVc3HCGrLMr7mWPemwuzlOz5Sqy/0+Ew1XS3J62Ps3at
         aU/HEE774SpgP+zZvmaFMnD8MxKl1Sw1tvfbu57XG+j8JWBVVgZAgLH4VdGVlKIaH6AM
         rT8nYXUfyA+lLrYb0jvVENWaSRQxZHLjQavNHp1sjty/KTqyA5NrAboNRtCA+2p2ZteZ
         hlWW2Y3eOU6s7p2todbLFyegQIufBahPbRUWTgR8HXQgih2oLCVydagqegga5ShyfzC+
         Wqdw==
X-Gm-Message-State: AOAM532RRPnv7wn44fUu49E7xOb3CraO+Da+cern1+3qM3jLposBCrvC
	o3aK0uD+rO0uXOrP3017R5zP/CXHfR7l+X+WNvOJSXEu8ZFN0xuY3LxcShJep7h0B+RPdsXGSSk
	fB+X+lvubsn3VO/Bi+3iWRUBrwKQh/khvk/AHhyF7
X-Received: by 2002:a05:6402:2683:: with SMTP id w3mr14323030edd.405.1644826609093;
        Mon, 14 Feb 2022 00:16:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzkuxNo1QP+7t12yVjZD9t3Y/Itl5ApNf4frcHdZJDQgI3MTIUIYVP/fV2AVsdZ2EHF8ILcQ==
X-Received: by 2002:a05:6402:2683:: with SMTP id w3mr14323005edd.405.1644826608899;
        Mon, 14 Feb 2022 00:16:48 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:48 -0800 (PST)
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
Subject: [PATCH 06/15] dt-bindings: pwm: rockchip: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:56 +0100
Message-Id: <20220214081605.161394-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
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

