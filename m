Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBD111A
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Aug 2023 03:21:16 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bc9254a1baso1186169a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 20:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692415275; x=1693020075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/Dvf5J2W+dZcHiH9yALjXTmoYSYs7yz2wkFkkkkdBY=;
        b=PHNM4NNYN5+B2GVygVLP6A94JV9cGnr+I/uLU0XL0nYeZ6aU6Mtuy2oW7Nvz0mwM5I
         COvnfr5iYY4WFePVFwTsr/AIpOwidNLEBOGfwrAujc37JpUwn8ZnRk+2QnwQYIWKp3d5
         THCjaLDUgwgLREpacs8xnGSy1N1VXP+XevNFfUMWHVLBM7Rm52YwDDu0QCHLjUKTtPo1
         vTyHwsRZ+FVvjwJ0hV4Lxnmj56q8H0ENDj4dMOPfKpvazVzYB3+VW2NSOjPlEAyc6zom
         4HlvxPBfWMhT1ASeCF8Eohq/SDLvMl3DotXzIFF1SklisP6NP1iLazNuZDuNrLPII1gj
         CPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692415275; x=1693020075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/Dvf5J2W+dZcHiH9yALjXTmoYSYs7yz2wkFkkkkdBY=;
        b=jiSVU8gJuZ7EHGDciXnMDuNyVlyH3zQTAJfP4qnKJ8iML3yLuG7u+ak+1WvZJOR4Vx
         Wz8BZR7B+6eJhesQuT9Kk4fAix1Vxs7VUP+CSRn2d8S2+MTHukMtQgou0w3eykI/bwRv
         1QenRaJkLbXcEbJBxwWewD0gb2bcUBbwOxDDSr48pBWtKc72/M1mzK46JXe+7JKNtBC5
         0lk4lQfCmHU2PTybBepu6sz4RAMnT8VrZiiskyCnHIkPsHY5wdHMVincAuWgbBQKKFxC
         Q9Vg+C2tQbObZSme6UvaxZNuSJBwPPzw+NuxG2NFH5besVdhydD8H1YsvdDzKFov6OuG
         NOXA==
X-Gm-Message-State: AOJu0YxZuF8y+43AWAAoPVHa0GiiThdiLOeth+l7MGn3aXfzEae5AhF1
	9M7Vdc2Xbk7GZm8dHrBM+vAO9RSiGic=
X-Google-Smtp-Source: AGHT+IG/9YOVbLxlVphT0VeiNbPsfc7ET1KTyyK/qudI6UXkUWrgM+1D902JqB5+jj1LiwSmhUP4Gw==
X-Received: by 2002:a05:6870:9a04:b0:1bb:b337:fdc7 with SMTP id fo4-20020a0568709a0400b001bbb337fdc7mr1314631oab.59.1692415275460;
        Fri, 18 Aug 2023 20:21:15 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id ch16-20020a056871c41000b001c02f12abd0sm1728265oac.38.2023.08.18.20.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 20:21:15 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	me@crly.cz,
	uwu@icenowy.me,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 2/4] arm: dts: sun8i: V3s: Add pinctrl for pwm
Date: Fri, 18 Aug 2023 22:21:03 -0500
Message-Id: <20230819032105.67978-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230819032105.67978-1-macroalpha82@gmail.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
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
index 2b76a5b8ec19..3276b3b5de19 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -414,6 +414,18 @@ mmc1_pins: mmc1-pins {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pins: pwm0-pins {
+				pins = "PB4";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pins: pwm1-pins {
+				pins = "PB5";
+				function = "pwm1";
+			};
+
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC1", "PC2", "PC3";
 				function = "spi0";
-- 
2.34.1

