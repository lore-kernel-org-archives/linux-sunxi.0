Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25311C26
	for <linux-sunxi@lists.linux.dev>; Sat,  6 May 2023 07:32:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f417ea5252so1699845e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 06 May 2023 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683358325; x=1685950325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/p1ytnQh6YEGVhEhqDXJrPOG30ZOWl4FCmbFIXesQs=;
        b=bHsdH9QLBx95JODO+aI3BTZ9JpWH80AULgNrIwX35ln3QWMnNrfyonN+IEHO3a2qXT
         zQayMOl3UCEcpbg7SLIxbGxSaxH7wpxwpx3k6GfGLVqIOq34mTLj/N+WmeALlM/BV8QJ
         1Yg5TejIXbppSec1n7g550mo+9+Ow80CwC8KhpOwO5B33fezYPoOP1ue2+MnAAhZR7aN
         JYTD8eG2esMfafDyBkIrl8YCg2DAoQqQYOlOqcRt0aAiXAXbBP9eR0f06G21todRHxqn
         emMzyrfrkGuzCNT+6qaxL0Pc0Ktrb3COiRtiFN7x/LlK6Ftkp/pBQI9OGoIAW5IOERVy
         l0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358325; x=1685950325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/p1ytnQh6YEGVhEhqDXJrPOG30ZOWl4FCmbFIXesQs=;
        b=eeU2a15Ixbg153ec5SBu1T6tdAOCz0vClipn7xDSNRCrJ/HesqimGjko28xAiNHpOH
         bS3s64alP0HPPffxw06zxZaQcuZmB9zPv2qLX1joKFcIN9D8n1BCULVudyUhLFB976UH
         5CqsJks3e09JtRo8yFR2goQD83z93i28DJk2tXMF6wVcQzPnHQnLtulqvnIeVKtVkCcE
         V2Ph2uoMWl3miwDx5oXB5bCz7+5OyRnf8hCgdYiExua7o9f/GEdU03YUEnUl7Sc81P7U
         iZlmOzUMC7//wwJuaguX8XraXK6zJ262SSzqVoH+OBO+ky/hqRDRizZO5Vtggcs324IZ
         WuCw==
X-Gm-Message-State: AC+VfDyY+kg02Yis4GJbiEq+lodUiscO2Twh0SExK4AnEHp8QK9/8vc1
	MFXOVrj7075j2jE6oQVjjys=
X-Google-Smtp-Source: ACHHUZ6JTn71OUBh2OirtFdnyg6dCjdW09TDzjxul9OlyXa2r6klaU6in0h6LXx3WvVWtVJrCWb40w==
X-Received: by 2002:a7b:cb53:0:b0:3f2:53a5:d308 with SMTP id v19-20020a7bcb53000000b003f253a5d308mr2586133wmj.6.1683358324784;
        Sat, 06 May 2023 00:32:04 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm10071944wmj.8.2023.05.06.00.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:32:04 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/6] dt-bindings: spi: sun6i: add DT bindings for Allwinner R329 SPI
Date: Sat,  6 May 2023 10:30:09 +0300
Message-Id: <20230506073018.1411583-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506073018.1411583-1-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Icenowy Zheng <icenowy@aosc.io>

Allwinner R329 SPI has two controllers, and the second one has helper
functions for MIPI-DBI Type C.

Add compatible strings for these controllers

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index de36c6a34a0f..2c1b8da35339 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -21,6 +21,8 @@ properties:
     oneOf:
       - const: allwinner,sun6i-a31-spi
       - const: allwinner,sun8i-h3-spi
+      - const: allwinner,sun50i-r329-spi
+      - const: allwinner,sun50i-r329-spi-dbi
       - items:
           - enum:
               - allwinner,sun8i-r40-spi
-- 
2.39.2

