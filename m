Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B777D2F0E28
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169406; cv=none; b=Mdc1klNSeC38TcnSAmjT+aNQFlhWeVgc7DCctZ7zAE7L5aJoHWt/FIC9NvAasSel2Nj59ruMgoPqN7NrFy/CqOfuBUMYRD6G5WrqD/ZACwp+JI/p3pyo5LnF9dQgqCbWvU994jLTtIGI3Tc7vF3wlRmvaPr5jWcb82KLaz6j6KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169406; c=relaxed/simple;
	bh=JMQuzI07hiKrV1ATnFggAmht1J6rMxSCqpxpi2ExgQM=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=tq/nudtiHwv/nxtEFIaf8vjrpCqFllSGNA76ChF8op65a8vn+S+/sfdZIb58Yf/p2Lcr7Yht57uGvZjTiwX4RrtFaDd17qwJeJ8f9KbTE+/lBHKNAnOvueVWO4ahakzxQ+WQaoqIGY6ToqWoWp8pYsmRYzHfBU7eNRtW37jDQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IdeP9z59; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdeP9z59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
	b=IdeP9z59Mn3OgGRoZbhieLj2FnqngFyTrM/WD/a4I8HRtu84LX2CmBkFsYeVwMp2aJZRmI
	+luLJMSBS7/4fC+29zTjGNBd7Km4ITjd8Nxu+ZII+98TOVtxCv1D+VcPNdvX3DCY9IUfkR
	Hqz6LfYcE2KJbsW+DgrHmRxoqHE1qhM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-8lVXd2kQPIOSmJnMwQIiPA-1; Thu, 10 Jul 2025 13:43:22 -0400
X-MC-Unique: 8lVXd2kQPIOSmJnMwQIiPA-1
X-Mimecast-MFC-AGG-ID: 8lVXd2kQPIOSmJnMwQIiPA_1752169402
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d446ce0548so196523785a.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 10:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169401; x=1752774201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
        b=i4gF8vj/QzNWDVsjp1JyjO8nbrGysVJVCaoMH62p5Nx7ZPqd+RzEt4g6zMTnx4brBE
         RhJY4gJmbODkBfwMUf60gJMyfoF/SVOQKs1VArQH/TYHTsad8OExTXXMmM40JsJmbUOV
         GUyKCdqMHpIqRAWhEz9dZGIB4PONl0zSA3ikTCPllPu1LFQClcDFPkrBJpdiC7qU1Ofd
         D+1wZwkvb5gXRri+NdZ1fYVYYOBiYlHQx6no/qq7KQcSGoELQFMyHd2nYXPcgx/vPx7u
         syTiv1zD/G3g9EO3QYQaxriwk3hkMdTh72e8CUTYGriDzArDcwGU0Ksl2E/zrO30lviz
         /ezQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaDS6YRDFjbtWDjPkqQKbL8q5GCpAxo2ATV0Q8aMUDvxzjBMRISfIzRRrBIIvAnatUmeAYyiJ83cCVgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4ll35n6WvNnRUKgpArBOhh+OCo5EEO2NAnZrTNcVNJkXnemuz
	w+MKo/ZvZqNImTrqGajmSZC9FoxhDckGO2N6KqyHRy4MS86sUO8Lgdrt40v2ZIvjI9T++pR37ES
	+o3k59rOaZ00oaL/6fnBcZnOPDYwfHXjkN0LGThhSgRtgkhnVJDKNSZY4T9+5ywIP9aEWWiBpI9
	G2IMxAwv3DL80KHQB8QjoCIvwG7S7z5jDt8bp3eERQXQArU/upfA==
X-Gm-Gg: ASbGnct+zhqGT2gSFCo1IFAB8QRmi29WNbF9szBLMvGg7iln4+mxfTXWilhP6lizdr6
	QKPiomT34IckW9Ip5QPD23THfdcP5PuMHnVrIcyriYEuCGmqi95vA9DWgzA2V7r6KkccBcexqV3
	rW4pBWGkuhqaPL/4PdsrjZwncIISWCH4RX+gdJmeJqU5NcmVm1JQ8xRj2JeiQW0ikNJuGYnNng1
	rMdBtPT2KEzPnBCYcPHR9D/29lUt14hvhnXA2tz4m0xpGO/MDMTc4xKQPI4p00o4SmrFRm2Tw1g
	qTlWcB1WCJK6ty9OW040rQZjWuPvpoVWdpSItLua8B2ShwM6RsuODRqe/Ch8
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id 6a1803df08f44-704a40f3f86mr2464966d6.16.1752169400981;
        Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGneFeZHD+R2IlA/RJ8povEc4F9IjcKH8Fgp0p4dCYgtfr/rKSizrHDLTlvLp9E8FfSRTeZdQ==
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id 6a1803df08f44-704a40f3f86mr2464046d6.16.1752169400264;
        Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:02 -0400
Subject: [PATCH 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-1-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1689;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JMQuzI07hiKrV1ATnFggAmht1J6rMxSCqpxpi2ExgQM=;
 b=2cWi9RxWr4DG/uT+Adfe1rLsJLWqf/HsK4V1CHvsD1HqS0tzYLionTpIhnP/uRurPd7gfFmll
 2lm+LwJba1xA78TVoaKVn+hJWZX7dEn9fhckaPz4uGeZs+gsOpWRugK
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _tuPFJKB0HTh56ab1arCMYhnLlK_4tp5XSztDpc_9cE_1752169402
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
2.50.0

