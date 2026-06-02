Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772573DCDAF
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jun 2026 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400710; cv=none; b=HDZiOAapoauYu7kf9ody3hRo07G47hSLPEKXE1uBIX9EVVSd4nMtN/AJWqPty8SSh7xjb5jCOVla+YcSNYNEz32nvv2supP8WJjBvF2Yl72nGCojQDxKp100sHVZs7lJ+oW1vDAeVTgFV59avuDInVXWRHsiFrbFCMVB8mLIF+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400710; c=relaxed/simple;
	bh=jMX9mnAoMrDWCHNf1eDVHGV/w2HaBRXDp99gKsHpzSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mx6FKlt466+kkJFhSPJbP/RWMV4D8zJWHgrGb7LmEe2+pPYM6odI5+kb7rqEYGmpEh7djVPWgPu2Rx+hLnTPKKPGR/VVmZB8niv/EzPgOcIBPVa01zczUBS9WfXZ2WVoRakru81CyCGSQc8ZVSpcvpEcjGZ5i1JolM46sniJdz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m03ALEzK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m03ALEzK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8423b08b293so988786b3a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jun 2026 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400706; x=1781005506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnFWVx6VWhxeKMY/FKRW9Q1g3mwhdS1r25okhPrkiNY=;
        b=m03ALEzKJZQHr3mYVYxQqw85xcNjaK1GtKCIRSQ791mRQiYJssYoVg1eFlAV6gEzh9
         He7MB/ns+x00u7QqWnXZw6GNeP3U90Lq8c/iFRuu+61Rmt0kP3vl+s0s9AotdwrT+cvm
         azQDBSjj4XcomsqClDtOEfycJi+vK50AcLal1r9F1UoW018zu+nrCxrfzn/RQzEBSvTE
         ZFlA1jQGzubjhHXWfhuunwkjUl21NhBULK9GW3rmvLXWLTzjiHmYOPaahytytF3vU+RV
         k/HyWy0QHD7dd5Jn96OkIX8UP/HVDjwc9lB8TBDdYeElXaxOGdew2aHDYymOoSXPmioO
         ENWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400706; x=1781005506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bnFWVx6VWhxeKMY/FKRW9Q1g3mwhdS1r25okhPrkiNY=;
        b=l59khodkzYMsEuztS1KDN25N8bI6BkFZbDP5pr8lV9lJc6pNZQTmN1ETb2SGEsmAzb
         QQD/wsbtCxpzg7z5FON5M0NkHz95SxN23A341p1JZgvQ2wkSMblHPOm8Dm4AZTd757HQ
         JltdxSKEtghAaG8K2vuMRqvxTWTP3wFlmlWIjjOj9PIFkAToNbrMmBfh/TPsstlXWnG0
         iDSkeJS+ykkaD/UEdPIBfrgAZVh5eYJfXNkWQItsYs6fdEunf7k/TGalUx6D7trR/KUf
         UOmuOSx1dwiOtql/TYZDcJs3mWIptf+DCUMcP/2GEO97KV4pbDdpDMiJTNwtB3vYNh2E
         A+1A==
X-Forwarded-Encrypted: i=1; AFNElJ9V6IEDsrybNDVbcxD6vpb2Qf8WqydBZjoeO+mo8BAJs86nMReT377n3B78zVQRsgHZXjMyr1zJflgJnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBVEUKRwn1BD4+/ZfjE7STo5t0o9td9ztda4FDnSndW87uF9Z8
	uVQPubqVMIIP/rzqmaQqZp5iRTLWcHxwUdO4VblsN9/Tq5YTFFLkMwlo
X-Gm-Gg: Acq92OGHs7q/wf8GAffVRrALennEwI/5LCYocTtgrTV7d0J+USfpi6LCYqlb8vmjqM3
	Xd3cugEkdrEDMiCWturNONhS4yY5F84nxAIF5bfRml09bNEL1QDwrdcf4XjNFOLy4KqK9NTruB5
	oHcN8UKRX+uTk3T8okNa5z3SrBNpnCwvL1GR7hkBwHEXQDxIgLwwfl551I/qH0/qjHjI3x/yexA
	Hcm82xQJwrvQFcouCdW38P3iUC6n2ZCtd/L1PdCYmyL17iLO36wdxyEX0yLaxXzNxZK6/jwptT3
	KxLcSV6b4rifnphwq0dAM9g/DyiO9Z2or8Kgoks+xeLndwgxhLZUgH/5/pFzQ2uxT8zxg4T8qBF
	TQsvO0hvlXXCfCFkGOsVgkYiuvW0Fsqj7pM7MPlJ0uzNvc1MOA+7JvrLE+iGk9Eu4kzuBoY28lZ
	VqFFRtnSasxA6JLU06OSSPU7a3xUE4c7HxsF3fKfYaPOdfNF9pAsDpY2HIfpqu1Gf9Lw9z
X-Received: by 2002:a05:6a00:2d8d:b0:842:5b85:63a0 with SMTP id d2e1a72fcca58-8425b856f49mr6797766b3a.46.1780400705444;
        Tue, 02 Jun 2026 04:45:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:45:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/3] ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register access
Date: Tue,  2 Jun 2026 18:44:36 +0700
Message-ID: <20260602114437.50324-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The IEC958 status kcontrols access hardware registers directly.
Take a runtime PM reference while accessing the registers so that the
device remains active for the duration of the operation.

Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260514043314.62222C2BCB7@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.
Changes in v3:
  - Add Reported-by tag from Sashiko AI review.


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

