Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4EB4825AF
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Sep 2026 19:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933546; cv=none; b=rr0OfXJziHS8HFLXvg15aJYWUK3vMTZyhBmsQw3+PJIyEsNVZAZsWMOIOmHc8+h+kGYCbF19/qMSUpbzUpYTb9KfID0mGV6d034l3qRR6g7R9rhO/athRkRPMaEmsLoso5B0sOexhjQGifCvixIv62T0CYRqZhA9j5hP5AfxMNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933546; c=relaxed/simple;
	bh=k5FoGW0DAM2X+E/ozmN4JjC/wwwbNR5mhWy/pmNOyns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7Qqt3VbuT8mFVhMeeASekrR4ryw7LH5SzWc66Fe1uD7tlcCusn4u0dwRjEQ0UYvw+8JeSJ9Eururv5fIPJPk5CHi3auqfElUeCD0x6gSRTbL9dOcHWte7jwKsILMsuKCEEO0xycoUPqU1xru1eVS0Ke1Ohk7iFI22PX6irwFCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUMpm+I2; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUMpm+I2"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46a63c34533so2722563fac.1
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Sep 2026 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933542; x=1790538342; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7+d1aoXBtF7Wx/9KwAupq2tjY1ApF1IdNz1vfPutVo=;
        b=HUMpm+I2ucSOQUGeVQvX7md0XcLFuP7wy+GltQEgIwHxLVHVkRRkTPhjdJdK4LqAdW
         ZjB+hYCJBB51K0VzF/KQxnu92bwGRNuov16N8jKdeQEXyw/SFm+sKOadqf9orhLTMuiQ
         U6cez+3cw7pBAMtUIJIfxSaVIfJLfLU9kT4V13Mmcpi/vISvmNcNSMS6ThUkCS6bxGHm
         52pWiE4q3PrCoStdTRgYMRuxD4m6c39cjI0GFa6R0Amfb8IOgXEbVyKkx9PeqgMXa1os
         BpSzboliHD2h5kZK0NzTvTMs03z2/lQfJskb+bwIGmo0NOvFjDXUDDDBqJ/7m8nrwgXe
         dNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933542; x=1790538342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7+d1aoXBtF7Wx/9KwAupq2tjY1ApF1IdNz1vfPutVo=;
        b=oLCsq7Pv47yp36K5787e5nhGTGiNw8oSIMttAtU9rGLnkjgmW06Da42UhrYHLYD9U0
         Emh+LoBtC14JmkRB8HanHNe2yNC/Uo5l+HPgHXq4IRJagrpMd4q5KgTjNyijtDPF7Qm4
         Rpu4NMImef0LynrGxtxDgaUXNR6rg5qE/6zCeM1TuhJSsIMwTQfr9tdjWOYcdKG++qq6
         inpfQtaT5f+G+NtM/kepZtP/n0Y4WtK1KoYXbF+U25V2ps/myW6M0rv4C8Zwc0XIBSvU
         mGQyvyo452lXdHBXjauoWaKv36E6q5SLjlHE2kSOmdZkfyKQWN/17k2aseZRiJso0c1u
         Spsg==
X-Forwarded-Encrypted: i=1; AKwUvBxfz6jEDxCCfIim8wdK1vugAwW6EfjDROU8wTyZFqj/o/jvCrUFn+cuqZKY+JjjsO2RUdgS/3SG26G64Q==@lists.linux.dev
X-Gm-Message-State: AFuF++msh5rV43VuxboB9B9MtKe+jxEc2PUcDEXj/yQ4qlR8kFnruIXp
	VGFnZ9lYl3ypQ9dJF8ysZ3ZMTB6SfFrE1gHwmpzg7r1bpKRLdsu9fHml
X-Gm-Gg: AYBFou1WQay+bLdiBRCXQYWdsapB4XlmsxQ4cZlJF1ciFD7jTqlQv3g/3sAmqjge6a+
	Z0md/8OgTZHH9F4FMcj1HQa5xEcjCHPZ6bM5onOSTsPDnNzkGv3TxXkac7G3gFpx+WjIIFSWk7Z
	8WzKpnrJx8/D31sti0VmX3JKHbRJMi6HNGLhE8/NcpUK96lv+dtYT0FeC6fEbQiKjVA3w6nFnd3
	Q7bECP4f1ubzuEPHdMGKTD9v+Cgie8Jwlslr5R8b3oowOhIl7WFkvUw6x1G1b4+qcICl4oNpYNH
	sLHzSpFQIeBzBAFoAmumxMXmIJtZCQZ5X80NO7y6XoVrTBSaNZh/ws8z8zE+k4Wxt2soUR1IvZC
	WZAQ42mL8H5sLoffv9dRaA4bmoJSTQlyNp0mXvGHRP3DwQ9GEMV1+npkLVFbKvtp78FF4SOlfAy
	vYaKxsj5XEFx3nOO91eX4x4NgiE3AW0vkXoTinGEFg/z+vZufqE/y8+4ZczwUP7rgoS+bYfk9TX
	/b4Mt/Mwhd5+xuVmiq9ccuPqDpObBEhoxUnCjDlAO15WYzFevkhA/u5wJVGyb1ergOYHYPuuo/Y
	qXOZA1E2+/NTobWVJLNvOkUCO7BmKPLsK6aQyVsJlyiGMhtpZlbr3Ka2y3V7B3IOKzZ+0UNFXKT
	9ClRGk1LIETmKzNwcKijy
X-Received: by 2002:a05:6820:1c8f:b0:6cd:3ffc:acf6 with SMTP id 006d021491bc7-6cd3ffcb603mr4885791eaf.70.1789933542612;
        Sun, 20 Sep 2026 12:45:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:28 -0600
Subject: [PATCH net-next v4 2/6] net: stmmac: close the interface after a
 failed MTU reopen
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-2-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

An MTU change stops the data path and then reopens it using a newly
allocated DMA configuration. If reopening fails, the new allocation is
freed while the netdev remains up and priv->dma_conf retains copies of
the freed pointers. A subsequent close repeats NAPI disable and IRQ and
DMA-resource teardown. It can hang in napi_disable() or access resources
which have already been freed.

Track successful opens of the data path separately from the netdev's
administrative state. Clear that state when releasing the data path and
skip a second release after a failed reopen. Close the netdev through the
network core on the MTU error path, so the PHY attachment and runtime-PM
reference are released and the interface is marked down. A subsequent
open can then allocate fresh resources and retry normally.

Keep successful MTU changes on the existing path, retaining the PHY
attachment and runtime-PM reference. Allocation failures before stopping
the original data path still leave the running interface unchanged.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..363872ff00d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -281,6 +281,8 @@ struct stmmac_priv {
 	struct mutex lock;
 
 	struct stmmac_dma_conf dma_conf;
+	/* Paired __stmmac_open()/__stmmac_release(), serialized by RTNL. */
+	bool opened;
 
 	/* Generic channel for NAPI */
 	struct stmmac_channel channel[STMMAC_CH_MAX];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bf9e7e4cb1c3..89b773370894 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4212,6 +4212,7 @@ static int __stmmac_open(struct net_device *dev,
 	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
+	priv->opened = true;
 
 	return 0;
 
@@ -4287,6 +4288,11 @@ static void __stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
 
+	/* A failed MTU reopen has already released the data path. */
+	if (!priv->opened)
+		return;
+	priv->opened = false;
+
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
@@ -6212,6 +6218,10 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 		if (ret) {
 			free_dma_desc_resources(priv, dma_conf);
 			kfree(dma_conf);
+			/* Finish closing the PHY and PM state, but do not repeat
+			 * the data-path teardown after the failed reopen.
+			 */
+			netif_close(dev);
 			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
 			return ret;
 		}

-- 
2.53.0

