Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735200;
	b=QIyQZhtVYl3F5zXCr1JYpTcmzz1+x13JVHTgMdPmMQrqRu6ixetBRmLAYeZt5+EBNJn5
	 yyFPa7BHm6qjDLZVEztNAwyGZQpDtiRRiqyQfPkgumvzcIv3MYnTvz4iuGtAjbr17hYGA
	 apmBgnMztFc5vNt9RHrJxjpeNchCYZ8vo3bq+8m0hBEqs/6xs6FwFZziO66wqt+MSoNEA
	 4TsOdvv766iveqcFVW8rUSDiF8yVPZKzb4D+1GzImKWgjbPALLWeGS1raLfnjMU60EEG0
	 ErMO1vabmEWAiYYQ+i9feEXa6L1iHua/qDLpi+gxN4QYcP4Yl4ILQYEnIOzooaF0JMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
	b=sr0ku7ZgrB80MLbZvFqqBzkaDSYGmxHMtQx0jB0M9s68bX5/shF0IptXoz4LJqHPf7km
	 i+fWNKHcH5M8EvY033Fie0wg3jx66uV0SIDhG0N5rIYxSa2s7K/gZCdfnZgoaeyhXrD4i
	 41dO1UP4i3WuVlqgi50om94gXDV9U9U1ors3oKZ2IaR9olB/B3vs3C0Ri3H2vfwE2+l8U
	 ukJDTwLbv9Er0Xf8nRiR+ksp2nTrD+0UnEO2HqtzxMmzI77VJ41xGstAvTSVAkxzn8Ut3
	 tJb6rnsyE3KQkb9AO5zMAUml1LTz3VtyNwmW8JxVJUXa7lqzgAoUCdloq9A2GO6icUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NBesxtUM;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78568606A8A5
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78568606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NBesxtUM
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6ddef424972so3070226eaf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735199; x=1795339999; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
        b=NBesxtUMqpmhjldUwKr+Cw2iHbmeUc9uqIRQry0+mt07O6B4UqhBy+uIohBgBVzBjp
         9CEHWjrtGbR7ZaAMz4/Yema56BxbDcjO9yBWrffFyw/Ik34VGZrTGEmJYuM8qgNs257f
         1CGQKKuuEKRQsqs1jHBohu/N21SOXU0iujJ9k5E5ijyLeHO7SR7JxWw1LE0c7qVHWsv6
         RNmqXJD1Hm+3gOEx7GZj9NPcBFZgpm/Z/3boW4XQVMEB2AjP3/rJfTw737Bqtqv2eWPQ
         NK1zr8YJLZO4fSKYvN7kplAcXZlUvk43FgKI1PrK9swsxETGl1xzlP4ztBZHfUt5vg5j
         kkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735199; x=1795339999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPluMEVsq1fcd/2/kENoSJW0juxe38/N67JwApwlVx8=;
        b=LIpaOOmueFIY6cam/oY8lb84hVOzXPMNsSA2Bq5gj0k1Z0ssOxSiGLebVW/WVAZjxP
         Aol34ZJJQisPlB8a1H8BGlts/wCgKaLIvqn5ysdI/EuqH484x1v0AztXEg0nnLvsLVhQ
         z0hvaqfENpVt/+Fk7VngRMaRDbuztF3y5eDKesQW3OTiuuVJCHWRPvn8mWBgEVLtWZs7
         VQWyJpO0ZA6JxcjcjYNYK094ZqwDaUFi3os/nTmCERJg13+ln3P19k/v0IrNRvoYUHZo
         lJ7f/WUhzj1CBoSWIufmIGrlpTD974SDGiQwfj4Njpa0c5XZgPLwOdbbjjPjcuUeAw5e
         yzMw==
X-Forwarded-Encrypted: i=1; AL+hErEi4oCJgR5dv9fqdkMO1XZfieg5jOwvWRUdtOm+1sFXkaqptJSQ92zxnAF1uAfwTN5/sTOIFkT+UTkuWg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9qwiKest4XZVzCyU9AFSUsUqOx4xC9j1TVVyBQojT6JOpi1ZtB
	lC9FV2bfESHbIswVa6w4SvB5iM/KA8ByUP+AxeZQ1dONeYvg/mOwL4hf
X-Gm-Gg: AYBFou28+25WbQzIo2ciszUcBVgXXKscjpred4GBdCqHRELPKdDmPdGdWEpXOXuw5KU
	TJiMPkdKh0VPiiZEu6avPd8hiraNTe+gb5t7K1hLge46nXre0d/pw1UIAwKmojJGG4T5ZfgwTV8
	95P7ngijmNsdCJOvlr8+r44lmznQdhQv0x2fNaV+HW5sVYgyFJ7nh+jyOihF3uOUqmDJy/9ETpS
	vIjpNGe/WEFMI0fmZ/5r5sekG/GK0I2aKv0F1BgoFiOYCeQ8sAzA8JGBbzSoqjVZ98kKCuXW2Cw
	nHb8NGAWtgGz5TrN8q/9FITmc8UWorshUy8rZpVqMalpfFpRPboAWywCUS63lM5kM/f+l3ir51M
	dN3bnNxQYNpretq6yPeoQLj13zGvj4uUwojoh0r0a7F2Vj4CoPsy12mPA5docjLhKem8dTdQOoi
	AOPxIWrAicdV6x11Auv9wxqTh3mV26gF51CxLgNbcBffXFY9iGEWVYUfC4rXv+pKFrnsuKg+jaB
	r0vt9UFjlTj223kVmgwK7oe1iWXtbKTIv947x5xt8KwtAeU0Khiq3lpLtW6va6pbhBOnuVvNYdL
	GS//4ex1LLUyvrpTNnq2kOjVYT3nuFQhMUTGNL6tcSGRjFKefjrZvdCoz5n1lO0dJUhJISNQltd
	GApbm5gmVCwSkFFJaNQcvNeQrlPTI5cNQ0/P6FfR1nMSW9wz6u+YK1Kl93yUr7qeUySlWnpPBqD
	LiNu3snryLViyoVzu0xxDQAqr1ibTnp7KXGLb/k7E9tntehfcEsC0=
X-Received: by 2002:a05:6820:1627:b0:71a:ee76:d7c3 with SMTP id 006d021491bc7-71aee76dd86mr223150eaf.7.1794735199376;
        Sun, 15 Nov 2026 01:33:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:53 -0700
Subject: [PATCH v4 5/9] dmaengine: sun6i: detach completed descriptors
 before invoking callbacks
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-5-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

Finite completion publishes a descriptor to virt-dma but leaves pchan->desc
pointing to it until the allocator runs. The virtual-channel tasklet may
free that descriptor first. A residue query for another incomplete cookie
can still pass the retired descriptor to sun6i_get_chan_size().

Clear the active descriptor pointer before publishing completion. An
assigned physical channel without a descriptor is ready for the allocator
to start its next transfer or release it. Use that state in place of the
completed-descriptor pointer, so residue queries and termination only
consult descriptors still owned by the physical channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 5d39a2c0c2e1..c30e244e50ea 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -492,16 +491,12 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	if (!pchan)
 		return -EAGAIN;
 
-	if (!desc) {
-		pchan->desc = NULL;
-		pchan->done = NULL;
+	if (!desc)
 		return -EAGAIN;
-	}
 
 	list_del(&desc->node);
 
 	pchan->desc = to_sun6i_desc(&desc->tx);
-	pchan->done = NULL;
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
@@ -538,7 +533,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -584,6 +579,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
 	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
@@ -603,13 +599,15 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		     i * channels_per_reg + j < sdev->num_pchans; j++) {
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
-			if (vchan && (status & vchan->irq_type)) {
+			desc = pchan->desc;
+			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
-					vchan_cyclic_callback(&pchan->desc->vd);
+					vchan_cyclic_callback(&desc->vd);
 				} else {
-					vchan_cookie_complete(&pchan->desc->vd);
-					pchan->done = pchan->desc;
+					/* Completion transfers ownership to virt-dma. */
+					pchan->desc = NULL;
+					vchan_cookie_complete(&desc->vd);
 				}
 				spin_unlock(&vchan->vc.lock);
 			}
@@ -985,7 +983,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	pchan = vchan->phy;
 	list_del_init(&vchan->node);
 
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -1001,7 +999,6 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
-		pchan->done = NULL;
 	}
 
 	spin_unlock(&vchan->vc.lock);

-- 
2.53.0

