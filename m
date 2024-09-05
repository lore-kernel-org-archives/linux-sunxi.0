Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3061A2545
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545628; cv=none; b=ACnTwhmTBIr8B9OAWgRPmB/gXVPCYf9JRZm6PWnUI4u1oqGvE9y1d7uM23f/mB2mXLEdWNa6B8U6TwoGr7nYyoGtg60njKVj45pvY/isGb6kQOMgfB5fyt0f3mYhr89m0EiceZWO1qakutvrUgHqmuB5AGhz8Gr2jW4eIEuLp+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545628; c=relaxed/simple;
	bh=zpT7vKk5RwGNqc2qh5o2gdsxY4SIBJHwPSpJGqPGkl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suzPwI9vpa71WYYzD880sJE8FtX4HJvKnbvFIvnBiIKWZAvN8O6w/Oe6HXIL6SqjjnRoSOknG2exb+/bsUn3Gf6lw7L2I2F5Yrul4v2bqSBo4JX0uPHT+WXJrD+fjbnt8IX6gpPpzWE4FEJxRLE+gdficAOhCV6vzWCsqgQmS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n5Qm7UUj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n5Qm7UUj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso11299155e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545625; x=1726150425; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVHTuNGWpcFrdg1z92VZwboxKWfkM9u5ktFj5pVRY10=;
        b=n5Qm7UUjLzJX0eOQAZWH1kAR2V/OiRxXBvE6E5kyEs/+f4EDhRnF6RKJlyuoTEBWOx
         ShzVKkQiOQdoGxcqdtnL1+ddCGoXfDFVOmXpZR1yXFpXVhvHhoUXEcegI3Z3dYt8g1Oi
         q7DQNdHFMvVe1j9VBB/HldLAI/NU3HLmNoVgJkeuYzNriGWiWRN62oNzLIsGY7pjd9Y4
         eW8tc8ubDHqSIipQihM+/wsdgdyFSvOgjT8Nlw0rwdZP2l9sB2NO28/v6ZTgaz2a5VQW
         PRVdRK9bBZGoVWZPz6BdFx9DqYdIrkQTYhKYO5ZJmHlYdL3FPXYmIQR9GKLNBqivcB4Y
         0yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545625; x=1726150425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVHTuNGWpcFrdg1z92VZwboxKWfkM9u5ktFj5pVRY10=;
        b=UudhDD+wYZxLRhOq6zfs0xEqIkpZ020zeH9W+5b2NG01MGNkXBHWll9LDEO+L39kJM
         fmZryWA/++gDuzBQAqQAeCH8adZr/f1ZQ4WM24yF114NYB9bFLON/L+cL32IJ7U8A8gF
         Dkrkd1ivZXy8OJBOFvGBWPpyGbpdfk5GyQJ+4XrV3YeMgmk/1hho1+1byKcYnqiToY7J
         bZqO0X9J/lM/sEhUOIX/k2rXx82ciha9k0OEgbmCWJkAcEgAQY2ptRStWT5gczRUG8yj
         gBkFCD8CfCJrffZHR2gFGRW33SAyoehUziR76qlBtySdbp3rLRO8LDndunkWb3j0Iwr/
         JFbA==
X-Forwarded-Encrypted: i=1; AJvYcCXC0Z8zTNNWQq4imPMAB12yrt+pXlB3CLrO0mQ/J5iSxwXMxaXpTToI0r+z4ldCG+mVC+1OLVH/N84y0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4MV3XM/0BtwfSlpxF1WbUqKJPLc1wNphXUQmEmdNCsRi9HCgF
	We3zQYrhMu3jEon3AfBAjQsCudwVxcWCGBwcBUtuL7zRiwX7AzyVRBuK1cKazSU=
X-Google-Smtp-Source: AGHT+IHAt5Z9yvfW2N2+9sKeMO31xt1LKMyq74worjfNWzRpMuSL5RmIi0iCLuGFdoOTEvAgdLpsNg==
X-Received: by 2002:adf:ee52:0:b0:374:c7cd:8818 with SMTP id ffacd0b85a97d-3779b847c99mr3905848f8f.22.1725545625178;
        Thu, 05 Sep 2024 07:13:45 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:03 +0200
Subject: [PATCH 12/13] ASoC: cs35l34: drop useless rate contraint
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-12-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zpT7vKk5RwGNqc2qh5o2gdsxY4SIBJHwPSpJGqPGkl0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byHCu0z886qTeaxytjbJcYPUhvLKi6a5nmcQ
 KBa6BdBIQyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8hwAKCRDm/A8cN/La
 hWBED/9N7WEhGEgo9YoopFhslbk0WKky2qk9oskEHauCvF+Zre638/Xs1VKjHXi5gaW9DFsewCe
 8BXQmpqic/g4g/KZ1bSU1gtRPJzWuQUM2sbKRbPjwKl3ZjZY3skXMdvGDktmbmAUEjQfWYyaHGp
 Mx+5cb9seHfCb9CfRzA7CBAiPP9QKgLirL/w73Efii1rED79nzvGyZyiUotDKkV5jCOn6FQJumq
 2kH2l4bM25BHOjvqtDCybOuKSbj7gxcC5aHitquhM9xq+pLrqkhPRa6z442lqP0GQNio182qG6a
 tIc3t4wI1L3D0bmggbA+qpNban+Ue2uHEMMlamtUZvCv45CGzqAbASvy0/rEos+HTWwVE0syyuL
 JpIFB4+crXOpQK5VoFJM1QBkYIHzuqFCN472OafDNVoVMS9d9QAQkn4UkaOoufUcAP3WZsBQ1wm
 QeWNgOVhBKM0MI9XohaVpY7JjPL2dzNlkWnHTFmWKBrew3BfxxImdzNm3eNalKpVXBQHwQJ3di8
 26bAL9glcTCmq2VhAatgJCb3Xnuml1EF8l9LtKVa58KbBQRytqxBms114Bu0XK0mS1EzsfGzgLT
 a3nLAh2/+yq1IsqtNqQxdX9kmziJfWm6CZAgMhKfP3/5UJTczHgjPwpCTCZ222w1+iJ0I5R4BP7
 cbzeB5PHdHllGJw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The cs35l34 adds a useless rate constraint on startup.
It does not set SNDRV_PCM_RATE_KNOT and the rates set are already a subset
of the ones provided in the constraint list, so it is a no-op.

From the rest of the code, it is likely HW supports more than the 32, 44.1
and 48kHz listed in CS35L34_RATES but there is no way to know for sure
without proper documentation.

Keep the driver as it is for now and just drop the useless constraint.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/cs35l34.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index e63a518e3b8e..287b27476a10 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -562,26 +562,6 @@ static int cs35l34_pcm_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static const unsigned int cs35l34_src_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
-};
-
-
-static const struct snd_pcm_hw_constraint_list cs35l34_constraints = {
-	.count  = ARRAY_SIZE(cs35l34_src_rates),
-	.list   = cs35l34_src_rates,
-};
-
-static int cs35l34_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &cs35l34_constraints);
-	return 0;
-}
-
-
 static int cs35l34_set_tristate(struct snd_soc_dai *dai, int tristate)
 {
 
@@ -639,7 +619,6 @@ static int cs35l34_dai_set_sysclk(struct snd_soc_dai *dai,
 }
 
 static const struct snd_soc_dai_ops cs35l34_ops = {
-	.startup = cs35l34_pcm_startup,
 	.set_tristate = cs35l34_set_tristate,
 	.set_fmt = cs35l34_set_dai_fmt,
 	.hw_params = cs35l34_pcm_hw_params,

-- 
2.45.2

