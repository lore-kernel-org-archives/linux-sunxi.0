Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F91A0AF7
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545627; cv=none; b=MpFx5P/88hxtUj35ZL6pR5da2a0KgHy9Ip+M3eUgP8sDuuy0kF7rP9v2LQJxS7vIdKHoAckc9ODwh9tULM/a05cYj0rZtgjVYdgEeqH3vN4HGqOkfEUoLShrRNiCBtxKM4/ZUPc2zMqqoXfk6vdf6wb3Dn5WNKbrrZgpZ0O37XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545627; c=relaxed/simple;
	bh=1uqZdGxPQGBnP8j4g6VlFe4rJuLJoGF/D9uni1/dnBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8Uj7OjLrnzIXXtCp6Pz16g8UtA10rIKDNLMYVTHXHIm4B8m07KPYavv4i6Rilg0/c3zhrLP8qBhD1Ro3UNA62FneNV+nApYzuSxoIlPo2b2sVlDXQxKKsA4bQD53uBmYxyQ8tPpfZS+FvL2YgzP0J0bbaX1NdYluGaBzc45qy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tEhwO2ZJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tEhwO2ZJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so8763995e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545624; x=1726150424; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NInuXK75oVteTq8w9+Oc9GnjLQbH18gVkPWMAJJFJ/U=;
        b=tEhwO2ZJk4Ray8zbYW3fqLuMQK9NLPjvQFx0i7yQ9pbT3Loc0Y9t5+tkUObkgdB9wl
         zAnhTZzsj1pgPHeJnN8xb6rtIyUfns1iLEZeQTgDze4vXFxno908lE15i/mxvXKI4KTD
         B8tIQSLK8ZxSM8dd7ujUbBa9KX8claDPNNhqmrX+cD22AWp5RePtRz+3COM6pB/g6Tk/
         lQ+dnJZDJjvjy1I49oxQVh0Oav1ECyLPuYhw5m+4zWJRnV/dW0TOBMWW1u0hN15TVwnk
         zEf8dqWkt7AoBynEjhymm8VmXLaQL6zAP3o7YpwdUTF4fC9ERrB6ooO47G8rAkndX84e
         GgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545624; x=1726150424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NInuXK75oVteTq8w9+Oc9GnjLQbH18gVkPWMAJJFJ/U=;
        b=A6vsZxS5TP4FfS/E9JLIx/h3voAhZqGUtQD2A4hI/Pkxnt4rlxLakdxVFNryKEZp+v
         CihiryJYy4NuKpcQojwSkvvR9B/7KkngOC84Rr1k3tIawelxdd2HRaWmMieDYEIee1AB
         YGkrH595m9Htxwv7cIcscVfkFRSrfuzq8yIvBertBlgxRF/5eNKU/95AAF+dQ4iZjLBQ
         jwQWK2X/g0xl6yY2jDIn1aWot+E0xLQ0eitNHycbs7T+TtF7NNP2kSqTSlBvVJk3QeTB
         3/dkgEuLcww7mlHUoE0ynm871ct4b+w34HAeT+zPcjRaNcS5rLBMBJ4xY7Vl4AyEdKAL
         BllQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwoiSiKd0tP3w7R+7p8KqwTEX/2BIRrORLa3tCrxXgQhR0OATcJKPxUXiz3x27q59s6MBUxEMh61LdXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YySOXyRh6bh5nKog94/9JpQwvGdy9NyitvNtYpirfn5UjQBivzg
	gDpYiq/7AukSQS9KTg9pDiwAgfn/fIzfrD/yMT1OaT1BB/J8NA+uhn7GO43apxQ=
X-Google-Smtp-Source: AGHT+IF1Rnp0BlEo/3O3FvtMVAQD9zYxpmEVsCSjem+AnuxVcV5GOUWE75yL3i/75iLee6d74WlhdA==
X-Received: by 2002:a05:600c:4f4e:b0:426:5e8e:aa48 with SMTP id 5b1f17b1804b1-42c9a36ce9bmr25508875e9.22.1725545624078;
        Thu, 05 Sep 2024 07:13:44 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:02 +0200
Subject: [PATCH 11/13] ASoC: sunxi: sun4i-codec: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-11-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1uqZdGxPQGBnP8j4g6VlFe4rJuLJoGF/D9uni1/dnBU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byHCX1aj4AmJj1Q1JWPzGMx85ey7eOOxJr+R
 rAU5MJYHhGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8hwAKCRDm/A8cN/La
 he0WD/9ZWAdHLFmtFB3mqYO/QGvuN52rpe1DwhCaM2ZCwcGDXqJ2yN32wMIZlvW2Ws2qBR7xuJq
 mZ6HjgYXOG0wJIW3Pe9fiUdRSxdJM7ILbnodGi7Mpb1b8f9TITFHjR9OCxaskxFs6MlMTsovZco
 TyhNEo7x4TbKgjNxELQKMqvTW4A7XA/Uz05XKJ1Ys0tZ/AsiJccuDCmv0Igy5VezRVRubCOjzwz
 A+2bUFPbOtq0OPrKr8Z2tfZkjKdR0RDuNcEV0SGtwWIijxxhlEy+eidNFq1tzVQbTTcPzNHObnu
 /iU5f7f3tExu0ipT1WcGmJrb6WePR8T5r/iQul8HGDekZnPnXDFutlqNZZsX5EYdOajvF4klddC
 mP7PzOAG0QHyZkgwOU7JwrwetBknkEeeA+KFAMKU/30+Q6bWsIXE9UDjBR9ZvxgWts8ey+nP8/o
 Z8LKus8tsEv23crdsPdSGzxJNQuC0x2SqBhoqk9e+Lk2qECPJorgQHhIANw6BMd0Mp43ugYA7J8
 zqWrr6BzE3JtJKGjfH+Lyad+DpAmzLHAjEsoE9nvV8ZP9qdQq473Tbn1ePNgDQjkEdndiv5N2HA
 bUJdAvFHiQqTxVq/x7icSTe7dOwERMEm0XEF05xTExrKh1d8lbdlaIqbjp2sZbXHoI7Sy4/dOtC
 FIFFrECzeVOEwHg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint lists was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/sunxi/sun4i-codec.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index a2618ed650b0..25af47b63bdd 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -577,28 +577,12 @@ static int sun4i_codec_hw_params(struct snd_pcm_substream *substream,
 					     hwrate);
 }
 
-
-static unsigned int sun4i_codec_src_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000,
-	44100, 48000, 96000, 192000
-};
-
-
-static struct snd_pcm_hw_constraint_list sun4i_codec_constraints = {
-	.count  = ARRAY_SIZE(sun4i_codec_src_rates),
-	.list   = sun4i_codec_src_rates,
-};
-
-
 static int sun4i_codec_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &sun4i_codec_constraints);
-
 	/*
 	 * Stop issuing DRQ when we have room for less than 16 samples
 	 * in our TX FIFO
@@ -626,6 +610,13 @@ static const struct snd_soc_dai_ops sun4i_codec_dai_ops = {
 	.prepare	= sun4i_codec_prepare,
 };
 
+#define SUN4I_CODEC_RATES (			\
+		SNDRV_PCM_RATE_8000_48000 |	\
+		SNDRV_PCM_RATE_12000 |		\
+		SNDRV_PCM_RATE_24000 |		\
+		SNDRV_PCM_RATE_96000 |		\
+		SNDRV_PCM_RATE_192000)
+
 static struct snd_soc_dai_driver sun4i_codec_dai = {
 	.name	= "Codec",
 	.ops	= &sun4i_codec_dai_ops,
@@ -635,7 +626,7 @@ static struct snd_soc_dai_driver sun4i_codec_dai = {
 		.channels_max	= 2,
 		.rate_min	= 8000,
 		.rate_max	= 192000,
-		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rates		= SUN4I_CODEC_RATES,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
 		.sig_bits	= 24,
@@ -646,7 +637,7 @@ static struct snd_soc_dai_driver sun4i_codec_dai = {
 		.channels_max	= 2,
 		.rate_min	= 8000,
 		.rate_max	= 48000,
-		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rates		= SUN4I_CODEC_RATES,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
 		.sig_bits	= 24,
@@ -1233,7 +1224,6 @@ static const struct snd_soc_component_driver sun4i_codec_component = {
 #endif
 };
 
-#define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS
 #define SUN4I_CODEC_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S32_LE)
 

-- 
2.45.2

