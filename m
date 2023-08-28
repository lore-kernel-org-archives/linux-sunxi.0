Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92F912B86
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 18:19:54 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1ccc0d2e697so2480425fac.0
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 11:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693246793; x=1693851593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZxJ1X5IcmMP5uOQq7URUpycqeONLS78Y9FFjRdR0eo=;
        b=MsReZev1CL1NMS9H/91NPZC1/RefUPc/o5YYPJDNmxvo8qqOfTpby1BQomvr9ZLRDx
         8ukcf5F1/rlQ9diesnOA1QKLWvuaRIqNPfeJZFS3AWYZ5FQshoGRsUeesO2GX2+Q4gcQ
         h2uNEtqPxYT+AFaOmQO9bYDY0v0AEnVpL9KTUZZ5d+sZnfYzZgK+L0UJtTLw1hWPfIhm
         PKn+fYURKUl4eEjcjm8kkJnAWf/Gec5QRM0HVZumC6P0UK2/e2JndqcLVw+JU6QleBNQ
         5YdC1yYS0g8v/SIB8GpuTHu41ljEjGX6/bcQzAJFb+sIL4f2TBf/qk1q3GV+fKKi3HZj
         guUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246793; x=1693851593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZxJ1X5IcmMP5uOQq7URUpycqeONLS78Y9FFjRdR0eo=;
        b=h5o2Tj4NBjEPenFKPdll8eWx5oI/hGYSYIXM/B5fD/wuU9Fxj45milJnjGThrmvXZX
         p9A6e70m/e03kCRfZ7cNlPrZIgpezo7UTGN4FSu4CmImMobU64ZiegoS9sg5Mb+b6xSt
         xtUcxdPT+igy9ClRtomuj4ce6kZKnlIEMO1fobtK4h7Swrzuv2SyqMJlfJVod2aCEuCR
         4CmgYwB2iiWkpuEYW/kNtFgxwzO6kFXczsJKFrBnMsP41elgJ9N2yJRoR0iyemVdrT/K
         jWz3DgIxeF42G2ZhlfO7aptK0t6zdpynzPkSvTwxeKUo4LiNIglbloJvSSiulkWaiCDX
         ziAw==
X-Gm-Message-State: AOJu0Yw+mmbujSypTaet89ZuQ5NMPaTP/nYdyUqcMgksuH9duH0j9DtV
	S1xSpEuqJ+pksoOACCJ2gcyI6Dh8EloeeA==
X-Google-Smtp-Source: AGHT+IHpyMtJZZ+pgUDS6XI+bfZY08aljsVIHgTn339V67ZHc7OjFKRRegIc9nH885S+kBWNeqr8ew==
X-Received: by 2002:a05:6870:b6a6:b0:1c1:19ae:7b23 with SMTP id cy38-20020a056870b6a600b001c119ae7b23mr14675298oab.55.1693246793712;
        Mon, 28 Aug 2023 11:19:53 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d620a000000b006b99f66444bsm3695927otj.71.2023.08.28.11.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 11:19:53 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	airlied@gmail.com,
	andre.przywara@arm.com,
	conor+dt@kernel.org,
	daniel@ffwll.ch,
	heiko@sntech.de,
	jagan@edgeble.ai,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	robh+dt@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	uwu@icenowy.me,
	wens@csie.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 3/8] arm: dts: sun8i: V3s: Add pinctrl for pwm
Date: Mon, 28 Aug 2023 13:19:36 -0500
Message-Id: <20230828181941.1609894-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828181941.1609894-1-macroalpha82@gmail.com>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add pinctrl nodes for pwm0 and pwm1.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 3b9a282c2746..c87476ea31e2 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -414,6 +414,18 @@ mmc1_pins: mmc1-pins {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PB4";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PB5";
+				function = "pwm1";
+			};
+
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC1", "PC2", "PC3";
 				function = "spi0";
-- 
2.34.1

