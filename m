Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FE42F1FDC
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 17:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169414; cv=none; b=DM5jSwv1ZOZzdBHdGt8slu9puCNH9k9DFj8n6Kmrcjx11Zz51kuzuLt2gztITA511MEJeYAoDqaAUCzT0BXX/7rxo5OqL5YRKfifPqjjZLgwjMFA2bzvOBbQ88ATjuP5Pinig8m715tcj8uYxaWWCEOzFBWst6ukfnSYXH0tDL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169414; c=relaxed/simple;
	bh=MIrYQUA+EZpetvGrGMmQ8oMPGqbTBnNzDewrKD2iOsk=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=L0OMg54NauxOYU1eRBbToFGWqX/1IRw6IDsL1/1iz3YhOxWHGzLWhuTMyX7CzJkgWNsBkmG8mmZvRCANzXCiejzdaQ0xVSCKWg1SLrq3xSlGh4wYI5dwaRXaynxlv6vK4ZzjEAeMr+HHgb2oL7jwm1kZ7vF6mniRNa+pBpWwMN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWP1Zygs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWP1Zygs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
	b=YWP1Zygsr1Fz/qle3MaiV4aMICxpKKd6o4Qowk1RQ1OB/gNdC63wxuoZPGexi4MI8qiI+K
	a1HCzcocVlpFd/u6KzHVLl8OwN53bYl9OydSLoHOLKfu11Y5DyGiz3m0EoqAguS5sp0b+n
	DNLj9awUktO8ve+nLvSRlGqKqLnrTIc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-VIEFX-bcOVS9tWu-Z7kpsA-1; Thu, 10 Jul 2025 13:43:31 -0400
X-MC-Unique: VIEFX-bcOVS9tWu-Z7kpsA-1
X-Mimecast-MFC-AGG-ID: VIEFX-bcOVS9tWu-Z7kpsA_1752169411
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d460764849so405839985a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 10:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169410; x=1752774210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
        b=LFmod1aa07tUJTvBScs6NpsIhzuR6jInYOWvd2OmL+AyIAXIvhucxTYdFR9min4A84
         E9c3sA+eS+PDnq0DOcGQpnRak8BGDLW+j/24UsKUXGlZWKlvfOAWdefRHIYPSbG4fjKF
         ie8MwhMwBLKAVoXfLX4TCcojL0VWH1HC6QzU1U01oIEOsyW6u2usgJb0WuQWmNq38Mch
         qA5LGURgTHLp71vu4SKWNrXOfLVYllFyB+71SPoUO7VswG0dSBCj74r0PNVLjOtm9Mbn
         FEru43beHgorDATz81sQmz2sFEbLq9R8mLip6Ua6ueQbr3PtNEBB+DPkTcdy0OOGuj5Z
         /qpA==
X-Forwarded-Encrypted: i=1; AJvYcCUmBqRpmfiADeRZ9dFSx4ctmmDgWtGoXbxCYRqeP2E/dDOvf19P5gR1+4NthvsJ5W3k9/+xZbxNe9/aog==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLFrHSoqE7ihxTEn3m3V0GVK9VBepWB+Vn0ZXKXv+3z9jmokNV
	tEdr/rgCUlQbpJCBQ0y0s9Hs8x0Zs2q63XMK6wW4W5xbhULTeua9c8/J8NzgoCSeI8jY1yBQHA2
	3Uqm7eTEIXex86ZU2MqwJam4z9KVYPqPjweYno+fAXbFf/UJmHJlv3ZG0SHIzVtD/k8tFWVILPV
	YE3Ba8ymnnMLO1FRfrdEmlcSuQCXBBzcsm/NwJQhYH/rC0EKeImQ==
X-Gm-Gg: ASbGnctV2BAsYFq3ABTUu7ZRC5cncIHaYHc2yi3AIDx5a+Bban6Kh/bPJXxOz2+KiXt
	I28/DBD9S7TDKpkyS0KsUh1nNZqSbnWb9EYZrElzidCbQ3uSpGnX6wvbUKQL/VlBeveMZn8cO6B
	Y/315wR0utG3AhIx12SznNWfTvDaZHqL8fpk/XlunbhDWJE7otaJnMPbZgkoRS/ukoqZb1tb0oO
	yJhYkHWS0MjXLAMQzfzWRCq6jgJxXr3pE3V94k9iZy/hqahSUdo/2luhtoRPdo7vawlEnmxLnpX
	eDCKyyrRiwuY6K3eXh99W8grYniuQ/1V6GwcCqL0rmQYU7/+CAlqGQLMD2zJ
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7dc97da02f2mr646714485a.9.1752169410011;
        Thu, 10 Jul 2025 10:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtGRA59X5211+zA6+bTuLexmbhranU9s00ouhgxHCHsr1K/Q7uZzJEn/YRVuxvQ5eKEuxqlg==
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7dc97da02f2mr646704785a.9.1752169409169;
        Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:05 -0400
Subject: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1532;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MIrYQUA+EZpetvGrGMmQ8oMPGqbTBnNzDewrKD2iOsk=;
 b=xNXPieWXOwE6YijWTJ3taaQPCPf8/+I1K7+s2EiMedGqecECqqLSQTFSwjhrnG/onGaKSV32p
 isG7Au5aNEyCqmbZJtcC9vC7jvxXBrzxoAluzBC1poKDa0ziZwvE41x
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q-LWaw3W1muB0aPUGzi0yAa_h72ZCRIMRb3C_uOCmtI_1752169411
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index 83c8781fcc3f6e1db99cfec64055ee5f359e49e5..6ba6bbdb7e05304f0a4be269384b7b9a5d6c668a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -373,12 +373,14 @@ static unsigned long hdmi_pll_recalc_rate(struct clk_hw *hw,
 	return pll->pixclk;
 }
 
-static long hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int hdmi_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
 
-	return pll_rate->rate;
+	return 0;
 }
 
 static int hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -402,7 +404,7 @@ static const struct clk_ops hdmi_pll_ops = {
 	.enable = hdmi_pll_enable,
 	.disable = hdmi_pll_disable,
 	.recalc_rate = hdmi_pll_recalc_rate,
-	.round_rate = hdmi_pll_round_rate,
+	.determine_rate = hdmi_pll_determine_rate,
 	.set_rate = hdmi_pll_set_rate,
 };
 

-- 
2.50.0

