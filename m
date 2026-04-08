Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218B3AE190
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Apr 2026 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641302; cv=none; b=czpw+mkM2w4B//7dhxlXv1wts1svYuvIo7hp/+vizmoMGedy5EudfS8cZmQ/iXsBYLWBrS9tbRVWbejSdHhQFuAGnMTtFwt2C9WNyWCCtb9q+PPYX4tpNZ2MVErwCF4vi8uWLpUu691sMInyU/FNAhrB3cdfFbCWE5OVARwCfAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641302; c=relaxed/simple;
	bh=GtatU7a61TbhaghBTwgqAwUFt/P6h7smjsYWzrNbhgE=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ThJPdENv301fhQlP6rcPvci/lm3pk+n7tmS7eTN0lnf1wFy3P2aUw8a5IPxZDOz+zoCIXvHqXzBlVwgTpY8HUfE+HmdTanYHDYjctMg5efvTm3uIGmDanyMaYao6BhrtfGbVIt3BdfCmuaG4pm7X12HovCNJFA0tAND2vIsZHGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=KBRtZISk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KBRtZISk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ymap6qnTrcZjA2wjOv/aJIypsrfZm0ThDKHwcJw6fQA=; b=KBRtZISkGajYEF77tW0PaVeWQX
	cPZnzgBxvtuhhdl0AWKtISEgdRk5ygONloyCeyvc7bShsFUU291gw31NnmZThiKumCavoDUxWZ7ht
	cVFxKfusOkbLHw7diDcG/m/WO3KmVv7Y38vbfzTiDlCH3hIE7MQt+BAIhGaN+SOZknZvPt/nDFVer
	nX9Wo9T5rTYa1vxaHQ/lmKiB9p4+CfBiZll05OfJ9M7/jxzZGMStDbGxzi0qdRsZw0SJavADbkyRZ
	OUT8++lqg326oe/ePFqZ6aNhK2gp3lxLY6XKiSo7EBlX3bdqQV2MVuRQa7MzXTkTRzYo9u5SC8NNU
	w5ecUjoQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36872 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPCB-0000000024F-27WA;
	Wed, 08 Apr 2026 10:27:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPC6-0000000F7kr-1b7i;
	Wed, 08 Apr 2026 10:27:30 +0100
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
Subject: [PATCH RFC net-next 10/10] net: stmmac: only print receive COE type
 for GMAC cores
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPC6-0000000F7kr-1b7i@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:30 +0100

As identified in the previous commit, only GMAC cores have a COE type,
but priv->snpsver's numberspace is core specific. Change the test for
printing this to check the core type instead of checking for the
Synopssys IP version being < v4.0, which will incorrectly match XGMAC
cores.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 93c031b3cfd5..f5fe97c1abd4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7461,7 +7461,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (priv->plat->rx_coe) {
 		priv->hw->rx_csum = priv->plat->rx_coe;
 		dev_info(priv->device, "RX Checksum Offload Engine supported\n");
-		if (priv->snpsver < DWMAC_CORE_4_00)
+		if (priv->plat->core_type == DWMAC_CORE_GMAC)
 			dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csum);
 	}
 	if (priv->plat->tx_coe)
-- 
2.47.3

