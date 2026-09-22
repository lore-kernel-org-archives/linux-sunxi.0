Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFD73515CB
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 00:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037931; cv=none; b=fLGK7OtZ5z6I6/Nxddcm84SBi9FlN8vz4OH+MNupShJaGlTRdTyL7FYlgYl4JIBjP1006pV7T3yvH8PieW2zrEObD5+Uwm+U7Swlx43n/zHzIhcxKLNhLwrqWHpJXBebU897lZcRoTOE7wDja2Q2iU8v/PIC7G7l0C8zZKf+Dw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037931; c=relaxed/simple;
	bh=53OlHK3z2SFt6DREz3cMdJsuFM+JmcGd/PPFzivyI5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8fECEG9ZmqFLEp7mAlrsV+JrCjopRw4OZZLSx491cwHCLRPTURHHQ/EIamHkqmE8spqtUzbCtLLBjWFUz5kfZQ/OEdYZIu9CqZcXer23eipRCoP5dvMGEaszP2SSJa/Oq8gufznZAR7dCb40V34ubAukvGQdkFJ/pd8/5Pj60Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyQSDt8N; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyQSDt8N"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c3b639adbcso2781941b6e.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 17:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037928; x=1790642728; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuhLhvmyUunUsMDDWLfZKTjtEMkziUs08QZF8zYObXw=;
        b=UyQSDt8NXBocpDbak45NwnTh7eTSDA6a/Aq/RInjoFfZMfjdRF9FOPbGnfKJczJRm1
         XFaDNBHuPnSenfcENPp1PKClmHsNpiUyXz5ABQmWm3upLaYGih4ld9naIbw9ETGVy80K
         M/0OP17Mp/PaD6kyf8Jp4OKHu8VGSBMsl3rheVhk9X3phJ7B2kL0dD+zXinuGODjJLqK
         tYB1u5CUuF0VzNnBvveiUcktjU8IUj54I0dcI61CNKMEftFne4Th107L60w+9eWdcFin
         iQzITOHMKhr6xeGWfAfcuDn8Qy5Qdp2jXjyknv+Fimntazz2mgzWW5ZTtvwhOnfZ+oJE
         XrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037928; x=1790642728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuhLhvmyUunUsMDDWLfZKTjtEMkziUs08QZF8zYObXw=;
        b=ZzbvBn1YFNjZJgOeor2MqkdxWH5Kk+YT57xqPjlCe61JJzQ+G1cPim+SQABSvfXz4b
         d3OrDMSh7HychJORHhvFZl7vVvhwbt3Azr6oYzFdGEJk5c59B3muy7Sv3OW15mQsqBtr
         vJ0Vffi9mRDnQN5XIrGYg+oZBMkqGlp9vgnUubZ5O2dRohRV/HnvRy2/t+Wyye6D5TnQ
         fbEEhmvwGLMyX8sMKiMX3J5npdNKCEchxbUjKKooUllU3Qb014ROsoMHbA4IeKc/SVnR
         bhB195ohOqR18Y20+DydWVIaSKobAX7IP5+lcAlhsRjC3rTowWQrHcSGPutZx9cIWnyO
         o7LQ==
X-Forwarded-Encrypted: i=1; AKwUvBykyOYk1gYO92Rx3qy0iBhN6bMAnut0rYmZv/qMh4Za2N5+VfUvihORO0HKhikn+9KQBsLxriC9NNOFKw==@lists.linux.dev
X-Gm-Message-State: AFuF++kUdy7j0b8aCmlF5iS7vgNV4pckpjLdtzULNlT/yVS9B4fPBn8M
	zJgxWVhR4dD/O7Dg81lFZrWn81dhJjZMbrV4DHAahc4qRKSml/WU1wax
X-Gm-Gg: AYBFou1dWg5pYw3El9h+eLmsXwAfkU2E8g+keG4kaH+/vb5UbAPc/AHiYTQ7oKc2jAL
	PIphtRjUe5Np2fefpj+3AIC+3iiPsFK9tWiZaX3gR8AHugTp28fkjCRKTEssdGJ1egWoYus6vzG
	0+5PzlUdxzc+tFy3uYmb3AAIPnaUWFTgeDGEndyTvfrrbIMpHs5LdwjYvg9PEYmlNb5ett3cqR4
	g48NograzFjiy5MVolEC2ASESPUAtSNj3GUddhFBjgeuEoyZRC9HSYd8Ly8FbyJgq1XWIy8vIQZ
	D8PfU1jXPXFi7efKKiqQDxk7KGj/5FQaArC1oJxnJe07kB6pi6F90f88c1XbbD+/cLPMrn54rjr
	2rI960hn/J8WZ1cSVXjyvDQ53lJ4HjOmLGUwDfTAKumsAdreCVdg0spnFP/6yLIaUUzCXliGfdJ
	DvgZHK5Jqcdf+d59DNxs4X2fazHtOUuNJCn/VnKUHUXjtZAOG7bA2RVOEx4T2y6xsqEUli98Fb0
	jnEd/NYXkR1F0OyjmYyytJ72fNmt/aCY6tLdQDGZxulx+ovC7dmm0bkpILGSQDgcjSqENMZ68yY
	BUDBX6eFfViE0ALRtQJgmiMiH+suOFTCwt3z7roU9xhR/PZHYi2w6FV7d+DoIgoQvI1n1gGZmjD
	h3ycczNUhkEAydbG0vET9IiOUtat4bKyE
X-Received: by 2002:a05:6808:5243:b0:4b3:7fa3:890b with SMTP id 5614622812f47-4ccf6a788a9mr11024712b6e.2.1790037928310;
        Mon, 21 Sep 2026 17:45:28 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:45:24 -0600
Subject: [PATCH net-next v5 1/3] net: stmmac: sun8i: reset the MAC after
 PHY initialization
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-h616-emac1-v1-v5-1-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The MAC software reset needs a running receive clock from the PHY.
Resetting the MAC at the end of probe therefore fails when the PHY driver
has not been loaded or its probe has deferred on a missing supplier. The
failure removes the MAC and its MDIO bus, so loading the missing driver
later cannot recover the interface without reprobing the MAC.

Perform the software reset in the DMA reset callback instead. The stmmac
core calls it during hardware setup after attaching and initializing the
PHY, and resumes a suspended PHY before reopening or resuming the MAC.
Mask interrupts before requesting the reset and retain the existing
DMA and interrupt-register clearing even if the reset times out. Return
reset errors through the normal hardware-setup error path.

Remove the unconditional reset from probe. Keep the separate H3 MDIO-mux
reset after switching the mux and powering the selected PHY, since it is
needed to latch the selected interface before MDIO accesses.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 53 +++++++++++------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..9598c386bb21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -269,11 +269,33 @@ static const struct emac_variant emac_variant_h6 = {
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
+static int sun8i_dwmac_reset(void __iomem *ioaddr)
+{
+	u32 v;
+
+	v = readl(ioaddr + EMAC_BASIC_CTL1);
+	writel(v | 0x01, ioaddr + EMAC_BASIC_CTL1);
+
+	/* The timeout was previously set to 10ms, but some board (OrangePI0)
+	 * need more if no cable plugged. 100ms seems OK
+	 */
+	return readl_poll_timeout(ioaddr + EMAC_BASIC_CTL1, v,
+				  !(v & 0x01), 100, 100000);
+}
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
 static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
 {
+	int ret;
+
+	writel(0, ioaddr + EMAC_INT_EN);
+
+	/* The PHY receive clock must be running for the reset to complete. */
+	ret = sun8i_dwmac_reset(ioaddr);
+
+	/* Leave DMA and interrupts disabled even if the reset timed out. */
 	writel(0, ioaddr + EMAC_RX_CTL1);
 	writel(0, ioaddr + EMAC_TX_CTL1);
 	writel(0, ioaddr + EMAC_RX_FRM_FLT);
@@ -281,7 +303,7 @@ static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
 	writel(0, ioaddr + EMAC_TX_DESC_LIST);
 	writel(0, ioaddr + EMAC_INT_EN);
 	writel(0x1FFFFFF, ioaddr + EMAC_INT_STA);
-	return 0;
+	return ret;
 }
 
 /* sun8i_dwmac_dma_init() - initialize the EMAC
@@ -738,27 +760,6 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_TX_FLOW_CTL);
 }
 
-static int sun8i_dwmac_reset(struct stmmac_priv *priv)
-{
-	u32 v;
-	int err;
-
-	v = readl(priv->ioaddr + EMAC_BASIC_CTL1);
-	writel(v | 0x01, priv->ioaddr + EMAC_BASIC_CTL1);
-
-	/* The timeout was previously set to 10ms, but some board (OrangePI0)
-	 * need more if no cable plugged. 100ms seems OK
-	 */
-	err = readl_poll_timeout(priv->ioaddr + EMAC_BASIC_CTL1, v,
-				 !(v & 0x01), 100, 100000);
-
-	if (err) {
-		dev_err(priv->device, "EMAC reset timeout\n");
-		return err;
-	}
-	return 0;
-}
-
 /* Search in mdio-mux node for internal PHY node and get its clk/reset */
 static int get_ephy_nodes(struct stmmac_priv *priv)
 {
@@ -895,7 +896,9 @@ static int mdio_mux_syscon_switch_fn(int current_child, int desired_child,
 		/* After changing syscon value, the MAC need reset or it will
 		 * use the last value (and so the last PHY set).
 		 */
-		ret = sun8i_dwmac_reset(priv);
+		ret = sun8i_dwmac_reset(priv->ioaddr);
+		if (ret)
+			dev_err(priv->device, "EMAC reset timeout\n");
 	}
 	return ret;
 }
@@ -1217,10 +1220,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to register mux\n");
 			goto dwmac_mux;
 		}
-	} else {
-		ret = sun8i_dwmac_reset(priv);
-		if (ret)
-			goto dwmac_remove;
 	}
 
 	pm_runtime_put(&pdev->dev);

-- 
2.53.0

