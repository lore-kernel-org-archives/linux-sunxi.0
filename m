Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08417C8A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:25 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C768C40337
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873743;
	bh=rXTrjGyqcJ3i7iMn5DJq5QR/kPtoX00uoKdkO1EvWnA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=avnyN02uYJn1eRXlZJdh5sMJmMJrC2cfTjdAFrWoyR5VlFVgcpHRY4NLK6YRohBsy
	 4LhJTTX8C1DxA40JNipmWw7s3+eBmyzYCDUmlEHPOofG1kmhrUEZMX/S1AlXVe9QfB
	 gWEAQHMG6GqDP58ugu7Mqp9/jBDHmHF6NCahqDUN4xTkiWAS4fg+Vn9Hcfb+wz8jAs
	 Rfh7wXT+ofdCeLvJmGbhY11bmh7j53swFtPiAMgllavlLh/g0L9+4Gvm8t2WdNKmA6
	 aIH0fZxEWsXeH9F8Nn1FzUGwDSKt+gi0b1zeNE2c8Fmy5+MHlawceiWkE+Wsf1WTTw
	 GyWY6PKxTWb/w==
Received: by mail-ed1-f72.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso11091881edh.1
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rXTrjGyqcJ3i7iMn5DJq5QR/kPtoX00uoKdkO1EvWnA=;
        b=OCPHdxyZ8b09qPIanFO4Eu5Agrib1igzB97bJIbsOCYbfaL1aD4/1BpkqFlGwPE2bx
         WMuZhZUeVLl61GB4z8YY/VXLtwWG0nybKkFIEK/nYjLRb6YzYPBQsJ+s5tfAxLaR3Iqr
         pf1SoyoxFBHCP4L3WxpUGm5F6djzzoNfNyLAxzLjj6T/njbX0MtLx4uY6keD4NMBBjFK
         70ZKtnIiwkHFBleyYUqBPLiSR1P0wBzIKboIVHMA8Bslh31UPfVEY3TPPxHA/VVo40Bn
         WmBA+5vVLS//uN725jHcbNMobFb4zrvFh1UtvNs3H8fZFqz9Kmj9Mreb2isrvEi6JFJt
         zhdg==
X-Gm-Message-State: AOAM532tEfDW5hI2TBtky8/DZ52VsxL1G4kERJD/wRn2KXW7Ej8/S4SW
	hazBBiv/7nJsZEFKEhNHwk2Q/zdn5PYOUR2xpfgvwB0N5b319W73b5vbKEHcOyI2OZcJ7BvaxbC
	SD5Ru70IhGfYbkLCZEGwvfFnV7/i8l24CUAoCFEp3
X-Received: by 2002:a05:6402:34c7:: with SMTP id w7mr750380edc.397.1644873733089;
        Mon, 14 Feb 2022 13:22:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhpmbRreV1af3l7NRnMOVACbyZVoBFnimePwQQgpSt+JN3lhtVVBwqSExQGXUXAJA1H+Jnfw==
X-Received: by 2002:a05:6402:34c7:: with SMTP id w7mr750338edc.397.1644873732938;
        Mon, 14 Feb 2022 13:22:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:12 -0800 (PST)
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
Subject: [PATCH v2 08/15] dt-bindings: pwm: renesas,pwm: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:47 +0100
Message-Id: <20220214212154.8853-9-krzysztof.kozlowski@canonical.com>
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
---
 .../bindings/pwm/renesas,pwm-rcar.yaml        | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
index 7ea1070b4b3a..1c94acbc2b4a 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
@@ -59,21 +59,23 @@ properties:
 required:
   - compatible
   - reg
-  - '#pwm-cells'
   - clocks
   - power-domains
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          enum:
-            - renesas,pwm-r8a7778
-            - renesas,pwm-r8a7779
-then:
-  required:
-    - resets
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,pwm-r8a7778
+                - renesas,pwm-r8a7779
+    then:
+      required:
+        - resets
 
 additionalProperties: false
 
-- 
2.32.0

