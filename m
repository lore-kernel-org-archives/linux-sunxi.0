Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3781619E7E4
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545618; cv=none; b=h4QonvOg+b/9IzHJxAHCI1KWJkSpP2xy3PLdEw0zgziCJMe4g6jGeidg0dzczzzWwrOe0Fq7WsGekA9abC0eMQHIsfcFDTv2+X92emLtOlWk0I6TR13vzrFKbT3OO/5wif7NlAs9+FJjJK0LhFmm45R5xFf2M2GJgnXuQHY4Bts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545618; c=relaxed/simple;
	bh=vHEDI7Y2wONOCstSqdZiAYxiDnXUk239ce26xbMNwXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVuAEG6vr6omuK+7kW+VNBAorS8d3+hEeodgDJQq6Q2TEupwaxVtr6L/mH/QYnmxyu16WgbjeMiBijiN/8xx6JUSDju3tZ46zE5RXbYUrJ1vEc2YNMdwtcPztoMHyujgmrSjSCmOyz1JiTRUOvdrgqSQ8IKMoCskiroA2Fjcux8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NyXvZBKy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NyXvZBKy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42c7a384b18so7218265e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545614; x=1726150414; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30qVKHGzVWd3Ku48k2FUb5pg6hyRShvxsMxjgIodA3o=;
        b=NyXvZBKyB3k1nK0anFxOEjRusOOqYYpl9xAFnKjUy4pq6jNfYOd2Epe7DBnO3xAvan
         nbQNHwQo4ldQMbDgRg+bGH/QSMfWdj/fBhEbAk1wid+waneOrZBXE5KPkMZ6r9uARNeB
         HldkBD1375V2lxiKsGyrBtmIjQLfS65nZIn72Q9ygKhSgYXUl7Rjsz7PYuPam2KHGe+1
         go3cJP7yuGBbJMc+Lv7r6M/pLxNIwiOvd3WtbAe2BNdlquRyvXgKQeeOeaOcWe8lEvOy
         2yQRgcz1JwvSXGcLUysFWhxR2fRsFUUPjWI9yVFRLDHEXNXkqf/rT9N1dxLiE2UYZiI3
         hr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545614; x=1726150414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30qVKHGzVWd3Ku48k2FUb5pg6hyRShvxsMxjgIodA3o=;
        b=Pnkq4UxhgXjs6b+ni7d3uUY5UsTHs8vGhapJq254uu0ycaIqv/IgeGZTDV3D4D2CB1
         IdQp3NEFh1JcVgl7rW2MDaEa0hslhE2oAcNmOHI3qFeKeVZyYqKR60EAf+8EVG7N5JDz
         8r1/gc3OjZ+3BiB7ZKXIt3ZPhAIBKafKAhcYMSnHJCzCko871gKkyKcBl+sVnJl/+Ql/
         4Hq0yquCSEpF/Kq9oyQgdZRenzE9BMz6aLMGRk5C1lw4+7md9kD5usv0ccqomR2+P8SG
         gNs6riOARvuu9wYlCsB4EDTbPmR7tB3Jf9rup+tMLAInh3ibZzrn0Mi8jEerSP/8IWBq
         9ncQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQOTpzuPN17gfhhrfW32IGMcva48MILHLCcC25SvHR8cz7QwEHmBPDtI/+1EPSCFmxNWjcg0pQFDW8Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmVFfdRfjqoXcteUoOOZTpdN+FLF5E34HvecDmw6cRZ6M3KAFh
	mSNxxH1Opg3nowQCVWWnKTbFViaMAFB99XcXefM3BWGZ2BXg5Uka52ie9Y4gNI8=
X-Google-Smtp-Source: AGHT+IHIINA9ikiQAEU4EVqWqd096m95ELTkl7taBlSxkBiyU94e8ZbTjmpLrftCleoK5D80ZO2gcQ==
X-Received: by 2002:adf:db4b:0:b0:371:9149:dc54 with SMTP id ffacd0b85a97d-374bce97a6emr12068945f8f.3.1725545613483;
        Thu, 05 Sep 2024 07:13:33 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:53 +0200
Subject: [PATCH 02/13] ALSA: cmipci: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-2-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vHEDI7Y2wONOCstSqdZiAYxiDnXUk239ce26xbMNwXE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx+GwosY829uA79cwaR6MhJh5SrJ51PMsGpl
 bhPAAdHb9KJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fgAKCRDm/A8cN/La
 hQQ1EACX7oZZnRmZybF4ZVzlqM6krwmIFsFCSWMj8+fdpuUMLvds6lhBPbPqTlrzVjo6Axvntzi
 a0zUc7Sk7LBRV47wqdoqWKq0lP0ZLCWpTCZ7U+kY31Hq1PzMJVpXVE8qWlx/I0EOyXvvR8LwVC/
 Zr2CtgHmNwUHARlovbaLEPJ8q8quzX2hzcBi4tF3++zWTrDEHx6yoxLUAOPDkFufctmIXw4yoGI
 RlLaxlH/YA/wUntceJj4IHQhRkjllvEMGTGI5ZJrDna5pFd12UfXF36yOA77k8umwbZ8gkF0Df4
 dqs1Dt3X7Y3oT0AzChJNtNyk0HyRPNHf75Pt85UpwxbieNy2jCYgLABqZCDa9MoWZ4EzPIvtKYs
 ZO1BE6UcfxcLjHN92HOigMvm0ANZ0XUVQaM1NA1MFzkulMwzO9oF31CjFK231j3PKvFgxP/pgLd
 GqTh9JNwFLWEw7R2+ZZwoJK00+GXqIkR0JYM93RL/zpdbR3DZ/N50xJgl59kPrqkBEbqVW2vPxA
 6WwLE3cV8pMe5AkKxcucwDxVjyiExPtW4uNslSYYxx+tS06mVbMaCAG1eSvFouupZ2DAV0fkaJc
 KMAX1MuSgXX22BAkazYem6fH5Fy4XlkiFOXnkDmaJPOz2vpR8U+K5aX+UnguNsQqdAfyVRFKdXX
 /aT3qhPoNhM7mMA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 128kHz.
This rate is now available through SNDRV_PCM_RATE_128000.

Use it and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/pci/cmipci.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 36014501f7ed..e3cac73517d6 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -1570,14 +1570,6 @@ static const struct snd_pcm_hardware snd_cmipci_capture_spdif =
 	.fifo_size =		0,
 };
 
-static const unsigned int rate_constraints[] = { 5512, 8000, 11025, 16000, 22050,
-			32000, 44100, 48000, 88200, 96000, 128000 };
-static const struct snd_pcm_hw_constraint_list hw_constraints_rates = {
-		.count = ARRAY_SIZE(rate_constraints),
-		.list = rate_constraints,
-		.mask = 0,
-};
-
 /*
  * check device open/close
  */
@@ -1649,11 +1641,9 @@ static int snd_cmipci_playback_open(struct snd_pcm_substream *substream)
 				     SNDRV_PCM_RATE_96000;
 		runtime->hw.rate_max = 96000;
 	} else if (cm->chip_version == 55) {
-		err = snd_pcm_hw_constraint_list(runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
-		if (err < 0)
-			return err;
-		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
+		runtime->hw.rates |= SNDRV_PCM_RATE_88200 |
+				     SNDRV_PCM_RATE_96000 |
+				     SNDRV_PCM_RATE_128000;
 		runtime->hw.rate_max = 128000;
 	}
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 0, 0x10000);
@@ -1675,11 +1665,9 @@ static int snd_cmipci_capture_open(struct snd_pcm_substream *substream)
 		runtime->hw.rate_min = 41000;
 		runtime->hw.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000;
 	} else if (cm->chip_version == 55) {
-		err = snd_pcm_hw_constraint_list(runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
-		if (err < 0)
-			return err;
-		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
+		runtime->hw.rates |= SNDRV_PCM_RATE_88200 |
+				     SNDRV_PCM_RATE_96000 |
+				     SNDRV_PCM_RATE_128000;
 		runtime->hw.rate_max = 128000;
 	}
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 0, 0x10000);
@@ -1715,11 +1703,9 @@ static int snd_cmipci_playback2_open(struct snd_pcm_substream *substream)
 				     SNDRV_PCM_RATE_96000;
 		runtime->hw.rate_max = 96000;
 	} else if (cm->chip_version == 55) {
-		err = snd_pcm_hw_constraint_list(runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
-		if (err < 0)
-			return err;
-		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
+		runtime->hw.rates |= SNDRV_PCM_RATE_88200 |
+				     SNDRV_PCM_RATE_96000 |
+				     SNDRV_PCM_RATE_128000;
 		runtime->hw.rate_max = 128000;
 	}
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 0, 0x10000);

-- 
2.45.2

