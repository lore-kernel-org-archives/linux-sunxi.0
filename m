Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9025E28A1ED
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909808; cv=none; b=Xfjis4+DeqL26FVYAiuBQrCppWr01apuLEH8V5aZo4Fva9XEkR5WXsf685nhAAQkiroBvSWrc18CiA1V2t67KRwszU6nhXkII6UwNcHoQ4BP5+tnjh1CUoQ5le38R2yRDo57CIQuwCfNRWlmaKJwx9GDa88L3SAOoprFfyb+dDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909808; c=relaxed/simple;
	bh=zjPZ3dnO6gZ6FQi2ZfbbqSAvbJwyf4CBg6JGhX8DcxM=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=R/GVi0bntVGwwdj3akPyAxi3RJ2WNcO/XGy6salF6G1uioNPOuS7mw5bjKDGdxkpFzexQiHrLxwHZYxlk40oGVMt+5s0+aM8V1jCkYKwHUNBffTGXs22pxgB73rMMtb8SB+6TmJnr0EOkEGprIwrG7UgK9ASCq9wISBHrm36tdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cs3w6PCZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cs3w6PCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
	b=cs3w6PCZ19/9CqK+yc/iS2DaNJWzdf/xSvNUl74zHSeSKA4Z07tepTYQi6czbJ/8hBX611
	A78sgW3eccQ6XO7CrHzWesaQK4638Sr4/72uTtNWyGvDBEU3VQ6nQwT+YMfkWD+Iu6l9ZU
	TpxAOu3JyYDnsagHHTq9y4x1yv2sWXU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-mPqx2y-3PrCbpdJxY5ti9A-1; Mon, 11 Aug 2025 06:56:42 -0400
X-MC-Unique: mPqx2y-3PrCbpdJxY5ti9A-1
X-Mimecast-MFC-AGG-ID: mPqx2y-3PrCbpdJxY5ti9A_1754909802
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e82b4ed799so705390285a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 03:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909802; x=1755514602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
        b=lUnweNc5VAsqm0ln+bSzNDwYf8d3GqlKllGPv7tQlD8jchhQnujaB/p+IQuMopTipe
         VgU3KdHdQ9zu1BcNdiOmhgEGILEelJ9vk5QxQKQX44gTLYIiOq/hXFpGH41hMdbioNT4
         TRKrtFidtI7LD4MGPU+Bp6jiXLZGz5d80K921x3S6AiIjba3Gf+2HFjFlLc4QR9epd2q
         NGiryGrkBUhpl40FX55mkleOsnKOH7KCo7oQyeuaYwC4o7atqFHqMQ/Ims+aKkveMzdQ
         a6U7x5STouos1VgUR8hf85kqpmnLcFGyfEF5W1xpTdSdBBwxYUj8VKe3tf9rRlMEOx6T
         /AuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTDb+5Twlfx0A20fad2UlwCGjWcNo9jUMnmxw+R3P/ij4E16Ra103+8DFIKyxgObHSKHcgXbEhUbOznA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuAX1FkyBZqmcFj7U6DTeqc8G8MZJpg0IJyU5FOgZMfID53Zjp
	wjqIQYu8nFVBtCc2a9hVCYE+oX1qOJvfnUFbVtEzeH+sIWoHg0kUsFbJTzi5g69T0zB/Dlc5xuc
	ZLrYtQlnlNdIqLwmKUwTVA88LZ64DmSVRrGC4zNJ8POOoIr1ablvEoy9Va3METJlv
X-Gm-Gg: ASbGncv0FIjFWOrok0+Xcd5JiLcuATt1oaF7HKDM9Y0DTVEFr5lGIr5hyhBgJ7Yici/
	jMDI8uLpRbO8hAdzAWpSvCW6YQe7SGm8Ew+AF0t1zs0hgAxLMX7BSGDbKDfaNT69nlO5BdhrDRp
	TBlV0rKlZDwlcw/hffgSddxPpKzD8mry2VmbSf1UeYkFq76zvE6VAbv6klnX3S75MSz6lUB7Rjf
	pV6ay4UByZRsSDVFNGL4DlQzyuR/07BqyT1cgl04ppZZnjb59L0Dzn2An9YYGcFSR2d07+qR2ys
	HMJVYGRpmFY0sJPRAWu3luYb7kNvzARkiPW2PR2Nchz36WGJT4vn9Qy46xeoduq4/7f+qRiUYqx
	y+Ao=
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id af79cd13be357-7e82c6834edmr1680334085a.25.1754909801988;
        Mon, 11 Aug 2025 03:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4J1YPALYk3sfXKt4CIgszP9xA12/nZjPecmiJUzpdOL3Mq3At3CKB2rvFttPLfHNTO7lJg==
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id af79cd13be357-7e82c6834edmr1680329285a.25.1754909801517;
        Mon, 11 Aug 2025 03:56:41 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:09 -0400
Subject: [PATCH v2 5/9] drm/pl111: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-5-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
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
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1718;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zjPZ3dnO6gZ6FQi2ZfbbqSAvbJwyf4CBg6JGhX8DcxM=;
 b=NJqHQ2ssaD4y0rqVbCbujpIrqzdN3VuMWj9ghDV3lWlNDbiI/oggFqGjuVCZHps19PnD896Q0
 9FdZ8qhj9mUBZ/GerZTn1O4AjtYG03lLvn79VW/TKhLY3AumrqAiB+P
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P7VZEl7IwY-7SFd4BqvlpzLxWtLyWcvl0a4Oszrtcm8_1754909802
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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
2.50.1

