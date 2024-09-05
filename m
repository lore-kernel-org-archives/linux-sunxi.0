Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F84D1A2C2A
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545630; cv=none; b=osfCEIOJ7BtqsnfYiMd29fsU7yN4E4DxLaPW7Og3L8rvZBidX7g7Fg+Slk6KKHB03JxebAKdvsdA+ocsQ9PIGX/PyOPkf3YoNyE7jqH1HkoIFYWQWUia2sJ+ypOCqxnfI5hW5K7pzaaV1e+FzTO1ahSbH0jiYafYJ4WLNjKLL9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545630; c=relaxed/simple;
	bh=HGKKWuwE3+8ouI0WFbu/VAtPy+LRBtX+ATMaNod25ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CK4aAbl/eQJT7U5lNHkNKQ2xArIMQqWfoQVsTpi4Ox+MiP4rXoAfiCMMuMbvSY4ipaKhG86liR4jeIkQNBeo9J0AmoyCr/D5zzDU98koLhLeWJuWXBAjgkdeI8k7bllZ5G7UGGgJkJ7t87b3FF+Zq4LeNFpP5hH+VbrueA426wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EGqMzqZU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EGqMzqZU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso11299365e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545627; x=1726150427; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3kylnJVXfNp6rw3d/1irQrhp19zNyQdKhcZsUU9cnk=;
        b=EGqMzqZUsasHodPMkX4BzEbbmDXsAQeCcHdmuw4ZdVzu8wSRi209QlcJ+eWiXkUKnv
         NUe5rO6Gs/bJKZZQrcJYFr8r31+xhsg+EIkxX+Vtr7YDaUWJajcR/WubWkwgDIMJk02c
         q7LHOkTp2sda63GMzlbXLU2l5Ob4QjeCeLImTVO4tFH8yQK/UWIg9f1/KswS7O1nhM65
         ewBvdOT6Xs8R51BNuaHZNIxN74H9QTSyC1AYaYvv5Rp91T9szYRV39wRk/fs0pDFYYEo
         FAfSarO7/7na82RKO5T48T4W5QpFX668Oywa48OIPEO/9JixAO4aZRxTdk+OY4fY8295
         yquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545627; x=1726150427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3kylnJVXfNp6rw3d/1irQrhp19zNyQdKhcZsUU9cnk=;
        b=KzZ1NCPW3d9/Q394b6R7XLxeOKkiPEiY0rAO9xcbIyRg2zqs6wzV6SyWrlTEV6SwEk
         rNahAD6mtNcj9gQ9aUE7V62nNNdWTyHMy+mGy9hnIJKuS4katmAc6dzNPx6FFGcmDc3p
         1f8c1yOREfCo8crop6XX4LvPZm4/tp8XXoeEDrwu6lESnKOsOB4kURsXqWpwtVaKlEiC
         Fharp5f9pGP5Tvxc6EatvCqWY2Fh+hDeJ9HPFfNvy+Y6dzrbZbX0yB+SWTJb8MKQ8Rt+
         AhHf8R642FxSspDDtq6RKqoqqQNlAGRnt+sdnkKt06RzaVBDRyLHDMcr58uHaRLHqzM3
         hO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE6NX+fnIdMXrXv14wnNCL39FI48Dxh2dmC9hgJCKfh3p51PyckdOWkeaYHaokVLNQe/RMqWpOSCBpfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHKmEKknFbxtN8rUSBSp3dcn84im2v2Iv0pmIoUWNs7lJtCxnA
	9NfGoySQCMULzDZ0fdKNv1MTdoZpH7CJSU9QgMgxpyu+J4mNekHOLaLTBuAFw/A=
X-Google-Smtp-Source: AGHT+IFM7C/kDhVKsqo8gQ6poeqRmyyUiqotKRoAB2OwlkxpEQHF6JubaidKOiZBM8wLmGV88wvgwA==
X-Received: by 2002:adf:f745:0:b0:374:bd00:d1e with SMTP id ffacd0b85a97d-377998aafbcmr3833233f8f.3.1725545626528;
        Thu, 05 Sep 2024 07:13:46 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:04 +0200
Subject: [PATCH 13/13] ASoC: spdif: extend supported rates to 768kHz
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-13-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=HGKKWuwE3+8ouI0WFbu/VAtPy+LRBtX+ATMaNod25ho=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byIdu+85ezuHy93WyoVP+yWVeGiEH5uiklbm
 ulYpPtqetGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8iAAKCRDm/A8cN/La
 hSFOD/9TXxTKB/AmL9i5/scP75UlZWF2gxl0FZzdSxtB9odmLY4QtohIVqBLWKF/m10g5rOpk+x
 eUR9f+9WMuTP6Ya1RfwSxUydN9Vc/CGtInW+6uPNAQq9ucANTIRbu/ZwEjpoyraXshUAXjaq6ky
 i0TlxG4s7qKuY/0ZLoQLKSylnqxgUEqxPMGe/ys5q6eqbJAF8Z5wmgu0efKW+a2HPZsFkATOaUA
 HNR5J4aoEDZ+YlNh79i9yFG5Cfv0BuZp2s7wKrE6/xbN5pe7STe2mPjnaLtLzjJunezCPpgOR5g
 zFXVHXXxuS518z0uYjIp1Lu8LsE+Hok0Yy+1hMNvd+jctg0iQWNxZ9Y8YflraJ8/HnSpZPeQJgr
 ajQDDm9amsoB6wGM7YpsQiE7GTN+cA0QMRlp30521hVu/6yeCEDqZyW+8qkdtDIt1EJb3JhMsx4
 VzLTkeMEdHtWZ2GXKlfNvNaWYnksLfi6q2C7T08h05VzXkohE8jSmP9WHeoPMFtMG8rnjXN9Rrx
 6mwyHNApsEomVX5gx0JcJxBDpXKKW5Ny6b6KTDXQus4C+j+lF1E3NndGyGbZX2uDtBDEERybCRF
 4Rpja3xmwdlmvg31mLCavX9pnnV9xJGyiSS0z6e4s/b2yBf/m7IIBNzHuKZY6LpRt186CTo7+ze
 OH0S7WtKYhGB5nQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

IEC958-3 defines sampling rate up to 768 kHz.
Such rates maybe used with high bandwidth IEC958 links, such as eARC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/spdif_receiver.c    | 3 ++-
 sound/soc/codecs/spdif_transmitter.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/spdif_receiver.c b/sound/soc/codecs/spdif_receiver.c
index 862e0b654a1c..310123d2bb5f 100644
--- a/sound/soc/codecs/spdif_receiver.c
+++ b/sound/soc/codecs/spdif_receiver.c
@@ -28,7 +28,8 @@ static const struct snd_soc_dapm_route dir_routes[] = {
 	{ "Capture", NULL, "spdif-in" },
 };
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_RATES	(SNDRV_PCM_RATE_8000_768000 | \
+			 SNDRV_PCM_RATE_128000)
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE  | \
diff --git a/sound/soc/codecs/spdif_transmitter.c b/sound/soc/codecs/spdif_transmitter.c
index 736518921555..db51a46e689d 100644
--- a/sound/soc/codecs/spdif_transmitter.c
+++ b/sound/soc/codecs/spdif_transmitter.c
@@ -21,7 +21,8 @@
 
 #define DRV_NAME "spdif-dit"
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_RATES	(SNDRV_PCM_RATE_8000_768000 | \
+			 SNDRV_PCM_RATE_128000)
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE  | \

-- 
2.45.2

