Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89CF1A08B2
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545627; cv=none; b=K+Heaf2Wl/mHLbsEMAOqYhHU30uo0p6ZjR+jaXmNxiJ28Y0Sf1rjdk7IT4DEcpHM7nDmFlTzpn091chd5Y8NYxFkXDoyr6//DtJ915EL4+nJOh1jAKvmFACwUJ3Z7yIcuCbK4yAsCENG3z3kh97NilLlkFbYCRTcfQ9BPC5Qcdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545627; c=relaxed/simple;
	bh=XXaaAVjkchY/rqKPr1ocH7WdZ2HyLktu1KzKeahPou8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olmS8l2YE0cLopGyoj0FXnEJgKX9mp7inFQpiO67NGXblR1snifBUeGXr6yMJ3y3rRggEygU3ZtZQ//Ux8qkJC9TczACzhXkX0NmUj4EbZnWb+ltgYyq2iboRFwqH8ZymXIJjxnjjUm9h5isC4PMC/HR1t0BtuTpXzn7tOWAb7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ojyduwN9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ojyduwN9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3787f30d892so506424f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545623; x=1726150423; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMGhXEw0EMiOdueZyPaJHCVqWqxyBmUIEc+9ejnTuMw=;
        b=ojyduwN9n87sCqqjB45jLZjOX5xYB+CwhuCRnEfpG/xAyyoHyb0G032OT2LuYi62eT
         WqbvyDag6VaoHt+oP+2a6yXeOi2JhOU9KW87tbz3z3ujoP7PogP7i/BZCdK45tnKsdle
         FtC7K23GPWJPeuwqLCjjeSUOLO73BsnLJwcbqO7bW6UTSeuj29f52OYOsOi3paCr3Fqb
         M34a3FWwl8xPqAOpOl7TWO6wnvxPzmLdGhCMSvdG69x3OSgKQDMEL9V5BxgDVupAizSx
         8ADUrwPua9x5QVi0rLxkIImXfWvuK0FX8lySbG6NagehFo/XOFN2zO8LGjiaxKx8B0zj
         KY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545623; x=1726150423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMGhXEw0EMiOdueZyPaJHCVqWqxyBmUIEc+9ejnTuMw=;
        b=DcG16sHI7fybYXMe6vuCqEg7zzpGHMjE/QXoWTI/O9FSzA5tllRWDIkgVmi/KwNDyY
         XDm+hhWnKXLWXPO7GV0/4dOM/oAYL63yJ1ENavQvjQVDUv7SQFMlgbbpb5KWUab+oEnj
         uW2jbaSNGK7TxL8VWVYF7+gCGjH8/Jm06KB+OEBEk+YrM8kNyWMYE9Tep87ZOHxRM9Ez
         0KM0MiBLnbwvN1STL7KmSVDEbeYhJagITRXitgk5nDifnrXDWrTFiaYtn8NvBFLtzAAL
         IkzlelfrbhTHfzjrOfBoSZ9ANbF1i8z+ZrmW7xxVe5MQHhd12JOAilYJRTKTIHbeM5li
         xibw==
X-Forwarded-Encrypted: i=1; AJvYcCVz1uzLlwvMq6IAqGExCzRTWKJ/XzvIyup+mEbcNQnPVPf1De1hiAbFkptz36+klaZJz7FXHyuZWvZRqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlQ4BrHhoJok6PM7yUDMC/KzzwqiKI7DRJ7oTWJkBTReuFexh1
	jH4NmGE3gMAeDn2IM2pewnl3wR3rArhrJtExWR0klCNwxhgRdiwLdjWEmSXEiz0=
X-Google-Smtp-Source: AGHT+IHBquwgcDoVsD6UjFSAJZlg+wE5YNTlLR8lb6J1pcatZPhdoPS1oDkj1/VU2ExhbxuANwuKeQ==
X-Received: by 2002:adf:e592:0:b0:34d:ae98:4e7 with SMTP id ffacd0b85a97d-374bf1c7b74mr11792893f8f.41.1725545622875;
        Thu, 05 Sep 2024 07:13:42 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:01 +0200
Subject: [PATCH 10/13] ASoC: qcom: q6asm-dai: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-10-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2940; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XXaaAVjkchY/rqKPr1ocH7WdZ2HyLktu1KzKeahPou8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byGxo81ExacfBJI81+ntmOih8+z3ldyeNe5p
 14qWKO8BtOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8hgAKCRDm/A8cN/La
 hSBoD/9eW7KOYMCCavytluGtMs7KD2nL+UinfgARTNGDbqp5udgQ2B6jgk3T88uxIPdnxYUe3cj
 MjiyvaOUVqBJZlzj4NCJMzBEQY4ADrkc/UCpwYvzKCOaRm5UlDKwXsAnQIPZh/oL3+nc2hAY5dX
 yRLYnghzyXECZkDFTFo/MixLa4LoYMbD/lyKQrPBQzXXQK8UFfL8nQaHpVSiR22tFP9XgDKN2Yd
 /ufhKtaKHzuc1whFPon6rF5tBMwNrGmwJws406yr3+fZIBgIOFJjF/L/Ln6huP832EFvxStoPtD
 UJTiKpTxP4gqIbBCubzoQalXtJ3KIb05Jxdg3kGERNkhtnHxIpAH0UtMuDGLNHnhoXC/AzRGGMw
 Os6aIVYzFvb90va5lQxHbNBbS6h+bWCktz7t1FCiAHZXddfb3GA88MSew6NtAieiq8gba3O6Vu+
 hNtDdt/5IKKYktss2RWYAb6Z3gAJKwWzfWE1edd7fWeo+cphCfD2cpI/Oj7xPECGdDn8xsZKwVM
 dVkosxTnKkC502b3DS64t+8SPm9Y9ZHD5se/X9kna6uaV6ScfLWh3wwFRZXrkB95RukPC/8CH83
 EkPqzT4q1kZgT/oltlSBnTUPkW1BTMPEuEIrfmTi3TlO5b+KTWwHq4lQfDOJnIC9k775yfgUVx4
 UQwYLqEzwD2MhVw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 3913706ccdc5..045100c94352 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -128,8 +128,13 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 #define Q6ASM_FEDAI_DRIVER(num) { \
 		.playback = {						\
 			.stream_name = "MultiMedia"#num" Playback",	\
-			.rates = (SNDRV_PCM_RATE_8000_192000|		\
-					SNDRV_PCM_RATE_KNOT),		\
+			.rates = (SNDRV_PCM_RATE_8000_48000 |		\
+				  SNDRV_PCM_RATE_12000 |		\
+				  SNDRV_PCM_RATE_24000 |		\
+				  SNDRV_PCM_RATE_88200 |		\
+				  SNDRV_PCM_RATE_96000 |		\
+				  SNDRV_PCM_RATE_176400 |		\
+				  SNDRV_PCM_RATE_192000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
 					SNDRV_PCM_FMTBIT_S24_LE),	\
 			.channels_min = 1,				\
@@ -139,8 +144,9 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 		},							\
 		.capture = {						\
 			.stream_name = "MultiMedia"#num" Capture",	\
-			.rates = (SNDRV_PCM_RATE_8000_48000|		\
-					SNDRV_PCM_RATE_KNOT),		\
+			.rates = (SNDRV_PCM_RATE_8000_48000 |		\
+				  SNDRV_PCM_RATE_12000 |		\
+				  SNDRV_PCM_RATE_24000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
 				    SNDRV_PCM_FMTBIT_S24_LE),		\
 			.channels_min = 1,				\
@@ -152,18 +158,6 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 		.id = MSM_FRONTEND_DAI_MULTIMEDIA##num,			\
 	}
 
-/* Conventional and unconventional sample rate supported */
-static unsigned int supported_sample_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
-	88200, 96000, 176400, 192000
-};
-
-static struct snd_pcm_hw_constraint_list constraints_sample_rates = {
-	.count = ARRAY_SIZE(supported_sample_rates),
-	.list = supported_sample_rates,
-	.mask = 0,
-};
-
 static const struct snd_compr_codec_caps q6asm_compr_caps = {
 	.num_descriptors = 1,
 	.descriptor[0].max_ch = 2,
@@ -390,11 +384,6 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		runtime->hw = q6asm_dai_hardware_capture;
 
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE,
-				&constraints_sample_rates);
-	if (ret < 0)
-		dev_info(dev, "snd_pcm_hw_constraint_list failed\n");
 	/* Ensure that buffer size is a multiple of period size */
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);

-- 
2.45.2

