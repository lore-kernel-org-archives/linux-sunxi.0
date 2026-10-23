Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780969;
	b=XNqnGLRSpqrNxmbgGMCmNU1hyOxD2xAAuPr/6LziRMCA+qx0iP3d9P738yUfWL/wuWHy
	 pgUNK/mCb3VzaULQI00vcRdVs1AtFKmVeGt14OlpfxXe1+LDxmp8obvNmeFApA6sQf/Pc
	 wWwatpJq9Fm2ANjCelsZBT7VhLyL9jvZ5+x63dxwHvB3Xov9MsEKYjS3AC6KoUDmUr7KB
	 07MXOuhxuC35FW4jvF5idI98EGNbeiNAUif8HhBuKZM08f8ZdQX4jdIwEd3+tj/RmpNDa
	 P07A9DWYjxmbV+bWJGSmpnzgf6e1ykmvwaRZyKgEjTk+BvNLseUDISSVsNoZILOGtiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
	b=sb1O/qgqeAM2vbBKu4QEADnpR/4ixtFQ/0FwvWZqocvef2aqetMIRjNFFvmQrERuwpOD
	 InoD28ZbA5jLgr1ZzGTjKPvDGY60lQTFSplOYAvo05wgig5zt4yxGSoDkJwtwTg8P5G2h
	 mtSsqN2A7V2cPjcEVKPVqg5Yq5AVUDPpjTZL+A5WwaD3MHp+MUYSG6czHxSfhHdcspe7W
	 Pr6LZApDO0bxGbdTg2UQQPPZA20BI1fndWuyCqLnZAYMnSFjq/w1xofYvN3Raz6ittoJL
	 deumbFAJUY6rX/t/4Qx8LjBAPpncOR1GKvbcot+KZvYWHi+8J8uWQdjre1oEXoZ2otQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xt9eJVl1;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A38E606A31A
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 18:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A38E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xt9eJVl1
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d290b10a35so527459eaf.2
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780968; x=1793385768; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
        b=Xt9eJVl1PuzzN7TxerPXNg3wl6z/mOmGmuIsfmBfwG3G+TIrvS/GAyePxNQQqVfMqV
         xIruSe9Z96YnmRBBQNPpZXfkOaZ0BOAZfYXfQmnyla7+iXleIdALchEJFHtyNWtC8/tq
         wBQygulqwCcHmjz/lZGl7i91uEUL27iQr/bNBT3/LZog87oTuCHH/gYDjJWBTVet0F+o
         8sns07K1oibpOUdQwJwzHVRKEWclsLi3AUfBglikLgI0/ceXAgPViUN4f/DpRDfHaJtb
         ccSZ8cHdfGh3+nt4Fyj14CRYXyqZ0UyomNt++06C8ji39EmFVJ8LBiGnl8w+Ks3DKytg
         3SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780968; x=1793385768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
        b=sCrsDIGi57wefUBv/3olfNnAcWOcjKutOn/L/cwWt1eznGrDmPruiXPDl45X5nqwuJ
         z44YdGed3IE9U4COMJenPRaSB/PQqTZx8WCi0l1NvxskIveqx2RSSwc2AuBnuDF9IBbD
         R6P+wSGxt+vaK4jK8vrXiRsoxMrnMxYbwpHBWSiS/psOhQWJa5zJFJ6OrIU5YOI/LPLq
         BE9MoT2p84jwhDcut1gQTH4+A4f0uNY0iJwHfA+Qt/+ISZeHWLz2kgANpiHW/pCd6UM5
         Bv5XO8xcPJaBkUH0/bEhnccxrLuKIOCIvXk9dFcLDqNjZRb8HfpsOjsuLdWgHipovjZt
         +omA==
X-Forwarded-Encrypted: i=1; AKwUvBwBez8yQU5z2X88UL4ghCnYdy90dyHOsw8jcbHpjc22INzQ2mdfjxOGgmGhIgaW+bRRpx29uZGVusnlmw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKZP6uxgCIPPQBI4YmASsiCSFXOzhZnmqsT4DCpEuSqnYM2nrLW
	wApBXhQPvqgcnLwwgzYMFNkX6S+kU3qoi5iHZHX5obd/1ZaFg/3Jgptt
X-Gm-Gg: AYBFou07ImWaVGk1M7Ji2856Upl8eRfKar4YmXCRBTdIyMLx7xeReQmQS9CRc4yE/DR
	uknwS4XHeWmIsEtO5+vLsXSFOsmqY8J2RbjHjI/m4d+Q5s5AvCB2IiM+E359QPkqIicNAHoK4gI
	7u0XrbGstoBMUhNwa2wJ+N04cnBii69/xAux7IiBVkZ4EMYw4cvndjOhHf07rWaeU+r/Hfn9flU
	Wl78QEY0XfBM5MBVFYWSfWxPO1o+Keh2vro7OaWD8x7siatHlt97xcMxuIby/7DGV7hBRArZ25A
	ScO7U3htGm9rr+ysIP5LgWt+J+s/FreSlCGyH73Favnz4NjG/HNly252czCY4adW9eTTAriuxUe
	Yto8LGpmcJTkAXubjp2rnMlkmAHCAuJK8JvxDsTMa43o70lhTTtxv5/OzyP/GIIIX6DzdYABp2s
	wtJ5BNuWGMz8PkWW/tddzCeEdIitoRLY4J5T636CxCZLD94HYkEcb5r9zWkDJFDm/MStiIK/XTF
	TU4s4dOjQ71CrEoo8Aub9ZQhBYpNWpMdlG7nmY9ShaFeglne1TVaMog4eBo73R6TXGRavETM43P
	E/OztCYikr1hqFDcaywKsC4jTSH7X5GRB4G7G3LVK+a4t1zfKgoSdta2/rqI1reKv14OkInNIz+
	mvtXUxwdfUqrFJGHRnjNCiCo6G6KJ5GNTOkrBBpvPVOskD6Gcpw9cV4nDU+6/4+BF+dpfnjrXpp
	D22A==
X-Received: by 2002:a05:6808:4486:b0:524:884f:d89d with SMTP id 5614622812f47-55c0029724dmr56674b6e.21.1792780968326;
        Fri, 23 Oct 2026 11:42:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:38 -0600
Subject: [PATCH v2 4/6] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-4-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
index a21acb9ecc27..157746c9423d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -534,13 +535,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
@@ -932,10 +937,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
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
@@ -957,12 +964,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -991,6 +1000,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1037,6 +1047,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1071,7 +1083,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

