Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE329CA
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Jan 2022 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1641720083;
	bh=W2wGwGI2QI1hezY6c64FF7qg4pmWbhpHaIejGat3Vuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DLWGNNRTmXRPEfJTPM//hTnU34ZUk7wkAXXVHkPoC4xuiltoYNIy5k/xgq/jpjv/Y
	 pnbHc6mssL7T849try8KPbxYtuD/HJvSIi/+2HjFs9NGs1IecMidvcPPc6GGPr19dv
	 ffEtlVNuZCWOtJOUwi71t6r3UMMGv8E6yyucnL/Q=
Received: from fedora.. ([119.32.47.91])
	by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
	id 478B260E; Sun, 09 Jan 2022 17:17:56 +0800
X-QQ-mid: xmsmtpt1641719876t070ra9p8
Message-ID: <tencent_E4BA4D6105A46CCC1E8AEF48057EA5FE5B08@qq.com>
X-QQ-XMAILINFO: MPRquJFDOUjChDTk+Iqg40UlgaKBl/rI6l3PPJ5O7/mHcV975OP5TS4101i2wK
	 adN1LKx9xGUA1nKuvIh7/+bZZaD1FamElj8KAtMmgQ5zuqG6pwSMhbmU+Vo85e85z1/Wq0SmnQO/
	 oEEHGLtcmOZ6lOqe9Qhl6V3rM7QQI3LKCHyx+Ftack7RvZ55TY/wetGcRQ/nYOH1ZOOeTsTcmGFK
	 QAYFseVVRnDC+fhMCXtQkMVryw7YsRQpwNTg/jwWR0zNT0OmGZGRItHm6G4LpePuAX9Z7bnrRaBt
	 xwjfW1JR3RzmQLNuoi0XThCRYZqeRdqv7ntgLng6mxX1CdH1nuim9pu5dC+ERgYSpgbKZtNehVUb
	 9jTap+wEEBKfXVEU6lfB1DgFIPfyw/BMDzEYcmveeFnMXugeCtk9Bd0tF/I80BeKl1F+3ykHYbDC
	 dOO4wIxCAjFgK0kwqkpt72GO3TpugiZcAaDHs4J5tN2zgdvjMLE63vvGgwYRje1dxsZJjVlU52Dz
	 Mu9x1SfVQIR9TgG/5PNd9hyONDMC9AUfqTYE4uRBp5+T0MyQtY2BpnHKAzStDH5JHMM949ycpFKf
	 x1BqbNVU20BEABA6CAPuiBY3DoBNOgL84M1pzj66WaGVWa0JqBzoFXdDWoE9AkL5VtvRws2NueMc
	 Nr5gabte2s4B4dQhu7DGwD6SDpxg4ns28miOrrisddeuKQ4m0L2C4Vsazmnm5blhXPcz/yPlyfqq
	 5S+i0xjpz1gwfRuaPNqhQn1l2Fzj7oF6lW1K4qDoNQxiFVCF//Bxr6yoI/Sz3BnIneNr8rJ7comW
	 +dJdSha0YzfrrFuR8dJ3oGZjsFFKSu2wBSVnKvwPKI/G2BeehmNt5vIjgL0Ll+vQgAFutdpKAr3E
	 we9w7/rrD2fWaOWbCsRkE1TN+deMCg7lLFITDj5qw0P4WjgXV7oss=
From: conleylee@foxmail.com
To: clabbe.montjoie@gmail.com
Cc: davem@davemloft.net,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	conley <conleylee@foxmail.com>
Subject: [PATCH v1] sun4i-emac.c: enable emac tx dma
Date: Sun,  9 Jan 2022 17:17:55 +0800
X-OQ-MSGID: <20220109091755.2093277-1-conleylee@foxmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YdLhQjUTobcLq73j@Red>
References: <YdLhQjUTobcLq73j@Red>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: conley <conleylee@foxmail.com>

Hello
I am reading the R40 user manual and trying to create a new path to enable
emac tx dma channel. According to the figure 8-21(TX Operation Diagram),
I try to enable emac tx dma channel by the follow steps:
1. enable tx dma mode
2. set packet lengths
2. move data from skb to tx fifo by using dma in xmit function.
3. start transfer from tx fifo to phy in dma tx done callback

But it doesn't work. emac tx interrupt and dma finished interrupt are
raised, but no packets are transmitted (I test it by tcpdump).
Do you know how to configure the emac tx dma correctly? Thanks ~

Signed-off-by: conley <conleylee@foxmail.com>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 324 +++++++++++++-------
 drivers/net/ethernet/allwinner/sun4i-emac.h |  14 +
 2 files changed, 221 insertions(+), 117 deletions(-)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 964227e342ee..fcd7848f64a0 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -80,6 +80,7 @@ struct emac_board_info {
 	u16			tx_fifo_stat;
 
 	int			emacrx_completed_flag;
+	int 			emactx_completed_flag;
 
 	struct device_node	*phy_node;
 	unsigned int		link;
@@ -88,15 +89,20 @@ struct emac_board_info {
 
 	phy_interface_t		phy_interface;
 	struct dma_chan	*rx_chan;
+	struct dma_chan	*tx_chan;
 	phys_addr_t emac_rx_fifo;
+	phys_addr_t emac_tx_fifo;
 };
 
 struct emac_dma_req {
 	struct emac_board_info *db;
-	struct dma_async_tx_descriptor *desc;
+	struct dma_chan *chan;
 	struct sk_buff *skb;
-	dma_addr_t rxbuf;
+	void* buf;
+	dma_addr_t mapped_buf;
 	int count;
+	enum dma_data_direction dir;
+	int channel; // for tx
 };
 
 static void emac_update_speed(struct net_device *dev)
@@ -218,8 +224,9 @@ static void emac_inblk_32bit(void __iomem *reg, void *data, int count)
 
 static struct emac_dma_req *
 emac_alloc_dma_req(struct emac_board_info *db,
-		   struct dma_async_tx_descriptor *desc, struct sk_buff *skb,
-		   dma_addr_t rxbuf, int count)
+		struct dma_chan* chan,
+		struct sk_buff *skb, void* buf,
+		dma_addr_t mapped_buf, int count, int channel)
 {
 	struct emac_dma_req *req;
 
@@ -228,9 +235,10 @@ emac_alloc_dma_req(struct emac_board_info *db,
 		return NULL;
 
 	req->db = db;
-	req->desc = desc;
+	req->chan = chan;
 	req->skb = skb;
-	req->rxbuf = rxbuf;
+	req->buf = buf;
+	req->mapped_buf = mapped_buf;
 	req->count = count;
 	return req;
 }
@@ -240,22 +248,22 @@ static void emac_free_dma_req(struct emac_dma_req *req)
 	kfree(req);
 }
 
-static void emac_dma_done_callback(void *arg)
+static void emac_dma_rx_done_callback(void *arg)
 {
 	struct emac_dma_req *req = arg;
 	struct emac_board_info *db = req->db;
 	struct sk_buff *skb = req->skb;
-	struct net_device *dev = db->ndev;
+	struct net_device *ndev = db->ndev;
 	int rxlen = req->count;
 	u32 reg_val;
 
-	dma_unmap_single(db->dev, req->rxbuf, rxlen, DMA_FROM_DEVICE);
+	dma_unmap_single(db->dev, req->mapped_buf, rxlen, DMA_FROM_DEVICE);
 
-	skb->protocol = eth_type_trans(skb, dev);
+	skb->protocol = eth_type_trans(skb, ndev);
 	netif_rx(skb);
-	dev->stats.rx_bytes += rxlen;
+	ndev->stats.rx_bytes += rxlen;
 	/* Pass to upper layer */
-	dev->stats.rx_packets++;
+	ndev->stats.rx_packets++;
 
 	/* re enable cpu receive */
 	reg_val = readl(db->membase + EMAC_RX_CTL_REG);
@@ -264,48 +272,92 @@ static void emac_dma_done_callback(void *arg)
 
 	/* re enable interrupt */
 	reg_val = readl(db->membase + EMAC_INT_CTL_REG);
-	reg_val |= (0x01 << 8);
+	reg_val |= EMAC_INT_CTL_RX_EN;
 	writel(reg_val, db->membase + EMAC_INT_CTL_REG);
 
 	db->emacrx_completed_flag = 1;
 	emac_free_dma_req(req);
 }
 
-static int emac_dma_inblk_32bit(struct emac_board_info *db,
-		struct sk_buff *skb, void *rdptr, int count)
+
+static void emac_transfer_to_phy(struct emac_board_info* db, int channel)
+{
+	u32 reg = channel == 0 ? EMAC_TX_CTL0_REG : EMAC_TX_CTL1_REG;
+	writel(readl(db->membase + reg) | 1, db->membase + reg);
+	netif_trans_update(db->ndev);
+}
+
+
+static void emac_dma_tx_done_callback(void* arg)
+{
+	struct emac_dma_req *req = arg;
+	struct emac_board_info *db = req->db;
+	struct sk_buff *skb = req->skb;
+
+	emac_transfer_to_phy(db, req->channel);
+	dev_consume_skb_any(skb);
+
+	db->emactx_completed_flag = 1;
+	dev_info(db->dev, "emac xmit with dma done: channel = %d, len = %d\n", req->channel, req->count);
+	
+	emac_free_dma_req(req);
+}
+
+static int emac_dma_submit_request(
+		struct emac_board_info *db,
+		struct sk_buff *skb, void *buf,
+		int count, enum dma_transfer_direction dir,
+		int channel)
 {
+	int ret = 0;
 	struct dma_async_tx_descriptor *desc;
 	dma_cookie_t cookie;
-	dma_addr_t rxbuf;
+	dma_addr_t mapped_buf;
+	enum dma_data_direction data_dir;
+	struct dma_chan *chan;
 	struct emac_dma_req *req;
-	int ret = 0;
+	dma_async_tx_callback callback;
+	
+	if (dir == DMA_DEV_TO_MEM){
+		data_dir = DMA_FROM_DEVICE;
+		chan = db->rx_chan;
+		callback = emac_dma_rx_done_callback;
+	}else if (dir == DMA_MEM_TO_DEV){
+		data_dir = DMA_TO_DEVICE;
+		chan = db->tx_chan;
+		callback = emac_dma_tx_done_callback;
+	}else{
+		dev_err(db->dev, "emac dma transfer direction must be"
+				"DMA_FROM_DEVICE or DMA_TO_DEVICE\n");
+		return -EINVAL;
+	}
 
-	rxbuf = dma_map_single(db->dev, rdptr, count, DMA_FROM_DEVICE);
-	ret = dma_mapping_error(db->dev, rxbuf);
-	if (ret) {
-		dev_err(db->dev, "dma mapping error.\n");
+	mapped_buf = dma_map_single(db->dev, buf, count, data_dir);
+	ret = dma_mapping_error(db->dev, mapped_buf);
+	if (ret){
+		dev_err(db->dev, "dma mapping error\n");
 		return ret;
+	}	
+	
+	req = emac_alloc_dma_req(db, chan, skb, buf, mapped_buf, count, channel);
+	if (!req) {
+		dev_err(db->dev, "alloc emac dma req error.\n");
+		ret = -ENOMEM;
+		goto alloc_req_err;
 	}
 
-	desc = dmaengine_prep_slave_single(db->rx_chan, rxbuf, count,
-					   DMA_DEV_TO_MEM,
-					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	desc = dmaengine_prep_slave_single(chan, mapped_buf, count, dir,
+						DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+
 	if (!desc) {
 		dev_err(db->dev, "prepare slave single failed\n");
 		ret = -ENOMEM;
 		goto prepare_err;
 	}
 
-	req = emac_alloc_dma_req(db, desc, skb, rxbuf, count);
-	if (!req) {
-		dev_err(db->dev, "alloc emac dma req error.\n");
-		ret = -ENOMEM;
-		goto alloc_req_err;
-	}
-
 	desc->callback_param = req;
-	desc->callback = emac_dma_done_callback;
-
+	desc->callback = callback;
+	
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
 	if (ret) {
@@ -313,20 +365,31 @@ static int emac_dma_inblk_32bit(struct emac_board_info *db,
 		goto submit_err;
 	}
 
-	dma_async_issue_pending(db->rx_chan);
+	dma_async_issue_pending(chan);
 	return ret;
 
 submit_err:
-	emac_free_dma_req(req);
-
-alloc_req_err:
 	dmaengine_desc_free(desc);
 
 prepare_err:
-	dma_unmap_single(db->dev, rxbuf, count, DMA_FROM_DEVICE);
+	dma_unmap_single(db->dev, req->mapped_buf, req->count, req->dir);
+
+alloc_req_err:
+	emac_free_dma_req(req);
 	return ret;
 }
 
+static int emac_dma_inblk_32bit(struct emac_board_info *db,
+		struct sk_buff *skb, void *rdptr, int count)
+{
+	return emac_dma_submit_request(db, skb, rdptr, count, DMA_DEV_TO_MEM, -1);
+}
+
+static int emac_dma_outblk_32bit(struct emac_board_info *db, struct sk_buff *skb, int channel)
+{
+	return emac_dma_submit_request(db, skb, skb->data, skb->len, DMA_MEM_TO_DEV, channel);
+}
+
 /* ethtool ops */
 static void emac_get_drvinfo(struct net_device *dev,
 			      struct ethtool_drvinfo *info)
@@ -506,7 +569,7 @@ static void emac_init_device(struct net_device *dev)
 
 	/* enable RX/TX0/RX Hlevel interrup */
 	reg_val = readl(db->membase + EMAC_INT_CTL_REG);
-	reg_val |= (0xf << 0) | (0x01 << 8);
+	reg_val |= (EMAC_INT_CTL_TX_EN | EMAC_INT_CTL_TX_ABRT_EN | EMAC_INT_CTL_RX_EN);
 	writel(reg_val, db->membase + EMAC_INT_CTL_REG);
 
 	spin_unlock_irqrestore(&db->lock, flags);
@@ -535,6 +598,13 @@ static void emac_timeout(struct net_device *dev, unsigned int txqueue)
 	spin_unlock_irqrestore(&db->lock, flags);
 }
 
+static void emac_set_packet_len(struct emac_board_info* db, int channel, int len)
+{
+	u32 reg = channel == 0 ? EMAC_TX_PL0_REG : EMAC_TX_PL1_REG;
+	/* set TX len */
+	writel(len, db->membase + reg);
+}
+
 /* Hardware start transmission.
  * Send a packet to media from the upper layer.
  */
@@ -543,9 +613,11 @@ static netdev_tx_t emac_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct emac_board_info *db = netdev_priv(dev);
 	unsigned long channel;
 	unsigned long flags;
+	u32 reg_val;
+	int len = skb->len;
 
 	channel = db->tx_fifo_stat & 3;
-	if (channel == 3)
+	if (channel == 3 || !db->emactx_completed_flag)
 		return NETDEV_TX_BUSY;
 
 	channel = (channel == 1 ? 1 : 0);
@@ -553,32 +625,27 @@ static netdev_tx_t emac_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	spin_lock_irqsave(&db->lock, flags);
 
 	writel(channel, db->membase + EMAC_TX_INS_REG);
+	
+	emac_set_packet_len(db, channel, len);
+
+	if (db->tx_chan){
+		reg_val = readl(db->membase + EMAC_TX_MODE_REG);
+		writel(reg_val | EMAC_TX_MODE_DMA_EN, db->membase + EMAC_TX_MODE_REG);
+		emac_dma_outblk_32bit(db, skb, channel);
+		db->emactx_completed_flag = 0;
+		dev_info(db->dev, "xmit with dma: channel = %lu, len = %d\n", channel, len);
+	}else{
+		reg_val = readl(db->membase + EMAC_TX_MODE_REG);
+		writel(reg_val & ~EMAC_TX_MODE_DMA_EN, db->membase + EMAC_TX_MODE_REG);
+		emac_outblk_32bit(db->membase + EMAC_TX_IO_DATA_REG, skb->data, len);
+
+		emac_transfer_to_phy(db, channel);
+		/* free this SKB */
+		dev_consume_skb_any(skb);
+	}
 
-	emac_outblk_32bit(db->membase + EMAC_TX_IO_DATA_REG,
-			skb->data, skb->len);
-	dev->stats.tx_bytes += skb->len;
-
+	dev->stats.tx_bytes += len;
 	db->tx_fifo_stat |= 1 << channel;
-	/* TX control: First packet immediately send, second packet queue */
-	if (channel == 0) {
-		/* set TX len */
-		writel(skb->len, db->membase + EMAC_TX_PL0_REG);
-		/* start translate from fifo to phy */
-		writel(readl(db->membase + EMAC_TX_CTL0_REG) | 1,
-		       db->membase + EMAC_TX_CTL0_REG);
-
-		/* save the time stamp */
-		netif_trans_update(dev);
-	} else if (channel == 1) {
-		/* set TX len */
-		writel(skb->len, db->membase + EMAC_TX_PL1_REG);
-		/* start translate from fifo to phy */
-		writel(readl(db->membase + EMAC_TX_CTL1_REG) | 1,
-		       db->membase + EMAC_TX_CTL1_REG);
-
-		/* save the time stamp */
-		netif_trans_update(dev);
-	}
 
 	if ((db->tx_fifo_stat & 3) == 3) {
 		/* Second packet */
@@ -587,9 +654,6 @@ static netdev_tx_t emac_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	spin_unlock_irqrestore(&db->lock, flags);
 
-	/* free this SKB */
-	dev_consume_skb_any(skb);
-
 	return NETDEV_TX_OK;
 }
 
@@ -637,7 +701,7 @@ static void emac_rx(struct net_device *dev)
 		if (!rxcount) {
 			db->emacrx_completed_flag = 1;
 			reg_val = readl(db->membase + EMAC_INT_CTL_REG);
-			reg_val |= (0xf << 0) | (0x01 << 8);
+			reg_val |= (EMAC_INT_CTL_TX_EN | EMAC_INT_CTL_TX_ABRT_EN | EMAC_INT_CTL_RX_EN);
 			writel(reg_val, db->membase + EMAC_INT_CTL_REG);
 
 			/* had one stuck? */
@@ -669,7 +733,7 @@ static void emac_rx(struct net_device *dev)
 			writel(reg_val | EMAC_CTL_RX_EN,
 			       db->membase + EMAC_CTL_REG);
 			reg_val = readl(db->membase + EMAC_INT_CTL_REG);
-			reg_val |= (0xf << 0) | (0x01 << 8);
+			reg_val |= (EMAC_INT_CTL_TX_EN | EMAC_INT_CTL_TX_ABRT_EN | EMAC_INT_CTL_RX_EN);
 			writel(reg_val, db->membase + EMAC_INT_CTL_REG);
 
 			db->emacrx_completed_flag = 1;
@@ -753,14 +817,14 @@ static void emac_rx(struct net_device *dev)
 }
 
 static irqreturn_t emac_interrupt(int irq, void *dev_id)
-{
+{	
 	struct net_device *dev = dev_id;
 	struct emac_board_info *db = netdev_priv(dev);
 	int int_status;
 	unsigned int reg_val;
 
 	/* A real interrupt coming */
-
+	
 	spin_lock(&db->lock);
 
 	/* Disable all interrupts */
@@ -776,27 +840,29 @@ static irqreturn_t emac_interrupt(int irq, void *dev_id)
 		dev_dbg(db->dev, "emac interrupt %02x\n", int_status);
 
 	/* Received the coming packet */
-	if ((int_status & 0x100) && (db->emacrx_completed_flag == 1)) {
+	if ((int_status & EMAC_INT_STA_RX_COMPLETE) && (db->emacrx_completed_flag == 1)) {
 		/* carrier lost */
 		db->emacrx_completed_flag = 0;
 		emac_rx(dev);
 	}
 
 	/* Transmit Interrupt check */
-	if (int_status & (0x01 | 0x02))
+	if (int_status & EMAC_INT_STA_TX_COMPLETE){
+		dev_info(db->dev, "emac tx interrupt, int_status = 0x%x\n", int_status);
 		emac_tx_done(dev, db, int_status);
+	}
 
-	if (int_status & (0x04 | 0x08))
+	if (int_status & EMAC_INT_STA_TX_ABRT)
 		netdev_info(dev, " ab : %x\n", int_status);
 
 	/* Re-enable interrupt mask */
 	if (db->emacrx_completed_flag == 1) {
 		reg_val = readl(db->membase + EMAC_INT_CTL_REG);
-		reg_val |= (0xf << 0) | (0x01 << 8);
+		reg_val |= (EMAC_INT_CTL_TX_EN | EMAC_INT_CTL_TX_ABRT_EN | EMAC_INT_CTL_RX_EN);
 		writel(reg_val, db->membase + EMAC_INT_CTL_REG);
 	} else {
 		reg_val = readl(db->membase + EMAC_INT_CTL_REG);
-		reg_val |= (0xf << 0);
+		reg_val |= (EMAC_INT_CTL_TX_EN | EMAC_INT_CTL_TX_ABRT_EN);
 		writel(reg_val, db->membase + EMAC_INT_CTL_REG);
 	}
 
@@ -904,56 +970,75 @@ static const struct net_device_ops emac_netdev_ops = {
 #endif
 };
 
-static int emac_configure_dma(struct emac_board_info *db)
+static int emac_configure_dma_channel(
+				struct device *dev,
+				const char *name,
+				phys_addr_t const fifo,
+				struct dma_chan **chan)
+{
+	int ret = 0;
+	struct dma_slave_config conf = {
+		.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES,
+		.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES,
+		.dst_maxburst = 4,
+		.src_maxburst = 4,
+		.device_fc = false
+	};
+
+	if (!strcmp(name, "rx")){
+		conf.direction = DMA_DEV_TO_MEM;
+		conf.src_addr = fifo;
+	} else if (!strcmp(name, "tx")) {
+		conf.direction = DMA_MEM_TO_DEV;
+		conf.dst_addr = fifo;
+	} else {
+		dev_err(dev, "emac dma channel must be rx or tx\n");
+		return -EINVAL;
+	}
+
+	*chan = dma_request_chan(dev, name);
+	ret = IS_ERR(*chan);
+	if (ret){
+		dev_err(dev, "request dma channel %s failed, ret = %d."
+				" dma %s channel is disabled\n", name, ret, name);
+		*chan = NULL;
+		return ret;
+	}
+
+	ret = dmaengine_slave_config(*chan, &conf);
+	if (ret) {
+		dev_err(dev, "config %s dma slave failed, ret = %d."
+				" dma %s channel is disabled\n", name, ret, name);
+		dma_release_channel(*chan);
+		*chan = NULL;
+	}
+
+	return ret;
+}
+
+static void emac_configure_dma(struct emac_board_info *db)
 {
 	struct platform_device *pdev = db->pdev;
-	struct net_device *ndev = db->ndev;
-	struct dma_slave_config conf = {};
+	struct device* dev = db->dev;
 	struct resource *regs;
-	int err = 0;
+
+	db->rx_chan = NULL;
+	db->tx_chan = NULL;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!regs) {
-		netdev_err(ndev, "get io resource from device failed.\n");
-		err = -ENOMEM;
-		goto out_clear_chan;
+		dev_err(dev, "get io resource from device failed.\n");
+		return;
 	}
 
-	netdev_info(ndev, "get io resource from device: 0x%x, size = %u\n",
+	dev_info(dev, "get io resource from device: 0x%x, size = %u\n",
 		    regs->start, resource_size(regs));
-	db->emac_rx_fifo = regs->start + EMAC_RX_IO_DATA_REG;
-
-	db->rx_chan = dma_request_chan(&pdev->dev, "rx");
-	if (IS_ERR(db->rx_chan)) {
-		netdev_err(ndev,
-			   "failed to request dma channel. dma is disabled\n");
-		err = PTR_ERR(db->rx_chan);
-		goto out_clear_chan;
-	}
-
-	conf.direction = DMA_DEV_TO_MEM;
-	conf.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	conf.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	conf.src_addr = db->emac_rx_fifo;
-	conf.dst_maxburst = 4;
-	conf.src_maxburst = 4;
-	conf.device_fc = false;
-
-	err = dmaengine_slave_config(db->rx_chan, &conf);
-	if (err) {
-		netdev_err(ndev, "config dma slave failed\n");
-		err = -EINVAL;
-		goto out_slave_configure_err;
-	}
 
-	return err;
-
-out_slave_configure_err:
-	dma_release_channel(db->rx_chan);
+	db->emac_rx_fifo = regs->start + EMAC_RX_IO_DATA_REG;
+	db->emac_tx_fifo = regs->start + EMAC_TX_IO_DATA_REG;
 
-out_clear_chan:
-	db->rx_chan = NULL;
-	return err;
+	emac_configure_dma_channel(dev, "rx", db->emac_rx_fifo, &db->rx_chan);
+	emac_configure_dma_channel(dev, "tx", db->emac_tx_fifo, &db->tx_chan);
 }
 
 /* Search EMAC board, allocate space and register it
@@ -998,8 +1083,7 @@ static int emac_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
 
-	if (emac_configure_dma(db))
-		netdev_info(ndev, "configure dma failed. disable dma.\n");
+	emac_configure_dma(db);
 
 	db->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(db->clk)) {
@@ -1038,6 +1122,7 @@ static int emac_probe(struct platform_device *pdev)
 	}
 
 	db->emacrx_completed_flag = 1;
+	db->emactx_completed_flag = 1;
 	emac_powerup(ndev);
 	emac_reset(db);
 
@@ -1088,6 +1173,11 @@ static int emac_remove(struct platform_device *pdev)
 		dma_release_channel(db->rx_chan);
 	}
 
+	if (db->tx_chan){
+		dmaengine_terminate_all(db->tx_chan);
+		dma_release_channel(db->tx_chan);
+	}
+
 	unregister_netdev(ndev);
 	sunxi_sram_release(&pdev->dev);
 	clk_disable_unprepare(db->clk);
diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.h b/drivers/net/ethernet/allwinner/sun4i-emac.h
index 38c72d9ec600..14914110d9b0 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.h
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.h
@@ -61,7 +61,21 @@
 #define EMAC_RX_IO_DATA_STATUS_OK	(1 << 7)
 #define EMAC_RX_FBC_REG		(0x50)
 #define EMAC_INT_CTL_REG	(0x54)
+#define EMAC_INT_CTL_RX_EN	(1 << 8)
+#define EMAC_INT_CTL_TX0_EN	(1)
+#define EMAC_INT_CTL_TX1_EN	(1 << 1)
+#define EMAC_INT_CTL_TX_EN	(EMAC_INT_CTL_TX0_EN | EMAC_INT_CTL_TX1_EN)
+#define EMAC_INT_CTL_TX0_ABRT_EN	(0x1 << 2)
+#define EMAC_INT_CTL_TX1_ABRT_EN	(0x1 << 3)
+#define EMAC_INT_CTL_TX_ABRT_EN	(EMAC_INT_CTL_TX0_ABRT_EN | EMAC_INT_CTL_TX1_ABRT_EN)
 #define EMAC_INT_STA_REG	(0x58)
+#define EMAC_INT_STA_TX0_COMPLETE	(0x1)
+#define EMAC_INT_STA_TX1_COMPLETE	(0x1 << 1)
+#define EMAC_INT_STA_TX_COMPLETE	(EMAC_INT_STA_TX0_COMPLETE | EMAC_INT_STA_TX1_COMPLETE)
+#define EMAC_INT_STA_TX0_ABRT	(0x1 << 2)
+#define EMAC_INT_STA_TX1_ABRT	(0x1 << 3)
+#define EMAC_INT_STA_TX_ABRT	(EMAC_INT_STA_TX0_ABRT | EMAC_INT_STA_TX1_ABRT)
+#define EMAC_INT_STA_RX_COMPLETE	(0x1 << 8)
 #define EMAC_MAC_CTL0_REG	(0x5c)
 #define EMAC_MAC_CTL0_RX_FLOW_CTL_EN	(1 << 2)
 #define EMAC_MAC_CTL0_TX_FLOW_CTL_EN	(1 << 3)
-- 
2.31.1

