Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E0619E7D1
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545617; cv=none; b=Vi1dTHAwQshZiZ0J/NL56xtLJeRaY7qpjBc5YieR1zMSUyC7fjtGsArhP+KznS1iRvU7Em9fd6Wth93asJVeWAFx+Yn7EvmO6YUxT9M0E4oyRer9ddvwHW9ykL93HWHWAIJItfAIOMSXHlNqtj3eSeylw9wd5Nfs+GgcEDapRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545617; c=relaxed/simple;
	bh=nbyk2pbjAgexYBySRE6v5MF/PkMeyNKLqiWP8pzL27U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3IILE7+6u62wCzgkgwbmh3F133loLQRuwCzCVLjT8VFe5y9btPGxgousrnEQiupoy+/RMrqkMz1D5exuEmeUXKBtlkbmsP5M0tU7+cGy4hlKpJv7iYnFNBXpEaOVMhMCF0ngrOkBjDficJkxgmJ4kiH0/UDOxhutP6+IJo0OFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=A2D9ZHra; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A2D9ZHra"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb81e795bso6815235e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545612; x=1726150412; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTW4BPjVBNC1txaO1Qybt7JrbkszqBjqcNmLmY+bYcs=;
        b=A2D9ZHraQJvhcV85fBHHEqZdtIuVCEAvjURO7ieuYpMHxdmK80xba9Ck+9Ig5cJ5pa
         3sQnJwdL1FCzWMraXrAyKZ9Idfu42YAv4CX3lgbeesQYKIgsGx1k68xPk05grl3gCjcK
         9UIxGI3DNhavPauVuiIBS6hB03PCf3429jJn4XIk8MkpJtFvDS28bOsNQRq/qOfqPcqn
         MyIlcM3ZxjRNPqpEtYFBXTKg9ULTF+wUsb6Krab5m6j0voWzbI7FE0QkS8WdUwybbQGm
         WrHLiwPHQi2GLG0CEGlpgQXODiI/wRuNHSfrI3nBsZWLsdmTq/RKp5+qd0Jd0VAFPtP1
         cBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545612; x=1726150412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTW4BPjVBNC1txaO1Qybt7JrbkszqBjqcNmLmY+bYcs=;
        b=AFbEAjWfu2DxJC/DQ4HbNNdoURK6aunukkH/VYN+Y/3PgMoujgQOHKm8B5l5YSr1MR
         YVQtVIv5cOkTQb5/OqG7NymXzOoeIp9CVnidYoWSAThhK1WNCx6qx8SRZGfEb4AVlIEU
         Fh34oik8dLCSNS0ulnM67srhGGyOy/XUR59904KQenb87Ge/iV7BJl+Q9gRmaN3l2aR5
         jHdgf3OoXoSaNR6MD2dxacCuDTX3MPpkVN3DcmLCNUA4AsD4QybS2A05s0OMax+ReCP1
         M9tMRERA7O6uKy9jdvnLXWgbc8xiWc9voBZCzPiJGZJ8LxsJ1vr4bQi2z7utiQutw4pp
         TVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0dtqmnMYFt/KZG03+Dkp1ODAjp0Mf0kT+31SaJpz+JBWTlmuz+q4zYzyYL380vz6xoj0T/+IGrwCVYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAFE78kCsQk5FJ/JHll3Fmg0Sx9hYPNOS6gerGVS2msKAiDrmM
	zds3dol0n19eRPUrkS3sD5aYY7UmEeJ01K9CbpdQDJaq5AW2aFaCjigHjmruOeg=
X-Google-Smtp-Source: AGHT+IHBWWTYTD/NiKOaA5SpW4N37gd2i4CApX3NZGiNIF1CauMco3Jpwv1V3JBttP1V61f4V94HEw==
X-Received: by 2002:adf:eace:0:b0:374:c324:eab5 with SMTP id ffacd0b85a97d-374c324eb64mr10087549f8f.41.1725545612335;
        Thu, 05 Sep 2024 07:13:32 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:52 +0200
Subject: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nbyk2pbjAgexYBySRE6v5MF/PkMeyNKLqiWP8pzL27U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx+0hxsyOB1G3jUIFP2N4UKQAgjgwcIS7zpN
 P2ju1g982qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fgAKCRDm/A8cN/La
 heV4D/wJBqYO/X+0ODfULGsb4Og1L+bWaai0VSP8TToyZzfpSkmUyd/wXZtNo/BLpdsdAYyNKM5
 K314rJcJfBbWXQT6XmgfRSjc/Kn7xKqFkrJzGUVtpiPlf82h6RW1M25nfekb1lMia6rvaBcRVcQ
 15eM1ckLvlIhWZpcEvTaBFWW/V5TUcy64mpJX574qJCKbR0U071AqMTsYgdTJnptPAZOTqhLVDc
 uKbGoXvfX9F4KWs+YH3d3kjzeDeizAkXrRhv5NHoLeOUvvamYZggmjqJCRWS5oiLPn5JKvkig/L
 YOCgPtBn4QW8gZKxhOmRqLA2GG24RRADpaEWRPfIUziaeZMYJi2u06HA+gtyzP6gdrwimkS2FN/
 ii3pA+MwjNoOrCKiHPzKFX1WpeoDruRDBkXtNfnubUsOQj9OI5lUdr0EQna1gUUiVKRKnTr7QDe
 DiZP64xgjmL/kT/YK6WrZ7BnJ3rpZSd1gOmn8vRYRjG88M3l1PdggL7LXUWSfXtYqxX1loVyR9M
 Q2ewA4GtbRX6qeWpf26VHv3j7tyVzLfDM2oaxTP1KOlHAp0V6r+4CIWKTst9cGt2ASHCbJgfdVw
 dA5qjMX3o7PP6ZwPnhwY/uNBmjUtZcX4ZseZNgdFDGYRUuKIb3qCaqAfVjMfRKuQB0XfOKo85A/
 x/qauD5RnK44B/g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This adds a sample rate definition for 12kHz, 24kHz and 128kHz.

Admittedly, just a few drivers are currently using these sample
rates but there is enough of a recurrence to justify adding a definition
for them and remove some custom rate constraint code while at it.

The new definitions are not added to the interval definitions, such as
SNDRV_PCM_RATE_8000_44100, because it would silently add new supported
rates to drivers that may or may not support them. For sure the drivers
have not been tested for these new rates so it is better to leave them out
of interval definitions.

That being said, the added rates are multiples of well know rates families,
it is very likely that a lot of devices out there actually supports them.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/pcm.h     | 31 +++++++++++++++++--------------
 sound/core/pcm_native.c |  6 +++---
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 732121b934fd..c993350975a9 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -109,20 +109,23 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
 #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
 #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
-#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
-#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
-#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
-#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
-#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
-#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
-#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
-#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
-#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
-#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
-#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
-#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
-#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
-#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
+#define SNDRV_PCM_RATE_12000		(1U<<3)		/* 12000Hz */
+#define SNDRV_PCM_RATE_16000		(1U<<4)		/* 16000Hz */
+#define SNDRV_PCM_RATE_22050		(1U<<5)		/* 22050Hz */
+#define SNDRV_PCM_RATE_24000		(1U<<6)		/* 24000Hz */
+#define SNDRV_PCM_RATE_32000		(1U<<7)		/* 32000Hz */
+#define SNDRV_PCM_RATE_44100		(1U<<8)		/* 44100Hz */
+#define SNDRV_PCM_RATE_48000		(1U<<9)		/* 48000Hz */
+#define SNDRV_PCM_RATE_64000		(1U<<10)	/* 64000Hz */
+#define SNDRV_PCM_RATE_88200		(1U<<11)	/* 88200Hz */
+#define SNDRV_PCM_RATE_96000		(1U<<12)	/* 96000Hz */
+#define SNDRV_PCM_RATE_128000		(1U<<13)	/* 128000Hz */
+#define SNDRV_PCM_RATE_176400		(1U<<14)	/* 176400Hz */
+#define SNDRV_PCM_RATE_192000		(1U<<15)	/* 192000Hz */
+#define SNDRV_PCM_RATE_352800		(1U<<16)	/* 352800Hz */
+#define SNDRV_PCM_RATE_384000		(1U<<17)	/* 384000Hz */
+#define SNDRV_PCM_RATE_705600		(1U<<18)	/* 705600Hz */
+#define SNDRV_PCM_RATE_768000		(1U<<19)	/* 768000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 44381514f695..7461a727615c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2418,13 +2418,13 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
 
-#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
+#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_768000 != 1 << 19
 #error "Change this table"
 #endif
 
 static const unsigned int rates[] = {
-	5512, 8000, 11025, 16000, 22050, 32000, 44100,
-	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000
+	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000,
+	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {

-- 
2.45.2

