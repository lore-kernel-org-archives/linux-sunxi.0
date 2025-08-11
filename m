Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E5328C87C
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909815; cv=none; b=Q92EL7+h54JnNeHgy7eyCHnCQ8UvrOU+ql0odoGvML+ck8joJJBv42G0rPrsYIY/4k3blcJpwVyMXebUZ/rUlLNB7wlic3jCJOajdpFm0Jva/a9zcRWESs1e1H8LBP64BUqriq0gAPSCmAsGqQxUOcfPowDX9N3LGdI6I1KC78o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909815; c=relaxed/simple;
	bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=gZ0wfkW54Eqb9ODV1Pdp5FsEhq65gKMEzyostBRrIpAElnl7+lXoZJVB4UvpbsoUgc6G6pa7dcg/TzFBYJ12la8DnxpN6i2CILEk/jopiA/XttiEqmDGRGYz/+KckGF0+/FoW6Lsc6aRB1s92A6xJt3fGbzTZnjGrZJVV+qfnYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DdgK5j86; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DdgK5j86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
	b=DdgK5j86P6d00GitbptmK7sdrzwJWhHk495pOfAXuttPUG/Uu0Fe9b3Al5GIhEoaCoxEIM
	EHmK91B6O8ufFJtJY7zqfIAAGhiNDeV/LGhzU9srcNY0PrdG5iV/fioHD2f0nAHDWRqq4M
	wJVjksnkloQJx4MXmn/i6tj4crIyWDk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-3WE2p_x5OnaBiynzCAbKHQ-1; Mon, 11 Aug 2025 06:56:52 -0400
X-MC-Unique: 3WE2p_x5OnaBiynzCAbKHQ-1
X-Mimecast-MFC-AGG-ID: 3WE2p_x5OnaBiynzCAbKHQ_1754909812
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e69e201c51so996731585a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 03:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909812; x=1755514612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
        b=ptt8OR7/n89YNCBhgZEJT5mw7wj6FLI+Bdb3JtQb4QehxHJ8uw2T9IEKRyec/tw0VH
         EomtQeeky8kvTEg0V+93jMWc6cOzB9RuYFFXfFmpLXXSlNu126LiKDSXnmGsphFjjct9
         /7qgvYk8PnWozd/CfMRFXIe2S1bAtpykpHik2LQJEELD0WklUH9TLHoT7gD0Y7wjBLH4
         XLztAPFinqkWf48EgdSvQsLnHtQgwBCo95ckNTiKwCRZX/nA0tGyZjrXLAXPjz1eEszZ
         MEH0GHEdK5y87W/elI/Z7qL0OWRBY3peXIpZ49zkTb0qot0MhwmWit6x47XZLNy6D2KO
         3PLw==
X-Forwarded-Encrypted: i=1; AJvYcCV/jjg/np0b8Uc185Vkz6IN+FtRyMtjKnYVPwoIGERKj0/f5++YDrY/V028SJqk3V8agDEuSEE4yA80tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUxIKitYNLc13zxU5IsqbtHC+OWbLeaGAAjNKGHxy4BuPrRiZk
	2UH817Yy55rUDZHGcjfpwlOjLFX/S7AdDvZs4LdUbWnuUM6X4smLYrt+qCCALvEAhhP/kp2tw14
	Db8zo5Gh/+GpLPN0GM6jv0M1mhSF6iMyIDEYRFUwGRGEXYovGE1wMK4il/VGqGJWZ
X-Gm-Gg: ASbGnct22ALDoTBFOpGbTf5IEPva6cErnULZQgUeEzM9Fdu2UIoSgt6BKiE20607OXZ
	TXZOMQ6JPss2kFXyJNb8TdY91JkXWyAV++gwk5G5/W5CZz46DQSvp2zc4hwRbKqzPQBUaiY5q0G
	jmxy5VmOaGtGiY2liUROpPVJa5meaD5U9Ep+2+0XqrjMnqxz0fV1sAmrqXcHbnEGFC5BhSNC+cH
	lI7TCYlj5a0uX1yHl0xw7ymj6Hz65I95htW9Kzwg9Cp88h+GYL1Pa8umsDHc9S6YjJHRFH4c9Ne
	m5EQGlb4lrPnqPa+xbC86CZQT0ZcQyuluSrtKypxzPZ7EG6vPKb9c+N5+tAN5eFmtK45kBYlyg7
	CW6s=
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792739485a.33.1754909811724;
        Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2Etk94d7jqWBuBTsPUBpC0ORVIn7oE21Xh8O9EOQgSk7vq5RIMLYWuxIl1Nwz+nt1Y38MA==
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792735585a.33.1754909811152;
        Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:12 -0400
Subject: [PATCH v2 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-8-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1693;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
 b=D6lQv4uU9BbCtmlsDXvXPLa8dR0h0DlOWWckbVaEkFndxlEt+IyMNkfDuSVR8NgDYOThGx2MA
 72BwKh/6cLNDsrNiAlNie395a35C4+/kjwVpt/wftlDiaqzAFDkxkOV
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fesX29mr88lvcQHb-SmCxAxfXsbthpax2GqGSt2vuBo_1754909812
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 12430b9d4e930f7e7b0536a5cabdf788ba182176..b1beadb9bb59f8fffd23fd5f1a175d7385cd5e06 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -59,13 +59,15 @@ static unsigned long sun4i_ddc_calc_divider(unsigned long rate,
 	return best_rate;
 }
 
-static long sun4i_ddc_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int sun4i_ddc_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sun4i_ddc *ddc = hw_to_ddc(hw);
 
-	return sun4i_ddc_calc_divider(rate, *prate, ddc->pre_div,
-				      ddc->m_offset, NULL, NULL);
+	req->rate = sun4i_ddc_calc_divider(req->rate, req->best_parent_rate,
+					   ddc->pre_div, ddc->m_offset, NULL, NULL);
+
+	return 0;
 }
 
 static unsigned long sun4i_ddc_recalc_rate(struct clk_hw *hw,
@@ -101,7 +103,7 @@ static int sun4i_ddc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops sun4i_ddc_ops = {
 	.recalc_rate	= sun4i_ddc_recalc_rate,
-	.round_rate	= sun4i_ddc_round_rate,
+	.determine_rate = sun4i_ddc_determine_rate,
 	.set_rate	= sun4i_ddc_set_rate,
 };
 

-- 
2.50.1

