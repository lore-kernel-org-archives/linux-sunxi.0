Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1996D23DC
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Apr 2023 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=XnY6r
	GthgQlj2pX9ScNgnwV1ZHgBG5W4PDKGtEIcWqc=; b=Km5SFK8EQkmZTfQo9UUTH
	/Pfj+gt4LEE+N361oE7+PDfWTeiNvN6s5aNVfhZMpXTDpdXl52lrbUbqf5poXdgT
	7ufxHc2Ot81xdX5Narb8HzlMcTmoNuCDVl+0U5EIGF8KT9H+GPmAtIWBz6L1dWBn
	4QXDjFBT+0dBWjA7h0Lhnk=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
	by zwqz-smtp-mta-g1-0 (Coremail) with SMTP id _____wDnU7DwU0pkyUYQAQ--.4631S3;
	Thu, 27 Apr 2023 18:52:33 +0800 (CST)
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
Subject: [PATCH v3 1/2] drivers: net: sun4i-emac: Fix double spinlock in emac_timeout
Date: Thu, 27 Apr 2023 18:52:30 +0800
Message-Id: <20230427105231.13900-2-qianfanguijin@163.com>
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
X-CM-TRANSID:_____wDnU7DwU0pkyUYQAQ--.4631S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryrCF45KrWkWw15Zr15XFb_yoWrZr45pF
	y5Aas5Cw4xX3Z0vw4IyrW0qFWqq3Zay34xCr4xAw4fuFn3G34rXFy8tFy2kFWYyrZrAay7
	Kryqy3ySkF4kXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRCPfQUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBzhJe7WI0ZAL7AgAAsm

From: qianfan Zhao <qianfanguijin@163.com>

emac_timeout() callback acquires lock and so does emac_init_device(),
which called inside lock protected region. This hangs the system and
produces following warning:

WARNING: CPU: 2 PID: 0 at net/sched/sch_generic.c:478
dev_watchdog+0x2e4/0x2e8
NETDEV WATCHDOG: FE0 (sun4i-emac): transmit queue 0 timed out
Modules linked in:
CPU: 2 PID: 0 Comm: swapper/2 Tainted: G W 5.15.0-00047-g0848e4aeb313
Hardware name: Wisdom T3 based CCT Family
[<c010f740>] (unwind_backtrace) from [<c010b744>] (show_stack+0x10/0x14)
[<c010b744>] (show_stack) from [<c0a4d978>] (dump_stack_lvl+0x40/0x4c)
[<c0a4d978>] (dump_stack_lvl) from [<c0120734>] (__warn+0x104/0x108)
[<c0120734>] (__warn) from [<c01207b0>] (warn_slowpath_fmt+0x78/0xbc)
[<c01207b0>] (warn_slowpath_fmt) from [<c0898a54>]
(dev_watchdog+0x2e4/0x2e8)
[<c0898a54>] (dev_watchdog) from [<c019a888>] (call_timer_fn+0x3c/0x178)
[<c019a888>] (call_timer_fn) from [<c019bddc>]
(run_timer_softirq+0x540/0x624)
[<c019bddc>] (run_timer_softirq) from [<c0101298>]
(__do_softirq+0x130/0x3bc)
[<c0101298>] (__do_softirq) from [<c0127ea0>] (irq_exit+0xbc/0x100)
[<c0127ea0>] (irq_exit) from [<c017e514>] (handle_domain_irq+0x60/0x78)
[<c017e514>] (handle_domain_irq) from [<c05a6130>]
(gic_handle_irq+0x7c/0x90)
[<c05a6130>] (gic_handle_irq) from [<c0100afc>] (__irq_svc+0x5c/0x78)
Exception stack(0xc14f3f70 to 0xc14f3fb8)
3f60:                                     0003475c 00000000 00000001
c01188a0
3f80: c107b200 c0f06b4c c0f06b90 00000004 c1079ff8 c0c62774 00000000
00000000
3fa0: c10b2198 c14f3fc0 c0107fcc c0107fd0 60030013 ffffffff
[<c0100afc>] (__irq_svc) from [<c0107fd0>] (arch_cpu_idle+0x38/0x3c)
[<c0107fd0>] (arch_cpu_idle) from [<c0a57f38>]
(default_idle_call+0x3c/0xcc)
[<c0a57f38>] (default_idle_call) from [<c0157258>] (do_idle+0xdc/0x13c)
[<c0157258>] (do_idle) from [<c01575a4>] (cpu_startup_entry+0x18/0x1c)
[<c01575a4>] (cpu_startup_entry) from [<401015d0>] (0x401015d0)
---[ end trace a70942a1265338f1 ]---
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: \x092-...0: (1 GPs behind) idle=75d/0/0x1 softirq=8288/8289 fqs=931
\x09(detected by 0, t=2102 jiffies, g=13485, q=1635)
Sending NMI from CPU 0 to CPUs 2:
spi_master spi2: spi2.1: timeout transferring 4 bytes@100000Hz for
110(100)ms
spidev spi2.1: SPI transfer failed: -110

Fixes: 492205050d77b (net: Add EMAC ethernet driver found on Allwinner A10 SoC's)
Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index a94c62956eed..8093d6d2101c 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -488,14 +488,11 @@ static int emac_set_mac_address(struct net_device *dev, void *p)
 }
 
 /* Initialize emac board */
-static void emac_init_device(struct net_device *dev)
+static void emac_init_device_no_lock(struct net_device *dev)
 {
 	struct emac_board_info *db = netdev_priv(dev);
-	unsigned long flags;
 	unsigned int reg_val;
 
-	spin_lock_irqsave(&db->lock, flags);
-
 	emac_update_speed(dev);
 	emac_update_duplex(dev);
 
@@ -508,7 +505,15 @@ static void emac_init_device(struct net_device *dev)
 	reg_val = readl(db->membase + EMAC_INT_CTL_REG);
 	reg_val |= (EMAC_INT_CTL_TX_EN | EMAC_INT_CTL_TX_ABRT_EN | EMAC_INT_CTL_RX_EN);
 	writel(reg_val, db->membase + EMAC_INT_CTL_REG);
+}
+
+static void emac_init_device(struct net_device *dev)
+{
+	struct emac_board_info *db = netdev_priv(dev);
+	unsigned long flags;
 
+	spin_lock_irqsave(&db->lock, flags);
+	emac_init_device_no_lock(dev);
 	spin_unlock_irqrestore(&db->lock, flags);
 }
 
@@ -526,7 +531,7 @@ static void emac_timeout(struct net_device *dev, unsigned int txqueue)
 
 	netif_stop_queue(dev);
 	emac_reset(db);
-	emac_init_device(dev);
+	emac_init_device_no_lock(dev);
 	/* We can accept TX packets again */
 	netif_trans_update(dev);
 	netif_wake_queue(dev);
-- 
2.25.1

