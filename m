Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C17AC9A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:13 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D7E4040516
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873731;
	bh=2POCSk/6TwWTazpis9hGbBMQ4KYz1OTALCTDWqaBti4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=knKyGqJ7tlaLE2HX706mIC0RydQqbXA4qeoYwwfT2S4mMSCjmy8GxzSujUBDg421c
	 fV4YU5QpGTbQTFqF6wVZKT2efbLMd+uGEBSL0cfMDzn4APifSBw2oCd2tjqBEPaXg4
	 Ha5TxWPJ4YprNQg+A4Z+ZdlaROrJpZM/PjaKclr8Wvv0ambRh29igTst1ZduEX3Oga
	 wBpkjmGeVX1/puvZBQ4M8RSGKWIntnvLUcsQsm8N+U7NYPnRZpxI6rXBvFVdd5KGCi
	 Z/5bAxWQUu4Si4YmrAGWFe872DX+vnmaCkacj6DFg7dWC4EHVnsDbtb09fjrtX52Dv
	 s9Q8GPD03h3eQ==
Received: by mail-ed1-f71.google.com with SMTP id b26-20020a056402139a00b004094fddbbdfso11087910edv.12
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2POCSk/6TwWTazpis9hGbBMQ4KYz1OTALCTDWqaBti4=;
        b=cwK953y5ZqTtS7Ic9lN3e7kzZz9Dz1dSX6Q6t9/3y/spbrnkUI7hRrYS3UAeyEWfEF
         hBfuRlQfBu+LzpQtXhYV/9O7o1QMUduqnrFd7EQOLiItlYL3et6we6g+Tcuv95UHoxWY
         VWdqZ+3H5hgmb5WhJhQ0HdBjknFVzvVpV84hUhNlv7/1Aaba6vXqh/Zwc27Su+3n0g3W
         O4i1HtdiXmAiUMnWKsL0IHy9U6ZxbwoXdqpblahq7k5HOzzCNkqE2oukCKp81SsxQYIK
         9U/NCa6QVL5gloxOOdCWhdrpwng2hym8RLOWTK7NZ/37ugr0ZIxBSGytPzwVX5BE44Ji
         IC6w==
X-Gm-Message-State: AOAM530ZNXMZYInMkOT3hOgGhuuIkNJXsBo7nmYGhCEOv8mSLHBTjvjx
	a3/oQDdINqHwwrU0Dw8L0DCOnqjubOR+ZMOZJeXs3Y8pfke5bovgayI+EKwmsUQcPbedbfA6IHQ
	qmlaD0f6Z74+txsnGCJsNZGgU5y7DeqX6pwxEEHht
X-Received: by 2002:a17:907:6091:: with SMTP id ht17mr542197ejc.607.1644873731286;
        Mon, 14 Feb 2022 13:22:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwORNXxcION04IJzU5Gu/UfUyFurARbus6zd7xUK4wKOMUXzkjvihbjj39qrz7zMUkHFrH18A==
X-Received: by 2002:a17:907:6091:: with SMTP id ht17mr542177ejc.607.1644873731059;
        Mon, 14 Feb 2022 13:22:11 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:10 -0800 (PST)
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
Subject: [PATCH v2 07/15] dt-bindings: pwm: sifive: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:46 +0100
Message-Id: <20220214212154.8853-8-krzysztof.kozlowski@canonical.com>
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
 Documentation/devicetree/bindings/pwm/pwm-sifive.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
index 84e66913d042..676b2160bada 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
@@ -22,6 +22,9 @@ description:
 
   https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     items:
@@ -55,7 +58,6 @@ required:
   - compatible
   - reg
   - clocks
-  - "#pwm-cells"
   - interrupts
 
 additionalProperties: false
-- 
2.32.0

