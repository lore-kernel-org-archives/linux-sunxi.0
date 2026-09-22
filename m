Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C0388E69
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048858; cv=none; b=lLIxJ5N7jVS3rYzsfGHDrtlqj6GUPyCd2idczZXcxmI3eBO9ZkjT7H8Lmrxyk2FRu1/oZAVqk+WU0mzIM7Z4djhxFIzfJVqBH+ILlBmAjIgB7n1MgyGrdvGcpgwtg7qngpS8dp6SHu2VH69T+1y5jW839PVjjYT9U0jf4Rp5WaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048858; c=relaxed/simple;
	bh=/YegHtL6J4iKj/HRKVllYZKUhC+eQSlSBeiTbTCmXtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5QcL9198UkUoPU5EtiDe/+TGVGey97wZewDMakUoD/CCyxKMuzA9P5dL6knC2FY4ZFA61dj1CbnlsHpra92XNrykDwFoPoxVPnpSoITHu0tN+gcQWghWyBxVw5ahlv3UTLDPzyO1rY9nc2KnWkz0jGepuRXKHGVbfbWeqJxDiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJQAXXHf; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJQAXXHf"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d440939f0so28618527b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048855; x=1790653655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2uziLQOk+bji3p29enFotWbAp/mDZsSoT5HVW4iEys=;
        b=JJQAXXHfyb+W/gGZZD3KuvK9aVR5l3BEaEdx5tr2IKrB26MFhiT6v71R51c5xWgpFh
         SLbuDMTi7YoqPF5fG/ND8bpNnCcD1Cw5cqTss3oN5duJmEDez+UsizpnFIcd668c7po+
         l7E6f1oMbpyWQW1YA3cZUc9awfkgcSQOCJsbL3tB2nXCl83Rhbvc3TCvokV26C+9T2HH
         INjL0r6kcTQnG9uVaE87Zd7xQoeKaiMuxWTzjWNTjL8MrOgEiJyQ5OV4EFSvTwKe7c7M
         bJvKE9u7TUkzGW0LFUZYXl6pqeuTNrwGg68c4yhC3PGpITe2YYCAubsy6dLmzsRmtKc4
         qgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048855; x=1790653655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2uziLQOk+bji3p29enFotWbAp/mDZsSoT5HVW4iEys=;
        b=ZmCefYlKs1LkuU6GpCFmEylKS4gmsO8bLH4SMontFmV+nFsSyU7cSkSMTuowFdByYl
         jabme9oYZ3hGDyELexFt7XqIyTnD1Jfi0SC3qsB6i/1cEjiOOloMQC/fHBswYBA8/voI
         mmAiWOMe0T1hxBVhdyegREKmTqHWtmF2GqplrQ0l2EJRmpqDZBnE7nDhhetm8ULxqmpW
         1fBwJOnkIZ7VgcANNKPiCAOMuclF85KbxSl/5OpQsyUEQ1gZaR8myatXjOWGjwiwmvQL
         qUqOhBjaXhnTMmTB6rnELQpom3Y1pF7SAOBqukcT975+OHyAVUPr9va400Tej8Q+Runn
         cGTQ==
X-Gm-Message-State: AFuF++kR2o04ejOO2FoIzxjzhTAzARnN7CM5AMymSPpdunFKMUGLJ8nA
	cHRiQEqC1WRhk5IXKAzP8yGYv6sXgT0Njr0YTQa6Qs1q8g9gUPo1zsX5/yZxP1A4
X-Gm-Gg: AYBFou2A81iX5DFoUSmzJI8yL0PvLx9VYas467CPdIfvjFzzrxw70l2caQ6MqUv/CfA
	6gf07IvCqBFKB8w4mCoKSB/7+UUiUWtrt84s016qZx7+QpQj4sDim3fxmvoCyzCk4DjdKBpP9s9
	N/9Mz3W9WdluCDo9WeR0oRNAEkFcvv7FW3l/9E/q21PDDZRU4SZX7MJCnvWmnYcAM3/nVlf9Iq/
	6NQMquMlLx1DDY0Nx+Tw7gAoPxwWvAMiTbolf4NQjkcELQyJsRwz7shhOf7olu0unSySWcBHg2W
	2skxxYX3Gw1IxNmuBSjxl/iTQZtPPkeGTGnByKwYYpfAtr/cho1QPP5J6qQeI8eff+EM7h3yMhS
	VSMG0sDqIfG7siv5HLHwtY2umxdKeYldTj4NpE18F8XbVidnFXi5BDjKoP1Ee4+8EPj1uAZdq7k
	AXd2PFF4L5Etkm6EY7ul9La+C5E/NZdV4NQCIY1uoZL1cL14bN85WtPHBzDrKIffJWIdYKb4HnY
	hKk
X-Received: by 2002:a05:690c:4990:b0:88e:edf8:e375 with SMTP id 00721157ae682-897308fbc4emr47523377b3.5.1790048855356;
        Mon, 21 Sep 2026 20:47:35 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:35 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/7] mailbox: sun55i: add Allwinner sun55i/sun60i 4-port Message Box driver
Date: Mon, 21 Sep 2026 22:47:06 -0500
Message-ID: <20260922034711.190253-3-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the 4-port hardware Message Box present on Allwinner
A523/A527/T527 (sun55i) and A733 (sun60i) SoCs. This hardware block
provides 12 hardware FIFO channels connecting the Cortex-A55 host,
HiFi4 DSP, CPUS, and XuanTie E907 RISC-V coprocessors.

Cc: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-sunxi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 drivers/mailbox/Kconfig         |  10 +
 drivers/mailbox/Makefile        |   2 +
 drivers/mailbox/sun55i-msgbox.c | 337 ++++++++++++++++++++++++++++++++
 3 files changed, 349 insertions(+)
 create mode 100644 drivers/mailbox/sun55i-msgbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab869769e278..9067f5161276 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -332,6 +332,16 @@ config SUN6I_MSGBOX
 	  various Allwinner SoCs. This mailbox is used for communication
 	  between the application CPUs and the power management coprocessor.
 
+config SUN55I_MSGBOX
+	tristate "Allwinner sun55i/sun60i 4-port Message Box"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	default ARCH_SUNXI
+	help
+	  Mailbox implementation for the 4-port hardware message box present in
+	  Allwinner A523/A527/T527 (sun55i) and A733 (sun60i) SoCs. This mailbox
+	  provides 12 hardware FIFO channels for communication between the
+	  Cortex-A55 host, CPUS, HiFi4 DSP, and XuanTie E907 RISC-V coprocessors.
+
 config SPRD_MBOX
 	tristate "Spreadtrum Mailbox"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 45dc59bb3e7f..40024aa906a6 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -71,6 +71,8 @@ obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
 
+obj-$(CONFIG_SUN55I_MSGBOX)	+= sun55i-msgbox.o
+
 obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
 
 obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
diff --git a/drivers/mailbox/sun55i-msgbox.c b/drivers/mailbox/sun55i-msgbox.c
new file mode 100644
index 000000000000..b36f26670a46
--- /dev/null
+++ b/drivers/mailbox/sun55i-msgbox.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner sun55i/sun60i 4-Port Hardware Message Box Driver
+ *
+ * Copyright (C) 2026 Tim Michals <tcmichals@gmail.com>
+ * Based on vendor sunxi-msgbox driver by Allwinner Technology Co., Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#define SUN55I_MAX_PROCESSORS		4
+#define SUN55I_CHANS_PER_PROC		4
+#define SUN55I_NUM_CHANS		((SUN55I_MAX_PROCESSORS - 1) * SUN55I_CHANS_PER_PROC)
+#define SUN55I_FIFO_MAX			8
+
+#define SUNXI_MSGBOX_OFFSET(n)			(0x100 * (n))
+#define SUNXI_MSGBOX_READ_IRQ_ENABLE(n)		(0x020 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_READ_IRQ_STATUS(n)		(0x024 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_WRITE_IRQ_ENABLE(n)	(0x030 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_WRITE_IRQ_STATUS(n)	(0x034 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_FIFO_STATUS(n, p)		(0x050 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+#define SUNXI_MSGBOX_MSG_STATUS(n, p)		(0x060 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+#define SUNXI_MSGBOX_MSG_FIFO(n, p)		(0x070 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+
+#define RD_IRQ_EN_BIT(p)			BIT((p) * 2)
+#define RD_IRQ_PEND_BIT(p)			BIT((p) * 2)
+#define MSG_NUM_MASK				GENMASK(3, 0)
+
+struct sun55i_route {
+	u8 remote_id;
+	u8 remote_n;
+};
+
+/*
+ * Hardware routing table for Cortex-A55 host (local_id = 0):
+ *   local_n = 0 -> CPUS (remote_id = 2, remote_n = 0) -> Channels 0..3
+ *   local_n = 1 -> DSP  (remote_id = 1, remote_n = 0) -> Channels 4..7
+ *   local_n = 2 -> RV   (remote_id = 3, remote_n = 2) -> Channels 8..11
+ */
+static const struct sun55i_route arm_routes[3] = {
+	[0] = { .remote_id = 2, .remote_n = 0 },
+	[1] = { .remote_id = 1, .remote_n = 0 },
+	[2] = { .remote_id = 3, .remote_n = 2 },
+};
+
+struct sun55i_msgbox {
+	struct mbox_controller controller;
+	void __iomem *regs[SUN55I_MAX_PROCESSORS];
+	struct clk *clk;
+	struct reset_control *reset;
+	/* Protects concurrent MMIO register access */
+	spinlock_t lock;
+};
+
+static inline struct sun55i_msgbox *to_sun55i_msgbox(struct mbox_chan *chan)
+{
+	return chan->con_priv;
+}
+
+static inline void sun55i_chan_to_route(int chan_idx, int *local_n, int *p,
+					int *remote_id, int *remote_n)
+{
+	*local_n = chan_idx / SUN55I_CHANS_PER_PROC;
+	*p = chan_idx % SUN55I_CHANS_PER_PROC;
+	*remote_id = arm_routes[*local_n].remote_id;
+	*remote_n = arm_routes[*local_n].remote_n;
+}
+
+static irqreturn_t sun55i_msgbox_irq(int irq, void *dev_id)
+{
+	struct sun55i_msgbox *mbox = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	int local_n, p, chan_idx;
+
+	for (local_n = 0; local_n < 3; local_n++) {
+		void __iomem *local_base = mbox->regs[0];
+		u32 en, stat, pending;
+
+		en = readl(local_base + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+		stat = readl(local_base + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+		pending = en & stat;
+
+		if (!pending)
+			continue;
+
+		for (p = 0; p < SUN55I_CHANS_PER_PROC; p++) {
+			if (!(pending & RD_IRQ_PEND_BIT(p)))
+				continue;
+
+			chan_idx = local_n * SUN55I_CHANS_PER_PROC + p;
+			while (readl(local_base +
+				     SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK) {
+				u32 msg = readl(local_base + SUNXI_MSGBOX_MSG_FIFO(local_n, p));
+
+				mbox_chan_received_data(&mbox->controller.chans[chan_idx], &msg);
+			}
+
+			writel(RD_IRQ_PEND_BIT(p),
+			       local_base + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+			ret = IRQ_HANDLED;
+		}
+	}
+
+	return ret;
+}
+
+static int sun55i_msgbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	u32 msg = data ? *(u32 *)data : 0;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	writel(msg, mbox->regs[remote_id] + SUNXI_MSGBOX_MSG_FIFO(remote_n, p));
+	return 0;
+}
+
+static int sun55i_msgbox_startup(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	unsigned long flags;
+	u32 val;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	/* Flush any stale receive data */
+	while (readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK)
+		readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_FIFO(local_n, p));
+
+	/* Clear pending status */
+	writel(RD_IRQ_PEND_BIT(p),
+	       mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+
+	/* Enable receive IRQ */
+	spin_lock_irqsave(&mbox->lock, flags);
+	val = readl(mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	val |= RD_IRQ_EN_BIT(p);
+	writel(val, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	spin_unlock_irqrestore(&mbox->lock, flags);
+
+	return 0;
+}
+
+static void sun55i_msgbox_shutdown(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	unsigned long flags;
+	u32 val;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	/* Disable receive IRQ */
+	spin_lock_irqsave(&mbox->lock, flags);
+	val = readl(mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	val &= ~RD_IRQ_EN_BIT(p);
+	writel(val, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	spin_unlock_irqrestore(&mbox->lock, flags);
+
+	/* Clear pending status and flush */
+	writel(RD_IRQ_PEND_BIT(p),
+	       mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+	while (readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK)
+		readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_FIFO(local_n, p));
+}
+
+static bool sun55i_msgbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	u32 count;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	count = readl(mbox->regs[remote_id] + SUNXI_MSGBOX_MSG_STATUS(remote_n, p)) & MSG_NUM_MASK;
+	return count < SUN55I_FIFO_MAX;
+}
+
+static bool sun55i_msgbox_peek_data(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	u32 count;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	count = readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK;
+	return count > 0;
+}
+
+static const struct mbox_chan_ops sun55i_msgbox_chan_ops = {
+	.send_data    = sun55i_msgbox_send_data,
+	.startup      = sun55i_msgbox_startup,
+	.shutdown     = sun55i_msgbox_shutdown,
+	.last_tx_done = sun55i_msgbox_last_tx_done,
+	.peek_data    = sun55i_msgbox_peek_data,
+};
+
+static int sun55i_msgbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mbox_chan *chans;
+	struct sun55i_msgbox *mbox;
+	int i, ret, irq_cnt, local_n;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	spin_lock_init(&mbox->lock);
+
+	for (i = 0; i < SUN55I_MAX_PROCESSORS; i++) {
+		mbox->regs[i] = devm_platform_ioremap_resource(pdev, i);
+		if (IS_ERR(mbox->regs[i]))
+			return dev_err_probe(dev, PTR_ERR(mbox->regs[i]),
+					     "failed to map resource %d\n", i);
+	}
+
+	mbox->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(mbox->clk))
+		return dev_err_probe(dev, PTR_ERR(mbox->clk), "failed to get clock\n");
+
+	ret = clk_prepare_enable(mbox->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
+
+	mbox->reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(mbox->reset)) {
+		ret = PTR_ERR(mbox->reset);
+		goto err_disable_clk;
+	}
+
+	ret = reset_control_deassert(mbox->reset);
+	if (ret)
+		goto err_disable_clk;
+
+	/* Disable all read IRQs and clear status */
+	for (local_n = 0; local_n < 3; local_n++) {
+		writel(0, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+		writel(0xffffffff, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+	}
+
+	irq_cnt = platform_irq_count(pdev);
+	if (irq_cnt < 0) {
+		ret = irq_cnt;
+		goto err_disable_clk;
+	}
+
+	for (i = 0; i < irq_cnt; i++) {
+		int irq = platform_get_irq(pdev, i);
+
+		if (irq > 0) {
+			ret = devm_request_irq(dev, irq, sun55i_msgbox_irq,
+					       IRQF_SHARED, dev_name(dev), mbox);
+			if (ret)
+				dev_warn(dev, "failed to request irq %d: %d\n", irq, ret);
+		}
+	}
+
+	chans = devm_kcalloc(dev, SUN55I_NUM_CHANS, sizeof(*chans), GFP_KERNEL);
+	if (!chans) {
+		ret = -ENOMEM;
+		goto err_disable_clk;
+	}
+
+	for (i = 0; i < SUN55I_NUM_CHANS; i++)
+		chans[i].con_priv = mbox;
+
+	mbox->controller.dev           = dev;
+	mbox->controller.ops           = &sun55i_msgbox_chan_ops;
+	mbox->controller.chans         = chans;
+	mbox->controller.num_chans     = SUN55I_NUM_CHANS;
+	mbox->controller.txdone_irq    = false;
+	mbox->controller.txdone_poll   = true;
+	mbox->controller.txpoll_period = 1;
+
+	platform_set_drvdata(pdev, mbox);
+
+	ret = mbox_controller_register(&mbox->controller);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register controller\n");
+		goto err_disable_clk;
+	}
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(mbox->clk);
+	return ret;
+}
+
+static void sun55i_msgbox_remove(struct platform_device *pdev)
+{
+	struct sun55i_msgbox *mbox = platform_get_drvdata(pdev);
+
+	mbox_controller_unregister(&mbox->controller);
+	clk_disable_unprepare(mbox->clk);
+}
+
+static const struct of_device_id sun55i_msgbox_of_match[] = {
+	{ .compatible = "allwinner,sun55i-a523-msgbox" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sun55i_msgbox_of_match);
+
+static struct platform_driver sun55i_msgbox_driver = {
+	.driver = {
+		.name = "sun55i-msgbox",
+		.of_match_table = sun55i_msgbox_of_match,
+	},
+	.probe = sun55i_msgbox_probe,
+	.remove = sun55i_msgbox_remove,
+};
+module_platform_driver(sun55i_msgbox_driver);
+
+MODULE_AUTHOR("Tim Michals <tcmichals@gmail.com>");
+MODULE_DESCRIPTION("Allwinner sun55i/sun60i 4-Port Message Box Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

