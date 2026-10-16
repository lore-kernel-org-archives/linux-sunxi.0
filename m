Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79AC184524
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142234; cv=none; b=vBmRRBAnYWNl/PL46vCXcQclfESSxRYrGZD97YRPWMtqqWMtbbfNie8gzUQqs6WaJ8lasB6yT9ECxdCKf4Py4gPn2Xt1/mfMjrIcXB25PqSHj6FWaPJhV0j6Uz5B5MGtFCKXNeRCI15E387LY0drl6R3TR6284kf8QiVz+uhqZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142234; c=relaxed/simple;
	bh=+6TtcnCTO+XvBvfCidFOfh1O+qsEys/gnJMHweNBLnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoYme6C5pnssHsa/VgGEiHrJ+oHiUXyQHaXeZCH4UoP3Ck5kqplR632shKbtn43Ecsy+vbAHFB7+8RvLfid/7GUOsX5mP4kGW1zxyeZHKttTEkNZjLWru+6M2J4wbDlwIyQAV5SmRJBDBf1K/zwb29UcygOSrSwy90ma/kI46F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXGoGE6E; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXGoGE6E"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e00eee27dso185952f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142232; x=1792747032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zmh19PAh9XHCeEhweAblzWeTz7pt9GV2b3FO8ktJOY=;
        b=dXGoGE6EO3rg+rZEMG+nxZoNfFa6d/K0rU639nnHZjQ8tNoBvzlnYnXyJQecpZYlVe
         rSLLdy7TuXjXgp2b2pN1tS430u1eYmg2N6RSSb/sMLlLgbnOV3gofw7lM28qnk1Fdn3G
         /5z42DILbo/tzrVyolA3OyS5bhykDo4LPEItqmVZeY9kboYSI2x1cigfWfCTJF4Gav0C
         s+6b5dA6tWqPdPXt5W5qdmJNSsXOCDdUEv4AtDGb+zH4eGkzx1ZEcvP15TO6LqhJZmGZ
         5VdNNeJI2zY1PLWOLl4auu8v+8umm/6NMlOGdZY0JEbFS8Gn5BpAOIsp+jGo7qJVJkmD
         RX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142232; x=1792747032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zmh19PAh9XHCeEhweAblzWeTz7pt9GV2b3FO8ktJOY=;
        b=SFQZ+8xYWfnYGKpy8pUbjWRHbGDyV/JuExKAuip3qLIYKFP69UKKqXdWB1t8gw58C7
         1K/8NZgkrMJOzOCR7vSDaire+1jmP1PRtT6+bGIkFZ1rSQ0AdRF7P0JlG0YoTBmxW6Wk
         FFDmHZ5JDj0GPvxv1PsxpmdbQ246kvRE6F2Q0/EQO9nGRRfCdAo5eYaoWSPAbxw7ew9/
         rfMxRoOnj5kx9w8Myi6fBQpSzkQ7qkaLwB7iEbFh7+Q4HqdFNz30+hd0j0hKmnRRCjsp
         /BbMairpVuR9qpgYv54UyXd2DY2Q5d3zOMQdvz3ppTAS40TxAMfa+p3hymn07/FQQf3b
         jk6Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3laNWodTAdHo8SH5vpbiST5zLcgnRwuHUxRh4RukyIbhIkY/QGMGIBPw0mpTP0MnUDj9giDhNKXgZEA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLe8H8r1P+m9iH4x/5Fiu431Be68A2h7jGPlr/n4guiXm7/9POz
	5cAvTM6Q66sTmZMu/N/8hjhMdKYH6ZfQBwqsOzCkQMDWGUnwzA2UA6dh
X-Gm-Gg: AYBFou3lGQegHH0bithPi5tUwEeFP7nZaSWqEWITH/wXHaXbQSbDbJqdasKbQDIjhdF
	J0qB7QwKPc7Uf6WUl/G52J1l72ItST5GjWmCAiXz+vU0Y4HgMnXxD3c/OrV15qFJlxC1x524pL5
	2Jz7D0LAl/IxVnrJg8P9NNYRIjGnGji1vXhEg4h0qZSxSTZDIfwWyyUB13zVMr5tSTwJXSa0MoQ
	Lr+lYc4qvhddQ9+E1Kzd7qhFhmeN8HIL/oo6VhycPJI2mZPhx04x2qd7c6WxCQCUDg4BvnEXEtl
	nhaydcgzypZoMtw14ZX0jO12SFL/4/ZoqSEp8sEV8fm2wRWm3hPoYB2TBApIAxwZ0mI6rownVhN
	vWtr/zlBJIcfiLosq28Yp6xCiq61hkKLagTNoZMzquVoSX7UkShHoLG58M3rm6gvm0/nmJGRHeD
	tqQFGIC0Fvp/mCFPR8InHAdTOuaPBF7XQGJkTnhtfl06t4N2qmsGhWhioHb2c=
X-Received: by 2002:a05:6000:4b15:b0:48d:fbee:3dec with SMTP id ffacd0b85a97d-48dfbee3fa9mr4140550f8f.29.1792142231949;
        Fri, 16 Oct 2026 02:17:11 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:7d8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm3692331f8f.29.2026.10.16.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:17:10 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 6/7] mmc: sunxi: B288 mmc0/mmc1 run off PLL_PERIPH0 2x
Date: Fri, 16 Oct 2026 10:16:07 +0100
Message-ID: <20261016091608.121842-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016091608.121842-1-pmazzini@gmail.com>
References: <20261016091608.121842-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Their mux input 1 is PLL_PERIPH0 2x, and unlike mmc2/mmc3 they do not
halve it.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/mmc/sunxi_mmc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 84f4e4c2198..7329ca3e24e 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -100,6 +100,13 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 		if (IS_ENABLED(CONFIG_MACH_SUN8I_R528))
 			pll_hz /= 2;
 
+		/*
+		 * The B288's mux input 1 is PLL_PERIPH0 2x, and only the
+		 * mmc2/mmc3 controllers halve it.
+		 */
+		if (IS_ENABLED(CONFIG_MACH_SUN8I_B288) && priv->mmc_no < 2)
+			pll_hz *= 2;
+
 		/*
 		 * The A523/T527 uses PERIPH0_400M as the MMC0/1 input clock,
 		 * and PERIPH0_800M for MMC2. There is also the hidden divider
-- 
2.52.0

