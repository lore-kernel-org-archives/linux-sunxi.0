Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433CB17C1
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 09:02:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: hector@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 90BE54206F;
	Mon,  2 May 2022 09:02:42 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
To: 
Cc: Hector Martin <marcan@marcan.st>,
	Anup Patel <anup.patel@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Mun Yew Tham <mun.yew.tham@intel.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/7] mailbox: ti-msgmgr Remove unused ti_msgmgr_queue_peek_data
Date: Mon,  2 May 2022 18:02:21 +0900
Message-Id: <20220502090225.26478-4-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502090225.26478-1-marcan@marcan.st>
References: <20220502090225.26478-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This op was ambiguously specified, and the way it was interpreted for
this implementation is not useful. It has no users, so remove it.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/mailbox/ti-msgmgr.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
index ddac423ac1a9..10881b812df2 100644
--- a/drivers/mailbox/ti-msgmgr.c
+++ b/drivers/mailbox/ti-msgmgr.c
@@ -309,33 +309,6 @@ static irqreturn_t ti_msgmgr_queue_rx_interrupt(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
-/**
- * ti_msgmgr_queue_peek_data() - Peek to see if there are any rx messages.
- * @chan:	Channel Pointer
- *
- * Return: 'true' if there is pending rx data, 'false' if there is none.
- */
-static bool ti_msgmgr_queue_peek_data(struct mbox_chan *chan)
-{
-	struct ti_queue_inst *qinst = chan->con_priv;
-	struct device *dev = chan->mbox->dev;
-	struct ti_msgmgr_inst *inst = dev_get_drvdata(dev);
-	const struct ti_msgmgr_desc *desc = inst->desc;
-	int msg_count;
-
-	if (qinst->is_tx)
-		return false;
-
-	if (ti_msgmgr_queue_is_error(desc, qinst)) {
-		dev_err(dev, "Error on channel %s\n", qinst->name);
-		return false;
-	}
-
-	msg_count = ti_msgmgr_queue_get_num_messages(desc, qinst);
-
-	return msg_count ? true : false;
-}
-
 /**
  * ti_msgmgr_last_tx_done() - See if all the tx messages are sent
  * @chan:	Channel pointer
@@ -744,7 +717,6 @@ static DEFINE_SIMPLE_DEV_PM_OPS(ti_msgmgr_pm_ops, ti_msgmgr_suspend, ti_msgmgr_r
 static const struct mbox_chan_ops ti_msgmgr_chan_ops = {
 	.startup = ti_msgmgr_queue_startup,
 	.shutdown = ti_msgmgr_queue_shutdown,
-	.peek_data = ti_msgmgr_queue_peek_data,
 	.last_tx_done = ti_msgmgr_last_tx_done,
 	.send_data = ti_msgmgr_send_data,
 };
-- 
2.35.1

