Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C282F1989
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169408; cv=none; b=TbU3ILeatyuaPXyHluSw3e8xy4ClZgnb5KOt7SQ4FefrCKo4QLWy5INKA0yfqwQoUlbYT/hhGwn3qT24iAL2R7XOVPw83Nxk+G/Ah6F9Wv3KBGdcY/RR1HHLUy7KgfYlC+9AqO3b+kQO7EECa64r6wEXAWjNndsla3LD48QW9RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169408; c=relaxed/simple;
	bh=kl2qeTWYwIcCK1THSOcO56NA9jbysmHw5mNgghcr0SU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=VYGc1K45SF5HWThDsS8y9rQ/yFubM/jJXdZgOoXLWK2CSIc04OBtNwp3wFJNlH+k76KM2zVjmFCEwnpJUFfdKO5u0DIqDovktvW5wp0dfXXi+PSDBQKMdjUuRoMKa7AaAbP/CzbZvJmJ5+fGiD8S3TIKBoTX1CfxpKGM3lXYWF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UKQObq0C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKQObq0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
	b=UKQObq0C2HDGxQSGASh/VSqQ5FSWIIgK7bU+/Kt2t32vdJoRHB/JOj1v8nNTlMWIbhJWRI
	f3ExChTznVGtIlqlH2ZBHBKNPeS69h9psk1TFWuvNCOv/foJZt9NhbnHc5bPhRvnmYZjxp
	XGoxWDd7E3gj1PzutYpG2q1DZEhvs2s=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-3nwKDLv5NsqgIdIPmTs4wQ-1; Thu, 10 Jul 2025 13:43:24 -0400
X-MC-Unique: 3nwKDLv5NsqgIdIPmTs4wQ-1
X-Mimecast-MFC-AGG-ID: 3nwKDLv5NsqgIdIPmTs4wQ_1752169404
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-702b5e87d98so25243686d6.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 10:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169404; x=1752774204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
        b=wZ3UOzBbEXtuqKZuH0Se6wbtlgF5DpKAgaahHvAhDhRJJR5/aFXYzVe2Hsd7Lsmiw+
         TrwDCFKKMDaK0zdF+v3rIBEgoJOTL0exHQlxj3pGVEF6IONTUhtnV5GAcVGDA049MhKo
         edUVfl/DaZHyVmby13eLxbU+muBSfOrA1u4qTId6s5Q9UfyKG2K2m887YW8Olx5b/bhV
         zwZmsFu3DNikljlSD0VgkRb7yoCOVu2LXLK5SPCc5PsuEnqvf0H/YZxhi2XQgs34jwl/
         D9WV49rpR5Qv2ZIDWCsIpO9FyBfJNyoVE119l80jhnK5dDgpyJu8XZ4uz/AOA4cUysYw
         oMQg==
X-Forwarded-Encrypted: i=1; AJvYcCVep27ZXDtC46wpSmVPzbizH+TDXLXV5a5V+PMAYeWJPLTe8QOhLABAzPubctcJnjo4e/xudE0YvfXN4g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yygxweyf3AgJEGUH+4ZA9hpCYFWsQlntG2kqmFur61n8aikgB24
	iZrduudUjKAeCeP1ftFM92k3R8SP7spUXASeoHihXUEOvEGtlueEg62VdFW1hBWJc2sWnuKwenY
	kSnTC5JmJa4ZiJahkb9E8Ic8r+KeyG1CbOQrZlVw9CvrPskaYLua3Seo7+rulJqwy5A/shTX7TC
	PL4P4NVnagfUTE68XqksNO87qQkbeVCiFTQ+UlW8Qu5geo5YECeQ==
X-Gm-Gg: ASbGncvUFwYGx3pw5b+R0Qx00nkl+obMhssFrm9JN+GpXkAuG+MLs5c/WxOsSHwqZg1
	LqeydvITnY68rUr2KYtJoBV0uEIlXk2Sp+QMAjmniwr9sVVHopMZb0nEzsPXbTGw8HeSupvGBvp
	rHDVH3EHvqci59Q85duFBD84wIsVTtI0MquuUz3PX51Bn+BWhiZEjUTw8HtI9WbH4vkAI/OitFA
	nLeiO7+kHz2OIZ5kCx89IIWAEr8MKVd4VUZoAIhCnEYz7bGNzuE2q06f6YQSSIu3+GwWGqrEX7a
	uT8090luMIS7Koa8DBDhPRRoVzijLQc5LaW7dpmYozZmDRxAAdEy0hgGrDjx
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-704a3b03a02mr2644876d6.43.1752169403871;
        Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFibFyJAqH2Tkc8cSfyuj43nonhKwPGrbHTb1n3BZYj/b4JFbj4juY9nmJvfEsNrJfVGljjaQ==
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-704a3b03a02mr2644146d6.43.1752169403246;
        Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:03 -0400
Subject: [PATCH 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1675;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kl2qeTWYwIcCK1THSOcO56NA9jbysmHw5mNgghcr0SU=;
 b=dJ/qA0hGF/+fQfe0crsCUgeeRXp3uEEF5tBBbhlI5F6XFBRbvTidAvVYatP+DdWjLDW+J4Np0
 hf2I1m8Rc9fCuxnysHNHHy4FFC3Lx0PLz51pJGMCy+rQ/pwYO2VWCbI
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pqyvld_DDrIc4e50m9qfj8qoH8-HbpEQQuwaX14hGHs_1752169404
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/mcde/mcde_clk_div.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_clk_div.c b/drivers/gpu/drm/mcde/mcde_clk_div.c
index 3056ac566473487817b40f8b9b3146dbba2ae81c..8c5af2677357fcd6587279d58077d38ff836f0c0 100644
--- a/drivers/gpu/drm/mcde/mcde_clk_div.c
+++ b/drivers/gpu/drm/mcde/mcde_clk_div.c
@@ -71,12 +71,15 @@ static int mcde_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long mcde_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int mcde_clk_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	int div = mcde_clk_div_choose_div(hw, rate, prate, true);
+	int div = mcde_clk_div_choose_div(hw, req->rate,
+					  &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long mcde_clk_div_recalc_rate(struct clk_hw *hw,
@@ -132,7 +135,7 @@ static int mcde_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 static const struct clk_ops mcde_clk_div_ops = {
 	.enable = mcde_clk_div_enable,
 	.recalc_rate = mcde_clk_div_recalc_rate,
-	.round_rate = mcde_clk_div_round_rate,
+	.determine_rate = mcde_clk_div_determine_rate,
 	.set_rate = mcde_clk_div_set_rate,
 };
 

-- 
2.50.0

