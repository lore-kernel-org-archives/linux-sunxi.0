Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750EE7FA
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:17:03 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E4830407E8
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826621;
	bh=bOhlBRyYjdc4olCsTRd9yvmwLAfAPm/hGaoOpjTnzVA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=bVnnPe6z79LbSXoIzfyudEIXqpop6oVMEsPjJDh0vHony2gshRvemnZEeAJ9BRR0n
	 oUK+0dUC5WkhvsyWvH7mv6AU+GrlElxVbIxEkGruewf+62Ug0XwuRHGYN3etHwFMH0
	 +S4H+kWqc3RAI5waTxdjSXgR6S1ZRqiS+B8jpBJgK12SbEb9nbpPVW3xyv5mhgiIiZ
	 mmq9aqqqoEZE4vTAj08SYvoG2yndMDdg1/958XmG9INnqn9erqDbhaUyVkrz1ULdA1
	 OyZTVWyxmKZ9uF7iBBvX0im6EsLyuhaMnv/CckDzYIcjuzKF6//FoDEe9tGxhIQmUT
	 kHKTdyRzExw0g==
Received: by mail-ed1-f70.google.com with SMTP id n7-20020a05640205c700b0040b7be76147so9769497edx.10
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bOhlBRyYjdc4olCsTRd9yvmwLAfAPm/hGaoOpjTnzVA=;
        b=ZJjVJ7Vb38PYWrwBfUnfQ1vm0MqK5OBVRdWQ5yKu4gTQX+gy3SuskPBGGh9pUFGGaI
         iIuIhznCHjehKwYtrLUgll4L/8kHdbMeQS/MwrJg04af5h/PH2X5uuktnBDtHpYiuSNq
         XJeLbq1Q198jblVgFlq2P0I5D2/JqgO/9JyIjFOWwf8aSutoBMfztUsQ8B8dk4VnTjg1
         Y/EJ0wLmuF0nY+MwlpNe9J7fBLarirmd16d0QrDhJSN3CPRc/01rY1t8H+kyihYsQT5y
         Vx0hycHlO+XOUkKdy3fp4PzVsEbsZs4Fufm/27UROhpoHU0PCWYsihQSNiZCIrR3yd8s
         ZWTg==
X-Gm-Message-State: AOAM532SHhMhjZrGMQ97u+ppdbbof7IYuoU6XTaRIwHQNw4snHNvJB1J
	meJspJpASJOdxHSYezIsLQgwABHRj/jj7h0RFFWm8lnb/fU4+MZqUmzdsXOrdVp0Aqc77CzJmoc
	20znU0qEyHPcEOu22PvkLvbCD+f+6S2HbKJLWJrin
X-Received: by 2002:a17:907:f9c:: with SMTP id kb28mr10076894ejc.213.1644826621263;
        Mon, 14 Feb 2022 00:17:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxVq42SC5ZUR0wG1GQiAhOdCRluJBdfCYPvNoUVrfESuZAlthB1iFEyURnQo2Crc/39Bc5gA==
X-Received: by 2002:a17:907:f9c:: with SMTP id kb28mr10076870ejc.213.1644826621102;
        Mon, 14 Feb 2022 00:17:01 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:17:00 -0800 (PST)
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
Subject: [PATCH 13/15] dt-bindings: pwm: tiecap: do not require pwm-cells
Date: Mon, 14 Feb 2022 09:16:03 +0100
Message-Id: <20220214081605.161394-13-krzysztof.kozlowski@canonical.com>
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

pwm-cells are already required by pwm.yaml schema.

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

