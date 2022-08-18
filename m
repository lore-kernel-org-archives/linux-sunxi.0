Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453B4A04
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 20:39:38 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h5so2198961wru.7
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 13:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=cz2xkGMsvByC41KkhoxRGFhYkqJUO48ZE7vPhgR2CEU=;
        b=RPzK3EqVWgkwzhrUoWt9Lcth8291nLaD3ap5UBCNJePslUbdZbSUUokVZAhDTIH5QU
         qyEsKGtI5d3wWdjrdU7uY8JeUnOdQereM3LyXEzUTYoX8eeYKp3RWDOozT8jgz8AkH6p
         /mgmfdjX6W9DlQBOX+kGbZMzIHrH9S2FdYAV1GOdxiADvap//ERYrMq+C5L+0AXbN14n
         EwUsmfqHnLotsYHEGX1OImAIWnQyifI5bv2miQXdeN4NMOeu+iAhT/QyPqRs4l4P+Upc
         tz1zP954RUSNCSDi4O6STqrBeBn8YrMLXHTxmZsVfXJJ+M4217EMjIBxitEqs3oxH6qn
         86Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=cz2xkGMsvByC41KkhoxRGFhYkqJUO48ZE7vPhgR2CEU=;
        b=jtJsS0tf3g1S3LOLv46hhGucTg12rEpX/SzHtA1mRfO4y2LpiSJ/8sA7751jMgFFVD
         vRv7hisSJWKZqeoAvUap07NE8BQnrIm0Fb1Wf1ztJGnAdx39D0pLoSdQ6I5CCYoyBb/j
         l0RAy9D2RylBap/xkYEovSiXFKTxVorUTlJjVme2M4BkIhh0otxkGPd2XWZwoigqECrj
         6kMyKu3eI+lZnt+Rh5FUBI5NthWSg4Zt9qrimo63aLQmcakb88/YaXe8jcWQ1NqxrLW7
         mU9qYrZP4tRs7DNmh0m7D3dGMNAnVyk/Nt241ybyGriMlQiYZMs+TuVLxVvXtoewVOYQ
         5bEQ==
X-Gm-Message-State: ACgBeo0VDXObWg08Gy1RNRPrklPpMioKrBNAqLiZ1+kxX8knnXICCX3Z
	N4gam43LBMadJdhccT6tu6k=
X-Google-Smtp-Source: AA6agR41I9bNS4f0/4x1g+p1U1HKuv/Abo8MyzgVn0XT48d4RsvzRO+AVYBgyJKukDc5r3B99a2LbA==
X-Received: by 2002:a05:6000:1d82:b0:220:5f9b:9a77 with SMTP id bk2-20020a0560001d8200b002205f9b9a77mr2440848wrb.622.1660855176518;
        Thu, 18 Aug 2022 13:39:36 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000c0d3d00cc34c67bc193cac8.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:cc34:c67b:c193:cac8])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b003a54d610e5fsm1571648wmq.26.2022.08.18.13.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 13:39:35 -0700 (PDT)
From: "=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?=" <peron.clem@gmail.com>
X-Google-Original-From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <cpe@outsight.tech>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Thu, 18 Aug 2022 22:39:26 +0200
Message-Id: <20220818203928.131059-3-cpe@outsight.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818203928.131059-1-cpe@outsight.tech>
References: <20220818203928.131059-1-cpe@outsight.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Péron <peron.clem@gmail.com>

Add a simple cooling map for the GPU.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 5a28303d3d4c..943ae5374dd6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -186,6 +186,7 @@ gpu: gpu@1800000 {
 			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
 			clock-names = "core", "bus";
 			resets = <&ccu RST_BUS_GPU>;
+			#cooling-cells = <2>;
 			status = "disabled";
 		};
 
@@ -1075,6 +1076,27 @@ gpu-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 1>;
+
+			trips {
+				gpu_alert: gpu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };
-- 
2.34.1

