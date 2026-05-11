Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C184449EBB
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519539; cv=none; b=iyfCFE6K/pWaHS2wmK4Mz7PePtreGhUArvpx0XAz+rx5VdjoM77hXi8FCMDf2/ardRTK9E2Q7oD6gqIaHC7CrYMAE3oms0MOGM7DH95JYTlTuk4yTqvmJ4AxUmUsxrd3Mo5PSxVQ2+4Qx/so7dwXO0O0RGmyrN1fGXbYT6Y+pf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519539; c=relaxed/simple;
	bh=qSesX2ZDGhaCZrzr8oezoBtstChG//vMkmqR9KwS7d0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVmU8UketKnpqW3uTCXGgKhFpXP/e5YIIx23ugRK6GBO6BRG56FgiarPyVAtZ5FpF64DfAUuwZx5U61X+bekE9473j2nU+bfoVaJ/oOzLCQDN5KY4Kfxe9gNiM1Ae5eUdigb+2gvFSj+I2/a4aTa2o5Fu2Jt5uAb4zfRR5//WQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3Z7CTYk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3Z7CTYk"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a865d1547aso5116305e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 10:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519536; x=1779124336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s42sCXaEIYI2iT8o/2WjdzJavucMWxgVZFV2JYX3rF8=;
        b=B3Z7CTYkzhVrE8BFrYHdgAuTwy8+BSwTgCdNwDAfmzo8EXhxjIAgXs8heTkI5T2raS
         TQaEFInqh9FahsI1g7U3aB/jL4gUv/xrVjQMv5nsoCrXTLpZVD5eSAC9lL/J3mUX9PyT
         hFfYKo2v0iNElKbmOuNwpfKFAY3gOviwbY4fI7fjR4T8ApYPtfHrqN7VP2MYVM1F412+
         DSRkSFQBf32CuOSehHZOI8BV8bgoo5u/Ts3IAtzXcn4MsRElr64VpoQMvzeo/eKw0cIN
         u8lggt16MyrS6MByq+igliPCH51xBw3Q0oijlnrEA/T5RzE4sHpsfkMwT/ySShxLSe0x
         airw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519536; x=1779124336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s42sCXaEIYI2iT8o/2WjdzJavucMWxgVZFV2JYX3rF8=;
        b=IoMdhBGbpH5Es9zMlt7d46/+yuG3yKDRFNHbcv2N58a4K1A0fYq9xMWjjONBAuiKSa
         DrfRGKcRQXqdlOWH1L5dy4MKzIdIeLbZYK4+KTh8Gmeoty9+PxRkjv4QRC5/SPHvX/lm
         bDTmM7UJHZmFX3UemAjyXU/wuXmVDpI3Almjr+9QJF+wLyaUWH6FgFllv9nMWKIS3G/9
         pANZBbXE1gP95MJB0XuKhbgJa4MAHsIUrO44vqIQbXH6lc0NdhZlsTFE67FSrlIYgpcL
         2V0RSuRONRuYEUM3LODMDpHAsHXPvQVlnAUK9CNxr4CqVRpeE8MF/HPxsbkPqj0iKEdc
         Gljw==
X-Forwarded-Encrypted: i=1; AFNElJ8Y1rUXrt/jIXgRw+BgrqxtC6VcdkyggFWn6nGwdpRDKsYWOb0HDD8SODBRQoHyUThKjttg2WP1XqBMNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsEOTR4LYqFwZhsJBLqzg99Mvg5dVSm/Wre4O5KcY4Ov6UkxZH
	4Rwf+60MyebQAkL3+ZmnqRytWJsSyFlGm/UDAwGnB1wfLWKVjUDEq/Ga
X-Gm-Gg: Acq92OH3bgOo7FtszLAO4HOcCmkIwe9RUHoh6mHzl76zVAkzJEApyYg3xD5mvQ0EimB
	0aZG3NKyh58AIYZpmlPqCUdvtPWCsxn/Dhcr54IHrJYKbdfG67XviGLZFwHEUpReF3bV3rJFRjo
	omxm3TekBLWXbJsEjs1OBt9Wf2T+THuGbn49Y9ZnXfWRktRPCyfkwDx8dZn5q1PV9jfeyunNKrD
	7vbEwgMvnzaUM8f5p/mwxzdp8ksEwvR0U/TeRyVc4FknAjAnCCAzElHFcwHaGQCyc0Tjm1i10Ln
	i5HlWd1q5WFYktU5vOh0WHVVOdFe0v7c359B9pTY+GsLVsG7J6yVMwsgxMVnH/OUfLUU53hr3S8
	vEo71Bsy1rtu3N1yqGGcBJA1NVhVcVFUls3eWnBvpZ29jlJVZ0WCPAJH4n3cSYZSRvhYpyDgU8I
	S1/jLKO5it8p1YIYMtRnJOZClLoXuXdOf5O3XQv6d1M/QzEyLifg+PYTFxRPnfBedlEQoFYoQ=
X-Received: by 2002:a05:6512:a8c:b0:5a8:99dd:1648 with SMTP id 2adb3069b0e04-5a8e0c8c320mr110927e87.0.1778519535453;
        Mon, 11 May 2026 10:12:15 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:15 -0700 (PDT)
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
Subject: [PATCH 1/6] media: airspy: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:06 +0300
Message-ID: <649601988189f031670215cb35add5e80439559d.1778518085.git.vebohr@gmail.com>
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

airspy_start_streaming() returned -ENODEV early when the USB device had
been disconnected (s->udev == NULL) without returning any buffers that
buf_queue() had already accepted.  Take v4l2_lock first and jump to the
existing err_clear_bit label, which already drains s->queued_bufs via
vb2_buffer_done(..., VB2_BUF_STATE_QUEUED) before unlocking.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 634fe5033951 ("[media] airspy: AirSpy SDR driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/airspy/airspy.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 8f6b721ba107..57edb42463e8 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -522,11 +522,13 @@ static int airspy_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(s->dev, "\n");
 
-	if (!s->udev)
-		return -ENODEV;
-
 	mutex_lock(&s->v4l2_lock);
 
+	if (!s->udev) {
+		ret = -ENODEV;
+		goto err_clear_bit;
+	}
+
 	s->sequence = 0;
 
 	set_bit(POWER_ON, &s->flags);
-- 
2.51.0

