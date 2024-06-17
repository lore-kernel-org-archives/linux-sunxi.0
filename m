Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9840199238
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 22:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718661969; cv=none; b=P0lYFFs17ucAo50GVD4rw/pKzMOylHfHwRmu4CDKRrgCvSMcJFP4f/clmkUrKQRHzsYclXv1lFye8DVLyg/eZaEMC6jujauLdSJEPc1oLSYQKRvImhUWeF4wtpjjkKSDdvDHxA+EC3qHq5BDDi/isXEofDCtvboB1DCBCK+kIQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718661969; c=relaxed/simple;
	bh=j6RTuMiwhhPOe4aRhhv5nDakG1pInbsHkJ/5EckbV0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WxDokYknitg4pjdfcMstdu1VqusqVCnpsToRUm7wF81ZzHBERG/9mSV/bmmeD1wYnyV0r7tKxs9Odc3Pk3fmGFWl9RZKcdXCVZnhhuTS5D6KYt3bnU+IWWIliLOIgFqLT2SQR3Ha4+SZLeXdFb+Opz/JGZtk9KscdY7MtqhSXRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GS7rdkKM; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GS7rdkKM"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6fa11ac8695so2745680a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 15:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718661967; x=1719266767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BziCaw0KNoy52TFFrJE/sLYMOcgMiEW8rOGB9cWp6c=;
        b=GS7rdkKMvKyQA2pDoCBHqiCc/kEtLeXG6WTqfaXfn65pM6Iz260ihnrffPwgGrv7Ea
         eaRw2H7f9V/CNJuOiRfjA9WsOnSJWJuaBv3gs0041iHWtbBWhzZYvf6GtzGBgg7b+ByS
         /lHmSMPObmNcLDjH/+BXFx6ibpxkHeE/KTP37VOLA5sq1Y/OzPCy5dTxfUegWBBOHbgO
         aGLzyFsFMZ71yI/Ug2pGo88q9+Tbvdpiu1SOMoQIoZb0YAByWvkVel4KRtdKKB+f/hct
         6f0LzT1xxsx3dz8JcN9cSbaZMoBt1YZeqCzKEPSrsWKyXr9qDJpE/J7wx2oa1I3ztbtx
         akWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718661967; x=1719266767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BziCaw0KNoy52TFFrJE/sLYMOcgMiEW8rOGB9cWp6c=;
        b=RlD3k6ZSx1hiPzFNWgskjRf5jMc8cqhQj+piknihcfX39wdYRgVxOJJLpSUbOYOAMf
         H11TdjN7uZHnj1KcUy2aM51hcR9B37G/1DB4oFmsFJ8xesH8u3r4zssMuc3FyGr3eV8I
         fpsTRjSGS75y3MQU8SDLuCVKGhKe5U6TBUz9wLZXL7ZnJhfD4q0YqpW7heX/TkIOK8Bh
         eXoILLkI4vemJJJhwibHqRKfjB5SDir/WanHgEJP7209WhxJGZmF728kcPdf7SQaOHAO
         bUfBNoyOlPqlm83pIWAynGz9yERdfbTGPiee8azv8F39hGmoBNZ89o+drMk4h+v99o9W
         4CPg==
X-Gm-Message-State: AOJu0YwPIjkX3w4V3oLKGXuCRd4/Pu1nBZY7BFWmLe8mkQCm4Dx4R3ge
	2wpT+TLzb5ElEl+j62xQfDtARHocVozViRyrAV/IHUfRjFxCWt7LF6zR6g==
X-Google-Smtp-Source: AGHT+IEr69oVoQp6ZjahqW/ytJ1vFMjRMIerdktekBuGD6FU7Uh8MBILwqS78oEqXitRb7vFWx1GWw==
X-Received: by 2002:a9d:66cd:0:b0:6f9:5b24:4668 with SMTP id 46e09a7af769-6fb9375ce9bmr11413893a34.10.1718661966945;
        Mon, 17 Jun 2024 15:06:06 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1b0fa8sm1664232a34.28.2024.06.17.15.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:06:06 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 8/8] arm64: dts: allwinner: h700: Add charger for Anbernic RG35XX
Date: Mon, 17 Jun 2024 17:05:35 -0500
Message-Id: <20240617220535.359021-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617220535.359021-1-macroalpha82@gmail.com>
References: <20240617220535.359021-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the necessary nodes to the AXP717 to allow for monitoring the USB
and battery charger.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index ee30584b6ad7..f15a5d193f7c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -21,6 +21,12 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		constant-charge-current-max-microamp = <1024000>;
+		voltage-max-design-microvolt = <4200000>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -217,6 +223,16 @@ axp717: pmic@3a3 {
 		vin3-supply = <&reg_vcc5v>;
 		vin4-supply = <&reg_vcc5v>;
 
+		axp_adc: adc {
+			compatible = "x-powers,axp717-adc";
+			#io-channel-cells = <1>;
+		};
+
+		battery_power: battery-power {
+			compatible = "x-powers,axp717-battery-power-supply";
+			monitored-battery = <&battery>;
+		};
+
 		regulators {
 			reg_dcdc1: dcdc1 {
 				regulator-always-on;
@@ -307,6 +323,11 @@ reg_cpusldo: cpusldo {
 				/* unused */
 			};
 		};
+
+		usb_power: usb-power {
+			compatible = "x-powers,axp717-usb-power-supply";
+			input-current-limit-microamp = <1500000>;
+		};
 	};
 };
 
-- 
2.34.1

