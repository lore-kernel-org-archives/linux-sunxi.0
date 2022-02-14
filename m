Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1DC99
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:22 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 229F14033A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873741;
	bh=BTa+7+hPQApQrGc3LBEa/6uh1gwW5m1A+xf1VQ/CZYQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ODOe/j0A0B4z405ZHqkxFJgcE3eXPSN7Hnx+P7rWe4U4Z+PIEBjlY5/rHvxX8y8PY
	 1DiC/m4IC0q/w8o9O4v/4CaTX7SZiYBp2vNnb9AsWYtqtl7+YXcLnQ7445LI89Qdxs
	 HVAb0meW/Z7Yv/GMmGwaSMcRnTYVM/5KGar5Ypuz3k3vWZufsVmchLKil+lne4Eqr2
	 C7S+sUDlMfGL/9DjERmbnF6eFTuEMbQwLym58tNc5UVaScWrMfLHn7VRAycvIPrAJE
	 ydYMPhrDHECX3hujS4LtRPAEV+ZlGN3MdOpzxqPurTgSgb7i+ysmqqTNmOqGpc76Ah
	 nPb0n4ZN0jsLA==
Received: by mail-ed1-f72.google.com with SMTP id m4-20020a50cc04000000b0040edb9d147cso11064945edi.15
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BTa+7+hPQApQrGc3LBEa/6uh1gwW5m1A+xf1VQ/CZYQ=;
        b=6rqJKFn54H5xLqqhSgQ4jIiaflUCdEIp2yQDEA3Y1C9x0DT+hyfG/XqH1qNbfyt1Iq
         vpq1SbYtDntClUYYT/8bL2sxJDCxyeF3Tf1jm+JBPx3UK0ep+3xMejV4l3wmpjk1diXm
         peKW9FBqrlJuIu18UUbQ5CeS1CYeeEFGbXG2C4vGy2XW/Bidt3Tw/SX2vA9VCkYIzA0U
         JD+roPkg8tMkDX8omBvTz6MqQEXRIdCRg951WaNXCJ1TPZNcxNuiEyx2xtxST1vJEn/O
         a4M03aWA1LWyxRcQluZPfXGov460zoXqL2D1it17b/kOpsjKfKOaf8nHjSOnaTuJXbnf
         UyWQ==
X-Gm-Message-State: AOAM532iS6CBKYI6ZBDEJIEGDid6rProADKQh3YFB6pajMorlHmvjVpc
	LqnsfLdTHP5l502ZMbhg+LGIZYRpWwo9unu5CPM05YrMbtIJqBBg7pe/qOWjJy6WGUxcrDhF4rC
	hgLG9Syg27B4QIgQrwS9nSS66sYQA7j+eew9ALSDE
X-Received: by 2002:a05:6402:f1b:: with SMTP id i27mr797199eda.275.1644873740824;
        Mon, 14 Feb 2022 13:22:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxI0exot3yoiNzuz9PwDF81XbTxvVVt2KMAZVFpKvmztfJkcydX4q8g7gpBrGY0uRI8V9/sXA==
X-Received: by 2002:a05:6402:f1b:: with SMTP id i27mr797171eda.275.1644873740690;
        Mon, 14 Feb 2022 13:22:20 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:22:20 -0800 (PST)
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
Subject: [PATCH v2 12/15] dt-bindings: pwm: samsung: Do not require pwm-cells twice
Date: Mon, 14 Feb 2022 22:21:51 +0100
Message-Id: <20220214212154.8853-13-krzysztof.kozlowski@canonical.com>
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
 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index 188679cb8b8c..fe603fb1b2cc 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -86,7 +86,6 @@ required:
   - clocks
   - clock-names
   - compatible
-  - "#pwm-cells"
   - reg
 
 additionalProperties: false
-- 
2.32.0

