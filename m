Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA4442391
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Aug 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975059; cv=none; b=fAheyGHxdir65L1/3xCnnj1CHSCCqjXC8IRPIFZnoslxXRLyKg8yKnBC0GtpIWI6pC1X2ILiU0xfsmZQ6weBqpONOznkYq9cIbaL4Q1CCpt5Zh/1ww1/AaCakFF9F4Lm3jMIh6C5rRd7pGQtZI6ikHoUcmy11QGOT4QBbyAfl38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975059; c=relaxed/simple;
	bh=k0KzLk/Py5MfNs6v0LG2pawI7nCHX5oUhShrr2VzixE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mH31N6jxeDgkKHHRTgJghOzlIfhUjv0fFpASIoPWDfBg5zKM830sMFST2Af3hHTSbTCqh4oInNA3Qsjvmj+DoBGWdYEWGoLocDcExs4b0L/BCyhgpvft64z3Rf6bmDkUco38ByPLYUlMR3N2xoJmP50Xkxf2SMAvBa1zh6h7Gew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=EZu5tXCo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="EZu5tXCo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69a1c7ce59dso589362a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Aug 2026 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786975057; x=1787579857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=EZu5tXCo+X+M4RPxlBfc25NmOQCPnAAw2XMfEAPuTkbnvHES7ciwogeYO4NRfAwh33
         u09PjLzsNu/hDjdqUHUkhJVKFZ7PcVOwST7msN0wmInN3I0wCw6kkCdLf5xxIL5eSA3z
         I+C+sVAr4aYCY8g2dHMZQROXMMJ7LCCyZsDDNv0sIAMV/V5lX3sJ0M1ujBJFKNon36F0
         7v7JaCd0owKEARZoDmtbl84RlXX+jJvIZ4i6u9d8Q2nekpJQEYda5h80xx7mvGjzx8KE
         z+a7BFkE2SgqTbq3DafWFB0cNOEZXQMGVqzC9TbP+BZXQJFbq33kHmW/C3D7kf7eRCoJ
         ToAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975057; x=1787579857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=AxWwuk38ZkYsogWVgTb0ahndvMKruBlCkut/aPwl5sxW5ZuPLKzzs/dtMhy6HrvkuJ
         8YTsJ5jMppZrpRsFbt81v1GEg75F7B+enUrwe0Fi4/+FAtcbGCGzbYiRl++sUvGc+YA3
         A86JIPcIcvKZW8tJtzruYqGLgrMEEYhdrnut1GW4Zgs7DIU1acSpfqkGD39zJjdrS1hJ
         QhpqbJSGTrJH03t891elij872WgtmyChgHS1MrQSqo5Gb94f+SOWYNT2dd3XNLH+KU5p
         uWLGkDUqqra6OAezwDyBxC8keeXu4GdhIxY53YzuF8krMx9PtVd7fplCh2gRNFBwljwI
         d7NQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQ/FTkWbVh5pgKc6/zLaCirVnj89D+T9dcMrAR/qPru8JII1r9Sf7Kkjx4+jqB/D9mVtyxV0jZpS3UTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwD21PRTx+UDCmTKaxdOBJ+Wun5cBcEodR/UTlzN4U9pF7vWFMB
	IZIgj1mJEqFpSlBQxJv4sv6m/imycNbNNicoz8KXoPaeq7yvgRWwZvKA52kQtb9Nssc=
X-Gm-Gg: AR+sD10X/7e7mmKcoQW+NrCHODLwc/SqAQIpsBM1THJ1H1aBpiyyP5Vqfctu/eLSOj4
	tX2twTP9wUbUSQS5QoMa/4ahomlFwYud3Ha9fOjqY5HZvlmsKH/PlJZZAjrhBlyAeCKmrWbB2Fz
	Q5y2gZdb0HeH40H5P1rSroXbGRf/QVoHsgb7SnNe9H32Nvf0osf6HZNcNchXtrYz7dfAvhUXeic
	7maoSTrw64wkcRL1ptEbgi+yl9IbhwEqM4NFCN7Jya2oW3Zlp27D08cSPF/7g9W8JK8dNdniaPd
	YQjDlOc+NgaG4gkExylvE5ReJTknVkhmaCeAVo0uDzpDB5ZtEVslcPP65vt5EfrSAX2eEE1OBjN
	tYxQ6dA+bVQpE2WblmujVEZKENwSaaE7JSCjGt7BP07TnF2Qv8+Eph1qSliqwp+O0rePD48kCIL
	/wD8EPsf4yRApGSW2pbRm0Qei0mw+JYJATRKKA7h68/Ym2Al+pRVZPLg/f/Q9BQgHdqcPvkbgPe
	4zR8aCjMgiaAaX6xNgsOpHxu4JOLHSQvFT1/PBlIP3PgZueP+PicT1WpGg=
X-Received: by 2002:a05:6402:2812:b0:6a3:8446:c56b with SMTP id 4fb4d7f45d1cf-6a38a8bf430mr6474052a12.1.1786975056608;
        Mon, 17 Aug 2026 06:57:36 -0700 (PDT)
Received: from Mac.localdomain (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85319b1sm810238a12.13.2026.08.17.06.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Aug 2026 06:57:36 -0700 (PDT)
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
Subject: [PATCH v3 2/2] dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
Date: Mon, 17 Aug 2026 15:51:23 +0200
Message-ID: <20260817135723.12807-3-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
References: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
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

