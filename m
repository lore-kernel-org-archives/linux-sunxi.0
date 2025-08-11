Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DACA25CC7A
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909793; cv=none; b=MwOdRj0A2Tk6zohr4yxhaCrJLvOdIsjdhIqcI6QhntT6HbqiABrYB17pWLFcfg+tFaGQoJg/HQz6G4i48pLeZOA+9fIGucYed3CbdcAhMODdN1+BIb6MwaxoAq3J0plct/B8I9peohmGbqXdVjqRCxGuKh5RwKv+PIPjYYg0DzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909793; c=relaxed/simple;
	bh=cxbqZ4pGz5eouMzBVW3NyN413s0i735X+YyBDIP1KBA=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=kDHzqYJFtvyIwMbnTjP5AYbOaZHM4qDu767nNoIrgTwr1lOfB1RZHTIgIsH4MBTRG7fC43zKB+9xZtHuwUuhcgBSEI3R/SontYue7hsMnUVLdY9FhIFc0noBkrLAlNmh3njsgYWaB80RFp/NFSx13QxKyb4TomNlEhCQB/Y2SMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUvkGGxE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUvkGGxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oItVFGO2Yky7AW4ur1CICLCJs15wxQxwvYfZhdFHqm0=;
	b=XUvkGGxEe+h1WmIbg/eyl2fCDWGsH82NDvxo0Pd+C72IHlKf56j9dvQz/tlJs1YK+Vn5N6
	77LGXvnSvCT46SKgtftFqcYRB0rx7gnbKGCHkD8qb7R/BQ6YLSHF+Z29uoDT1WucT2ESoK
	TCIF087SsfZw9+R3BIB3tSGGeoJUZqo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-m-6h0b4_P6ClFjPSZI4riA-1; Mon, 11 Aug 2025 06:56:29 -0400
X-MC-Unique: m-6h0b4_P6ClFjPSZI4riA-1
X-Mimecast-MFC-AGG-ID: m-6h0b4_P6ClFjPSZI4riA_1754909789
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e8072f828cso419676685a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 03:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909789; x=1755514589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oItVFGO2Yky7AW4ur1CICLCJs15wxQxwvYfZhdFHqm0=;
        b=B5RECB8uOuOfID+ImNWIOvU4EVQOAYla+buxoUb6aqDIxYlj4xQFWqa6b2YjhJKYRs
         aeS7gnYCYNb15DCREkZCt5YpO91otcqWT8PnjfCAFX1aq/luuObMLiH6EbtmfWDDsQgw
         gp93EuqaUm81ivm8K+7lurofdTAuSwlQdG6+K/y/CPTUMtuBLDz5T7s2omYou8/OntPX
         ByIbV2n3jsw0wmdAAPqUO/TomvCge4JyX2cmJhsEfgbyAkhqMDtpkilHck9TSZp3PS/+
         xVKO1jzxXEzMnWgFehvmkCOx5Fb31ZWq9YlvnTVgQrTZv9G7FFcMd0EFlMDfk0Wgju2o
         2fpA==
X-Forwarded-Encrypted: i=1; AJvYcCVPrVTDWi4vRNclOdhs5bVCYYQqEtJvQgCqDS8rwJHSbR+9vJ1Hkb+TsSUajkjQLtoYxf1IBoxNQBduSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGPP02FId/w/xb3dW1R06Otqb8XrBgnM9c0c5pgqTDuqYulWED
	FbqFb18BorUBkBOXDHdo3WYjeA2mHrj23sf/gNGd6pzEdp1koRntQ4HzOS9KtNI99SAZHPBxDTh
	aEyu/ctUP+v4NTT+1vi36cEeWjho+SNscXQJbCM542KQOrz4MV+WXI+V/4DEk8Ctc
X-Gm-Gg: ASbGncs8Z5aeOOBIxZ7uQp2eHMBQ8zdVS9Kb3iQZHBZYKV3MjJJXk+jK/8d6FZY81uH
	8cw7AcJ5DUpTCiTpRdbqKYL2kZpHo2rgcsdLjoMLHT4TXYH3fHkk3WPdCz6FgX1yKE7orwzJr0t
	7g/e+oLI80y+ClmCy8dIrKm5o7IwopT7gCWZNmFA7JWnFpZFXpYh4NmtWpsAYBRV8Mi5wAIvY/Y
	bRi/7pKjcNA+q2vYHIrcarDHJGl5foF9WTtJ/kLRyf1g1c/NvkVLSXc4oUkfGKzNIYGkG+3q9KQ
	TDEBbwl5JMYI4ro87+XopOALv272meiVXQ7ABqYQWq1TCoeAVp/AiULqYkYLKB1izq37WwzzyMH
	a/Hk=
X-Received: by 2002:a05:620a:4482:b0:7e8:4fef:bfdf with SMTP id af79cd13be357-7e84fefc2camr275378085a.45.1754909788904;
        Mon, 11 Aug 2025 03:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc+TLWI2xokcRtB+yecJngyy21noRPTcC3sO0sgVUYXnKnFuXDagMBjiVXOuloOtpZxIcGpQ==
X-Received: by 2002:a05:620a:4482:b0:7e8:4fef:bfdf with SMTP id af79cd13be357-7e84fefc2camr275371485a.45.1754909788147;
        Mon, 11 Aug 2025 03:56:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:05 -0400
Subject: [PATCH v2 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-1-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1689;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=cxbqZ4pGz5eouMzBVW3NyN413s0i735X+YyBDIP1KBA=;
 b=6DBm6LwfY0nfMA421HhZNkFETdBD0OvYJlukZJUarU0DQPM5TzD76GN5AVvolZqrFAvmrp1nP
 jvbNFGe7dHWC4XgQV+dlyA/bvSpVN7ZZvyR5/1pWXfn+rHkgHaXmtum
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4pr-lD4fE1xkpo6aQXk39UcfsZKIGegxjgSHjhbZC10_1754909789
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index c5629e155d25aef5b43445bc18c6c90039c99974..63f23b821b0be66a8e8a379e1375ffd98552e72f 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -368,17 +368,20 @@ static unsigned long clk_tve_di_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_tve_di_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_tve_di_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	unsigned long div;
 
-	div = *prate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div >= 4)
-		return *prate / 4;
+		req->rate = req->best_parent_rate / 4;
 	else if (div >= 2)
-		return *prate / 2;
-	return *prate;
+		req->rate = req->best_parent_rate / 2;
+	else
+		req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -409,7 +412,7 @@ static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static const struct clk_ops clk_tve_di_ops = {
-	.round_rate = clk_tve_di_round_rate,
+	.determine_rate = clk_tve_di_determine_rate,
 	.set_rate = clk_tve_di_set_rate,
 	.recalc_rate = clk_tve_di_recalc_rate,
 };

-- 
2.50.1

