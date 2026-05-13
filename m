Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4631C1427A
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669430; cv=none; b=JvQhfXaB8mkWBzeS7d+cXuv3CzEUNC9rlG3xWPBbPuDlMyRiDRH+7TKfGLffiA4/wepMnaHUiJzuj7HvHzMjqxwMiiVQolajUxsuwXAmSpbhRXNsPsAmt5CWDZTrfp2noSl/zk9A77HEVR2UvQ2v6OsZuB3DvT6f7ib+ObX15q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669430; c=relaxed/simple;
	bh=PITbxzoqk9Z0GWsxXYBjlIF56iXx3q7LP7uqXiKTMNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxKmPF0vQceQEtB+Q2lt9DAM9Kzws6C+ZN9Lc0rH5f7td8RoLHtyM9XhuNzrt7TGwpBAgVzWsi5pW4HAwzYItmLZ/u8a7My6w3z/6tuWAEpSl/PqCjUOsO6qQTPaXMEnXMgJS7Zdm8myBzZftO54hNR7f0q53boavtlXdD6S21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTM56xA+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTM56xA+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so3065980a91.2
        for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669428; x=1779274228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gq8AnA9QGLhuYSw+tICygG0pQw5Dug4NgZkZsPxWBA=;
        b=LTM56xA+43yf6yfwqfMcKac4HusDEb2HatlfB0rVjokbXBtaa19iSTBJVW91vOynUB
         txKHMYNQl/bfO4VrpdfdTyTmzzCHeFFAHJCthvl+/wT6bFBkl+VYp7I9vig3ATh8Kl00
         2If7HDp4ve/TeQ93rcgiMiiCYLghJHmTF0NAap4pKydXOtCh1nTFrD8UBojyqNlGyS1G
         xfSYgnBk/dA4RJx3Fr9QccDCYizwHM1WvQJGPRbvPeMODsPOeEBuSZX5WTziyjDxtd4K
         CyuvdoP7SFNBObKV+WReXPQ04XTZFh7Y0hmUw3ZB8rEZeEOuy3zoTIYqR/7B7Q4NpEbx
         IN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669428; x=1779274228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gq8AnA9QGLhuYSw+tICygG0pQw5Dug4NgZkZsPxWBA=;
        b=sy6xARlT+njy+d107Qla9RYptz2nJsOrahZJFZvi5f+8p6hg3A4q4m8XAHxcqLhnX4
         JaC2m0E49gjmN+kgo2vHufrJVCkcyg3ySUo7uyVOeN4YrntmJm3t4TljUJ1n1vUBBxGy
         MuyxYeVkGYaf7vTHIV7OYxGz1afEPKTX9zj3E41NdLwftPq03JcYPSpSBOh5Jf9K1bTX
         QUKMdMwrb6gSiPPqdygOLB8mw1ClgtGBiX81MmNTzyms0g5T7b06tlMEyCxI2AZwDepr
         kvggTrwKcr8KfB1bWVJJtYlYwt0CGnabAh8HXcNOSiW9D2D8hRTDEIJZ8e2VUiBeZ3Og
         GDPw==
X-Forwarded-Encrypted: i=1; AFNElJ+xg3GRUuaO+HTUqR8cgbp4LIl1RYVTKLA34PNhbB+rszJfMoijujedYV1aePBzQBeaxJixCFCtqEttvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCnLPMI4rW1pgzC6QWqcXGRfOTp8t5b6OO2Hew/K6SJCKrLGXw
	gxRXX/aIESeuTG9+dZwyC7pRpme/Y7luHFYlCPrm2MHVvc8YQXzF10ZG
X-Gm-Gg: Acq92OH0Yabq+n/I7YaUecm3SZy9Q6yq2ih5HoN0lAIffYH5AZqNt0TJLZQvyhE/+Nu
	nMbPM8ov+od8MOkVMcRDFSdsI/R3X1h7bDm8QYj9fFefhHqlVAhkiu6CJJdG8ye1vOvbI2fi9g3
	GokP40g6aX0RVhAdyCNvbiEWlvXumrpA7ZTonOYn0uqESATW0OKz8g87uoosbm5TPXgvkiaGhH7
	l86DLe7kjgcxu8CkOhbLrzUqknyHIKKLFJYtDumirOioPJuYH4h4NTEqw/xolWoxpDbZxIbqzPz
	0JT0OzKli0CXsstXdq5rVKY2tucGZBNmh3dG6O3kZ50w9Iuv2bMpxSuvkMLF7mXH4JvTDxZuPHr
	dawoHPy6HlDJ1C0aUhU99tZjSX5FffmQcQtOOIAGKkUAT3RcFQDuXWrs5I8YcufCxgxqnPBIIFB
	g0VI7X0QJd173YYKThov+1lezj1oybd5C5jS6DQ1G3XLkrZQKHu4/42NL48A==
X-Received: by 2002:a17:90b:54cb:b0:368:65bc:e32b with SMTP id 98e67ed59e1d1-368f3c151d8mr2923432a91.15.1778669428352;
        Wed, 13 May 2026 03:50:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf9b543sm2843136a91.16.2026.05.13.03.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:50:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Marcus Cooper <codekipper@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
Date: Wed, 13 May 2026 17:50:03 +0700
Message-ID: <20260513105003.81880-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..ec00779182db 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -427,10 +427,9 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 
-	spin_lock_irqsave(&host->lock, flags);
+	guard(spinlock_irqsave)(&host->lock);
 
 	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
 
@@ -444,8 +443,6 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	status[4] = reg & 0xff;
 	status[5] = (reg >> 8) & 0x3;
 
-	spin_unlock_irqrestore(&host->lock, flags);
-
 	return 0;
 }
 
@@ -455,11 +452,10 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 	bool chg0, chg1;
 
-	spin_lock_irqsave(&host->lock, flags);
+	guard(spinlock_irqsave)(&host->lock);
 
 	reg = (u32)status[3] << 24;
 	reg |= (u32)status[2] << 16;
@@ -483,8 +479,6 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 			   SUN4I_SPDIF_TXCFG_CHSTMODE |
 			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
 
-	spin_unlock_irqrestore(&host->lock, flags);
-
 	return chg0 || chg1;
 }
 
-- 
2.43.0

