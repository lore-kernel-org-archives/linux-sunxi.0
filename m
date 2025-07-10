Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6622F1FFA
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 17:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169417; cv=none; b=X0VDQtaTS7qMWy6r7jsdwo34tG++7OcxNQk+LZoxgwOGa2DpS7BQU7iXsYzSp1e33oMRl+0tkD806+B6JuKlltJs6gWAKwn6WrH7r/5Q8UhYCWWirCJBXMnjqWjSWVIDrH56avy6GnPbWZ52zbS+IBmXhJe5F1epx4l/JYjfo/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169417; c=relaxed/simple;
	bh=Uzde4F/sfQBVHQNcjDIBT9HB34JjyGuqbe7jNdblqLw=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=eITC6CPfH3a34sEomtTeyc6NIPYbPenCfpm0BPiTxWP8TKSghD+6UlSHh54cAIv7FHdMaqLSXEDST7OYxim5xnCw4/f6MQg8g2sjy7HLhjZT9NJG4MpKNdCiPrMbf7q+92F2yApOLjXtyX8I+QDUeId9S9aiXBC7TGontArhUQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gguxFjy5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gguxFjy5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
	b=gguxFjy5fioZkoU951CLuv0lQOU4l/gmydCN3jauKlnIPA3L7I6c24nh6OEtUN4FqPw9UQ
	gj189j5KjkEhfPpgUX12Ufql1/QlG4uwYQo+WJuGshtlWn38RbBAU5rhGRbqjJq8uX3zbU
	OZ3CNKoY2qCsIcBIkNrtD8C02bwdU8o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-cU8k89OLPeS9Ae9JH2A33Q-1; Thu, 10 Jul 2025 13:43:34 -0400
X-MC-Unique: cU8k89OLPeS9Ae9JH2A33Q-1
X-Mimecast-MFC-AGG-ID: cU8k89OLPeS9Ae9JH2A33Q_1752169413
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fab979413fso20157076d6.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 10:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169413; x=1752774213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
        b=RfOI3nNLjjz4wMSH+BvryG/0ZG0tHUGms/fROqw21na4TPOsEttjoXx9L28BrqCH8v
         I6vxtQ8iReOgjvyijDSMmP4DR8yUkAhKV4eSh5SOKSLUg2svv5TCrqLLIkSC3fqz/B/V
         qHJ3gl8iTmmwiYL+tVMuwbWBcr5NM+65UT+NP4iKyq5KcwXK6TFxJrbUgsoSxheYaA6l
         gtN0tDcitnrpSHAZL7YimbmkqESeWVtiB+YJFu6AJ2Fq+GlNwb6czQEszJK7x8E+z8DW
         kXUoxV5/5FBTFDMn0leVa01w1uFg48LDST6/4prQDelxiL1smS4ih/nu/wwB9LLsDrQ0
         SScA==
X-Forwarded-Encrypted: i=1; AJvYcCXZhHec0Z+bR5RDSRce1asHld/OA+o+DG5izOChg1sC9ncuquQ/+Cc49YROOaVrV6ZpRXveTtRGPeEEyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyCOvSEnhx3IRfc5AuawhrZ12UTOYbdC9lQqcXGkly/WR1GbhH
	hVvG5CefPeWOgTc7xujJpTSKj8myQH8qZNlY4/ftyXo14iqOtGck4aj6IIy2dpUZLozllSxRjRh
	klnJBj1+Glh/DFNU9N3BCgTiglnYIRJwgRF15splrkBXOrv215FltaiGBpoGaqMG/735EqmcSZM
	sL7kKNb6319UCGvN1Me+a2gjwdIuqIff/aDjtnmRRER8LcoIsA+g==
X-Gm-Gg: ASbGncuaK24srqZH2/BPuDwknWemG6r1hK2C1uptUDO2cEl34+PZSziGCrGgJ1CBIo4
	IP4QZoFFHOt9kG2otPRjpqAYtrUaLrf1TaRox0EknJ+Ow/zW6LQpVUBeDVDb60/U4xNdY8MvHm6
	imYuuYP3R6LG+tQ4lbSEiynAZliDZWjLGlCaI5S49Lj7ixxAVLqCp7SLreaIARKKtdAf6YxSICt
	PPi45fhbQ9xHzIqwDRGqRG3Je19HCdh0e5MWC5hKeqds8V0pSz8SFxFEvUZz92sOc5olMQyiKF4
	cRMia16izyM8yU+moFMbTMwN9MDL7PSA7e9rdrgbJk/LEhwXcHme/wcrrBaj
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id 6a1803df08f44-704a3a4449cmr3581076d6.38.1752169412881;
        Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpu8L3YGRW12uiQDpOxMNgeR30Y84ZsZlrx/wXIc8LbcnhH9LwZm0nYnuoy1dfBl7P78vOQw==
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id 6a1803df08f44-704a3a4449cmr3580236d6.38.1752169412340;
        Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:06 -0400
Subject: [PATCH 5/9] drm/pl111: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1663;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Uzde4F/sfQBVHQNcjDIBT9HB34JjyGuqbe7jNdblqLw=;
 b=0pYUMWvjxgx4WfuoWRCVGEVL5ZYYPMN0neD5N8OcfZKIHag1vghAK3SLtnfFRHjfYafmDTVi+
 fTHFTPespiOCXPSLsOLNifbUMGk0HbP0Ww4Oh/+lSRoq6wnUOICkRwy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -IgHZc0g72alogwKqBkvbLZoAmxyfVQSmuWos7r3IQY_1752169413
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8bb42116ac382010829e333edbf8f..6d567e5c7c6fd559ba369a2761d3c402a14c6fe4 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -473,12 +473,15 @@ static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int pl111_clk_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	int div = pl111_clk_div_choose_div(hw, rate, prate, true);
+	int div = pl111_clk_div_choose_div(hw, req->rate,
+					   &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long pl111_clk_div_recalc_rate(struct clk_hw *hw,
@@ -528,7 +531,7 @@ static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops pl111_clk_div_ops = {
 	.recalc_rate = pl111_clk_div_recalc_rate,
-	.round_rate = pl111_clk_div_round_rate,
+	.determine_rate = pl111_clk_div_determine_rate,
 	.set_rate = pl111_clk_div_set_rate,
 };
 

-- 
2.50.0

