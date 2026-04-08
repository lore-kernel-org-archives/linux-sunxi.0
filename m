Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A239E6FC
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Apr 2026 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641154; cv=none; b=pA8dRS7hrSIP7wQiQpUUjpZJh1sw+teq0qn0mdR8sj5gj0lCKADZXNjwndNkzaQ7tIBh27uShoDsmxS/wI9c0V111PbbkQPrDlV0IwE7uQB6CdWCnUEn2so8tBwjwcF60AtrINBel+4q3/tm3TlpE3e8mtF99l8e7d5q7asjodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641154; c=relaxed/simple;
	bh=kW+XIOa0p1Pv+wOMyQbVRtwv7Ps4FjolTbA8qTfsLVU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=g93LjC7f+maQlkOTpVzTkCkS6LxW28fVQAPDlWYe4CiJVYDlMdzGHEogRJTUzoYqeJgqtmdrdMUA9nf6PptHqMWDS2oogep5GK+98LdRRXKaDODczX4f2TiYh7PlH7b4QonOR4xsVlBSen40fgxiaiQmmkamf87nSHpKL2Aydro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ixWTzvp4; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ixWTzvp4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1HKasakdQPn3aMFJOmu7e2iJDfqBG60iaErJHrMCkJA=; b=ixWTzvp4f+t4GhuXFYTrdH/aRd
	3FOKn/IkoHkbFk+C3776O3PX94GwUOmeacik8WLrjYYwBNbDmfMV00pd4hTmlTfGPNDDml1HlupgV
	uG88xMNXQGMrQFcrtf3jrvoXXH8j7LM3BRalWNTvuEofLcGzekrUAniQ9n/7ZlA2zaALx2cHogePZ
	fiZvPfiKO85jm1il2ByWPSNfmc0p6VGplrZOB7KtH8Q4XN2zg515QJfiiOiiJv6aAUhUR+CXpugjx
	FJigfk2Qg64/M4BfcWBsiMSwYXe5UPArYKR7M0Iyf1spmVIFgfYLxwNKLIUVUa/+bTyXDCCLetmxA
	pPTTWNUQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43584 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPC1-0000000023p-3pgt;
	Wed, 08 Apr 2026 10:27:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPBr-0000000F7ka-032o;
	Wed, 08 Apr 2026 10:27:15 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH RFC net-next 07/10] net: stmmac: limit MAC .debug() to
 dwmac1000 and dwmac4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPBr-0000000F7ka-032o@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:15 +0100

Avoid a bare test against snpsver which has multiple different number
spaces depending on the core type by testing for core types that
implement the .debug() method. This documents that these statistics
are only available on dwmac1000 and dwmac4 cores.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c    | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 343cf903c0bf..0caa5b992519 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -531,7 +531,10 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 		}
 	}
 
-	/* Update the DMA HW counters for dwmac10/100 */
+	/* Update the DMA HW counters for dwmac10/100 (DWMAC_CORE_MAC100),
+	 * where this will return zero. Other core types will have a non-zero
+	 * return value.
+	 */
 	ret = stmmac_dma_diagnostic_fr(priv, &priv->xstats, priv->ioaddr);
 	if (ret) {
 		/* If supported, for new GMAC chips expose the MMC counters */
@@ -553,7 +556,13 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 				priv->xstats.phy_eee_wakeup_error_n = val;
 		}
 
-		if (priv->snpsver >= DWMAC_CORE_3_50)
+		/* Only dwmac1000 and dwmac4 implements the MAC .debug() method.
+		 * As there are different version spaces depending on core_type,
+		 * make this conditional on the appropriate core type.
+		 */
+		if ((priv->plat->core_type == DWMAC_CORE_GMAC ||
+		     priv->plat->core_type == DWMAC_CORE_GMAC4) &&
+		    priv->snpsver >= DWMAC_CORE_3_50)
 			stmmac_mac_debug(priv, priv->ioaddr,
 					(void *)&priv->xstats,
 					rx_queues_count, tx_queues_count);
-- 
2.47.3

