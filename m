Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63E553A3BF
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194993; cv=none; b=qDJeNB7FuLtCwFjJZM17/KAXrjhTLkfQlFkMLSENaggRDBSVetg170r7XY4NNLwNE/9H6ZHo8y+7onRFb37gr9rM8VRMn2NdbPkRQkCR9BNQc6ttGhnyIq74k2eJYcsf7vQEBpb3+GenAmRJaA+lTmv3h4zXokWyZhYNcIZN2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194993; c=relaxed/simple;
	bh=iGxLkAPjn7iwM0RTaaX+V0ufn+VTyGjgMAZb+r2eUQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwNqch83DW70Ngt8D5kFkVIFMwcGMS4a2qHi3Szwmwzj5eZ32hHWaHEL4b+ykmTspPRXtSfxrVlwCdJwSbLh6zG8LfvtYztpo8iLCJo7WvVWEn24N9glN219ClmjCv+cKbVXUuyYNoCFUfBf5GQoUaPrr80twEd9VAwBDfKvbe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVdaHYwk; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVdaHYwk"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso237996566b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194985; x=1790799785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=sVdaHYwknyggzAKv5A+z+oMbwBwb6dBBTCWo6cOzbV5yx8JMgE+54o+R+wmWM2LCmp
         O8y06rqErjIhEmhKBz+1/N+znBP/nqM1lkjjUm7K7d82+6pjmHYWtRroWw2e7zDIVZeO
         cHyK7cBYYxGMfObZ65BuubozGteQLb7OH8qvbe5AEwjAcrE/VwEV3qHhaCpSrbFeTTvH
         vNaS9KJKxzdK3gpBIUbu2uVIaQ4qz8jIR+O0PT+v0yShJGzUTp5BsCgSamfKUa4R3SN5
         v4uckA4T+v41O1ecleRp2+WJCsq6qLmj9xAlyaPGdfvMRlr0903wGkunqjmVewOfXQA8
         N8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194985; x=1790799785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=FE7k0QK1obpAFuxGQqY2Sdg7wmr0AMGEuVbGN5khGtnh3l6fE8cx4OIz06bHkIwF2X
         f+PUjEmWsU1qEyMeXn69YUj/VSLOd2lWWpIxtvO0dq3NAewxhS9nhxcQvtvI33QydtNF
         uG+DTCN1yB+VzeRFvVNFOpxnBIREpuQuVX3FuU0k80luIfVje106IW/hrm9SBtVrI/2n
         uIeBFBQ8zCNePPx4lvQqVJhxvcBYYfWDzGfbv+ggNMs0BfmHbUOcnXUCTn4qJeV3zElP
         0QANkDVzjzmzfbT+dW2Ajm37yK6gzbSAgTAHHJAFAf7FtxHbM7oZj5hn9olUFsT54C5I
         27Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwpuh9psLFVh2aIHypxwlxNcM+n9Qk1NFBigw5Zh5qAt+KYsCa/4hjuC1oh+W+AYHC/Ky+wdgNQyH88Zw==@lists.linux.dev
X-Gm-Message-State: AFuF++l0KlPN2/+JGu302+LHjYOvjz28LHKEsaFahcK/qeVlBH8JeVyG
	v2Gh6y4bjz7TdW8ajRUHLPHpU5YgWenJ+qbUQVYpXop7mKbYmLdzORPz
X-Gm-Gg: AYBFou0hwjN0UefOThN0K0xbOPDNjLmfyOuWkgw7fJ0HUdeFglVbxxAV136+vgD7FI+
	LeoRMqG10fadXN2TieXYDc/gq+91VnDHzwFUCq0qtvGBVs/eE8limd+WBxHdYea+RymJ8l0WVFx
	K3cK//qu1q24hOi1WQbs5RSnw9xDpfG3bq5FhnGtRU9oIjgBeeS7wxUwQhmFvESGL6TI9WvpiJt
	T0Dd/jQ4e521etcsfPmlLjLnKfrsVFsyof64kYyLYcZXssqtS2dTvqS6MlbJeuT5xvlkBRhT4LR
	dqfEHQYkGS9P70jaluL+ruqpJ5cz6lsLrIOYaGI0Zmc35mskN9A8taNNrICqaS7dkLKkZtR7Ttj
	qLboqpScTu9TQLmjCiT/b9Fj1W6thoo482s5n/xv8dgA9hFyxEiQdQ8nRAB/SwiteR09x8oNYQS
	3VSOr5d10pbaW/yA1A37fNJ3RYenO6F+ZLGwpWlR4kIssmhrWPpsMJhYDlRvhmegpgxheoR9wR5
	F5c3lo9A8J7orS5mZM/Bp2/Ga8P2iZwk++O1XBSuOw=
X-Received: by 2002:a17:907:3c8f:b0:c29:f5d5:5a92 with SMTP id a640c23a62f3a-c2ac23ec44fmr24127066b.28.1790194984695;
        Wed, 23 Sep 2026 13:23:04 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:04 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Wed, 23 Sep 2026 21:16:56 +0100
Message-ID: <20260923201701.43391-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only uses one alarm interrupt, so no functional change.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..cd6ac5bb20cd 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -859,6 +859,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.53.0

