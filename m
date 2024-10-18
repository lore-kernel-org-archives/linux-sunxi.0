Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710B200CB8
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267724; cv=none; b=qFhuQ26XoVnwUwYRNSgTp9/01nm4tOwVvtMpPDeROy/VELZ23By4ntDd5mUNNUKji7wUYLLVOgyE56Ydu+iz+v5wGeVYD+AAXd7hZ9qtLSu3Z4yDKP/zPpsHJKjP38inMdPCAAQy42/6Pm2DfVssxqIjnV0bxI663ybmCJn56XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267724; c=relaxed/simple;
	bh=3KT2/u4RoRMwUJ9D2uMXwMby0luYx6j0JZYXT2Zl+VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBDvJIhqhsFmmVDwiqve24tvBb2uGF/hZZcPyvce6jGTHZewQ71EniUX/GkdTY4FCbaTbuAkg7+789N9m/LAKPsYa/f0/9V4PZSGmbLKvM4BhPlEbiDNP2g7tJr/uXeXIalOQ8E4QzbvmBkDeAYD2+cIlexaT+QusW07hw6dwhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zfyij/D+; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zfyij/D+"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-27d0e994ae3so1047554fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729267722; x=1729872522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gnQ/nStU/v0TXnYDf7OxJ5W/0lWg49Zv5lfg+wBH6U=;
        b=Zfyij/D+p43i6JEqumg3mg4OeQUfkXxYwNWQeXX4Fa7mIObseHLXzi9moLBbVfbfZL
         1YdPcdy24SaZcs2IKCH95k04NyIAiUksXAmSRkmfGKT0etTCL7nWaJY6xN6TAO0mdeNj
         vS6wK6lirzfqRXtYOuBjJCvEKkiFPme1FNRbAV38R2vclhuf/2EIYnoSM/uIbQMJSJIz
         7JdNdExn4RE1gfO/M+j1RGKsoyPvYHrOeB9YmQ6aj7GElQaKf3LHAIhm2e8nT6n2snEa
         NbOj0pOEF2xzCNvs9KGk1x/3EBbqTUJC56BrpynVt2V3LLQoJ800ZScerQDGhKvJU1iO
         2+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267722; x=1729872522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gnQ/nStU/v0TXnYDf7OxJ5W/0lWg49Zv5lfg+wBH6U=;
        b=ERh4H+/DHPr8pnEF4hH6+Bycm+1AEflDRdJoD+D9YTo5w4R2HKBtTYLOTK1yNILmw3
         1QiO+D4lKPIUwyVem/QjhAX/YKwGiuezW25zx6/6Bf7WBhBlLENwQbkrjODCIgUuP11e
         Nvq2SI8l6+WIBAJwxmd9psUOoFS3aHUuOeqqGrI3fbTr0cQi/7adZzCIcb7tpLjhBRlk
         DBh/3JNezcc/UFVJCSeSxhtPqFwpNfxVQJlEvIW/Arp9DjXuAHnqrUlS9vLk1ZVHG5NH
         S+9px1FjPEJPgC4T3WRJPuDfzmSfMrOW4pF/BVcf1veNJv5CM485+F6G5Dh/kgLhD4Y1
         6+kg==
X-Gm-Message-State: AOJu0YyiRyM6PXCZ/UnKsGlaJdjR1L+AIE6SFY98BCaxV2Fj8t3UpITR
	rdS2l043o3yquJUjph+1i56glvERAwGrKdCiv1XBVmriesdCTkIRk43bWA==
X-Google-Smtp-Source: AGHT+IHLALT3i2H2ZaEO/giiXuwmyV1PfPjbzBOhHcOcWttqNdTCOSvKlc0d3Mdz4hOpdTle/RccIQ==
X-Received: by 2002:a05:6870:c0ce:b0:260:e3fa:ab8d with SMTP id 586e51a60fabf-2892c562e82mr2601904fac.37.1729267721736;
        Fri, 18 Oct 2024 09:08:41 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2892afb01ebsm507350fac.50.2024.10.18.09.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:08:41 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/4] arm64: dts: allwinner: h700: Add MMC2 for Anbernic RG35XX
Date: Fri, 18 Oct 2024 11:06:14 -0500
Message-ID: <20241018160617.157083-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018160617.157083-1-macroalpha82@gmail.com>
References: <20241018160617.157083-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the second MMC slot on the Anbernic RG35XX series.
The second MMC card is connected to MMC2 (WiFi if present is MMC1).
The MMC logic is powered by cldo3 via the power domain to which
it is connected, and also has an external 3.3v GPIO controlled
regulator required for functionality.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 80ccab7b5ba7..e2039fd76b3d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -18,6 +18,9 @@ / {
 	compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
 
 	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc2;
+		mmc2 = &mmc1;
 		serial0 = &uart0;
 	};
 
@@ -175,6 +178,15 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	reg_vcc3v3_mmc2: regulator-vcc3v3-mmc2 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vcc3v3-mmc2";
+	};
 };
 
 &cpu0 {
@@ -186,10 +198,21 @@ &ehci0 {
 };
 
 &mmc0 {
-	vmmc-supply = <&reg_cldo3>;
-	disable-wp;
+	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
+	disable-wp;
+	no-1-8-v;
+	vmmc-supply = <&reg_cldo3>;
+	status = "okay";
+};
+
+&mmc2 {
 	bus-width = <4>;
+	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
+	disable-wp;
+	no-1-8-v;
+	vmmc-supply = <&reg_vcc3v3_mmc2>;
+	vqmmc-supply = <&reg_cldo3>;
 	status = "okay";
 };
 
-- 
2.43.0

