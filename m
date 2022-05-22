Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1F27C
	for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 17:21:48 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id u30so21951961lfm.9
        for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35cINdG4aKyvkMTNqLECMQ6LpQDha8n1Ps7uhOu4v+k=;
        b=f2FDUnqInwufGy8gdJQxjQjX2B2lmZ7dhKYRkltHSOZw31TObrnUW5fvxLyuJPUZew
         H5gL9iYu1NqkTZTO/PknCgSMxu7fMg+dqsv5IpgMIxAHgpp2y8TGDd+wsNEBSDdPQK8Q
         8zNcNSnf/ArwQhiGMHR8tGHftZH7YewVGVOjIWFH0gzmnSNKCnAG2FJoDMSo8Mx0oOl7
         TpdB/QQyK3btafai5GmPByEuQKI0FTAcJN3qYKKKNP2Twc7ZOC17+ag3xFRrvMTiexYq
         +MmrE8//BB5jmS0o7E5CkkbjBp5+9mYrhdqk7zJ400Dz4az1TrhFVnvtQiIBGyoCoyP0
         uL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35cINdG4aKyvkMTNqLECMQ6LpQDha8n1Ps7uhOu4v+k=;
        b=MEltp0x28duM6Xol/i1EY8LBC1OXtWnYpntj2UEsGAB+q10TmnquGxX0vsmbR9LHHR
         maI5yDz6wEpUDUA+w71lQTkhotuOjDyowICs37sFkjM6m8HfP3Rg3/v1vZ3Rfypu4i9f
         yvXlJQQpI8YjssaCZTHj8vASf2MugrYAgZXYmH34jFfmDJiyz+Z66zcxV4JZDAQ6bPma
         Wbwxbq+0dbZHQyRSFz79EPR0SGQaLgbqe9ktjjCSBiYdA4RzuuQkBkPTAsPbY5JUO4sG
         Vur/24aYU7YbdAxFeoKPW0XYNRXwZMaUbwqq8Tjg7+wT+IznLMOkILf3Snqw3Ef13mov
         WWXg==
X-Gm-Message-State: AOAM533L88v2O7aPiEHLn4dT1+8Hz7hRnZAulG9Vbr5wFHFvouGYnSpQ
	bGdbjM0f7c42gsFPPpCRfGw=
X-Google-Smtp-Source: ABdhPJxC+Dc1ZQZs1hKM6kdDFny5WIDxLDCNcBbjVrKc4LOoLeaV2Vj0ngL7LZUlrQVl/mwHKQA4XA==
X-Received: by 2002:a19:7613:0:b0:477:bf3e:db7 with SMTP id c19-20020a197613000000b00477bf3e0db7mr13851533lff.454.1653240107008;
        Sun, 22 May 2022 10:21:47 -0700 (PDT)
Received: from localhost.localdomain (ppp91-122-164-134.pppoe.avangarddsl.ru. [91.122.164.134])
        by smtp.gmail.com with ESMTPSA id l15-20020ac24a8f000000b00473f03f22a3sm1527691lfp.58.2022.05.22.10.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 10:21:46 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: [PATCH] arm: dts: sunxi: h3/h5: add gpio-ranges for pio and r_pio
Date: Sun, 22 May 2022 20:20:19 +0300
Message-Id: <20220522172018.238564-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without this property the next node can't be hogged:
&r_pio {
	test_hog {
		gpio-hog;
		gpios = <0 6 GPIO_ACTIVE_HIGH>;
		output-high;
	};
};
And the appropriate error message:
"requesting hog GPIO test_hog (chip 1f02c00.pinctrl, offset 6) failed, -517"

This problem occurs because the "pinctrl-sunxi" calls
"gpiochip_add_data" that parses "gpio-ranges"
(using "of_gpiochip_add_pin_range") and registers hogs
(using "of_gpiochip_scan_gpios").
So when the gpiolib tries to register hogs it can't find any ranges and
fails.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index d7e9f977f986..4193bf962b7d 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -404,6 +404,9 @@ pio: pinctrl@1c20800 {
 			#gpio-cells = <3>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
+			gpio-ranges = <&pio 0 0 22>, <&pio 64 64 17>,
+				      <&pio 96 96 18>, <&pio 128 128 16>,
+				      <&pio 160 160 7>, <&pio 192 192 14>;
 
 			csi_pins: csi-pins {
 				pins = "PE0", "PE2", "PE3", "PE4", "PE5",
@@ -937,6 +940,7 @@ r_pio: pinctrl@1f02c00 {
 			#gpio-cells = <3>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
+			gpio-ranges = <&r_pio 0 352 12>;
 
 			r_ir_rx_pin: r-ir-rx-pin {
 				pins = "PL11";
-- 
2.25.1

