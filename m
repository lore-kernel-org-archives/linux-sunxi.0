Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A052AC8A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:05 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 19E76407BA
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873724;
	bh=Vx5pgZq+wTDk2cXNM++1rpL4of1cb6TeLTw59n/JqH4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=bmLRHw85gqw8wok9EReyAa+vURzmKNoVTAS1Gmmh0QXhzcY4HXzEGqpBSdjwnmpTl
	 CwuHKNJMV/NeIGy6Gbl1VT7MrcpcOT7e3buhCka08ugmem9W6Dh7wPZHbvbqC/E0Wx
	 MmJuzntmYz0UiMM27SIUYC4ux37SMH/B2OGsQWEkl/6s6yJ7Ac++SQXantgpih5LWO
	 j9kIWtBMWS8XHVTONkL/MNE3IYZox5OxVb33TwcukZLBBCLEJSpE4o/NjtRG72obH5
	 /MBDtvgYlkUmlV458eOJHUBuV/9s0Ai7PEO1fXjY0dxN8IYKxQa9CSDKlxIknmoOb4
	 cabgrUg8bSsxQ==
Received: by mail-ed1-f69.google.com with SMTP id l3-20020a50cbc3000000b0041083c11173so5720273edi.4
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vx5pgZq+wTDk2cXNM++1rpL4of1cb6TeLTw59n/JqH4=;
        b=dKUkp35WwxNfrVgmzhtw3gulTJRcwuNewl3AeFF/AUhwDPhJuXYUg6rKbHZK13UMti
         IvWz9g1qhaEHHXE/IXWBgvRQK3AupzXY7/ShQAMgtW7I2I2TnNenHUTavwj/ED3x4BjF
         aANBypl+6FUoaArjWavM+P34uV05lWy6DjWq20swNmc08srXwL32ENRCHapcPdHfzq6+
         Fz3Vf2MVy1WojQDlppYLeT2mTFXK0qTuQgxfB4SMzLAFuFNAbbUZ52kSSTsMDJN+kKwk
         NR2KOYh3X/r4ZgITotgYNJtcikJlZIUhYNlma1Yb95PbLMXxh6YsikhI5NtoxH70t/lp
         wODg==
X-Gm-Message-State: AOAM532sCJNrghCAInUWKgMOvqnh6e+eobHaK/G9/zEn076xGHAurQcC
	XUIaUbCVO0tqYm60FzPuBGKmHiwqJsM8DXGyRj3Y8MJN5bCiYB9TH4jLLFLm2MRBazJwJkyCAoU
	uWCQ8hO7eIFcKDcWKp2hYQ69srLqnkr8lqFssLWWJ
X-Received: by 2002:a17:907:d17:: with SMTP id gn23mr511688ejc.719.1644873723789;
        Mon, 14 Feb 2022 13:22:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn9EFz2R0CbHcclhbUA8j9QL+yRr4fQpPA+X8j3jV9fWd1mKh939ozog2RabglBFb1m4mDQw==
X-Received: by 2002:a17:907:d17:: with SMTP id gn23mr511652ejc.719.1644873723619;
        Mon, 14 Feb 2022 13:22:03 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:02 -0800 (PST)
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
Subject: [PATCH v2 03/15] dt-bindings: pwm: intel,lgm: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:42 +0100
Message-Id: <20220214212154.8853-4-krzysztof.kozlowski@canonical.com>
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
 Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml b/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml
index 11a606536169..59d7c4d864c1 100644
--- a/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml
@@ -9,6 +9,9 @@ title: LGM SoC PWM fan controller
 maintainers:
   - Rahul Tanwar <rtanwar@maxlinear.com>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     const: intel,lgm-pwm
-- 
2.32.0

