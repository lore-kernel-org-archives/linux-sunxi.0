Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595AA13FEE
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 18:19:54 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1a28de15c8aso2471127fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 11:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693246793; x=1693851593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgB3IqJrXAj8oKd7QiZ8/Y1UHori5BAQnvTMsmF5s60=;
        b=emlo1oY1fjLKx1nfmRhunHa1ZLMVFG1Kl3mGWb6LOsK0H4MWzrik4RvC1/HjxIYXpV
         rqICPiphmJU7pW5cV1gM27HpAiO8KnH6cr8AWzh8VmJzb7yyHqabCnTSqc5nEz3mTDPP
         6pSrCe7pJgljPx5M4LVzBfq9wF3ztwOHqocpKSSStvYe/vdDPKPmALbfhhrTULtOCHnb
         JFDo3D8z0n/T3XF1dNhLPAKAmNnlcwOd16GXz1kRyRH5fOpIHCA2CsgCwN6bCfDtra28
         yGcvROJJdt9WWswS86ARiQEZJqeClLttWmso7ThB9pzNL6yIHyE2sFMEgyx5rX9RBkHa
         KiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246793; x=1693851593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgB3IqJrXAj8oKd7QiZ8/Y1UHori5BAQnvTMsmF5s60=;
        b=Rvr2OXNWgSkOmo0W7vLdfDx5e/und6vLhe6+RQN6tXPkTC3FQbaA0S2eS+BZzgTBEz
         4YevzO/xZkkIW6jigv53CGUCpn/6rTAMK3ZWStWA8LsUG+768LTXqloFVmqMx/MKcSMD
         had2jqHwE+IrCKj8eqPI4BF9MRboN6ui/9pRKT98mCSr42qV62ToygjdmodDOmiAy/es
         GH0UwD5G83xJsqz71ZjcVm3F7qj9txSnlc9V91AMw+DkBE16ctqkAWra4PuWsaTXFua+
         wiX4N5tZcs49rr3nMP3cRAt/kLz3tU64X8nwfcOdAmiKCTbScepxTMnm5uY37oqhp7Oa
         wBGQ==
X-Gm-Message-State: AOJu0YxX+lgmonK05t4cV644tWl+nSJBqSWhWNYcMV9B47FLICbR7EuL
	j6qJE3+SkT/boBNzas/q8EwGlNJLdEdrmQ==
X-Google-Smtp-Source: AGHT+IEmKCtb54J+XiDlHGf7KJYkOzJBfYBjK1T3HYeXruK6ZpmURNOhu0q1QRLPJRCeQlH4McXVTw==
X-Received: by 2002:a05:6870:d612:b0:1bf:88c8:7919 with SMTP id a18-20020a056870d61200b001bf88c87919mr13941715oaq.46.1693246793094;
        Mon, 28 Aug 2023 11:19:53 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d620a000000b006b99f66444bsm3695927otj.71.2023.08.28.11.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 11:19:52 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	airlied@gmail.com,
	andre.przywara@arm.com,
	conor+dt@kernel.org,
	daniel@ffwll.ch,
	heiko@sntech.de,
	jagan@edgeble.ai,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	robh+dt@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	uwu@icenowy.me,
	wens@csie.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V4 2/8] dt-bindings: display: panel: mipi-dbi-spi: add Saef  SF-TC154B
Date: Mon, 28 Aug 2023 13:19:35 -0500
Message-Id: <20230828181941.1609894-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828181941.1609894-1-macroalpha82@gmail.com>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Saef SF-TC154B is a 1.54 inch 240x240 square panel with a MIPI DBI
compatible interface. The panel is used on the Anbernic RG-Nano
handheld gaming device.

The initialization of the panel requires a firmware binary which can
be made with the mipi-dbi-cmd[1] tool. The command sequence needed
can be found in both source[2] and binary form[3].

[1]: https://github.com/notro/panel-mipi-dbi
[2]: https://github.com/macromorgan/panel-mipi-dbi-firmware/raw/main/saef%2Csftc154b.txt
[3]: https://github.com/macromorgan/panel-mipi-dbi-firmware/raw/main/saef%2Csftc154b.bin

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Noralf Trønnes <noralf@tronnes.org>
---
 .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index 2f0238b770eb..04cc5bfce051 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -66,6 +66,7 @@ properties:
   compatible:
     items:
       - enum:
+          - saef,sftc154b
           - sainsmart18
           - shineworld,lh133k
       - const: panel-mipi-dbi-spi
-- 
2.34.1

