Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5506E1A3BD7
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344170; cv=none; b=r/HYgtUyXV6WbwdS6cD932H8kGp1c3qL8PUKJPVS5BDlS4etg+SZdUdpx0G9c2HAhs4wbmCUwrC9QFoMGibbIO5aE59SxADF7Wn/BzfKU3QVM5+jQjwrnNLrMlBzGJSeMZkkAur6yCAGcXr8L08dccdGlm9G41NPSXjmBEYSt6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344170; c=relaxed/simple;
	bh=3kLzdXkGZ0goZ7AL14qJZ24tx/PDfvKjSoul4AfIyWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIJ8jH14WlNYFA2265EO6TNIoKuy3RrZuI2phH+26n3zvPFwvY8VSfwJDyIHsrHP0X3H8LuWbVA7z0YsrbUdtTc8EhWNIoVZDtFRVg6VJsNFifDcGb673eSVbn7iEjehnIu9y0b/dNC97wYt/7wUd4tWvuinOBcrXUQQnub64KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbUPpqrt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbUPpqrt"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53a007743e7so5628791e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 08:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731344166; x=1731948966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGIyKdlKD2rjdr8nGTfStLxE86UsO3KrqZkzx50EpGg=;
        b=GbUPpqrt2DEowxUS+T9Z1jmAHnyvFI2fjmEgkFSVuRDqF8E2DNJUHBoFAUWhi91XDs
         dCw3QbGNExVIIkrQqMWai9o3M2rng9e1P8D8CQgI50MySf+7SedzE/RWyP4RmJynZqXE
         VoJpXg4hB32r5pozi/toEQ3T/Fdyf8xMAgtyXcaR4rnab0eBkdVHPpUk2547gM5ieGLZ
         44QevL6IqFCYOAqe5njyn/UayulUeIy//Q0JJY2iOsrdFop9rts06Fw1J3aGnfObpMJ3
         Bn0FYAualDqyjbnMwMGIhe60kuk1NF1TPJwpp6w2vtEaRuFzuPti2nQGMbW8Gexxfut1
         T/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731344166; x=1731948966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGIyKdlKD2rjdr8nGTfStLxE86UsO3KrqZkzx50EpGg=;
        b=xBBi4v/hfqEW/MuKcCwA/KrhDjmof/mEe+7CW4xpYpuizOle4pFWoc/uTDQV8x9VCf
         4GO+cAPCkzV8Fc5WG33oiC8R40odoR4Xdtin4VBc9UiPNY9hT3lAffld12mllFXxdrjO
         VQHHoL6+4cqrkft1tnOF6/doKPMYdg8aFmsXu8fXNvt2w76Cuun2kfNexH661xWWkrQz
         hk/RrABJqbM2G32gLiaEloWEcBL3bU0fYSfpx5Z1KCtK+mFuxPTt/KPDUREkuvdzuD0J
         gAfQheYkwIscN1b9Chs+n32r/RxL9oHR2keg9CPsyBTW4qY58pH/8TSR/1RAPs6Cy7ea
         IwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP5NoumVkhV/rgK8kDLgLuyySCiw/+q2pj6HJJcTxE235gaKqzehB7GLjy1T+UmGCCh2tXMDayjWXHAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx45w/NtnOWIf86SFK1Y8arpIbrJu4YHJyaCVS7c1MObzGZ0ZfO
	/vOXlrX36ye4bsLTRWMZj3lzLSTamH3i9qQ0YqIbj6DVMw7FhpYLH+IkR5Bp
X-Google-Smtp-Source: AGHT+IFnmYnGoXcuYt3AhU6Y+aYhmeuhcBjoUc/SyewEzKh1ml1lrjiD9FwIjoozeWWRRSk/eMeAlQ==
X-Received: by 2002:a05:6512:6d1:b0:539:e873:6d7 with SMTP id 2adb3069b0e04-53d86228c57mr5864656e87.1.1731344166311;
        Mon, 11 Nov 2024 08:56:06 -0800 (PST)
Received: from localhost.localdomain (c90-142-33-119.bredband.tele2.se. [90.142.33.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a7387sm1624737e87.140.2024.11.11.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:56:05 -0800 (PST)
From: codekipper@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	lander@jagmn.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	wens@csie.org,
	u.kleine-koenig@baylibre.com,
	Marcus Cooper <codekipper@gmail.com>
Subject: [PATCH 3/3] ASoC: sun4i-spdif: Add working 24bit audio support
Date: Mon, 11 Nov 2024 17:55:31 +0100
Message-ID: <20241111165600.57219-4-codekipper@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111165600.57219-1-codekipper@gmail.com>
References: <20241111165600.57219-1-codekipper@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marcus Cooper <codekipper@gmail.com>

24 bit audio file can be detected by the alsa driver as S32_LE.
Add this format to what is supported and change the DMA address
width.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 5a9407aaa1a19..41caf1795d09b 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -287,14 +287,17 @@ static int sun4i_spdif_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	host->dma_params_tx.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		fmt |= SUN4I_SPDIF_TXCFG_FMT16BIT;
+		host->dma_params_tx.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
 	case SNDRV_PCM_FORMAT_S20_3LE:
 		fmt |= SUN4I_SPDIF_TXCFG_FMT20BIT;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_S32_LE:
 		fmt |= SUN4I_SPDIF_TXCFG_FMT24BIT;
 		break;
 	default:
@@ -526,9 +529,10 @@ static const struct regmap_config sun4i_spdif_regmap_config = {
 
 #define SUN4I_RATES	SNDRV_PCM_RATE_8000_192000
 
-#define SUN4I_FORMATS	(SNDRV_PCM_FORMAT_S16_LE | \
-				SNDRV_PCM_FORMAT_S20_3LE | \
-				SNDRV_PCM_FORMAT_S24_LE)
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+				SNDRV_PCM_FMTBIT_S20_3LE | \
+				SNDRV_PCM_FMTBIT_S24_LE | \
+				SNDRV_PCM_FMTBIT_S32_LE)
 
 static struct snd_soc_dai_driver sun4i_spdif_dai = {
 	.playback = {
-- 
2.47.0

