Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4277E1FB35
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 21:26:08 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a7d4030621so3708201b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692825967; x=1693430767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmejmVLGdABaT+qnw1yy9ms9gFGtTk5UP1kBkDFPK+I=;
        b=d2f3RqB22NAUi62xj1IhlXBbeVscTUk4mFuE01G97DeFR61OachgwbNcyb2QrD88Fw
         KCbwUgGqAW6MddXUicxXx+a2Q13Bx4AsszGJXTwhUlDgiVUyLlzUDElB9wrcX5HI/9Fg
         PE353Jmf6lXiCGwQgPaSG9tWoFMpWNFDPvFf3OA1k/9SCZcU5S9ImaeAdBMx9DKv2/Sa
         Tt+e2tYh8UJxv5TUNY/xzHnpTtAO5DSLuqQxzAVbOaRFq2HZo2TkeL+Ce9i/NRMKHESt
         N5NzpxmMCEE96ycn8pOBAF04rPk+VH9zazFBLQio+PrO5EqqSfMAktj5ziQKYcxZiPam
         SmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825967; x=1693430767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmejmVLGdABaT+qnw1yy9ms9gFGtTk5UP1kBkDFPK+I=;
        b=HYHAivHuZxOWer6LKaypT6CFdzjM0pQUzkuoiCzMPAffie0NNaD2ExcAPHc8ss5okc
         kruCTmY22FoWVGSKVp2HuAYhu0SEqdFxWw36rwXVbqDLL0k8VnvDX6jKGvB1dpVRdtbr
         iS/pyphOK501WIvk2VRNzxusc0QYxib2K/cXwXgeF85hP266S06ap9sKcJpaZQuHLLBN
         aYt5E9jmTIJyJQ9H/Ugy9F+FyZZgqsXSqQqT/rheE3WyyaSbKfzES6ORUm+KeX5BXtRQ
         xSYVA2IaPiYOI6TONtnlHgPoB9E2ghbYZWh3xCOMgb8SFxgSJJVt1tgLFVLEEqzKwgne
         B0WQ==
X-Gm-Message-State: AOJu0YwM3xCgOzcO0V1e1x5SV8tz5XTXxmEwkaH6AwffbGe/QnKlha64
	sN6VFS2pf8W7c/lE2wVj2pnC3dW/+P9XtA==
X-Google-Smtp-Source: AGHT+IEDpfbnjWsSiMmcGkeV4ESrNAZs+pG+ch4KHURsizroCnN21aJQ24EOA3a8WAAymcRKmpsdOg==
X-Received: by 2002:aca:1b0f:0:b0:3a6:fb15:399b with SMTP id b15-20020aca1b0f000000b003a6fb15399bmr11308841oib.36.1692825967020;
        Wed, 23 Aug 2023 14:26:07 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d26-20020a05680808fa00b003a1d29f0549sm771127oic.15.2023.08.23.14.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 14:26:06 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	jagan@edgeble.ai,
	heiko@sntech.de,
	uwu@icenowy.me,
	andre.przywara@arm.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 7/8] dt-bindings: arm: sunxi: add Anbernic RG-Nano
Date: Wed, 23 Aug 2023 16:25:53 -0500
Message-Id: <20230823212554.378403-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823212554.378403-1-macroalpha82@gmail.com>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG-Nano is a portable handheld console from Anbernic which
uses the Allwinner V3s SoC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index ee8fdd2da869..806f25b561d9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -56,6 +56,11 @@ properties:
           - const: amarula,a64-relic
           - const: allwinner,sun50i-a64
 
+      - description: Anbernic RG-Nano
+        items:
+          - const: anbernic,rg-nano
+          - const: allwinner,sun8i-v3s
+
       - description: Auxtek T003 A10s HDMI TV Stick
         items:
           - const: allwinner,auxtek-t003
-- 
2.34.1

