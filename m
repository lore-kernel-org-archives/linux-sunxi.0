Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B412C88
	for <linux-sunxi@lists.linux.dev>; Sat, 20 Nov 2021 07:34:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so4330299wmj.5
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 23:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OM2Q2y6CgmId2R4mi5bkqpR+tR4JTdqKcUf7G8xj6co=;
        b=jKs3FDya/Z9bazr9ZhSJ0Rgg6S+9NH4+HyfOx+9ft1ecocbFvoI+UtITN0//G9LuRp
         DuQ4Q2AlQZKArwDuJT7opw6uBHRDxU63pOAsbzsmtLh6MGUtHKRHyZdP6Y1OI8tPObSk
         ULRStBmJ5EF0zvi3FuiX2u3HVfOWEfmdx4zobd2qbg15yoQCTlzScPvq5Hr7YeL218GP
         hZtCTHXdM68ZACyttsJnq5wWpavb+WvSU6mhKFNTBdydj/Gozq13slrTgWPPb/RqLafj
         wyZCwVtNVwWIPEU13DwnfQ2D3vMyyw0+rdPoc+2Pje4DFJEXgikUPTybkIvGLTlZ6cgF
         LfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OM2Q2y6CgmId2R4mi5bkqpR+tR4JTdqKcUf7G8xj6co=;
        b=7vQOErhQoB9F1JKySb1l65sg7UYPWjWkE8jfvJAIFlDspvEUt7OMRTj6YkwEUmNQBj
         jcP8HsDgyjWf53QGfSh/t+wib/1cNAzKDkxuYGjmDi/AeU1LoQiAySG90ranD1bCwQtP
         p2pOC4plWTHtBH7wY34L/1DaYVPyJ/yMkwJiAhhLptxP2FJsFVGkXZ+uIoAkFIjbeIVQ
         nORhKGMmuJpeh+2HT2l2xxapm0Q8m23CyJyS67tkPGZCStI8TmTz23m1O3NVb1T0UZ3+
         gR3ERHaCzEoAA5PLGjs5epiq2unBsV74hPuZ3oYjiLJv1QSu/XjeV3I+/+sONhv89dtB
         Lx1w==
X-Gm-Message-State: AOAM531x+R/wPOLcz62cXnYRnnlVSn4NTRjyfoeDkhNEfWKuOJ+AlxSM
	ZBPsM4cj0+b9MhQhow91EGQ=
X-Google-Smtp-Source: ABdhPJx6qjUexfTH0BphOvHctVVn/Kt/mw75BqIG0yjsu3k9x9MB0iSsIdkwPFhECEC7ZShYtKCarA==
X-Received: by 2002:a05:600c:2205:: with SMTP id z5mr7674255wml.40.1637393694855;
        Fri, 19 Nov 2021 23:34:54 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id a141sm13776345wme.37.2021.11.19.23.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 23:34:54 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] ARM: dts: sunxi: Add CEC clock to DW-HDMI
Date: Sat, 20 Nov 2021 08:34:48 +0100
Message-Id: <20211120073448.32480-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211120073448.32480-1-jernej.skrabec@gmail.com>
References: <20211120073448.32480-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Experimentation determined that HDMI CEC controller inside DW HDMI block
depends on 32k clock from RTC. If this clock is tampered with, HDMI CEC
communication starts or stops working, depending on situation.

SoC user manual doesn't say anything about CEC, so this was overlooked.
Fix this by adding dependency to RTC 32k clock.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi   | 4 ++--
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 1d87fc0c24ee..f10436b7869c 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -1212,8 +1212,8 @@ hdmi: hdmi@1ee0000 {
 			reg-io-width = <1>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_HDMI0>, <&ccu CLK_HDMI_SLOW>,
-				 <&ccu CLK_HDMI>;
-			clock-names = "iahb", "isfr", "tmds";
+				 <&ccu CLK_HDMI>, <&rtc 0>;
+			clock-names = "iahb", "isfr", "tmds", "cec";
 			resets = <&ccu RST_BUS_HDMI1>;
 			reset-names = "ctrl";
 			phys = <&hdmi_phy>;
diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index c7428df9469e..d1e974886fdf 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -813,8 +813,8 @@ hdmi: hdmi@1ee0000 {
 			reg-io-width = <1>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
-				 <&ccu CLK_HDMI>;
-			clock-names = "iahb", "isfr", "tmds";
+				 <&ccu CLK_HDMI>, <&rtc 0>;
+			clock-names = "iahb", "isfr", "tmds", "cec";
 			resets = <&ccu RST_BUS_HDMI1>;
 			reset-names = "ctrl";
 			phys = <&hdmi_phy>;
-- 
2.34.0

