Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3FE7A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:17:07 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 34C85407D8
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826626;
	bh=7rHD29slkZOFSJhahaVYXmLu64XBgMMbFm+fpWjAlF0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=WaKKEoIAxfOkklgZMZx2fUX9JLWhT1HgpfoM047+dWsO1RqrEcu2C2QTKthoaKaH1
	 /dI6hYuE3HtU8OOLqf7QGErGvXQ9lf6RsiTuXQliR+Ifa7F8fMA9UnX1Nds2kRRQS1
	 IR7eaFjWMiZe1Jt/LyzNXt8Tz990g2oqAOwJt4P3h9/7/nL/86GmxoG6mNFy9GB40p
	 mrhZa+7IcsJPu6zei9N2KiYoTzIhFQSBcEraubUz1zvRlbtXzP5LQ0PBSKMRvyRUuD
	 g3JcjOarnoSvtguwZc+eKqUOuek47i4wYTP4HFyMKJ+QEZmcyBnpj/FOC78LXBSKvP
	 8kPKP+W0nWzXQ==
Received: by mail-ed1-f71.google.com with SMTP id f6-20020a0564021e8600b0040f662b99ffso9761802edf.7
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Feb 2022 00:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7rHD29slkZOFSJhahaVYXmLu64XBgMMbFm+fpWjAlF0=;
        b=FEcnmPUllNFqoCTU1yRQo4OHlV64Jem3MAf+lU8BeHmxL0Y3Sk3xddtmPNcZS1I+MJ
         LKN+/sTSQEf8Y4jebaNGFFHGDLHGKMDHT5QDkbEigaGWUHyfZQbnEtMtgmnN0LRRPL/g
         Ba8KHXAW0PxNtAXRvNtF6w7jxx04oldv43epjOzY8KPCqwKf2WS7NpOKGUPbU2WHq/vg
         wem5We6pw7bUanHowkrYORhAek1K/TL0yla8bmv2PToboDU8awKU8EkEsaN8TiSdSqLG
         aDgAieZiaE5tSq8zpAmnspB4Hy4WlTNtp/Yeg2Zmz2spfVrL9W5C0iKrZu7w36bU3NCD
         2XXw==
X-Gm-Message-State: AOAM5332eOt6ABlfzGfDvV476jNi16+LbIlUBrmvB2oLa15NfYLLIhdC
	ojqVAadC/BKYjFVDIAPEgFBEeD5YrfrZZ8Mh7uNay4XejZPkSF0MYsUSw1XOZ69YNS+hT3vD9YD
	da9+vocjX8rF1KDPVMraFKzE0KMl+1S/e2SkHBz1I
X-Received: by 2002:a17:906:6496:: with SMTP id e22mr10192498ejm.263.1644826615558;
        Mon, 14 Feb 2022 00:16:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpvkONiH4FS0uQPH9alYGubO9/o9pYJXoAtA309TiungpCh9WYv1lWlRgqPAUTIAinl39jGQ==
X-Received: by 2002:a17:906:6496:: with SMTP id e22mr10192484ejm.263.1644826615405;
        Mon, 14 Feb 2022 00:16:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:16:54 -0800 (PST)
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
Subject: [PATCH 10/15] dt-bindings: pwm: brcm,bcm7038: do not require pwm-cells
Date: Mon, 14 Feb 2022 09:16:00 +0100
Message-Id: <20220214081605.161394-10-krzysztof.kozlowski@canonical.com>
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
 Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
index 4080e098f746..119de3d7f9dd 100644
--- a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
@@ -28,7 +28,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - clocks
 
 additionalProperties: false
-- 
2.32.0

