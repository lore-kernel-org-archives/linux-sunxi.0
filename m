Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B062E0405
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 23:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585004; cv=none; b=dOpY8V0j0ZhrFsLrN78Q6J4k5H1o4MoIwhS1JL/loaC3nPo1GHtrOR+vs0qa8/XNqzTI4kJ+lqG7e3+owaAJ3YjR6xf8roFkVXq08o8gqca9A2hAxi1MkXAYBq/TZ0ZnOnxQxgod6F5YchYCL6Rilqs74POA4o51eGm0yw3saOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585004; c=relaxed/simple;
	bh=df3heNetVnGAakoOY8ifFlNFJTyILwhXaXx3zST6UYs=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Hz3AJt/lhIymzEiqJLQRNBWhgJ53cbaOYIP4tJiXuU1+sixY//JQCqVjfAi95DH6Y4eRRajspqM4eTQkjbPvJpg4O7fPg5eO1ahyZcPX0kcmz90hXoY9h4SL0yR7uCOSy+SuyUkYNtR7zpnzpQAcjhE+ZQewXzLg2YYdSfAEFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BVFprSSg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BVFprSSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
	b=BVFprSSgPvldXU6Nz1NYJOTPIbcvLXlcLH/gahJKzhvUsSveAwnPNNLgSegN3DyHDIx9Z4
	pVrzIW/+dllsDUnzZYfKem7LpreD0Z8CNdT1VFPW53iwAVnUlrQYo4kTxlAv4qj1gVh6gb
	4Qo2wwZh9LYAJx9gKrn2bMgC8QD0NKA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-I881JXCiNhapQMy3sGA3XA-1; Thu, 03 Jul 2025 19:23:19 -0400
X-MC-Unique: I881JXCiNhapQMy3sGA3XA-1
X-Mimecast-MFC-AGG-ID: I881JXCiNhapQMy3sGA3XA_1751584999
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad9167e4cso8215266d6.1
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 16:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584999; x=1752189799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
        b=SET0AOEYIY+qz1rk2Zg5cmZowzYlMnl2ou0bkAtuM5Y7nXt3eoXvLbxXBsuGYqnRBL
         OSIvxJy5lHf4Tz+gu1Q3z8Rk4iuHKwNdNO4LUJ4NgToVQQHZB8pu9BnB9AFCakc+OQAb
         IEnDuAzn8+JplnRAu0N7IO+owdm/Aql+l7cEDGtzElfKsSzngLGwm6FTSmoe2+19hBrb
         ojO1SaxElIl8eNet2axu9RNL99hwT99IvZt2PRtfXXzP+O9soG4RdgMmOzstii+UULEK
         8b4VnsrLgQ+xsCO5wmZXl2HEDXX9Z4lQnNYGKUG1Iw7PBhK8+O2zs8ZeAV11FhIDAxYH
         YosQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM+r6iUeOogj/rAvN2O38MNPS9Y/zelOpYqnyJxJxOU0FwJGKiShV6UcwKcm0Cib1sHzphUFwTnluPPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhOxtBhLAaZw8NpKeNx3tnsx3an6MyNYVeMnicUQDQkXEPsHcV
	DAeM6cQvFLg+FCtwFp6Eb0J243gIt8+/peCFqpoS8ahUfo2ClpgEFTQhd6sI7FsQ1yEKkJIZQFg
	VLe/gLWXejDwjsfyzPQuCCxi9KGADkgYjQiGeFJJmk5lDXYSUNZg6Avox0UWhOyEI
X-Gm-Gg: ASbGncsg84hYoa8KtEMETerlx9Gm5fAsy4nrPRz73iFnHLFs/eaBE6sEfdzcQWk0a+x
	5Uqpbt/DeVziBO18/3px4k0pyRkFjUElRGlFCM4i5r6gqYuMB8c+mcsMXSNIUrsV80Pv9XvismL
	Jlu0FtaqK5Op/9pNC6IYW65BT8evvoht0VSxCBdBB+uP5sa7444vL/VNhCt8/3En6iPf8h33lsS
	2S8S905GGp0M9WLJIM2RjDta0wcAWGQNM07nxLJE+VCIceomMeB/GnPxDolrxa8vAzBuxgKfNR7
	R0g1twI1ik5iy8G4iOTXLdXoCivDd55tGK1h0fxxw6/Hu0w2nWcgPb7dOxgH+w==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642606d6.10.1751584999100;
        Thu, 03 Jul 2025 16:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnyRBtsxkt1pYtkVxxPc81mM4Wpf/ySmYd6WAtzuN8xInUs5YM90SqZ5QPpGic7Y9Pfr/12A==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642196d6.10.1751584998794;
        Thu, 03 Jul 2025 16:23:18 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:30 -0400
Subject: [PATCH 06/10] clk: qcom: spmi-pmic-div: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1685;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=df3heNetVnGAakoOY8ifFlNFJTyILwhXaXx3zST6UYs=;
 b=OFYVeMjBJG2jV2b1stxmQ5G0DPbn/iCRgth0RbTQpfPDnrwu1D4KE8bJib4qFP4WVG1I+0SfP
 A2XeBkjrP1YDSfU9lpFAunaG90ILx4mHMpjg4d3zzXSpuGBMZWLMybv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rkz6qgg9HYKi26xskmUnqexsH4V211spu4FDZ_fdkVw_1751584999
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index 41a0a4f3b4fb316827365a522079dcd99630c49f..3e2ac6745325a1e0a30a4587d27f14d93011a225 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -112,16 +112,18 @@ static void clk_spmi_pmic_div_disable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&clkdiv->lock, flags);
 }
 
-static long clk_spmi_pmic_div_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *parent_rate)
+static int clk_spmi_pmic_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	unsigned int div, div_factor;
 
-	div = DIV_ROUND_UP(*parent_rate, rate);
+	div = DIV_ROUND_UP(req->best_parent_rate, req->rate);
 	div_factor = div_to_div_factor(div);
 	div = div_factor_to_div(div_factor);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static unsigned long
@@ -169,7 +171,7 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
 	.disable = clk_spmi_pmic_div_disable,
 	.set_rate = clk_spmi_pmic_div_set_rate,
 	.recalc_rate = clk_spmi_pmic_div_recalc_rate,
-	.round_rate = clk_spmi_pmic_div_round_rate,
+	.determine_rate = clk_spmi_pmic_div_determine_rate,
 };
 
 struct spmi_pmic_div_clk_cc {

-- 
2.50.0

