Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB583D67
	for <linux-sunxi@lists.linux.dev>; Sun,  7 May 2023 15:05:32 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f315735514so144185425e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 07 May 2023 08:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683471930; x=1686063930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWPFIpbopZ/dSPc8BXucXK0MKlLp5Nt0gvsNK/0CeEE=;
        b=NqJNHxlpTZEGCLOOoR9ynNB7nWMm5du5oJdDZV//VB8baAumsI9K0DyAbkEMe9f6dH
         ayQetIhPKX6l9aayF9h2FeVblROcT/I4vIWocwEkl25UMX+c7tEG9YfzgDEzFK2/FfrF
         fRsiI5Boh6Sjt9BmlZVQxn+kVIxKuQboI/25h5QHI2F52o11ah9WZVx+qog680vLB4Dn
         pVGpus9Qm9pPjK8jys4VOUyM1k9bZQRiKoVGcHttBD2xnltNLF7NNB56hg7eRo3rQmt0
         rha+vtWIdVgIGf2QJbbUe3vvyGJarCUjybV8rZ0aKNXIQcLrEwgqVHO03d9d8OUZ1Npi
         /wWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683471930; x=1686063930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWPFIpbopZ/dSPc8BXucXK0MKlLp5Nt0gvsNK/0CeEE=;
        b=Gx20BDlr2XOTGMLxce6Or5odvyIpKProKAB0KAUIXsid6zcKFR/V2hr6LCFhCaIbi3
         zfEtzD0z8XWSNnNDyn8MtelSb2MtDQgD0BFmKNxXzsIvhpjaggJoHf7QZ188319tVANv
         GeMgtBY8LTRv59+o5x7SSf/MLL2Fwd/J70IKDyam13Xcz8tmAOo9OZvddmfTe8ae5C9+
         FsxDHvI4KhIIfBRl0sbNtvBBEj64ImbUa8IANUbfri6+71jgktYk5KP7ok/WLyUzcqGT
         pIW2W/8YE3kT+gN9/UnWvSRdzl6zQYLVt2W83OMLI/w1M4s8kTtXh6W6jBR/u9DB+ZGb
         m8kA==
X-Gm-Message-State: AC+VfDwwM4VkNfzqcLPkisjuKm0HMW4u7sgDzBSe3Z8aQMnalQxXhuR3
	l9Pi9jyarLLgHwo0WR7Kdio=
X-Google-Smtp-Source: ACHHUZ7/e5Bbc9zRgx5V/xn6mDpperMU1AZZ37UdqDuQFjv/5xA2kL53z6k4AGG30/D4C2f50XJROQ==
X-Received: by 2002:a05:6000:100d:b0:306:3ec9:99c5 with SMTP id a13-20020a056000100d00b003063ec999c5mr5382942wrx.9.1683471930289;
        Sun, 07 May 2023 08:05:30 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b0030771c6e443sm8437998wri.42.2023.05.07.08.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 08:05:29 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/5] dt-bindings: spi: sun6i: add DT bindings for Allwinner R329/D1/R528/T113s SPI
Date: Sun,  7 May 2023 18:03:33 +0300
Message-Id: <20230507150345.1971083-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507150345.1971083-1-bigunclemax@gmail.com>
References: <20230507150345.1971083-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Listed above Allwinner SoCs has two SPI controllers. First is the regular
SPI controller and the second one has additional functionality for
MIPI-DBI Type C.

Add compatible strings for these controllers

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index de36c6a34a0f..ab2d8a03011e 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -19,6 +19,7 @@ properties:
 
   compatible:
     oneOf:
+      - const: allwinner,sun50i-r329-spi
       - const: allwinner,sun6i-a31-spi
       - const: allwinner,sun8i-h3-spi
       - items:
@@ -28,6 +29,12 @@ properties:
               - allwinner,sun50i-h616-spi
               - allwinner,suniv-f1c100s-spi
           - const: allwinner,sun8i-h3-spi
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-spi
+              - allwinner,sun20i-d1-spi-dbi
+              - allwinner,sun50i-r329-spi-dbi
+          - const: allwinner,sun50i-r329-spi
 
   reg:
     maxItems: 1
-- 
2.39.2

