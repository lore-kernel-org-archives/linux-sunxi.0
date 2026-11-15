Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735197;
	b=bb7AkrE+pXvLBw5zo7R88Kl4lHDUq324+SOkP3EHVdaYyl8F21A2ywNiQu/5YzE9BsFU
	 gX8NLZk66xuH0p6gEpOb0lob78AsexFperrNFnvE2SU/1s/BHY0mlMtd62FD/LuHIwt/T
	 z61Bhfcv1/FIBOoKkclOLZx3wDPBWdYxicoaJ7jiPH+TvU2Dm7FzsJpD2/QHzUupzWOMj
	 vIqSyB8XsVO4wXFw2Vtmvg6b93GFhilNCxPNUnwRGOQ1O6GN927I+BVGJ6Pc2tniElgrO
	 u24uzLyHxElPj9SmuCD6740uf5qOusjDzri93KowWFKsTG8gBKiRBYwYDBB410aGicw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
	b=W++nOlnbw02NACcTY9oqwKdpZKvFh8YeJIzOZYAE9Q5WB3vxeydxLC9iHjmSThCp11Nq
	 uI3SykBl/9GkN0VDvi5mQHkKicMjPBRSC2Q3SoQiGzsRwoL2FLyO/P/5n9xyrLcChgO8f
	 nNVdLNbiUlpLfF1SMmpD9/aVrBCUDkjPrxwP9yJ9d2v14b7Lncp3HG2S5yueDHsIV3xWk
	 O4kgfx9+bcJsysG66wbKEkoZXjGCSVUcFzI+c/A6jIauX6q8nWEwhwOuOZM6uWbb273kV
	 k0lO1BO1H2Nudlc5OK4vx+Kwm3X//k9P8yhbzkM7JhMS3oANqKO176Ng9PjqOdB9IKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=regd0l0n;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DD7606A33F
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84DD7606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=regd0l0n
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716d052dc23so891862eaf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735196; x=1795339996; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
        b=regd0l0nLo1+HQ4IjCgI/5FocQp6y84LrqG8b5sdhM+5dSq/zj67PwCnFZMZlNwbSn
         avEEhk8rhwqsoX6t4ni0UT+8r/cwRAoIbeNs56MCZ8VyPFjn6Dcikb1hsDY+YcHzssHN
         sNZMJVeyw8Lyo1K6uGHQsImht2ri+LbUkFcfE6ZpjJY6S9RNpXqYCU04901ggALLRLtN
         +vGFmBgWSadB77e8xIpUUO9+aNeCnV95Q1rDv28CdVLHluxJqig9jzLW3+2g9llpkPAQ
         T3/QPzFwAMLYTVgKqy/DMRreZxmtCU/OiqwJn7lO/DxJTfsApmIre4rVfn/8RQ79I8lG
         oE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735196; x=1795339996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
        b=VGw2XsrG3zHMN3FISrYgHOhYqDyD8kOjiHlxWYzHpnO//s4W4cLSdbRbCAPMt31/ow
         0uKcigmXi8uoCeVXmW30hkC4vTOtApyGd0H2EdOIb/OhYZ3ugLHrOxnaCh6TEljVU0hY
         NiMXGfLheOH5LuFqRJKFtO+lC6Zzi+es2fuUShG14X2GvGqx4TzhIXzqoGQEcgCCNTN8
         YL6UYsMpOsAZmY6v46lAdseRocodUSGWqsDtDJ+Rp9MX9T5EINcSeZczeTrH9RdSz16O
         Pxz5SQP8m5dBgSLPGQAB3t2PEMD2OjrKa8B8sh+VUUGS5VqPonU99A+GWRIbnpPzbnTq
         BxEw==
X-Forwarded-Encrypted: i=1; AL+hErFlrKuezmQjV+6ZR3EnUE4/V1WA2FDA/HUPbeBQGPgEZYW5U9nY1TpgDN2v/NAugefy4oJaoOL3WZ7JEw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9MtlBdIxa1edOEjJyQs5Xte0wZ6f5jT4ayV0Z7Zs15EWTkyBdG
	eXshZw2jRaYsvvbPR5hNdVAheioKSzRvQT1MzohWhkgH7aZPtPXOZsyu
X-Gm-Gg: AYBFou1p3oO0gBd63ouCdQDQSJBss9+61eY/iYfxbhTa/fzqfXC5n/TNn+z1gofEoXa
	Zc/aVi4UjsVzuDwbOHDc1k613dzOM6+L7tBM/JGCRGqT5MvtXvN7AfwjlIjI4vFvJjnheuc7EMn
	Gfg3/Wwip9WULtexDeyiSN0fwMvpidRa89H77WQn5Qma/d4p2pPswsirPpzvwHyVaH8tWTriOHZ
	Sz8XGahLamWQDwpYjWULOpmfLUmDxgGuQqqcmxMET7pf6pBgsXryjPg+WJ4j+SEsfBId6J/NFQF
	s4XxVD7guNnqnUAZIm92XCvtvapoAeOxsBBS8i6qEII07wJO424ZPQY/9EOd83f4ZnuAsVECXo+
	K62TP4p8C+lU1YCTVcQdUBYpNXa6hnYkTB1h1sBymqpW7Tr90W0ZkSCFIJAtt65MPHPHEYSk1ts
	cO2u3Ua+2dGpcJXOMX2kspfFAZIECA4EWNItvsrzLpzTtuQ0IenRiEaIUHBKQ6jY8+g01Q0kqK5
	HJWE8el8rd/h89YECb+NfWQRoYO7m0BrXgvdkCxhKeXwxq8jGB2bVwoSiu/1vMjrwWLxhL3dwAC
	8dz6rPpEYj7ZxpOkxRxDlE6g/A8aOZTOAy81pkcXTUoCLLXZ8MCyPj8yawYymrRTNo22PgeT6mv
	OV0RDVpx9ThQPkN5PFlCaDE84tFBjuKOGEmlktCB5yz5682wQWCnSekW7MW0rWTIbaWzczNhqXf
	bQi6bo4ivnSQtpuJpxCv1y/cnil1whAyQ/wC6s23RlSq7FAfCCjgY=
X-Received: by 2002:a05:6820:5201:b0:71a:ed36:e3e2 with SMTP id 006d021491bc7-71aed36e554mr241349eaf.27.1794735196516;
        Sun, 15 Nov 2026 01:33:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:51 -0700
Subject: [PATCH v4 3/9] dmaengine: sun6i: take the device lock before the
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-3-043cd476a45f@gmail.com>
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

The pending queue is protected by sdev->lock, while virt-dma uses vc.lock
for descriptor lists and cookies. issue_pending() and resume() currently
take the device lock inside the virtual-channel lock when queueing work.

Take sdev->lock first in both paths, and inspect the physical-channel
assignment after acquiring the locks. This establishes the nesting order
needed to keep allocation and descriptor startup in one critical section.
virt-dma preparation, submission and callback processing continue to use
vc.lock independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9533f3bdb949..0b8e5deb2252 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -954,23 +954,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -1058,25 +1059,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
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

