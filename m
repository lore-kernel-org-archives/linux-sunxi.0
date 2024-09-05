Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336521A00C9
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545623; cv=none; b=J/V2/3lvgD2BYgEXOS9AsmCf67OM8O8HRkiMJjlrrsC92SVccXrRrmMHmrpzFSnqP3iEu5d+7+JqMSOit6iGvDNQuvuX1KOpMEhoLpXdOEjCnZfD8LT6WQLBcv0oIA/F45kSVXMl+qqG6yqtkYibd2Ost4WbjfLQqvzHhvFU2ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545623; c=relaxed/simple;
	bh=/9PPWU/V3ndhMwxKTLQBCr4ABO0MKQnJNgh6SuoSWJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L558sXcprgmfvVYMN23xc/STh2VxPEEhT09SaUAUoDOqKvLMZ7HHnfjD65DTrMFC5WYdAT7UbktAAp0kRJ/lxMWeN7SRm8Ar8u+jTf20UkpRddX63zZNTBs/kJG+NiMAbseCGRLpsKZtLR3nFKTy+jKUYINgfVNcbthNMDJkrgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=afF0Z/6B; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="afF0Z/6B"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42c7a49152aso8771455e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545619; x=1726150419; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Z+rj5y3R0mNy6TrxdjS8zRh7/rFaHDdfIRk7QJqw5Y=;
        b=afF0Z/6BUoRHIKxFkuhj8Xw5/wIHew5K1P/+2doNbg6GvrHAOkj1sNyr5qhYnwLPOv
         I/AcxBHg79vl3f7RIXKGUykBaLy3/gT5iU2WMEuQV80tE6lqsNrC5GEhp+wzu7WFX8eY
         BXy56s2zlfdbE+/1adqN6I8h1R67gAsiCrAyZIph+OLEMYFKes6Gj9Nzhi+O63vW5clU
         1RyA+NJkoGTJklQDxvWhq5d7ekzD1UOSsfrG7qzfl7vv25kF0o5Ws3bZANRlUwwwITPz
         UJ3Ect4T4Z7CmO24Of3WJm8nVFma683+f4xahE7PI88AJ/ESMK+l9iEcHtvQrcILo33A
         GkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545619; x=1726150419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Z+rj5y3R0mNy6TrxdjS8zRh7/rFaHDdfIRk7QJqw5Y=;
        b=P4wZiV3Kxl9mgIMMFZnxKeBChLtNu/y0Mx9X8+TVExDhhSkpPwPQ/THDaxU7p3oh89
         hYYwP/lvJSUSKfrOvl/K2zSXSPOblH8OG6WvmtduQ8ej3zbLByJ1HyxeXJFQcOqWaYra
         lUutvvEr59ZKW5IbohdBv2wKHwTfk4BLFS2acB3gplwEJUrpqo5CLnKLm86woJKCCmGu
         hXwKazint5PZ4aB5TuB7PbwO4y/EAQad5AHQ8KTphHzErmuSz4gWl+7H48TTO0hbrIUs
         xpL14mBc/sxIHok+A5vI2fTG8eUP9k4bIARdZ7KwXVd5aqW56kDmkrvEXfWqflbm4BI0
         uOSg==
X-Forwarded-Encrypted: i=1; AJvYcCVYAirs66JBLP4nTuk86d1DOL4um+kROp50/kOFG4eINPxdRNa5iCI5LI2ckdaQA838kywrtWkJEQDTjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9S522si+e72eMQjbQpCZL7bjAjSit+jkP5+HL3TIKUQtHdQtF
	eRXnE/l8S0CZnBBfUemaaQITXfPYDzpUBvTvZ0+P6aUVKrg4iR4TcG6dies6L/8=
X-Google-Smtp-Source: AGHT+IFnCqbQW/W0tCcOFZOUTrgOvDDfD/BF7Qm+j3pcmxyp5nmWJMclM/a4f2XaIjQkMTPnmvJFyQ==
X-Received: by 2002:a05:600c:291:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-42c9e82bb6cmr1594685e9.10.1725545619306;
        Thu, 05 Sep 2024 07:13:39 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:58 +0200
Subject: [PATCH 07/13] ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-7-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/9PPWU/V3ndhMwxKTLQBCr4ABO0MKQnJNgh6SuoSWJA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byDjJ5MAQwKUXUi9Qx9lRk2zC2qtJAg3cVqb
 F68ud1AS6GJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8gwAKCRDm/A8cN/La
 hbs7D/9jkFwqwrmKgv0ZhPh3d28WC+JMl2LeePbM44C62MIMmX09vhcW2vLNov6JfPakVj22wyO
 8sScRFOllDrWOHNaBxlRiYfCl3X0/qiuzBDB9JOrCpl4ag5IT8bRf9zGVqZvJ35O+DvurKLz9c/
 zm05MLmKv1tlE3WTKoOTjB2GjDiFhEd68kCrkmBols9ApTtWxut7rV4yjIJk/+2gxaO1lc5iOCE
 xyKIumdiL7cAyQYLyQ5k5qi+1tPU7jf94tIDGTd8iiucGvZ+BhfVjcSsfBhoXEIDKuPIGxQdxvV
 yrGNlJIx4GYc5iYEXWWE02UY0JMkgCsVurF476/18TTh02FgffBqaLjlo8bC0C+efK4ipU36wZ5
 QQOJq7uLQuEQ7kC6NQ4I9D64jRE9+NA4R11zvlvDh0MXAntJfxDogIJDmFiJ3cQoVXCBIBoppdm
 J7DTxylEbgD5dlPXFgGUW3yCALXVgGoJwyg6afC81A96488Yd2bPDXZk3Saz9WiQ6Oz3E6V5WwE
 BKUjPqjy15Q3pVWSIc7YzFLJ4MeRww/EZUBLPCftmmUNT7PSTYhgRekdcPuUeEaeKiFzuh9iJzB
 /k9TzDFclI7URRUkSFQv04/lO6TfZjdfpD2HAJ3DqXYuR1ty+S9c2nVkBcbfrl/yTePFp8+xd6t
 pBlkHqVpOmWX1Gg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/cs35l41.c | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 1688c2c688f0..07a5cab35fe1 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -808,26 +808,6 @@ static int cs35l41_get_clk_config(int freq)
 	return -EINVAL;
 }
 
-static const unsigned int cs35l41_src_rates[] = {
-	8000, 12000, 11025, 16000, 22050, 24000, 32000,
-	44100, 48000, 88200, 96000, 176400, 192000
-};
-
-static const struct snd_pcm_hw_constraint_list cs35l41_constraints = {
-	.count = ARRAY_SIZE(cs35l41_src_rates),
-	.list = cs35l41_src_rates,
-};
-
-static int cs35l41_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	if (substream->runtime)
-		return snd_pcm_hw_constraint_list(substream->runtime, 0,
-						  SNDRV_PCM_HW_PARAM_RATE,
-						  &cs35l41_constraints);
-	return 0;
-}
-
 static int cs35l41_component_set_sysclk(struct snd_soc_component *component,
 					int clk_id, int source,
 					unsigned int freq, int dir)
@@ -974,13 +954,21 @@ static void cs35l41_component_remove(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_dai_ops cs35l41_ops = {
-	.startup = cs35l41_pcm_startup,
 	.set_fmt = cs35l41_set_dai_fmt,
 	.hw_params = cs35l41_pcm_hw_params,
 	.set_sysclk = cs35l41_dai_set_sysclk,
 	.set_channel_map = cs35l41_set_channel_map,
 };
 
+#define CS35L41_RATES (		    \
+	SNDRV_PCM_RATE_8000_48000 | \
+	SNDRV_PCM_RATE_12000 |	    \
+	SNDRV_PCM_RATE_24000 |	    \
+	SNDRV_PCM_RATE_88200 |	    \
+	SNDRV_PCM_RATE_96000 |	    \
+	SNDRV_PCM_RATE_176400 |	    \
+	SNDRV_PCM_RATE_192000)
+
 static struct snd_soc_dai_driver cs35l41_dai[] = {
 	{
 		.name = "cs35l41-pcm",
@@ -989,14 +977,14 @@ static struct snd_soc_dai_driver cs35l41_dai[] = {
 			.stream_name = "AMP Playback",
 			.channels_min = 1,
 			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_KNOT,
+			.rates = CS35L41_RATES,
 			.formats = CS35L41_RX_FORMATS,
 		},
 		.capture = {
 			.stream_name = "AMP Capture",
 			.channels_min = 1,
 			.channels_max = 4,
-			.rates = SNDRV_PCM_RATE_KNOT,
+			.rates = CS35L41_RATES,
 			.formats = CS35L41_TX_FORMATS,
 		},
 		.ops = &cs35l41_ops,

-- 
2.45.2

