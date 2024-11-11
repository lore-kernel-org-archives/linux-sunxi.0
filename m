Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDE1A3031
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344168; cv=none; b=NNcY1r8YZ9SImyQWrtfY0TSsJ9KC0st1POA+tct1xpP5XKlzrj12XKt8UUB+ZoPV3rNaXJjh1vIHanFlA2d8A52T1OWBe2SXkSlFQPSawl+u+x1ZsC10iOSDkNiCTQ4YjOfRkSciC3i3JDzghg5oR0HKuwkkzwL71WXgmsjmMMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344168; c=relaxed/simple;
	bh=BHuuImuZ9TK/Z6I6vu+VYwqEVvV0g6bfeFmkl8Tc8aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rsgb4qDagB8H2HaOX+Mv37akMxaaf6U+wp2+lC/HEx0H79kXk1OqOnp8NZPklAFdpU0jhL1JtUxBF4gOftgMgN7msJhTI85We2VmvvHaEy1L65DLdBjR4v5Y5CCyFtB/V9DlR4F2dfQDbyio97H2TD2WTKW/Itga86hZd7Y6jBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WX2GiEUN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WX2GiEUN"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e7e73740so4399109e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 08:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731344165; x=1731948965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq2vv+vlrS+liCK+o2xaokofGSYSa1PC7UgkAUeyMv0=;
        b=WX2GiEUN9YyBOLwVGXdlJ2DIBYJ6kJqPqyNT2r5izvQlsJY5OOQnO1OEwndkrRYOd1
         5k+eSTLYuHUmPrK5L26XTkG48Io8JJIp2rg++nJ+dxQCv5S1bWiqOu17eB4p2KEb2hJd
         MDs9w5frjrkt2CoONQymolMrzVHFICl3remgdbZb2x96zi9WJribDdj3bOAX1DdcGPrv
         az4L1jjB8FmCg00LqNHTV7T06qUQiunMITtP7Rw+i7r6Rl9elnDOWQvD/f9QGK4/bEv7
         3844Zt7bWXUcnvE+kNjQLBWHkqraeh/395yebvCWGZRPLuphr1Q5DmElf0QlsIdwiHlb
         5/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731344165; x=1731948965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cq2vv+vlrS+liCK+o2xaokofGSYSa1PC7UgkAUeyMv0=;
        b=bcy5pqwRyK6h0ZSzUX0MMGNN3QnqIb5AWErn9QM7mtiN3Qc7dOWoMZVHiylJi60H9r
         fWTYDBKbOtHjJis1d0PrDXXMu4hKuBD4D/Ta4gMV5L5zxnVpWsF3MPRgOrxp80F3kkGo
         r6Q7R7rKSQ8/3a7Gyff1CoQJB8dtBbhELEpKyRuUrmVqNXm7faQXUl2jlQRTjVENHpFX
         tTs/7g3or7pDJvBfoDEG4ZFPfkUv9uNP01c6l0VtTv/Qqi+xIAzE6AwnfWvfnjTREn1l
         eSt91JT2/id4jvz+bwLs1WlstYOD3O2G+JGQ9cHhcy//cNAGhnG2KjzaBOw4rCHHSeBA
         Rn0w==
X-Forwarded-Encrypted: i=1; AJvYcCWUKkTMLpED/hVGp/rDP2XOAIX/YjvGm9KtJnZGbTf10eBqJBjH+16a6ghwmZtyEaj7GSihxNuhohMHOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr114EYap20K/sHzzbxQcN/X4CIBSHFXu6E+8Th+k3YA8Krpzk
	lCRhFH0aZ0fcgCKqtSVCboBSiOcDJn63h10gvfxgtMDJ0PrAG18x
X-Google-Smtp-Source: AGHT+IGVrnZ4G5gv1axm1AEb+TVo9siTiIXy9Fiw2dPk9skT6S15TI18REvnsc1gh1yGg2BeuWdGgA==
X-Received: by 2002:a05:6512:3ca2:b0:53c:74dc:2252 with SMTP id 2adb3069b0e04-53d862793b6mr5909400e87.49.1731344165064;
        Mon, 11 Nov 2024 08:56:05 -0800 (PST)
Received: from localhost.localdomain (c90-142-33-119.bredband.tele2.se. [90.142.33.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a7387sm1624737e87.140.2024.11.11.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:56:04 -0800 (PST)
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
Subject: [PATCH 2/3] ASoC: sun4i-spdif: Always set the valid data to be the MSB
Date: Mon, 11 Nov 2024 17:55:30 +0100
Message-ID: <20241111165600.57219-3-codekipper@gmail.com>
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

This doesn't affect 16bit formats and allows us to properly run
24bit formats.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 7cf623cbe9ed4..5a9407aaa1a19 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -202,6 +202,10 @@ static void sun4i_spdif_configure(struct sun4i_spdif_dev *host)
 	regmap_update_bits(host->regmap, SUN4I_SPDIF_FCTL,
 			   quirks->val_fctl_ftx, quirks->val_fctl_ftx);
 
+	/* Valid data at the MSB of TXFIFO Register */
+	regmap_update_bits(host->regmap, SUN4I_SPDIF_FCTL,
+			   SUN4I_SPDIF_FCTL_TXIM, 0);
+
 	/* clear TX counter */
 	regmap_write(host->regmap, SUN4I_SPDIF_TXCNT, 0);
 }
@@ -323,9 +327,6 @@ static int sun4i_spdif_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	regmap_update_bits(host->regmap, SUN4I_SPDIF_FCTL,
-			   SUN4I_SPDIF_FCTL_TXIM, SUN4I_SPDIF_FCTL_TXIM);
-
 	switch (rate) {
 	case 22050:
 	case 24000:
-- 
2.47.0

