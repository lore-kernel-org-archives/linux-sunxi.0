Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735203;
	b=V0HAYHaHCdLKBkkYbDlONmv9XV4XQqfe/TuKMOnyd8nafn018jZJp6xeXJDvSW4T5K0L
	 9E5KvneQCFaJfocMaMYkJt/SGcjl7MiqjGPTM9C6ewrDXoUxScleT5BM79pnbTY8NeUTi
	 OLNtwxPGe3gZxrz4fIsI+eDio8wQvLSR0n6aU3B0WDFt2QUqgqCsMt/IHtdEnbZlI1fwv
	 cI6eV9CcaPSMCh9ksTezn6Mlvcj8Jgj0As4nLh+u9hP/LrvYv84w7BcHD5qN8CJKMnYXM
	 uoKEvvirylLo5Og30ZCyMMyYBvWzhxn6kbAYELvwG93mrhr6IF1ZljjmUQBG4BQmA7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
	b=vestnORVtLu2l6UfdXVBLNBkvZkvd8G/dQX1v3bNdgKPMmnNm/Hs75+0jO/oZ7LDvvlS
	 VFFp4zwLgue7AfQLnbKo5EL7iuxMfmlSfto3lYfFvHoNYCTrzHNz5d2Sqk9FYgqBFzzO1
	 HBfAZbWUX9h3F5Oh3u+MDJdD8ClRRdIRW0NafFzU7VFsq/ogN3jRKKze872251k1eK8I/
	 lPDrgmuR9XlKEtXZg/Aqs+XhErRKyrCFB0i2/Sz4hH0LfpO//47i8G6CXN6Z2O5zhH2J0
	 79oKd01+4CLXmSsokn44BL6/5hHCVspuA1AnLIlnBPG3e73d5WHZMYHXc5ai1m3ggbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nuI9u00S;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E01B606A8A4
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E01B606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nuI9u00S
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2344741eaf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735202; x=1795340002; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
        b=nuI9u00SouzTOuvYNnNeaOCJ5U9Yje7CayHlcGOOPU/DeZDCta7rtM+i4jPK8jYZ/E
         WMJjkj9wmdtf86OMt776uBa4Q5O/R4b9ufeLRoJ/mrrqwmkX2SCov79msFN+Vvgtso2s
         xm/uquZ9kPFRd2zehAcYtJLHnWrZDilv+4TSVSrOH+onpFyCYZHZbxHmssi9+j/Rve7c
         Ccho5GmWspXzQUApaLBOxGlb3OkNKTZx/Rzpw8HGmPg+2PFq010KWunkakzNmXy1hVVi
         kAuYwJiMf/KHt+bBLDgfIffBCvMkRnnQHnLPzdH7bgncozwGqZgiyMEARJSvj3Rn2MFw
         vLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735202; x=1795340002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
        b=TlxYyZr1FsMp0cT4lLBsp0yxxcHi61W+9b+iEz01Ojexy7G4ft8KOmxWI33lGXP1cy
         NNpGLio9rhEPNN6A8f5SCQlAUhvrVFXEZF8rm4mmaDrCPEdLhDIax6AnK9B5Qyvrcbod
         J/KRG7js52NTX9t8h5QIEO9biGMOjeParNf+2PDU87lGCU0J7Xyo8vFuAM9pCET4zE73
         lb+cUCWz85i3FbZLrE+hDaHR+GwcnoxZEpwHAyTDIht+axwohSQgy5LFVuJR84AgA9BW
         mFrmpIfysxXkDb4Z0dx6oj9YMekNlJgY7/11z1zAgiTa7HvWeICTB0rFtmYc914vovo8
         KbwA==
X-Forwarded-Encrypted: i=1; AL+hErHti15yLhbAJNLHexCXQeb2DQYQh32mG6j/GKcYFDTpPSj2N0iL6OjJldVfjDCIDKZJk4NxXkIo1lgrfw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Ym7hR1eK8sUM2dVsDxbYqHfeD6oToMIOHDhRHjStXoed+wjlO
	NUVgX5vC2cyPHoQSvhEbW5rZv6PrwsD6YtdDSG+H6iwcw3Xkw/RCFb1Z
X-Gm-Gg: AYBFou23leI8WdWKzoZqkNXa5e/w+SrUuhZebjaV7y83swoMhy7eOrfrW779U1o10/K
	YWCGZE17n5ZcXMY7CBz2+fH5EKmWlOJqGDM4Dp17nJLf+ZOp3dUwBtBozE3s9T87hZz6kcnmoTM
	xDQM7niItk+oQ/Y/IFola21X1AaXubWIF9UsaufLG+BS3O3NqEBoJBdFupxpXlPF+7TgaqbQUrF
	Ez75Wn+3A2FlPHxhp8jltqHdmV8F74gQ7/dsphAEJ37JsC/BQg2Q3Q2tUsXeZVsXyEOInUv8oqc
	zKPOcStPsJnSio6rFJH0mxdCaic86ZtsI+PR9UMGdFpd5bxHLYhuNVtSkiVWPjlMZPT+F0QHjtN
	vrSMC6x2H2sM/mqK35SDO2XKmF3Sw2dPjw10/8KSQgCuQPhq3A60xhef3gJobeZ310s+KqF6GRd
	q1/Lqe15/rZbeYk9DYTMyUotJ0vORrQVFBYRNQBXecFUGDgiX3UBvRXp/qHaJd2prY1c9Vp5Y+1
	bbbwEBuPh+gVGKKLRpERADALpWJ8KUReHBoirCqjYq0gPp0WAYkd3J/geOZaCMEsafNU2WWXA8I
	un/mQSEagGD4HKQiv6aZkGKSyKSMaBfUqTXKeHAE/MxBEheC63hxgxqm4cKLDMCVssqIHkVbghE
	tAL+c2E2X2kdgeWn5EJfO+helyWApleGY2aw8gW3Wd21hQ4xfo5OzfxmrTGy8UEuritx4qR0i25
	g58ULFTxO8HDZZbQuecOr/dndJ/B4FMQ/Hc5nSWKrevamVe4UKH6I=
X-Received: by 2002:a05:6820:1396:b0:71a:e696:71bb with SMTP id 006d021491bc7-71ae69675ecmr1052335eaf.35.1794735202064;
        Sun, 15 Nov 2026 01:33:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:55 -0700
Subject: [PATCH v4 7/9] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-7-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

sun6i_dma_tx_status() only returns the cookie state, so a paused but
incomplete transfer is reported as DMA_IN_PROGRESS. The 8250 RX flush
path pauses the channel and calls its completion helper before terminating
it. That helper ignores an in-progress transfer to avoid consuming a new
RX operation. With sun6i it consequently drops the partial buffer and
leaves rx_running set, preventing another receive from being submitted.

Track pause state under the channel-assignment lock and report DMA_PAUSED
for incomplete cookies, including status queries without a residue output.
Read back the pause register before returning so a posted MMIO write
has reached the controller when the client inspects the transfer. The
readback flushes the request; it is not a separate hardware suspension
acknowledgment. Completed cookies remain DMA_COMPLETE.

Keep paused channels out of the pending queue and do not start a queued
descriptor when a paused channel's previous descriptor completes. Release
the completed physical channel so other virtual channels can use it, and
clear its hardware pause request before reassignment. The paused virtual
channel retains its queued descriptors until resume.

Resume requeues an unassigned channel only once and schedules the
allocator, so an idle controller does not require an unrelated completion
to resume it. Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ab4474f0a8aa..14f1f463005e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -539,13 +540,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 		pchan = vchan->phy;
 
 		if (pchan && !pchan->desc) {
-			if (sun6i_dma_start_desc(vchan)) {
+			if (vchan->paused || sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
 				 */
 				dev_dbg(sdev->slave.dev, "pchan %u: free\n",
 					pchan->idx);
 
+				/* The next owner must not inherit the pause request. */
+				writel(DMA_CHAN_PAUSE_RESUME,
+				       pchan->base + DMA_CHAN_PAUSE);
+
 				/* Mark this channel free */
 				vchan->phy = NULL;
 				pchan->vchan = NULL;
@@ -937,10 +942,13 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		/* Flush the request before clients inspect the transfer. */
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -962,12 +970,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 	pchan = vchan->phy;
 
+	vchan->paused = false;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
-	} else if (!list_empty(&vchan->vc.desc_issued)) {
+	} else if (!list_empty(&vchan->vc.desc_issued) && list_empty(&vchan->node)) {
 		list_add_tail(&vchan->node, &sdev->pending);
 	}
+	tasklet_schedule(&sdev->task);
 
 	spin_unlock(&vchan->vc.lock);
 	spin_unlock_irqrestore(&sdev->lock, flags);
@@ -996,6 +1006,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1041,6 +1052,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1075,7 +1088,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

