Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BF54FD265
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667725; cv=none; b=Nwzyid4cui4nCSCUDuyFyD0hLccmLuB+RvkXK4rFps653BoAqIQWfvFvz2cVfbuat5w80QpgOC58lR0RuZW06WnJLEaYR1GyoaCc32jmNEFRuDBCtH5VhOBaPP59UCob3Ixsw/uqg9/XfIXGoLPqPhlDbUL47ypSlf1vdK35AUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667725; c=relaxed/simple;
	bh=uRyBjqqvSFltweei6Uy/M5gNvkY89BEG9UdA/vDzq/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0siB7KRp/QvN/179uILVmgFL+4ixgXNM6o+dQ2ljlWZLgCbAyqR0iXZe/h+dmzbbiT+1XZxh1TYXZUsJ2sL42+qVjfXv1jrwtVCNllM5y42re+7iB9DlhMvDE57dH28itGl3ywUV2+WwhLmV8DT3Y+q0WpxvCac3FM5sx0w7xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDeFJ0QN; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDeFJ0QN"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd4773so446370fac.2
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667722; x=1790272522; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epD9LhruE07/QoJcSKVg/dbrndAnrXPsihPLPnVDq64=;
        b=pDeFJ0QNA5qm4eCnswI83J9/grvBVwGGmHXm5bdoVHUuJoO0lUrTZS43hnvuFd3NhN
         OGKOFg94rDj5F2MhBSlfp5XS1rcKgrWraRxGz/FbS7PQ+Gnl7FKNTTwPWrwN10e/x7HI
         luEZ8FtqCVm5bhZpS6j9DbHGX5Ck9sW8cNCb7wv/+Y6VVypImnxoZJ6P1InMWtvoCGp7
         ID2VJvOM19k2/nObr55ufJsWw1YXosStK9QFMtPaSHksgdmkGq3s/BO7YTtqlaPErxSn
         gEaJc93TubxdVHYSFTCfvjaCbvU7Ol1Vlm5tcBcOlzH2PZ3MPpFxwcQy3cuZMW8hyxBn
         56Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667722; x=1790272522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epD9LhruE07/QoJcSKVg/dbrndAnrXPsihPLPnVDq64=;
        b=Tqo5dxy/arXQu6ws2VqK9a5Ws598rNoJ16NoSILsAzi8FZV9spsyJ7Vb9jbQ84pviC
         Wtv1gTOvpt6JvSlSxMe/E30sG0br/Ta/y4s61UrFnFOeViu0sY+QVVjSCPbgzPCSmIq0
         2n4F6ugyp2R+b356VpqO6pjzf2QmcuSPtVk0mnwroEHz2iDD73dgW8Ft1Th4yphp7A9G
         WbYVhh9cJla6CUv2PJfroWLv4oE1UhAPqmXC4GE3cj0b2+QyvcnoTzpkkRRGPKpCbGXK
         IaWrmvDNdYTLVPtGvTaecWEv/3XQtLRW1IzVpvGBPFBkfl+mPBM8CLBy8XazCw/5HV5E
         prcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuKY2qOHW3G4umLUKgVKQ5JnzOVFUCWircC3PnEI/9TIv5XmD+x8TRv4X/hjKxtcgukIN/BpgfBBo4kw==@lists.linux.dev
X-Gm-Message-State: AFuF++kZWjar38V6xvi4mQQMNuuJN6avawN6f4jRglje9ih+8lq1UdCa
	EEWPxikDZFTMplNmD+LmTbksX+kG1pi1HBjt2PCPhS3scSR3x2mK+jzu
X-Gm-Gg: AYBFou3W8AU7JNtX5Q8f4VErEjHVIEbOaNuav9fJrJq9OL/3EjR3dSZYJM/g6gu1ZlX
	SXFtxvTYRCqPICf0T1vcBEYku92s5JtgTjpsn/WlRg6OHAbzKoV0XlQMT3z8GFMZjD/GRkKVelz
	LU+cgKq0gLXdMBHJpITDiQpXmB3PZjZHev81OtH2fjn1dgHhweZ4H0dDVC0yTKHqVle75d9catO
	Lao4FzRtlZtNxBFJQIoOrPRtcMwbTK4kji3KOQeqUutnHqMt1DvBMn5ZCrxetTAMuePnyem4pnz
	ktkfO30FAOjtotufOacddwFBP4YMMHh2+RwO3WDBE5M11tZKYZFGf33Z8n/0JIgDm2Lyy0j6UZl
	7ArJk8fyUlt4Z8fOS2/fe2Yx2U2c9ADVZTu+5LV9n+10ae4Qb3UwKcol+t+xKHBBPoJxOwK/AZv
	//70cjy89HU1n3n5iUKy+iBCokGWDyl8y6eh7uMfNs2LfykcpnZkSuwkkagOBSP220g+4+4J3mI
	gIq5zzkzdcydSYEMe+m2JZkbbGSAMss9jj7gDevlKY5NlDc8lEi6GKonaZA43oKUSCiECH2J7qm
	QPm6C09FvAY+9LyibHvJ3ruw+ZTz8h44yayVPVTa7qC23j9Jnr5WvkCj8inWCnd2EwesgPjhrOA
	KtIQ8rzewGmLtZDHGVcBRfiPYPxlPiLQ9
X-Received: by 2002:a05:6870:224b:b0:475:e0a7:9f27 with SMTP id 586e51a60fabf-48476e837dcmr7230581fac.21.1789667722195;
        Thu, 17 Sep 2026 10:55:22 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:12 -0600
Subject: [PATCH net-next v3 1/3] net: stmmac: sun8i: reset the MAC after
 PHY initialization
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-1-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The MAC software reset needs a running receive clock from the PHY.
Resetting the MAC at the end of probe therefore fails when the PHY driver
has not been loaded or its probe has deferred on a missing supplier. The
failure removes the MAC and its MDIO bus, so loading the missing driver
later cannot recover the interface without reprobing the MAC.

Perform the software reset in the DMA reset callback instead. The stmmac
core calls it during hardware setup after attaching and initializing the
PHY, and resumes a suspended PHY before reopening or resuming the MAC.
Keep the existing register clearing after a successful reset and return
reset errors through the normal hardware-setup error path.

Remove the unconditional reset from probe. Keep the separate H3 MDIO-mux
reset after switching the mux and powering the selected PHY, since it is
needed to latch the selected interface before MDIO accesses.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 50 +++++++++++------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..4523a14f5e0c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -269,11 +269,32 @@ static const struct emac_variant emac_variant_h6 = {
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
+	/* The PHY receive clock must be running for the reset to complete. */
+	ret = sun8i_dwmac_reset(ioaddr);
+	if (ret)
+		return ret;
+
 	writel(0, ioaddr + EMAC_RX_CTL1);
 	writel(0, ioaddr + EMAC_TX_CTL1);
 	writel(0, ioaddr + EMAC_RX_FRM_FLT);
@@ -738,27 +759,6 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
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
@@ -895,7 +895,9 @@ static int mdio_mux_syscon_switch_fn(int current_child, int desired_child,
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
@@ -1217,10 +1219,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
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

