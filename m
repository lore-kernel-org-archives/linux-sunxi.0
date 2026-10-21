Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617095;
	b=HO+q/To7tg4z2eG7W9TYGP/gtleeMtdKureGwcXkmEgiDP5s9kPTBgZuqo02wAxESwhE
	 YvDFtStZNbk1arU2xOsVMZJQry0vmDFc5j/e8NwukngTuS3sJwFQIIqX0SR0nbBu3IQE6
	 9J+O+HpFDqLwk3yaJXjBe8PpxbZeUJ0a0igCDKjY/YKTd1ZOdjNxQFVscDOd4CbvSjAlp
	 j7MgCzUYR9b/UZmQ9TU1dJen+csECGhvi8DniMycUWgk79mGEFdiWhCpAxl5M0rnD5pQc
	 OYvXIJEpTyHzyAZNXPE854a1/nmXBTq3R5ALqrPCECtT39HmTiH+NVqjgb3MZM9iHbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
	b=biuOYVOGjVGOcxFIpNERRk/vwXtkE8VIFDhlf0ing6u06yPV3n3MY+4158h+5bX1p1+q
	 xesR9Mght/izo2Os6pN1qEfsp7T8GD4Nk9AEkdqBZXYHAzjA52Qmn29mChssSja2kAOGh
	 DXzKFlwun/OTp/jb5xrhwPIhfRP5tqTFzUom5a95+KIDTJYp4nsSdmMmeMU/u7zffPs3a
	 YkMcRrpTLq5vkog7ECCQynM0ByDwcbDab50RG/okboK9gQE+Z2PGYWQRfwgv8iOSe+z/m
	 /mUf2uK+5XTM2jrPjou1RWbjTIOLckvYS3A2XDTg4ouFkKjrINdRgd5nEEdA0Ud2qWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SoAwhU17;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11495606A31A
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 21:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11495606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SoAwhU17
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6dd4f3f696aso625235eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617094; x=1793221894; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
        b=SoAwhU177uAetUEn+euy4sXKRZw+/gJrhrupvwrnpzf+DZ9SMxtKtHsXb1Idhks5xD
         Eqw4RnaDc4JlJy2Pd/nquDYXNwUitQ66P79l7yG1os5f/DCcwNn4lMxDDermYZPalpG7
         2keIZLn/8Qqqd+ubbd9TktiB0eW8a/T6CTTPrDbEXlvLxnd47rvocatP4DI1HvZr+Vdw
         tpZjQVuWaUZXxy8XWMwkJDxZ9pL/bX4JAW+5nBEqNxU88YLWpAQhvHMEhDgchSMPL9wN
         BKYTK9JcuOjPyyRIGCBEja71yXFiQ7a1SbHr6wfJZ85MQiEJs4ulxqjBGcSvmOJDFm9s
         iPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617094; x=1793221894;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
        b=kPzRvfHf1FRaZAT88PJ5J+bM24d2FLpr6GC1uhDzimP6YtAFNyuX1JwDKyXIup+Dt5
         FZjjD/b2i+aLpONxSuYnD9UoQpcdD5gvNaNsVLk1giq1OaKPahY8K13JGQJsb7qPgq2H
         c75L5B9t9QbqKHIKFzt8wdRot2MkliztBj2rX0IxWB7pry7QXlHixHavO/NLplrV1+Cw
         9dXn58oYBHwh/Ej+tCp2U09DC0XiEwMALauKDVzzuW+STNtONAOnjU/9rNgdGL2HYHjU
         jD3ljUzLOh6DPPCAOUu/rCDlUgxXeWFEhd4lY4kXfj432/MAx2TAGZ0jaFZeRNF1v5qf
         2DQw==
X-Forwarded-Encrypted: i=1; AKwUvBxm5HD59JiZafOoWnCzqSjT2/IEAAbEvaM1KrCikNMRlj8QdSg1dT+8wz60/dO0Y9hH0mJNbyfg7Bsr/Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYK7H4+CjaEy3V0cHTLyEh062I9tydcTj+UQEIVwbjcVIJexBKdk
	cP2CDagzjYaI6Hm5E+WvrUskw/i3OMcAwVcmYUBS741/kpDCpNLbisolAtPAQQ==
X-Gm-Gg: AYBFou0EA2Ey8xKDgsiiiJuTAgI/DOUpACFsf0x/gF11PE1/AnWsKTljiZkxde8D38x
	lVMrJEC8Itmlbqw8mhMLdDu9y9VWd8Vkzdx5/ID8BS/NCYQeqJn/vPQrUyb7Zc6H2iImJpTiySY
	kTGpRvnxyWA4tUDT9LRKU+qXezkY7QmhxccbUNifAEy/ZfvZQoQRebtQnbILBwpxAslax0IIBZs
	YzcH19sylP09n7VSrmapH/9xBjuhSki1Jk124tzO40zBFuyACD0bJ3M3gsLOw+gmyf6y6mjMqA0
	vCOBSu4M4pIi4V0CaaZfGBZgz8nygEjqh+JXW4/0qT7X0D9AqtsV9O7lvSjEVi73Dz2oVki2Ony
	zPD/PXqVjmDcuSSG0pdiCbtuQNxqgjxALoV/qpX9liks6sQmS1Ro9YUmyBjJUamezMWENiNmBKv
	vBw07Xedc7ETkSwikLd237HYkRWD2y3OHrHzEoH0HbcIshk/EvxQG1RfbgypTq79dFDdQzfX91u
	Ld/YiebV0SbkV2OxbmDHfNLjH4nPRpb9zx0GNw4niZm18oRFrxGf1rrW+75KhZob1tWj1517oQM
	jpkmJOBB9XQGsNLPIBEoTEm5R4CAOpeSoiMsKBZb5KgRkDjZtCYMVYeMht9DUgz1hb/gX4mDNkI
	d1iZ38EyPUm908GBk9Tz5nKQWGyfcb/ElSiJA7vciTxd0rYtfHOpajuHjH3wMQxRLRjuTfD5ccQ
	QY2zQ=
X-Received: by 2002:a05:6808:1645:b0:4f7:a3f2:d8b4 with SMTP id 5614622812f47-5536055db95mr2302438b6e.65.1792617094073;
        Wed, 21 Oct 2026 14:11:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b583fd57sm2806628b6e.8.2026.10.21.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:11:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:11:29 -0600
Subject: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
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
Message-Id: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN3Q6CMAyFX4Xs2kY2IlFfxXCxnwrVrJB1EhPCu
 7vJVfOdnPN1U4KJUNS92VTClYRmLqBPjfKT5RGBQmFlWtPr1miQj4uUy+GeIEQLAcUnWvKcIFp
 5w6qhuzjXXbW7dcaqYloSPun7//IYDi6aF/pc1bXhrCC4ZNlPNSpe5JEYz8du33+vDdddqQAAA
 A==
X-Change-ID: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
chooses the memory zone from the device address mask, rather than accepting
zone-selection flags from the driver. These flags can also reach the pool
metadata allocation and trigger a slab allocator warning, as observed on
H616 when preparing the first UART receive-DMA chain.

Set a 32-bit coherent DMA mask before creating the descriptor pool and
remove GFP_DMA32 from its allocations. The driver does not encode the
extra descriptor-address bits supported by some variants, so descriptor
links must remain below 4 GiB. Keep the streaming mask unchanged for
variants with wider source and destination addresses.

Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical addresses")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..0ef6ed1f936e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -684,7 +684,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 	if (!txd)
 		return NULL;
 
-	v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+	v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 	if (!v_lli) {
 		dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
 		goto err_txd_free;
@@ -743,7 +743,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 		return NULL;
 
 	for_each_sg(sgl, sg, sg_len, i) {
-		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 		if (!v_lli)
 			goto err_lli_free;
 
@@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 		return NULL;
 
 	for (i = 0; i < periods; i++) {
-		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 		if (!v_lli) {
 			dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
 			goto err_lli_free;
@@ -1345,6 +1345,11 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(sdc->rstc);
 	}
 
+	/* This driver uses unextended 32-bit addresses for descriptor links. */
+	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
 	sdc->pool = dmam_pool_create(dev_name(&pdev->dev), &pdev->dev,
 				     sizeof(struct sun6i_dma_lli), 4, 0);
 	if (!sdc->pool) {

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

