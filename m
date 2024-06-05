Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B74139D13
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717608059; cv=none; b=iXgzaN1lRPR/Fj7atzBLiXst+vwQRkyvtcUtkpLVbBgojRWbsysbLk5jLW2LDwvK5iQbEU7Wo50E78mBXPRguhPN+B13blCOaci3UB32d2xFQQ1svYU9jEYoW3GcXwKTP+GrazX1AUb6ALE5UKCDI8Pov8tPpGmEKe80ioslFAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717608059; c=relaxed/simple;
	bh=/3WUGbzsfRdMGcgxSF83iPvl5/rRLdUK7to7VHJ/hLE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vDxBl2Ne/A/HMYSuhkpEGwKTBqGKuSL3EWPEZFicMRi0TKpCO7QHUGAuB7+zDnVvTd5Nco8Z0qPXpVyv7pVsVFu+Tg/jcwqN1p69EcnLYNwpusj0qWUahPWKEzCcjixbAdzqt9r8suodmcugpbVVi9k52eItuPV4kP8hUdSxDa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ac9t3V/e; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ac9t3V/e"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b9f9e7176eso125813eaf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 10:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717608057; x=1718212857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm8Yhk+byRnbcGcmTatBzsMUgVxwZv9RhcYpdQAuQCI=;
        b=ac9t3V/esoska9WImPdwt9xbKHwrhlD9TM5mCHD9M74aKEBpWx9QRAPmmqJdi0lp7T
         Mt8cYBn4/7VinveyCc5A9ZDBKeuKHcFF45QICKM7cZGuZV+tTGXOes7+8rv+M9QHRGKV
         gpLvfcwRtzGWP6Lakg2vJLzoXhWnT1j1B53Ut+v9SGpKHQ49J4LG7+mgdDAp6fym5kwz
         Hd58f/oIfK2i1ULJYhb3Ef5sDXPmotGFeHKzkgjMTFDcYvjMxBchRNPw8CK1t71VyPKj
         jk7xblQtUxo9Kiqb8gCnPqRNgP3TUrG3Go4EddlZyYQHMbSiZYzkzCjMtJKr088xIM1I
         Cz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717608057; x=1718212857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm8Yhk+byRnbcGcmTatBzsMUgVxwZv9RhcYpdQAuQCI=;
        b=ORtbs8jiBKiz7TicS6Gz4keAMBLu69ts3va0drhntRZaQg2oQWA/Ll9j4yo86VKxJV
         uqxtGBQ5ai0xBlH4CoOa00Y0ZY/6hlpDbNSK4TAl5EFtD8kAuEpfB2rAUjKHzsud34HW
         xmHRjeO0Z1uA0Jk/G1BL/nHLaEkEEDue/gYRM2OgnBlzMGQWorhvcoLcb0vbmAuiz+Ij
         bQ7U0mTCUOxHALvT0pM4xU0SNgZdiWUlXV1PKZoSQAB0e8P2OU+1qDVr1EaiG2v/c775
         FwXAqLU3lszfhIm5FK47z5yH5HflR/CxCGs7lBMzPqN6OsFHFAMkcbVtTAZ9+vjAV+SB
         Xl2w==
X-Gm-Message-State: AOJu0YwY2eC3z4LCRIRjq42w9DuQAKSHEEucwgFQSRKeV05CQFktUpTK
	4RYerXtc0Huzg8qGc07nwTykMzKF1kowbEzmmuNx/xbT5RgVThccoseG+w==
X-Google-Smtp-Source: AGHT+IH4f0Qu8g/XdwPgr2Z7RFxmIcBoFptx44anMYUmu4fxOCuDovIPdBzmN3XV8wodkT07jf/Jug==
X-Received: by 2002:a05:6820:1610:b0:5b9:f121:5287 with SMTP id 006d021491bc7-5ba791a0ab3mr3660070eaf.9.1717608056588;
        Wed, 05 Jun 2024 10:20:56 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ba72cb44f4sm586124eaf.40.2024.06.05.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 10:20:56 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	p.zabel@pengutronix.de,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH V2 3/4] arm64: dts: allwinner: h616: Add GPADC device node
Date: Wed,  5 Jun 2024 12:20:48 -0500
Message-Id: <20240605172049.231108-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605172049.231108-1-macroalpha82@gmail.com>
References: <20240605172049.231108-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The H616 has a GPADC controller which is identical to the one found on
the D1/T113s/R329/T507 SoCs.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 921d5f61d8d6..30ebc0d23760 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -589,6 +589,17 @@ spdif: spdif@5093000 {
 			status = "disabled";
 		};
 
+		gpadc: adc@5070000 {
+			compatible = "allwinner,sun50i-h616-gpadc",
+				     "allwinner,sun20i-d1-gpadc";
+			reg = <0x05070000 0x400>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <1>;
+		};
+
 		ths: thermal-sensor@5070400 {
 			compatible = "allwinner,sun50i-h616-ths";
 			reg = <0x05070400 0x400>;
-- 
2.34.1

