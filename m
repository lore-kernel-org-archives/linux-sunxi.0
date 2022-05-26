Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733C136E
	for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 20:35:55 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gi33so5143677ejc.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 May 2022 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/SCC9DI4NqSSW7S/NUXkqtiUZch9ON7hJPhwPKitPQ=;
        b=tIaDNjPAhNPsJ43tXLVCNZIivpqGDhqstWZA9iDSu2T40KGEgEljzp6Zy4S/Xhs2H0
         lRK/uMH62oMNOFTOdiwRKGJ8T2RUPylfyw1vk/DZTx4WpQxfOoHx5mx60kUlDCSQjdPP
         zC4DcR8j49DWqi5Zwq+tM60N27rRRdbQ1bgg+B5LEq/SUzrNrTh8ofqAA17pn2iQvXcn
         R7Sc7kAMttVR12JfEjxf7sz+DjOzL3XevhG3o/BvAZ75GM3i7bjTWKvW37knhyZsA3Ow
         itzhBYhSH8eei6TBX9IE+jJzghx/tYuPHs6zCFkvgdasSe944cZrbuQDP/JMpffso76a
         OrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/SCC9DI4NqSSW7S/NUXkqtiUZch9ON7hJPhwPKitPQ=;
        b=k5Um9YfL9TPhddpP73KzU2DAGf1+gdYD14m8iukj/EvZ/KaeTABcKydAYfVnzsej/p
         ANVyZ4kZCz93ZuvAKXrG/+ToupepDvsL+R+Bfn80ODw3YZqYsWVYHEA71CkhPeoeEDU3
         EfxmlVYwEOabsRYfpJX6RO4t+eMETQV6D0UTKHX6Jw9W2nZizZWMsnCkfRl7p6twYvED
         943xf1xz5mEcvLwhrzsYQaGNzOAXJEMcsfOmFARDLZOWWKJuVWb0WT0JICkUYvt3WZaR
         YjhMhk24x6aYN9Hpn/EWckzZvSbjACoaiBBrRGTTCE5/oZzrp5Jwc+X6CleaySd5ao0j
         RR3g==
X-Gm-Message-State: AOAM532lvH0uVPsWrWheq4GfgbU1zMWLkD00kHPaXViBOmMoGAnb2f3q
	ds+1FombdlOUhBhVUHFN7ZuUtg==
X-Google-Smtp-Source: ABdhPJyHNl4pZZppIHg8EzNwgODTRV3IGY7nIC/Ip5fUERyopxZ5Oi+VGZrX3rjj0cMC/hCEOnFGEw==
X-Received: by 2002:a17:906:25d8:b0:6fe:9f11:3906 with SMTP id n24-20020a17090625d800b006fe9f113906mr31337266ejb.538.1653597353195;
        Thu, 26 May 2022 13:35:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090652cf00b006fed8dfcf78sm807631ejn.225.2022.05.26.13.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:35:52 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: sun5i: adjust whitespace around '='
Date: Thu, 26 May 2022 22:35:46 +0200
Message-Id: <20220526203547.830848-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/sun5i-a13-licheepi-one.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a13-licheepi-one.dts b/arch/arm/boot/dts/sun5i-a13-licheepi-one.dts
index 2ce361f8fede..3a6c4bd0a44f 100644
--- a/arch/arm/boot/dts/sun5i-a13-licheepi-one.dts
+++ b/arch/arm/boot/dts/sun5i-a13-licheepi-one.dts
@@ -67,18 +67,18 @@ leds {
 		compatible = "gpio-leds";
 
 		led-0 {
-			label ="licheepi:red:usr";
+			label = "licheepi:red:usr";
 			gpios = <&pio 2 5 GPIO_ACTIVE_LOW>;
 		};
 
 		led-1 {
-			label ="licheepi:green:usr";
+			label = "licheepi:green:usr";
 			gpios = <&pio 2 19 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 		};
 
 		led-2 {
-			label ="licheepi:blue:usr";
+			label = "licheepi:blue:usr";
 			gpios = <&pio 2 4 GPIO_ACTIVE_LOW>;
 		};
 
-- 
2.34.1

