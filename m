Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E425D7FB
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:24:18 +0000 (UTC)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 17C9B405CF
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826617;
	bh=Vx5pgZq+wTDk2cXNM++1rpL4of1cb6TeLTw59n/JqH4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=GFlRU7SEdchoE7qhmURCYGKEpFwl3E4EBLLh4l76c9AOvd6lMx772zIzgnd0gowIz
	 UC/7aJ5nx4Ofw/tl7WV87YG5G6sa9PMIqT1enxiYX+UGgT2rjVWE0NIZkF2Dn92zJM
	 V0H2mYjn2GB3D/kV1P0n1WBZwhV+ykpRlvOZ9yAeqsiuPqKLf4rWMUCpGfmt2zL7AX
	 VM0xK/cHWXKtDMcjLCsK3tcZunI1O0yW+RFvCrgghVYyN/kpAz2XNFQWSkgKo18IdL
	 /34qRtior/Y0jgctycIJ9FJZ8gY2Q3ezT0+80P71mskZTRBH+1USJq6oTr6StHocCT
	 Sraq5vJ8LJ5Pg==
Received: by mail-lj1-f198.google.com with SMTP id bn10-20020a05651c178a00b00244baa268b6so989117ljb.15
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vx5pgZq+wTDk2cXNM++1rpL4of1cb6TeLTw59n/JqH4=;
        b=IhVeZgm/nsFBEww/UoX2VNp95L8eozHdd1ZvowSYw1KezN/BaRHOZLipB9Y4lVn9kd
         5WEHsgSUEUh6E3bWTESfTyxOCLwLz8nqqpyNnSAcwY6qZPa+NTwuagNZzid1avbGA2FX
         NcXSMwNeOjnvhrn5Tm5ON0TPX59VcylNiPGl/6/VFr5n0H88wFwwQ/glGQrawCAP2geH
         uDA4GKxrlHsbUzOOgsu1ed/7bF3I7dgH8ADEquX8bKlBUW3r/LweLQ1tLAK/D1qQldgT
         y8lKDng/X/gKi881mB4fO0vGb9Dx25LmQP2fIVfhwlIs/iSawdpTFH4EIdYO+6sNkR8v
         V5/A==
X-Gm-Message-State: AOAM533kxHvre7sTy/skxHll6cCJv9yJWS8p9tTRvoVZQjgIvx8tOjiQ
	kJ//F2LZGC5LCN5NEhmm0CmPHNfHWYbnaEOZOtHfAgXyG00DcGUl7AVvuHAO5tuVp+I5a7YxP7K
	WiBMrLRpDey5G579WKqFAH1uRCk5mlZLZ+BxuDmEU
X-Received: by 2002:a17:907:86a1:: with SMTP id qa33mr10593906ejc.516.1644826604836;
        Mon, 14 Feb 2022 00:16:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHLCvj9EOOMBQpfPrsB+GOXcyF6v8PbErxtuwvlpLnjLHBW4y7stXTy+wJs5s8ptFN23VAWQ==
X-Received: by 2002:a17:907:86a1:: with SMTP id qa33mr10593877ejc.516.1644826604628;
        Mon, 14 Feb 2022 00:16:44 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:43 -0800 (PST)
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
Subject: [PATCH 03/15] dt-bindings: pwm: intel,lgm: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:53 +0100
Message-Id: <20220214081605.161394-3-krzysztof.kozlowski@canonical.com>
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

