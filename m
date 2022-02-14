Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90A3C99
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:18 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 84C7340338
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873737;
	bh=0Dk3kP2LcmOur99Xj+FmPMKKDcu6NdY88HV+BhS2v74=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=eFwOoAXLEYiG7vTg27HLDo75s3mWU3cJxFjn2l6kVIPZQ5nJSB+OEEBhtvKHB7Jhu
	 AiHEyIVSK0g4Me+sFluP+uoVEVGexnXngmORRPF63mGnEw5rYM3w5CNfvONtK5NhzW
	 Lic800ncXk9mKRNWqGn539fohtxEZ2pojPwUh74oisVFZpUrfsphPSLneh+OwoOi6u
	 lk1wB9oU/t0APi2YRbZ5Touef4DO+K+odBBc7Y9yYCGjQCfkwzsnLROsOK/OXXqxH3
	 PGBO/Apk9QXFeleYgupd3nIiqGJ5B8ks/LiStsB9vTGjbzWFmwqhZlXfKZMdb4HUXs
	 YqlyG756NRohA==
Received: by mail-ej1-f69.google.com with SMTP id hr36-20020a1709073fa400b006cd2c703959so6382004ejc.14
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Dk3kP2LcmOur99Xj+FmPMKKDcu6NdY88HV+BhS2v74=;
        b=7aM3k7nfnVdDTytJvphWoiER6aB5wltPIOzMxVLbYwC4Y3gym7iTAcvS+m3Ribn2bz
         Z+vvtF4uSURieMUhqS3rIhf5p56hn3kTU1tpwtl3b/DZtfHS2kaL1k2EmVXU2RWBW4mN
         MafsOVyN0GNEHqTmo1bVIpbOF/nyR/ref9Ii4Qt+mgdzE2FdjKaRH0WAtH7DWFoLCLKA
         YkTRAHXIjPyl6308T2eD6UU3iYthAZbcNqkmOAlt8YacjzIr+NCku+wlQWJZAy4cPjh7
         wraaUC0+Wh2yWYRYROLXEprbjya97eZquBqU+dcrBgKujUsFNtUUpeplFLRC1ptudx55
         wLDQ==
X-Gm-Message-State: AOAM530Vke4QuXrZzqbLi/mViWPPWkeG0vfbfZ0vk6WBtOwhHyEFEGu6
	gps1mAxht+T2E5GKkDe5nzvZCbT5tnVPxsmFbNHPV7o2tDPFoIB5IcnlSIuoowUDkAw+k1oeua2
	klQBPnSq7m4bCpjB5p2vM5DEgLqixrsruwG0sNy65
X-Received: by 2002:a50:eb46:: with SMTP id z6mr774721edp.229.1644873736960;
        Mon, 14 Feb 2022 13:22:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqQkxT5GkrKkpkI1jpRkimV8tYbLj7FNI3K2NGaV+hzyOeRr8raElR8r83H6B6TAN4ZZ/sJA==
X-Received: by 2002:a50:eb46:: with SMTP id z6mr774682edp.229.1644873736779;
        Mon, 14 Feb 2022 13:22:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:16 -0800 (PST)
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
Subject: [PATCH v2 10/15] dt-bindings: pwm: brcm,bcm7038: Do not require pwm-cells twice
Date: Mon, 14 Feb 2022 22:21:49 +0100
Message-Id: <20220214212154.8853-11-krzysztof.kozlowski@canonical.com>
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
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
index 4080e098f746..119de3d7f9dd 100644
--- a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
@@ -28,7 +28,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - clocks
 
 additionalProperties: false
-- 
2.32.0

