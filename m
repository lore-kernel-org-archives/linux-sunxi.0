Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2103200BA
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jun 2023 09:59:15 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-970028cfb6cso88516466b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Jun 2023 02:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685613554; x=1688205554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gUTL11vnxpXlxWq5vLbzbP4rLUK3lP3DTT7y0ZjwjY=;
        b=Tz8PHzxd3P6JoImzVZfGM0u/T6P315gIEMdY7tO8FaC6ffAHK7T8lYXwPvgPESVvh6
         DNI9aXvm4jS9HaK4ECQZITBJw9T+hmUOO+qToskw3HmdUh2nxixIj34Khyr9/215EQJ7
         cZENCpFYWsPJeeJZFb8+c8/E55l2kuePHs4rrHFYptW27H1dPzwjlmnaR5Zgx/H6Q4Ji
         rNmvet1Nk4LP/5gIzUnULm3AlDQWHdj2YF+CKYypCl3CwhloMGpSa1MmlhaATTgfYPak
         Dtvs2pdMyz3YVlsAkPwXTFxQRyyq3FVhfkU8U4/r8BhF+QeHh2dDx57wHg1fp1lp1L5G
         84VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613554; x=1688205554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gUTL11vnxpXlxWq5vLbzbP4rLUK3lP3DTT7y0ZjwjY=;
        b=EsftXw0o5ACQMIz1aPITOXg7k1ZUML1Sv0b4M9SuH5i1iEuDWtz85CIz8v7a3TsdZl
         IkVKFF2TPBHoqrmOjGysVeaGyEWkOJNKlzPnzG4nj9mPY18IZTVNTzsLN+M27qSW79NF
         M/aqgsMFJNR+Imvrjmqh7GzGp+X7378fNNrBnd9T8CZtfBvt/Yc2Lz49i0zXZoy5um3W
         4Em/EqzG1o2gBVMOqemYTpRr57GqzyWR/GRouZqkP7h4UOZATVUk3Z5JeB3+zdT8nAKU
         18zY8926SVEJF7OIOWsqcc1ni3YaV043GkEh9X07SYyIxgDYhutr35b/a6uF6MW8HKi/
         iiCQ==
X-Gm-Message-State: AC+VfDz7tiRqA041CFFx69X0rK9VLe2TmoDaczQWeKmBdhHoRGa+r2Ff
	+zvQukYkSmhacsCFbAJXcxWh6Q==
X-Google-Smtp-Source: ACHHUZ4I/69J6jg295rv4mi6qZgVezEeoosgJf5jB21FRODGPlUpK10s+4Umt6GwBaU0uBaGgYM0Ig==
X-Received: by 2002:a17:907:ea7:b0:974:1ef1:81fb with SMTP id ho39-20020a1709070ea700b009741ef181fbmr7716468ejc.22.1685613553897;
        Thu, 01 Jun 2023 02:59:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709060a8b00b00965bf86c00asm10475549ejf.143.2023.06.01.02.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 02:59:13 -0700 (PDT)
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
Subject: [PATCH 2/3] spi: dt-bindings: samsung: drop cs-gpios
Date: Thu,  1 Jun 2023 11:59:07 +0200
Message-Id: <20230601095908.563865-2-krzysztof.kozlowski@linaro.org>
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

Remove cs-gpios because it is already mentioned by common
spi-controller.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/spi/samsung,spi.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
index e0a465d70b0a..79da99ca0e53 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -35,8 +35,6 @@ properties:
     minItems: 2
     maxItems: 3
 
-  cs-gpios: true
-
   dmas:
     minItems: 2
     maxItems: 2
-- 
2.34.1

