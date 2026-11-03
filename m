Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742018;
	b=XQ7q1LYYFn688ez2L0QIti72IskAnzI53MfIsrjZ9/Mltop1+TQyuA/RlZKcAQ469TmY
	 W8xZF8/fdAiWWGZTl4AL1XZv8c8OOA2Xy5PslbBMT3XGVTNNjjZD0lRcTYQr34ZXzmzSp
	 NHWSE27DICFwrw4tULPdUP3YELKZkPZ2aC0jX4A5JK95PbFI0D/oKtjNtkqkdgSy5H4o5
	 /LMLaVmJvDO4RDCrive2JefDhKFg4EbGB1ZBUCXDlDNBHWdt7pKceP+5YTWXyQd+bDFQl
	 u7coy75y5VI9uhsM4mzBX1OgoG/MNraMYLoDKqfXsQeeVS4UnM6lVO59hmf/LKii/gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
	b=UyYLa37lvZUdFfLRng3Vd5d8djmpk6EVcXjCUKnA7w3E6+5X8u5dwG8dXmG3hSiJ97iE
	 o7hRDdtSC7LslMkPsTuxnOWk3cJfkXUrHAU2U5cLWpKdlFAz2dWfPquD/p4iaO8QTVUgK
	 CL0/PHRt2e6/jj/swReJRSQ+qAuzHAdqG2pH+CQ+L5sAOFQOBKSEOTd5zoaBwEBM+Yzy1
	 pTjqpQZ76oO5MKydI+B3JqVAC/BBKzD/Jfz0OcE2YRAlX6uW7AFp0oRbQnVJmLG3N/Qgh
	 8BRKuyGmyz9zuqABcd5Jslwb4FGzAQpPV3dXOgB3WtDgABdH1wuIXFUuqT6jGZD2rTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RdaHGvjK;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB81606EEB6
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB81606EEB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RdaHGvjK
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4f699fe49b3so52720b6e.3
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742017; x=1794346817; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
        b=RdaHGvjK4f8bIWPPEBLKKicdPIfy/0ipExuHTi4gy2Pq+oixslshbS/Y3OkMO8Klem
         Bimp+Kp5vZCpHV30yX8m59UjEU2hZRWQrxkInH6aOGW9P5F4Y2ar9Fy04Sck2tYdSb05
         vUj+dSCLXixgXhHzGlpIdMThMTHGocgzRjVPDR3cETiTdb2NWc2MLqIl4JzAs47hw50/
         oAimk2Lochv7D59XLQqSwKN4FHLioWzBRxBdwhfOjq//+k2cDQcLvM1/G+NbUZq+XYZL
         gOfMmefpNYFRBSX2MlPR2PFrxkg7rxuAAs9VuOdRuWU6zOBnZ1sl3qQd+NUsq3kq+Ksg
         n0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742017; x=1794346817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
        b=bPjev//QJ/iS6ngw/FrVwB5qCQEz2hDlt8EULem8CvnRUxA2lfxWYT6aTiv1U4OxFn
         rSjFYZUj9s97PDwVOqLfm1ehm4nTAwaUv8KlXZt9K3Q+z3j5sp7dp0LXF4o3Rb+x41Zd
         MPg3IwJf9i9KFt+PZae5exPiefiEW7HihB962GKSLbbTisW4NWmoHX8QPlQUFNxwRfDD
         zOxyz7d/dlkR43OCl3gcptoNBJZ6ZPlJd/oE9xKiGRaZopkQm5MNPyyEG1FHHJG/EpbE
         MqFl8d1efGiQmAMYivQOX3pstDvSt0IsW1AcS5qNLce919F+wYSv8WiJAh/Q3TM/3s+s
         NvAw==
X-Forwarded-Encrypted: i=1; AKwUvBzSSHT/pXtEYm8UTCB+W3T9vBMrLCZq3tdbVy+NVw9A+a8axRzmNkbCRUnzeVyixTZho9Hp+O55enAihQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9FAN9lAtNwNq4TZGqL6uQuGxhDKERtjq4T4VKK+fww9gsDHdjZ
	G6NHbFb6fphGLQrvzoZCLd2NjDOIF99dzMuBdo/2fOIJ5NVa2feWy+Xd
X-Gm-Gg: AYBFou0NltIcgqKt11K8BHUlSxj6YolBSYY9cKJ2ktClffA1MIztTh0fqWLrbKfKc0O
	eQZru+MbBDoYOMbf7X9OF4MTgOWfArxUsArCgEstIje8K4koAC7i75cBWhuPFPw+HQB/tuqIJl9
	iVr88dIe9JPT5f3YXUpu68UcLX3h0nKFKqsmNKHbSkIevcoSqrIeBbyqHTVA/eaMYBJK7FuYAvD
	y3/nubYJMcol8LbDuSAJKrONy/Ynj21YcSpvHjIN2J0TsvUhC/d6U6Uzh6dV53dYnrMja0mhBDz
	r2oTPY5/klP4dvY2F1XvBGnAc092k2EHPoXathDb/SxF3QTLG677SVpYt/zj6eMwPRR+X+T2Mei
	VqVfxsGUMGWH2Neqov776sSIYGbeFjihH9jSWh1p6eu4ziZS6hdL46VSH35UlRtpzO/n6dm/y/S
	qmeCU/G33rl+t5CXbtLv3s18f0oNgmaLnvYCi7zroyqg98DLJ90iExFcXAz8roH7TNW8lVb00gL
	w8F5FVEFgNxLjPQaP4nEkkWxA00e9kAxLJn19/YpyWr/2rW8XvF3T14MU1yvi3spUq/PBs9dl7G
	7HFMG5JpM/MuoG4TGJNbqokBNP168gjWE8JcSWJFmL2/PDbZVqhqfpiDAoBrvwmEr3/esX9Np8v
	u1yayFgBD17NNeI0foD05zPElck5GFzekmO4tB8DClGQfCoNPcYF+kz8L8AFaCkM5ZfIzrJyry+
	OkvV+cGYYG6mkJwCqrP4sCEaByoxvlAwIsnQmVxwY8oN7j3sTuzvGC
X-Received: by 2002:a05:6808:66c5:b0:567:605a:b8a6 with SMTP id 5614622812f47-567605ac3f9mr743665b6e.41.1793742017040;
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:04 -0700
Subject: [PATCH v7 11/12] arm64: dts: allwinner: a523: describe the UART
 integration
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-11-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Identify the Allwinner UART integration on all eight CPUX controllers.
The specific compatible selects FIFO-depth discovery through FCC,
allowing the driver to derive the shared DesignWare receive thresholds
from each controller's FIFO capacity.

Retain snps,dw-apb-uart as a fallback. The common SoC description supplies
these UART nodes to the A527 and T527 boards as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..23340b9f58cb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -390,7 +390,7 @@ wdt: watchdog@2050000 {
 		};
 
 		uart0: serial@2500000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500000 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -403,7 +403,7 @@ uart0: serial@2500000 {
 		};
 
 		uart1: serial@2500400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500400 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -416,7 +416,7 @@ uart1: serial@2500400 {
 		};
 
 		uart2: serial@2500800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500800 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -429,7 +429,7 @@ uart2: serial@2500800 {
 		};
 
 		uart3: serial@2500c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500c00 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -442,7 +442,7 @@ uart3: serial@2500c00 {
 		};
 
 		uart4: serial@2501000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -455,7 +455,7 @@ uart4: serial@2501000 {
 		};
 
 		uart5: serial@2501400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501400 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -468,7 +468,7 @@ uart5: serial@2501400 {
 		};
 
 		uart6: serial@2501800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501800 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -481,7 +481,7 @@ uart6: serial@2501800 {
 		};
 
 		uart7: serial@2501c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501c00 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

