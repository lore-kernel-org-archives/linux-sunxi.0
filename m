Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4240200BA
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jun 2023 09:59:17 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9700219be87so82204766b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Jun 2023 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685613555; x=1688205555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqU5JKI8xSfMQrPkRhcyh7XPcg7Z1CafuGi9gOADxbY=;
        b=c3wBpLoondpO97ox5zj7A6M408bKWCj2FPWXD37/RVj4TibSerGEzjgQBS41qgW5wc
         vQV8W4u1tqbpUlIzl1MhylDtY6qO15c/qY5kMcT4Jw1I7kcWLhCMLzMjd8L6ul67rR5H
         5xMHxuvX28WFl2qP5hgJddbgKcSQfyfLMujKfiJ3U3d9yyJI9yzwEamW9BBOui0qxPhx
         ROyznF54XxKPNV565XxXC/dgg0JQdKEuylNoRvjmBHx1B82xatc8rXu2ql/GLuFfEE6e
         p/vP9c395lnGxJgpOU88NzMX4fq1qHhpCKGqDPpCyNdqdy+sePAz3V5cHCeHFHPVhp1b
         wypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613555; x=1688205555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqU5JKI8xSfMQrPkRhcyh7XPcg7Z1CafuGi9gOADxbY=;
        b=Geu3FlKPileM2KbkcgAQHyiR/YvK2opTi8YeO4lYbyu9cMyVDGYAdJeeGRV7Uy16Hi
         DxnEdUWa2kVBvDW4kMHS2RhInw17fEHQPBCSS263O2q+v0cW7u+bqw2/E49m56J0j3cp
         n2roQGeR87G/RsfBSV+btenvdD21YDyTTl32zde4dMx2HLkRcRZTUCA1+kGIwIW1NdEE
         +iIVTicz60DBu6AIryfqNBP7EoX8exF77Mxpdu9WEGSoyTrNvPeatRPbxRh0qQidiRoM
         LuJRtkmUN0VqCEqVkHxpzpmfQy9NkqAKlDyX8ShjPVBUTD7HcaXM/8h7W9wuD/xws0eu
         MHlg==
X-Gm-Message-State: AC+VfDw3hjN4zbJs9E42QBo1ctRFr4xt9CSpuK9sib1E4XjLd5kz/IFO
	RQqc/xkzZ8aDY+HoJsTUGPvmBw==
X-Google-Smtp-Source: ACHHUZ5gzkqt8SW2dNBwPi6OCmq0SOHL+UihiUONfj0SGQPvjb21q3GASr/tqkSrkQAZlbaOuaU72w==
X-Received: by 2002:a17:907:a414:b0:957:2e48:5657 with SMTP id sg20-20020a170907a41400b009572e485657mr6962043ejc.68.1685613555753;
        Thu, 01 Jun 2023 02:59:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709060a8b00b00965bf86c00asm10475549ejf.143.2023.06.01.02.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 02:59:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Keiji Hayashibara <hayashibara.keiji@socionext.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] spi: dt-bindings: socionext,uniphier: drop address/size-cells
Date: Thu,  1 Jun 2023 11:59:08 +0200
Message-Id: <20230601095908.563865-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601095908.563865-1-krzysztof.kozlowski@linaro.org>
References: <20230601095908.563865-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove address/size-cells because they are already mentioned by common
spi-controller.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/spi/socionext,uniphier-spi.yaml        | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml b/Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml
index 597fc4e6b01c..c96131ebbea1 100644
--- a/Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml
@@ -17,9 +17,6 @@ allOf:
   - $ref: spi-controller.yaml#
 
 properties:
-  "#address-cells": true
-  "#size-cells": true
-
   compatible:
     const: socionext,uniphier-scssi
 
-- 
2.34.1

