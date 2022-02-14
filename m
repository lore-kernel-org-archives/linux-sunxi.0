Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5BC99
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:20 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E034C407C4
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873738;
	bh=L1zH491qgS41n2AXbaIQ7HS33ONC7FahLUP0TNtgPew=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=g1peq0p9VsEjouTjRirFrNHgSuXPBgdyQFoaYBv0ajLmpDWPblTNVzCgJRN65Jsx9
	 NWwkjW5rXtyD76cai3BKwih44W9jDFcl6pY26ckRFXjQ8tACHNOB45K1A3Wj5Naxsw
	 MJFAv1WZI4JTrzkx5O3zA+BrAI5ZGgcd8ujxiEyWAT61anupJWCSMX9KymVLaOVL9X
	 j5NYgyeKTjnVFV6qU5RtHGQHw44hdOx1vdse+KV1vR/9WOcJNlsgpRGQVuJtHwUkNd
	 jcL8SjzrDT72KGIwtsGCT0tBsJwrZ+PTlnGf3HXsh9Y5+V35AzNguns5A+c+PtypAQ
	 9fKX+MST+qXuw==
Received: by mail-ed1-f71.google.com with SMTP id w18-20020a056402269200b00410b0a48d56so3264477edd.17
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1zH491qgS41n2AXbaIQ7HS33ONC7FahLUP0TNtgPew=;
        b=As/kpRHqTAHkIMy+b129vPXmzNs1ENHC2NjmFYdrS10EVyj9/YWvB9pAakLXt6hTVC
         Xuf2h1VToJnSAUbPORvAbXeblM7zYIwjEavAAXYS9yW+6BSOmLDv8luv9DniSZMUtO7a
         NAI/2CDDz4yukBeAvn4qFhVNlW1M6kzeXW34H0hMu+540/PnPcZXY7Xzzw2QiKpMZsk+
         XqJcAYhxoHhwcn6tRqYNv27hqsc04Xz5HSQAGEQlYHFIjHk3ekMKmIvntqhI9hvz0DGz
         0oOVyly1WOlPE2MOGgjeO9XrDrCdHUinfdQDa3gAGg0Ny9affU77Ov2JGEBfORm0iTId
         Ov1w==
X-Gm-Message-State: AOAM53190DInuXSu9m1mPX/UPCtg+LwmCJGprayHf9IkEN8Zi8F8MyJp
	lz1k3k8k4FRo9NsZzKSHGoKTMyLSCRQFotTQlHWXBMuaAWUYya3TPlTEdWnhW8enyw4Su3kAuID
	aQHni8z616zvRKZ1ja5T+EaeSGff2beTr2VJ0zocv
X-Received: by 2002:aa7:dd04:: with SMTP id i4mr764669edv.313.1644873738469;
        Mon, 14 Feb 2022 13:22:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYZT3hfmG99BK+ndmDIe3ewA0JwFYesWd9OClq7wO2HS/MuYgpu2ey6gvbQ4bbF24Sx8ij6w==
X-Received: by 2002:aa7:dd04:: with SMTP id i4mr764632edv.313.1644873738297;
        Mon, 14 Feb 2022 13:22:18 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:17 -0800 (PST)
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
Subject: [PATCH v2 11/15] dt-bindings: pwm: intel,keembay: Do not require pwm-cells twice
Date: Mon, 14 Feb 2022 22:21:50 +0100
Message-Id: <20220214212154.8853-12-krzysztof.kozlowski@canonical.com>
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
Acked-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
---
 Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml b/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml
index ff6880a02ce6..ec9f6bab798c 100644
--- a/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml
@@ -31,7 +31,6 @@ required:
   - compatible
   - reg
   - clocks
-  - '#pwm-cells'
 
 additionalProperties: false
 
-- 
2.32.0

