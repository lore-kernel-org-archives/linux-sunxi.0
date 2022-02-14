Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05297C99
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:26 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A488E40344
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873744;
	bh=3PF5Xzl5CoJdPD2v8HAB1YXbDg9KPu30U+G9i+xttCw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=wZUzjf1h10ZEhuV6OhDq+EA5hefm95dp5wTS7PqEwvUkArGb99Huv+HCgSS5vYi6e
	 k5qiwMkCCBW4Sk3YvutPnEyWIgukclT6wQNf64120K/WB/TWn2OX6ALVZ6PKonEZ0k
	 glWbB72bEzrPAfO3OhH5mLTHDxaLrs4SPX8imEBzcIqRyutABESBJCLKpSa4WH0mTq
	 F7usdvGT530EERP0amlsPTzTsWnvuqGeiXWXpXsGMnnAKrMCUcps75jXlSwfNWvvJ/
	 02BgwRqbiKcCZApD6T1y4SalMueCQed2IuoJ4OJAnsg5F84oXcznVEEKiQS6HiqUi1
	 Oq5KeH3O2FB8g==
Received: by mail-ed1-f69.google.com with SMTP id o8-20020a056402438800b00410b9609a62so2775684edc.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3PF5Xzl5CoJdPD2v8HAB1YXbDg9KPu30U+G9i+xttCw=;
        b=udOA3iK3G8LkhiyQXGHvJr2gTILBeSua9zXYOqJQS9c+KnSXCPmwozlDSJFTLIwnUk
         KSON3uat+gal/C8gXr4QhdgiUwtC2U6skUWUjPGdZ84oMP7hvZyles01k3iiBn6tmKLq
         q+W+Zivz3EKFIAesAUzyHRo4BJSDxyBbyHk95CBGlo8tWBzheUK6TF3bEv0KaYKnyvO9
         BOa3wDQ6affdc09zYl9oev4ppb1Ykjit2eqgq1GLd8C1mIXlMHwJjVM5Z+CYn6HePj/X
         igSJErV/yZUAXhGYCG1d0EtIeLi75/Z9uSeKGKj/wPQ0SrTSjezWR0YJ/6QaSNRBsFir
         k8PQ==
X-Gm-Message-State: AOAM532lQv2pT1DrPhB0DCr/2QoRHdiPMvPc0utXX6vhDCa6vBTJ81Y7
	OfvE27Pt6mnu54N+smfnbsyNLptj2GaB6ah5Q+0Rh1+BpsjsKEw96gqdnCCnGSa1v5aHkOyZkdM
	6NwdKHZd7BFE1wznx9kgAeGBGeK4kA1oKOaZUp9IE
X-Received: by 2002:a17:907:72c6:: with SMTP id du6mr574108ejc.204.1644873744382;
        Mon, 14 Feb 2022 13:22:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrvlFt0k7lzl0jdOoom20eqtUPJDSasKZZ5zI9SYLsZwz94svn3KccXpJhcfimHcBqD9IEPQ==
X-Received: by 2002:a17:907:72c6:: with SMTP id du6mr574097ejc.204.1644873744234;
        Mon, 14 Feb 2022 13:22:24 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:23 -0800 (PST)
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
Subject: [PATCH v2 14/15] dt-bindings: pwm: tiehrpwm: Do not require pwm-cells twice
Date: Mon, 14 Feb 2022 22:21:53 +0100
Message-Id: <20220214212154.8853-15-krzysztof.kozlowski@canonical.com>
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
 Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml
index ee312cb210e6..70a8f766212e 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml
@@ -48,7 +48,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - clocks
   - clock-names
 
-- 
2.32.0

