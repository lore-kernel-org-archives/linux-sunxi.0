Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF39528C870
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909814; cv=none; b=MivdAZkKW5Cpsd12+VJWikL2AHlPJTgOJXppLtJNf0gIRD1lMBu4sK/GBPJ7H42W4CfHGyIVVdKecD1GYjNgt3nRRLmQpm3+yko+8RgNTdgThPA4XY1RqI3+Uj/MbrffavjXcK/ZGxWc5BiMga3Sm2i9yvk7GiHrYRKtiWO92lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909814; c=relaxed/simple;
	bh=juKzshMtQ4DF/h+L6Akp+woYewfsK6BXt/oa5cMlZgg=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=GxnAZSRjOmkpt7nPsuxB5idtYKkdBkeDN2R86gf0lQ2GefKSYFPDXPv/SBHTjTJCGst4dk9/q3Xm6nF3ZyU2Nhd144UORIvfIHX/WShIfeH08M0GsnrA0fURBZCdq7OORUJ4qaWw0WRW2oFEvu0Jnfce8tgLqW52sw9PVI3XZ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bsRobUNi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsRobUNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
	b=bsRobUNi+O3o2H/ZL0/A6U4KesyyYlY5L+fwjihfCgRJ14lU1BmvK1libdUQLbP2mYLSK7
	+9wrxAxXo/KxkmgzfCYPe2V214MV23HrSu/Xi+KbVSzPocekiVm3E3tccRewwL1MMHIuSt
	aGH6fG3izkLrRpw0ixbMU5XMwnynwSs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-Qk9n2gIbMsmKqqMI7No9Tw-1; Mon, 11 Aug 2025 06:56:49 -0400
X-MC-Unique: Qk9n2gIbMsmKqqMI7No9Tw-1
X-Mimecast-MFC-AGG-ID: Qk9n2gIbMsmKqqMI7No9Tw_1754909808
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so971948985a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909808; x=1755514608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
        b=WHWHCdj4Mj1VaKC19E1L5m2+AAOJFIDDAIVcy99aGa9818QssbcSL5CBrS7LKzNUsL
         OX9oksvLgew+eN2MMa2dcS53Bl9J2qJWuINvBro+SZX60yMdwgZ/MLT+Z+DkOW/9QNtj
         4Nz4IDBJhqs3AlEJigfgyRoxAQhbz3t98M0mQZKTIwHMGHKSaYcUmF+MvJZ6x2autaga
         W7Wr0fbaetTaWH+Cvd2u1H+8/+FrsjGRHsCVM49brK1M84bFS4edk8HmmoAp9yt3YJtk
         +WoCfz4cz0OYe0Ml1rGJi2pjdevrSr1PLbIsXNHQE7O9oKso+OmtRd4MlUwC6wwGXQIx
         l+qw==
X-Forwarded-Encrypted: i=1; AJvYcCW2nkC7ejXgEwWU95G6P6dZceYmMkEhhPnxLfvV68Vel4pENcMpE7OkcfdD7Y6FHJwD5d4L3muQl7KFgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTtCkRio6M8tMwjta/cPRjemFaswJq1onBrnKv6xQ6Xap4Z1mp
	8555WBot1jzACK+jF+u6mmsmLJrcnAkKUrbklE9qds48KpXCJ6AyQBAwCt3lt9q7YWcaA60IxSm
	yzpxTIJmswHYeUR2W6ug5dNbb21fD1h2vrejTFBcRm0VQ82sTOnMvUkuEmDQ5l98n
X-Gm-Gg: ASbGncsJRFKGVIbDMa8CNDWELI0RLgMzVTQ03wZYyD3NaZCvmSL3KT8AIPDdpWTIUWL
	6KR3UqlkNASvr/2ET91WCy6MefwBWeenbKrzG5T7BwVjC2oAnQS+OBMWKfzLokoxo49ZOMnaX6O
	6tl+xbkGbG3fiLsHuaV52xC/w4wCd1/8mYtSoPExxXoX1Jk4f+e/XvBAwi4GMfs1Fm9oJZBy27E
	Ta8o23LiYB1a3/HsRohicTbK4DwTPx1Mz9t4xFFo+8j+Iivbk9PhV0z3gx3x5Ygmt2eqFWqt3zK
	YVcHasKPKbueTUBdtsY/3Qc1UgLt+F4OYyPEidjH9LzuTrOt6sfTUbH6zUuSs31tHUPlqMB+H4Y
	at+I=
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e82c75b89cmr1125687285a.34.1754909808558;
        Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhnLELhezGJADLmdApayEoevKdtEKOKSDSvgPhqkzq4hJSUIbUnZL0k2iE8nto9nf3DAncrQ==
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e82c75b89cmr1125683685a.34.1754909808062;
        Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:11 -0400
Subject: [PATCH v2 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2162;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=juKzshMtQ4DF/h+L6Akp+woYewfsK6BXt/oa5cMlZgg=;
 b=srQL2Syf3qoqHVxtrhYtzT2hxKDJiG2H0/4WtgjDA8OLuly+icCFFE04ANS8bywbgRo5Semzj
 RZvKazBg3coDcnWyiIki4FOxz5OPAdab1K8jRW40iEHpLbopisMgRC3
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I3nfK69P6pNWwBYd0OBxodJgDxlNdqFzY9m_hSCWh9k_1754909808
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 07788e8d3d8302a3951e97d64736b721033998d3..fe38c0984b2b552e1ccaef4d1e589b9d86a40ee3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -682,8 +682,8 @@ static unsigned long lvds_pixel_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)lvds->pixel_clock_rate;
 }
 
-static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int lvds_pixel_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_lvds *lvds = container_of(hw, struct stm_lvds, lvds_ck_px);
 	unsigned int pll_in_khz, bdiv = 0, mdiv = 0, ndiv = 0;
@@ -703,7 +703,7 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	mode = list_first_entry(&connector->modes,
 				struct drm_display_mode, head);
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	if (lvds_is_dual_link(lvds->link_type))
 		multiplier = 2;
@@ -719,14 +719,16 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	lvds->pixel_clock_rate = (unsigned long)pll_get_clkout_khz(pll_in_khz, bdiv, mdiv, ndiv)
 					 * 1000 * multiplier / 7;
 
-	return lvds->pixel_clock_rate;
+	req->rate = lvds->pixel_clock_rate;
+
+	return 0;
 }
 
 static const struct clk_ops lvds_pixel_clk_ops = {
 	.enable = lvds_pixel_clk_enable,
 	.disable = lvds_pixel_clk_disable,
 	.recalc_rate = lvds_pixel_clk_recalc_rate,
-	.round_rate = lvds_pixel_clk_round_rate,
+	.determine_rate = lvds_pixel_clk_determine_rate,
 };
 
 static const struct clk_init_data clk_data = {

-- 
2.50.1

