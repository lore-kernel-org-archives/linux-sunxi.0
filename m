Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8689119DF5E
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545624; cv=none; b=H3GoNv/KcF7kz5zU20CRxcKSYBBEwMXhNwEWZwwaoX9W6mR5anXg1vKDsShZL54A2Z6zRNCJY29d10bHCpFNQIXxyohKfye+5GL+4Fu/ZaNFhAYKQALBRNkleCuqIP32uQa1bo8V0KLgRQkIfLHxdgBhxKjIRZeXm4DoviuM0XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545624; c=relaxed/simple;
	bh=x86FNaEpjnIyR5OAZHCSCK5+o+umgxvyBNNfEVUoPH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcP5zag8z99Rj/yqRMuShYe6rlbVgvlfWUXGWRCEg8TPEs7foSwbcZGg5y1atzj0YGIJMB2ktp12/GwO5ClWi+9hulDyC7Llt4ft+n2+c2tjTGWY1uAvFaeaxUe5Vlfqsl+/uDDUPU6/PE01A0lcwtuxeFFYte3IuBJSptbvRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xQoNlMyq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xQoNlMyq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso11298695e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545621; x=1726150421; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sxrac1nWcSLd8cTfx3t0NuLkVpF4P7zBU6WUMa4X7WI=;
        b=xQoNlMyqYgiy0kxPZgVEyhUiNi10W/TSlbGz6aVO9AI4fDS1NIT/ZmxweBZ6NPI4bo
         fn4Sre7OnWuRmr4+yJIwCKlXGQMKnYqtcZ7rr+v1/hg4Co7NGwE7ra30xt+bfc5NkSJ0
         fQ5TTZ/x5n3N8Z0hdS8ggIfDjyIOmzhj1RacRbrolkXZ4r9Ij7gIMMSZZ3/YNZLlACXC
         VXSY+sVGwXAfgLdY1zTwEvSHxzm6VSigSS9jAYRIrOgErI84WjeK0n+TEM660i6r1DHn
         +kSweCs3ZntW3D8bqO3akYnrjjx+APEl7B8gLEEN+m+1/BzAZ1JIQiuq/dUSwv0hbh/u
         rV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545621; x=1726150421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sxrac1nWcSLd8cTfx3t0NuLkVpF4P7zBU6WUMa4X7WI=;
        b=AFAdqIWlfVkNhIUx9p5GlVF9kvbN4C9tOFkhHs8QAtp5/dz568wwTGeWFP6wcCpqAr
         C002uoAwhHZwlVS0r8eOAn3ir7kxYdiYHLiRKy7Ge76OaCmjfzQPz40tgCXs+XRx/aOW
         sxyq94qxWu4eJqjsFDmE8OgRHuZxYHJvOQOx7xQCnCkWwSVpZxWtIFBFZzW0xmz+Nus4
         75jQsFnaBfM3vVu+Kc88JWBwVco9eETyCTGtPrs+qq2T5DB8Sw9FT7iUBsea6/SXryfU
         vLcxzrslr+WaNuciUnO/jbWl3niYOWWgt3rCen4Eprp7XdiFGIdH0a0N0YjS8GEWQc3Y
         jmgw==
X-Forwarded-Encrypted: i=1; AJvYcCVFj6ZfHhhy+OVcgSiN3iCUSHv+tx8nLHLE3Ka9ats6OF+6fGTXeZHG3hZ83Crbl3jwOoHaD8EdzOtCGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhTQHCK54y4h+OUTB4hRW+xLbCnLKYkG/8PV9m9DwMRljVeBdL
	dAxqLG1obwUNDqSZ21LOxpgezVsSDZAHcHYnWVmewBLW2Uq/FZr/4SnXaWa5S4s=
X-Google-Smtp-Source: AGHT+IH+jM4E6XFtH4yV7dt/MuKKbSnx0kbRDSQ+9W6MalNelsQvYVX6PPe8E18bCCVxO02rcsQe3A==
X-Received: by 2002:adf:e709:0:b0:374:c57e:1ea9 with SMTP id ffacd0b85a97d-3779b847aaamr3814838f8f.18.1725545620447;
        Thu, 05 Sep 2024 07:13:40 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:59 +0200
Subject: [PATCH 08/13] ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-8-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=x86FNaEpjnIyR5OAZHCSCK5+o+umgxvyBNNfEVUoPH4=;
 b=kA0DAAoB5vwPHDfy2oUByyZiAGbZvISh5e9yuIZ6fhegOdIwe1HpWFPSz5lzuBx/Xh1lYE/Go
 IkCMwQAAQoAHRYhBPThWa4Y8/VtXxu3G+b8Dxw38tqFBQJm2byEAAoJEOb8Dxw38tqFxS8P/Auz
 glLnhOinsM4qpstMYih0MgMyBfS5BkRGvvQv78UV/Mi4Y8Aa/TZLWyjY5DtZ/ifYi+CQ1mTVKlM
 fcvpqaydV1yQs26SZX4WwftbI6yvH2ep63gu1gDMjNg19JM3CN5m+K17jL0N/nz9WJm1MifPHX0
 CNs9yhK3TaHhbDqsTKS1R3GGdjmRhYzEOFOECZI16OAgDUyHSyCrNW9moGzFE90b+luipqUKZYv
 CgEEa8t5PtgYBbB5DBVfQ9eMRMIMSffn7PBsaFLmvekhISH5e9iTm53/pGNBxXez7iYdm0BkOau
 vxSImcNyZd3McfPzz+NcUN4krQat144fofS0bz2ZDjZChOqX/TXst/bxAf9hnPBQM3b4HX9sOeA
 GX3y0BOPb71vdZWkk6q9tslY+DdFju7R1b1+At5rH+AwFH6L1ClGTEQ+hIwr5rLQ9WZMjtMe3Q4
 LbTkhY3khwyp9PYpDApAnR/o+LCtt4LyWOVy2A8cLmtmKHIulIL6Oqw3zqLeAWzKZvlGW+8WGrI
 jgeK+AU37YkFNpFF3YeM20MIXa6aDJ3PywF0zLVWsQ4sfVMUuHsWUNLAfsFSKbDjt7pF7tT6x/m
 qX3KDTzkCWSW6GZbgBS9jXRx00jM91w75beWJJ/mZ4V9YR1pAhuPwwo/oVQiZGMZQkmMR/MaAbj
 NaY1l
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/cs53l30.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index bcbaf28a0b2d..28f4be37dec1 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -739,24 +739,6 @@ static int cs53l30_set_tristate(struct snd_soc_dai *dai, int tristate)
 				  CS53L30_ASP_3ST_MASK, val);
 }
 
-static unsigned int const cs53l30_src_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
-};
-
-static const struct snd_pcm_hw_constraint_list src_constraints = {
-	.count = ARRAY_SIZE(cs53l30_src_rates),
-	.list = cs53l30_src_rates,
-};
-
-static int cs53l30_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				   SNDRV_PCM_HW_PARAM_RATE, &src_constraints);
-
-	return 0;
-}
-
 /*
  * Note: CS53L30 counts the slot number per byte while ASoC counts the slot
  * number per slot_width. So there is a difference between the slots of ASoC
@@ -843,14 +825,14 @@ static int cs53l30_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
-/* SNDRV_PCM_RATE_KNOT -> 12000, 24000 Hz, limit with constraint list */
-#define CS53L30_RATES (SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_KNOT)
+#define CS53L30_RATES (SNDRV_PCM_RATE_8000_48000 |	\
+		       SNDRV_PCM_RATE_12000 |		\
+		       SNDRV_PCM_RATE_24000)
 
 #define CS53L30_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
 static const struct snd_soc_dai_ops cs53l30_ops = {
-	.startup = cs53l30_pcm_startup,
 	.hw_params = cs53l30_pcm_hw_params,
 	.set_fmt = cs53l30_set_dai_fmt,
 	.set_sysclk = cs53l30_set_sysclk,

-- 
2.45.2

