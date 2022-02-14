Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860397FC
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:23:14 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3393A407C3
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826614;
	bh=11HYmRlx8dE2WpuAnKJ9eGJzYR6C7S08K2HSgZ9haWY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=WZvre+ZYzwd58Bw5kuYwf7PiKLVnARh/6YPLtryxyM9oy82mFO5nzwsix40K9/LsT
	 RUij05lgpJgdIhhHIuDruFuGRpgfzWMsmhbOLiDy1V/PImRvM0TG6JIk7IEQkimML/
	 +rI1Ti9CpRx3AABMuB3gf1Gd9bAsIgJhbyY6Keb+lY8tYK3RP1pjAArrEgCqTGFadd
	 QSZxlyMNtdtwt1hQHiw0ehbqP9TDaAkNeVDF4/UJPYtfCMNvnvGOEXmpPAfQEJ/7Um
	 NgdWKsxdgeFI5fhh51JtuecZttlIzfxGt1CJjSMHTZqMGfsPSVFqK0CIPFRjm9rnVi
	 N6mVYBDNn6PWw==
Received: by mail-ed1-f69.google.com with SMTP id m11-20020a056402430b00b00410678d119eso5338254edc.21
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=11HYmRlx8dE2WpuAnKJ9eGJzYR6C7S08K2HSgZ9haWY=;
        b=YCL/XjZuqtu8HBwujBwQTX4LtFk2yflqTdocA2b8PzVEZBCbPAm0raGgQuGVxpKh3f
         oJ6QYn9alwyP/rmwRxUv4usGXXH1SWndmPsVMJ2JvMau+BGTG98ECEXdxHNafUbeLeYW
         6Udt4kOO9/V2PLKRQgmGkawrHvKDhABSVnXSXb7LKFDGQcAGjvIMf490x/LjVBPdWVju
         NM5/cC2OpCBUZnPxkTBx/xJZpCOIzPMduhQ2jDTRA6QH0t7CgpiCI0Be0rINNIGVxC9O
         jy4trJ3DtoeaGclmUaVe5Seu3N3aPg7MAm4laGULgm3IJ+aljLg6UQx+oafhWUZMMVD9
         if0w==
X-Gm-Message-State: AOAM532dr+SUXEOxvDJHllprLnxHElh63FLZ8vcpwFmAns5x7RHRQwYS
	Q0VujgvOwQNIg6LOiDIl2SGIM5H9OcbJdmxJWlbm7iSDEaoVsd9dfYBR2ZfuZad3OU/jO5vsKyg
	V47oGvtmoqA3E37UO/2R99tVrv/u2ePpn3E/zie/h
X-Received: by 2002:a17:907:2849:: with SMTP id el9mr10391910ejc.201.1644826603259;
        Mon, 14 Feb 2022 00:16:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLuiFn010/+iYNxCh4N8RZLwAdqCGm9AdinTqIbutozbZK/206AXtZbT7nvgxN/IZXfSJlXQ==
X-Received: by 2002:a17:907:2849:: with SMTP id el9mr10391886ejc.201.1644826603108;
        Mon, 14 Feb 2022 00:16:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:42 -0800 (PST)
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
Subject: [PATCH 02/15] dt-bindings: pwm: imx: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:52 +0100
Message-Id: <20220214081605.161394-2-krzysztof.kozlowski@canonical.com>
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
 Documentation/devicetree/bindings/pwm/imx-pwm.yaml     | 4 +++-
 Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/imx-pwm.yaml b/Documentation/devicetree/bindings/pwm/imx-pwm.yaml
index 379d693889f6..b3da4e629341 100644
--- a/Documentation/devicetree/bindings/pwm/imx-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/imx-pwm.yaml
@@ -9,6 +9,9 @@ title: Freescale i.MX PWM controller
 maintainers:
   - Philipp Zabel <p.zabel@pengutronix.de>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   "#pwm-cells":
     description: |
@@ -59,7 +62,6 @@ properties:
     maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
diff --git a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
index fe9ef42544f1..8bef9dfeba9a 100644
--- a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
@@ -13,6 +13,9 @@ description: |
   The TPM counter and period counter are shared between multiple
   channels, so all channels should use same period setting.
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   "#pwm-cells":
     const: 3
@@ -34,7 +37,6 @@ properties:
     maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
-- 
2.32.0

