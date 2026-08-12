Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FF538552C
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 20:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565712; cv=none; b=msIEcg9fOfSzJzP0l7r8gCTplQhhI+lsjfe+0bqj7+cMIc6vvB0lj1KmWM2bozxzVFzMh1VSjjc6U+41nj+fjy8EmP3Qk0cZmqM0U4U/o7w/e92hIiJVY6XUpiv2wCb+QJl/kAQJgwVHh184dRIQPT5FttBs/EoO+9gtmFrUzDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565712; c=relaxed/simple;
	bh=ECX11tFxOWG0FJjizgFuQNlSMkvWsuHAKzRE+ORui6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vk8bugDRI/gvsSvfcOCtRBldKpYW7QhwReFdad3cVIdPT4Rnko0152t0vODeDRjD8etQkWOkQ8VqBxG6iUA7nIf/qRp0yKx/yRaZYeyVB8LYvmEQ37iCP99Jkn+QI9KMBjj5v1aG9LiNnRe3oKxu+dQLNLXw+b3bY6QRWGSVTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OP44vbu4; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OP44vbu4"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb63dbd229so205618a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 13:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786565709; x=1787170509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yss421pOFQ9jL8McJw1jGVeZX3JUo3yrK+bhiRFPy4=;
        b=OP44vbu4IoOJWJAcIg52MnT8yA1DkgNzs94sEsPxhZSWzF0YnMVEClpu4cc7rFoY1t
         HQbpexbdfnDJNWLn2R0mk1GRdEd4bX5DVtyOATmG9B+WvHOxcu7/3N/Vq1Lnn3w17TQw
         A3zo6XBO1MgHS7PpNUYBf46lpHovGcR/AveyX+Av8arDj8nw/k0u7mmJ5MjxU7YoJP4m
         a3MYjp0VFi39kZFuX9h5ffcolNo78hipRG1EoNvv9v0ld8Qw8oq+Flg+KT5G8vkqiq0f
         nArUH7yr6las1rKGn9tByyxtMzDadPrSGS7UdqB+w8XXTzNXkfUDc6pNK0W0TEJk1BC6
         k+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786565710; x=1787170510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2yss421pOFQ9jL8McJw1jGVeZX3JUo3yrK+bhiRFPy4=;
        b=fpZlfBbLVgIhtohlG5YLFr0C6fe2DHjfOh8u01I6B7mOz6GTv1Yw8p/J+HR81UNxZP
         4GgmoPMsFbqGLhFhWfqC/jwiOY7msne1qBHXgIQgZg865B8tIj0fEHcQ1IfGoeLLYmO0
         c5kx6QCJteB6c5qmLO/yGCqSNHw3Aq2jzjwxae2b7Em6l+BMTQkFw5L0cKy4DwiJFFNJ
         0dcoVA0r1nRRUiXG5K2im6JTXzC5PhCEy0ShtgOXgWNg3TQkdtIod6IXk6Xg0sIHoX+B
         qaHgsQQw5NKB5TB2jpnNsIbSRK8QQ3EQMQeK0z+DlOYXhrHn4vQ0wuBorrxqN1dvc8+5
         BWBw==
X-Forwarded-Encrypted: i=1; AHgh+RqE7vSrjMDi1FtyHSlFqG0X7GQhySJvi2G/p4Ar/TKtUpiDXUGOMBw56FNZkQ0rYn9IoIMJ7z7fGfVs3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyek1GUSaXLi2xfN4k6bdaMe4gEoEkBkoIGNcki7Ompxb2n1asN
	mFZQXPl+DyZvoMHQDLdKCPWQrTIuFx7bShkceoBPFzRgwql81k0RGmOO
X-Gm-Gg: AR+sD10UpYDEGLqJmfDwIqP+OlWQOjbksl0EPn6IpUp2vw35AX+CxvsBUIuKD8niskE
	cypM8ybo2HUNs5UH8SavHMQwgQFPfwCznpHYj7leb9sBxVQiM2ZkcKyXbswGj9stFC9jhKh+rUC
	M3ZIjupn84M4mANeRdHRTYGQ/U7/jXBtBYvJSa5ZkO6C8EBCg18fPZFq9Mys6E371+3qIN4/5sP
	GoK27X8Uqdia3BY1LYnzVT3My8YZkQDNb39hvZiTXHX35zhak+DwXxRPjx5x8gaL7U4XV2ReBKb
	/xZaVqBeh/8yyEd2hd+yTim9falWd1qnhjejZAhHrb39bR5ANrgzrB2npXY2NfKd4wbnfCI7yGr
	B4oylqPialQnNPY48rCzoLyvRTGsU1bqPxWSzXq9Mmep2sbjGKAqOr19admJ4Txp4ZWlp4UXNLY
	wEUAZpneJIvLs2P5LSTAxIWV16SfOeCAow+jD48uzOAERaKSs/3iO1DZvmn+1Dh9OZjSDfE+8N2
	IC8qaeuMMv4Bb8ab6ZiXCi5aH+cyodgowSG8ywc
X-Received: by 2002:a05:6830:82f9:b0:7f3:9729:a9e3 with SMTP id 46e09a7af769-7f3cad7c2f8mr70427a34.7.1786565709452;
        Wed, 12 Aug 2026 13:15:09 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9cf3b0csm256006a34.21.2026.08.12.13.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:15:08 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH RFT 2/2] clk: sunxi-ng: a523: use single-divider clock helpers
Date: Wed, 12 Aug 2026 16:15:02 -0400
Message-ID: <20260812201502.264919-3-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan>
 <20260812201502.264919-1-enzo.adriano.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 MBUS, IOMMU, and DRAM clocks have an M divider but no P
divider, while HSTIMER0-5 and R-TIMER0-2 have a P divider but no M
divider. They currently use the two-divider ccu_mp class by declaring
the missing field with width zero.

ccu_mp_set_rate() unconditionally masks both divider fields, so a zero
width forms an invalid GENMASK() range and can clear unrelated register
bits. The M-only clocks also require the hardware update bit, which
ccu_mp operations do not handle.

Use the single-divider M helper for MBUS, IOMMU, and DRAM, and the
power-of-two P helper for the timer clocks. Preserve the parents,
registers, real divider fields, muxes, gates, clock flags, and
update-bit features.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260722010926.0A8B01F000E9@smtp.kernel.org
Link: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel.org
Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
Fixes: 74b0443a0d0a ("clk: sunxi-ng: a523: add system mod clocks")
Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Link: https://lore.kernel.org/r/CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com
Link: https://lore.kernel.org/r/20260723004856.55158e84@ryzen.lan
Assisted-by: Codex:gpt-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
not tested on A523/T527 hardware; testing on actual hardware is needed.

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 +++---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 136 +++++++++++------------
 2 files changed, 82 insertions(+), 91 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index db0e36d8838e74..349230e28c1c3a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -43,27 +43,24 @@ static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1",
 				 24, 3,	/* mux */
 				 0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
-				       r_ahb_apb_parents, 0x100,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
+				      r_ahb_apb_parents, 0x100,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
+				      r_ahb_apb_parents, 0x104,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
+				      r_ahb_apb_parents, 0x108,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
 				      0);
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
-				       r_ahb_apb_parents, 0x104,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
-				       0);
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
-				       r_ahb_apb_parents, 0x108,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
-				       0);
 
 static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.common.hw,
 			 0x11c, BIT(0), 0);
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 20dad06b37ca31..5c632e475aaa04 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -380,14 +380,14 @@ static const struct clk_parent_data mbus_parents[] = {
 	{ .hw = &pll_periph1_150M_clk.hw },
 	{ .fw_name = "hosc" },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
-					    0x540,
-					    0, 5,		/* M */
-					    0, 0,		/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
+					   0x540,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_IS_CRITICAL,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
 
@@ -513,58 +513,53 @@ static const struct clk_parent_data hstimer_parents[] = {
 	{ .fw_name = "losc" },
 	{ .hw = &pll_periph0_200M_clk.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
-				       hstimer_parents, 0x730,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
-				       hstimer_parents,
-				       0x734,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
+				      hstimer_parents, 0x730,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
-				       hstimer_parents,
-				       0x738,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
+				      hstimer_parents,
+				      0x734,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
-				       hstimer_parents,
-				       0x73c,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
+				      hstimer_parents,
+				      0x738,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
-				       hstimer_parents,
-				       0x740,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
+				      hstimer_parents,
+				      0x73c,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
-				       hstimer_parents,
-				       0x744,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
+				      hstimer_parents,
+				      0x740,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
+				      hstimer_parents,
+				      0x744,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
 static SUNXI_CCU_GATE_HWS(bus_hstimer_clk, "bus-hstimer", ahb_hws, 0x74c,
 			  BIT(0), 0);
@@ -584,14 +579,13 @@ static const struct clk_parent_data iommu_parents[] = {
 	{ .fw_name = "hosc" },
 };
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
-					    0x7b0,
-					    0, 5,	/* M */
-					    0, 0,	/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_SET_RATE_PARENT,
-					    CCU_FEATURE_UPDATE_BIT);
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
+					   0x7b0,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_SET_RATE_PARENT,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static SUNXI_CCU_GATE_HWS(bus_iommu_clk, "bus-iommu", apb0_hws, 0x7bc,
 			  BIT(0), 0);
@@ -603,14 +597,14 @@ static const struct clk_parent_data dram_parents[] = {
 	{ .hw = &pll_periph0_400M_clk.hw },
 	{ .hw = &pll_periph0_150M_clk.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
-					    0x800,
-					    0, 5,	/* M */
-					    0, 0,	/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
+					   0x800,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_IS_CRITICAL,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static SUNXI_CCU_GATE_HWS(mbus_dma_clk, "mbus-dma", mbus_hws,
 			  0x804, BIT(0), 0);
-- 
2.53.0
