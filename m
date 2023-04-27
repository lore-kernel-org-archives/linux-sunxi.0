Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEA823D9
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Apr 2023 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Eq28a
	JWhL8y2iB8tzC8v6UvzBFNUjpkbRpbiqZIVEF0=; b=XxN+dPBr+whiToIBF/FFT
	elOIDm//FqnJ+9ZLpuMA4BkYOLQ8ZOntQFCgiHrZVhLr3CsjciDeFD+DXcqli4II
	U/F75nBmDuY/x77tLWJSaieKfbqWHq1D14anXHOO29c5ocFAFb/eJ7b7JQ5JavLO
	xrZovgDzL5JKiVsyJ419zk=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
	by zwqz-smtp-mta-g1-0 (Coremail) with SMTP id _____wDnU7DwU0pkyUYQAQ--.4631S4;
	Thu, 27 Apr 2023 18:52:34 +0800 (CST)
From: qianfanguijin@163.com
To: linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	=?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v3 2/2] drivers: net: sun4i-emac: Fix emac_timeout
Date: Thu, 27 Apr 2023 18:52:31 +0800
Message-Id: <20230427105231.13900-3-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427105231.13900-1-qianfanguijin@163.com>
References: <20220912063331.23369-1-qianfanguijin@163.com>
 <20230427105231.13900-1-qianfanguijin@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnU7DwU0pkyUYQAQ--.4631S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr4Dur43Gw43KFWfuFyrtFb_yoW8GFy3pr
	W8CFWIkrW8tF15Xa18uan7WFs5Xa15JrsFkrZ7J3yrWa4akFsxtr15trWqkF4UAr4rua1Y
	vr1jyrW3ur4DXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi9qXdUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXBNe7VXl6aM+cwAAsL

From: qianfan Zhao <qianfanguijin@163.com>

The system will hang in softirq after emac_timeout happens, next is the
trace logs:

289.902631: softirq_entry: vec=2 [action=NET_TX]
289.902651: net_dev_xmit: dev=eth0 skbaddr=(ptrval) len=98 rc=16
289.902656: softirq_exit: vec=2 [action=NET_TX]
289.902659: softirq_entry: vec=2 [action=NET_TX]
289.902664: net_dev_xmit: dev=eth0 skbaddr=(ptrval) len=98 rc=16
289.902668: softirq_exit: vec=2 [action=NET_TX]
...

Clear tx_fifo_stat to free all tx channels after emac reset done to fix.

Fixes: 492205050d77b (net: Add EMAC ethernet driver found on Allwinner A10 SoC's)
Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 8093d6d2101c..964c5e7188f8 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -536,6 +536,9 @@ static void emac_timeout(struct net_device *dev, unsigned int txqueue)
 	netif_trans_update(dev);
 	netif_wake_queue(dev);
 
+	/* Clear tx_fifo_stat to free all tx channels */
+	db->tx_fifo_stat = 0;
+
 	/* Restore previous register address */
 	spin_unlock_irqrestore(&db->lock, flags);
 }
-- 
2.25.1

