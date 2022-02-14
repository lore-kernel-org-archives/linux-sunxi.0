Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFED7A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:23:14 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 46FB2407D9
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826614;
	bh=DkqOnedmg2q9ShhWATftW6XUUTgR2TrUisQLyEAw/GA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=cxIZq0u3HmjdsAiPqVRsO/aDVPuLRl/+LeiUDRmn48lGJyS+LWSPc1huKPtqHCsyD
	 1RL9MYmvIE0GLazWTFFcOql4+46B7CEsMpkO3Ljl/jFsVHrPlu6+CksYRuL8Ce0TTM
	 e/2PcFDUzBfGIsxvmXHB+1GUC7Una9VABbFebmRgyvYieNViPFjtbhqlFzyljzdHeC
	 ON89LnDH4jRPPlj4c1Iv/txDVSah/xCgfve2yarGDHQojJdk8kdTyCjlX1oA4k2A3r
	 QJlsQx+G5/DP2itscrpxIl+g+EhPjPbY23SV0uLwgXLDLsi7i6UxYRTXE4R7fSJh+V
	 JJZ+KOiH6Sm+g==
Received: by mail-ed1-f72.google.com with SMTP id j10-20020a05640211ca00b004090fd8a936so5148038edw.23
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DkqOnedmg2q9ShhWATftW6XUUTgR2TrUisQLyEAw/GA=;
        b=I+8f1rW6ZSBrjdIneQzy0CnexrEsdhDZ66ShTpO+rJwJ37PBR1TKFFZRkq/3N1zz2/
         EvHdz23huOb0JQvy4eQyrd7akpL7kveZncnFts/N6FV/1w7X7npnJj8HXAQjlCbGLJFp
         wwoLwW0k1YApuXhdBCEHwxTPtMS8cERQrX2kj6oDGWc7jwdtWGB4X8BbeoZ3zOLeyiUu
         pgjOQJV/UINCAb8S7VQIl/LPtE5sC1fM7KJz/Zgb1tFD1rWsdx2f+uIY/9i+MJTSR4MO
         38e1SMWoi59nZlQ4YOsEYOkOejphQIyi9sLpvGFXXHn/+GRylp8kNMvfMVTyVX6Yi2mJ
         08tg==
X-Gm-Message-State: AOAM533E3k8Ti2sBoZ7vCaEkUiFBMKvQ1YVwhpP2XkPzVuLvKE4Jikgf
	AcYO7ZLfYvHR8SmxwjPi/xrcgrgljoC1YXSUrJoeJl/+GUX/0j7q1E0ys8M255yiItcDPjyz5oj
	4I0tUSBhliJEE+KKYWPyOh0VgfTK7tVrImhjlXG5J
X-Received: by 2002:a17:907:86a0:: with SMTP id qa32mr1461127ejc.23.1644826613999;
        Mon, 14 Feb 2022 00:16:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDJTIba5Olc1DBbdAqq71XRQ9UAPJIT4SQ1cNLOsvgwe2lpelu0Q6nUssQgmN6E/2sLjNFyg==
X-Received: by 2002:a17:907:86a0:: with SMTP id qa32mr1461109ejc.23.1644826613791;
        Mon, 14 Feb 2022 00:16:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:53 -0800 (PST)
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
Subject: [PATCH 09/15] dt-bindings: pwm: toshiba,visconti: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:59 +0100
Message-Id: <20220214081605.161394-9-krzysztof.kozlowski@canonical.com>
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

