Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90AE7FC
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:24:18 +0000 (UTC)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1792640335
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826618;
	bh=1xNmK//HjGNaIQp8eaYbachy53dRAmEobraHrPxOQCQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=VgUpz3G6IocMENdvwALNwgkotcbxG2+sHO0hCMzYRO1xEY+hFVoVv4fvA1c8a96Wq
	 HmkLTg5R14pdvDzCgNQaeFZaoHsx0cpkorsaiDGSSCm6k+kLsrNERCZ/G6gUhcI9Mi
	 QZ4EpJLosRW5g3YHr1TueLn0Giu/Av58ozGyemb0j2yhvh6kQ/s9SsyyiGFma5O88b
	 S9XVtlR+6NmCIZUWF+pdswOlmurWPVf9tODmKxai/ZqPpxqwiW0XE4sfP9ROxoD3In
	 3iqsSntpyfCCVugOx2yu3WqLXKByuUMtRdVSTUHM6B3owNufy5BBOxwbqpxkTcy00G
	 7FAL+1DEVQtyg==
Received: by mail-lj1-f198.google.com with SMTP id s20-20020a2eb8d4000000b00244c0c07f5aso755274ljp.7
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1xNmK//HjGNaIQp8eaYbachy53dRAmEobraHrPxOQCQ=;
        b=lw+gnZE2NrinK1AO4421aH8b2w+xFWZlvE79f0kH2xy/NB9C5oERo2kiV0gNNfxJQZ
         ntU1kaxFtqDGSQgUjObOapJ8UFNgACwtwkUUp1v1XlbE3GbbNqwORjbI3zwZWDtMxcv8
         YKMgEIlz+UaL72VVfGQ05LAUodTnIfBLope6d4APd4ynkjCGkCP1mdjUwIx8F+zuwi+S
         7hwUPYbpD/WUlzvmtR0l2noF9dL7BzsqGqSkmpPUtGL9rf1yIJis50aRO3qLNE7V+K1M
         K/qO3aG9aWMGS3NVV7qhqdGOYUVCFqYgjHjkmhKTemRRBTy4ur3rZFFSfJ3IuyiQxgb0
         EMmQ==
X-Gm-Message-State: AOAM5302ZGLuupG7bwMjRKBrv8gGLuksXd5WNMuyZ//Biu/MZ7QIYyeo
	Cl38nUFQflaXTqk5kK3swoPekI6B3KgTZ4wjT5MfRe9wQaqfsByGhwVmfYXmUg5Dl3DwTdti3yq
	D7c8fPJH/hw6L3k0FtyPM803KRGCdfTSRyGRdM4kA
X-Received: by 2002:a17:906:29d:: with SMTP id 29mr3045160ejf.183.1644826607515;
        Mon, 14 Feb 2022 00:16:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFwQjCgryJA08f/ZPqu91gByLS1lXUPn3UYgvNgieSyLAvCFuIrk9GLlp5SVzdDUHhPKf2qw==
X-Received: by 2002:a17:906:29d:: with SMTP id 29mr3045116ejf.183.1644826607316;
        Mon, 14 Feb 2022 00:16:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:46 -0800 (PST)
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
Subject: [PATCH 05/15] dt-bindings: pwm: mxs: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:55 +0100
Message-Id: <20220214081605.161394-5-krzysztof.kozlowski@canonical.com>
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

