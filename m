Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A0B8BF5
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Jun 2023 15:09:55 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b475b54253so12737931fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Jun 2023 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687532993; x=1690124993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV92pSpCVmnx9n4E1q+MRb4GksMGgD+y07OYM0/qT58=;
        b=sXiFVh8mY4yRjMQ5IDRS3cdjZB3EQPHWCuZIj6T60Sk4ybZiSnmXIs8m6+e0J+kRXR
         QyWq6q/MRb3rSbsQGNAkCkPh087W0VWgSiSo5ojaGLCHomXibYIGnq7aLHmKjkx7/864
         lMSIZEHjuVmaivRjWAiG3+vqrRHCwculvuB73JKZcDnWDXNe5fyW+7oymLyl5Hyt20eA
         JQIAm18JoJefEQUpn7wf5z9ZFwjb+W/r7RTHOalryMcC1FF6V5cm8EWVk2J5NYJ4wJH7
         1JBhZLJqTXRGbgoNm8qWTFOfPNrogHwSYD4uQtCp+GDPDOE8pUwYI+vzJXZdMS0KBLys
         dNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532993; x=1690124993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wV92pSpCVmnx9n4E1q+MRb4GksMGgD+y07OYM0/qT58=;
        b=T/p6ILPrMX8mySeh37pmT/fyJoB1WHxPFhbQUJZTFzP+r8RkhiafBW7+6c3GEyFPIw
         YVQZM7HtI/JIHs6VEEV38lVVEDyZKwF+HDLp/0cE+UzucK5cLHI+s4L7CIJWGUwXgcUx
         Yyvy3F9afZ9kSNpKX3Uo6IAJ1JUp5/mSjXqMPGXuxQMGbBzvO5St/MyA+CrVrUqzpsvd
         Ykx2Y/0X7ZHbjYcvZp5YHEgcTZtg2y/8xq4KeowzGXJEw7EUrlKtM13l2GePyyiZ2wC3
         pp7a8Xp5rbp3V8jW5tvhuETu7MCKGm4Jlfso115EGcDZltTrSIHYCQc47ydSQy/+4k5B
         sJdg==
X-Gm-Message-State: AC+VfDxymSLAFsE2nmlDH3fy5Ez0xCNOdSsOKN8DPXiJcJp3bM68O79j
	gF78it41gZwQXWNGkeMw8g==
X-Google-Smtp-Source: ACHHUZ7z54b932g35QQQnfiEtWSCAb/7Udc6dQREd6ky5WQPL1j9+L467bjzNGx/Y3G3O42+0hDICg==
X-Received: by 2002:ac2:5f93:0:b0:4f9:d9d:eacb with SMTP id r19-20020ac25f93000000b004f90d9deacbmr7825166lfe.8.1687532992750;
        Fri, 23 Jun 2023 08:09:52 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id w25-20020a19c519000000b004f842e58d08sm1465686lfe.84.2023.06.23.08.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 08:09:52 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Fri, 23 Jun 2023 18:00:01 +0300
Message-Id: <20230623150012.1201552-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623150012.1201552-1-privatesub2@gmail.com>
References: <20230623150012.1201552-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..50f0f761527b 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -127,6 +127,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&dcxo>,
+				 <&ccu CLK_BUS_PWM>;
+			clock-names = "hosc", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			allwinner,pwm-channels = <8>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1

