Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001702F12AE
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jun 2026 00:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782347670; cv=none; b=cVtHQzrrE13CzC3mRpCepIsr01jz9vR3U8l4KwtF5ffZAhYmA5lcjlPTUMAKmYBJd8lPKMT5AjZKlVMelvevBIZZ2W2Vew4SW6V7NkVH0S4ZUGYtNW/ZCD39kwRBIiysNfh0C+WLtu0pf29qRd7EFPiiL1mmn3V9X+IwBHehYzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782347670; c=relaxed/simple;
	bh=swyGRM5GlmdbbMMs2CuiPH4Z8MjFvASgzNQjRbMpx3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3mwcHc33kCg7822oCSmXJ4kAeIGMy4P/fBWzAic7UogMwRYDh6h34A2FQ/xS/PtJacdT9nFTNieqZOA6oE0ihNtK3cvyrF0ksp9qxn44RA8rWYYYwNJMc4tSDabStr1MT7cj8zIqE+Yx6Zk1mCzoIEhehL0xlWLyjGr6p0dWB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADXwaiJdzxqAdjCFQ--.4213S2;
	Thu, 25 Jun 2026 08:34:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: pengpeng@iscas.ac.cn,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: sunxi-rsb: fail hardware init on soft-reset timeout
Date: Thu, 25 Jun 2026 08:34:16 +0800
Message-ID: <20260625003416.15841-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADXwaiJdzxqAdjCFQ--.4213S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4UCw43ZFWUWF18Xw4kXrb_yoW8Xr4kpa
	naka47CrWqqF4FqF12yF1jvF15X3Z7KF98C3s8Cwn2vwnYgry8CFyrKFWFg3W5AF48uay5
	ZFnFqa1UCF1q9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQo7
	NUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

sunxi_rsb_hw_init() issues a controller soft reset and waits for the reset
bit to clear, but it ignores readl_poll_timeout()'s return value.

If the controller never leaves reset, probe can continue to publish child
devices and system resume can report success without a usable RSB
controller.

Return the timeout error, assert reset again, and disable the clock before
leaving the hardware-init path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/bus/sunxi-rsb.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index daf0ea563..f83224dea 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -669,8 +669,12 @@ static int sunxi_rsb_hw_init(struct sunxi_rsb *rsb)
 
 	/* reset the controller */
 	writel(RSB_CTRL_SOFT_RST, rsb->regs + RSB_CTRL);
-	readl_poll_timeout(rsb->regs + RSB_CTRL, reg,
-			   !(reg & RSB_CTRL_SOFT_RST), 1000, 100000);
+	ret = readl_poll_timeout(rsb->regs + RSB_CTRL, reg,
+				 !(reg & RSB_CTRL_SOFT_RST), 1000, 100000);
+	if (ret) {
+		dev_err(dev, "soft reset timed out\n");
+		goto err_reset_assert;
+	}
 
 	/*
 	 * Clock frequency and delay calculation code is from
@@ -696,6 +700,8 @@ static int sunxi_rsb_hw_init(struct sunxi_rsb *rsb)
 
 	return 0;
 
+err_reset_assert:
+	reset_control_assert(rsb->rstc);
 err_clk_disable:
 	clk_disable_unprepare(rsb->clk);
 
-- 
2.50.1 (Apple Git-155)

