Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACD6B66F
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 13:51:44 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3ae0b0e9a68so234406b6e.0
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695304303; x=1695909103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJN9aOtZgPglJqdvf2m10tLO0jbnaME/5vD8YEmqs0o=;
        b=VjJYzl+TQ+j9lLkAn9Pg68CRQroWDz38ds+v+MLREF0fSiqMV7LZUTkcPRUJXabAYz
         3bKe/NI9qIMN0HtwxaO3Fadk2/LCegx+6UiMFLVIyRd2zsjzK7MF4lpk+7XUC/WeTiLR
         yYhIya89i01qk26F/qIfqfD3EwOk+66VHxjRIvp9hLx2rREl1UPIwDHmKY9nMH4DMwpx
         kYt6XwHEoiBkM3MhBJieT7t3zotsE2wbq07aOpEijsJ6J/ks7ZIXPaFq6A5VeFwyjP3s
         L7X5gJpvIdPwtBaRgk0FTXflzSO9HQsV+xYVBApZFDx3oZ5N6QKihj6vrQz7DHS92XHB
         Z06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695304303; x=1695909103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJN9aOtZgPglJqdvf2m10tLO0jbnaME/5vD8YEmqs0o=;
        b=i7W43F1VZ2SqEWZ78FrW7mux5SWaXyHUX3cJFP8sxYMqXJemoSCCSVfteb4KzH8Ix2
         uYU/i2jOSpcjOgVpyElYGOn9DgQwSACSnyUlKD/0QmxUzSRGId1TR9vYpwZCU615ZySb
         0LF2bK6oKMoZgEqmKz4/INlBMOZb+7FofYl+Vc6f2GCmfBnlAKl1JO/BFC8lRgSzX4bT
         1wYDMgS+f+MP3mcuOfOIwrLflRykHhAcSLMIVF3SvrxZWSxb3gtkNuIpRvAGrfWRYGRy
         l6zNgM35r6+X5RhdDbnqemkay4Xgr7U2SidncWymBxL5TLlfaIdKaTxja1+CcqNGK02z
         pWVQ==
X-Gm-Message-State: AOJu0Yy+idHuL9hBgpSh2cUWNk15rPaJ9OCBuy1caikWJOhc+MraVcLh
	RO2vwieYbGjZszG7BA+YFZx9XVxPZB8=
X-Google-Smtp-Source: AGHT+IGXu85ZU9tTQcrUtdBSTUKaV+TPhJ9ERgFrCb46+7owHSUzpuscGbIdB17UOEqsoBsaQgeLfQ==
X-Received: by 2002:a05:6871:152:b0:1bf:50e0:95d9 with SMTP id z18-20020a056871015200b001bf50e095d9mr6369297oab.26.1695304303377;
        Thu, 21 Sep 2023 06:51:43 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id z19-20020a056870e15300b001d7034bc222sm547064oaa.15.2023.09.21.06.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 06:51:43 -0700 (PDT)
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
Subject: [PATCH V5 2/4] ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
Date: Thu, 21 Sep 2023 08:51:34 -0500
Message-Id: <20230921135136.97491-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921135136.97491-1-macroalpha82@gmail.com>
References: <20230921135136.97491-1-macroalpha82@gmail.com>
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

