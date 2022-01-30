Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B529CA
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 22:03:28 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id j24so8281997qkk.10
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 14:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oBgDNmNrOOnlb0Mg5ouD+YxV6ZtLCLEZj9tfMCfsu+Q=;
        b=KWv8c8kIwOrcrnxMUOzr4WIpb0fkoJhnMZ9wu1V+LPvkdi5uY7l9f5hBvSWfchiyYT
         6ImYWabE3E4R2GFHW0fuOBHrIsA60jh48V2sqWXkmmz0ljam8eKfWmetMQ8gyVUxR+6l
         6n57VAGAfE1jjygMScpf3pnkUeTr6DfwUl4xS9ayyHPupNIADsOn4ZbzHSjgpb9zKmPw
         btvOrzEl1cYmUnkYQzC44v7G6/M8PKDo8FIkeg3iApHtVEHg65kSy5jfHkn2tLpXuk+M
         DkrAJ/nNkImWhIBahglBx3qA7g0i2JRUgglcjriOWNgnNHZWXhpErFEV/+rnwj9o+uLr
         VlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oBgDNmNrOOnlb0Mg5ouD+YxV6ZtLCLEZj9tfMCfsu+Q=;
        b=0LhG46INN8Nnu2mbVnhab/eXOJObhcjtIbGPrn7TeD7MW6cjgsWnkMh6t0bAUPph3W
         nqUIXIGTVh9SylvusOpY2pbealN5Oa1aJYr5Nc9XIASaHLZkjh/CpSjUPQiAp8IUP4Or
         nrb/WGHzVmHr2dmXqZcgq7tHEpvNJsBPX8A6AFOar1CtJW1DHKWxM0RfYROg2cL5b0ev
         Eh+Z3T6s0YmFEAVs7oRQMIzIsCkLLVrBCpD+n+iduwCbPc/V2YJOh+eTw8h72FvWnHCN
         JyGEECPtrFRpzsHhxulVUx7uCjmhurTtQtBeht6wIHWy0eBVQfCqA4AzsAuyhabKpwPy
         fVQg==
X-Gm-Message-State: AOAM531sGCMJi4U4n5QEQeUF7c66P1hUj88Xm9vAl/xFWr9eR7vWtmNb
	NwtP0CAqz8FISFqwJ4ZtL0A=
X-Google-Smtp-Source: ABdhPJxftSKAAHXMcfmw/XMOGZ0c407TMeh9lZ0bUTX/aPhoX/tfan0sMdUjWEeZqW4mKTDTPz99RQ==
X-Received: by 2002:a05:620a:f02:: with SMTP id v2mr11462754qkl.41.1643580207858;
        Sun, 30 Jan 2022 14:03:27 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id h12sm7556651qkp.129.2022.01.30.14.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 14:03:27 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org,
	Mr.Bossman075@gmail.com,
	andre.przywara@arm.com,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] ARM: dtsi: suniv: F1c100s add clock and reset macros
Date: Sun, 30 Jan 2022 17:03:22 -0500
Message-Id: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include clock and reset macros and replace magic numbers.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 6100d3b75f61..953228cc8d52 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -4,6 +4,9 @@
  * Copyright 2018 Mesih Kilinc <mesihkilinc@gmail.com>
  */
 
+#include <dt-bindings/clock/suniv-ccu-f1c100s.h>
+#include <dt-bindings/reset/suniv-ccu-f1c100s.h>
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -82,7 +85,7 @@ pio: pinctrl@1c20800 {
 			compatible = "allwinner,suniv-f1c100s-pinctrl";
 			reg = <0x01c20800 0x400>;
 			interrupts = <38>, <39>, <40>;
-			clocks = <&ccu 37>, <&osc24M>, <&osc32k>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
@@ -114,8 +117,8 @@ uart0: serial@1c25000 {
 			interrupts = <1>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&ccu 38>;
-			resets = <&ccu 24>;
+			clocks = <&ccu CLK_BUS_UART0>;
+			resets = <&ccu RST_BUS_UART0>;
 			status = "disabled";
 		};
 
@@ -125,8 +128,8 @@ uart1: serial@1c25400 {
 			interrupts = <2>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&ccu 39>;
-			resets = <&ccu 25>;
+			clocks = <&ccu CLK_BUS_UART1>;
+			resets = <&ccu RST_BUS_UART1>;
 			status = "disabled";
 		};
 
@@ -136,8 +139,8 @@ uart2: serial@1c25800 {
 			interrupts = <3>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&ccu 40>;
-			resets = <&ccu 26>;
+			clocks = <&ccu CLK_BUS_UART2>;
+			resets = <&ccu RST_BUS_UART2>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

