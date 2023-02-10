Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37067627
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Feb 2023 02:52:07 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id i12so2770460qvs.2
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Feb 2023 18:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhHn8HdQtaFVje+I7340IAagG5gS9q+9Z0i8859PC08=;
        b=kSE1p7OwGAQrDyivLyCUXcZTO94lHrO7HcIc7seD839shcA+BO0C+qMQb/wDSG4gL1
         imGsiPiEwBaF/AZhHgpfcdJj7D26D/UoaUznke9sPgRyWY5zAfMT1QTLVfCd/zs1wunZ
         /HvD5Ni2fgsEwhN/YXZ2EOK/olvhoukEjivaRB9cetRAYtaQwdvI6id2T+h1uUO7qq1J
         qtDHC+HhrYKwy1trR4dNfv9vS6DK6iJiCQqW5abCawpm+VLbuHbXyTvEzfBcsQGqvYV6
         ynwyCiAOw2f7w0NN3kJq6xA2Mgx4Agq+uFqxpRx0ilbN7Bm8hkFkkeVrWLhUgcF7xf7P
         lRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhHn8HdQtaFVje+I7340IAagG5gS9q+9Z0i8859PC08=;
        b=AdmjaGexOBLivtjC68OetP/Hwgx1ZlZx8+0qd1GvoUR3IGKVLLYUG0/5kOLiVZHWcW
         jAXQolSp1AnUk51ihJ5Kv3jQdqV7hvUNYkN+DBP4tdXJFqaU2dBP4N01ru84m0GKWZ5M
         fksQsxL7Bk7+8ifT9vc4uPqll5Sg8D8ehSi3ahzL5H7aOqbVl2C5pK+nR839WpAtHq3F
         ix26jwhd/cmeG4Cyy7abRPbY0I7L1sHUdnSKmCPv/zw5PWpMn13eecbnJlrTZ8ssTgmC
         A43ykyUr5n0T0qk6wVC4ozs1/nKWqq+TOagd7phubFzpXjkO1BJVowXAaXWGv9HMAafw
         rftQ==
X-Gm-Message-State: AO0yUKX88U0iY53vvmO3VbEd3wY3chO6nrtK4c+wvpWa0C9qbcRzlYDy
	4+GmxlkC2PXasZ4HwDA2nnI=
X-Google-Smtp-Source: AK7set8H2Uccj6+15PL3pXBV5ECz1v78tmQUK+hG5oznPYkiVlRXTHZdP5lFwL6Qj6RAkHt0TqRljQ==
X-Received: by 2002:a05:6214:5656:b0:56b:ee0d:e3b6 with SMTP id mh22-20020a056214565600b0056bee0de3b6mr9712657qvb.1.1675997526082;
        Thu, 09 Feb 2023 18:52:06 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id v129-20020a372f87000000b0070495934152sm2667265qkh.48.2023.02.09.18.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 18:52:05 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 2/2] riscv: dts: nezha-d1: add gpio-line-names
Date: Thu,  9 Feb 2023 21:51:32 -0500
Message-Id: <20230210025132.36605-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230208165743.GA8848@localhost>
References: <20230210025132.36605-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add descriptive names so users can associate specific lines with their
respective pins on the 40-pin header according to the schematics.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
Link: http://dl.linux-sunxi.org/D1/D1_Nezha_development_board_schematic_diagram_20210224.pdf
---
changes since v2:
- (no changes, skip to a v3 to align with the other patch in this group)

changes since v1:
- this patch needs to be placed in order, and come second, after a patch to
  update the schema for the nxp,pcf8575, put this patch in a group where it
  wasn't previously
- use a Link: to point to the schematic
- add a comment section describing the rational behind the naming that was
  used
- make the spacing of each line name uniform, don't try to "line them up"
  vertically
---
 .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
index a0769185be97..4ed33c1e7c9c 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
@@ -1,6 +1,25 @@
 // SPDX-License-Identifier: (GPL-2.0+ or MIT)
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
+/*
+ * gpio line names
+ *
+ * The Nezha-D1 has a 40-pin IO header. Some of these pins are routed
+ * directly to pads on the SoC, others come from an 8-bit pcf857x IO
+ * expander. Therefore, these line names are specified in two places:
+ * one set for the pcf857x, and one set for the pio controller.
+ *
+ * Lines which are routed to the 40-pin header are named as follows:
+ *	<pin#> [<pin name>]
+ * where:
+ *	<pin#>		is the actual pin number of the 40-pin header
+ *	<pin name>	is the name of the pin by function/gpio#
+ *
+ * For details regarding pin numbers and names see the schematics (under
+ * "IO EXPAND"):
+ * http://dl.linux-sunxi.org/D1/D1_Nezha_development_board_schematic_diagram_20210224.pdf
+ */
+
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 
@@ -90,6 +109,15 @@ pcf8574a: gpio@38 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		#interrupt-cells = <2>;
+		gpio-line-names =
+			"pin13 [gpio8]",
+			"pin16 [gpio10]",
+			"pin18 [gpio11]",
+			"pin26 [gpio17]",
+			"pin22 [gpio14]",
+			"pin28 [gpio19]",
+			"pin37 [gpio23]",
+			"pin11 [gpio6]";
 	};
 };
 
@@ -164,3 +192,47 @@ &usbphy {
 	usb1_vbus-supply = <&reg_vcc>;
 	status = "okay";
 };
+
+&pio {
+	gpio-line-names =
+		/* Port A */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* Port B */
+		"pin5 [gpio2/twi2-sck]",
+		"pin3 [gpio1/twi2-sda]",
+		"",
+		"pin38 [gpio24/i2s2-din]",
+		"pin40 [gpio25/i2s2-dout]",
+		"pin12 [gpio7/i2s-clk]",
+		"pin35 [gpio22/i2s2-lrck]",
+		"",
+		"pin8 [gpio4/uart0-txd]",
+		"pin10 [gpio5/uart0-rxd]",
+		"",
+		"",
+		"pin15 [gpio9]",
+		"", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* Port C */
+		"",
+		"pin31 [gpio21]",
+		"", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* Port D */
+		"", "", "", "", "", "", "", "",
+		"", "",
+		"pin24 [gpio16/spi1-ce0]",
+		"pin23 [gpio15/spi1-clk]",
+		"pin19 [gpio12/spi1-mosi]",
+		"pin21 [gpio13/spi1-miso]",
+		"pin27 [gpio18/spi1-hold]",
+		"pin29 [gpio20/spi1-wp]",
+		"", "", "", "", "", "",
+		"pin7 [gpio3/pwm]";
+};
-- 
2.36.0.rc2.17.g4027e30c53

