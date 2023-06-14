Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D8312B65;
	Wed, 14 Jun 2023 16:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEACC433CA;
	Wed, 14 Jun 2023 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686760214;
	bh=IqJAuDAh+oPrQmuQFsWP4nPEM1N5IZtP0C9lgOkmGBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XsBi+9UiefrdfNEDmXoLkyXbN7qPPv+SucqyXQs4pDYMmmmIWL0EsOMMg+EDz9yeS
	 mbSUh3W7xrrGHzP26miKczUGDJblmQ0PL220Z50/jMVfeni8fNh9uVp76Re2R+yfQ7
	 Kuoj/u8gVIeJGlDndbwOXTbP7GCjfP3LLpFFnuURyYYk5gawtHpbFJsPs+KSykOyny
	 2ruIkH4prN+JlvXGi/PmWm6V2qml1tWQFFVoO2lLoAD9/0UVfbYfxEdx5podKpc/4i
	 3rcGV+gtapTOKOQyRvNDMXbF1zlk2B0TpVtZd8+c+LcKi9vOTQXa+8vnkc6hv2IJh6
	 5jXxy5ewtTX0g==
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
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] net: stmmac: don't clear network statistics in .ndo_open()
Date: Thu, 15 Jun 2023 00:18:45 +0800
Message-Id: <20230614161847.4071-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230614161847.4071-1-jszhang@kernel.org>
References: <20230614161847.4071-1-jszhang@kernel.org>
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
index 0fca81507a77..951e037d0a80 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3823,10 +3823,6 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
-	/* Extra statistics */
-	memset(&priv->xstats, 0, sizeof(struct stmmac_extra_stats));
-	priv->xstats.threshold = tc;
-
 	priv->rx_copybreak = STMMAC_RX_COPYBREAK;
 
 	buf_sz = dma_conf->dma_buf_sz;
@@ -7307,6 +7303,8 @@ int stmmac_dvr_probe(struct device *device,
 #endif
 	priv->msg_enable = netif_msg_init(debug, default_msg_level);
 
+	priv->xstats.threshold = tc;
+
 	/* Initialize RSS */
 	rxq = priv->plat->rx_queues_to_use;
 	netdev_rss_key_fill(priv->rss.key, sizeof(priv->rss.key));
-- 
2.40.1

