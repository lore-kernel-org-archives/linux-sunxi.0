Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798717;
	b=DVAA7+O5jxQORxrK9jJ1mTslVKBbbFv+ygf2bi+kbsvSML7Vsp/S2LKXzXVAG34HW7Tb
	 TSr1MN1qS7oEx2EVxLpOC6BC2F8SHO9UNWvy1VXPlTfZIhbOjJlbHFSZn5gx1tp28UOAV
	 RBoe265gnkAXDl0bUGPnpv8RXQV5t1BFvgZ+O/2SxawDeD+1ZANGCUz74cz0riVJw9IAh
	 hBdq4+u/71GhV3Zkla0OO9jlUOVUTSlXMUi1CqKn+Mtpu/brBYHMj2FzjReBRKEttJCPO
	 6c5pgk8R9bCUp9MFcz0MiHq4e7rOg4IEWEwLYR1JUjr8XMKs1mD89YwwU9YngQPJ3qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
	b=vKmaclwxLcmvnieIjAjfxZQeuyrWMxmrEehy6icjVwGi5EJQI88rjSYDIU2YrUbbdZv2
	 Nom8qKn0LTQkPHGq4e0rgJba+WdFCk6E3swzkYhLV5ymtv149EChJZdAVNgKsVn9NDc6E
	 ff+j5mmTQ1PPv8L5djamYSWvXxHGME8k6rpR+qeGc2ecHUHqYriwUhc/1FcyIA722iWG8
	 TZ3XvhJ1a83eEpTM2QJJ7Gh/NEgft52DqAlLbTbM+3UJCLvvQ4K8a869pLaIwOubszAxj
	 Y6P/mbwuy3lH+o66xCmpoZUNn45AMSe4TB4Oxg8pJajfRRw8rpdBqleL/8pf9XQzCzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XnnfYy5Q;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A20606A334
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A20606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XnnfYy5Q
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48e9476e26aso563375fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798716; x=1793403516; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
        b=XnnfYy5Q0YxTr0zfxo/RgjMmLrqGTL66B1NwxGM/dQkTI5TB7PuTduUXQtD7NatRkx
         8xXvAPQ0iHiS1WhxTaN2SsWUB2xq2W2ViVLj/fzmmyAh2B5pkmwaBwdnVvQGHOp0jqGD
         lYvNIeHoyIarta2l3pJCT4b0QkIaKun6gUFo3yYEqwivbt+/zaz04ZpXSOkLccKwiVmp
         LmPCrnBoXNTSaCDbLTGuKQVj8voeWPOPX70NgQSh7PfWevEHygHQ3X5bdFXjcY+D9NTe
         ONHPexGkXZ5zgX6vLG6lgMZex7VtT3E4LgSQ/G51ECQSSO1/a4mceaptLBmocuAUgsPb
         FNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798716; x=1793403516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
        b=yZpnhwlTKF+c4XnCNlkiG611SxsAT5G0uoTWrJg9jQ/Yhc+4MNjv+CZqKFqgivDH6M
         igFKjVEVUypq1h50vVg4gloV+J1Ud3dYjafINj8kLPc2W6TbFM7i0L7KbBCMppARlfTr
         wl5Ytv0gon4a37/mxkb5Z3r90iys7Mnt6onqKnBegc+thBvP3cwI+bGGJVKSNLrp+tAo
         hH0Dq+PV5Im0suKGfmWymu+LhWq9rYsjlBlBfajq17btV9JUqW01i5DhcqzqzwUk7c5G
         zBPlINWB9QkKiJPu7ghKrZHqX+echEhaKYuZX0Vqc45lH/65tpQh0CZdfeseIMnrajsz
         n74w==
X-Forwarded-Encrypted: i=1; AKwUvBxrdSaiLbZ3SYmGZDXfpY5SLsHAp0Dksy/yGpNJ9XhxNCb1W+ZSICeheOYoaxsRmRD0H1GAafLzH9NwUw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLUIJb1YwDhIH0HKiqSjW7rfRGruChUeTkAy6slKhyVaZVn442J
	1jJ3MZlqIbE39W2UkDhQHf5HvXJNsIRYeYd3I2IHyGXhqxTb3SesEoDQ
X-Gm-Gg: AYBFou0hoNXePYLKXLbaDWjKp5O+/ertJFB+RU1pJibatpQ+nfsa+QU/urbBsUWe5GT
	TsQEpL29/dgZUxCho+IpZ9Z5mTZzSUf3uwq3yW2VcL9Ai5OevkOOleN7mm1w7QXcrlEJ/uK/TZN
	mObfBQOx9KNMUW7H8UXSes+pAAzOtOZ7qqFiuK8LA36XZtuvkyNmJcxHJin3hozr4xeIdT9h8yj
	TcxDykLggWxuVnzdxmfuEoystBeC96coyQ1z3bNz2seYsMIdohVrXx/HrW6dRjbtL64ekteSp2Q
	0OK6AfO1Adfyvy6m1wtrN78J4UyLZMf7xAIq3tE6BXLuun0fdSnkgtKs8gK7/0Y+ELUyY4cE5hy
	JDVliXz4wm9faRmcqqq56VTeXhmjPnL3Dea6fPihjVucGnntZ6LwBu5H1wl+yZLfaeLCzpANfu1
	VO737aQZji2PAn91P1U7xn0yN9Gyw9P5PHb6UJ5MSVG+pIU5UN+VJ9c2J04PSCWMm8BQNgMwI5t
	ZtHyjvGPjeSzK7VJuiOLSSGw7e/Mzps4VFH//cfMVO72B8P/2n3eLyLUjWZMg1Lu0bAcep6DOvp
	ch22OVJSuKIY3/KFpJGeUO+QEsIQvEqq17eThyYX5Z3Dg7CQI4NikrMHGZvbXXxU1JZhLCwzL1u
	sU90elQTeA/BPb7kaK8ORL5Wy19CKNnELneJXtP6yxCiHxbCmvN6G3S3OYowsj1f4XMOliw/egA
	AgBsUw
X-Received: by 2002:a05:6871:878b:b0:4a7:443a:e6cd with SMTP id 586e51a60fabf-4a83f1d782amr611734fac.6.1792798716050;
        Fri, 23 Oct 2026 16:38:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:22 -0600
Subject: [PATCH v3 3/9] dmaengine: sun6i: take the device lock before the
 virtual channel lock
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-3-ef1acb0be768@gmail.com>
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

The pending queue is protected by sdev->lock, while virt-dma uses vc.lock
for descriptor lists and cookies. issue_pending() and resume() currently
take the device lock inside the virtual-channel lock when queueing work.

Take sdev->lock first in both paths, and inspect the physical-channel
assignment after acquiring the locks. This establishes the nesting order
needed to keep allocation and descriptor startup in one critical section.
virt-dma preparation, submission and callback processing continue to use
vc.lock independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 3a6525dd3d32..435d7daa1c0f 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -952,23 +952,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -1057,25 +1058,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0

