Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA2C8A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:26 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 304F44033B
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873745;
	bh=fQGwcHi8/nTW0SMwp6SpOvSaCBhZUIuzRLgVqfnHG+w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=IyAge/kNvQDRLP9/loC2G1xfV5l7KXYX5EsT4XeoilVmE/xXI3JrCXecGTskZipbQ
	 gmV80hnnxuBCE6Uy8z2KETIa2XrjYH3SXD+llYHn5CLHT1RifFaA45gPo6w+7pcR8d
	 Bt2r0iPCLIkJNBt97jBFxnrHvVVmEK1yGHFUem8H3K30d/eXPjxUf8N+o5BpNmqIiZ
	 WlOntD+vkF0WSL9m8hQmFTQv1m7AmrCeibIoMhuILMw8UED5teBcBs1ct3qXTWQPsA
	 T3X7NHks5b+e0+v6dpqcnHlvohHWprHXfYQjSvkRHROJyij0lx76TbIQYawFX5vw0R
	 r/Ibwx9o8S1DA==
Received: by mail-ej1-f70.google.com with SMTP id ga31-20020a1709070c1f00b006cec400422fso1419080ejc.22
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fQGwcHi8/nTW0SMwp6SpOvSaCBhZUIuzRLgVqfnHG+w=;
        b=Uz7+KoktMmZ42fMI5lcW4SRi/WGxxx6el/u1hgi3bmBr4XCnnVAUPxYqc63qxKvrvs
         wtPag+0hxwdpoh+LIZ1a9ttqZ7jEjLfFmRo7MZdU6Ny/VdOPronJxX38CaZKkLNJw1tn
         Otj8Pb5TZohpwmTB71k9AiQ+p8+wEWK3k/TrpI8bzLOY+hYxpYigktN2OteXAwnvjKdQ
         Dt3Bq9TkAG6tkC0KFY+8/H4XA03MGCi71UBRW4OtyHlBYKgPUZ0DHhM3CRYPaDi5gs4+
         TGgQdVRpQxgnimUDx4h4m0BestI4PV1BuRX5SZl+o5xDxDY5JQiycfJCx86Q8noTbGHi
         2s6w==
X-Gm-Message-State: AOAM532fRaiI7QN3dSwZigQhr0jaVoBYVyDswEq0Tn3r41I14P3tzIY5
	TdrTXipSE1N923hlymN4720bc/TyVPjdognCy8o9IlY/dtvcbsVulb1eQSqqj3aVknBnq5TfBxq
	mZdoiUBbcZxe9TBVpaCvQDG0bFVuAxg917j35DjSH
X-Received: by 2002:a05:6402:3687:: with SMTP id ej7mr784099edb.335.1644873734549;
        Mon, 14 Feb 2022 13:22:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIpInfMiZOfc9K2mvopmHJpGq7HGo1U79elFbaK9u9/4kmAeiVck7Mp6uIQadoSXhIA1gAlg==
X-Received: by 2002:a05:6402:3687:: with SMTP id ej7mr784084edb.335.1644873734367;
        Mon, 14 Feb 2022 13:22:14 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:13 -0800 (PST)
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
Subject: [PATCH v2 09/15] dt-bindings: pwm: toshiba,visconti: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:48 +0100
Message-Id: <20220214212154.8853-10-krzysztof.kozlowski@canonical.com>
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
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../devicetree/bindings/pwm/toshiba,pwm-visconti.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml b/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml
index d350f5edfb67..46622661e5fb 100644
--- a/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml
+++ b/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml
@@ -9,6 +9,9 @@ title: Toshiba Visconti PWM Controller
 maintainers:
   - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     items:
@@ -23,7 +26,6 @@ properties:
 required:
   - compatible
   - reg
-  - '#pwm-cells'
 
 additionalProperties: false
 
-- 
2.32.0

