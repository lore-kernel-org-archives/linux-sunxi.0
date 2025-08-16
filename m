Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F4513AD26
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 08:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755334057; cv=none; b=HE5FQn0GVfecIsJSEPZDD9lmWqyzVRQ7DUrAsV29e5nurgWD/4V6ZznoZTpdgYooLntl+26Ep+APyG/9S/dS7rhIphRFr4n1jeQbBzGxMNKzeOWzX9zipQjeCI524S7MggJl7SGWyYUcFCXoPtbNOHFjSpYbQ/bXRhG5eOETEIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755334057; c=relaxed/simple;
	bh=0sQpcReULpsgaFKEamkaFHveJQyplmueGHJEFMlfkEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svLb0dRzfloDtHifzw92WI+lMg4MIhUsB/4Z6egLURLElyYmZfp9zJ1qVMvgsAmTep1oTrpwWomA/llIALdcrErAP3oz/vVMxJYcim7ruwpc9IG94PZ+/zbgfdR51mEnWsPZGOeMakAlNxhSc2SBmn8ThoC/nLV114/gDdP6JqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDD9tUTN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDD9tUTN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2445811e19dso21411745ad.1
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334054; x=1755938854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LjpIZbO9mvGi9jWfEQ5hnMKUvryAGp+KhC+W5IHOPY=;
        b=ZDD9tUTNcBABqQC7w9r06BLKiL5o8GctTKJjKHBT7RfXlmL95OWr/dGfUtUE3YPaZ7
         AaBDXbcxWY+pRi1leD0xHWvVHcKmsLtYWUKhjv+Oi5Ashstw6BFKa4uSGpBVlL8WqOxk
         G05xZ+pzhiJpwAqsOeJkrpJRUGRf4sogRLLWDSey3eSX7OX0jZwGqZavaQxgzPHTWhQY
         vrWdt5ARB8CqP6mty7JdREeA3xqBTj84fg6i2Ak2hiLJBlgaPkeoeR5hwPH/nNwiIJkA
         enf+WjBiiFAi1vlU/FioISrTxm9EEWNY7NiJP8XjJYG2MdPxBwXbM0iNCplRGvZ7jM6i
         pRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334054; x=1755938854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LjpIZbO9mvGi9jWfEQ5hnMKUvryAGp+KhC+W5IHOPY=;
        b=sWHB+RJRaee//RKf/yQ/94oYjS4zWCH4/ACuJ9yiYNGG8eVDCBRiup0zSh0L3thtgv
         u0esQyYOopYyzh/j8A//3KHIHyI9sP1IxNvKOqo3vReRGd1/+2lC668wBMlFd14sAJoZ
         Kmxl4vvJVqIj4jCsrDnyhoh9+bYn9K+PHgOOZPKgMxRTKBYarOYdCqSPRUKETjPhMKUn
         NePIyVIoIEDGRPnEajJ0p9zRDxpwViYbPtHjGu2IrUThYhkSrH1o/APYAIXVti7fVVgv
         HK9gIelHOQUErO4GOAo44jV17X090FgYyoU8hDxBp4BMUuq9kzywJL+PZ5nUP7ALlCII
         jm+w==
X-Forwarded-Encrypted: i=1; AJvYcCV2YQ7DK8ijDDCsd0zLmp+oWtGHk2tDXLZkLdtQEiylOhrXY6F/1QKuXFH4Ch1PQlLEKmKJ5zQeSR0Nkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvtL0JHqkZ4GSSfYuEsdQiHT9tIyuS9TkV2Nhx00SzcvNg8tzY
	b0S4Ha7hFCZ2EhaNReK2c4p9G84vVYtZdRhrdlswbQ9qzqHlg1FF+4nt
X-Gm-Gg: ASbGncveYLXeW55xCRluep/wNxkYBylP34IiWPneWtvPQvBCdDuT+5C4S7g17f6AyVC
	GCDLClEM3cSrZwI+7Rl/OsWi2HLOPgw11oxKkpC/zE+F8Rx6Zco2HcAZWtabTj1Zid+Pq2z+VVc
	xmkYsy5Aw0FxSfbdRTrhJvmKKByBuOCZpFlkkKhYhW6+Ifkf3vTEz3whf7ZEAbYXgZLK71Pi7gl
	j3Lqq1evZNn7mJ0k+7oaBuPDP8/0N+i9Myrgtox0ypftB6Lv99CMkhLUBN6Jbl6lSMDc25HiZZm
	GX0kWEbM22UoIpf+4hEtbraONGU8/JD82hCuH7eOdNDAajc6Sc193Ml98Nigw4OtZnYm+vhpsqv
	upzzQTIW7c2uF5AJqgsHsYg==
X-Google-Smtp-Source: AGHT+IFMTkLskiB1Qs3dIHhYx1vm6JoFKQBNN3j/TxriFzjixkZX7mXsyi+PI7KUf9M6UIn/A8Ob4g==
X-Received: by 2002:a17:902:cccb:b0:240:84b:a11a with SMTP id d9443c01a7336-2446d6e5a89mr66059665ad.17.1755334054476;
        Sat, 16 Aug 2025 01:47:34 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:47:34 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/7] clk: sunxi-ng: a523: add missing usb related clocks
Date: Sat, 16 Aug 2025 16:46:54 +0800
Message-ID: <20250816084700.569524-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Several clocks were omitted when adding the original driver. These clocks
are necessary for USB 3.0 to work correctly. I added these declarations
according to the driver's BSP code.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c      | 32 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h      |  2 +-
 include/dt-bindings/clock/sun55i-a523-ccu.h |  4 +++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 1a9a1cb86..7bf41e628 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -853,6 +853,31 @@ static struct ccu_mux usb_ohci1_clk = {
 	},
 };
 
+static SUNXI_CCU_GATE_DATA(usb2_clk, "usb2", osc24M, 0xa80, BIT(31), 0);
+
+static const struct clk_parent_data usb3_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_200M_clk.hw },
+	{ .hw = &pll_periph1_200M_clk.hw },
+};
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(usb3_clk, "usb3", usb3_parents, 0xa84,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static const struct clk_parent_data usb3_suspend_parents[] = {
+	{ .fw_name = "losc" },
+};
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(usb3_suspend_clk, "usb3-suspend",
+				      usb3_suspend_parents, 0xa88,
+				      0, 5,	/* M */
+				      24, 1,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
 static SUNXI_CCU_GATE_HWS(bus_ohci0_clk, "bus-ohci0", ahb_hws, 0xa8c,
 			  BIT(0), 0);
 static SUNXI_CCU_GATE_HWS(bus_ohci1_clk, "bus-ohci1", ahb_hws, 0xa8c,
@@ -1290,6 +1315,9 @@ static struct ccu_common *sun55i_a523_ccu_clks[] = {
 	&bus_ths_clk.common,
 	&usb_ohci0_clk.common,
 	&usb_ohci1_clk.common,
+	&usb2_clk.common,
+	&usb3_clk.common,
+	&usb3_suspend_clk.common,
 	&bus_ohci0_clk.common,
 	&bus_ohci1_clk.common,
 	&bus_ehci0_clk.common,
@@ -1422,6 +1450,7 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_MBUS_DMA]		= &mbus_dma_clk.common.hw,
 		[CLK_MBUS_VE]		= &mbus_ve_clk.common.hw,
 		[CLK_MBUS_CE]		= &mbus_ce_clk.common.hw,
+		[CLK_MBUS_USB3]		= &mbus_usb3_clk.common.hw,
 		[CLK_MBUS_CSI]		= &mbus_csi_clk.common.hw,
 		[CLK_MBUS_ISP]		= &mbus_isp_clk.common.hw,
 		[CLK_MBUS_EMAC1]	= &mbus_gmac1_clk.common.hw,
@@ -1474,6 +1503,9 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_BUS_THS]		= &bus_ths_clk.common.hw,
 		[CLK_USB_OHCI0]		= &usb_ohci0_clk.common.hw,
 		[CLK_USB_OHCI1]		= &usb_ohci1_clk.common.hw,
+		[CLK_USB2]		= &usb2_clk.common.hw,
+		[CLK_USB3]		= &usb3_clk.common.hw,
+		[CLK_USB3_SUSPEND]	= &usb3_suspend_clk.common.hw,
 		[CLK_BUS_OHCI0]		= &bus_ohci0_clk.common.hw,
 		[CLK_BUS_OHCI1]		= &bus_ohci1_clk.common.hw,
 		[CLK_BUS_EHCI0]		= &bus_ehci0_clk.common.hw,
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h b/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
index fc8dd42f1..d6916c728 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
@@ -9,6 +9,6 @@
 #include <dt-bindings/clock/sun55i-a523-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
 
-#define CLK_NUMBER	(CLK_FANOUT2 + 1)
+#define CLK_NUMBER	(CLK_MBUS_USB3 + 1)
 
 #endif /* _CCU_SUN55I_A523_H */
diff --git a/include/dt-bindings/clock/sun55i-a523-ccu.h b/include/dt-bindings/clock/sun55i-a523-ccu.h
index c8259ac5a..26b2e9dc8 100644
--- a/include/dt-bindings/clock/sun55i-a523-ccu.h
+++ b/include/dt-bindings/clock/sun55i-a523-ccu.h
@@ -185,5 +185,9 @@
 #define CLK_FANOUT0		176
 #define CLK_FANOUT1		177
 #define CLK_FANOUT2		178
+#define CLK_USB2		179
+#define CLK_USB3		180
+#define CLK_USB3_SUSPEND	181
+#define CLK_MBUS_USB3		182
 
 #endif /* _DT_BINDINGS_CLK_SUN55I_A523_CCU_H_ */
-- 
2.50.1

