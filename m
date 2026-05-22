Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A83C3C01
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443672; cv=none; b=SGhmkxiY3Cp5/NH71NDsPncCBw9xWxHbSFKpP/7pOTIqmsZqPqfyUq8U+B9lUpUuC2c7RLQ3eW5xf1z/cdiZWi2OGJN6nkZ3xeys1CKp9L3zAwjtw3bOFLkcwvARplG0XZV37Q10dRkd3Mf4gqVWEJpTFmeUIi+KXY4jTVNewG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443672; c=relaxed/simple;
	bh=FES/LPsuYUEIfYpCxaSWRQknC3l1jlyEQS86EeloiaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lL/aXpZxUYiNWlVVpvXb6oXhVGh8mmqB/ipx5mxtPrMi8t8izGAVhpWXcqC5y5gmKnD3FmBZOPQr5RVniYHiBwKrCWNR7TC8pAYwgPi6/TdN/lzUxzXu3gCKJYHrDULzkPSQ35q9pJLXxRwgDyXdna35ZzJXCUxR5tJ2Khl37Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9Jawl0d; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9Jawl0d"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-837b39eb078so4832644b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443670; x=1780048470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsLsnv7a/QcqqVOvsqB3nlisoqKckWLxKBBgfnHU3Rw=;
        b=H9Jawl0dPpJO+eyESNKlJCFsRED/P78nzrgZ9dC8Rx/9wEIz6ke1LtFWaO0gQ/ceui
         BgdM5aEGSzyb1kHcyfJo2ta34GJ3ZsQDXxmGnP0422VB2oQcO2uROL8t0im5sr8fxX50
         VCXg4iI9jUb+NuvHmsJWfKl35w9fGALUMGxxjKvqwkAJGArU97t6VexcejfdsDMal0fJ
         hIU3ByImmbaQ2onKXOHfLNSflHVpdMzZ5hsUx/X1PysrPVQ//0sbCwsEVbJFdkKchVax
         tQkwO99xRm9LBvyk80wPcm/6MW4h8mpFChfN+rGRh0ZcnjdsZ+SK71pYH621c5QK8ao1
         qbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443670; x=1780048470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WsLsnv7a/QcqqVOvsqB3nlisoqKckWLxKBBgfnHU3Rw=;
        b=TDkbaOj+8sOI9gA9SaS6xVAr4UIU3UPT2y/3YLFkTETZmI3UkW1tGZhpBz0nyJjQo9
         s2BXF226K0H4BSdLBFHFiMnObNMn5lU8HqEXejbdpdbl3A1I5r3T/+LdbyCm2glL0HMK
         Zk/UQ6I2lEPs5/StemPqM60e96o757fEqTq2xAYbA78vrQJyMZUyah5d1m8X2mGVRmYU
         eRZhtLOOyLQzU2Se7Nyse/y8NTV9eJBTKLGeGcvf2RC1+yVfrQo8rCDyKgA0YaK8neyR
         wKg7SI7QNkqBdTNqDHgP5NwNmxjnmJiEUzlh553E7VbNGjR9npdVSlmsSim/QiEwCGy5
         Dlow==
X-Forwarded-Encrypted: i=1; AFNElJ/CgU4s9Pi1wNwdMd9N8RUc/nY7VUFCoSVV/afRidguyW7WG+vC6ggrYdvtjfTKd1Ns6ET40QnwUfHYHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQjxpXOyd1bbGkIGD3BlwHWjDvxaxaynyMtzr3rzjcDvl/syFK
	MWtoHlrj1TKL5+V8WVu+N84Wbo//pnrk0maSu/pay6GF5dpoJgCohxGE
X-Gm-Gg: Acq92OFz+PUnjg9B+azZLuN1iPTr1KXWoPG75OeYX1zAPHh4ZFVA0Ir4h0GsYRtsOhX
	bhF1jr3daidUCU3WQAJzjGe5gSnyVVNlWFXK68WdkA9eElXUcv7J5veXqN9t5eyncRo37H+3YG5
	rzqHV36mQIyJVJzlufvS2LZGK3LUt28Ep0fjAunfTWI6trY/qynNL74fHZEQPtpYNBi77nKl/o6
	AN8h7FCG7/v+zUpzmpawZOHyYqmJ4jjW+kyepKhtKAFLr30VMDUO4V1Ap513wu8x2Um0f6FCGDp
	EUInpV6NQhREakGv3M8EqRU4Pi/N9Ku1YwY16HN048tbsmsMPRYX/ql+JYOonID0CHcTFVTrBtt
	l6qz0E2bQb2PwYZ3Sq+Ekfpo33ShCRC6GyP5Jrze74FPqoH7SB8jOB4rkR3QeogF/ThQ1RtS1in
	xdl4dEpyfJd+ZvLtKvXRccwibpp8FWAI2apIF+OPu36u54JecUlNcsrCiMl39aFUKMcQ6A
X-Received: by 2002:a05:6a00:2447:b0:835:4776:7d7b with SMTP id d2e1a72fcca58-8415f65c44bmr3236104b3a.42.1779443669845;
        Fri, 22 May 2026 02:54:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register access
Date: Fri, 22 May 2026 16:54:00 +0700
Message-ID: <20260522095401.72915-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522095401.72915-1-phucduc.bui@gmail.com>
References: <20260522095401.72915-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Accessing registers while the device is runtime-suspended
may lead to invalid hardware accesses on systems where the
APB bus clock is gated during runtime suspend.

Ensure the device is resumed before accessing registers.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 89eccc83a130..f54eb14c9ed8 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -428,6 +428,11 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
 	unsigned int reg;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
 
 	scoped_guard(spinlock_irqsave, &host->lock) {
 		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
@@ -443,6 +448,8 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 		status[5] = (reg >> 8) & 0x3;
 	}
 
+	pm_runtime_put(cpu_dai->dev);
+
 	return 0;
 }
 
@@ -453,8 +460,13 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
 	unsigned int reg;
+	int ret;
 	bool chg0, chg1;
 
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
+
 	scoped_guard(spinlock_irqsave, &host->lock) {
 		reg = (u32)status[3] << 24;
 		reg |= (u32)status[2] << 16;
@@ -479,6 +491,8 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 				   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
 	}
 
+	pm_runtime_put(cpu_dai->dev);
+
 	return chg0 || chg1;
 }
 
-- 
2.43.0

