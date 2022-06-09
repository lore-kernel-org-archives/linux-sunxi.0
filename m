Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69827A
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Jun 2022 11:39:24 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gl15so33028940ejb.4
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Jun 2022 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S/Iyhr3Mwr1/UaDl6/ye/BNS3vuL4j/ikUzThz7lvvc=;
        b=BkcyjVbmqgJLXxxpG0tjNrsiP4G/fJ60EsNHOJWUtbgrY1qCdzdhaPm5SUSWXnl0vo
         R+xtqx2Dhyn+2+hz28TQMps9+bMFj1aGyois5HorVpF3/Q4aFO6zXsBlkc81gRPbXp65
         /WWrutLtVhXjj+JnFJavnpk6ngRUZ/r280lPDGdD2MYKA3EYqSZJ5/hwgUkbXCC7K756
         75qRP6JbG8wsNITUK22s0KuGGfXw79ZxdabwEQTm9ZAGkWyUtZRxBUIYsUfoiUGGdvC5
         3E6gvrsmWFsvkamd+HfER608MxakEpme47E1ANpMtso28NM7mK6t8vOdlVAIVSM65vvN
         lPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/Iyhr3Mwr1/UaDl6/ye/BNS3vuL4j/ikUzThz7lvvc=;
        b=uPHSEZMRdM4owoxa5dUWZmsMr5pdXwRyUBPzfgEgJ7EIh8Gl5iVIVElMGFnw1YTLxl
         5sQvju3xCssizUQmNNaWKyZ0aPw2dXFuYfjC6ltffOqJqd1/nXxv4O0336UDc40+w+43
         1VNgqpYUGNFEFAoXeO4KPQrpzJeYmTN+a/BsNCS/MkTFCzdXC9Z0u6vXC83J7Arxix9x
         R0CbmH56TRdrhpjD+dJgHypj9SVHr3ntBd16wv+ITiQlWmE+wUKBGbjRU0bk6SViofrp
         Kcvwh9jEA8jfVShzZ3L3Y+XC2Vdg+ynOCp1n/l3aXsF6Ii7b6r5DVcoo/rMgknutQsvT
         qwlA==
X-Gm-Message-State: AOAM532YK//D89SfEsOt+X4lwNy6YCSIPZf0stbjXgyDv4ohYk5Z52mh
	/0bBgasBRCGIakdrLbpmDrPlvg==
X-Google-Smtp-Source: ABdhPJwQMIc3Uo+Ew0KdGsrt/Gc0dKGNxXahzqr0DO79q4xdDDGhu38fN93TWtCnSdX63yIKmiTRXg==
X-Received: by 2002:a17:907:6282:b0:6e0:c64a:60a7 with SMTP id nd2-20020a170907628200b006e0c64a60a7mr35588659ejc.349.1654774762958;
        Thu, 09 Jun 2022 04:39:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 05/48] arm64: dts: allwinner: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:39:07 +0200
Message-Id: <20220609113911.380368-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts      | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts  | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts   | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 63571df24da4..620cb3ef5f6c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -35,10 +35,10 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		lid_switch {
+		lid-switch {
 			label = "Lid Switch";
 			gpios = <&r_pio 0 12 GPIO_ACTIVE_LOW>; /* PL12 */
 			linux,input-type = <EV_SW>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
index 55b369534a08..a3e040da38a0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
@@ -52,10 +52,10 @@ led-2 {
 		};
 	};
 
-	r-gpio-keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		reset {
+		key-reset {
 			label = "reset";
 			linux,code = <KEY_RESTART>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index 1010c1b22d2e..b5c1ff19b4c4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -54,10 +54,10 @@ led-1 {
 		};
 	};
 
-	r-gpio-keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw4 {
+		key-sw4 {
 			label = "sw4";
 			linux,code = <BTN_0>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
index 74e0444af19b..d7f8bad6bb98 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
@@ -48,10 +48,10 @@ led-1 {
 		};
 	};
 
-	r-gpio-keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw4 {
+		key-sw4 {
 			label = "sw4";
 			linux,code = <BTN_0>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
-- 
2.34.1

