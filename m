Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F84200A6
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 21:26:07 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a5a7e7cd61so165234b6e.0
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 14:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692825966; x=1693430766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUbFm+fOmzrazp9sKgGhqqbV60lKK8Psc75Jfutf4LY=;
        b=Hb/j/w9DqSkKcyLd9rKgOvHuEs2VTClPtpSA3sdjYKd3es6CSjdm8MGQDYwd2HQQGV
         mkvPYdUAyX0vYFn+zjbu+e6fLyIU3nI++ryzDjPDqGV9spoCVLZ4dBdnu9++nfCJIOSj
         rBX9tyqTz55UK9UFRqghGhZ1tY+3DwMJ1K249ijppg/DVGqgnRKk8llKkxdIp6/7TXEK
         TOTrjA/w7g9PjTmK2cLtm/03t/DJfR2Umq6e8AEIf9BICobuguWYbL2IemfpVbfe3phc
         ATU1yzR8XXmoV+huT1YrbSZi3Fv8ydr5OsKZroOETZ/96Y/QIq/Rvbk+/3TE82Af+7a5
         LrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825966; x=1693430766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUbFm+fOmzrazp9sKgGhqqbV60lKK8Psc75Jfutf4LY=;
        b=JsVPy1cFln5xZrpqFmJW9EKSv0pECsZUDj/PK5uOmg3lMLX1w8ScNR/rDwUQvoEPBO
         y3msN39cqc3ctQ1bMvFKBTfLi5FIXn6vOX7BwhMXDVvXZ794+9eouWh4NbidohC/wr9R
         sQaGuJSVLCPz2+tByk6F20bhVwExmC0q3qOd1WAU9AM7C89x3gkKOb+VMFw1jXbzAcCy
         jdXQw19A/YWNBwjcOXED17G2fGZmjHlnQH2pqZyijUe8x2vtYWtnpXbk+5JhUjMBDhl4
         sf7Ugm425oK5rcwt67PE9SPmGrCoQdZ7S1fR8Lu5tf20Uzhaq1eFpS1AJuv0NPVw00Dc
         lETA==
X-Gm-Message-State: AOJu0YzcbtEv2JskFPlX1uZbY5k7IvqNaDXZi54v9BIZZLRV1gfOlXJx
	vMR72H/f7R3SfHQLUfxCJfiBhSMbF0e/sw==
X-Google-Smtp-Source: AGHT+IHVRJKoTFQ8uIPo98eSBe+TlfALpm8H98CvemrVDCQWd4sAnPjYgvc1qscn7NGAuINEQEsBPA==
X-Received: by 2002:a05:6808:1882:b0:3a7:46c4:e8cd with SMTP id bi2-20020a056808188200b003a746c4e8cdmr9304735oib.12.1692825966291;
        Wed, 23 Aug 2023 14:26:06 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d26-20020a05680808fa00b003a1d29f0549sm771127oic.15.2023.08.23.14.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 14:26:06 -0700 (PDT)
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
Subject: [PATCH V3 6/8] ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
Date: Wed, 23 Aug 2023 16:25:52 -0500
Message-Id: <20230823212554.378403-7-macroalpha82@gmail.com>
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

Add the EHCI and OHCI controller to the Allwinner v3s to support using
USB in host mode.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index c87476ea31e2..eb63dd274305 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -319,6 +319,25 @@ usbphy: phy@1c19400 {
 			#phy-cells = <1>;
 		};
 
+		ehci: usb@1c1a000 {
+			compatible = "allwinner,sun8i-v3s-ehci", "generic-ehci";
+			reg = <0x01c1a000 0x100>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
+			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
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
+			status = "disabled";
+		};
+
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun8i-v3s-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.34.1

