Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9B3B66D
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 13:51:43 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3aa139a0ab2so623383b6e.2
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 06:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695304302; x=1695909102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1utggLI0BiGHlTHHR5/pvUEGIO1xYD0ZyabcazoGu4=;
        b=BnlmwIK99t2TmOtqaUYJG9IRkcJNWn0PgAe27xe34Qxet7dT6W9DPFjEXcTFuobu3i
         7CJP+5/+RlvFHpFc3BaJ4tllEYuDUxslAezMQ1n+iacLjWyjkbhIdMxhWDlqv03q9hXK
         LzvOT/ipI5DcHwsn19hzophyUh4yojEP1WZPleD0h3meFEwXoHKB8qfSG1bbM4ITd2R3
         zZmbzAX6SLfjOm38LPS1SEPbwta1gZFHXBJXC5/Vs+Gy1Im2b3qLhe28U/mH0KZ480/U
         TcgZcQKffYkayUblenRDTYcBvV5IxwWKdINjYLuJSDnpWV5WeBYb0acfECFBpUjg7KG/
         sT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695304302; x=1695909102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1utggLI0BiGHlTHHR5/pvUEGIO1xYD0ZyabcazoGu4=;
        b=CoMYENxl1+ngBNtOnjS3lrRf/00IpRJcoLdWgsliTXtPpqESNbQ4bpbgYWvmb5Eg9y
         PBPtFn8uXApLLMeA23B1oZG4JvyWcBfoWfqJwaqns+ewLWcsCDu7GOAdIM6nCBRFxmR1
         dB4La+z62grPcNLcJN7d4RHsy9yEuSjJSYqaD2fVo9XiS+YRtlsL0LsqLfJEC9Pyj49A
         l7iW7ishCCEbAhNTb4kIsoaFo5ppDqP0SvbVn3pXnX24ZMhLA3A4BwCcRQ6QSGusjUMx
         HevQRfXhtiHMz6ezBZiNlCh5SEEqCnO2NpOL32P/ZvrJzRYKBjP1orU7lUJQDKGRF7fV
         bBQg==
X-Gm-Message-State: AOJu0YyHie3Sq7JbmDXB4aIF6ixbBe7UW59PpiMNQgua5MnkZQ9KSHmt
	vcD8qV/26GX0TnSZP901B02XGgzFifc=
X-Google-Smtp-Source: AGHT+IEErlN0UsLsx7gN9nGZwWXOOBiY2PgXFRk34l0suHipPoBbKDD5ZjskrrWrghU3r2jMh6AqRg==
X-Received: by 2002:a05:6871:687:b0:1d6:4b84:c7ed with SMTP id l7-20020a056871068700b001d64b84c7edmr4805468oao.23.1695304302615;
        Thu, 21 Sep 2023 06:51:42 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id z19-20020a056870e15300b001d7034bc222sm547064oaa.15.2023.09.21.06.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 06:51:42 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	uwu@icenowy.me,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	andre.przywara@arm.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V5 1/4] arm: dts: sun8i: V3s: Add pinctrl for pwm
Date: Thu, 21 Sep 2023 08:51:33 -0500
Message-Id: <20230921135136.97491-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921135136.97491-1-macroalpha82@gmail.com>
References: <20230921135136.97491-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add pinctrl nodes for pwm0 and pwm1.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 3b9a282c2746..c87476ea31e2 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -414,6 +414,18 @@ mmc1_pins: mmc1-pins {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PB4";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PB5";
+				function = "pwm1";
+			};
+
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC1", "PC2", "PC3";
 				function = "spi0";
-- 
2.34.1

