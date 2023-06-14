Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9E613F
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 13:28:43 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30ae95c4e75so6674147f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 06:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686749321; x=1689341321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPsNG/FZ1k4UaDSBhJRqncRzudNFaZG2hOicOFjuDg0=;
        b=AsIeycw7JKSVlX3rZAXj0VwdwEpUA2cD5kZgqIEd1XvHiu3ykvduo88KsTKzKKG3EK
         SWDNmkagjHwGdbFJQq6vXAtCthe/rufzfteujq9byzWzQ5TviAGm9c4cwtSHU/ZJlg8e
         yossznwjncroo/0G2M4iKun5LidbAiOGOHK32rSnH6Gpr3cZgGKimytAH1H8i5wk5o7G
         go0PvSQ2v5/yxUeA3E0MIB01DEJwOQYj2xuStS5IVs7/ierzqgHe4jjWqApZdNMS8lb/
         EB//F+xYOiwfy9AYguYRf3LUuJwzU3457PdpZ95KTPsAPFwUdJDhcNcu56qmKs5zd1Z+
         wb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686749321; x=1689341321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPsNG/FZ1k4UaDSBhJRqncRzudNFaZG2hOicOFjuDg0=;
        b=hBsePKNqNEH7zAzcxjTuFg7llutvMyWzIqBt1davk2JXqXxqbrnVcK7q1Ro4fZbvIy
         3CezlrVnNmpO+i345opYtdgVeqUEtkWYLIWJevqlBF5TE0HnnGw1+eIluTDpjutpogek
         PMHe9bLYNo/xLD/+ykRGHXhqZCs/QsEBfKBlrYntaY2BLJEkMLNeQrDVFGo2Sf3EDFf2
         YFzoAZn5GxPNIyYtCKwtZTXmeXA48q0hasF6sUXVygaLb21fuUbo2qIenzH6QfZJaFyl
         UetcZtZYOC8o5J+yPGvSQ6MfDwcGmpYbTZHCTt6T7q8BRZ/3IwE476qsTKx9lo5oPIQJ
         XIDw==
X-Gm-Message-State: AC+VfDwVOADSEfLNOqmebyTf4t2d5+amr6MBLw550292cgzXXgV5lftN
	XZ/nKwzGvLR8x/UTtsMaIOA=
X-Google-Smtp-Source: ACHHUZ6OldjWB/O5w6++CoG5CqyBVydA97jdA46Qv0Hn+Fg2Ncy5riE3GkkDaTbuni9DWvVm/W2tqg==
X-Received: by 2002:adf:f810:0:b0:30f:d32c:ed8e with SMTP id s16-20020adff810000000b0030fd32ced8emr2357358wrp.45.1686749320597;
        Wed, 14 Jun 2023 06:28:40 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b003047ae72b14sm18295017wrt.82.2023.06.14.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:28:40 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add GPADC node
Date: Wed, 14 Jun 2023 16:26:27 +0300
Message-Id: <20230614132644.699425-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614132644.699425-1-bigunclemax@gmail.com>
References: <20230614132644.699425-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds declaration of the general purpose ADC for D1
and T113s SoCs.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
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

