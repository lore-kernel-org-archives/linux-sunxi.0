Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413045A2B8
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 23:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763381; cv=none; b=N7eGxGPv/5vbf3cjrlthF4ubhYQ6OT7Piex3mlJgF95Zv8sJlB9JdA9c4SCu99Yarl+bbCnLkO00jBZGxVAZzJ97Hkbn4YmMDNbaecIuCKOUCgajXBnv82KWv3Ah/W5perRiPOUeZ/Ia6Ocxx9ru700pVEVSstMkqPIpDZ6zwTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763381; c=relaxed/simple;
	bh=PI8HEf9PMSu33Ykojy4ZXazIa0qphrPfPQHGrFL4I04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IWSjzjYX2E5HseySTj2n75T7PMp/+VbOQy3lHqqiL6WC/Vqco8cY+OM/JYhIE06JZi9i52zNivpGJ3c696Jx0T/q6Krd2VgNYZeSs3dg2hZv1p5h2P0IYEdfIGaJQyQHUGkRqPoU8BO6/L9yEgVzdfp4Y7A2W+6w+spfqBM22gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0/MRtuu; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0/MRtuu"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81e8fa1b8d6so670087b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763378; x=1785368178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqOrT9xci3vC0yRAEjJsB/AtSU5bQ1X+i+tu63Bn8bU=;
        b=H0/MRtuuJU26hZv8Mw5KuQQwkhXhpqbyOvgAjwm9VBLc2ASCA3qm6qUfotZOug8NGN
         TD5RhkpP54FL52lDZtdDxcyS6MrKAD8HVre4riJDzNdw22fpYuBtNxw5FtzEB3fyMh3V
         dPIE65PAbV4eB/Tiybr4HerwvX3+aOVU+N0a97ND7wHmt1rrxdsc0A4tzUf58gSyI5MP
         BmPdalhO1ajoYuD7BlDlwv5vkui+xugwbTpNDPY92G/hkeSJ+7iB/+Fi7Suh/IJNsOPH
         QDZjx4uahMIDQuDegsaXlyucbbnN2+/lRKBY5z+4ZMRpyf5cpGHRlfcHLqfyXaGtMOHn
         SBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763378; x=1785368178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqOrT9xci3vC0yRAEjJsB/AtSU5bQ1X+i+tu63Bn8bU=;
        b=FYuJx8clp0kGoH2h/YkeJTYB1GAJm5lq/r7Wb7gGRE5PjIgbj97zfL2D4w9AnZBiCt
         jFairphMTG0WQ75afqs/1kfQG34xGGBpPvuqwp7+ljU5pITqT6aIGYO9csNOcwzaaoVa
         crl1wCnCBZHbRq1GZqb/RSz6Mw0VoGJ5I2xQDvKDUCqf5RWSu/r09vcjlzmkW8yFPTru
         KOJtkG/Dh04pN4wrjW/jUUm1X4yHJ9LXfdBpzL3jwxWYNwZKNlalYkCQ/0toVS8c/ZVe
         pts5Tw/1iJvLPI1PdEfCS0ikP/FUj/CrZLYri2xk4GuBEUmqkWMbRhDRxWKkobyoszlX
         pIfA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/PeT2FQqQzz8jpvrvJ4aSGPoahjCzAT+Kmpx6PUe82I5ramDOlBinW3jq2APFaQkMhHRMbB4N19U/Sw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBCHQURTDfMgivT6E2sFv6yuVEtlsfpldYIrZbpKXZ0QqRq2mX
	PsrfcAV/1bwAYIKC1vwRoPLe1DVpRGLGKxiJMiPT6P+KUnXI+l48ekul
X-Gm-Gg: AR+sD12PPcSKB3ea+1Kf/dKAw2hteEEtOOnPauf/cAYA2Otq6xxLtLUi8CtcBaum0TN
	yNCd2rlVI+uvkeQtSssrP+ubPc8t3+Brg1GQ+0uF1uUBTRXzo9/VT+NqSMsNsMjKPv/v8jrxASg
	sP+lmszwfEE2VEjQIsKmX8v+IRcbvudgAbkOA9CoiHQyp4OvNFRL+Li3MtXY5S6GNNbW+XK7Y/N
	ZfwtzyaQ7C81uwB6jCnxF0Cjh1+TvJw2C7WXwWywSjHdU79Q3pDin3ENHqwU7f3sSsenLyJvZQU
	h5R5BdDr4X5TAjyxUd0yfoKweUHXk1a+Yvn/I5vdyynXdlQi1MxAVv/xovSQMahR2n23mbpFrXt
	X2wybxyklS7UgVhjp6wUGzCmIkEI8/dSFElMKgVxnxX51L9Ktilxa/38+d7mvbRhSElClhC4DGP
	k/cvzMcoefQdZ5FQz4mO36bZ6I1Sv7g53hQ+Di
X-Received: by 2002:a05:690c:296:b0:80d:66b2:850 with SMTP id 00721157ae682-81f4c2b5753mr2162297b3.42.1784763377901;
        Wed, 22 Jul 2026 16:36:17 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:17 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Wed, 22 Jul 2026 19:36:02 -0400
Message-ID: <20260722233604.3001063-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 has two CIR receivers, both compatible with the A31 CIR: one
in the CPUX domain, clocked from the main CCU, and one in the RTC
power domain, clocked from the R-CCU.

Add nodes for both instances, disabled by default. Since the RX signal
of each instance can be routed to more than one pin, boards with an IR
receiver are expected to add the pinctrl properties next to where they
enable the node. Keep the PL11 pin description in the dtsi, as boards
commonly use that pin for the RTC domain instance.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..c2de662140ce 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -327,6 +327,17 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ir: ir@2005000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x02005000 0x400>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&ccu RST_BUS_IR_RX>;
+			status = "disabled";
+		};
+
 		ledc: led-controller@2008000 {
 			compatible = "allwinner,sun55i-a523-ledc",
 				     "allwinner,sun50i-a100-ledc";
@@ -927,6 +938,23 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir_rx";
+			};
+		};
+
+		r_ir: ir@7040000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&r_ccu RST_BUS_R_IR_RX>;
+			status = "disabled";
 		};
 
 		pck600: power-controller@7060000 {
-- 
2.54.0

