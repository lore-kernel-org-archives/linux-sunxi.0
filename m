Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80168111E
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Aug 2023 03:21:17 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1c4cd0f6cb2so870491fac.0
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 20:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692415276; x=1693020076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmejmVLGdABaT+qnw1yy9ms9gFGtTk5UP1kBkDFPK+I=;
        b=YKaiAlEMxG8TG4NwPrj8HVSkUWZ0S15L5BHPEgSxVOiV8l80zHRpbCfX6Xi6r/k406
         YgNjh7m+h+RNsd2QhvMKkXTQ2w2A80rb8NimmIhteBq9Eq9YZsC7COYu3FvtsqKKFssL
         MFzNLVz0zjEqEaZ4/vYKGI7urQuAD9a20n0TVj9kTMqgshezb8AF22lFNBUNBt3jqjoi
         wVHF3nLXmILy9YJuu0gROw2IOL7jbNMAzmdUbjUauKUF8s2sa2fpwy97vGl33wsq/dHt
         g656c1Z2aUaeawREt2wVVNXxmFqvPahXtsDFaU4J/VgMlvmkPlzV4qxJwgwwyywOh/6A
         TzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692415276; x=1693020076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmejmVLGdABaT+qnw1yy9ms9gFGtTk5UP1kBkDFPK+I=;
        b=GfoGeYu2JiK0AMu7XBJPR5PN5OpuuwuWgrHBcbyKi3oEy+rtPK+cxjFky//pLnCrZH
         2NUvgHbCxRxElvsAyhggBHvSwHJE4La1SjJLkTlRfBbzEudl5kqJFo2ROFH1LF5jxcSM
         UoFRZ0DdIhZGuJHrJDt7EqBGWtDFE44X+4I/4iV7GpL3K5U69fFUj17+dQLqxOwrX4Hl
         ncKrIF+Zi5AVxEVUbugfCVhBhTEJ8Loj5pRCdW52m4/iswpPtRTSd2G5u9qUIiBhQPil
         6aKWJ2vBB/I7F5cDSx6UEsRs6d9tYdOHMR4Gl/fwCgRBf8BUkWgpFuSsl8IDOJUABV2s
         X8Tg==
X-Gm-Message-State: AOJu0YwktDhzNNmMaISe4MkfEnKNyrtXiim6Oq8vHAmo8KB7y9LFpr/0
	ak+0hH4xng9NF5/CHY2+BTYJPacwcFU=
X-Google-Smtp-Source: AGHT+IE9Ag0OSHyGA5Ub/Fx9wqUoNKbuyV27QuHjK4T9nJtq4t6VeDDob1cXpM3apdfQvXmcLe+89A==
X-Received: by 2002:a05:6870:d1c9:b0:1c8:c22d:1130 with SMTP id b9-20020a056870d1c900b001c8c22d1130mr884510oac.21.1692415276182;
        Fri, 18 Aug 2023 20:21:16 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id ch16-20020a056871c41000b001c02f12abd0sm1728265oac.38.2023.08.18.20.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 20:21:15 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	me@crly.cz,
	uwu@icenowy.me,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH V2 3/4] dt-bindings: arm: sunxi: add Anbernic RG-Nano
Date: Fri, 18 Aug 2023 22:21:04 -0500
Message-Id: <20230819032105.67978-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230819032105.67978-1-macroalpha82@gmail.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
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

