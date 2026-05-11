Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247A944BC91
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 17:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519541; cv=none; b=quotdclDFqJU7UWk5w5f0Z6O7BIkZ6b5nix8biHnXyUDXuc0wFRrnBtCeEPr6ODfwOIWJ2e8FaKK2hJL2L6kT+eS8JH1Y7mMZ4s3ArjZCd3tOCrXhgIDVoLBdKmLX40JW2oO7CHfFXMZ2/sNXx7MIsV9f8/WJa/+qCK7Gf1PDjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519541; c=relaxed/simple;
	bh=4DlyG+iXICv8PFIjVe2HgIrTduPnzOhVbzvai6W3884=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohUbcP2h/vPWpTzCAMGDb5KOudD2VzA8A3RXTyOtytjQIdRXLvR+LH+KyduIkZK3wFYxUDvP63Wy2dImwTaR4zzyRcro1iPjktFaZ5cqN3Ywhcg7EJ6xcRgdbOEOyBKwKdOcf00CSmZfXeEtwX4Yy88vYgCjvHIowkcJNo9nxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfCP3rEU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfCP3rEU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so4398446e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519537; x=1779124337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSIxIJUh3eL2dSuA1xrUNZiqoyBIDeeVRxEk9r/yyRo=;
        b=YfCP3rEUSNJ1jUNnvn3/Mv1gZqc3npy1qhoyh1RYzd/mk/gZdwuZwxs+r9yTRZV311
         2Gh0fB1o/ieBlSt46bcP2jry9vdEgrsKuK/WS8V/hMCMXyJfyQJMvHuNH6W/oSmg4mAZ
         l8tCXpPeCyOdSzidxNp69TF9Mx2EI4H8+qu0jHdq5jSTSMu4WC4Xk65/swTvPblPO7R8
         A58UiZoRi/E05dj7meZUYfqYW+ufoZ6F3dQqA3Q2eJ17Apg2yDRRsQWx0/RqSA/JqKxw
         ZxwYIUnvxGg4CmGcEZnOTpCJwe9P6bac+hMJGaV79SHypis/ji8+9Rw1serZJjz0VCjT
         Ku3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519537; x=1779124337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSIxIJUh3eL2dSuA1xrUNZiqoyBIDeeVRxEk9r/yyRo=;
        b=RLu6pm+HQYJrQjTjSKFlNed0eGLGmZcTxLBrWgntT1/mW4eI6J9k+8IgO8ROjL4AzN
         jec4mHwULCQg1hBPGJW3+mVYjLDRJDLvWRkxzpFpeJPaGzoNlXrYT9oVRagfGWt+Nf1r
         pyUw0f9jW0ceBlYwqo66OZbIDJ+8QrZt+NrKbzd896tUMM/dH/gbIdqf3brSOyTF1c40
         8xfGosV5O9ZflF0SkGImdW9LxURUwHx2De6cNLjFHDfHTwSm9C7WIogdqhDBa0vK+efH
         5eMt2CZBDrajQhedeA7NFzlh3rz/DP4szNrax1Mujzk/QXsWA8UmMkUScls3XeWZ1iZV
         e+GQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VGWifSLtzK0BHz2B+v44mDsUsCdlm/W6h1L5kRUMKnNjrPvYrUxLNgT6Iv/miQdXWNdFoXbZUXC2XvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxg9pTvfReuKeDwJbEQjZc0so/dg2TMjvjJWmlev9ar65bxGUY
	Tn1Z1baaEH5DUWEpuJssXissShCVLlDPnU8BntPP0w7fw5/qDBf5HrQY
X-Gm-Gg: Acq92OGYzD7ukaWSDK7u8uD8Fa/5Mhr7DGU+lVRamKrcR126mwY881avFnFECOGJqES
	6uBLQqWwm/Q9/DPheCNM4c8msYCxvQHW/fRXlSz5he9mmOu6qYp587QK9gBFa7/4f44ZmaO44ZQ
	Ygg2+pa8cDtuBxozEelF3ToUdkq8P3BYhfS3lOaOPScGEBEqV0eQSaNqcWRTNrxWpyse+TZn4gl
	SUOoGuRO7RiavdsFmXeocz78bkgsWvDHDLPx9oUqYA8X6kdmoJjdFhQZnr0rfX09yP34D7LnzMq
	U194tG4raDWohfClxcKPbn8w08cM7VsPfH5x1cqltxhThJbsy2U1EcXIWXYOEV328rjJqotUq9t
	QXmU9GlshlsKTzwvNjUi3Fv36vh/EUYUGJYuST4HlQMZipyd+9cevN3Mo6fxk8MAcW6bXHZuzKG
	SF3ywf7I9o002HByXFO+Ltu75fCvZBmLhjQgCNSkulndEoldWkINZh7VKeUGdw
X-Received: by 2002:a05:6512:3ca1:b0:5a8:7be1:24c8 with SMTP id 2adb3069b0e04-5a887ceaa65mr9581194e87.37.1778519537055;
        Mon, 11 May 2026 10:12:17 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:16 -0700 (PDT)
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
Subject: [PATCH 2/6] media: msi2500: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:07 +0300
Message-ID: <e3052e648c898900582b7bebb6890ff4042100c0.1778518085.git.vebohr@gmail.com>
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

msi2500_start_streaming() had five error paths that all hit this trap
and were further tangled by ret-overwriting between calls:

  - -ENODEV when the USB device was already disconnected
  - -ERESTARTSYS when mutex_lock_interruptible() was interrupted
  - msi2500_set_usb_adc() failure: ret was silently overwritten by
    the next call (msi2500_isoc_init), so the error was lost entirely
  - msi2500_isoc_init() failure: cleanup_queued_bufs was called, but
    the function then fell through to msi2500_ctrl_msg() and again
    masked the original error by overwriting ret
  - msi2500_ctrl_msg(CMD_START_STREAMING) failure: no cleanup at all,
    leaving isoc URBs submitted with no way for the driver to consume
    them

Consolidate the error paths into a small goto chain.  Every failure
now stops the function, drains the queued-buffer list, and returns
the real error code.  The ctrl_msg failure path also rolls back the
preceding msi2500_isoc_init() via msi2500_isoc_cleanup() before
unlocking and draining.

The cleanup helper takes a vb2_buffer_state argument so that the
start_streaming error paths can pass VB2_BUF_STATE_QUEUED (as
expected by userspace on start_streaming failure) while stop_streaming
keeps its existing VB2_BUF_STATE_ERROR semantics.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 977e444f59ad ("[media] Mirics MSi3101 SDR Dongle driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/msi2500/msi2500.c | 32 +++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 1ff98956b680..0614087c3c3c 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -541,7 +541,8 @@ static int msi2500_isoc_init(struct msi2500_dev *dev)
 }
 
 /* Must be called with vb_queue_lock hold */
-static void msi2500_cleanup_queued_bufs(struct msi2500_dev *dev)
+static void msi2500_cleanup_queued_bufs(struct msi2500_dev *dev,
+					enum vb2_buffer_state state)
 {
 	unsigned long flags;
 
@@ -554,7 +555,7 @@ static void msi2500_cleanup_queued_bufs(struct msi2500_dev *dev)
 		buf = list_entry(dev->queued_bufs.next,
 				 struct msi2500_frame_buf, list);
 		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
 	spin_unlock_irqrestore(&dev->queued_bufs_lock, flags);
 }
@@ -830,25 +831,40 @@ static int msi2500_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(dev->dev, "\n");
 
-	if (!dev->udev)
-		return -ENODEV;
+	if (!dev->udev) {
+		ret = -ENODEV;
+		goto err_cleanup;
+	}
 
-	if (mutex_lock_interruptible(&dev->v4l2_lock))
-		return -ERESTARTSYS;
+	if (mutex_lock_interruptible(&dev->v4l2_lock)) {
+		ret = -ERESTARTSYS;
+		goto err_cleanup;
+	}
 
 	/* wake-up tuner */
 	v4l2_subdev_call(dev->v4l2_subdev, core, s_power, 1);
 
 	ret = msi2500_set_usb_adc(dev);
+	if (ret)
+		goto err_unlock_cleanup;
 
 	ret = msi2500_isoc_init(dev);
 	if (ret)
-		msi2500_cleanup_queued_bufs(dev);
+		goto err_unlock_cleanup;
 
 	ret = msi2500_ctrl_msg(dev, CMD_START_STREAMING, 0);
+	if (ret)
+		goto err_isoc_cleanup;
 
 	mutex_unlock(&dev->v4l2_lock);
+	return 0;
 
+err_isoc_cleanup:
+	msi2500_isoc_cleanup(dev);
+err_unlock_cleanup:
+	mutex_unlock(&dev->v4l2_lock);
+err_cleanup:
+	msi2500_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 	return ret;
 }
 
@@ -863,7 +879,7 @@ static void msi2500_stop_streaming(struct vb2_queue *vq)
 	if (dev->udev)
 		msi2500_isoc_cleanup(dev);
 
-	msi2500_cleanup_queued_bufs(dev);
+	msi2500_cleanup_queued_bufs(dev, VB2_BUF_STATE_ERROR);
 
 	/* according to tests, at least 700us delay is required  */
 	msleep(20);
-- 
2.51.0

