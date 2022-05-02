Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EE415A5
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 09:02:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: hector@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id D41B041E96;
	Mon,  2 May 2022 09:02:37 +0000 (UTC)
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
Subject: [PATCH 2/7] mailbox: sun6i: Unexport unused sun6i_msgbox_peek_data
Date: Mon,  2 May 2022 18:02:20 +0900
Message-Id: <20220502090225.26478-3-marcan@marcan.st>
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
this implementation is not useful. It has no users, so remove it. The
function is used internally by the driver, so just remove it from the
ops structure.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/mailbox/sun6i-msgbox.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 7f8d931042d3..47aedda80f3f 100644
--- a/drivers/mailbox/sun6i-msgbox.c
+++ b/drivers/mailbox/sun6i-msgbox.c
@@ -189,7 +189,6 @@ static const struct mbox_chan_ops sun6i_msgbox_chan_ops = {
 	.startup      = sun6i_msgbox_startup,
 	.shutdown     = sun6i_msgbox_shutdown,
 	.last_tx_done = sun6i_msgbox_last_tx_done,
-	.peek_data    = sun6i_msgbox_peek_data,
 };
 
 static int sun6i_msgbox_probe(struct platform_device *pdev)
-- 
2.35.1

