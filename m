Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256371547FF
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626584; cv=none; b=Md49FW8GrfWQZQ+rHK8v+D9mZ4w1WRA4DIp6J09I8YoWr2unYzKhXq6ZZaWQgA4y3Kmt3UNBuN8WEBZQzyTHjYu3GhpdcyBxugtyngQxkrsBGyjzavMAUYvydxSFrjZ9A0opqZzc0oWYHDtZ/u++uDNa0gI4O3rYsRPeC3tnC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626584; c=relaxed/simple;
	bh=IGFCSTgJcuoRzGSPK8CuSC3g7DiKhbxO+wXlPg2+FUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gfmH51LdKYZt80+DWoLYbh2idriWqXchZEjSPeQZP1rMRY5IDvP/0UCGv4jDXjEHAJhBg7QOQNTUR2ioB1SKh0rHHIRK3PLjusVg8TaW+CDRhLmVAs1UueXxu2IQT8JgbTNHi0oplKpeFpia+n7JZAYsjE9tmBk/xIcj6P78QtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9S73VLL; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9S73VLL"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3db16a98d16so5317333b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626582; x=1723231382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bljFmiJkhPU7BKEtswdXuPsqQ0+QMylW7jPglHY9Uc=;
        b=Y9S73VLLMdnp4cTstBoRJ5h7Id1BA/cJ9hftObw4MiJ/78zKaEu2DVpzKcKrxCNL6X
         m8lTY6vOZi2YhD69dEmFVoEEGAGVpCnPiGsdVsAt8VEkoHosWG3WR8Zie8YDs/PinVAc
         suyvIf+JkNlYWFdekhJQq/4ldDLfImbZEWcdH1cyFyaFan+5LFYJjSL4Ynh7eREbQRKJ
         ShGMSAHnbtOBGqDlM7FYcUIfVEUhNfykqbEjaaKPNwbDHyH3XFzdPKLljalNXzWYhIqT
         fVr8W4s5jfZQK3/WDIEMvqKKldT085UCSOljTj0O3DddrHq10PNyE7NZe83F2ac86Vo6
         fWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626582; x=1723231382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bljFmiJkhPU7BKEtswdXuPsqQ0+QMylW7jPglHY9Uc=;
        b=fbUZaZodmBACyxJfMJ8R+FCkXMGLTZka0mV1tHrECaiyiBSq70BCnvxK0FNOarE0xN
         dIpUof7EjDIqjA6ii02HczTbCkN+GZ5BqffbWz7hHx/fJiG2xpcpZnG4Rk7S5zwParGm
         pCFpDx4E/h4s4EyZN1/AYRvdko6iuQYDPmbi2Ce1KDQDFmxcopWAy6M26C2P7BwvUEjJ
         Ky2A6MLPbGLpcmiGhZPrmSmZuZQP6onYviSP9aAziBE9uiSw8P9+hhXz3JnWMbFj2DVf
         fN4elDF8Zc/LX7JvJIrgX96Q4ngfrzpSgOmJ4h3NA14vNbDi0IrFsaWzLrDAhXp2b/pw
         CB7g==
X-Gm-Message-State: AOJu0YyDLWqGBCVHV9m175hlAYLfwDH+ngpbwQbOr4VxGI28ul6gJjL8
	/CGZCeseZt22MgtEKwGtygOfMrlAX11u96jTPrK4qkqA+6FbjHlWSgC+3Q==
X-Google-Smtp-Source: AGHT+IGjBzlQxgg8C+yv67X9RvusG8E8mOEP2cJ31NbvBUQRSj0BF+eewV39CvF2RjsSsdpKP8J97A==
X-Received: by 2002:a05:6808:23c4:b0:3da:b3b3:191 with SMTP id 5614622812f47-3db5583db96mr4810309b6e.48.1722626582119;
        Fri, 02 Aug 2024 12:23:02 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:23:01 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 15/15] arm64: dts: allwinner: h700: Add charger for Anbernic RG35XX
Date: Fri,  2 Aug 2024 14:20:26 -0500
Message-Id: <20240802192026.446344-16-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802192026.446344-1-macroalpha82@gmail.com>
References: <20240802192026.446344-1-macroalpha82@gmail.com>
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
index afb49e65859f..83b5c03b1bb8 100644
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

