Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A424F1953AF
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jun 2024 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358402; cv=none; b=cc0cWDeuM51hcY6Zzo0/Y0Lt6jCCvUcR3X/pIvBhuNMMYBdKnVadRtsqtudUscsFN89SFR6trge44GzK9z8pfSML/DKZmDnED7pzxvo3t4OgADvEDgMqaajIsCJ9Wo74SUipvdBEi5u03xyr4PB7uqKtVOxXxHxoa7zO6KEy5xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358402; c=relaxed/simple;
	bh=pqCl6WSNZ+E6fqekvSIlU6dU++OoPCqjUP8VsibDEQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joSJIM4DH9R9sqxVyOGENrLSYe5o2WIZ5xW8MiqStzFiqz8q2ZMnZVYu8ISFpYGfmz2UvpjBQeyZXcqlNVy0YNu7BLFiJYh7JGhpZXBG0UWQtepuxUA1z7RhPg7njKdwnIhVRegfc1EjBkNWdwuvxnPLkCi/WVswE2nTXLOqP9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eEm6cdjG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eEm6cdjG"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6266ffdba8so231529766b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Jun 2024 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358398; x=1718963198; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cr7ZU9G194hlc8n7j4JcKu4gjqoGUN/hWHAGWynGrNg=;
        b=eEm6cdjGnP6uQgcZLl0FEjRtaLy8JayO72wCBg63X2QdE/lmOwUWZ7ZWeM6iffOCH2
         MRxut6nz8FSPOAR8c2qYOX0b0JtDAYcqOnMf++wIDHm9QWayXlhO2tMp4yXTnnrhSUpv
         GdTgOujn9I1uacIf6MlGdR39GM9bw/VBX3xIrTu0UxsKuAiMD4fW7wvceh++i+CrxxmX
         jv2NLtv2V8zVsKwC+pPwjw9O/I6MvUJoG+ifDwU/5jjGfD2YbPSJuLbXLLm+oPoznU41
         iy8EU88gxLmTvKVb1Gj5TZkXXuun6Tfw2ubqC0UadY79fHS+KLjnwfY5YdiiR44KTP7j
         1Y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358398; x=1718963198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cr7ZU9G194hlc8n7j4JcKu4gjqoGUN/hWHAGWynGrNg=;
        b=on3WmJwvdoiNLURhwuHM9jL6xQRI8zUXiRwciJ4RGlvalLLDn6UpGmcsJlh3y+gBhW
         QOalqfwx5wpWxe9DFZYdLGYXNAIBdFhfxOMaV3upycUjeeDCrYMndvf+mAscrSVS1lSU
         7cdhyzWgeZmCbummWh0zMKd/o+JVJfm84njbFxiiQReDkJ2xVGtJe5FsWGMRQ0Lavp02
         hjILHD8hYTOpuzfufQ7ZwsnZAgg1/Z239q0Pt6RhAyqgOoy3RdhEJRmIcIAVR928YT6m
         r2dVLOpTmNWMQIwrPGBrFqP3SVH7rA9FdSmWgSuRiTaoT1TgOCLGj2pnV5d6YWWjlUiq
         QyEA==
X-Forwarded-Encrypted: i=1; AJvYcCVyVqkwZ5l98uhu96SZjP28g3Vr41yEKWHzlLnNFzRF3wzvJNTbdJIHXKPJ9EWdNCdQQdIZAbJGfqsI3GTZetDY6GuZVlKU3K7O5Vo=
X-Gm-Message-State: AOJu0Yy+f4D6o3J5djDaGIYJx05GRD9BVJKpejlGjitoiRFmW7JULRjF
	xtgSwn2nWH1fYTkXOcqcZHWdIEQ0GWmP7Wfxyoeir9N+OZKXkmp1YaIx5MI2DLE=
X-Google-Smtp-Source: AGHT+IHiApvFgizqKb5PxsiSYsmTQo2XV49uKsbKfuCFgSBchSlxC/Tvt7MO+AjdyIhfL7sJHk+zZQ==
X-Received: by 2002:a17:907:72d6:b0:a6e:fe2b:7d2c with SMTP id a640c23a62f3a-a6f60d20efamr223840066b.23.1718358397940;
        Fri, 14 Jun 2024 02:46:37 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:02 +0200
Subject: [PATCH 03/22] dt-bindings: thermal: allwinner,sun8i-a83t-ths:
 reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pqCl6WSNZ+E6fqekvSIlU6dU++OoPCqjUP8VsibDEQ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFicW/zed6HD9sZ/rIZZ5Z9qa7jZiNkJeegi
 RF1eJ21IJWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRYgAKCRDBN2bmhouD
 10PRD/9oUt3N2mnmGeYFH/KKGNQpAkkPZzNeHgJYCCB3RtoVUr6bH1X69Kld14cYgvjn4S6sQrB
 IT13xlo2qgnLig0kZTeFD4rY0h7u8AHULSOjUEwEE54SRkHfHMVNVDvVuGFczSJMWAzXtMlaX4s
 b2xRwJ9PqsoS6IhaX1qlWLB8TikiHooSyPxHsnu/vSN2/Z1x6neDFEg6Jv1x6hEdq8AM+h8ZKV1
 So0TSOYO+g6p7fhXW3Rh4yquCTcW1btGXiqkwFoImrIfYLn4jJKLgSQlM4a8nYNaHY8wiQOw48q
 IKm+tL4q4s4dfwog/xYAvraJZPm4PQks2IkFPiUUsOdPRE4m20WHfyZPl1U6VjAETmHH7z9Y6z8
 8pZ/KhPlJXim+p0PleRAnfeNwjUztACsVDDvvineEfxTur6eW82NBvehUcqWxnUvtVbukbWAFMQ
 rA0appTCjlAQHucvNBPGsvt79riwmNa0Xsy3ahOSdlzbeeIA90arKvMa8X1D4TscvUOv6sHYBXK
 FzgN+UDGpc61PIKZE0k4J12dikm55m4v2MPIs2SEdII/JeMWHuQUWRnckfumWS0d6ewOjAnU6Fa
 zZbXaxuyJrjT8tvz/GdyKW5p+644O22rL9CPmMxpL/GACNcu5MZeLHoFF7CzjsWZUYNItlKzVnp
 yLCkGvOF5eKHdhg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 6b3aea6d73b0..dad8de900495 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -10,6 +10,8 @@ maintainers:
   - Vasily Khoruzhick <anarsoul@gmail.com>
   - Yangtao Li <tiny.windzz@gmail.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -55,7 +57,6 @@ properties:
     maxItems: 1
     description: phandle to device controlling temperate offset SYS_CFG register
 
-  # See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for details
   "#thermal-sensor-cells":
     enum:
       - 0
@@ -135,9 +136,8 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

