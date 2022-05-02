Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9459C17C1
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 09:03:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: hector@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id CEA984246A;
	Mon,  2 May 2022 09:02:56 +0000 (UTC)
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
Subject: [PATCH 6/7] mailbox: apple: Implement flush() operation
Date: Mon,  2 May 2022 18:02:24 +0900
Message-Id: <20220502090225.26478-7-marcan@marcan.st>
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

This allows clients to use the atomic-safe mailbox API style.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/mailbox/apple-mailbox.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mailbox/apple-mailbox.c b/drivers/mailbox/apple-mailbox.c
index 496c4951ccb1..33e7acf71e3e 100644
--- a/drivers/mailbox/apple-mailbox.c
+++ b/drivers/mailbox/apple-mailbox.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/apple-mailbox.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gfp.h>
 #include <linux/interrupt.h>
@@ -112,6 +113,14 @@ static bool apple_mbox_hw_can_send(struct apple_mbox *apple_mbox)
 	return !(mbox_ctrl & apple_mbox->hw->control_full);
 }
 
+static bool apple_mbox_hw_send_empty(struct apple_mbox *apple_mbox)
+{
+	u32 mbox_ctrl =
+		readl_relaxed(apple_mbox->regs + apple_mbox->hw->a2i_control);
+
+	return mbox_ctrl & apple_mbox->hw->control_empty;
+}
+
 static int apple_mbox_hw_send(struct apple_mbox *apple_mbox,
 			      struct apple_mbox_msg *msg)
 {
@@ -219,6 +228,23 @@ static irqreturn_t apple_mbox_recv_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int apple_mbox_chan_flush(struct mbox_chan *chan, unsigned long timeout)
+{
+	struct apple_mbox *apple_mbox = chan->con_priv;
+	unsigned long deadline = jiffies + msecs_to_jiffies(timeout);
+
+	while (time_before(jiffies, deadline)) {
+		if (apple_mbox_hw_send_empty(apple_mbox)) {
+			mbox_chan_txdone(&apple_mbox->chan, 0);
+			return 0;
+		}
+
+		udelay(1);
+	}
+
+	return -ETIME;
+}
+
 static int apple_mbox_chan_startup(struct mbox_chan *chan)
 {
 	struct apple_mbox *apple_mbox = chan->con_priv;
@@ -250,6 +276,7 @@ static void apple_mbox_chan_shutdown(struct mbox_chan *chan)
 
 static const struct mbox_chan_ops apple_mbox_ops = {
 	.send_data = apple_mbox_chan_send_data,
+	.flush = apple_mbox_chan_flush,
 	.startup = apple_mbox_chan_startup,
 	.shutdown = apple_mbox_chan_shutdown,
 };
-- 
2.35.1

