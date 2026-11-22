Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358991;
	b=seM3Sf5EEjzFzm6NvUyZos45sIzop6rsy1Sd65V6z6ZSeGu9jFstBwCkwDOKb83f+70y
	 CkFn7XSNhH/t+Re0aHmwBTGCQ2syBnIiZCOfiECRyQVIWsEpf1Olybu6Frh1mj2mNHDEB
	 yspBT8v2q19I5Q7LA0ErcoxJbswtkWtduGur0O7VHxklZisv4q1SDVi2H+0kGeokUDGB8
	 Xr7GGmNwVc1heOCy+L/2BB3K9uJ9s1qbdm2/fWhvRA/ShTQhWcwMCLk4zcVrpeQR/wtE9
	 d81n09RLvGzCzBv1u9CWeUZi4B1Gp1NfFhDhkCcROEf+yt/gWb5Iw1PH2gM/Eg1cwZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358991;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=D7IyEM1xmU0ttRjHhZmbac+rxu8OBN35sVrm+mJoCRk=;
	b=JTGsGiwwrkhwVC0gwC2Rx+aKkjPfmaqrFTSI+CxH9IfVtAk0thYcOQT4nkbyjbH7TYeq
	 4xyUOmehyyqb+dAmiPZMExpZWnqWeIB1qzzgDbe7BLe6emIRcDI8V6lJdPDnsmVelwzNZ
	 GFuLCl9XXUOQEDoHBAhAUKBO22aTsifU8Jwr7fXHt2+6D+6P6B1MVqtHBXAjBoBZispG1
	 WBrxe4g3TkIskRjD3xW6fQKiIfvyTjAOxJqRQ4uRFnm7QPxkkdqepIQmKmSjqMH5skwqf
	 y90WGeWzVoRzEILygLNapz2zbdjAI3wU+nr3g5NbgwAuEzBbqhkC98SoU2C4y/mG4pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GpGtKWCC;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1172606A687
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 14:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1172606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GpGtKWCC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F2744E416E5;
	Sun, 22 Nov 2026 14:49:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E1D460512;
	Sun, 22 Nov 2026 14:49:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C139A11E60230;
	Sun, 22 Nov 2026 15:49:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795358987; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=D7IyEM1xmU0ttRjHhZmbac+rxu8OBN35sVrm+mJoCRk=;
	b=GpGtKWCCC3MKNfOoI9bnaurUaYqwDrMC0Zhaje4JhlVDcuunKO+frhiuzRN6tbh1rv51QB
	N3cRNRiHcqOzw9JQHYjXb3DFyuZTgKiO2nHJDLD9SuhMH0U0DqDgL0O798PTLbhv5mPiWV
	jxhTtAzYrlDl7Mhuyccnpac5QjlNLP2fyT+r06zaRDRrXga4giDTeLBuuWzGUakrodJpBP
	fj1wUaU5XcRiBFU3oJiDIzptPkQIe9xBnia5O0k7let9FxVAu+fZJAS1uDeKvfO5Gi+20j
	2dmChr5IAJip0AAjdvv0XlTMct7YQSh6+jcoetQjzb3XLj1ltzAMgvkK7uxF5Q==
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
Subject: [PATCH net-next 3/3] net: stmmac: dwmac-sun8i: configure the pause time for TX flow control
Date: Sun, 22 Nov 2026 15:49:25 +0100
Message-ID: <20261122144926.284857-4-maxime.chevallier@bootlin.com>
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

When sending pause frames for flow control, we need to indicate the
number of quantums the peer should wait before sending more frames.

This is maintained in stmmac's "pause_time" global variable (it's a
module param).

Let's program the pause time value, and also allow sending the
zero-quanta pause frame when the peer can resume sending traffic.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 75c743dfe348..613199da57c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -232,6 +232,8 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in EMAC_TX_FLOW_CTL */
 #define EMAC_TX_FLOW_CTL_EN             BIT(0)
+#define EMAC_TX_FLOW_CTL_ZQP_FRM_EN	BIT(1)
+#define EMAC_TX_FLOW_CTL_PAUSE_TIME	GENMASK(19, 4)
 
 /* Used in EMAC_INT_STA */
 #define EMAC_TX_INT             BIT(0)
@@ -784,10 +786,11 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_RX_CTL1);
 
 	v = readl(ioaddr + EMAC_TX_FLOW_CTL);
+	v &= ~(EMAC_TX_FLOW_CTL_EN | EMAC_TX_FLOW_CTL_ZQP_FRM_EN |
+	       EMAC_TX_FLOW_CTL_PAUSE_TIME);
 	if (fc & FLOW_TX)
-		v |= EMAC_TX_FLOW_CTL_EN;
-	else
-		v &= ~EMAC_TX_FLOW_CTL_EN;
+		v |= EMAC_TX_FLOW_CTL_EN | EMAC_TX_FLOW_CTL_ZQP_FRM_EN |
+		     FIELD_PREP(EMAC_TX_FLOW_CTL_PAUSE_TIME, pause_time);
 	writel(v, ioaddr + EMAC_TX_FLOW_CTL);
 }
 
-- 
2.56.1

