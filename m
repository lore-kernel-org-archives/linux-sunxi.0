Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494F9443;
	Sat, 17 Jun 2023 13:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBBBC433CA;
	Sat, 17 Jun 2023 13:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687008077;
	bh=kJMjOEWBubOW9yDcj4y+c7DM6eBhC1GM5K1t94VIlM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RVIGbaSXkCFPPbMeKeLQgW7doJX/6W8mJHsWjog5hvpr/BkfpxQo6u1zSxX7ft3/I
	 omdaQxRHy9zEHE3w7eB5aZnljK3pv5KcFtEqILinO4tQECr0rNu/C+2kCF3GfJM6a0
	 wpG026GCBZyhjaviLFMTUvhbLpRrTXwrLJkXyKxRbQZ+/xlW3PD/gaRms1LeLsgWB5
	 XXuNGVD4ruo1Nodwoi91zsEx+PLDpL3Y+mYmDMVnPaorHBqzUHxuwByJdzcmQiAZjf
	 LVORniVAZRfsMiO0OWiV7Z0nxeL+jXkZqmwSDkxgcs91noWGJtqifn0ErXVMipPXjJ
	 MYmbyphde0xhg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Simon Horman <simon.horman@corigine.com>
Subject: [PATCH net-next v2 1/2] net: stmmac: don't clear network statistics in .ndo_open()
Date: Sat, 17 Jun 2023 21:09:42 +0800
Message-Id: <20230617130943.2776-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230617130943.2776-1-jszhang@kernel.org>
References: <20230617130943.2776-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FWICT, the common style in other network drivers: the network
statistics are not cleared since initialization, follow the common
style for stmmac.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5c645b6d5660..eb83396d6971 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3827,10 +3827,6 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
-	/* Extra statistics */
-	memset(&priv->xstats, 0, sizeof(struct stmmac_extra_stats));
-	priv->xstats.threshold = tc;
-
 	priv->rx_copybreak = STMMAC_RX_COPYBREAK;
 
 	buf_sz = dma_conf->dma_buf_sz;
@@ -7315,6 +7311,8 @@ int stmmac_dvr_probe(struct device *device,
 #endif
 	priv->msg_enable = netif_msg_init(debug, default_msg_level);
 
+	priv->xstats.threshold = tc;
+
 	/* Initialize RSS */
 	rxq = priv->plat->rx_queues_to_use;
 	netdev_rss_key_fill(priv->rss.key, sizeof(priv->rss.key));
-- 
2.40.1

