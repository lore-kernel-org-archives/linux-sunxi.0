Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EDBC8A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:09 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2FC38407CF
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873728;
	bh=1xNmK//HjGNaIQp8eaYbachy53dRAmEobraHrPxOQCQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=cyfDDj0QyhfE9wY/rL/p54nhFVQtItBOU4Bh1dntQKkiHLilCCB4aA+rcNqYk/hya
	 ovIGaYGYQZnJG4B7YRrnWFwQZYUcejFRkg1FNkPvD2O5GMVjiINjDgHPpstpoyf+sy
	 OxRlQO51UNtnzklZb/WBLYm2kp/5OcPXpHrg0WUDDU2JJm0+wbv8oV+dJBzImYrfZF
	 0p0l1A3v7ijEp8D1v6dCBMjIiuChC/wXDIpDwq8gFzjU5kiUFC8sDGmXsJAMyM4f1u
	 3fRJhUk76Vy8HjfHO5LTCOfW9pNsh7lGpq4LyyDFGb2f/5GWFWlq4chdX2tCQcBjzZ
	 B3u3SNosJh6lQ==
Received: by mail-ed1-f71.google.com with SMTP id m11-20020a056402430b00b00410678d119eso6624311edc.21
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1xNmK//HjGNaIQp8eaYbachy53dRAmEobraHrPxOQCQ=;
        b=h5IfgayYUPKTQlvbjQDqB/RGAuVybqfHuy4OqNRsJ6/oCVGH2uSZHaKCZFztb72x3r
         ziOEd6FukKuq48WtdFx99PZL6abu7gXg8C7pXtKJJK4fGWvDJus1eeL83zHr0nFckc93
         Bp/xJOWOmV7UnWf0wFo5p28d14I+WgnlBH+A4dSs3IE/kJtLbSOKUU3HpvMGvc/ugnZt
         lLAVIJjN2e20tvBJJis+zMjntStCUaj+mZ6LtdDSWUqF6ugQu+tH0lWTf3ULMdWn+nuI
         /j4IrxhWKEC1AuF0KX/2prkwOmRmVlzlyNNU82LedTSc8oekqY4AnAHZLeGMpSGb/b9W
         P4ww==
X-Gm-Message-State: AOAM530X2fxXlRutH7XrNMHnjtStPlpiDpRz+X4r/DVadmMxss5Go8t0
	xFN6oh6pu91zhIVZPPpyKpUcg4MRd9Xcl98i8vFO3jPmVUpXa7gtqjOVsIOi35xQEb9XmkjmuyB
	r6BN6voGftenyA8P9TN7uqh0hp7psGlkWsf1eilmc
X-Received: by 2002:a05:6402:2203:: with SMTP id cq3mr756158edb.185.1644873727721;
        Mon, 14 Feb 2022 13:22:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy49BfL0PgnMrV38zW/ZrNuMHV/5GZGb+TKlaJ5NvG8aoL2ex2m6POK5VS+J5aobKGKcLFIQQ==
X-Received: by 2002:a05:6402:2203:: with SMTP id cq3mr756128edb.185.1644873727584;
        Mon, 14 Feb 2022 13:22:07 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:07 -0800 (PST)
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
Subject: [PATCH v2 05/15] dt-bindings: pwm: mxs: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:44 +0100
Message-Id: <20220214212154.8853-6-krzysztof.kozlowski@canonical.com>
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
 Documentation/devicetree/bindings/pwm/mxs-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
index 8740e076061e..a34cbc13f691 100644
--- a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Shawn Guo <shawnguo@kernel.org>
   - Anson Huang <anson.huang@nxp.com>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     enum:
@@ -28,7 +31,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - fsl,pwm-number
 
 additionalProperties: false
-- 
2.32.0

