Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC7FC8A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:34 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1616940038
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873753;
	bh=2GfdITO+DKwVQsf6qkFkxVmUjntYlwpPLBCNaZvP8rs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=m1X7d+8qIxx387qBBt7rW2xg0H+OgnDdwTWiLSPrKYi0AnyrU1n/NSJjqC4Ya6PXL
	 rKwHNz9JgE36D+uqA0Z7ftM9f9hTP/kIe8OaX+W6xr7P8ooxIK+SvarvVnbT4zC0Mg
	 lWtTeHfGGA8kcSk16iPMV5I46D6/RFa3yVgXthHab8rSqpNkWG3b8XGhLxR3nxHiVM
	 U92b+6juO2JgfiJfdg8FAR0GK2qjj27NY93JQAfKo5vCBfR3e+t/6PojfbUHxzIxCq
	 MSdi02I8jqMHVOJIW5n4eH6ATtECgKc++VhEPbjIbVBKXqUhuC42joF843Qyw1bprz
	 Rmr2wfYfCo4ZQ==
Received: by mail-ej1-f69.google.com with SMTP id 13-20020a170906328d00b006982d0888a4so6340908ejw.9
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2GfdITO+DKwVQsf6qkFkxVmUjntYlwpPLBCNaZvP8rs=;
        b=sDkeqXPpAoMkmckOYNccAgxWtRayJ+aRSw1aHw60GfeDb2/da4O68e+HK5E69ZCg74
         ZdkIrr8vOSE0+a/3dzpu+7puLl4uJ5q5KMv/z1GGDLJ5eOFlFQfRNBADbqn1aD6erirb
         vu+QpXE3u2yZUr5AjfXnVTQGuk/rLszlzRmqcpIP90gGBohysCbG+88HK5bHEOcLbKrR
         scn5HiPaTT9n1Okd9+Jdo9Q1zc+7XNWCm6wO395SOz1bKzX8+yhuUxSrSihXZyzks1Ix
         IBaF01qG8lTxTNhakeaq868On6fugkwAliNldBz5FtPYXfxdLY6YetDkJliIIluKlODI
         GUpw==
X-Gm-Message-State: AOAM531PAfZyGIFUKUxiAjPGff7DT0xxbrtL9k9Wu4U5SUJDRuoOnjZb
	OHIk+U580/hyN7XHb8KPHLpfGOwN59tKX9L7Ni3dSPT70UDnu6KMhI6U8V7aScEuhGqix5/xMWt
	hAe8nT28GOI1S4B9vcj+XtHFyEA6Xs9uVKPzTwyL3
X-Received: by 2002:a05:6402:518e:: with SMTP id q14mr795810edd.155.1644873742499;
        Mon, 14 Feb 2022 13:22:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxF3h26z/5uxDbEq+54Opag5L4k/zFtMBfvScttTAdV5Yv9njK8Ir/cF1x90gGCn8KuufGFTA==
X-Received: by 2002:a05:6402:518e:: with SMTP id q14mr795759edd.155.1644873742300;
        Mon, 14 Feb 2022 13:22:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:21 -0800 (PST)
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
Subject: [PATCH v2 13/15] dt-bindings: pwm: tiecap: Do not require pwm-cells twice
Date: Mon, 14 Feb 2022 22:21:52 +0100
Message-Id: <20220214212154.8853-14-krzysztof.kozlowski@canonical.com>
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

pwm-cells property is already required by pwm.yaml schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml b/Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml
index ed35b6cc48d5..3840ae709bc6 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml
@@ -47,7 +47,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - clocks
   - clock-names
 
-- 
2.32.0

