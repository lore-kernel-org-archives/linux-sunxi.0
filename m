Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBF48F5F
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 17:14:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-502934c88b7so7454205e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 10:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694452452; x=1695057252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHC159t7V9+jR5+JKKYFZcnb7vWoVrDrxr51MoqDMR0=;
        b=gdMCf1l2Rpz5HUJGCcVhaKHh9B2XpmnueBOTJa4HTZ5UBeCVEXUlcUn+5agJAVZl7z
         0vrrhpBG9zpPOqFgNkS3N6YLiK1Ax+k+UdftyEreprJj8nB0KUfk+rbJgl3WW5AlS5Bk
         z6s35iTY7aj3Zl4d5aFFP/B2ejETbdYQLd40aYWq74OXc3qY7TGKYrKeBDW5x5+6EcRU
         mzp3vydkk4dP4Vi+mRHq+679YBGuuma/qKqFN+RDE/gfCvoO0xFjgOuca1mqRuaZE+6K
         vDTmwXi5/yl1CS8NYT76+SweRJNg69OorHDxhbQc5Y7BV2sStgCLNnIE6UV4Qitg5qsP
         DFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694452452; x=1695057252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHC159t7V9+jR5+JKKYFZcnb7vWoVrDrxr51MoqDMR0=;
        b=S++b61k0CUi3m4X80jg5vBFmbrCd+Hrwbuq0/XsQy3icTpm/NljQcGNCd4wZw5kMI0
         6i1yNorpaYDlMF6A8M/2EUBkfYxCi7+Ix89tMK4WlElsKzY/7sBxmE9d8l0xoqFR2mdq
         DdJhMxTaxiSeVDSZBMDMsasGb7AEHuD3jPNxutPskYmtYOQwNg/sr6m331ZgX3COgxhq
         r/f8mhsajOHyjRBXzXBd/D3ItSXBdQ9fT/lyOgMQAFG92LYdhS7Hjc4/0EzP9pSbgrKx
         PYQ30AHaRwSGfnWDOtREUr2GAqKIo+1sc4HcarwerYSxoRNmJKvry12mGI+280ORxuXH
         q+YQ==
X-Gm-Message-State: AOJu0Yzdw0U9YX0RG4QJdwyxCSB0ulpfH6kv/1Kmi36dHcUwLIZY1oNK
	MrSpwzuenxyUFv6iY87Z3tE=
X-Google-Smtp-Source: AGHT+IEwQdzEpm/rkWP0lYNwKEDMgXRO32q/LHTllN9ths+CuNHroYFDnlnZss50NYMaaERchNT6MA==
X-Received: by 2002:a05:6512:3e0f:b0:4f8:4245:ed57 with SMTP id i15-20020a0565123e0f00b004f84245ed57mr10590985lfv.35.1694452451839;
        Mon, 11 Sep 2023 10:14:11 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id b9-20020a170906490900b00992f2befcbcsm5631012ejq.180.2023.09.11.10.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 10:14:11 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: wens@csie.org,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] ARM: dts: sun8i-r40: Add interconnect to video-codec
Date: Mon, 11 Sep 2023 19:14:07 +0200
Message-ID: <20230911171407.1572030-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Video codec needs interconnect, so driver knows that it needs to adjust
DMA addresses.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
index 4ef26d8f5340..a5b1f1e3900d 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
@@ -338,6 +338,8 @@ video-codec@1c0e000 {
 			resets = <&ccu RST_BUS_VE>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 			allwinner,sram = <&ve_sram 1>;
+			interconnects = <&mbus 4>;
+			interconnect-names = "dma-mem";
 		};
 
 		mmc0: mmc@1c0f000 {
-- 
2.42.0

