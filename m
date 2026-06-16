Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891A3093B5
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Jun 2026 06:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781589903; cv=none; b=aANtOpZ55QX9bv16ezwrIPPdHGqOSM0NG9Z3NbbFL9y//ydSfMXgGxR+dcMiNpk/voRoLeI6+J0JtauDNbV9PMQ5Vk8vd0DgiRzlNXGi5Z3jFSHI2Xc7Yk9csD1qM4SRFepf84QxsMSRbcO7Fs808j4NKEiSk4NE+5YGuxb/z9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781589903; c=relaxed/simple;
	bh=EJYxFV26UgIohNCX98r/zv4iSx9WwinKKVrDv7Loo7k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rerv/SjYYQVum+HcDAcY/3vEOMNt86QBKnjb4QJPoiWvpDbJhgqGvDiQG0pp4hpXgDpixXSSvU7V+mwQB3cXLocinfHZdZ6s4dafsMfc4r88pcYelxug0I2FyMCd1R5iTOr6xVw0E46Wy4psdHAcghUxjdLGyYgTSNmYsK+em90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4b335554694911f1aa26b74ffac11d73-20260616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f8c07405-8f65-4cc3-93c2-90861c38714d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:e7bac3a,CLOUDID:8d830cddd8d0be4aff8ba95ffb23005c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4b335554694911f1aa26b74ffac11d73-20260616
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1123411217; Tue, 16 Jun 2026 14:04:54 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	arnd@arndb.de
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v2] dmaengine: sun6i-dma: Fix memory leak in sun6i_dma_terminate_all
Date: Tue, 16 Jun 2026 14:04:49 +0800
Message-Id: <20260616060449.42225-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When terminating a non-cyclic DMA transfer, the active descriptor
is not properly reclaimed. The descriptor is removed from the
desc_issued list in sun6i_dma_start_desc(), but in
sun6i_dma_terminate_all(), only cyclic transfer descriptors are
added to the desc_completed list before cleanup.

For non-cyclic transfers, pchan->desc is set to NULL without first
adding the descriptor back to a list that vchan_get_all_descriptors()
can collect. This causes the descriptor and its associated LLI chain
to be permanently leaked.

Fix by ensuring both cyclic and non-cyclic active descriptors are
added to the desc_completed list before setting pchan->desc to NULL.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

---
 Change in v2;
 -Add pchan->desc != pchan->done check to prevent race condition
  where completed descriptors could be double-added to desc_completed
  list, causing list corruption
---
 drivers/dma/sun6i-dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7a79f346250a..12d038ef5f2e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -946,16 +946,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
-	if (vchan->cyclic) {
-		vchan->cyclic = false;
-		if (pchan && pchan->desc) {
-			struct virt_dma_desc *vd = &pchan->desc->vd;
-			struct virt_dma_chan *vc = &vchan->vc;
+	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+		struct virt_dma_desc *vd = &pchan->desc->vd;
+		struct virt_dma_chan *vc = &vchan->vc;
 
-			list_add_tail(&vd->node, &vc->desc_completed);
-		}
+		list_add_tail(&vd->node, &vc->desc_completed);
 	}
 
+	vchan->cyclic = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
-- 
2.25.1

