Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A5C68
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 21:36:41 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id t5so83353829edd.0
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 13:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q52PugtsKbScXR0iC8aYXJ5jdQzIRNmws2e/xLc2+d8=;
        b=QGXnMVLI1HX+npMNJ5a50sE3Id5ih1HlSqJEcC3++rEek+BuOlIGjlYTRRL4pcwytS
         wL0gNSUKM5boQlnZzDsNFLAgg3s7CJgB+G7+hJL818C1vv5JAfT9WE/em9vDhW0HRUN8
         /OT0uAH6qmOrdY+G3KnOa/kvz5Ixs31CdRR7rvg51atrZVc+fvIi1SkLQBqsCVqNffCD
         zFQI5Lh2TmuLRzSNvUjtF0B2RyZlLJBXar6S8971/QS4lcTUrr3nmuTX6ZTcUJTZUZ6m
         +y1uZwQg/35qxdpj0Oo55PQZ2CYiwMtzBE1vpkytzKNyImKjF8WNYglBwkLKt2Bn2ZIt
         SKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q52PugtsKbScXR0iC8aYXJ5jdQzIRNmws2e/xLc2+d8=;
        b=uWOWUMWnXdRZ5y6fNTK1kq9LnPvdGlmpKNvksDgxk4BAvK+W31fhdkLMef7BHKuIpN
         gYRgX6f4NSDoIqkllYJGpI9I72ANMlI//RD80E9p9oHM/goMY1Fl38uO+HBs8+JDflyz
         TK+K2yTmKVqd38GJ2CaKItk/4k+qyQQSxfdx6YRIJkVJ9s1wI6svVvan2W6xqWqsJiE5
         c/aaII5KJnL+85i2cIQYL98/BBR5u3lQTsDDbc56cb9P+AQs5Y7nRPsiJ6ipqGC+1VWU
         KJYEdfdp36jyEeJwqZ6I0j/RvuvwY+kvxa+8P7cJpKJ8Bulk8HeeHiZeeJ7lCBgba7+H
         h4gQ==
X-Gm-Message-State: AOAM530DXewqzaC1fju80sF7AcIIMv2EWjyzksid8yACE1fsE8Tmo2Iu
	mVg8JJXlcWy4VJmPGvNcKgM=
X-Google-Smtp-Source: ABdhPJxCei9Z/kUcXQS/BMjoGAvP2+xkL3NLG58gfVZf6B7Q7DxrQB9mOwPFvkjzlD9mpqLXdK/X7g==
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr364536eds.386.1637616999810;
        Mon, 22 Nov 2021 13:36:39 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id v3sm4926458edc.69.2021.11.22.13.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 13:36:39 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michael Klein <michael@fossekall.de>
Subject: [PATCH] ARM: dts: sun8i: Adjust power key nodes
Date: Mon, 22 Nov 2021 22:36:37 +0100
Message-Id: <20211122213637.922088-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several H3 and one H2+ board have power key nodes, which are slightly
off. Some are missing wakeup-source property and some have BTN_0 code
assigned instead of KEY_POWER.

Adjust them, so they can function as intended by designer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
[BananaPi M2 Zero changes]
Signed-off-by: Michael Klein <michael@fossekall.de>
---
 arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts | 3 ++-
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi               | 1 +
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts            | 3 ++-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts           | 3 ++-
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi        | 3 ++-
 arch/arm/boot/dts/sunxi-libretech-all-h3-cc.dtsi     | 1 +
 6 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
index 8e8634ff2f9d..d5c7b7984d85 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
@@ -52,8 +52,9 @@ gpio_keys {
 
 		sw4 {
 			label = "power";
-			linux,code = <BTN_0>;
+			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
index c7c3e7d8b3c8..fc45d5aaa67f 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
@@ -81,6 +81,7 @@ k1 {
 			label = "k1";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
index 597c425d08ec..9daffd90c12f 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
@@ -99,8 +99,9 @@ sw2 {
 
 		sw4 {
 			label = "sw4";
-			linux,code = <BTN_0>;
+			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index 5aff8ecc66cb..90f75fa85e68 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -91,8 +91,9 @@ r_gpio_keys {
 
 		sw4 {
 			label = "sw4";
-			linux,code = <BTN_0>;
+			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
index 7a6af54dd342..d03f5853ef7b 100644
--- a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
+++ b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
@@ -82,8 +82,9 @@ gpio_keys {
 
 		sw4 {
 			label = "power";
-			linux,code = <BTN_0>;
+			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/sunxi-libretech-all-h3-cc.dtsi b/arch/arm/boot/dts/sunxi-libretech-all-h3-cc.dtsi
index c44fd726945a..9e14fe5fdcde 100644
--- a/arch/arm/boot/dts/sunxi-libretech-all-h3-cc.dtsi
+++ b/arch/arm/boot/dts/sunxi-libretech-all-h3-cc.dtsi
@@ -49,6 +49,7 @@ power {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
+			wakeup-source;
 		};
 	};
 
-- 
2.34.0

