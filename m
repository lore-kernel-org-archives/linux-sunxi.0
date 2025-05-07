Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1050028F51A
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649367; cv=none; b=Zi1x38TvaR5eQbkf7zrXk3oHZIgEkmdb6UDfei3JBCzZoi25dEtu9SlObfMOF0RNffQGa9xoAlQ4ZY7hvMZDy7H3owiN8HZ2Te5Z2X7du7MpGN3CDvawvt1uHMbo+2T5yv9syE2l7UWk3RIBHqpNWsd9rmM3wCkLdanxulpc35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649367; c=relaxed/simple;
	bh=wXQ7W7ZWxl7n7ZHArkFcw/VRY6p8yLTzSjGvpRdnACk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYOhbeCLTGNTWIUUcDoejoSaVdeHBAcZTFSVZxY9diSPAYh5HVzmYzyDf7hCBxlYS1lBW3+JBSFcgDd5gzTFPhmY7WKxyZ2kp8YYTV9Ciq1O3G6fU0FSPC2aER9LhwXU7vc2ZMXR4cD9X4Djc9w5feyKniFdQXkwOiWU2C4Q1i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiklqKRr; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiklqKRr"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c173211feso67570a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649365; x=1747254165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjhJjaIvcnDBaUHu5Cl0khV6aJlrP78s/O1dFNpl7CI=;
        b=SiklqKRrZXHwxmEwyIkvTNfhfsaLv3Nkwffq5beY4R9NOSXOBkIo3/uq7/SKUMIqSI
         3HhZHpEwDelGSjgn+z6GXmXbHb7FvVRqUAh9M67MhCBk9QVvYgKnOh/ElnpgmwS2dFWh
         tGgmHhrycdYE27bQTLQEEzLNb3E2UCRQoIqxqDil3Ha8c4/ExoQo1CiuT364uJKlj3uX
         PZXEsQiLNFeufJqs1oS4AQriH5LfMCXQ4NxSxU21VmDtWPNjBvTCO2emAYoAbZTM1a1D
         zjezjU/kaL5UT2794p8gTN1lI1Z9fuW94ivXTMlTkorSpr5JJz6QqDshwVNFMRqcMd+U
         mOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649365; x=1747254165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjhJjaIvcnDBaUHu5Cl0khV6aJlrP78s/O1dFNpl7CI=;
        b=FzdNQKqHw8e5PWnUkMH5NLH5Q1dcxUSLVwAI1jABr27ILSqCVciMpDtOhegh7ajGag
         3YzgiuORfWSbuOq9SPHUNqTdE7i9Edp/QZLCPElR0lHCMUfTm8Cf0mdtBMOhEvCv5KrI
         R4trqUyPbYPmPFzRj33RAaYS37tBAp7wasKsK4LtCnwiW+NlHffFyngehJq6Gc4cRULk
         EdruNlZIWdRzE6d43G3i5crnsHxUSXWaHHR6XZKW4XvdavHSJXIUFEYF3U9d9IMmlc+t
         15NRfgM2PB8GOhEs1o+Lt7etG+2Qei+mdqfMMMguO2ktAjKd1+2J0IvrupUrDAKxcIrn
         sg8Q==
X-Gm-Message-State: AOJu0YxvPU5SpADPwXGGIK24ZlWWCKDYPGVr43ZdoKF2S/FNdUE7CIPG
	KO1iY6na2FpAG91uMz/0P6oBk+MG9m0mtAbYl8To8AJG15a/QL/tBpYQcw==
X-Gm-Gg: ASbGncs3qubqGhD455q9jVwLuZ7oRwB0LZJrmUSpVTf5MrsLZI01vh5F9JTDVImkK/X
	7HOfgp2eWSgQwfNWMxHApg5xKgZLyc4dLGKlO35FvmbO4x/MeKwDO/zm+YloI/6q1ghLxHPxg4X
	hKpYPHjhCVddXpAGkqnLMggCr2QDQ+CRl7JrnR6DvYHk3hxpeU+Ux5fjKVsWkTf60XcGcSx6vT+
	hTHAJGPkGXuFc7Z5kBzkWXiSQxIIEsE+phBDqD7MNf9mL/M9CCa4joabWn26f41sGECu0D6nqxm
	hqt0PHKF0ZKDSWv9kdZjd5j8wdMTaOii2U1P0FOHR9LS8ksyyruqLI4+xv+M
X-Google-Smtp-Source: AGHT+IG4VEv+ll1E+etIO/RyZfeFwZQSA+7FeaHNtj2wtpn38UfCsWG5LnoVjjBVpMiy/mgpRspIwg==
X-Received: by 2002:a05:6830:3985:b0:727:423c:95d5 with SMTP id 46e09a7af769-73210a6eba3mr3371615a34.3.1746649364822;
        Wed, 07 May 2025 13:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:44 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 23/24] arm64: dts: allwinner: rg35xx: Add GPIO backlight control
Date: Wed,  7 May 2025 15:19:42 -0500
Message-ID: <20250507201943.330111-24-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The LCD backlight for this device can be exposed as a simple GPIO-
controlled device. It would be more accurately modelled using PWM to
enable brightness control, however the PWM driver design for the H616 is
not yet upstreamed.

Add a GPIO backlight node to the DTS.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 7e17ca07892d..95f2ae04bd95 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -21,6 +21,12 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pio 3 28 GPIO_ACTIVE_HIGH>; // PD28
+		default-on;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		constant-charge-current-max-microamp = <1024000>;
-- 
2.43.0

