Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EEE45348A
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 17:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519545; cv=none; b=uyCtQozyZzoBkLuJk4Wi448r4DimQ0iV1+B7NAUnmF9p046yKJn4jfzr6uqL8bh0xhYketauV73723YV6Ms0KIlw84WYq3gpH7ZjEjYKc9/EOKNwvlZXm4+Vu0iPY6A3IwhRLloQA3jJT71JEI+hOTuH14sajj6NURuBtEqctQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519545; c=relaxed/simple;
	bh=Uc/exHc2g0MJR9S71NefJro1J1WlH0FhS5OXlnyqzIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXI8i3w+/fjI3Pl931hX09OOfEawnZyqZh3o/kMzFGqSkXtQq6cu6DEiElol0kM7dkYIj5c6pnhm5i4WAyUnr5FxyrvlrSkHJF8qC2CsKzVgEubuTpACSKAiodeff3JT7zmMRNHtS2mrKltfFbuqb6JYWct9pWgAbBfKFcVwjCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8ifwhHq; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8ifwhHq"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso4164506e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519542; x=1779124342; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TypizH+0naDcsiSshXyXpAX6OorxUGA4/sCVC58lq0U=;
        b=j8ifwhHq23bdoE5LnTN97BD2MLZcVCXgiBM/OMNMSK3jGZhOo07kxq2xWTCQXLsjIq
         S9/Yqw0kfH31Zk3225WqZyY3ilZQ1vPCODLsYJudAgbGyhmWFgIjTqbW+y4rPd80S0e0
         +XFaz9P6yhI2QuIKCaywoby1v7Yfp+cDql3IKgLirZd+dBtEk57TnsQRA2hqsvTfRXny
         H0SeSDTrbZtUX07Lit9lubxZsxZaAVw53dcKuTOc8jmlkdqofZcPLxdP59LuHhCq6SHq
         ze0/4Q4kD/lyNOYxWwjW6X7EoY4Cx8lFHTonhenXu8C7/3INswLIYEgwQWTQXTUt7vj0
         Q/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519542; x=1779124342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TypizH+0naDcsiSshXyXpAX6OorxUGA4/sCVC58lq0U=;
        b=FB2GCB3WWzwH6ITM/QeCLFJCooZCU1PKpRsvMsJONC5gkiN/tuI898ICJP2PAGEipr
         PBR+3iirasri0pkRecoJP7X7irYCtujq/wZC2m8RtFoxtlEnihKz51tDempZbRCdaFVS
         mqSDKm++A1KG6pWPehgLlt9kPPsk6uxTSFlV0OQIToDVACe8U1vNCVbWP3xUxk7P9HqQ
         yRvor+Xa7Tup4N9GniB/kouohHBiJfGgGWqpY5FE7HZigaLyTA2vyrVuCyOuDc5DiGDZ
         Q7sNppLsArz0UOMtlKXoTEtjX2q4O0/EXIzBvp0hjFAkFEurhnfr4Y2HkHuPpXBEjFb1
         rcGg==
X-Forwarded-Encrypted: i=1; AFNElJ/8IBiT9g3mgcGh9eCxNUIUD8rn1S023KVP0uY+4CkylZBFCIlJ46FWkcBkksG9EYyyEHCTF6Lv68HJrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbexuYentVimr6zqhRLapZ402hScJxbQpckoj4HyTxjT6GXlAc
	r+UQBqUddPot13oWzND6WGfy5wum5SR5jQ3gFK9jkHlBKN0wK6Z9eKmN
X-Gm-Gg: Acq92OH6rOfPzqw+T0DE1PQDmkBEr8erPZwQpF0RG1r+dfcQTA/mDZeVowKBwYo5sNN
	CtwwED1Jn07tOtpJBQ4TSYZnONSriZjHZQLzYEOX66e+bNeYZIbCEG9NDZEPXyDEM/Cw04sYbhX
	ICmCUPb7BrxxB+/O8Fh0YvxogKg+qx4XofP17bGC5UOe7atUke6WkUw7v9CuJM1TFgEIaws/dc+
	+VwqUFEa5ZCMYYuzCWg+Pd2/WPMznrJqmDyIvwww4WJtjZ/+zlWG++XmahNZZ1BCHa1Fq9CvtQ3
	d76y+Q5e+QhSrB0OpDYf3XJ4p2XDk99kgMQl13LO7c/mTYdlVmdTmsOAO1DK5mHHYI5H2KsJKM/
	b/JpcYANYB56Eoq1JYv1dUpHazosKH520OGcHpOUeHiz/sZqLNOSX4EKVfzCGlm4vl1bh2d6x7m
	Nlu8t2lwIUURRWxmpVtd4doLWFszmWa0qcR1Cq6/BW+7izBtrWo2s5hoOPbtpNpVLmN37Fucc=
X-Received: by 2002:a05:6512:b20:b0:5a3:fe60:471c with SMTP id 2adb3069b0e04-5a8a94a8fcfmr4465968e87.16.1778519541397;
        Mon, 11 May 2026 10:12:21 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:20 -0700 (PDT)
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
Subject: [PATCH 4/6] media: rtl2832_sdr: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:09 +0300
Message-ID: <d10ab7f1bb6b4ee1760967f1957191a341b08354.1778518085.git.vebohr@gmail.com>
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

rtl2832_sdr_start_streaming() had multiple error paths that hit this
trap: two direct early returns (-ENODEV, -ERESTARTSYS), plus six
`goto err` paths covering subdev s_power, tuner setup, ADC setup,
stream-buffer allocation, urb allocation, and urb submission failures.
None of them returned the queued buffers.

The original function had no distinct success exit and fell straight
through into the err label, which previously only did mutex_unlock and
"return ret".  Adding queued-buffer cleanup at err must therefore be
paired with an explicit success return; otherwise every successful
start would also drain the buffer queue and kill streaming.  Add that
success return, then add rtl2832_sdr_cleanup_queued_bufs() at the err
label and before each early return.

The cleanup helper takes a vb2_buffer_state argument so that the
start_streaming error paths can pass VB2_BUF_STATE_QUEUED (as
expected by userspace on start_streaming failure) while stop_streaming
keeps its existing VB2_BUF_STATE_ERROR semantics.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

The err label still does not roll back power_ctrl(), frontend_ctrl(),
the POWER_ON flag, or stream/URB allocations that may have happened
before the failing step.  Those are pre-existing leaks of a different
class and are not addressed here.

Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 422d1a7b5456..c564485e3bbb 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -399,7 +399,8 @@ static int rtl2832_sdr_alloc_urbs(struct rtl2832_sdr_dev *dev)
 }
 
 /* Must be called with vb_queue_lock hold */
-static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev)
+static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev,
+					    enum vb2_buffer_state state)
 {
 	struct platform_device *pdev = dev->pdev;
 	unsigned long flags;
@@ -413,7 +414,7 @@ static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev)
 		buf = list_entry(dev->queued_bufs.next,
 				struct rtl2832_sdr_frame_buf, list);
 		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
 	spin_unlock_irqrestore(&dev->queued_bufs_lock, flags);
 }
@@ -855,11 +856,15 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(&pdev->dev, "\n");
 
-	if (!dev->udev)
+	if (!dev->udev) {
+		rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 		return -ENODEV;
+	}
 
-	if (mutex_lock_interruptible(&dev->v4l2_lock))
+	if (mutex_lock_interruptible(&dev->v4l2_lock)) {
+		rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 		return -ERESTARTSYS;
+	}
 
 	if (d->props->power_ctrl)
 		d->props->power_ctrl(d, 1);
@@ -900,7 +905,11 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	mutex_unlock(&dev->v4l2_lock);
+	return 0;
+
 err:
+	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&dev->v4l2_lock);
 
 	return ret;
@@ -920,7 +929,7 @@ static void rtl2832_sdr_stop_streaming(struct vb2_queue *vq)
 	rtl2832_sdr_kill_urbs(dev);
 	rtl2832_sdr_free_urbs(dev);
 	rtl2832_sdr_free_stream_bufs(dev);
-	rtl2832_sdr_cleanup_queued_bufs(dev);
+	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_ERROR);
 	rtl2832_sdr_unset_adc(dev);
 
 	/* sleep tuner */
-- 
2.51.0

