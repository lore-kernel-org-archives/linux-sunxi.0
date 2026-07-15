Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8437E5F5
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109379; cv=none; b=YHrvHt62iDIG11tDxSOTKED0VhMY4bascrWzRCCGa6Dg7UTiIhlqYgIQ5qUm5QppfWqiPTdsacqp2SoR7+hj3ThkhL1n54sV8AkcC4FDGIsTpHBYXVvPgnFpdatkB4uJ6iR6OlDKsbIxSjuKfa53M+w+lHKCCbtQufKhXBMr5Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109379; c=relaxed/simple;
	bh=rWAveW84L3R2k6Dr0kk7jzU9NyiQbaV6M5iGKNhBiKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beun6vS7cqLckoP0dkMF5tEziSmSW7tza/sRzTHbhhuGXDrjCcTSYHMn6JxTFEvmeGc6sOnUsbbe2eG88ppmxcoOEfIQ78wh/sMiPR4/0wuyFo+KE77mNxTpbDcJH6hwlYnOzkXfBCK1flDGvg1awW1lYAeS5/vMdK+E/lejkE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKWpBnR1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKWpBnR1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8487b7b4066so5239851b3a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109378; x=1784714178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oH3dvIiif6Ezut/x+NGlXGEkxyluaoU8qD8m7W6CWsI=;
        b=nKWpBnR1y/Bi8pt0KPRyvqI9rekN+R94+sZ4numij7TZVez9RAutqrjVjMwntb9dkV
         FXuEOIhvR1qUk5UHTunz07gFjgzF+Py+QKaMpx/76X5z6/yWdrWIPHjFTxJvYixYIjgX
         ju4dr9CH7iEWbROQd4VVU78hM2gxsUssvAnMlor04ObYn8wxyjbk/PO9Sl7ZQhKxNBvJ
         YRXkINX+//cD5GfRedNkNCTHSDTVu6Hy0rmI0Nx26cwXZ1SbNnGFMrSTEBT/bf2ofxhd
         7yELgJg6xoUJiO5FNpfmY8RRI7tEhRmF/ONk7eZ5h0d4ArRqg9KkS3Wc8u29y9Pww+Ue
         gqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109378; x=1784714178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oH3dvIiif6Ezut/x+NGlXGEkxyluaoU8qD8m7W6CWsI=;
        b=SEWVN4C/yr721hx8efqco/wVmTpQH2nOowd2iMGAxj0ij0oR1nccN9GU5TmiUV3PMI
         I7heHHbzLqoOrTxuM7lGFD4acEZnCyj+8vYyO4UimnZ+ZRYIc/Uv+jg/83xgsWIue6vD
         GHFM06bedSA+EHUfsdJMLZgj/O0HY2hhDuZ7KX5edeC1u1H4iKjtLDhe90L3cn7I7ANp
         AKXN3ZQpbuTZ4v0jA3hFoNQXlQMlYY8rzwmUWT/xPk88z5f63Y1WxYWiQ28W4bzn7ikW
         yjnju82KUQIRbCy7x2lcMWjNxUbKZiaXCRGoaPm+SG/u2+D5ZJ2JLjvUnpDSB76wF4qX
         Bs8A==
X-Forwarded-Encrypted: i=1; AHgh+RpsZzNoCcy618CW3OLhsN4TVRA3dhV7FPQq3NpcwnJfjWKor9W9Tzkkvg0wCb9TWW6t03Wqt756m7biGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlXsy2bkxAsAidgqQQHQKki0ZSnZnQibIrj6B+C13Ds7CkEROv
	401yK1bRVTBj1usp6Ch8nvsAvxqActPdnnhje6CHVpjKf3BrtMpLolEp
X-Gm-Gg: AfdE7clhrOtTfIk4M7J2YjOM1yk0AYFB7RzDlC9r8oOlIh59+h4ztd0aJ1ntCTSPVWL
	6Ondka7n8mqlFqAct8NSGrg0BxLXjby1NzE1ympedvfr/U0UfrC+Xp73+T1P5nI7qiz5DBnc+Sr
	oCu0TWhqTJliyo7XLO2Mb2DTrGE1x+/lW7uFO9J48Gr0cbT+2awmEuD4hb7ehtq+8tTp5oLU54+
	G7v3Uif/qyot4pfEKVQj3ZvpNUBCzazBACRS8jAMV6j+Esi1iwUG/Cjrm3PgGWbPvIhyxtTkZ10
	otzL60lVP9mZZHWiWVshA2/R07tReAGjW5AnOtQIhytdr8R1w4suhEDUXZ5UhbwTNydV6Zoac8m
	94DqxGEBCYwsAZxzZMaJbZcDEwqN3nsvWDjBZ0AqkrfNUaGzEi3XutbDZAq7XGfHhasdqh28Z0a
	KNQkWm4F/gQStgMnYZDARNLxVzbOSiRdINgO5i1VDbTTgGIjY=
X-Received: by 2002:aa7:8891:0:b0:847:b2e4:9f68 with SMTP id d2e1a72fcca58-84a671da3aamr1648721b3a.9.1784109377872;
        Wed, 15 Jul 2026 02:56:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:17 -0700 (PDT)
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
Subject: [PATCH 5/6] ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
Date: Wed, 15 Jul 2026 16:55:24 +0700
Message-ID: <20260715095525.40668-6-phucduc.bui@gmail.com>
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

Drop the redundant error message after devm_platform_ioremap_resource(),
which already reports failures, and use dev_err_probe() for regmap
initialization errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index 9f5b067a8ccc..50c0dee8c433 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -551,16 +551,13 @@ static int sun50i_codec_analog_probe(struct platform_device *pdev)
 	bool enable;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "Failed to map the registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	regmap = sun8i_adda_pr_regmap_init(&pdev->dev, base);
-	if (IS_ERR(regmap)) {
-		dev_err(&pdev->dev, "Failed to create regmap\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "Failed to create regmap\n");
 
 	enable = device_property_read_bool(&pdev->dev,
 					   "allwinner,internal-bias-resistor");
-- 
2.43.0

