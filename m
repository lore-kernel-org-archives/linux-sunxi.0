Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF86C99
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:10 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CDC3540336
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644873728;
	bh=Yyn2NqnfgQsqTNINvOf5kiaG/8cnl0ieMPcjnfWxCE8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=s8cpsooEHMiCji99+2rKxtqOEKdTAwi1jRucbEE77xTingMrPmcumFe51utoZ9Pcn
	 Z69BhpVTHxncY5UFZW9d+mwvUMEy4xqpYsn1ejjAnyA6q5YIhGOGYYCTG/wievJjUq
	 7xAhhW9DqiSxKwskDA+0E5OmPvvPsNLQdlbWKvMZYfwOlfKqi5kFx4gOJjcOWIY/xh
	 sxQGJc8T9D58aowU0dSwMUp8sE4/iGdVRE3GLPkgMe/EXGf+Upqtx9RP57jHdlL11D
	 fdl17uf0Gs/itqktIyhl41BDjyvBXCI4EaE3N58lYYyT0CbncRiFsvEFNhqV/046KD
	 mhDE9yju0W+cQ==
Received: by mail-ej1-f70.google.com with SMTP id gn20-20020a1709070d1400b006cf1fcb4c8dso1214082ejc.12
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 13:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yyn2NqnfgQsqTNINvOf5kiaG/8cnl0ieMPcjnfWxCE8=;
        b=gNRuoG6E2DHCVpOVf+XY3ZG6Pf5q3pf9qHzLWpeSueULpvgmbRSvO9YBpJ8Sf4eenp
         DBFWuk4OHBfgfSH7mVVApTpM5bksR8mb+8NIIHXYAQO8GnTK4r8qARP05ARJI8Bae9xG
         2p/X0IbAguljKBmAvZsDsR6R50ppWBqmndjz8LtB9TZErFEfFBNsnfmsexZpaf3tDr+l
         FHkAFcAORypT39ZHpuiOwhXK8OuRns9peVIjLqB4XB/j2u7ZmtY5F0msqVVPAuFPNqoc
         t5w8nqr+6iA+sv3hVriaKih6mb6+n0TIvhFnyJAiIB+EhPMXZU0jOR6hlw0qJ+hPYLek
         0tvQ==
X-Gm-Message-State: AOAM530o9pObcKIm5nzFAzp114g2FCGt0MFJ2+E3ncEHUEx/qXxjB1Vq
	nareNxgaL6GDempTyeDzNRLZfwVll6WOunu/EPMxMhWfR1+0HdG5PWnJza8x0duOOqqT/uUunWX
	q/SjkD0fmk9NAPw3ygp6sA9q9NrYlEDEf80vQKu+U
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr542960ejn.652.1644873717904;
        Mon, 14 Feb 2022 13:21:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHUEbKK+ige7iX5bnwzSKFJMTswdOEpqx7cMi1lNy54Z/tS1AK9z5IhoWWwB46l5Z1qT3wqA==
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr542949ejn.652.1644873717746;
        Mon, 14 Feb 2022 13:21:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 13:21:57 -0800 (PST)
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
Subject: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:39 +0100
Message-Id: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changes since v1:
1. Add tags.
2. Adjust subject (Uwe).

Best regards,
Krzysztof

Krzysztof Kozlowski (15):
  dt-bindings: pwm: allwinner,sun4i-a10: Include generic pwm schema
  dt-bindings: pwm: imx: Include generic pwm schema
  dt-bindings: pwm: intel,lgm: Include generic pwm schema
  dt-bindings: pwm: iqs620a: Include generic pwm schema
  dt-bindings: pwm: mxs: Include generic pwm schema
  dt-bindings: pwm: rockchip: Include generic pwm schema
  dt-bindings: pwm: sifive: Include generic pwm schema
  dt-bindings: pwm: renesas,pwm: Include generic pwm schema
  dt-bindings: pwm: toshiba,visconti: Include generic pwm schema
  dt-bindings: pwm: brcm,bcm7038: Do not require pwm-cells twice
  dt-bindings: pwm: intel,keembay: Do not require pwm-cells twice
  dt-bindings: pwm: samsung: Do not require pwm-cells twice
  dt-bindings: pwm: tiecap: Do not require pwm-cells twice
  dt-bindings: pwm: tiehrpwm: Do not require pwm-cells twice
  dt-bindings: pwm: renesas,tpu: Do not require pwm-cells twice

 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 53 ++++++-------
 .../bindings/pwm/brcm,bcm7038-pwm.yaml        |  1 -
 .../devicetree/bindings/pwm/imx-pwm.yaml      |  4 +-
 .../devicetree/bindings/pwm/imx-tpm-pwm.yaml  |  4 +-
 .../bindings/pwm/intel,keembay-pwm.yaml       |  1 -
 .../bindings/pwm/intel,lgm-pwm.yaml           |  3 +
 .../devicetree/bindings/pwm/iqs620a-pwm.yaml  |  4 +-
 .../devicetree/bindings/pwm/mxs-pwm.yaml      |  4 +-
 .../devicetree/bindings/pwm/pwm-rockchip.yaml | 74 ++++++++++---------
 .../devicetree/bindings/pwm/pwm-samsung.yaml  |  1 -
 .../devicetree/bindings/pwm/pwm-sifive.yaml   |  4 +-
 .../devicetree/bindings/pwm/pwm-tiecap.yaml   |  1 -
 .../devicetree/bindings/pwm/pwm-tiehrpwm.yaml |  1 -
 .../bindings/pwm/renesas,pwm-rcar.yaml        | 26 ++++---
 .../bindings/pwm/renesas,tpu-pwm.yaml         |  1 -
 .../bindings/pwm/toshiba,pwm-visconti.yaml    |  4 +-
 16 files changed, 101 insertions(+), 85 deletions(-)

-- 
2.32.0

