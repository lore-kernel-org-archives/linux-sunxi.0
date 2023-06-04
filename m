Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547C23AD
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Jun 2023 18:55:16 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so4061120f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Jun 2023 11:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685904915; x=1688496915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=h5sKFEV8TA0OBcHdACbXty9PxKz8jgUpGUFbiy/GvEKjYur0hVmD+06SUCGLY2yHn3
         wHrmRZK1WNIdgSk5SS6PxT6kyriDte832Ogpjw6YI/1Su2MZrTtdLePKdfidrymZBSIC
         0RxemvtGNmqSZC4pe6IFvElKtRIapasNwQJqi6FS4I93LoK3wdw/uMn/AGaUAq2Kkmb0
         LMSDKc8O1QhhA8l+6CJf6kXCkrblhF5GuqRf0ednu15Ipzaju3PIIg0Mc4Xti0Bz5SRH
         v6r/EYkQGmGJaArsU5mnlErTUArViEoFOXVyEoX+YBqurbPADpdfhHiIqnHr5t9go+PI
         R9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685904915; x=1688496915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=WBdR5+GXVvtwGwUg6nmZ0hRn7si2u+mJdoKyJUY6JN59TV0UCQ4U+sTC7+JG4Alei/
         C94BKzjR9vGm+W4bqPy50ks15WPBJoYqcGgsip2XPz2SsktQ5rhIUDciqkvKt2qLUkWj
         9J3sSDCvCOfS+nr1wX0Joo1jnlMO/dEd9ou/YYxrrUPRHANWUOZBgix8BLg7JRpJxthg
         WNRQQqmTANBW1aiEr9JCOiQWonNjEvwMduf7/ey5Rx/K2zhBFvLYoQbNm7qXq/8PMjb8
         4AEibehf3SsKWExyX2oEwuZDIXKF5jBpBtzE/URQKH8rOWUBFoVNguuc/EOD2egd2HmQ
         2mUA==
X-Gm-Message-State: AC+VfDwUMFnSq1di50utD+tzCzpvuFs/8+qeoodRywWJ3mNoTXGuSo+2
	KR0UKa9RsMro9/EDHFs/7H4=
X-Google-Smtp-Source: ACHHUZ6QHdcEGqIc3K5pPlZKWdJlxj3Jk7ECCuHaBZpxT2c/x9Cv/yIBXAYPcu1w8wPaqG+imTMVYQ==
X-Received: by 2002:adf:fb42:0:b0:306:2ef0:d223 with SMTP id c2-20020adffb42000000b003062ef0d223mr4541453wrs.62.1685904914549;
        Sun, 04 Jun 2023 11:55:14 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4108000000b00304adbeeabbsm7636433wrp.99.2023.06.04.11.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 11:55:14 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/3] riscv: dts: allwinner: d1: Add GPADC node
Date: Sun,  4 Jun 2023 21:53:16 +0300
Message-Id: <20230604185336.1943889-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604185336.1943889-1-bigunclemax@gmail.com>
References: <20230604185336.1943889-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Kiselev <bigunclemax@gmail.com>

This patch adds declaration of the general purpose ADC for D1
and T113s SoCs.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..90c79041cfba 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,16 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x1000>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <1>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
-- 
2.39.2

