Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075447A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:17:09 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5B3AE40259
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826627;
	bh=iIyJdPXcEBkqUXDuGqxhbnQvntH0bGkCRSvxS5pcFZw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=k63KSDNhFpkSlYbosGMch36sDtSsQjWrlJp2qD4FKIzRCcoYJa1LWGvVyBE9IKbYt
	 +vdJVIZTIGaoukAWKNo8g2onneNxJOVpTO32TlW8JRnw9FlZirDpAKyF4H+twfimLB
	 LBxJsWK0fWkcynyKw+Du8yIVyOzmzYoZkyPEhMVIXCK1vOTF07NhBtq1LktLNYu2//
	 /lndAfqpxmUUqxVnvKgKPIPOZqOFkW/aReQbz/oRlBI0gP1Ij4iZlj0KMMyWd1I63n
	 G2EBYtNWRxnCQxTvuI2BSOhCn2O+CQjCszMFOkQsyP7BzTePMNsUhU2uUR4uVWMN0D
	 l/EZQNCdYBl7Q==
Received: by mail-ed1-f72.google.com with SMTP id w3-20020a50c443000000b0040696821132so9729816edf.22
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iIyJdPXcEBkqUXDuGqxhbnQvntH0bGkCRSvxS5pcFZw=;
        b=KU/rW7nVJAmfZK4WNPtu5cFmlvgVkW/hUGGUoldrBw8jKXjHDdWDTySUMb9tAPTVUB
         oTev+tMx+qH6f5XbvfZF3E46TZU0ZxMKaPZuIUgXz2rQjrhCDTumAPl2SV3xkzowGXNg
         cjlmy07jwLEgHeztF5OUxZlzfxfYGe2EclCq2ex1J+ms/LZG3rnu3tolo/hX8FoqKyHG
         iDs+HBsY3gNPmolgM/zwOez0DtGGoIbllu4s8FAQEd0NVBRJGo3jMM+h1gZl0QCTaZdN
         9nNkgDekkkEWncMPTbCShsqNwG1hKXoi7QO5Pxwtdhk9lhoGdKxaaPdCNw/jmDhwTF3e
         dMyg==
X-Gm-Message-State: AOAM533NncVsz9DmDVhcdc6NKM9Nejxa73tt19e3PO5+sP5lYJ7Nmx03
	WZ9TTlE+dviVQFWbMIlE0PvLM1xDOEOjCh+RFJEL1qhqLOBJcFN8gTo2AgX0yiFW3eNwf8LUm+m
	jHXbS2lsrGZFQkOoTJj/ur1bUnVkJwj0bcKtIuvwA
X-Received: by 2002:a17:906:7482:: with SMTP id e2mr10548238ejl.84.1644826626205;
        Mon, 14 Feb 2022 00:17:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq33v0frVviF6aoq/yzn0yigEhIAPUAXD+ZluCWsCIVgJnTB15DwsxtEtp09CYMHvANYnT6g==
X-Received: by 2002:a17:906:7482:: with SMTP id e2mr10548195ejl.84.1644826625992;
        Mon, 14 Feb 2022 00:17:05 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:17:05 -0800 (PST)
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
Subject: [PATCH 15/15] dt-bindings: pwm: renesas,tpu: do not require pwm-cells
Date: Mon, 14 Feb 2022 09:16:05 +0100
Message-Id: <20220214081605.161394-15-krzysztof.kozlowski@canonical.com>
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
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
index 1f5c6384182e..c6b2ab56b7fe 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
@@ -68,7 +68,6 @@ properties:
 required:
   - compatible
   - reg
-  - '#pwm-cells'
   - clocks
   - power-domains
 
-- 
2.32.0

