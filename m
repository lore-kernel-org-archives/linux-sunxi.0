Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86219441036
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 17:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519543; cv=none; b=bVLIia7d14wBe52XwkttFlSoUftEG1tm6zKFcerDweyqTwP7Yh0L+b5vSP8lNC6e8JBiza/OWlVv5Wbpv46l5hVN4krWc4XtYdgciFO2XJD1noZGi2332I36amjgLQgrOOGJNA8tf8FPlVD7yxJ3O5X3vkF15JFcri08b31qtRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519543; c=relaxed/simple;
	bh=Pm0arqbEMJSuzVfu2XbHYEXxhnKaEaOHkvubnY5Jb24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwVP/SFlSbq/7mPV2JIXKoCT+WwbKvuz29PZ7X9xjBMIUav6wjmW9NLSNELXhcIPOe8VKuVrvlxErtzX6HOrKatcSqTps/UBt8+xECI+nUjmFO7aJduQVPDJQE01MFmHLMUSDtiouCI7Ae7Cjn5PT1xOCbLMzvmGy3U5IOhFzzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXmiNaWJ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXmiNaWJ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a887ebb416so4275852e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519540; x=1779124340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JH+u+xhzUiMSlilufXXl7nt5EV8IiDoOquYIB5049q8=;
        b=sXmiNaWJvQJ83LigbdfhczvdMhPK9fyDTsK8kzkpFOm8LjMs4gjnj+m0EraoRZub3b
         ETrN3ox6a7hCuzpzC++7tST7Lu8e8Fo2cAU49JCm1CVlwH77/5vKjxfTFbmr4MPHs7BX
         GsE/iC4pRAb/90RCtTIdHsz6xSl50vDQdYeX48P0aSOAv77BkJd1hmcN11Z2CBoAGpky
         sJveFxP8ziwS7uRyuQaVy5/la1fINiOWEiUMQDxVx65YO3+H/I4BuCNTFwcqzEGJ8dEn
         XJhYLPZztPf1ZtAVnWl630hThTO1CnEVr2iOjRKkyWe1L3JMKXjcjFGAxXUJTZTm5IZs
         p6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519540; x=1779124340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JH+u+xhzUiMSlilufXXl7nt5EV8IiDoOquYIB5049q8=;
        b=FKFIMx4YwuzWgbpRYM9cvvyD5vD2HwxAtIkTJ/jGp1NRWROiLsvhjDUmMOxtCmbjP6
         xgnDDx/sozTAdYi/TSR2mtp8JP5myFxBnTkG881lEI6PMro4h2tPD8PoyU720V8kvoqv
         Mvyae2KkBD7M6fi/SCuV0TXQ4/Z6CrdANBTiMoOM5WYV7w2hD3pwzdoyPA05vtoZ1+61
         BIKRHtkhOxMwkm4Vjlf46Rz+c2+1jo9KK4IkarKipdfVhnY2zWRgYMKtPjBHk+MwqVsj
         oIsy9hzfcmHQ1yzGgY7IJeKKfasgXYjuqBSzzuYaF+ZzH9UXDno6NUeGiZkSBQ5PP0WZ
         /OJA==
X-Forwarded-Encrypted: i=1; AFNElJ9vhUE+jw79TRp481rnZ5WB727Rdb/HEXTvlz75gDwiiP9WSGrcxL6yll0L4jcA8fjokm0/aHIYnBg0WA==@lists.linux.dev
X-Gm-Message-State: AOJu0YywB5YSiPfJDpodc1Hkd69bS+f1kioRLW4VrYXVKUTTQk0MGoL9
	LNTkWQCiKOgWfXub6aNEmgFLYrPHyJTI88rvGsd8FTg8OPFKg4I03anv
X-Gm-Gg: Acq92OFQnmwiCp8h7aliRCnmcX6tbD4//PKcFHZQhew+6kFW/2EwesR62vvcaizoVpi
	Ty1aTbrLigGDoWHtFfI1TQz/Dhv1KMSzGVmcaHmHzDs1M/m1yfINT0MHvFuHDpCV85VysmdlV9D
	2fDPuHXxsIhSStYpkJiDLYjwUSDIAoqHtT0CWzVTuevlL9sFAd+qY7sM+6o9lAbX9TO+Ns2wtsV
	iww0luZeyXM40uyyPeFSnFrJ/vgQM3451ge1zP1PXTkb4SrQGuD/Re4Ic0rbyW+zTulLOg8l5lm
	By7N1ZYCJaOI3dbZ60bI7lJ032uUbYy80T2cPpEobe3YjB+ZFTXwvTVfdbqq9RxicsvaZlgatqS
	mAz9B6dBqr0L6eyK5SaFKY7OPuiFp0KO7sYjA8rDqXY/OQmqxOhDFTGdVOI5RVF18NXT5auCkvi
	g1/WGTYS3Xt6ECqQNmpoGV8/7x/9e+JEjxprOrVX6cdOtTlpHaOB9XleSaQQHCK/KOTmi5zV4=
X-Received: by 2002:a05:6512:3e16:b0:5a3:ff5a:d83 with SMTP id 2adb3069b0e04-5a887ae3618mr10520299e87.16.1778519539315;
        Mon, 11 May 2026 10:12:19 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:18 -0700 (PDT)
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
Subject: [PATCH 3/6] media: pwc: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:08 +0300
Message-ID: <d0fdfb94b56871e757812bfb7aa58e83f7215903.1778518085.git.vebohr@gmail.com>
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

pwc's start_streaming() had two early returns that hit this trap:
-ENODEV when the USB device was already disconnected, and -ERESTARTSYS
when mutex_lock_interruptible() was interrupted by a signal.  Call the
existing pwc_cleanup_queued_bufs() helper with VB2_BUF_STATE_QUEUED
before returning (matching the state already used by the
pwc_isoc_init() error path in the same function).

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: ceede9fa8939 ("[media] pwc: Fix locking")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/pwc/pwc-if.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index c416e2fc5754..59b99ac8fcb6 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -710,11 +710,15 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct pwc_device *pdev = vb2_get_drv_priv(vq);
 	int r;
 
-	if (!pdev->udev)
+	if (!pdev->udev) {
+		pwc_cleanup_queued_bufs(pdev, VB2_BUF_STATE_QUEUED);
 		return -ENODEV;
+	}
 
-	if (mutex_lock_interruptible(&pdev->v4l2_lock))
+	if (mutex_lock_interruptible(&pdev->v4l2_lock)) {
+		pwc_cleanup_queued_bufs(pdev, VB2_BUF_STATE_QUEUED);
 		return -ERESTARTSYS;
+	}
 	/* Turn on camera and set LEDS on */
 	pwc_camera_power(pdev, 1);
 	pwc_set_leds(pdev, leds[0], leds[1]);
-- 
2.51.0

