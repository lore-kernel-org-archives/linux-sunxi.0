Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF91C146
	for <linux-sunxi@lists.linux.dev>; Wed, 24 May 2023 08:28:37 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f4bd608cf4so581319e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 May 2023 01:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684916915; x=1687508915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3ShG8niWENBdEZ1rwxaaLlhweWqDlNMQKSkikRPmcw=;
        b=YSChDKRWS6Imw1L0SeB0IN6ZuM+a/H/oZ9Dr2NBh8Z3CYULLmn3sKhuyvZ4Tq1uXiB
         zeCRhi/rmvG0Cy3xXJru0pCR9BDM1JpS7dakQIrY+ocdIHdWwLJMTRbKdo+cXDdcA0vA
         8Y160G8RlYOxsUBYwoSDVLppHrG8SJ+BQFb1Lk5amAtVRzIFEhNcyR8EIApjB5qnwx92
         2zqb2AZeLegtoXywRVYy4nZnklQ7BXaotneUPeAHSJGjeJyOnsP0JvyI15xaXkOKSF1J
         4T76Cj6EKqyHICQzEJJNwU7Il+vyNyd/7lZWvWQ+ig7xb9TFEzjRhmw3KpU7uqAvxLA+
         dgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684916915; x=1687508915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3ShG8niWENBdEZ1rwxaaLlhweWqDlNMQKSkikRPmcw=;
        b=f0xEn/8fx7bgTp32NnFD3gf9+TvXTazt4kEQk6BFqlyIu2Rar4s8kvMK0db68NI3iW
         JKnx7R09T7+BF3/lvcotytv8QlwfKynVYSSHTuDpUZSvRXfFe6ecbvIPHOzUyLq7SnCl
         m+lmWq2IegmdvPNRMwGTqnKIWqSH6ZQxJ4MVapYtOAKh8IWSQs5rUj2lsoGiQzdLRVyZ
         65SYDYyV1M9Q/3Gz6wRk15jKD+oy08X4NSQkngRQDCvq2CzojKULXvNmIdL6qy+HRMHQ
         N1446j0A/lOf50cMG76gdcmlBsG7NedhIu0KjRLmAMqVCNYksH1eZUYBzuPAMC1FrHp1
         2G3Q==
X-Gm-Message-State: AC+VfDwXrrcJ0/Kr8zoVqa71HqejnzS+bUJfPtBGAmnGM6U9CaPZoaO1
	uhU3bln7N7jUDw45z3bBOcI=
X-Google-Smtp-Source: ACHHUZ7ERw8MQIwxgY0PwdFaFK9FxBnMmNFE63p+EPeuqhKlwikM0km3o8U8SsH82QTzyVLrEzpGCw==
X-Received: by 2002:ac2:4a68:0:b0:4f4:b378:469d with SMTP id q8-20020ac24a68000000b004f4b378469dmr2500468lfp.41.1684916915157;
        Wed, 24 May 2023 01:28:35 -0700 (PDT)
Received: from pc.. (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.googlemail.com with ESMTPSA id c18-20020a197612000000b004f378fbb358sm1614049lff.112.2023.05.24.01.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:28:34 -0700 (PDT)
From: Maxim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v1 3/4] ARM: dts: sun8i: t113s: Add GPADC node
Date: Wed, 24 May 2023 11:27:32 +0300
Message-Id: <20230524082744.3215427-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524082744.3215427-1-bigunclemax@gmail.com>
References: <20230524082744.3215427-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds declaration of the general purpose ADC with one channel
for T113s SoC.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 arch/arm/boot/dts/sun8i-t113s.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-t113s.dtsi b/arch/arm/boot/dts/sun8i-t113s.dtsi
index 804aa197a24f..d269fdde330d 100644
--- a/arch/arm/boot/dts/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/sun8i-t113s.dtsi
@@ -42,6 +42,18 @@ gic: interrupt-controller@1c81000 {
 		#interrupt-cells = <3>;
 	};
 
+	soc {
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun8i-t113-gpadc";
+			reg = <0x2009000 0x1000>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <0>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.39.2

