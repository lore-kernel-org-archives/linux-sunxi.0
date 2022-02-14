Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25057FD
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:24:18 +0000 (UTC)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 347B04051D
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826613;
	bh=3IKrMG5sgA9nuG1n0JrwWMFi9IjPyF8pWWijGFM2qQk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=i79I2qa47alM5wkWj2yK0klr14FGqox2CzMSWnj2Lt2l0NlRGUoS7wFRAGkR4HFVN
	 XVCOHVKhvOfO7U33kG8pHvmmR6xdQzoCtVYiKrFQingC2luIidjo918UqTkgG5Xcqo
	 /eZB4cy1UkXHSGL/9b6laxvTd1QX5TUauviCdV336gKWT1wdNBlMDcCjYFdJu3vwry
	 T/cRrE5EGAt6WQHAbHrOLBzEZsoUoDPJ7PinBq7LDbmpzIFoq5GBxQhR3thQ+rcGRu
	 sNQC6blE9BU4JQfQa0Y9q2qgn7S/pZ8v2c3TJGOvi5JVQ//Xv95aM06jzN0gdS6Bfy
	 /jfsT9tDDw+Dw==
Received: by mail-lf1-f71.google.com with SMTP id u24-20020a05651220d800b0043f923edd9eso4965127lfr.18
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3IKrMG5sgA9nuG1n0JrwWMFi9IjPyF8pWWijGFM2qQk=;
        b=jUfrI2u2m1R9L8M0hdxWrb2CGWwTBRFZG+rWJ6xkbs2iMBXC0sCc3lRZ3LIVRduyWr
         VwaC6pSoZvkMdhBQUPoTqEnwt+BK2vop6STGq2Q3aIrtfbjFWZMzYABeE/ZSx/od/yH3
         wkpc+2j/NRw1GID437/7mY2lhpJMtH/8/V2E8ZfPLgqWwtEbOc3zjbfWlIcCp69aMtyd
         8D56ZaFcmFrNMbs5VffQf0dfauXI8AYvnnEoq9TMNEgumcBLI6yM8h1k4fo/pVES9K4p
         PsPciEN5xS3CG2/ERYgbTCYoyGP/r6MkxWIlYd9/qUO6cn6jz5gcAyLv1HZyf5lzVE7j
         Qr4w==
X-Gm-Message-State: AOAM530GlMHXku4RfOwLTxqu1RUHJdFlcE1MCsB30zeENnLX8X+0Xx5x
	lvtHJKlIL8MYbiZuxghWrHQbDUonVZRgglipmf5QvpKN7+UTMgL0ccS14B+TR39crTp4pgttxWT
	cUbQXUbQvM1UwJ+KDgGg4UhBp4W+ToSEYmj5HLFCK
X-Received: by 2002:aa7:c90b:: with SMTP id b11mr13704759edt.378.1644826601902;
        Mon, 14 Feb 2022 00:16:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgHjuUJhQbPl50s1KVPp6UQx9W5/7E84exEe5joEuH25s16vRC22QO8sTEVBDCljC9Ui8TEg==
X-Received: by 2002:aa7:c90b:: with SMTP id b11mr13704730edt.378.1644826601747;
        Mon, 14 Feb 2022 00:16:41 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:41 -0800 (PST)
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
Subject: [PATCH 01/15] dt-bindings: pwm: allwinner,sun4i-a10: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:51 +0100
Message-Id: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
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
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 53 ++++++++++---------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 800d511502c4..e93e935564fb 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -52,33 +52,36 @@ properties:
   resets:
     maxItems: 1
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: allwinner,sun50i-h6-pwm
-
-then:
-  properties:
-    clocks:
-      maxItems: 2
-
-    clock-names:
-      items:
-        - const: mod
-        - const: bus
-
-  required:
-    - clock-names
-    - resets
-
-else:
-  properties:
-    clocks:
-      maxItems: 1
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h6-pwm
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: mod
+            - const: bus
+
+      required:
+        - clock-names
+        - resets
+
+    else:
+      properties:
+        clocks:
+          maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
-- 
2.32.0

