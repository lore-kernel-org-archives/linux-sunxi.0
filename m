Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91762200AE
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 20:21:26 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30aef0499b6so1805027f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 13:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686428484; x=1689020484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=q/HkAmIWDbgYoNWDDvT9YG/eWL52I35C0UJbDbI1HdQKZp+vNeYsWGUudS+FVnuO7q
         hw7oXcII3vxaWQLMSONG8XrmkQct32TLHET/Ql5xDmhf5uiDqZnN4HQBe0w6LiWQo4zd
         KTb5ddXVdsLXL2s6ElAylt2FpfdAEz/YboO5Hd9p0zgz1ZqnKlP4moTQmkNENgKys9yq
         mpoOc0nPZTKaYEZAPyPIOx48Ac/nQIeNMRCdldsJb3ivr3NtfDBs1TpRJIyLuZXgA0Am
         1FqqmH4xUJnhQrzIBYrZggfwm3JglxUDmeeEh4F7S0htHerNjv2xR07w23BaRpcpwXLv
         4Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686428484; x=1689020484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=Y+uFNxIVbp5nacR3pwZl8WxoqlxeyH9NStVlH3O/OfTCILKu+tPkUbCXMrtuYMyZLd
         Gamih0NI2FIpAnNYpLj5+tWeY6DeIPzXjeMI2/0Xo6Bz4J93oGlprLb9Br82RTOH7Sp7
         MZG0fYcsGX3q/5ZUiqkRJobSKJnHMct1g2DplIq/50kzOv4jYnnbaeRbM5DxZ5UVsbSQ
         NUNioGKQAK783iDNZzNWdH8IbgAYuGfZ9KiaYwiG+2GivJvOqQKrbHHojmFd5WoZUsGC
         4a7IqiVbMkxiUWbHHrjHZj6C3DHyi/DxSIJffhue1BbA5Qxam7r1p3LlYkGSUL1v44Tk
         48cg==
X-Gm-Message-State: AC+VfDyHO4xfoob5oajHedjDD1zgl38yN1G/tD2sdYm4YIsFIaCnwe24
	CDOZ60dYb33t+S53ac6fNKQ=
X-Google-Smtp-Source: ACHHUZ5DbztnfIc7NFufk8XwP3nLXNU5KRP/S//g+7bbSRmQvPvKaCzCwkR1IA7NmuIeIlqhNtOGqg==
X-Received: by 2002:a5d:4111:0:b0:30f:babb:4e02 with SMTP id l17-20020a5d4111000000b0030fbabb4e02mr339596wrp.10.1686428484369;
        Sat, 10 Jun 2023 13:21:24 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m11-20020a5d6a0b000000b0030b5d203e7esm7878116wru.97.2023.06.10.13.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:21:24 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 3/3] riscv: dts: allwinner: d1: Add GPADC node
Date: Sat, 10 Jun 2023 23:19:50 +0300
Message-Id: <20230610202005.1118049-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610202005.1118049-1-bigunclemax@gmail.com>
References: <20230610202005.1118049-1-bigunclemax@gmail.com>
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

