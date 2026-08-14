Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE5C47143A
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714189; cv=none; b=cPJe4vRZMyQ2TACaNdLpHwFTOSTBPzvM5cs12nSgiW/PyW/eTdW4NmELtl0pcd0l7cZEFCuqh4m3v9EOQz4hZN13S/wYy2uTOOxr89VY0Yy3L+VUrCYUtGVzJREDFadbE4b8VRM8m2+k+6mCt9pTAj4BpIFX0FVjaYdHtOeRY3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714189; c=relaxed/simple;
	bh=Z0VrxfrQOACZu83EOUXJrOYZAwJOj58+oO60WgCClXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ufYNx2NqihXJwaLK8XEJ6dbqQXY1Q/LHAS03YXZEiXAIsX6NLbi5jX1jeoPgxsIwjzWPe+OcX8ygVqIfTA4z5chErlx6bJPDQIR6ufgasw9M14EqL1yLv1HHPjrlfhbi9UeDE536nUjb1VhH7u77yXzQGrBsxCf2UBCBT4QhjEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=bHWn5/AE; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="bHWn5/AE"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69edc72e513so120597a12.3
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786714185; x=1787318985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ctx57rLzTDeEjtgOib9aUyoQxqr6yVBe4ltDl2pGqk0=;
        b=bHWn5/AEXK3jwwL8/CHsBhlB3i2HrRGhNGqLCz5OvBn+PfG/MUTsoRSePl1T5lOf4u
         p2p76lHepfibx/5SRUE0TW0l+YRNtaogVBuso4E3unkfQBO1cyG75UOFAfARu6ZBxCbO
         f+6q2xLiPZxx9XSpXGhBJJMGmNiiaNjl1MnKN1nYbm5rjJ0nnM8KrvIA6Khkqk7xB+SX
         kATMWi92IJAtnto8xHpb2yVh7TV2i7SGgSTtWmDWGPugQ4E6aWJy/6lx+gB2hr8PJmGd
         tpgxUJOpvYNv7c158OXU3V9NDXxKR8hkyIDWRTRMaokwMqAUhO6aFs9FMG7q5s80tz3w
         lFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714185; x=1787318985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ctx57rLzTDeEjtgOib9aUyoQxqr6yVBe4ltDl2pGqk0=;
        b=V/vQ/6t01mGjU7cIbG41GGiojjOCBDooVbgpCYIf/U7A1haHMlGQ6tyU0KKaAZNAkd
         xSRfyLOaLNnKTlWlfH5rmYhWGqwz8OaDZ8H/PGPE5ikNw2IOrPh3V0QKPx0Z/RguTl4V
         Hzq9hz8ssDafxkecabcgaOIKWpWwGhJd1x0V9KUgj4E8E5JscwYJcXwMRfwZ4onbdCD1
         LBLuRLvNXq71VdUPdUR2Lim2eIj6I1t5r0RK2X2L2XmKb71loOL0d7uQdHoqX0XjF+1j
         Ue8mScht4C32KIXHrYV/yF1sYdMQqwuiPWVt4jr0LvUV89+UsgS/rmNeCsxyEouamKgZ
         uj4w==
X-Forwarded-Encrypted: i=1; AHgh+RoPsnZLiy8f0IJJczrFnunFzL0CRvkb7bFuPDLxJaa+QliJnuEP1iwkVSIaReBLaavB+sd7fmPgjBebng==@lists.linux.dev
X-Gm-Message-State: AOJu0YykEei1SLCZKfsqyNbBJPOrsEwfJfX8pk6gpWEr1Ue26zv88GZq
	Nb4jiqLlHfzaNlgMLgJLKJgZq03WK38D4msHNxesGuEcKGo0GakstKrSn12O9zHhCq0=
X-Gm-Gg: AR+sD10xCp1fymSQVea2Gn2BxtFF86/Txnr32m2KGm8RWVmxudAz/ZJFW6naY8nnG1q
	kWsrvNO9RlQpcfxinmYBY3x7+SBfYE1SCJgO+rGsndwFRcpAUMHgr6v8EPpPrOytBbCJmDuwREQ
	JQeKSnGOUCvlDJWwpR0GaeDAqa4WJ/kXefRTjfk5xjN4A9BpzfiAgTSh9vkQUn49Hd2Jazzv+Or
	aorXB39+/8hGLx+/aDFJK3nsqA2/cjpqvPGRShDhfNlfTemfj/TydSsXHew2PexPCtTRt3nZCZu
	oJJyNh3jLRWH2XLXV7J34q0/tsNpC7qKU3f08SlBzYku7rwA7DQJA1sBGE+tuJ88cpHaU45D0RY
	KuWVnee/stf/KGHq+f/rKfAB/PrNndnIngTJGYUNP3ghbLuDl3/7+SGivtoVkz6e6PCfrOeqQcs
	Mpet7IOueSPdlNcfIlVMiBl9hkIoX44R+Pmi0Z4Gpjjm1jiDPXFue8dKDD/VHitDtRpDep0LNmM
	Eh2JFObmuBxKryRruLhAthE17DsONrFOwe17ts7IFJ8AMMdyaeh2J3KDqYkF+Saq34Y
X-Received: by 2002:a05:6402:3881:b0:6a1:faeb:c519 with SMTP id 4fb4d7f45d1cf-6a38a97752amr1392217a12.3.1786714184680;
        Fri, 14 Aug 2026 06:29:44 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5eb2sm841941a12.5.2026.08.14.06.29.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 06:29:44 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] dmaengine: sun6i: fix null pointer dereference in sun6i_dma_tx_status
Date: Fri, 14 Aug 2026 15:28:30 +0200
Message-ID: <20260814132906.70322-3-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
References: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun6i_dma_tx_status() calls vchan_find_desc() to look up the virtual
descriptor for a given cookie, then unconditionally dereferences the
result via to_sun6i_desc() before checking whether the pointer is NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    txd = to_sun6i_desc(&vd->tx);   /* vd may be NULL here */

    if (vd) {
        for (lli = txd->v_lli; ...)

vchan_find_desc() returns NULL when the descriptor has already been
completed or is in-flight on a physical channel and no longer present
in the virtual channel's descriptor list. Dereferencing NULL via
to_sun6i_desc() in that case is undefined behaviour and will oops on
any architecture that faults on NULL pointer access.

Move the to_sun6i_desc() call inside the if (vd) block so it is only
reached when vd is known to be non-NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    if (vd) {
        struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
        for (lli = txd->v_lli; ...)

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Christian Lugnberg <christian.lugnberg@soundtrack.io>
---
 drivers/dma/sun6i-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 04fe1f5042e9..7704b016aed8 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -981,7 +981,6 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	struct sun6i_pchan *pchan = vchan->phy;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
-	struct sun6i_desc *txd;
 	enum dma_status ret;
 	unsigned long flags;
 	size_t bytes = 0;
@@ -993,9 +992,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
-	txd = to_sun6i_desc(&vd->tx);
 
 	if (vd) {
+		struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
 		for (lli = txd->v_lli; lli != NULL; lli = lli->v_lli_next)
 			bytes += lli->len;
 	} else if (!pchan || !pchan->desc) {
-- 
2.54.0 (Apple Git-156)

