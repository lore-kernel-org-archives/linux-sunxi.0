Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2B07A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:17:04 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E0A16407DF
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826622;
	bh=rXTrjGyqcJ3i7iMn5DJq5QR/kPtoX00uoKdkO1EvWnA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MuyXrtTBezenmQOpGHu0scWq9s8WiwuUC49l12P/1PffMXLa8PJmPplMZDQKF0hkn
	 ycP2ksuHgca5FyddP8wsTebWe/ahtOjRpU+mbfkHbl2IjmoSVKci8CiT9dyv5RvXbW
	 UFzc16ZV81BZ1Fu7rfc3Jof0T57ZIQW0238VbfUZPYqqgfcY4J49ObM2qzbFDhfA7X
	 voh0/8lkV/X1zNb/8JXNdTdQLOafhyOac3qN1+t9zq3JTNWMsdb22QbfAaPVZdxI47
	 0mzanlwXNA6r6XY1GsmpKnCgJuJ2YLKmfjoa7DzciZ9mxXWRk0aMIiv+YfkQhq+BMO
	 UpNDKrAtWQ26Q==
Received: by mail-wm1-f72.google.com with SMTP id g22-20020a1c4e16000000b0037bc7a977b3so1436572wmh.5
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rXTrjGyqcJ3i7iMn5DJq5QR/kPtoX00uoKdkO1EvWnA=;
        b=Qbk3U3cIvqO4fubq9rRFz6hqvIzXkEdgbs7GRs8S0jwVsyHBs0yFi3p3sZNbU5tZuX
         SZfMCT9F0d3UZ7oteBhSLvrXrQGlPfQD1WabgFoSfcvteWN8ynxP0v48s5aXg4BaIi4A
         7Nwk8t3ngzS+eumtlb4CVGBTO4i8zrVUJIS7QJcG+D3353qzPjMBu6JymHEFgvj1GEuN
         M2kc1N7RjyG7vqnRJywSnp2w8uZUF3aH8IxcQEHDkgFID+/7nunWTndMcRBbYn7TKscb
         4c0DDerzLdGEjxqE8bMvwbDjFY1pdp9SNbRezt6PINW0jsXFZC8yEDlHwya8vNDQRTOd
         kk9w==
X-Gm-Message-State: AOAM5322pVToFE5kPCLEsbjMuQoe122emCOZVdRAhBAhhLjEyBkvRkyB
	qishfyfTmJ2ivVu5fIhaMPBJApdLhHVQOCIIzkluU4jpqrTlVQez31CvjAdZOBuBH3zvm6fERut
	cnS7dv1tdibLHRkK+5DEeI50eDt1OdO9A0vmoycVB
X-Received: by 2002:a05:6402:c1a:: with SMTP id co26mr8160853edb.442.1644826612061;
        Mon, 14 Feb 2022 00:16:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS9jQ9wGixoRtv+jL2Y9f4opmRogKX8GhZRCH8lW8x+aJuR/wbCf92drFjmIbNOrRWeCUm2w==
X-Received: by 2002:a05:6402:c1a:: with SMTP id co26mr8160813edb.442.1644826611896;
        Mon, 14 Feb 2022 00:16:51 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:51 -0800 (PST)
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
Subject: [PATCH 08/15] dt-bindings: pwm: renesas,pwm: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:58 +0100
Message-Id: <20220214081605.161394-8-krzysztof.kozlowski@canonical.com>
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

