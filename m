Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC21F19E7E8
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545621; cv=none; b=dsCGTrXOLOl/lswkDl1bu8LufE2rLuJQ+XFrzb0kTPzL/htMX2T/fxHkgjzv9CRGFzp1ObSxLkCDx9oGFEBIGqG1flSobiF0sm4TByCH/EZR8EQu7nwMgkPgEphOMX76ZQUAqiKT3OAPLwCJhF5ORBQm/JgDP830hOBB/BRWvL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545621; c=relaxed/simple;
	bh=Xv0vuHB6OmJEPDWj7YbALy0svxpRq+MGIQhgNIVXe28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQY9EGCF09tBamxio52CQjbhTfdAvUM/wwiXC/DJx4D6NtlG2vdJ5foGTiHziIOmD2SnVXLyYbOKAtc2zgi1zHVsb+o9VAuqKcVnGzhxxZ130EDvfOHvMvS/yXiLFgpLWobrnyQTifAOR2XtThjTX8XnfRntCvoSyDbSalT+fjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NNWC1OK+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NNWC1OK+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42c2e50ec13so6856055e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545617; x=1726150417; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcCu+DWFXbg2fAQ79jKiLK8pzJONU6/x+rmv87WbABM=;
        b=NNWC1OK+ZAS5hRAiNZIDaRnf0dAET3RvpSg+zbnu+aMDDNnMGlOojUsgU9eO6MvVKW
         UGUvfceEz22Vghds+yMr7dyX6JUEjxOdnxpB5lxfQ+ff/26/PnQ6IdKgYuTMupRt0s1q
         dRb/r39s4XmfNBXrFv6jjWUkX1/oZg9mlZyrriuQMghUEoYjJQc+PRllk4/s4JoXBRPi
         WOUzPeif7dISfUuQsdqqaiaqpdSF0kmP/mAjiPWCujkmBictUhb1lnaw1pULm2WXXdZv
         D/OwRnHeUAzQEf4Te6dSy7asku7Aa5e2h2r0m2LiAAEBmjJLxjFMVUQnX6YMblX35/qq
         nhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545617; x=1726150417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcCu+DWFXbg2fAQ79jKiLK8pzJONU6/x+rmv87WbABM=;
        b=mNOYIPKRbaWPFGoABnpTP/noj4R9om2lXIkwwdY4A7P+2cZ7Bt+kAAlB4xyJPt5g1K
         1w6wnOP64N6C4AElJwUfNKPVEtds54aE9qta82TGNirFYWyAASZBFLgAk1QqnvaFCCh3
         02VPrSi/CKGNoqvGwOexDq349HAhEmIYVTOwS6vtO1CjWCU2dthmuSAG31Rz7VEV2rUI
         Nw7TUd2hplNQff1Uk/r/wUmhMjyrHmOGAe5IuXKF05jHciD1pR2IcxqNK9S96e/5sxPY
         SgmCFuMVJ4pwC5W2f1HRY6lV2uncOzg921hfSM86he4fcvzwzNwKYBoykwweQD+o1D3c
         cmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnkBSUQK9QXsnEJCfv0yrH/neq0euZC+yvoFh6QALyJsuMeVrWoaJjAoAE2+W71165T+EcsORKDnmnGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqK44tkHmTAMaBYik1rbbbExVYDEZDir1z7kgVwxNK+JEbiUvW
	2mIyOykbIy5Sqy376XOCQ9N2sAHZdB3zSMZjP5jQ1CtIigI5hKIw6niduHTMXf+4sWHVlW9NBcK
	P
X-Google-Smtp-Source: AGHT+IFIEHR55riZlgeQGJQjXuyOXmmTN+5SiNQQq3UpC9AB9eRnK6WUg+y3HQedvVtwF3WTVV2akQ==
X-Received: by 2002:adf:fa4c:0:b0:374:bb1b:d8a1 with SMTP id ffacd0b85a97d-374bb1bd9c6mr11130169f8f.13.1725545616938;
        Thu, 05 Sep 2024 07:13:36 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:56 +0200
Subject: [PATCH 05/13] ALSA: hdspm: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-5-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Xv0vuHB6OmJEPDWj7YbALy0svxpRq+MGIQhgNIVXe28=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byBQJXpw0tKm9S1aoNQuw0gFMk22/TxwdNAJ
 DQo1OePFpeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8gQAKCRDm/A8cN/La
 hb6CD/44tlADSXvh8LtznvSCnCRWDjibNp3ZPrngVla5rHZENvj/3bhJd4z2yqP+n5D9sGXGqDG
 4xNTMjbtLBxWXfJQTNFD1EkV6IIjuGJvW0i5NwXFyIS34ysoOE0hI9Q8FqVDCddEonzuY7wcjy5
 RnJBiUvZoKOO9WcpWEP3gm0VGniXudhEWa0SBL7G3ojs3j7TOXDF1Mceym7wTQKYJGZlZDCUohC
 H91vxd6zdshPH/qzyMI9jqGpjwkqY2lpHww/KZ9tQqPpy2VS2MXPgl4llQyPpIxxvbcQj56iZcR
 CsjdRZRWF4PE/aTCl1T8mbSUU/XmInE7C+yqydfXqxp0jd0vFsy8ZojjGp6JDfs6NgGn16EYbS6
 ViY4U2XOqdcXgXkg8ttNgs6JaEhjx1XrkRddp7NYnj11EVJIwwo/zODYBuBCYZJNSctuqG3MvJG
 IxM9AEefJBxIgyfUskHexjjJBa6NJhU/6ux0FNEN/ukrTRbxmCOFacv1jZ+uqo2BL71xYSl8GNq
 oAny7kUhtzHYyMG7I8Ifp0TH9qEtXeY5QApAGE+oIPYKpe8btMam/nMJCyBhUY7PotLSrYd97T2
 yQ+H8YXAew9HF16sTUciTp1/QB5QSU3YEVOEMQOpwc/MS7pQvwWhwZQonuGU/QQHJOQwvSsMelf
 DIHwWZKP7oiAz4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 128kHz.
This rate is now available through SNDRV_PCM_RATE_128000.

Use it and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/pci/rme9652/hdspm.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index c3f930a8f78d..dad974378e00 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6032,18 +6032,6 @@ static int snd_hdspm_hw_rule_out_channels(struct snd_pcm_hw_params *params,
 	return snd_interval_list(c, 3, list, 0);
 }
 
-
-static const unsigned int hdspm_aes32_sample_rates[] = {
-	32000, 44100, 48000, 64000, 88200, 96000, 128000, 176400, 192000
-};
-
-static const struct snd_pcm_hw_constraint_list
-hdspm_hw_constraints_aes32_sample_rates = {
-	.count = ARRAY_SIZE(hdspm_aes32_sample_rates),
-	.list = hdspm_aes32_sample_rates,
-	.mask = 0
-};
-
 static int snd_hdspm_open(struct snd_pcm_substream *substream)
 {
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
@@ -6096,9 +6084,7 @@ static int snd_hdspm_open(struct snd_pcm_substream *substream)
 	}
 
 	if (AES32 == hdspm->io_type) {
-		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
-				&hdspm_hw_constraints_aes32_sample_rates);
+		runtime->hw.rates |= SNDRV_PCM_RATE_128000;
 	} else {
 		snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				(playback ?

-- 
2.45.2

