Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A940A22A4D6
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608685; cv=none; b=W84HXqe4ZjBB8mInuTEGDtt+Yh9ZxVAIqN6BPLXNuOEJqufehaLr8mpSt8Kp++LD3GiG0yZJZpQj+hDQc12ByPuxZl9+Xse+PgKDqAC2XpkSgnKtn2tujm78/KP6th5YeRGEhZWne2fjc04e5K8T9KFi0oKe8/6eTedhdSadkco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608685; c=relaxed/simple;
	bh=sifMuQ53xcvkWDPW6065dut4WEu8cZqWd0ZhTKTh6Dg=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=cGAl8rZgWUi3+s4bQ4SlpCQ8NMLbH7Nomcll9d5khd+J0/yh6NzF8KRFa9KPNKm3mhM+E9N30DFezbaLm5bmnGdXpdO8+AJdSqJtOZqWT7hfjoHqjS/gD5kAQWXVWbfq9CbhASHSeoh/yjRPkqNckL9/KgvshJ7xJ+DxQUAaEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=A4QTFwP9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="A4QTFwP9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ARCXnqS38tZ6SrvZyY4r4LsmND+qBD6vwra/0tog6Ok=; b=A4QTFwP92MvvwiC1CwF600PCv2
	pKuDyEuS43X1T9u2nX1zkmEPe/IAk1zy/FiBCClxg/q5F+J5+cZSr3w49TGekynnqUZ4kk6QRhQtQ
	EuZ/5HAwyvRRpGXtzWLgQ9ZTaZnvpKHlS4Rs3CkKAKB+OEIO4sIWOL/2QZEOHwtdcdybCzxyrC4Q2
	eaeVYKeOgU1oimksoG2uoHyzniS+296SZSNylUWGQg9K/DVkMxcirnghCdqaH2YH6UzUs2e8rPwXF
	ZN0ehYTDxAKEVWdYhHjRF/Yu+6Igix0GaqFM8QJchXFjfTanR7clqfryFDAgGwByM7jhHgEY98nUS
	N5Rn86Gg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58196 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trbyG-0002ZB-2u;
	Mon, 10 Mar 2025 12:11:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trbxv-005qYM-5m; Mon, 10 Mar 2025 12:10:39 +0000
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 5/9] net: stmmac: meson8b: remove of_get_phy_mode()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trbxv-005qYM-5m@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:39 +0000

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Set dwmac->phy_mode from plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 9c2d62d133ad..a50782994b97 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -417,11 +417,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(dwmac->regs);
 
 	dwmac->dev = &pdev->dev;
-	ret = of_get_phy_mode(pdev->dev.of_node, &dwmac->phy_mode);
-	if (ret) {
-		dev_err(&pdev->dev, "missing phy-mode property\n");
-		return ret;
-	}
+	dwmac->phy_mode = plat_dat->phy_interface;
 
 	/* use 2ns as fallback since this value was previously hardcoded */
 	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
-- 
2.30.2

