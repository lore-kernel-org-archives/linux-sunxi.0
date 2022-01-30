Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AF52CA6
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 22:03:31 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id r14so10008422qtt.5
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 14:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J+VZN81DjRtnX/IoUmKj4ZH1dOHtItVzq+kTBINm8/g=;
        b=qWt79QkIWwG86Zc52IIfCB+t7KbzF1jMXD5NLv6XpgLYgMH9XUk+w9WQTSqz9eGsYm
         YeyklQXM1FiSoxs+d2dYKEwPZJkUct0eeedS6ObuL3JOlvLHv5ZWQGEr1Bf2rjmzoWCq
         SRTDyBAzXPdyMNF3ysV3WrVyC/Wcyefps43ExkMNbQvyTTov+w56pao3Yv9bTcu2Mhtt
         a6PTAVWW+AiTdRldPZze9al7OwdkmSkqaM61Dk5SW/utQXQb3CnePPgh09JxI3NrqC/L
         0Y4Jb9090nS803chFGqLeZ2BA79lQOVu2QB3HTAu4gpxD15HZ+20yuzknWoy26mPFaF7
         bqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J+VZN81DjRtnX/IoUmKj4ZH1dOHtItVzq+kTBINm8/g=;
        b=WXqRIbSbJrk/rEzRTnt5plR8wTrK/Ou9D/cCzjsHAAmQV+KFGLpC+seFx7oUL55FBG
         zmLTzk3a4CfUVCMngsjWYLFfN0r/yX55hGqjXypUcUx+vEdddFXG3Iy61U993vBfZAcd
         Ks2FzH2285WN/sfiXMTQH+LL6TL23TJ2pwjC/T6TSpgjFofZCg2IURSxLTPJeHE7jp2y
         1nCrsMtLWP72eeaj49n4E6heh/CRRZjqV1k87FQNfk3druHfEuuuPLxfg1ChYWU9K5Id
         8OCxpZYHsJAqrKw057VonhGVkZCo/AfIGOAOCEE/0Q6Y7gclC2Rtr5b0Le1j+Nuqmjja
         qDBQ==
X-Gm-Message-State: AOAM531q0ft0hRfTLNj3FdtcP7XueIDu5oqD3VlxyAQXfq7A+mcOKuBn
	VBWMoh0WS2TsWTBUDwCICsg=
X-Google-Smtp-Source: ABdhPJwMCI3bv6EseDTBUkj8wPjpkE5xmoHYqtuQeksSgf+B3dffimd0cJnmdIziwuUTxG9FJMr0bw==
X-Received: by 2002:a05:622a:1307:: with SMTP id v7mr12950496qtk.118.1643580210626;
        Sun, 30 Jan 2022 14:03:30 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id h12sm7556651qkp.129.2022.01.30.14.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 14:03:30 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org,
	Mr.Bossman075@gmail.com,
	andre.przywara@arm.com,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] ARM: dtsi: suniv: Add mmc to f1c100s dtsi.
Date: Sun, 30 Jan 2022 17:03:24 -0500
Message-Id: <20220130220325.1983918-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
References: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mmc0 and 1 for f1c100s dtsi.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
* Split patch
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 41 ++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 953228cc8d52..60fa56c278a8 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -96,6 +96,11 @@ uart0_pe_pins: uart0-pe-pins {
 				pins = "PE0", "PE1";
 				function = "uart0";
 			};
+
+			mmc0_pins: mmc0-pins {
+				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
+				function = "mmc0";
+			};
 		};
 
 		timer@1c20c00 {
@@ -111,6 +116,42 @@ wdt: watchdog@1c20ca0 {
 			reg = <0x01c20ca0 0x20>;
 		};
 
+		mmc0: mmc@1c0f000 {
+			compatible = "allwinner,suniv-f1c100s-mmc",
+				     "allwinner,sun7i-a20-mmc";
+			reg = <0x01c0f000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC0>,
+				 <&ccu CLK_MMC0>,
+				 <&ccu CLK_MMC0_OUTPUT>,
+				 <&ccu CLK_MMC0_SAMPLE>;
+			clock-names = "ahb", "mmc", "output", "sample";
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			interrupts = <23>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc1: mmc@1c10000 {
+			compatible = "allwinner,suniv-f1c100s-mmc",
+				     "allwinner,sun7i-a20-mmc";
+			reg = <0x01c10000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC1>,
+				 <&ccu CLK_MMC1>,
+				 <&ccu CLK_MMC1_OUTPUT>,
+				 <&ccu CLK_MMC1_SAMPLE>;
+			clock-names = "ahb", "mmc", "output", "sample";
+			resets = <&ccu RST_BUS_MMC1>;
+			reset-names = "ahb";
+			interrupts = <24>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart0: serial@1c25000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c25000 0x400>;
-- 
2.34.1

