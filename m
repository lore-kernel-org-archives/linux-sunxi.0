Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725305;
	b=XKxMrUfHh1AfLpHhMv0JAmoxcNvlL4kfWOYwcnXPs8O+G0YhK0OvZGyfj7ewB7pyAktp
	 zL96Znndto/4UJSZ+XCfmQz5KDoVMiJelQLo5iheqe22FSoOfecu+vIBN9kf6C5Fz0tFY
	 XDViBVfLaaJGPYL9v+58YcBx2BgY+p0jhJih4Mc9bHfKhDTs7HzMYBu2p7FgzYJ0ROwC8
	 W+LSMufTtRxjx6cX2OHEAm148diW+jkb/UE/MtYZTA5ZtbeNgiCWop1xHweGn8Auqsd20
	 8P0qRYiqgqaXhWdmOLTxhtlPRRX5x55TgFFoyoNDQflc+VorSqt26eN5DdjI4h2xSSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
	b=FsbZZrVDn1IEh2IJ74Cv5CYiWJJY0p+cdNhVFZOAmnK7p79mpMQXaF+eBQyoJljbVYsQ
	 eV47plGoa2u+GhicqW0DwuWOcE/B3yv33rPLiqGSbXyG/E+zL9PM79n/iVNddVie9Q3zH
	 kZrGgKIbApRf/jLyDdRGnCVhobR4yk+ZzrxlxHEW5R8AWjtNh4yarKs/xGUvUdKzbMtNX
	 Ub46YiTLUmOMgwtx6ESDGIF5POr4lTsWCEBigU8bLT/9DtoVKoW0pSiK9s7b4mRQPYUcL
	 b61CwwLr3oCHHAeHEtI9x2eH9kG6t/C+AR75sCk1fVjAUB2inayCnL6Xb1O9QffQR2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S2hFb44X;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E439606A320
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 03:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E439606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S2hFb44X
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843b6f8e2c7so402424a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 20:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725303; x=1793330103; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
        b=S2hFb44X0qW6OfR0sN9Tk8RFUh9PP+cdv4yf9yEtzxugtmb4LiZakj9+XOnUFw34lP
         FZYOH7RQKqRKdOVCZAyrglXBIUmdKYyzQlXfxZCjnCMpZOgOBqNPTEYrvJGNITEOqKQQ
         R/gjoKo6OGscXBWuOUuIbzF8GjUoVtQBtc5lMolaCOXAXH31kW1XyI0QrjzxWp02RiD/
         NxCBlLUp5HYEbfOvdS1G6/oxK4qCF2s/BaENIm9GoCfqBe6JMS4MoualiujAlUox1qc+
         ZlK8CZTKWUojrTQUtN8f4V3tgex6KNaFiFFwpoA31IiI6kcByyXFXrR9eFGAtSYcXLuS
         HcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725303; x=1793330103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
        b=tVRjvClJc+sL7Ebj4pETHWqwmzcpuaXr30glAZrDSYSQgBnN3A4DiP6QbTzMsSA8s+
         A9cJKnbdOFlIbzsR86l7O1u7RNlo4+YtQTkb+ht2Wtaib+8ZpK3ZGfJRDTHs0KvHgjrA
         Z63/Eyx6WEgVoPz38ssOdQSHu7qLxl8XNNgan34uIHNp6Ynqv/UiLFwAQUgwBoiva7Hm
         twfcng9f7YwROeTF7oRQoASyEEv7YV9mZvEUTqHHlpjghsuw5d1lUm6s3SWOfJedq5CU
         ZGuLneVEGBn2Katjl/PcTID9K8+ReM3dKGtvRMLEdNMyJiPP3iMJrCRISboO5/Wdgt2o
         AIxA==
X-Forwarded-Encrypted: i=1; AKwUvBzVpL8biHZym0M6MBka0/ycMG4oDWXztllHYdPWs+YnZEcB6xC7imKle13Cd8DP13OmBN9nS+3U0qA19Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYLkXgFX7Br6yYESycVeZQl92v8oyL0UcV4Oi3hH6adjbtz5qmeE
	Xwf9OU2F86vmbei0JhHSL0yOp6KoNKb5Flpjm+euCvIcHq9VAreTQGrx
X-Gm-Gg: AYBFou2v6pm4L8C2C45Cx7jcczvnnwTb/ISODt2cRbeYG/IPhmLvu8dYtiXp5ZRn0Dd
	DRo4rEuy+uXZmnHXT+Z6CeojiZp+znVlZVyJwonUFI8mh1iNfxc5yVl6Xx+00aRjuzL0GabmzAQ
	naeFHCX9vCL7RGEP1HhK09kXzsCqzQGCPdzLIVgQ/nyL/RKclTorzTXi+U+DF7efFHTdiPwisX8
	Z7OGCtCs+hdhpbzs6Jr7ZkDf37lFtj21eYY9mA3jnpLXFJaNM3mB5FKglfOmIoSotWCiqxO3lQX
	/j8LLzL3GRkx0SOaEuUe6eGoqZaUX1JY2avyOajbPz89Zq9N62pBpH5qUnceSJdcwhMvom45csc
	Pxs1+Xiex/moFPS2z1SAiDzIu3g21M4MNv0yClt1OgZMU093Ka1D/NO2CzUm9VfFyseMKOOGyV7
	T2Dk3XqGnvJ3BA8pdVumKuceoAd2TcmZ7MDSr0xLldELomKq+gFAJgKWtSje0SiYSfMxC+RJpRd
	Q23CqlPSRhyOdHeRHONmim8aneXtEOlPEYqfGmeaB6exUMlOgm4xfux7sB1Uz+uOteijdFY99LV
	X15vjk/muv/K44R9EInCy08bcQ+tuDdzcBtP617Ona4WvkndfzbdxrnO0XRd2NmkPiUsBqVdGbz
	AQwGWXi8jFrcAcUILhej9AJPRoMzJRrZ45fuEjPMNSBKmeyy8MrLhWKzs+oLtQoVomcGPRItfsH
	UxdzAD
X-Received: by 2002:a05:6820:330a:b0:6f7:2050:a2af with SMTP id 006d021491bc7-70b88a8a106mr865282eaf.53.1792725303524;
        Thu, 22 Oct 2026 20:15:03 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:55 -0600
Subject: [PATCH 4/6] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-4-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
Flush the hardware pause request before returning. Completed cookies
remain DMA_COMPLETE.

Keep paused channels out of the pending queue and do not start a queued
descriptor when a paused channel's previous descriptor completes. Resume
requeues an unassigned channel only once and schedules the allocator, so
an idle controller does not require an unrelated completion to resume it.
Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index cd0562de7def..7ac6693a041e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -209,6 +209,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -538,7 +539,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && pchan->done && !vchan->paused) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -934,10 +935,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -959,12 +962,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -993,6 +998,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1040,6 +1046,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1074,7 +1082,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

