Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798726;
	b=f3vZMiKyZugy6lH9zwvdUdAoDN9gAwmM3BjxkpEZDxaJkNQAojawCIMXcDa2uR9v8xKH
	 uUYVRjUSlrpYEshFN7/qM05otLS18fSfXxDijn49NwnOkczJht2aX0oANNHsibprj6CBj
	 UnvKaxpjia2MsRzSUWqC0rOKglUQhelKY1e3IqA1QpvEvfd3qhd/7ybB86I/EnatdQxti
	 ZK7hXTvMiZRBKkF+PZjdQJnhiQIEKy66pzeMzPuebLi+LN8/NTFDgb7wFpI7nWTrY8Mle
	 CF1fn2Sic1UvvYWerieu3fW1jTA2kGClVbdJxoCsK3GTguWj69nH+0+pV/hvWqwyJSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sH7DjWiwuin5EerT2/8LAxO0bCdrNvcuXjPgNrPzpko=;
	b=3+OAoMhrAiHLJJ4hoVaxtLOWFFVIOgx1C+TFXG2mg0N++lZTsjWN272ICy6lQmJVbVEw
	 VT0NhGAbAOp4G57W5wHbVhk8k5Kd6OKA75Iu6FRPZNpWs7gU7mXLnKtC+GnnyE/uk9qGI
	 /CUF63gypVyy7Xi1pwEeWEvWweMPDV7DUupXXK9Xk7mRoHCjxQvL8uzOlPDXdZHkHeJG6
	 gGtoM/rOFD0L9fJ7NXxth3RbtzRa6c3l9HzyEtgj8bz3TcV/VhikHz4qxXMg5ILK+bCEJ
	 PM4lOJvSzSh/wglWBTZE1QthxpmWZhzGvHYyep+LjP3EIaUo/ef1PEO/Avvq6zcj4dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DsgZw+3L;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7224060A2621
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7224060A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DsgZw+3L
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-46556b9e02cso877553fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798722; x=1793403522; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sH7DjWiwuin5EerT2/8LAxO0bCdrNvcuXjPgNrPzpko=;
        b=DsgZw+3LxzwZDoaFo1AUYwM7RXrVwKzh1wSu0dpkSY3AHZ90VYQDzM4QDSuejUscwp
         wwoWrUnrR+f9I8Cbyu0lesVbmuYHy+pjyhwAhZTZqroDR3goqx7/ebCNVZpRuUR1ygD4
         FVczFIVQ7HJYAlqT4JI+/UKRvYakjFAAf4uyTwsQyAR604a/1709p4pOV3r2jh2X6LhS
         3B9TAc1imXXlJUT7AMHZc8ZvMpFAZYpXxInm2mJ+xj4Gm4GuUImGerVQ8PxpAYZbbFQR
         Q7LRwc6Aih7Y6OizJ4BQRA9sfkdk6tsx1kUOimP3BGvQKmkOI8Wgnhj92igNCW26p01z
         A5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798722; x=1793403522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sH7DjWiwuin5EerT2/8LAxO0bCdrNvcuXjPgNrPzpko=;
        b=QncacYSi7o1KvDrN0U7HIYpatYfA/2NvZ4AtylXdSCvxctJybMArwpZOkGrAHoKmKj
         Cidyxowop2l31wKJqbfocgYNbU27mOpkK2E3X73mfwtG14mtYTblB+vxmhDxwwAq7e+f
         aGTKlcHe/Z0v3T+5KwtSPtiwVfci4jffRVJM9WoZb5k42K/cDVdtEtMJwRhUvisyaRlQ
         KXuf12rd/oinFxx9n9sV+lUZHZKlO5ER+5y6Irnz+1QCV4uRpnF/b3AOYPhGAd7/s70q
         6BOEv40vcQx7Qpbkyjc092iW0Lb4+xmrPp8V1EliUhv0bXVB3jqfZtNONbOiyNPu5OsE
         5S3w==
X-Forwarded-Encrypted: i=1; AKwUvBz2iJOcvOtAX1FEqkxk3gVBlk2p86qG8zv5oKRbtBInRxyCd2X7XNwuNW/dsGH+DqNtcOzrwmsIRSioqw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKVR1jw0zlxlBVXhPc1Ou0FGVi6g96TCCNzFYiZA9nqIuHKU/jl
	3JBuEXob7IHWy8Q4SSPz/w2RYMxXkEJhI+8j8FD/LPBqsQAqpy9r8yo1
X-Gm-Gg: AYBFou30g1Vriasubg3Ey6pXBPrRDbwaBEv+XZkXRISzdSFsA6ninxe1zYbc6XFWgRG
	BI10VIiKoiwlThBtu40vqNnKoWPMLVZIAWkf26Cs0/+HezK4j8CR7hOWsUfI3OaUdVq2t1Zt1OK
	K+L5WLemKSAPKs72pZZsH9hO6c2pS3F4Lx1YZ4c541RsESftMgM5E4OAEfOC7X2NvmEj52nLLXj
	8bOIHJX02o/zFF+y040Yj8/P0ol+MSckLF0bdqK5jENtDzaBnAIsYdyH66ndRxsoeQolcflj9ZW
	KYEcg4Dc1tEXd1zIezNv1ivJPyERYIhj9u4es4/wmNewccJaAiJthxl1CfIBNr5Qu6XkR059QBw
	DzMQllm5wgVYH+LXvth/aZKH9PU6Xdh02Z5pAKnylMVG1nsPrKJ40VwGH70bNbfDVdsyWk1z5AA
	vY2qtL24GK4NxWnYkHEv+L248axkVPZ/vEqadQPZDHXP2Y3VS7H7ejfe88twoInojyHwsQif8U2
	G4fUs5BeuL77sDNsXMsH81PbKxSQfiaBAttRDw9r0H2uJrH0rK2aYJLgAfrWmPsEDpcJ/BeLkFu
	WD62DUopi6D3pOrtmbn3ExP2p1xxtVoHrskmdkeFaGpZ85QjUiHDGJuKD6y4hBwnSKNwLK7hUdO
	8kFRPXOQAlwvBy40ab7xpvqWn1Q6KdSdauYf5p/WazTMhDlBFQjpB1VJvQ3/HFbOF6oSV/7vUd6
	YpxdHdjlGPdlRRx7O05MNSRTvhyA==
X-Received: by 2002:a05:6870:d61f:b0:4a7:2baa:8701 with SMTP id 586e51a60fabf-4a83f9aab83mr427138fac.15.1792798722385;
        Fri, 23 Oct 2026 16:38:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:26 -0600
Subject: [PATCH v3 7/9] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-7-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
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
 drivers/dma/sun6i-dma.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index dab17b3863fc..25987f550707 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -537,13 +538,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
@@ -935,10 +940,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
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
@@ -960,12 +967,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -994,6 +1003,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1040,6 +1050,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1074,7 +1086,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

