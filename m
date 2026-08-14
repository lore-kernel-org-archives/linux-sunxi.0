Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B50145FFA6
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717670; cv=none; b=ZYBAVEnTpXyuYl6I/owOk03R6X+Vm+fb2uB+g+lISBFFJDkXgF2NvFkP8/fb91hkXHhSlwRs4/l+yA9A3vdIim9fQdrUQ27XdhRkfrlLJm0oHNfkYf8lUCZ3FzWrVmYVBy41x0IqEvOTwjeMfGYKXPproKfYC4WM7SLKYU7tX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717670; c=relaxed/simple;
	bh=k0KzLk/Py5MfNs6v0LG2pawI7nCHX5oUhShrr2VzixE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WL2WVppBn1tVr2SBbX67Y4Y53ig0ztHnaT5xQybuBH9CfPZnE+wZKU40ur/SyREr30Q/ZowWW2IcstKhxrfbI42+yjviixbTRVAHo59wpPSx07Eq2y//DccyiKZ66UxF8jtPLMtMuY57q7M9sb6ORgiIRq7YLQoGXEVtz5eX7S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=z83gj5Vt; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="z83gj5Vt"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a18ef236ecso205922a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786717660; x=1787322460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=z83gj5VtFjkAiHbaP5tllsEnm5g9avTVjaG5f7qhRBe7QeTkgLAMXa8L5IODOCGWwY
         FNJTUFyKfYRXw4e7ndcV0UKA8fYPd30PgkA8Ul/LMgTgJiTu/J5grXB23zoozmB2GX6i
         TzxvTaxqASG1xSmMv89lgs58YD55hY30LDRI5OsjY92L6ZYKDWeIDYHqq9wcHI+4Pa+2
         69NjUBcBfdrilU5m8NIpZfyv3f0JUzUEA+gVKfq2idxb74hm1EjH6e/n8Onc/XE5RlpB
         QVD8Rb9lXweFZbjXgy63BYjIMrevNkwnnrmnd/TbmPxeW2m0sSiLtoZg6BkLOvfGrKJt
         E5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717660; x=1787322460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=PFRvvdUwuph1yJf0rf0Bh5+Mh5kGP0p8VhFSPeCkEYq53CxRixyjuFDKljQ99yvqmV
         NpgtIHWLQvcLTnIS3m6yJPWY8E+FtVx/gSqfG7ziR6G/NpNjPTGlYCwAWM9HTyJf2yPU
         ecohuNmSXJxy7gX6Db6OyA12+szC3JbPioSUvDeiHy/poyjVCkB1+Z6O6SoShSqde9+z
         sWuoOmJdH+4YxW+csiP/O7JTEWiMfqrlI/exRP72PAV8N4VQ6c4GZXDTsOB4IiW7vaRc
         VD+L0OaOYcGMlJovmY4ARW9KMJDUQxsYo/JGZGhEvR4YFS35/INPFpePyAqPmHJo2ERi
         44Jg==
X-Forwarded-Encrypted: i=1; AHgh+RrTS+PAMp+GF4+XucdeeAIbL/ldMFoI6hto3DQvfpYcrwok9Lm4pheDf+CsousVXTrjIiQHaasihqeMBA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxft9eTBciGlas6QoZr0yvXRyQMIkl9u1flJDk/58yA9lYDPg45
	EnH5OOohdDBwEePjnsazMTVFYFsXDkb8+D/QhWIhJn2J+ebVO62TXk+CAMaAUyddEpY=
X-Gm-Gg: AR+sD101v1OWbPfrFSpnuVDN0BTCIh3SdyeYZY/nvmrv2h3AQX7PvkW8QNFTQhEnr2G
	3PsqHemaz/UAzf8BZj1GMpG5jCgBmOJnCcrKDT/a2Rs1WYMyd8x6NwXz4J8r1zx0u+ERK5JD28q
	i3UQ1WYZJl/8mboW9gcvw9utw5+O+rWcuJcK08K10XMAzltQTITpFsVEscgQv8KxlLwaEYdIj54
	2ZLsuKsz5HIYZJ2x1USfTrSVqHxdkkAieWcAtXQNXW/Iz3yiQSrZtEvJLJZXaPs35tvEFGYvkJ+
	z5W4YL7PHPUSF6HAOuVqbgORuNKDFvOFn6oM9vNhm9iYAz3I3S3OJ8aMpggL1BYqD/X7EB9keXE
	nQR8QMJA8nCVj79l4Svs833+IrreQSHLGFFqx6XvBDfurnEKaiE5r4bLVt0F4nS97q5wO+Vp4kZ
	ha7m4/s05z/X7QQvW1mFD5DvFLGrwDIacsDNuwg0MJ665dh5kOo9/88dhZQ08esvHeTN3SnJVX6
	3onhNRgLrLYhz+YSjmDaon9UKURTli5Nzz69TdpNvkLyFNA3T96r8Xhow==
X-Received: by 2002:a17:907:9403:b0:c1c:4ae9:b935 with SMTP id a640c23a62f3a-c212a22e029mr175852366b.3.1786717659858;
        Fri, 14 Aug 2026 07:27:39 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c45ffsm106308866b.19.2026.08.14.07.27.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 07:27:39 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
Date: Fri, 14 Aug 2026 16:21:11 +0200
Message-ID: <20260814142708.79120-3-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
References: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun6i_dma_tx_status() calls vchan_find_desc() to look up the virtual
descriptor for a given cookie, before checking whether the pointer
vd is NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    txd = to_sun6i_desc(&vd->tx);   /* vd may be NULL here */

    if (vd) {
        for (lli = txd->v_lli; ...)

vchan_find_desc() returns NULL when the descriptor has already been
completed or is in-flight on a physical channel and no longer present
in the virtual channel's descriptor list. When vd is NULL,
to_sun6i_desc() is called unconditionally on &vd->tx before the NULL
check, which is undefined behaviour. Move the call inside the if (vd)
guard to ensure it is only reached with a valid pointer.

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

