Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29722F3650
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169430; cv=none; b=RG8v8Dk7jHt2Ctd6yKmeOGUpEbaf3+8jgBVAi8aJQRQqNSY+E/jthuChG7GzGxcw7Psrt9hG9JqDqCOriz7vI/JeG+ZclteBN+/GR4wctyrVUIzf+bwR7W9WPGyqUvC0Q9sAW1KO7HuxIZ5z3imwkE56qu0AOaRDfRUNXG5oCQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169430; c=relaxed/simple;
	bh=xPkagiW22ryYRgcFeUxKsYb4R3sx64zzzkaF7TIS6rk=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=bjAh+fK3dkC+Ke2MlEdhLewfibYy/E8LnHxLtB003car3/7mvHZANC/Cs78J/bvDz9nrbkpvcBCEc5k8G2n0d/wYtGSQoUt4m6cLo8xRcTJsu3LmAuIb5WbYNQw2LbkmtcvJR7FXgAq7bBngizHnPqOJsKrOjkiLfKH+HlErkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CVkJlQG7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CVkJlQG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OrtVi+H4smani+Wxuj7rrrlvdLEKHZeWuJz/QAEtZ0=;
	b=CVkJlQG714UADmX6KjfDY3onJpl6Bvagnas2qAzUUQyLyfUzq0f1ABJS4kppAa714703Bg
	GV0HEcVO77oL2f/8Q7yN5/cnB+PKIli7EA4KNZCNJCMkSqqpW42/5Y4fMlZ/iZ6vJnwj0N
	X/Uq3Q/YGqbLkeQOujMcMbT0RMl5Oy0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-vLKS5iPQOweVxHYBjGRNCQ-1; Thu, 10 Jul 2025 13:43:47 -0400
X-MC-Unique: vLKS5iPQOweVxHYBjGRNCQ-1
X-Mimecast-MFC-AGG-ID: vLKS5iPQOweVxHYBjGRNCQ_1752169426
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6face45b58dso19844486d6.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 10:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169426; x=1752774226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OrtVi+H4smani+Wxuj7rrrlvdLEKHZeWuJz/QAEtZ0=;
        b=GHm/iiFR4/R2jxbmh7lDVfV7qt/wRTiKVH4HRYob1E1GvdehOwvsHnH/w5RCEe5U1w
         JohUp0FzmDP+V00E82BuJEl5LqPg/Xis0VbuQgIr6Uj9CxWtKyFCJHL5akZLkQ9sQQIR
         pGJ9+PtU4idpNcOwBKNhya3mOA+DpB6RB5NVVNrffTZHjdtu5oaq4Pb6Bjcb5JzCMPQg
         qiULPLSShK6eJISMJDa4L6ib2Wg/i76+CKhhsvUC9N98lsT57o+AX4i0aB7wW+XrAJh3
         f/M5asT03DFhW/nK3vYG4P+0nwrY1hAVw1ulPlon8MTLrAn1NKQC9o8kC/o8mg70YkZI
         Y0nw==
X-Forwarded-Encrypted: i=1; AJvYcCVa1OhadK42B3gzcPWsOxPZqzskBIwmkN9V4fkRtMQVjWgVfUQFyxXtC2/p7rs+gvD83KpeE01xMzTUbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaEq/D7HSg8KmJ9/0xqMIjyhe6BLIf5ek8AbaK7Hqr4/KK4oXe
	KoKgL6J4KRhMoVgVsN1QTsYElazoz4SaGu1E6mnX8kjyy2/ECq0bYpfpdNLkJ4BqLIHBbsJf0+j
	GLGx0DvorF2zqIz+CGHsSEgTqtfuW7ZYM/brR225QG03JzCaUUMIAvHTodLoKQTG6V3mik40iJ5
	aFk/qQqYK3AlsKGK8HlA0z3g++0ONQpQmqQgcY7fnYTu2JrTOHeA==
X-Gm-Gg: ASbGncv11JI/CMu9F8r9Fjer19saGspnhWh4Tu0mWYJuR2ZEzbKUAmKt4mHRoMG2Sjq
	F0lPlXQsmtbTD4bXQzMpRCt6Aot0vup/+eVg5ytUnG6g1ZadjzLc4SGflUg6DI7QixqhN0WmpiY
	4r6BGLAI3rFyrN7x43uOe9q8DKHzIWNm8SFzcRsG2IZfMxCJ9MfrJMoXChO8Muyipo6ideacnKg
	KlwIRl2bRQ6nSO12jlsexU7iKflMQ4QH7KG0hlcaLuHIAkYz2LUFhgREESIS6krMD9DO2X7nUcC
	yHhEiHUzt/uJLEPjVk3wKptf/R5kwmMtxjk+EDyMCEUwLrIWqJ+ttC6Dkz+8
X-Received: by 2002:a05:6214:5d0a:b0:704:9bc2:be36 with SMTP id 6a1803df08f44-704a4083bcemr2613926d6.7.1752169425857;
        Thu, 10 Jul 2025 10:43:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxO+/+2HUAUPTiUYztt/lC4Yi0Q22OZoIfFBMZk64H2H2sqirYgZh1L3qOGgIkQVmmCaX6kA==
X-Received: by 2002:a05:6214:5d0a:b0:704:9bc2:be36 with SMTP id 6a1803df08f44-704a4083bcemr2613296d6.7.1752169425386;
        Thu, 10 Jul 2025 10:43:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:10 -0400
Subject: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2262;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=xPkagiW22ryYRgcFeUxKsYb4R3sx64zzzkaF7TIS6rk=;
 b=l1P9iwEOFZ7iseMUGqrDwyTv1j/GS/74kLm+7ZgYbXOn1R2j8JwTxirCensojfrRCiquhbnNY
 RQW74FdbQM8B7MkeQZA7rAthmyuLBvNMin91wee7+2bXtn9fga4VsSS
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ne6KGi_EexP9TZTfkS8Ns0Zc0QsVX_9ZRuLNAKLpbWw_1752169426
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..9b85bf512d4c81d0a12e8cf726d5d5440343519c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / val;
 }
 
-static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int sun4i_dclk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	struct sun4i_tcon *tcon = dclk->tcon;
@@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	for (i = tcon->dclk_min_div; i <= tcon->dclk_max_div; i++) {
-		u64 ideal = (u64)rate * i;
+		u64 ideal = (u64) req->rate * i;
 		unsigned long rounded;
 
 		/*
@@ -99,17 +99,19 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 			goto out;
 		}
 
-		if (abs(rate - rounded / i) <
-		    abs(rate - best_parent / best_div)) {
+		if (abs(req->rate - rounded / i) <
+		    abs(req->rate - best_parent / best_div)) {
 			best_parent = rounded;
 			best_div = i;
 		}
 	}
 
 out:
-	*parent_rate = best_parent;
+	req->best_parent_rate = best_parent;
 
-	return best_parent / best_div;
+	req->rate = best_parent / best_div;
+
+	return 0;
 }
 
 static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +157,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 	.is_enabled	= sun4i_dclk_is_enabled,
 
 	.recalc_rate	= sun4i_dclk_recalc_rate,
-	.round_rate	= sun4i_dclk_round_rate,
+	.determine_rate = sun4i_dclk_determine_rate,
 	.set_rate	= sun4i_dclk_set_rate,
 
 	.get_phase	= sun4i_dclk_get_phase,

-- 
2.50.0

