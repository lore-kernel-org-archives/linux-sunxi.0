Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640013C945A
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109362; cv=none; b=X3TKw0E465TqNjJiH/RLgULasnw/MQZgSps7Ps3B7Lahf92bM+sZxCBpXZukQsDhgenDpWvUjdrXg8gJZJZ+TSLPRwHLvBrdPAgQQQlmUhKP7oXaXD51o402bsVYUc6CXf9ulSEgQo1vB0KxVhY1aeVEnswrrlglQr7KEutNQsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109362; c=relaxed/simple;
	bh=JYpMe5xJN7tUQUFpfvpPUyELSznoJMPf/vIdMkvzM/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Stlrr2g2/EaGpnvtZTbj6mve5fggVLxSg6rwwZ0B6T7soz47/wLw79yLz7L39idqwB0mS0r5XAsi0z36d5x1NGjrrBCEeWjgy3+V5V46L53qDOBc6BYFWhcEkmhe1t2+neYjeFs5cQNaLklKKK4RBbGl1v0b/u2GewUVKx2p1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GV1VmPgP; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GV1VmPgP"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1231251a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109361; x=1784714161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZY26nfH61F/ozoLH7Gi9fNecnPmd2NgxbQtVT0E040=;
        b=GV1VmPgPJf4TsZyp+LnVkTpeFt9eIYpTXSLDyjy/KpJkoBqL4pJLMcLUMiKjIOOa1M
         j9E+mnyZQ4Pzyee+e8Dx001JLIOy3LkyPmSzYn5FvQKB7UkqS6408yEslXAZxWRWra9W
         aN6up/lL3qDMoPM+rtqvjjVUQGJxDnwPbkWdZZzBwoL/LyfDozTez6CTXmqvlfeAXTTz
         qBD2N7Cmm3dk3eWSiSF+X0Il0z/ca3x9wOHIKi/5LVjZB+BAQ4v4bC+c5czdOG7m2YsN
         80OYNEEmEaIXpEHqQn6cfoNV42CJrE2QzfSfGVlux8PoDGkmcwhPuUsOZNCOvUZGPsbs
         Oy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109361; x=1784714161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZY26nfH61F/ozoLH7Gi9fNecnPmd2NgxbQtVT0E040=;
        b=cZw/MXsn2XSl8l+6WHjqB7Qse5L4h77TPpBG1HysSFBnocnLCN9SsNYVQyIctgW45H
         8t4t7ap6cND3POCe7s26/h7EO7idMHzux6vgdX8ayFMymj0TRYCzmK2a2oPv9G0Dc3HN
         3nBesD8Zr5vl4oyilrFpbX137v+tVW1UNAswFHoIZR7W4zkh5al3brhl6nHM36ymlW/L
         nogwe3DCie0K3zC1Z+jBGNfesj58ZqkWeAXNeZXb2q2zuVAJ9EtGqi5iJVLgG3UnYyWU
         dZIA0VXa71EwGmTW4cZucXslv3ftkVOv5n4M/O0Dbw1H2fmI3IQNFK2edaFInbKx/E6L
         7LEg==
X-Forwarded-Encrypted: i=1; AHgh+Rq398kWtmjtZS7+ggoxWyypQuKiZyelH4ZYZwzYIVVVtO4PZMfWCKdEWZ0NdtcY/YjYQj48UQG7ZuKp7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjkCPVV//X/UZQKEiRp1a20gSAlYxhMnjXaKis//jyUfWpUSij
	8edfoLQre8PhUIKgjg/Q6b/0Aos10oMVegm7vjk4wvuI6q+kD6U3Hhik
X-Gm-Gg: AfdE7cnrO013fOFTbZsQtC1Y4xTxyjlgmu54No9QyswrCCu1QLBnN+zJ8hi/zONSVuB
	H5Ft6XtcUt5GEKLBgHmi2cfRkLtlXJdzLwioDg4tAK8AdP6wGa1lKQwLqcpp97PN/7O1IwnxITX
	CA3oAgEF9t+i37NQRJqMYrH+gHTb+KW42hbnwiKUH0mmTrsUotqZsO7sVXx+SifYyuIk5ux9H2C
	SsIscj5CmwkbENhGCwgG+MKRS2y5k8HV22Xj2bkwvvC6Ukk8HXv83rGAzeJEg0kqHi+m8Ilavw0
	qKug6u7ecySCaVQedeafbkxzP7E3ov035jLJHJwxoRz06ejpC4FkQDpYOH/N3YiYx04UjiQQoJc
	7FrFNTdS4E9H7EUJyKfNpiQgjasCR3l5B8qFIFHyRz56FnRzmxORSE+iR9NtF1nUbsFpp+sDF6k
	n5qdp6mMlXZriU13FAedUMNxIw2+5kX27/FXKDYiRP9s8aF0g=
X-Received: by 2002:a05:6a21:510:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3c110b6e0a7mr18474760637.51.1784109360730;
        Wed, 15 Jul 2026 02:56:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
Date: Wed, 15 Jul 2026 16:55:21 +0700
Message-ID: <20260715095525.40668-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 05308df3ae5b..71f7a1fedd88 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2380,31 +2380,22 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, quirks->codec,
 				     &sun4i_codec_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our codec\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &sun4i_codec_component,
 					      &dummy_cpu_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our DAI\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
+	if (ret)
 		return ret;
-	}
 
 	card = quirks->create_card(&pdev->dev);
-	if (IS_ERR(card)) {
-		ret = PTR_ERR(card);
-		dev_err(&pdev->dev, "Failed to create our card\n");
-		return ret;
-	}
+	if (IS_ERR(card))
+		return PTR_ERR(card);
 
 	snd_soc_card_set_drvdata(card, scodec);
 
-- 
2.43.0

