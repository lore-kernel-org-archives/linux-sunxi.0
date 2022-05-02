Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A30617C1
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 09:02:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: hector@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4E52742118;
	Mon,  2 May 2022 09:02:47 +0000 (UTC)
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
Subject: [PATCH 4/7] mailbox: altera: Remove unused altera_mbox_peek_data
Date: Mon,  2 May 2022 18:02:22 +0900
Message-Id: <20220502090225.26478-5-marcan@marcan.st>
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
 drivers/mailbox/mailbox-altera.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-altera.c
index afb320e9d69c..30de424df371 100644
--- a/drivers/mailbox/mailbox-altera.c
+++ b/drivers/mailbox/mailbox-altera.c
@@ -238,13 +238,6 @@ static bool altera_mbox_last_tx_done(struct mbox_chan *chan)
 	return altera_mbox_full(mbox) ? false : true;
 }
 
-static bool altera_mbox_peek_data(struct mbox_chan *chan)
-{
-	struct altera_mbox *mbox = mbox_chan_to_altera_mbox(chan);
-
-	return altera_mbox_pending(mbox) ? true : false;
-}
-
 static int altera_mbox_startup(struct mbox_chan *chan)
 {
 	struct altera_mbox *mbox = mbox_chan_to_altera_mbox(chan);
@@ -279,7 +272,6 @@ static const struct mbox_chan_ops altera_mbox_ops = {
 	.startup = altera_mbox_startup,
 	.shutdown = altera_mbox_shutdown,
 	.last_tx_done = altera_mbox_last_tx_done,
-	.peek_data = altera_mbox_peek_data,
 };
 
 static int altera_mbox_probe(struct platform_device *pdev)
-- 
2.35.1

