Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A922D94B7
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 23:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584993; cv=none; b=Ovbaouv4DkhM6oiCiJN0HxuXvpeYFboibKRuAGoCXzHzHIjQhfLczba+X0BJGor0PX8Jvd9uXVshKk8qF06MskaWQ1trT0dmCQjjn8nQQaOtLP0x9t9f7tMl7WUTX9kUKX+yscxos2jitwVo4c5/vFTzdQJNnMGUG09/+gb7sTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584993; c=relaxed/simple;
	bh=1SBXkivgAIQT/xpKmW16GCKl6DQTPvDdkzKcxCMxAeE=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=IWWSH7WkNG+VxUqeDhJzbZnKjt7amM0e4jPKe6r+LQ8rzbrGDr6IuzWFnv60Id2DsyNJUcUtt67zjr+Udu9irwdbWETVhC3VuXAVcGGxcWCS1r6o00a6NAWw4f/rUPiukP636xRvEyGk9i6TmvSIizu7o4JX80gBqEoW2bSiarc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V25hirfC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V25hirfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glmhRhvorqftCM1PQW39H91YcYQ1dirxkl9GgHITt1M=;
	b=V25hirfCgliR+65dJdUqaIGbrg3TIcCU6qYlL1l2GpfLaYHtOYbtWCHfMEJHi+Gp8JXFCs
	R6pSqTepyNadWoatWBSD40XSoyejrSHVoHCQpNV6prFnUhMmxjGatnTWL2Ust6rr8PqhKv
	Be7/2fGkVno7+NgaPCEjuLY717wZ+Yk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-3bUF5J3KO8OtwTb5SbiXFg-1; Thu, 03 Jul 2025 19:23:06 -0400
X-MC-Unique: 3bUF5J3KO8OtwTb5SbiXFg-1
X-Mimecast-MFC-AGG-ID: 3bUF5J3KO8OtwTb5SbiXFg_1751584986
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5664c771so9139656d6.0
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 16:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584986; x=1752189786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glmhRhvorqftCM1PQW39H91YcYQ1dirxkl9GgHITt1M=;
        b=FkhACeB2Q8vPbF0awEF/lIQlb+L7WeuslN2SH6phNYVk4RU1DpozdKFswxodUt4RSF
         IqjWX9aQxJyxjPEZwzRUgkMdbwkrKvBse53r3EMk0cJrpIrW8tJEyYbEE0vAupQQdMkU
         LoSUq5QEI+9+vXd6cSC5d5fHyrN1tjd0n7EyRfnwlVGmI2iXsiLqj5xqqwWkrVwj8dhe
         SGMiMGRLhjOskUeslYm1VlOs27XgR53ScTuW4Qem1Y7BGmDPPLuhSlCA0clwhGIJHlKI
         OErRLhSc/3APFLi0wLWcnHh/YZ87K7bco0jrLOJGlw+gedKCnE3pq0KQesSQjs0ucgc/
         vJGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXiasXcUlUU1MqRV56dYg07yaB4dayEOCbGJOxgN8MyBlKyyOfhbhYHGP094xPxZtE2w/5XVFUpAguGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyElc+WRRKigS45XMIAm5oc7r4wOUwav3FE2KQFsCwU6NxIiHsL
	+71M4rkLf+5i/cSY6zDo7dy5/afF7hgIr6rPGsbQ9gysj+RRqYrLFjJVSVCrBlM9wPMu2J0wnxN
	26msMeScnWOIJWVBiFZWfAcemA/koJw1qoHXIUrhCqI1Iizj8beEZdgDedDiIivWx
X-Gm-Gg: ASbGncsyMvyM5ecYYgUpR/C0PTswy2NvEhN/9cFsgxuTMbLEgWHOmkXE0rK/0gFTzwy
	pJ59uvS8Uf0SxYLMhOd0CG6MbCBZOqDHLQQVA7yu2nXBdZ7/EKpaPfjKzga+RZ4mLftoK5ZSoHN
	FOCJ9JJ5D8CEDDUj1CZTBy8q/ThXkqF1LwBxpjzNo+bMMGDWMyH4gJN867KzcR/9cFHE7t2UiUH
	6ZkxontfnPCOMjSSW3/HiZ2IYz3RE9tqvcSlcegv8qYp2U/vuGHltnkZXxGA7PaRi8fcQmURCWz
	cOk2fqDY6kMta2z8LXapTPe1Hn1A+d+mfBeHpMcX2xZy0hGlWx82DeWhCUZ/Rg==
X-Received: by 2002:a05:6214:2dca:b0:6fb:5f1d:bf8c with SMTP id 6a1803df08f44-702c6d01136mr4001146d6.11.1751584986102;
        Thu, 03 Jul 2025 16:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXulxd6EhHQEWqdLCkq6bowgpk9H5xc/2E0qAWrXV2cw9IMvYCQaGyeK1vlKk4+HCoD7JcAA==
X-Received: by 2002:a05:6214:2dca:b0:6fb:5f1d:bf8c with SMTP id 6a1803df08f44-702c6d01136mr4000676d6.11.1751584985738;
        Thu, 03 Jul 2025 16:23:05 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:26 -0400
Subject: [PATCH 02/10] clk: qcom: gcc-ipq4019: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-2-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1744;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=1SBXkivgAIQT/xpKmW16GCKl6DQTPvDdkzKcxCMxAeE=;
 b=F0GhFYifg67W61nanNKHwHfKd+yXvRKHNLyjxttEwNvS+4WIggMD8oWPnfPgFZE6hEmZ1fiIO
 n/Dix9ZjUe/BuSWXFyFuVK1zEaIQUGKOyn0QrOGVaTFUnEWIHOKyt1n
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2mGMkls1DacPM40qO7BFBfhp-IGf27gWObDqedxrubA_1751584986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/gcc-ipq4019.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index d38628b5226898b6a556a1fe16806cb79c4735da..5ac44cfb53ce023c0668afdcb67de636f3319197 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -125,21 +125,23 @@ static const struct clk_fepll_vco gcc_fepll_vco = {
  * It looks up the frequency table and returns the next higher frequency
  * supported in hardware.
  */
-static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *p_rate)
+static int clk_cpu_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct clk_fepll *pll = to_clk_fepll(hw);
 	struct clk_hw *p_hw;
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(pll->freq_tbl, rate);
+	f = qcom_find_freq(pll->freq_tbl, req->rate);
 	if (!f)
 		return -EINVAL;
 
 	p_hw = clk_hw_get_parent_by_index(hw, f->src);
-	*p_rate = clk_hw_get_rate(p_hw);
+	req->best_parent_rate = clk_hw_get_rate(p_hw);
+
+	req->rate = f->freq;
 
-	return f->freq;
+	return 0;
 };
 
 /*
@@ -205,7 +207,7 @@ clk_cpu_div_recalc_rate(struct clk_hw *hw,
 };
 
 static const struct clk_ops clk_regmap_cpu_div_ops = {
-	.round_rate = clk_cpu_div_round_rate,
+	.determine_rate = clk_cpu_div_determine_rate,
 	.set_rate = clk_cpu_div_set_rate,
 	.recalc_rate = clk_cpu_div_recalc_rate,
 };

-- 
2.50.0

