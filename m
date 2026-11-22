Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358987;
	b=mRjtAv2Xy9n4qU22k5RoRyrBJ6BQ5+WOu26qDqmI2NFmAhUwoXczov/15x2oIq3eELEM
	 6+8m4SGkHf7HAbNBPSoe7r6hFAvmZF0zc7J2Vknr6x2FJXm+uvATP1FWycBf4bC9S9kku
	 vOkUkrXM7f6CxpY4mPWhLr0dtGM74ujgvLz4yEOgSk30N+2DsWBuHLl8+OSQi7VEf/6g8
	 lR1jWtdEKxiz777SO1HNoqtpMoMTN+IzhtJ76UDbncaJ1D7fs34X5hvbh6EuMnUoPv4Oe
	 EPJy79LIJcEgLsmGUayUcBSR1jdVLzMoZPm9mu7xzLPnUYiMruxtCnWt5lcqVUALw8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358987;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=utK4M7GE/JevjSpCvIwudXzUWEsfoW3c/fssQAD0hxo=;
	b=MQXUx4eTOQ5mwPtFdZ2DR/0xEFIWbE63Rpts5drOm3rBDL0R5/ypAL5RIGpn+ejt5NXq
	 nQB+hVyOEAPqGUVVqf2U0ovi46e4cXU0vsm2BVDUDCkDLWogMHNEwzGVFf+2nxfecRZU+
	 BvekkRn46bB4wAl7YNyGlALgUuUjWaA6AU/7Rks/xrRZkYjIThFMlVkbHYL84pqVi0gwc
	 p8JXHmh3mBuNY2EemrVrtLAUGe3RRGwIGfbC7vOmJy7fAAHIkOOdZzw9yulE+JYZ7SXcg
	 IOl5FTbjAc5uLby3o8qFWcIa1P0JRntSKjAo7baXi0giD7QXe9Fl892QcLLBfvILRGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pf3fP81J;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322F8606A68C
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 14:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 322F8606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pf3fP81J
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 68700C6223F;
	Sun, 22 Nov 2026 14:49:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC9A460512;
	Sun, 22 Nov 2026 14:49:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58F5711E623B4;
	Sun, 22 Nov 2026 15:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795358982; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=utK4M7GE/JevjSpCvIwudXzUWEsfoW3c/fssQAD0hxo=;
	b=Pf3fP81JIlkMcHt1EYgMaHvhSnQSV9lrWuFWvJMp7dZTp0VfwGfllF4N9Hj79xMB6L2zN1
	SMNsmjRvsaWV503SF2L2pGr+0HHSMdm9nFztbXy0R+glKThJ3cpRr9LeNxaF07M/Rxiagm
	xABKvek67OsW7AwDZZyrvbQ4HhvTSvd8DtshhFpaPk6KZafsikDiZSyk5MPPtY5akAL3dx
	w7lBD278dFg11+ppOGQKTWF4hTk/Xwh2yH6jQJsAG8gTJvW5PmBdrt9y8s3YyxrHLMEYPf
	fISLAOhRSL8tUxkUfMeVEPPxtVr6jI+zIWv8uzlBmHFmaRjSWNBTlSLsx/l1/A==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH net-next 1/3] net: stmmac: dwmac-sun8i: allow controlling TX and RX flow control separately
Date: Sun, 22 Nov 2026 15:49:23 +0100
Message-ID: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Currently, the sun8i flow control setup only looks at FLOW_AUTO (which
is FLOW_RX | FLOW_TX), and enables RX/TX based on that.

Allow enabling RX/TX flow control directions separately.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..c63f4d87de50 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -760,14 +760,14 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 	u32 v;
 
 	v = readl(ioaddr + EMAC_RX_CTL0);
-	if (fc == FLOW_AUTO)
+	if (fc & FLOW_RX)
 		v |= EMAC_RX_FLOW_CTL_EN;
 	else
 		v &= ~EMAC_RX_FLOW_CTL_EN;
 	writel(v, ioaddr + EMAC_RX_CTL0);
 
 	v = readl(ioaddr + EMAC_TX_FLOW_CTL);
-	if (fc == FLOW_AUTO)
+	if (fc & FLOW_TX)
 		v |= EMAC_TX_FLOW_CTL_EN;
 	else
 		v &= ~EMAC_TX_FLOW_CTL_EN;
-- 
2.56.1

