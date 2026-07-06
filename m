Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891313FAE1A
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 06:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320104; cv=none; b=Y7I4SeOOlKuKO+aR+pbWjvJAS7KIf5uZvI55q2kTcx6zF9Vb+D3GJ33nSdL5XRLWi/NMqY5Tqsve3ETc4ElhfHzfecSaRFy0Wnwj+7/mQJC+tjJ73WeRt1QrJvlkpPjpGmGKLicDh0MYjNNvCIvDZPNTrb2/kIwET6ulBy2NeaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320104; c=relaxed/simple;
	bh=kDJEEaQFTXZJufscGlSRhnIRKQKulTIu2phXRqHGmM0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mKHq8bilRLdkl860c1LEYWndG+i8szec1G44owxGXVYziNwV5uV225h9AL1+NoaaUj1UaG8+kuQEM5SLx1qf2c+FGQ2dRfnod259ynXIfBgjNaHHhJL8SJ3JAP0xPOv87In/vaQXIaIbBGTIheTElbYebpYayeJ6mLw+UehZ2g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b69ecaaa790511f1aa26b74ffac11d73-20260706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d20ce86f-3bbb-488a-9048-541473a1002f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:a415efcf5264c8eaf3c6ec4dda9f1c01,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b69ecaaa790511f1aa26b74ffac11d73-20260706
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1445086435; Mon, 06 Jul 2026 14:41:27 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: sun6i: Fix physical channel index in interrupt handler
Date: Mon,  6 Jul 2026 14:41:23 +0800
Message-Id: <20260706064123.66035-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt handler iterates over register banks in the outer loop
(i = 0, 1, ...), where each bank covers DMA_IRQ_CHAN_NR (8) channels.
However, the physical channel lookup uses only the inner loop index j,
ignoring the bank offset i.

This means for SoCs with more than 8 DMA channels, interrupts from
physical channels 8 and above are incorrectly routed to physical
channels 0-7. This can falsely complete descriptors for unrelated
channels, potentially causing silent memory corruption.

Fix by using the absolute channel index (i * DMA_IRQ_CHAN_NR + j).

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a6487971ad09..fcc88a74d821 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -559,7 +559,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		writel(status, sdev->base + DMA_IRQ_STAT(i));
 
 		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * DMA_IRQ_CHAN_NR + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {
-- 
2.25.1

