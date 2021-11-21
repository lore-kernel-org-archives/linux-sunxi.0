Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B982C80
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 07:03:27 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so14001849wme.0
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Nov 2021 23:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5wISGq2t2SDmY1fBi1n88KuPv1Mb+rVK+4uwhokCpSE=;
        b=cUn0+vQeVAB6Up16OIJRP5NyDruX7H2Yk/ZJ/kn9X0V8SxWGSGWmBRRcmJNF7cDZ4N
         rnGE/btBqG82tezCe3l1x/nVtOwCI8mH2jtbnYDwKQocVroae5Ncbh2Co2hdv+KEaD9C
         UakkMvh4pX/tG7CyL2GUqi6s01OnXTb8yQ5BNxOrHw0fZosXfrBLPJwcYxmzX43fEcbN
         NzrDuvFlRQ9Cy8gBf/I7xJWdBny4XmrgBtVz7Rb1xU6j9x1rCptI5GJMLij9D1wCSc4u
         sS5hA15CKV/aduifqxcneKJZzyMs9tzCw3iBQ5xGi79TKxvfz8wLeZEZzV9hEhuQGOOo
         3JjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5wISGq2t2SDmY1fBi1n88KuPv1Mb+rVK+4uwhokCpSE=;
        b=dwvMjZQi72wIZa+IjvBIXMS7kRCLGplew8m2kQQSbMg6W9j5JaMHWpK4jYbtxWmD0i
         aDraA9jO2BgZreZwQseHfL2sYo/Sns139Qb2tHIlJ1a27szqhS+t+3AKlwZ/LYTGC5M5
         czdZAE50ctZnL/LZ+YR6sUpgUMg9uw/Zo50k84QRjKVaalBol5fvbD1HQqh2CiZk6f4h
         OMjgoOI7aEbUfMNsk0xQ39HTUdANEOV24IHrBSb0wwf5TKnzKlknP8tnXnH9ZqmJyK8m
         Ptou6F9KhRDxk7wl/91oUUZ2t6x5F64oycIpXSqK8xizAp2xQGB+CjcFM65bs9X0Vyq0
         8mXA==
X-Gm-Message-State: AOAM532qLp6SAFgqeq11P6GfyCrAve+xsC3jnBoNEV/GcBySckZZIljs
	uGrCiup3fl4M67hmP79lg/Y=
X-Google-Smtp-Source: ABdhPJzLvfJDsRut5KiPWWiiRTblRiQR4SJ5SdmjWPKji8bryNV+1aYeFMsm5cenajTowWn9FuY8ow==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr17706610wmh.117.1637478205554;
        Sat, 20 Nov 2021 23:03:25 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id d6sm4886620wrx.60.2021.11.20.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 23:03:24 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] ARM: dts: sun8i: h3: beelink-x2: Sort nodes
Date: Sun, 21 Nov 2021 08:03:21 +0100
Message-Id: <20211121070321.601659-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes are not sorted alphabetically. Do it.

There is no functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 28 +++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
index 4ab4bbf001ba..cd9f655e4f92 100644
--- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
@@ -93,11 +93,15 @@ led-1 {
 		};
 	};
 
-	wifi_pwrseq: wifi_pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
-		clocks = <&rtc 1>;
-		clock-names = "ext_clock";
+	r-gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
 	};
 
 	sound_spdif {
@@ -118,15 +122,11 @@ spdif_out: spdif-out {
 		compatible = "linux,spdif-dit";
 	};
 
-	r-gpio-keys {
-		compatible = "gpio-keys";
-
-		power {
-			label = "power";
-			linux,code = <KEY_POWER>;
-			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
+		clocks = <&rtc 1>;
+		clock-names = "ext_clock";
 	};
 };
 
-- 
2.34.0

