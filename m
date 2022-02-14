Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B667A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:16:59 +0000 (UTC)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BAAE5407DE
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826617;
	bh=05sXSD4PIb8v0ICor9Lwlzw82mhcHvJZHXpVeLkjK/k=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=O5xMOHCAWiPOFG2RX04WQJTJ/GL65cdOcjJQRC38N5RdnVce71FIkhZ7p48byVDx4
	 OM4Gob75a86YctQld+xmJzBVWo1idAX2O3YYcDHgtsVYz5LRS/PA5bE2t1v59cm5Bo
	 wPh1AH0fp6s0FkgIdc1Od5+Au2pJ4Jr8njPQT003QbCvT6kjNzHCxiGDzNw8Qoxura
	 w0mXX/Ebg+6Ge87umyaIawdZAqJ+aHLoPBGea6J8M1DE74Pxh/bFXWm/Cl6Z1UwwtP
	 jAwnR1fYu39zNbtp2KunIiUkSIWt2W+blkS8ChckJwVnKaCQIHh1uk0aPa+TW4GHVk
	 ONlDgbvnd8cZw==
Received: by mail-lj1-f199.google.com with SMTP id z13-20020a2e884d000000b00244c087df65so754315ljj.5
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=05sXSD4PIb8v0ICor9Lwlzw82mhcHvJZHXpVeLkjK/k=;
        b=GalWe+QXFCeqxCWQrjhMrpSyn655OyoRRaXPnrNQ0CDPs+oQoE5bfB5ccAjNwVtSyx
         TkJjfjSx91bDhtOnyJtVDFGtaCg32Xee2FGxJpGMRmgk0wITq+FqNWtVm9uLtMY9rsGw
         zfgmw/8l/HhRC4q/pXuuSmK2/QGHJsTP+UEOUMSvwVnc+Dcqfake2EHk+/UQ/+/QN1Gx
         J15YFkPfVAgCclplajomprQvHnXniTsnz01GrGmgvUM69ETWTtGGNz5GYcohvVS4joy0
         DNYy7FnTWJRBp1FENNY2qhLkKjnORP53OeREWtQyFRRXOs0F5TB2WggIKy7fiUKKJzDB
         Aytg==
X-Gm-Message-State: AOAM533eq9ngrRR75jx8sCHpExMDgJqeBA6l7D8zmQYI95IA1zfSOtjs
	Ksq8MAogJW/yqY9S0ZyUGu7tz/A2unNRZSd6xhTW+D3c4JxQ7zJvUqvnagJ3Yhc7nuyTSINvDQr
	/ZhByHo1TDNTmtgkTSSM5CsbqIbk4H3VBCaMQ4yPR
X-Received: by 2002:a17:907:3f09:: with SMTP id hq9mr10433628ejc.388.1644826606179;
        Mon, 14 Feb 2022 00:16:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+ZKNecHLHlMF1p9Zdz7frO6KM7oerLABDg+IKR8oKqn7czs7ZE3TIi9GnMTbsd5cUpiNWFQ==
X-Received: by 2002:a17:907:3f09:: with SMTP id hq9mr10433614ejc.388.1644826605951;
        Mon, 14 Feb 2022 00:16:45 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:45 -0800 (PST)
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
Subject: [PATCH 04/15] dt-bindings: pwm: iqs620a: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:54 +0100
Message-Id: <20220214081605.161394-4-krzysztof.kozlowski@canonical.com>
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
 Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml b/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
index 1d7c27be50da..0a46af240d83 100644
--- a/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
@@ -15,6 +15,9 @@ description: |
   Documentation/devicetree/bindings/mfd/iqs62x.yaml for further details as
   well as an example.
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     enum:
@@ -25,7 +28,6 @@ properties:
 
 required:
   - compatible
-  - "#pwm-cells"
 
 additionalProperties: false
 
-- 
2.32.0

