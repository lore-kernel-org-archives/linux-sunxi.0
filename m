Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF711A254F
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 16:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344167; cv=none; b=DH59TP+mA4ozqnxkFVgI7hLbnJzYBx63GKOe6LQwMO8nJNt4oxNST6MhrgV8UeMvXOpvPib+lIqlVkoo7ORErfNMREjJ32lfcyaz3Y3lntnCVMhxU+hIwX+CHK9BSzLw7VrSqYm4ut+KDqP0FArP4yk9VG/28dAw1+YuNK7cDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344167; c=relaxed/simple;
	bh=GO5aSQ4UwyOlMXLzUsIbxvE6Gor/9I12CLAiYV7yBd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+p4CHDByevTz6nSlOQZHNhRX6Go0KyuExgsJCwP5R5w/sjvFv/+gZq/+3VTW2MOgv6D4aqr8mvBMccW6Acj2qpn9oGu+jrz/JFH3rcrEOCdNq0Aikp5DwX2Ry0K1CyhKKgarr2VozDHdHMjxhsqB5uNxkb9xSykKxaw/bRpL6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOKs7YqU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOKs7YqU"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so5270501e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 08:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731344164; x=1731948964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+Q3XwignOREPSIds84RjtpG+Fky7bPoezx4NsmrbSc=;
        b=DOKs7YqUhGYsRJEa/sge45L7PR5R1YPpO8pRpo97r+oocVse0fJw6OqhkXuYihVrac
         +yTwm0Y7C5NYQFldB8aYlBlZ8yWb2e4D9yNk55nAjjj2WD/E76lSBBVJvqCHyngaXMxp
         pptBcO7yrid+sJY7qW4NkDwpUPQ2d1lQtIdYF9VTjJAbvrxemllLKetxuHK3FLiV/auJ
         gAiegbJ185SUmpTpbQ1HtlcNCU5F6XZI454CPN4bb0vTkDuytsBBU+ZvWkht9y2PQwYn
         hElnbR9pLVBWgfF2ZwpdxtjYu4lxLP3mjgjyUgrIDLLzHoFyaszMhG+CntMDfCmJln4+
         BgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731344164; x=1731948964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+Q3XwignOREPSIds84RjtpG+Fky7bPoezx4NsmrbSc=;
        b=NOcvHo/j4CSz06OS4n99TgDkqiggmw6PflUigBTVGPAIfrBWNWmlLrR5m3T2+wB87j
         Lj6Mhf5PTm4ng7HyfdbBnFJ/ac3aUbB2cU5XzqMiAEzTY1kwdozEV0UihIEN1zgUGPen
         CKAe53Wq36MgKgEXYyxcsoPRCB8XlpaBs2Yvb0zJ2HRlbQPRFDrj73R0bUk2bGMpcHXp
         X3H0QqYpAltKxgHg4ix9PL8DXglSLdNC663xRqVVUsbcryxbv4yrioaLtkD4ebzQXvHE
         Aqfvfnp3DBWA80QoraXFdRuloSdzb83tpYIBskDT3NOLicUvnwQbYYPksTTJxvEfurbX
         QOTw==
X-Forwarded-Encrypted: i=1; AJvYcCXEDK3J2p6zDItlOsIt8ewB/t2V9uV1p+SbaR+xTNBbtmO1uhgKrkwtub3Y8PunZmpQu8OYDgouy0j4RQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZVoz37mHVF6nd2QnJcS/Y7qJHuNaQhNOMg3fjDHRawgX9Ana7
	mYxviqE3c7lhogjodbZyrnIVso25TreU8rfRPZrCvqme2RgpmZf3W8vjecXe
X-Google-Smtp-Source: AGHT+IGTVIBZ001X2A47u65/h7kXIx7wTYYbJhZz0Pv22iqQ4Lq7f4suNjhPPU3TWq1X0o6RVDNa6A==
X-Received: by 2002:a05:6512:158e:b0:53b:1fea:ba96 with SMTP id 2adb3069b0e04-53d862eb0fdmr6231906e87.50.1731344163728;
        Mon, 11 Nov 2024 08:56:03 -0800 (PST)
Received: from localhost.localdomain (c90-142-33-119.bredband.tele2.se. [90.142.33.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a7387sm1624737e87.140.2024.11.11.08.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:56:03 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: sun4i-spdif: Add clock multiplier settings
Date: Mon, 11 Nov 2024 17:55:29 +0100
Message-ID: <20241111165600.57219-2-codekipper@gmail.com>
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

From: George Lander <lander@jagmn.com>

There have been intermittent issues with the SPDIF output on H3
and H2+ devices which has been fixed by setting the s_clk to 4
times the audio pll.
Add a quirk for the clock multiplier as not every supported SoC
requires it. Without the multiplier, the audio at normal sampling
rates was distorted and did not play at higher sampling rates.

Fixes: 1bd92af877ab ("ASoC: sun4i-spdif: Add support for the H3 SoC")
Signed-off-by: George Lander <lander@jagmn.com>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 0aa4164232464..7cf623cbe9ed4 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -176,6 +176,7 @@ struct sun4i_spdif_quirks {
 	unsigned int reg_dac_txdata;
 	bool has_reset;
 	unsigned int val_fctl_ftx;
+	unsigned int mclk_multiplier;
 };
 
 struct sun4i_spdif_dev {
@@ -313,6 +314,7 @@ static int sun4i_spdif_hw_params(struct snd_pcm_substream *substream,
 	default:
 		return -EINVAL;
 	}
+	mclk *= host->quirks->mclk_multiplier;
 
 	ret = clk_set_rate(host->spdif_clk, mclk);
 	if (ret < 0) {
@@ -347,6 +349,7 @@ static int sun4i_spdif_hw_params(struct snd_pcm_substream *substream,
 	default:
 		return -EINVAL;
 	}
+	mclk_div *= host->quirks->mclk_multiplier;
 
 	reg_val = 0;
 	reg_val |= SUN4I_SPDIF_TXCFG_ASS;
@@ -540,24 +543,28 @@ static struct snd_soc_dai_driver sun4i_spdif_dai = {
 static const struct sun4i_spdif_quirks sun4i_a10_spdif_quirks = {
 	.reg_dac_txdata	= SUN4I_SPDIF_TXFIFO,
 	.val_fctl_ftx   = SUN4I_SPDIF_FCTL_FTX,
+	.mclk_multiplier = 1,
 };
 
 static const struct sun4i_spdif_quirks sun6i_a31_spdif_quirks = {
 	.reg_dac_txdata	= SUN4I_SPDIF_TXFIFO,
 	.val_fctl_ftx   = SUN4I_SPDIF_FCTL_FTX,
 	.has_reset	= true,
+	.mclk_multiplier = 1,
 };
 
 static const struct sun4i_spdif_quirks sun8i_h3_spdif_quirks = {
 	.reg_dac_txdata	= SUN8I_SPDIF_TXFIFO,
 	.val_fctl_ftx   = SUN4I_SPDIF_FCTL_FTX,
 	.has_reset	= true,
+	.mclk_multiplier = 4,
 };
 
 static const struct sun4i_spdif_quirks sun50i_h6_spdif_quirks = {
 	.reg_dac_txdata = SUN8I_SPDIF_TXFIFO,
 	.val_fctl_ftx   = SUN50I_H6_SPDIF_FCTL_FTX,
 	.has_reset      = true,
+	.mclk_multiplier = 1,
 };
 
 static const struct of_device_id sun4i_spdif_of_match[] = {
-- 
2.47.0

