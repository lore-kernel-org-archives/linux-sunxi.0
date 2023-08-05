Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5B21FA0
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 18:05:58 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3178dd771ceso2753624f8f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Aug 2023 11:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258757; x=1691863557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjaA2yNdWRxoAIXKsMRIdPQiU+5JdGf4g+hfiGSEvXE=;
        b=qYKcS/LRkaOGXq4NdDRZzuiufmfi/JdXCUCdjxwvNlMaybZDSX+xGMyEpQTIV9OZnZ
         Gp4GB7jEPbcH9CWDW84PAFwbO0TClcrL1aQj9C8N3+bq0nxcYCPolbMCJ0eeZvdBV9ay
         ZAxs/9qDf+W5rvv6Y9l+xHmmsRaC5BJEAfFMJSpt0sHRKes7er/87raNN1FouMnr0lNA
         iYYMr5A7x6LN4+vL4w4rTM6AwN9sc0kyUnxH5uI4v5kMrNw/MNjSdGEhaL4kvXojMj65
         CznA+lUQm1lfKGBNQPnmKeQYtKKcVEGKXUzGXIRDiviT6mXGGyTe0umYKJHf2Up2LKYA
         oYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258757; x=1691863557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjaA2yNdWRxoAIXKsMRIdPQiU+5JdGf4g+hfiGSEvXE=;
        b=iKCJoTX6WDPH+7iVdWY/uvvngdhvgHrxqqp8zDAWLGeOY9t/9p+8lVUe9Uz+xIgKvQ
         uiXuiBYrWtN7uSQYz53/yMoVMiPQi/m96pceGQWGqlo2ZS5YU9hecleYjxIwxkVDUaRM
         x2gdDGWczPttny7zZd0bLiGnyzFi2mqL7L9j80h+ElceCnxrsWLT/mltuUR4axsJAO37
         80tSmA5eib7dYox0wjvUOsf0PoUc/njEyftIOTc3Drjh/SdOHBXCeMy/nn8uNK0tmQ6b
         dbXzFWURo7YbBjQMkYVi53Hhw6jIBy4PjvHQuo0DhTahINKydXF54j9YM7fDhe1G3Fhw
         GVPg==
X-Gm-Message-State: AOJu0YyO6B1PAVatKcmn/6JDyGeVqf/mMb9enY46TPAiQgfQbRc4ALFi
	oLQjf7UrFayR9uKWYapUJR8=
X-Google-Smtp-Source: AGHT+IHH4WVwBu7aihjp9nuzFtSfjcWnZEsanbwbY8snGr0wZKCSwwwsVErXaYwxTLHpE9k4p+t7Qg==
X-Received: by 2002:a5d:4447:0:b0:317:3d36:b2cd with SMTP id x7-20020a5d4447000000b003173d36b2cdmr3214277wrr.71.1691258756721;
        Sat, 05 Aug 2023 11:05:56 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:56 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 5/5] riscv: dts: allwinner: d1: Add device nodes for internal audio codec
Date: Sat,  5 Aug 2023 21:05:05 +0300
Message-Id: <20230805180506.718364-6-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT nodes for the internal D1/T113s audio codec and its analog part.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 1c48bfff1715..6ceb141c3f93 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -180,6 +180,28 @@ ths: thermal-sensor@2009400 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		codec: codec@2030000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun20i-d1-codec";
+			reg = <0x02030000 0x300>;
+			interrupts = <SOC_PERIPHERAL_IRQ(25) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_AUDIO>,
+				 <&ccu CLK_AUDIO_ADC>,
+				 <&ccu CLK_AUDIO_DAC>;
+			clock-names = "apb", "adc", "dac";
+			resets = <&ccu RST_BUS_AUDIO>;
+			dmas = <&dma 7>, <&dma 7>;
+			dma-names = "rx", "tx";
+			allwinner,codec-analog-controls = <&codec_analog>;
+			status = "disabled";
+		};
+
+		codec_analog: codec-analog@2030300 {
+			compatible = "allwinner,sun20i-d1-codec-analog";
+			reg = <0x02030300 0xd00>;
+			status = "disabled";
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
-- 
2.39.2

