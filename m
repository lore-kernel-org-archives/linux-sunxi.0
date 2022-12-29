Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F151105
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Dec 2022 04:22:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 2EBC25C02C8;
	Wed, 28 Dec 2022 23:22:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 28 Dec 2022 23:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672287753; x=1672374153; bh=UHHIyJfdp+M76yk2yMa2U2mWK
	RDFfFpLFlFWfeZpPHQ=; b=EW3hJKlIfV7kB0V9nmfQU2woQyesKsL3KBb/Yc34b
	r4F+cpMPbNO82O3STXvGiBsv8MHeWi9t5nf1S7NB84WJkZ48V08JwtlBb6QgLR1E
	nGM09ROQojLe4RUfMpfzCZ3P3/kB1fmTd+pttOggLzy/aQQb1w58/I/YY8M5OLoc
	IUxPG6O7ApISZoHHdCmHSIweEF0Gj4jMYasIlglboWHS3XcBMXibO2FxX36NlKyQ
	C+1QNwcYlS8YaDGp7uWZ/WdZ9NFAw+xfMHE6b9XIRRDC+j2AqMp6+av2xDbrVbFK
	ThMcchrIJ1wghwIvQfbFlNrN+NbAfdeC3utdrxyjHIVhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672287753; x=1672374153; bh=UHHIyJfdp+M76yk2yMa2U2mWKRDFfFpLFlF
	WfeZpPHQ=; b=Z0XE9nGdGFLPXiu1kL9g9KoQ1lOiP5urppR7zVPOJHTVnda61lr
	j5hGfsZsId8NNMc+/jvJZUaDEYA8xeG0JSKRSqrAIBdqc2RbHbIO8LbfwUfM/z+Q
	IsPqLxXpd1ElQJTwyDJBqL0yCu2zz0JtqQGgK7rXOHEcJbTSamraJnx+QGnQNGsp
	rav0D/T3Rjc4SihCZt4BKg9gT1bJOfGmZrh9BA+CXj7AJSHqlY3aLPyzT04+Pxxg
	hWjZiwZ5WhvTGCPa9DbJLsVosXe/wuEYK/CI9EQe7xrpIb+v+BbkBFnpIiGdNzda
	3UPxOACxz1L68SLofrKzUoTphiY4rLZzgFw==
X-ME-Sender: <xms:CBatY5Ld5IlOgNerONti26FXJxZa5qYdOh5LB1CwvZiGXhESZZsNVA>
    <xme:CBatY1KfEXyhyywoSLiMKpourtBCXldF5iPbN5KmoclamHuIzzV_hwfmQX5o4YiFt
    0Ez2cXqV5TbfBiaFw>
X-ME-Received: <xmr:CBatYxvanJsQntro3LaUqeSHq0Q-aRUzDmsdS7sI2VQts4CXWV-9JWFTgH4rvcAtBIWFtMWBCjLOJ02XkDUWr4n8s8b0TX80QsI9FBJTLO-n4S-d3uT6wRFg4g71rnPIHHZFFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieefgdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeehhffh
    keekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:CBatY6aLhO2PESMuEMzqRQ_HzCHz2lABofvoLnnoLUIt5w-dVLHorg>
    <xmx:CBatYwZeMiQRfeoQ-Y1Exrht-tadVOuCUcOdpXg5uwXDhCxB7ET72g>
    <xmx:CBatY-AIWgwZiyCs3uoD_A2JrNzIbCUBM19iFxWOmRczjFhoQOKZ1A>
    <xmx:CRatYw6iSYeGeKBWleAkH-TxgsU1BHR2sTtky6yHDBzMUHMA0VftUw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 23:22:31 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] clk: sunxi-ng: h3/h5: Model H3 CLK_DRAM as a fixed clock
Date: Wed, 28 Dec 2022 22:22:30 -0600
Message-Id: <20221229042230.24532-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DRAM controller clock is only allowed to change frequency while the
DRAM chips are in self-refresh. To support this, changes to the CLK_DRAM
mux and divider have no effect until acknowledged by the memory dynamic
frequency scaling (MDFS) hardware inside the DRAM controller. (There is
a SDRCLK_UPD bit in DRAM_CFG_REG which should serve a similar purpose,
but this bit actually does nothing.)

However, the MDFS hardware in H3 appears to be broken. Triggering a
frequency change using the procedure from similar SoCs (A64/H5) hangs
the hardware. Additionally, the vendor BSP specifically avoids using the
MDFS hardware on H3, instead performing all DRAM PHY parameter updates
and resets in software.

Thus, it is effectively impossible to change the CLK_DRAM mux/divider,
so those features should not be modeled. Add CLK_SET_RATE_PARENT so
frequency changes apply to PLL_DDR instead.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index d3fcb983c17c..bfebe8dbbe65 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -434,8 +434,13 @@ static SUNXI_CCU_GATE(usb_ohci2_clk,	"usb-ohci2",	"osc24M",
 static SUNXI_CCU_GATE(usb_ohci3_clk,	"usb-ohci3",	"osc24M",
 		      0x0cc, BIT(19), 0);
 
-static const char * const dram_parents[] = { "pll-ddr", "pll-periph0-2x" };
-static SUNXI_CCU_M_WITH_MUX(dram_clk, "dram", dram_parents,
+/* H3 has broken MDFS hardware, so the mux/divider cannot be changed. */
+static CLK_FIXED_FACTOR_HW(h3_dram_clk, "dram",
+			   &pll_ddr_clk.common.hw,
+			   1, 1, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+
+static const char * const h5_dram_parents[] = { "pll-ddr", "pll-periph0-2x" };
+static SUNXI_CCU_M_WITH_MUX(h5_dram_clk, "dram", h5_dram_parents,
 			    0x0f4, 0, 4, 20, 2, CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE(dram_ve_clk,	"dram-ve",	"dram",
@@ -592,7 +597,7 @@ static struct ccu_common *sun8i_h3_ccu_clks[] = {
 	&usb_ohci1_clk.common,
 	&usb_ohci2_clk.common,
 	&usb_ohci3_clk.common,
-	&dram_clk.common,
+	&h5_dram_clk.common,
 	&dram_ve_clk.common,
 	&dram_csi_clk.common,
 	&dram_deinterlace_clk.common,
@@ -732,7 +737,7 @@ static struct clk_hw_onecell_data sun8i_h3_hw_clks = {
 		[CLK_USB_OHCI1]		= &usb_ohci1_clk.common.hw,
 		[CLK_USB_OHCI2]		= &usb_ohci2_clk.common.hw,
 		[CLK_USB_OHCI3]		= &usb_ohci3_clk.common.hw,
-		[CLK_DRAM]		= &dram_clk.common.hw,
+		[CLK_DRAM]		= &h3_dram_clk.hw,
 		[CLK_DRAM_VE]		= &dram_ve_clk.common.hw,
 		[CLK_DRAM_CSI]		= &dram_csi_clk.common.hw,
 		[CLK_DRAM_DEINTERLACE]	= &dram_deinterlace_clk.common.hw,
@@ -848,7 +853,7 @@ static struct clk_hw_onecell_data sun50i_h5_hw_clks = {
 		[CLK_USB_OHCI1]		= &usb_ohci1_clk.common.hw,
 		[CLK_USB_OHCI2]		= &usb_ohci2_clk.common.hw,
 		[CLK_USB_OHCI3]		= &usb_ohci3_clk.common.hw,
-		[CLK_DRAM]		= &dram_clk.common.hw,
+		[CLK_DRAM]		= &h5_dram_clk.common.hw,
 		[CLK_DRAM_VE]		= &dram_ve_clk.common.hw,
 		[CLK_DRAM_CSI]		= &dram_csi_clk.common.hw,
 		[CLK_DRAM_DEINTERLACE]	= &dram_deinterlace_clk.common.hw,
-- 
2.37.4

