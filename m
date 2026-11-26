Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677182;
	b=Cf4p6x3fcgAtf+17603GPBCIWuZwzh46MbelTvL5sFEC14NYcVud/3DKWeSC29f2duuP
	 zs9BB5E6oq4ScBMPCf7x5VtvxQ/SlzSl+6uQe/4M9b4brDy3HDQkonB/tvESJnR+Ulo1i
	 iXAGzv2Ue/im56c8w5BpBMYD9oLqRPMw7XxRQsyineRGoJXIsEEpHqZzePR0B+Z/d5BQ8
	 jEHMS32PAzwp3wafovyUWZ3D1bRmTp30bG0FzIMxnSSkOAXQE/xFKdMxs80w7prksTMrv
	 8jtFqe2R/M236qdzZ2hIpzhTRmp5WvufQ6dt+vsv5GyumGwolifM1TcPPQnxI1+viQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677182;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=K5j+hY/TpNb3TDZ4CDlJ7DrhpFGoRBJlazHC7f2+tvM=;
	b=ow7SZiJCKzA4PLsFkJjJqKl7JL3ovKFSgjtzf4AVtqL+IthZEGoEeiZOJJcyuRNrnNNL
	 53q4ZFQDhwse44cf0Fo02pkuGQNYwOgbe//OuAg16nW5VjXcbl1I6qXwVRWkkDCO++Qkp
	 3/TBpRzIg9u+PJ7O9jxWfYKYMDZX6P6mrxQg01YIWCRmLMfRogs4AhXHh1qOAx91GWWnD
	 nwV2V0N2kMcJg0tVGSVZSNhzRgnzAbIFmlljVQhSyqVzDQSBvWPLPLQRtj/Kk8W8ea/In
	 dpu/PwbISdfkkaTOyMKwfhBH5ZbWu2HxsoGJGACYKnf57uKZwV2czGXsjHJfxek1kAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=S+Gw97xI;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB7606A31C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 07:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDFB7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=S+Gw97xI
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id ABBF5403EF;
	Thu, 26 Nov 2026 18:12:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795677171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K5j+hY/TpNb3TDZ4CDlJ7DrhpFGoRBJlazHC7f2+tvM=;
	b=S+Gw97xIOtAkRieQQs+SOn+HpjNXnlZbOYRP5t3zwnganqxBG9AmklkK9fPBfYfgGF/JpT
	946886chveBS0Dd6+fwGs+lLIlUkDfeGK5qjyfOo5lJLKJFDsZJNQAvf0bOERUr15+T/Ly
	MnbWZKRQFVR0X3f7sIMsVUppIAiU+t7HH7VUiIEOvw15UKXVOyhcvg82QPe8B5zKkxGWwa
	tpmsmVsKMMAfbpxmTkRKYyzAhPTqq+kcxlhEWh+5lNqfxqwPkPJLAIHVS5h59WFPM8Cs3E
	e/xQLW+PPxckrv/wRSag6b0sMAGzRh5FlBSMDgv54ou1jbEsFyd1kyRz8PA5vg==
X-GPT-Reason: legitimate. This is a technical software patch (Linux
	kernel style) sent from alastair@d-silva.org, which is a recognized
	personal address in the context. The content is a specific code
	diff regarding hardware clock gating (sunxi-ng: a733) and includes
	a valid "Fixes" reference, "Signed-off-by" line, and standard development
	headers. There are no phishing indicators, no suspicious links,
	and the content perfectly aligns with technical development rather
	than unsolicited marketing or scams.
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH] clk: sunxi-ng: a733: Mark msi-lite0 clocks as critical
Date: Thu, 26 Nov 2026 18:12:51 +1100
Message-ID: <20261126071251.2671198-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ahb-msi-lite0 and mbus-msi-lite0 clocks gate the shared MSI-Lite0
bus fabric used by GMAC0 and other peripherals. The bus-msi-lite0 clock
only gates the register configuration interface. Until a bus or
interconnect driver models MSI-Lite0 consumers, referencing these shared
clocks only in GMAC0 does not reflect the shared fabric. Without
CLK_IS_CRITICAL, clk_disable_unused() gates them off and breaks GMAC0
link-up and DMA.

Mark ahb-msi-lite0 and mbus-msi-lite0 as CLK_IS_CRITICAL, matching
ahb-cpus and mbus-store in this driver.

Fixes: ed757071ac3d ("clk: sunxi-ng: a733: Add bus clock gates")
Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index 958a2a2bcf76..74759dc6b292 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -567,8 +567,9 @@ static SUNXI_CCU_GATE_HWS(ahb_serdes_clk, "ahb-serdes", ahb_hws,
 			  0x5c0, BIT(8), 0);
 static SUNXI_CCU_GATE_HWS(ahb_usb_sys_clk, "ahb-usb-sys", ahb_hws,
 			  0x5c0, BIT(9), 0);
+/* Keep enabled for the shared MSI-Lite0 AHB bus fabric. */
 static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
-			  0x5c0, BIT(16), 0);
+			  0x5c0, BIT(16), CLK_IS_CRITICAL);
 
 /* This gate controls access to the storage controller MMIO registers. */
 static SUNXI_CCU_GATE_HWS(ahb_store_clk, "ahb-store", ahb_hws,
@@ -597,8 +598,9 @@ static SUNXI_CCU_GATE_HWS(mbus_vid_in_clk, "mbus-vid-in", mbus_hws,
 			  0x5e0, BIT(24), 0);
 static SUNXI_CCU_GATE_HWS(mbus_serdes_clk, "mbus-serdes", mbus_hws,
 			  0x5e0, BIT(28), 0);
+/* Keep enabled for the shared MSI-Lite0 MBUS DMA paths. */
 static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hws,
-			  0x5e0, BIT(29), 0);
+			  0x5e0, BIT(29), CLK_IS_CRITICAL);
 
 /* Keep enabled for the storage controller DMA paths. */
 static SUNXI_CCU_GATE_HWS(mbus_store_clk, "mbus-store", mbus_hws,
-- 
2.53.0

