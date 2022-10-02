Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897862560
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Oct 2022 09:20:02 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id k10so12788175lfm.4
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Oct 2022 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=bn11ROdfdpwm+pLhcHHe/jAlddmxiu8wNOBInX3vz4w=;
        b=GU5T016DesMRb9PWPeNsraKqC6o3gment/4VYhGD58OgdKU09S5jsltpJEvZvLjECx
         2H9vElfbdIhRAOeALFeqbwNUprSnbkHx1VhSQ/dVAeQACQmFI7EthGCLNk11U5eGT7qG
         Co8IYFKnfA7aAbmXfBNdZr6mTpE1ViHMcHSWQAeSX5RNJAkwW1xZIb235UEtIKmOs1XX
         9rJrdXbe9zE2HYGYzo1y1g6lwGny8J0EAdJtrpMEZpz+omhDeZkgQzv51M6IvHAn7cP9
         fmxWU37f8ECDdeTMq/u48LXaYJsIlLQu3e1JZea2HoTLiMnBf/Kp57zRJ/3yzYuK+SFX
         h/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=bn11ROdfdpwm+pLhcHHe/jAlddmxiu8wNOBInX3vz4w=;
        b=lZHVp0E/gqHoQL9RIcbIUal4PC1mBAAQw1WLKBxWrW8NEEOw4/7bvNXvHX3DS1RGHt
         pZxTXn0ZfVt7pglN9U9rQEHMLJVUbrTVGZ8UvNSZJHz7kHf83CxVBnmX/etxZyM1Co6D
         l/gPpH32ZyTHC38UkxBO/qPM2+oX0nn5B2iw2M0JWwGoLhrJYruws6Rx+znqU28jgKtA
         dKhtzpU4LmRNZhm0+mo1W0GkqSVaufrlXGvnW6exKPqkfF0MFoLuTUg+EUL38JSqQrQ1
         h6/kKr5CX24fhSXN+DkAJTZqq7UxtoWzKfmmUNywmVFlGPO5jEMMSHKBlwnlvr2Ltt0x
         gqmg==
X-Gm-Message-State: ACrzQf3K9gyslnnEumeO3bwVXfGl7tLk5n0rZT6K1imyGEaSYYkJTnn+
	KHnZjtpC1YjrRfV7Cz/gYqqHXA==
X-Google-Smtp-Source: AMsMyM4w+lYlLKZZhbkKGhO/XiQI77DNkWVpKV2Sw19tp3osAwXYr/rhRfgU7y37lA5+ODq/z3Ok9w==
X-Received: by 2002:ac2:5384:0:b0:4a2:3a45:520 with SMTP id g4-20020ac25384000000b004a23a450520mr440227lfh.560.1664702400558;
        Sun, 02 Oct 2022 02:20:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j2-20020a056512398200b0048ad4c718f3sm1026393lfu.30.2022.10.02.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 02:20:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: sunxi: correct indentation
Date: Sun,  2 Oct 2022 11:19:59 +0200
Message-Id: <20221002091959.68815-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not use spaces for indentation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
index e899d14f38c3..1d1d127cf38f 100644
--- a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
+++ b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
@@ -89,13 +89,13 @@ switch-4 {
 	};
 
 	reg_gmac_3v3: gmac-3v3 {
-		      compatible = "regulator-fixed";
-		      regulator-name = "gmac-3v3";
-		      regulator-min-microvolt = <3300000>;
-		      regulator-max-microvolt = <3300000>;
-		      startup-delay-us = <100000>;
-		      enable-active-high;
-		      gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
+		compatible = "regulator-fixed";
+		regulator-name = "gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <100000>;
+		enable-active-high;
+		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
 	};
 
 	wifi_pwrseq: wifi_pwrseq {
-- 
2.34.1

