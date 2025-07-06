Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5CB2E36F6
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jul 2025 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751770645; cv=none; b=VogV0waFjYadkkkqAL/yFYYHFS01i/6+JAhFI/0fNY09IXLylgZ8oeZHEHCWzyKURDiR8oI+FscEk/JQhWd2s3JdycW/tS4ebj5WvgZ6YI3n7vcVqz+jY5tpx9vy/GMiH872AK8qh4JR5VkXckcyVVC4nRYe+KCic2Pg/XRaKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751770645; c=relaxed/simple;
	bh=qYVF5nrefqk8ZKCPwYrgT19os3rsqUvuedsH6yMaRYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tz714Kzj/3FMOez+1Xb+HCr1cRs9zWCGC2/NZv7lECIr5WUud25YTfElsA236FOtpHivZXZLxgUlvcabTZSrUQVTEhVifLvfh+Yyf8b9uj98Va5WjnR65wRwaj3HIYRongFdQ+C70ntI0KrfB5GrSZrfygXpwl0PjjuqblQuTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFL2Byd+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFL2Byd+"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b9eb2299so2599274e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Jul 2025 19:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751770641; x=1752375441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=TFL2Byd+9/Z/4dIp3Scn5nGaftRjklVZnIOInelJCZxbeSuC0KxYucjRzZCFshOZvZ
         8jvxFICbOnCti+6T3py+mNaR2/Ahk3Jt+lVPeg+RG19dH7wDoY+cVUnGu7h+of4taQg3
         MznxEIZ5Cy8/VNpEjH4Bna4nU6eeZJ13bK0ofWp8zcqNWDE9WI2Lk2oV0CWTIc74TjQR
         qxg7cn17cXkzhPzxNXwZpdK+nbswghKC05YhKRVGv1F2hoj/RxoBbOziSOmUfa1Vn2Ui
         yl7PlAaRIUbSEzbpyf2nClfX0lILqkv+smbhJ4xFO0aNzpoisqzD7urwdvsdMWqUVWlS
         aY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751770641; x=1752375441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=mddgDI5gErY4E/xLoTPDgcWh1P/YMKXs5HZj9U+MWjZgIotsyknz0sl6Y2qesHWtlE
         u2aqfyX6pJNN4ANdJjiEJhhq/5VKqTYki4325mcTy58qUSK0s6XBec1WFt+Ip+z+geMk
         r6AIHitnlRd8ShIbT6h49h/jgR5/3Xxqime6hJPFuAN70CIR+SbX0LRR/y6mtMkbrF/6
         0/AGLzxaFykxH8aitsD3uB0Jz0hfaBNa3IxKOxSCNa/t7OM9PbZ/kt27NP0ABzENRusP
         +lKaB+zxV+l20XtBkL4fXz6H1Si6nFxtAyILP0IUmmkiG5Pk4x9V704gp1J6T9H+63VA
         nz/g==
X-Forwarded-Encrypted: i=1; AJvYcCUOhfkt7i0kaz9WrKPMS+h7c474xihioH+wo4QX17iB+op5pV6rHc+2OCc6M4CzZ4ueY1CDBx7hYL5W2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6uPW/E7um/IEaYXfl3AK5qSMMAvoBWNe5EbndQBRfTWV+mZfx
	nZEVYE4ZbGaJu1klfeQfe1zOrCaQWMU1yOZsZsYcGpgm83atU5cb1MPA
X-Gm-Gg: ASbGncukeYSeZS0CJvmUqPmTi3RUP/TfMwXYMW8bxHQ19EF1DyUk7aZQjIsrRIQk5Kb
	qgowRtnSMEXH2CcbcKgzG/hhqSFKFdaC9dRZ3tyT2hP3a2BGOQRSuRCkl1uoQ1MaSFVMXy1C19o
	iMDO2LoAaqSLptm4pifkhHEOa7RxcfIEAKtgeIlFaRC3pFuaK7eJ6hd3J+4KPaainDv1yWSP/1O
	cg+Sv9t/w4skXp+a2MQJ0mZahlS7w68NTBbQtYd74k2uwVDn7s+e/hrxuH+axblPRtKQOyY7MXz
	/VX6ycey8+U8+RT998vfMy7qujWRyyAX6KGHC6DJvH3MORnKAU8JFupm01BK3lMoVE1rRkY=
X-Google-Smtp-Source: AGHT+IFfsqkWZBN4PIBE9st3rtlbs4llavPau1ElbWPXJmYwNfgPZvdeoU9nsBN2bcLjLflD0uCNpA==
X-Received: by 2002:a05:6512:1586:b0:550:e50a:bf49 with SMTP id 2adb3069b0e04-55643823068mr2804124e87.19.1751770641421;
        Sat, 05 Jul 2025 19:57:21 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7b4fsm788573e87.198.2025.07.05.19.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 19:57:21 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: allwinner: a523: add Mali GPU node
Date: Sun,  6 Jul 2025 10:56:22 +0800
Message-ID: <20250706025625.2707073-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706025625.2707073-1-iuncuim@gmail.com>
References: <20250706025625.2707073-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The Allwinner A523 SoC features the Mali-G57 MC1 GPU, which belongs
to the Mali Valhall (v9) family. There is a power domain specifically
for this GPU that needs to be enabled to utilize it.

To enable in a specific device, we need to enable the gpu node and specify
the “mali-supply” regulator additionally in the device tree.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index dd6fa22f9..d3528d498 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -108,6 +108,21 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		gpu: gpu@1800000 {
+			compatible = "allwinner,sun55i-a523-mali",
+				     "arm,mali-valhall-jm";
+			reg = <0x1800000 0x10000>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
+			clock-names = "core", "bus";
+			power-domains = <&pck600 PD_GPU>;
+			resets = <&ccu RST_BUS_GPU>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-- 
2.50.0

