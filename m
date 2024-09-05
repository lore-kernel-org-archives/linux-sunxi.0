Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93F919E7EF
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545618; cv=none; b=IchX9f2n7EI/M0CQ6wOJGdfx6t7IFOKFaQoqdN7e3/3kadXn/6QT2WNDT2eIemAytFfwqf1twUUMGu70y8ItGCYtXWNJqfhGSKYkIiSTCqHbjY94Xm0b5AOcmbvZKYyt7I7ikVQL5s91XGNcei3Ikbl4CwYM/5WA6Au9zachFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545618; c=relaxed/simple;
	bh=JlFXCBTD6wmPGs3Xc+eBXJCnNEzFsRasRZacDAmL1po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WjNKUqjWndW8mswxOQgpWmldOlKwoypNvLniwB3DO1bWQiXjSnOu3VCp7u0vbpYPJ+eZ9h+4T4QmfMhyHFBVJcwSd/MCcPJyVoec4S2K2tXa7hAv9sayAYcqGYiB/WPWOzkyNw3PGeMdt/RErsBOovPH1N6hqjagNnpG7aFqLpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=29gCsbTd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="29gCsbTd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3787f30d892so506301f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545615; x=1726150415; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ4OWj1M1ZpMsgNdFCjWDSBf4jaOw7GENdrNyJWLeh4=;
        b=29gCsbTdTx0ipcJlVL5TkGPmNgUC6ua9Zr4oxnYfrElZrzRNIaMHfB3a2pwivlxVw+
         9cK59GGQFYhLH3NbvkGTt+oqrqIgh9nFlIEHthhEBwMlMVyAXSi2+DgRkKBOo4H/zH9m
         TpSO90H1xgqK7jLHQ2eGF8WVo7unsKEqcr6w7t8eu5prZvMpePJMaoaY+3Y8sKupjU+r
         Q9w62jf/Tp4NMoRpi4pvJyXGTfiWHBCwM8wY3RhfKBFE8NgSK5vyY5/eCwOLzQjiXVQH
         Q8ulVv3GvJXV50pre2OO9z2RjO4zGzpk+iQlTcnE6MqDtmkXnnp8YJFjR+HxA/ZwszZN
         TGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545615; x=1726150415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZ4OWj1M1ZpMsgNdFCjWDSBf4jaOw7GENdrNyJWLeh4=;
        b=uIUh+e5aOHuHTLAWALFd0Nv5Gdxjnl5IpjMfJ2dYJtWJ6aD8FrSzlj1Xy0kMoFcwKd
         tF7tqsGk/9kdWuw56eNFeBFLbZonXc1TlMWbGd9IqYdRg9f0GfSrl63kpLtLgbI+tFw+
         JaEhteg/x1wHqzFFXmReBud7R1nh/X0ced3hP3Nug7WE4rGs5xArX0hZocdNwmr6+EYM
         7L/wnsMhTTVj/dAcDDx/dWT0XeymolAassy9jXOXQjGMdwiMOl6CLE1YPm/kHdbxQupK
         o8yWLsbJstk1FGe6I+4XB9G+GFa6AAPWsZ1uuy1ZXlabVBIAwa2PsrRcjtZgy28PKm2F
         3brQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVPzr8m6t6tU+uN8dsG8x5NHWKSVRuMBAerGn143yDa6qgrVB1iWuB2s1fbwENY8p09zi/pFDf82SZeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjKnIua8l+qFhvY2/jWYEORaDbwHy5Xyp7vcFclR+zOAqVZges
	OGtWnrusKUGSx0tZAwCyEwbDmebdFCwiUo0FMqbugueho/GuheZrCkyWUcnMFEM=
X-Google-Smtp-Source: AGHT+IFQfpi2p18CVl/s3bTmgrKQh6HdDCkB/ZnyhlaiBCzX95JZK0PtErVMddC8kBx8lcb0js+0/g==
X-Received: by 2002:adf:9b86:0:b0:374:becb:d9de with SMTP id ffacd0b85a97d-374bf1c7963mr11972286f8f.44.1725545614620;
        Thu, 05 Sep 2024 07:13:34 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:54 +0200
Subject: [PATCH 03/13] ALSA: emu10k1: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-3-8371948d3921@baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2791; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=JlFXCBTD6wmPGs3Xc+eBXJCnNEzFsRasRZacDAmL1po=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx/F8WSx9SFo+Mm9aAwm5w5LTGeCtAOKiZNf
 Pbdd3RViiaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fwAKCRDm/A8cN/La
 hTO8EACfpShxFfUfKBhcVOFgGnGLNcUrNcxHpvHeMT6YKdbtHho2dcF4RxIgzZdG3+MPzTgKCsW
 qKwzGfpKhAFRS6wz5tGK2UDhdk9tmZbGfUuW6KsvzNurvkxqxjpLh6jkrxbwhOlIIj+gSeIsihV
 1RzUbnyNg04AeMAF12l3PCpFSDVgbG/0/gxVUZJx36yb1cvmXRleVELUnsz+i8WZls+5AtDZkE9
 jtQsHRZyN5VXTEqPk7THy7bb6rstqW6VdH0/jPmShDW6iTIvQCj5p8a0HpoQd+/K9aiYYjlqOdm
 aqK+TDzCsgimu0ca4dqsAkGaSZty17/RfWigRs9LBY5l20spNTAO/JIrXatmZqYlarMJjKNKPqO
 CEF4exBkSiDErgJkF6us0XqfEr+iNGXQ87/u8K8uN5+WbFHv4ynZDkpkXALb6BQFlB0aCCW4cAb
 oOiDds2ZlszM5mDHqjnYAO5vk3Sme/eAsXFMp6UlcqgJ8cq03VUPPJncB3iDzZrp/84D+/wzsZc
 9AQkvBpyzPJyMenwxVTwPk9xpACxwpyZXwcgBdQ1xynVrzwLyUe38AV6DW3kPzeky8TxBY/eZ1i
 OV1dJqvbu8GAQ8b0IjB7E9YlEFZq0QpqCANP9bBuHv0scQAgZlA615zxiwoWpWzpc5DHYUDAnZp
 LIBw1U57xD093jg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint lists were necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rules.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/pci/emu10k1/emupcm.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 7f4c1b38d6ec..1bf6e3d652f8 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -147,16 +147,6 @@ static const struct snd_pcm_hw_constraint_list hw_constraints_capture_buffer_siz
 	.mask = 0
 };
 
-static const unsigned int capture_rates[8] = {
-	8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000
-};
-
-static const struct snd_pcm_hw_constraint_list hw_constraints_capture_rates = {
-	.count = 8,
-	.list = capture_rates,
-	.mask = 0
-};
-
 static unsigned int snd_emu10k1_capture_rate_reg(unsigned int rate)
 {
 	switch (rate) {
@@ -174,16 +164,6 @@ static unsigned int snd_emu10k1_capture_rate_reg(unsigned int rate)
 	}
 }
 
-static const unsigned int audigy_capture_rates[9] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
-};
-
-static const struct snd_pcm_hw_constraint_list hw_constraints_audigy_capture_rates = {
-	.count = 9,
-	.list = audigy_capture_rates,
-	.mask = 0
-};
-
 static unsigned int snd_emu10k1_audigy_capture_rate_reg(unsigned int rate)
 {
 	switch (rate) {
@@ -207,17 +187,16 @@ static void snd_emu10k1_constrain_capture_rates(struct snd_emu10k1 *emu,
 {
 	if (emu->card_capabilities->emu_model &&
 	    emu->emu1010.word_clock == 44100) {
-		// This also sets the rate constraint by deleting SNDRV_PCM_RATE_KNOT
 		runtime->hw.rates = SNDRV_PCM_RATE_11025 | \
 				    SNDRV_PCM_RATE_22050 | \
 				    SNDRV_PCM_RATE_44100;
 		runtime->hw.rate_min = 11025;
 		runtime->hw.rate_max = 44100;
-		return;
+	} else if (emu->audigy) {
+		runtime->hw.rates = SNDRV_PCM_RATE_8000_48000 |
+				    SNDRV_PCM_RATE_12000 |
+				    SNDRV_PCM_RATE_24000;
 	}
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
-				   emu->audigy ? &hw_constraints_audigy_capture_rates :
-						 &hw_constraints_capture_rates);
 }
 
 static void snd_emu1010_constrain_efx_rate(struct snd_emu10k1 *emu,
@@ -1053,7 +1032,7 @@ static const struct snd_pcm_hardware snd_emu10k1_capture =
 				 SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_MMAP_VALID),
 	.formats =		SNDRV_PCM_FMTBIT_S16_LE,
-	.rates =		SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_KNOT,
+	.rates =		SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_24000,
 	.rate_min =		8000,
 	.rate_max =		48000,
 	.channels_min =		1,

-- 
2.45.2

