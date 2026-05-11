Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A032346AF2E
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 17:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519550; cv=none; b=epeXzgejkuQd/vJzFXLeSknc1ZAZ24dSUpyGmRhPbyHf35nBQThNZYTB/LanPegodM9Mtm6rKjw+R2gT2+T4Kzt+7Sl2g15NFFUAnVtJCgfag4Hln1jvMFodMWvFDp39owz7z7c6fwWgPt1UdNR3nD0W3Hh5oG/hPAHu/FmSZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519550; c=relaxed/simple;
	bh=Gt3yIVFcMfYZ48mYTPU++4MAqYZaXfW/cae5IEUlc88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecPCjeTk4To48sk+3wq/ucuRIIis7skIAbVbvsC8m7uXxQd90mBjzBkR7XKIfacyTAzVscqQ+TCWi1VHErpOzsetn2bIMONk1V7yLT5MDC3bC0W8ibstaj7xyMFVaaOCKn3qdqF6NDcZfv9cxoLSMfiE05t43UahMEjGcOW00nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFKP808I; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFKP808I"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so4971139e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 10:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519547; x=1779124347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HLgvNKbFd9dvErpzRIPe7Oy/Q20OX1O2SmZxWVb8gM=;
        b=XFKP808IN9pyJ4MsInVdmvrZqkkU7x1MDSrO2xwjI3NqFiPQ3K3XigHDopN4xJh/AU
         X6JTo0Ho3aLJEdJKYWWnSAdZT/Nd8OV7GuQgZNVRC/2YQanUoQ+jPetQfydbCrHv88rs
         PpVUQ2Y6uE0n3mGEYMhE1AMjG/vcLL1I31PFarhnq49I56cH4hJVYBbRWlee7wzPcySK
         lwmW8wLT+h+gunJ6tnwBv3Ua9u3AOu7i+UIeVxupjo0bIB3HDIX3oYfya3aoOH+AcMA4
         3+4VyN/diw/URjjT9ByaCI3kgLOKuJWaSjcy+BD9UeWTCF4qkmovm6CKJMIu4SGcmToQ
         1bDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519547; x=1779124347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7HLgvNKbFd9dvErpzRIPe7Oy/Q20OX1O2SmZxWVb8gM=;
        b=qykWvAUS/ansiC68umv7OrxyeR9B9AXYF/UvPnlX8qlrf2wzePwgO+Yi/3C8geF5gW
         6xblGq5+RAMTXUO7Yy0TpElyFsVng5tVUn7MBqLBhOUJsnhkOKJ45c+SSm0HsNywxeev
         g7YMtoO/nMik5or+CLwF+0B7PBkAxmY5tOo6ybS7Ei8z0bGc3Dg95rm0luWb0P8zwN/c
         7wiBv0kd+KiEM7XAjAye2zUkO69m5OrPRlYhAMULeZR02/w+hdEZxUSil9hTBVcKdh1U
         QUpMrLSrkL2A62ePwJG0O8+o6ldYuDeZD27Yrd4sxfK/1QTBeF34kIL1fCrByL+6Gyk5
         Ak/w==
X-Forwarded-Encrypted: i=1; AFNElJ/OAC0yHX57tD84QxPrzPV0deSHaDj6ubAhlhNRuILdHUi3hG+RxLjhGxbZeKqYlciumjf/kyCv7q/8kw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Y1BoILgWY3D/V98cuCCplaDZrj9kcc7wCNGXbsX/U7anyU5z
	Q4CThLZQ177VrJ3SBXYV4czC9QDdRBZgSOrY15eHdJ4JfbZe1cmc7R/J
X-Gm-Gg: Acq92OH2wC2HWJ3f+xJrLzb3LEwPJ/y6nJSMqLQMGdGw9Y/Ng1BP9X5DcOy+y+lEqmk
	q/G9HOSl1DIaGgLVNXasUBXik77Hw8x5Pr3e1cDbNXGYTrS7GaZnIHDKoi9cVmY3030UuxsW77k
	ATSaDNDXeW/6zM3vmQfjN7V+ZgpIAqHNt/EHBl5F652oWuRJz09TwGlDNadJzzCq20M46MPTjE7
	zGWK6/7sbvR+Rf5uGF4CgPE51RtLMxWQSpnBlp33OtbAK1sj4KRhG+k+4Ow6kuJ+ODTjJ/AhrEr
	jA2loHBHA8vMcmGO3ZftDhOhLXdvwMlaLsGsaIjhEZhOxk4vizPGciC75iYvAmQvSR0QK9zDjsx
	WvU1WH9AH4bbUv6Vgs0iXzJez1kuPAWDaGBvHULaHlufWpVsDyopdM+10NGctTKA6iU2eTzTQTC
	m5j4o6ACn4Oguf0eo0rdruIZ9id6kNK4ZBh2FDuS+PpEF01QgnyRF9dcAV9HIV
X-Received: by 2002:a05:6512:3d8a:b0:5a8:a558:63b3 with SMTP id 2adb3069b0e04-5a8b709b088mr3026360e87.30.1778519546521;
        Mon, 11 May 2026 10:12:26 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:26 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 6/6] media: sun4i-csi: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:11 +0300
Message-ID: <b914d204dbcc642e56a8d54dff33c94f1a9802fa.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

sun4i_csi_start_streaming() returned -EINVAL when no matching CSI
format could be found, before any setup (scratch buffer allocation,
pipeline start) had been performed.  The remaining error paths already
converge on the err_clear_dma_queue label, which calls
return_all_buffers(..., VB2_BUF_STATE_QUEUED) under csi->qlock.  Jump
to that label directly: the intermediate err_disable_device /
err_disable_pipeline / err_free_scratch_buffer labels are skipped,
which is correct because nothing they would undo has happened yet.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index e911c7f7acc5..4781db21c205 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -234,8 +234,10 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	int ret;
 
 	csi_fmt = sun4i_csi_find_format(&csi->fmt.pixelformat, NULL);
-	if (!csi_fmt)
-		return -EINVAL;
+	if (!csi_fmt) {
+		ret = -EINVAL;
+		goto err_clear_dma_queue;
+	}
 
 	dev_dbg(csi->dev, "Starting capture\n");
 
-- 
2.51.0

