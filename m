Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EE67FA
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 09:18:45 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so49791071fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 02:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689412723; x=1692004723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGXcNx91+FOFHQlW/JA8pAmtg5iwHFhAAWjc2IMaFzw=;
        b=A0p7JiCUuLra608+6ERjSXwqV/tZTvAa1cvPeOKST0ZUmCc2JK1pC5KLEaP5wPoSkU
         uEEGPIJ0XQO2RYAKJ9N847nEcajRUNg94Xk/uSdIQyC9jJQSUzfq1Lu2wXItkcxmQRtC
         BnEctr0DsMWTKOoR7cctgg2fIGYSLwNzynkPYnuftACXr+Kx9VjpteGvPkwPi24Ma04T
         gpxd84zh1lDMJ5OBFFt/qG9JBK8AOf8WuaIm+Pffd1RAdc/pBuODnlSpriWI5mgkdo5P
         +XRa17SpvD1Ospa3DQ/iMIT5X45lYk3ldvFrtAsTNt2judzzsjfmHXLW2je88uabRR8e
         U0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689412723; x=1692004723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGXcNx91+FOFHQlW/JA8pAmtg5iwHFhAAWjc2IMaFzw=;
        b=PEGyLhEf4VEuBg0ybTOtuBSFcqIvGwMPfcIxMNdORyCqvtiq+RjzQ4UlcbK2L6IUY3
         O8ZugrouKOjlBvPcu90nzZKgnSFH8HxmnEiJ6q8LD3sPvG35aJJ2eN6cs6sJZTDyPYHL
         f1sF8qtb9hubTr2DYDYqfI+G5t28agHKzz/RP89tByzNt8ylXHUed4WSwc8mVCRRPdp1
         yq7hekzsj8AHGjlleFPBe8FnvEOwIr+mkY/Xy8KT3feKrvNsHsjb32GoMZ7CFjR1b4nB
         EfsMKGuWvrVgZtfrhaoN9ZKMsEeyhyUjoxRZcLVm/VhBA6U5okFpx7EUxSzULude8cHo
         Ponw==
X-Gm-Message-State: ABy/qLYjVz9yYbSY8AbaczNFs2IAi4gRuWLOmg5xFYDzJHgHOUeozwhI
	Y8nowA1l9YjPBGmieq4mmN4=
X-Google-Smtp-Source: APBJJlHRiGNgyATPByBHmenaTUz4eKt9rBXQerMn4f8H6CVfT4bseu8g9+BtZhxSiCB7X2oIlbbmQQ==
X-Received: by 2002:a2e:3318:0:b0:2b6:cbdb:790c with SMTP id d24-20020a2e3318000000b002b6cbdb790cmr1864605ljc.1.1689412723220;
        Sat, 15 Jul 2023 02:18:43 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a2e9891000000b002b840f283a7sm561784ljj.36.2023.07.15.02.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 02:18:42 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 4/4] riscv: dts: allwinner: d1: Add GPADC node
Date: Sat, 15 Jul 2023 12:18:16 +0300
Message-Id: <20230715091816.3074375-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715091816.3074375-1-bigunclemax@gmail.com>
References: <20230715091816.3074375-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add declaration of the general purpose ADC for D1 and T113s SoCs.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 1bb1e5cae602..d59b4acf183a 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -144,6 +144,16 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x400>;
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

