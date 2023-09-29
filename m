Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CBAC8CE
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 14:44:59 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-57b68556d6dso6608645eaf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695998698; x=1696603498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhDXBL6djx3l6DnIsclYTYIvG11sEMF/WMaryhbeYQw=;
        b=UOnOPRSSqL7Na0nFNI7fg5z9aE48rzv9S4cuNaTzFuZP2PUl00Gnj9k3igq/dBtdkN
         m0xG7H7UxoMZEPQde/DxI1BZoAYFkvxUmpfJVFkzqXY7KXYUqSlZ8Un0C1+Fv5q0Z7gZ
         hjA+PhFbg9CrUT9bf+MqnqmIgSg0cHX+emSQthwvaAKif58JerXavJbt06LvEtegAU7/
         +Nd9qj8yRo32tJE8eVj0jVsMkg43B+OPaOPcsU4Wuahargta/lPzaSaCsoC8Q/VigSBP
         xkOiiDRG2gvXHDvOB0aFE7vbQUDQHHhIyYrI5ccwUlBRV5U32ux7PuqVz1NFidA7Zgli
         H/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998698; x=1696603498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhDXBL6djx3l6DnIsclYTYIvG11sEMF/WMaryhbeYQw=;
        b=JqVVFh7e0OvtZ//dGYozEjZddnK46mcFGYqpAzpLR70aRRXK2pOTw9t0e03xumEvK0
         xgalIzDU0rTfLGB3q496xy1Tg3zatFLIPlHjz+lwcGjcFELixkREv2cRW01Rebz2TSji
         XAGEAiUZidYUNFS67bKB3ruhLBLGcQVnSvEYuR9aNT6BM5yBaexk1oIYJupYLB/WI5Z5
         tOguvRG4YZNlXC9frfsPDbpiCrk5pZ4zl6SOSthHnx8tuz8zYPxDsUPM17c0p9b9ZHre
         aRnj274YMJTP6Fz/op2C9s/dnyklxI08nhusJ8gu98XvgLy7qpdTqpK/fxfCdmu/knDn
         MdYA==
X-Gm-Message-State: AOJu0YyGdL4Mxe9Ah0zLflkIleiLPA0OoYiAe32WW8fqals8BYHvfVD8
	WLn2GGmR+/nZznC+r5+t0/hzGJoBvlU=
X-Google-Smtp-Source: AGHT+IHin0WRYrMxB7uZfpH9iQe49dwXPt7hEgxWu4SOSKamTJLivb4w5WsNchcuuYMag9/cK1zzvw==
X-Received: by 2002:a4a:3019:0:b0:57d:e76d:c206 with SMTP id q25-20020a4a3019000000b0057de76dc206mr4658027oof.1.1695998698437;
        Fri, 29 Sep 2023 07:44:58 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id q19-20020a9d6653000000b006b753685cc5sm3012619otm.79.2023.09.29.07.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:44:57 -0700 (PDT)
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
Subject: [PATCH V6 2/4] ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
Date: Fri, 29 Sep 2023 09:44:39 -0500
Message-Id: <20230929144441.3409-3-macroalpha82@gmail.com>
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

Add the EHCI and OHCI controller to the Allwinner v3s to support using
USB in host mode.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index c87476ea31e2..e8a04476b776 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -319,6 +319,29 @@ usbphy: phy@1c19400 {
 			#phy-cells = <1>;
 		};
 
+		ehci: usb@1c1a000 {
+			compatible = "allwinner,sun8i-v3s-ehci", "generic-ehci";
+			reg = <0x01c1a000 0x100>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
+			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci: usb@1c1a400 {
+			compatible = "allwinner,sun8i-v3s-ohci", "generic-ohci";
+			reg = <0x01c1a400 0x100>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun8i-v3s-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.34.1

