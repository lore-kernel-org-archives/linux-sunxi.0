Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB38200A4
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 21:26:05 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a43cbb432aso4153583b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692825964; x=1693430764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZxJ1X5IcmMP5uOQq7URUpycqeONLS78Y9FFjRdR0eo=;
        b=GZ+HvLjXK7DanLsla8bkLp/K/qJMMAIQBhCE3ZKCnVMoo1wLY58bJM15JElW+JSyXl
         ntRvdlEqTyfJQwXyGTN4DWpsccf3SoaU5NwYd9wnF0vsmEI0CBNYO268Q93AOhcJhj/Y
         mcFGM9Om+WdmW2P3RviaeN1mWR0Sh0nAfECH/0ODtIwYslrVl5eaBAaBZsDGhq8aqgk9
         L/VsUQpTpgjpPHvo0dtOjKMBIIKX9613kiuGZ0SIfePVchpU/lix/y+iW9lmvHXzrtpr
         S/dp0B0R248cWxN7I7PnGOp8atOpCaBU0E+GUtlXARozIPfrQDwEsiYOsO2MSfCT1NUu
         VD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825964; x=1693430764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZxJ1X5IcmMP5uOQq7URUpycqeONLS78Y9FFjRdR0eo=;
        b=fxJUiUc9S4duA+dDpWQ2BqfASM7ikyD8kI79j8VlQn+fTMSDRWwn5CTFLwI0+iN3Tu
         upDrTxYeyhw7gSkExRCdCJf01BkAyudz6L9FjOG4N63o6P1od9eB3/SyXxqBoGP7j3LY
         WEiN2ZDAmDWK94p2rwsOJy5I6pBWPoBPyIEiwvALlUOj5tnAJXrw/vWm2MnWlA6FRhNB
         nbkyvxeuXCkIbOny4x1m6wsadpKrQuIZS2EIgNuH/xLtNhXjUehd7FbgQ6pj9UgWxBG+
         Kpy8+u+rCAwnLGxT+A/T7mK6bDuaAzpMwWqnOeFJGrVgfQlJBV6Zb88MLs3l3+yMI6pc
         FZQw==
X-Gm-Message-State: AOJu0Yz/wc68w5NYdvSUC/4w83JTjtezrWXfhQ8XmWl25ebdL1enbI+z
	WtuKwK2x5HPC1Iikq6tWKf1cgM3ndhd8zA==
X-Google-Smtp-Source: AGHT+IGttHzA9ZAubh4JXxNS/58jl4cMgwK4kWOq/HDtZ6E0volg9jJkPSkgcbqopg8EWr/nfDCcCg==
X-Received: by 2002:a05:6808:148e:b0:3a7:53a8:aed2 with SMTP id e14-20020a056808148e00b003a753a8aed2mr18448110oiw.7.1692825964002;
        Wed, 23 Aug 2023 14:26:04 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d26-20020a05680808fa00b003a1d29f0549sm771127oic.15.2023.08.23.14.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 14:26:03 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	jagan@edgeble.ai,
	heiko@sntech.de,
	uwu@icenowy.me,
	andre.przywara@arm.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 3/8] arm: dts: sun8i: V3s: Add pinctrl for pwm
Date: Wed, 23 Aug 2023 16:25:49 -0500
Message-Id: <20230823212554.378403-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823212554.378403-1-macroalpha82@gmail.com>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
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

