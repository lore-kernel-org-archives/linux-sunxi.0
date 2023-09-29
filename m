Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B25E4122F
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 14:44:58 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c4e7951dddso5412994a34.1
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695998697; x=1696603497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=570noJze4N1Px27RwUIzjTarun0Tj8blQzlmY1B70TM=;
        b=V6zpGw7gKfvXXFYR4DZhzUB4RL8f8LdyEDN80OtdoS/VJAOJA+U35H4dFnxoBkBBzm
         P8hX4Z/0VcKVGWTkSAJx3ixut4k9WksVITwnbmYvhJxSWgvDxOUqw74KiXEhtSmy7JBN
         +ZQFSZveyG20WupYJYlUtmR2kfdhj2iCS7Mb7L9qvbvVfsMLawRoyacxceBngLwgx5G2
         ZTB/fpOL8mR2sX8aP6yOMfn3k3jCiF2gPDdUTUSOJtQmAidVWWnrsvfLIhY9C4JrEEWJ
         RwxJ8n7of/tLRwKLnGu8qNOknof4Y0KY2ldVyLQhlCrGpMU93mXPyHjhmHikPVGVic+n
         +/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998697; x=1696603497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=570noJze4N1Px27RwUIzjTarun0Tj8blQzlmY1B70TM=;
        b=rrXBs+paKX7yzi1C0Gf+W/HYwVJ7I0tRfu636+JAqUsUSG0Uvahw4xhACm1tV4RmkW
         0ogOlohp+HyVTDEaq3MtRh+UXIbmzymSpr/t2gYXdNorS/9WpTrOsYh7Crd+c34ZnnWC
         TLTiOvUpBKsaXuP91f3GQN5GCTO64VZ3puvXVLRzjxmHcWB/KpKwZLW648D7yS7UL5tj
         34uo5TBjJFCSA37p+HMOF1Z8uGVSVFCcd55KobqlXsHr7mO6GnsKe8o5kjrMF9eWqJ07
         bnm5e/N9Clk3UBzpMXn5ZyULiKct0EXMPQZc+YKQESx2Oj0T8VFOL0sSvvvA0E1dAEak
         gSHw==
X-Gm-Message-State: AOJu0YzeY8P60G9em/csXbLXCrkuA3Z2lQoP58ctqCYb2heapfEZZ+h9
	fDtmH8F+QRqYyRS/lUKvrs4Qj0hHmiQ=
X-Google-Smtp-Source: AGHT+IF5ggSvkhs65lIZVx6vd23guozmMjvRw7YbnRlds9minER3vm7neRodmomPxzNEg9A+2lF5vQ==
X-Received: by 2002:a9d:6182:0:b0:6b8:7584:3aa4 with SMTP id g2-20020a9d6182000000b006b875843aa4mr4563194otk.4.1695998697344;
        Fri, 29 Sep 2023 07:44:57 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id q19-20020a9d6653000000b006b753685cc5sm3012619otm.79.2023.09.29.07.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:44:56 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	uwu@icenowy.me,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	andre.przywara@arm.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V6 1/4] arm: dts: sun8i: V3s: Add pinctrl for pwm
Date: Fri, 29 Sep 2023 09:44:38 -0500
Message-Id: <20230929144441.3409-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929144441.3409-1-macroalpha82@gmail.com>
References: <20230929144441.3409-1-macroalpha82@gmail.com>
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
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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

