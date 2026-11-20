Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171545;
	b=C8Xw3I0+jZ+moRYS4BKyH6DdD1fyzP2vqb84IMUhUlzFUN4BJdDVqVe8HUIIhkTrj9Ia
	 SoHTeR2wEYhDGA0rJ0EoDKR8kuDpO2+wqCl/w3JJc7ey6O58CXf5E801SGNFCeVU7MFdl
	 +FQnO7s8f/cS4Ye1iASkSOVLXPOj6YDrnnJJQyhj4Px09i7mdFlqWsn6g4ecaNY6tsIvl
	 ul4hdmYdmzwbPsVMiVpCRsNM6VA+e200pv0VMROyrovvtfFeDhaHmnKp7ekhFeJwR8sM8
	 vaZwEBtyzCIpUJcNQ65CRADfxkR3MofHylIJz50ufdFJx1A6S+/lCj1t9vUhluqjdZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171545;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O0xQaZTBn5x9UU+rls3WdA5nUV1n54cLSo+TPMIvcKk=;
	b=PUzTmXsddI6VBc7aBmrU5wVvoOAxYRxFD0asoMvTRSNpfnugjF+3WHbFNETJ7YvoBa8i
	 ByuEqA61BZVp7bVGoUnTXd7er6a2ir27rfKEFGQ7JLm1jG06IV0xdomLrtdRV+cO+oj/u
	 RCYreVzpNBcyWCtXMIa0tTJF5OgyJSfHS5GD5GcYBqNZH0+EK36EU3rTTf0Uvfv9k4NNn
	 SaXiR244cpGb+AzK2mqemGrO/4/K6zfUwb46TG3iwS3FyPZAYl76LCnt7ghzR82XdCgRO
	 Qq2MwhPoyCppgzZI9651YZGfoaUqxbuGX54I584hAlH3u0jnQ0mbKtq766+KnbXNSog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IKUYBBqk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EF4606A326;
	Fri, 20 Nov 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IKUYBBqk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795171545;
	b=rPMtcY18mSyXe0HpIsitZdoYEcgoh8eXV41ZB5XJFc2HPiVGZYmcc1/NBt3APgHLNTT+
	 pam1S/O6gXqJb6ljZDcYmg5y+pRjM1DdakGN9m4ZP4VNd2PHMiAg7OU9ACgBPSbBwtdVE
	 C2GPRf8XhQgCd9/U/MRy++wxQw4+oSc07ret75dXZVqi0t7ouzBKmkttCyBFk2AV//9bs
	 P3ktIGDB1CAk1COAtbwqY5F8S0yYGXVtaoS9km0EKtDDoV5iESbdxsAiG9XWKreYI6mMy
	 1xbmKnhgc09UJG9ksicEo1KN7z7BtE2ACKjD0jwO17MVaRkFemzY14u2JJvcI1a+Xww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795171545;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O0xQaZTBn5x9UU+rls3WdA5nUV1n54cLSo+TPMIvcKk=;
	b=tKVVu6ZCRihYIaHpZjTQoCg/6G27muz6GrHDyeL6g9kjP1gbqQuHuWjU4uzsUbBgi0/v
	 clQuY0UtxXSlICdGmYUxn6xF+yF5W3AW21H7h+wfiJZ9D+3r2EtNcihCJlQqECriK8nGg
	 afjxfxQ5QM3fl9GLaTkqqFCTSPyPEcdm/jmSCti2HdIo8PH1005EuszhjYxKzrZWQoQ3o
	 FNCrbhLjxyM5mx7YLpHWDIQnQGGhFFFl4DZ++ZlSVm40rJpk5QdT8zEBbqiA2qOkQBBra
	 6znPzte6xCjNiHm0QC+ZZ1kGkEede1NOqz+7FMht0JQzU3vSLhDNLy/BJj9ywBp9bHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C3871F000EE;
	Fri, 20 Nov 2026 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795171545;
	bh=O0xQaZTBn5x9UU+rls3WdA5nUV1n54cLSo+TPMIvcKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IKUYBBqkWM4I2Lf88NFBF+eLoS9fWtvSD27t3gyvKtTtAIAKXeq+eYgECep8rHlMl
	 7dVPuxEVlLCXIIeqBMzlFxZo1m+X8LZGCDSm7T8LTOuhj308lz9RlNYFol1eb9HMo6
	 40nfSBaMhgJbJ+laXkCc9Pgfmbx/Bm9d7Bob8jgJArpML8U25msqfxYkVshCIRbdYK
	 HNrCOdedGdpUpB+CbeDPnELnW2iNQ1uLX8w5KbBsPBNOCUH+YAq9YMgGT8KBCZaxYW
	 yP8ARp9jokfSYDtjUGOV/31/nmnQINTIuWm6zB3TjqbFrxpJfCAjw0ZEbJud2pItGT
	 nq6AMOBL0pWEA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ED04449814;
	Fri, 20 Nov 2026 10:45:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:45:35 +0000
Subject: [PATCH net-next v4 4/5] net: stmmac: Add MDIO init and exit
 platform hooks
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-sun8i-emac-mux-uaf-v4-4-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795171532; l=2066;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3XSU4X4aemzp7oTaCLwDDP9zhzsIxn55nP09waG9ngE=;
 b=LAtqp2wEi3+1K9NUmpn6EgBjdbn9DkZFOCCTWv250cgGR3fC6cRaOLC/yMKVP6uIAW+4BPgFo
 8qkvxVjpZ4lCBbp8exE+nbsmnWOLKQdmVq7q1qFk+fn2eJ0Rz9DoxEC
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A glue driver that adds devices on top of the stmmac MDIO bus, such as
an MDIO mux, can only do so after stmmac_dvr_probe() has registered the
netdev.

Add mdio_init(), called once the bus is registered, and mdio_exit(),
called before it is unregistered.

Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 11 +++++++++++
 include/linux/stmmac.h                            |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 7396b68899c6..fb1f7b1a5323 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -682,8 +682,16 @@ int stmmac_mdio_register(struct net_device *ndev)
 bus_register_done:
 	priv->mii = new_bus;
 
+	if (priv->plat->mdio_init) {
+		err = priv->plat->mdio_init(priv);
+		if (err)
+			goto mdio_init_fail;
+	}
+
 	return 0;
 
+mdio_init_fail:
+	priv->mii = NULL;
 no_phy_found:
 	mdiobus_unregister(new_bus);
 bus_register_fail:
@@ -703,6 +711,9 @@ int stmmac_mdio_unregister(struct net_device *ndev)
 	if (!priv->mii)
 		return 0;
 
+	if (priv->plat->mdio_exit)
+		priv->plat->mdio_exit(priv);
+
 	mdiobus_unregister(priv->mii);
 	priv->mii->priv = NULL;
 	mdiobus_free(priv->mii);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..e94f9cab973d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -296,6 +296,8 @@ struct plat_stmmacenet_data {
 	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
 			   void *ctx);
 	void (*dump_debug_regs)(void *priv);
+	int (*mdio_init)(struct stmmac_priv *priv);
+	void (*mdio_exit)(struct stmmac_priv *priv);
 	int (*pcs_init)(struct stmmac_priv *priv);
 	void (*pcs_exit)(struct stmmac_priv *priv);
 	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,

-- 
2.55.0


