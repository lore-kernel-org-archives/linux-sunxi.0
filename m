Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF54148829
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jul 2024 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173123; cv=none; b=nTz6kFNtA3ui7jXhViENzx+UtD4d7xm2eSO0GWI9jS72yCZdECDnp2vVi3uCKsd1+YPbW41YTq92iTyU6hM4Pxz70h3aA7uStiizSTpkwYbOhw2zeAcJWiMDFiqEWm+uKHDUDnIT4iutOx6FAwzwxXWbB49Tp7LDnX34ZqaARdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173123; c=relaxed/simple;
	bh=c0XiyTVpABMLT9+EMpR818Up3xsjTqaFTXr9Uw3kjSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sldlkpD9YXnKNr1MGKY6Pyu1wP5F3HKOWGW46rMim8YO4Yvgq4MaOumUMj5gOxAuxsTLykjzSL2G1k0IdsahMUEdfr8oE92R5yNwHLxrVUSJwNTi6rafbfgBOAE68mx+qAGYBCUdfReO5opHgexKM4L1+ltny6UX0+8ODFC5wiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1N2ckED; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1N2ckED"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e99060b0dso1518753e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jul 2024 02:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173120; x=1720777920; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sX94G3G6DNIVjmJouBvjfOrzcAghl2zsNWK4O0NrzTs=;
        b=k1N2ckED9H4yW7hQ1O6r+cWP3NbIlc+x0ejMu7ZkP5LdIncK1icOIi+qQLtnWymz1L
         F7+IW89qGcc0YjF9d/Q98mYJeJc//8NKjupro/GT8wpHNu4vEpxHpzzct0hXYct2sH0M
         /j7vobmdpfcmPphCgGJGhffBi7MdXXXNo3euOQIJ585pExzAopbCOM6B1+gbH9g7XLY+
         cYv40LmoKTP6Qiw7km2Y7y60yLzxvUrEEckCgAXhcANT04j+vz8itBpdu5tNQaWiz6rj
         3VfAR1RaDytwrxdUNRDKNxx4TpJvb9pvN1Q+DPP1NbLcE5wuGDrX6Y8RpaNbSjgYfhJB
         oItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173120; x=1720777920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sX94G3G6DNIVjmJouBvjfOrzcAghl2zsNWK4O0NrzTs=;
        b=iRuPGjNviV7dcyBhEghGPz/hb4IaS7Jmsj6IJYI7/3Y0fGkJl2zoJQQ4NuP9ANHx/a
         AJVaL6vkh0cOHi/GbwFc9L+YmfAorlegItGXEcYz8GoTi+xnDysjW60ROXteCLlXrmOS
         8u6MlTvxZo4dvHInpZn68GS8QeaKnqHcLcXhp9GjKQ2Mw1ExaNBrMjuzg6TnZ94FTNjg
         0I4Yr+mXu7rK6hohf00JtgE/SR8w6RPTWei+W5frToj9GxCi/sQhTBgJLo8jkL/k7SBi
         Y5PUJn7rW5CtRG8tEQDet4tShdA2cO+p2YufKnBwUmaz0Hgs0WCbup0N1R+p7rTLBJeX
         ET6w==
X-Forwarded-Encrypted: i=1; AJvYcCWud36bPM9aBLJCr0bQLCDv/mD2MF/X/ensIyKUw0k8JmAj2l1WYyVd73q6MxLu4fjDzG/NuWOdt4UTY7QmdSOd0RXuwVslO2qgVrQ=
X-Gm-Message-State: AOJu0YyFH4zlApMw/h/tTXiMI3niPz8FOrskDgZRg3DfiiEGZMqPZjZk
	et+3jz9Y8tAapYsW9ecpQeNlq3JypdGgPDHPL+R8c+Mvlduxk6B3Nt3W1v9mimg=
X-Google-Smtp-Source: AGHT+IF+cdoYkQWC4AuXm4t1/MTS6fIyqRyTkQRHT2EwhR1xN1harUysDUC1D2zux95zBTvcXoiJEw==
X-Received: by 2002:a19:a412:0:b0:52c:d6d7:9dd0 with SMTP id 2adb3069b0e04-52ea06327a6mr2528352e87.20.1720173120019;
        Fri, 05 Jul 2024 02:52:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:51:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:22 +0200
Subject: [PATCH RESEND 03/22] dt-bindings: thermal:
 allwinner,sun8i-a83t-ths: reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-3-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Vasily Khoruzhick <anarsoul@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=c0XiyTVpABMLT9+EMpR818Up3xsjTqaFTXr9Uw3kjSg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8ImyihnA5Unad+tgAIYwIL8zn4DXK/FwOQcP
 pn+9KtbW2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJgAKCRDBN2bmhouD
 14EDD/9R3GhWyejZrRKYg1VskD4rihePQWBSAL9MpEwdP8qSNWedYZoSCrTCGXDyr0I1UZn6dHg
 AgeF1KwhkQED5bKmFkL1afLfdppDN5zKG5O+6xzIVD0AeGk/1s6rTJY2g9Bx0nPJWT47/VJTNC+
 EK9SWoxfsHyZzyQgvWSrN1KNK6ZpSdiAXZ4qt8Hy2c/69v+0Ln5qsN/h9qk3AMmNk5p+Cx/begm
 zhnvKluexhqmwtfxuhuidO5gdpqNy75A6Kb3fhOvfhkhGScJGNGaWBKBz2zgA0Sa4ePQbnp5S4o
 AgBFMadaYYZa78grqVywbeV1niuDtPfcbWw/lMBFqGOThwzE1euxdDJaBhuj05wnuQSlU/FbwH4
 9SVWGF9srqBZlFmmd3khXFRFAa3ZCQjBvOx29bj4q+eMEEjiCBzsl4aNIwD16i8KhQbv1HOZt03
 gLUF2oN9bNl1+yk7c8HgruM88GLjaqpn0cBJmMf++N0OH5SWRADDU5beynVaZNp1VjD0Pgn5ieG
 TodWbk25QOMJHplaa3j5cb1lp4yDvPIUSZtdS6FenMOUhNTJ9OOrzp7hrz5+4qUjwYWemRPvb2v
 UypuFnk/8iRLrCcYdjPCZohp8CrIUuF63Dvr/44R1xef7oq8DTHeuavgg/wBWMSoHChyhnW9QbM
 OQOqu2vFEKib9Uw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

