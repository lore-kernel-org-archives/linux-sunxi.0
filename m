Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A796A7A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:24:18 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE6483F1CA
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826610;
	bh=2POCSk/6TwWTazpis9hGbBMQ4KYz1OTALCTDWqaBti4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=NVDTsqzxGoc2m8TsJcYnYj/mPBpRc3/9xSQE5TL6VERNlgSufSZUnGcPwINE+RB4l
	 vxMluqOMYooi/HwhUWRooyaAttyzVO2KHOr5PlV1+rgbPuG5RaHLH4wapANqP0mBUc
	 XNhVac0eYhmXVr+7aihHG5UoExV7Y2gwo8Bigj1kK9FAA5fgk1ztAQ10n6dqC3yD4H
	 V22RvPN5vYHEt9V+N3ZvkV59wgKnOH73RGlt8Caisc5KVfCDcG9X9oCd42BqdokXTJ
	 SFnyc+/KKsVLBtojPUWeNmrvEkCG3uP7yZASlzz9BrOjD54nL4Q/Qn2bq/9TBRkjgr
	 IqVURv8qRHsGw==
Received: by mail-ej1-f69.google.com with SMTP id q3-20020a17090676c300b006a9453c33b0so5437225ejn.13
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2POCSk/6TwWTazpis9hGbBMQ4KYz1OTALCTDWqaBti4=;
        b=hrNdlD+ae5y7D3AmUTQFwiOJGi/f8W5FKZiqtnIYqhg9IRiMfcItiKGF3MSV9gxKQV
         yw3ZJE6mx4rEzTl77/USLeQubh0smxLoEm8so1jHfhas30Cs/H4UJvEKyT2+eZw4EX8Y
         G+kufJfwXyJlE49uaEYamz+M5FKLbul763QYYgrwdIym18EHAiElbDUcS2d2+eR07Lx4
         nX+sReacGyyAIvqXt3d2syAZmRLADSYHcGFE+LU3CTYfEp41E++8o5TwLShDhhoF6Sgi
         bb8wBabo5T/y6BBoaWQ9KdyOr5WFFNR6nUz1yLzfsMRGsWda/TLD3wi8PyS0W0zs9MK5
         rPQg==
X-Gm-Message-State: AOAM533adYq1Fsp0kZnZyxfnFvoSFgEcAtEkACiw3ZsNEB5c+UUsa63A
	ha9WlYMosG6ZIrkQTzkAuitqY2ejchHVVTN3fNnFMACFFPAoT7hZ4KgYFECkZ1maERVlNo2G1Lr
	H7r3mea9NBn0/qpH2VZ6qpM6hRNJM/sx2iUypTZV6
X-Received: by 2002:a05:6402:d0:: with SMTP id i16mr14154253edu.163.1644826610622;
        Mon, 14 Feb 2022 00:16:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzehUJnpv0saAzMdWPLDXiuxxvQr3Bh+VUR68F9vzvxoszvsgh+RQPNbOAs8Fmy07wTsUQlpA==
X-Received: by 2002:a05:6402:d0:: with SMTP id i16mr14154229edu.163.1644826610426;
        Mon, 14 Feb 2022 00:16:50 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:49 -0800 (PST)
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
Subject: [PATCH 07/15] dt-bindings: pwm: sifive: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:57 +0100
Message-Id: <20220214081605.161394-7-krzysztof.kozlowski@canonical.com>
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

