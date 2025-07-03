Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA962DCC11
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 23:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585008; cv=none; b=Dwac513G3/MX2DrjpkQhhKapME3K/pOodvhzN2gkPzWqaPvzf+hwZ7BrOg6tX5XWPOKeaTcM55Ik19vk1XZNXs3xfbpA0s9GnutEgK8y+a4BKRzJotVkUI3iEITttZ3xLo1/3eLvw0IkzKOc2pfqdINK+TpP13ciIPD8yVVLl/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585008; c=relaxed/simple;
	bh=yI2SIQSpfv11yROCqsNTigI0LZL/+DeyReURO7gHFTk=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=D5kFSNOhsSUtrA9uVs0ErBxlu0RfOKfEA40WFgqZUAUg7o09FDrh7dZShHExyzquZaMRzy+hoOtoCacpc0uRpLB4hyySmiLP7NYoT4L+CWYGj5TYdHU7U1RW1pFV2E3yBLHbBlhcnE+bv6x4/jBdYIit+vYwOct93TkWegJXA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DbXU/eT4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DbXU/eT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhDtC2utRaPlDpGhYs17r5vvsrnmu45x3ymT5BDVHJI=;
	b=DbXU/eT4HG3xE8S7TW6n/7EiwP2+rXLAu95+aOQp4SSvkfq7VWKipeX0RXwgvTszcx9xqG
	xIDXtemDO8Hyn7VI2w6SRSrQ8zn4s/kJBNRtQIvzQ4VFPqm92urnuht1HAlX0hfbdG8IMI
	uqvDUZl85JPeEsw7av/cTfH0pu9NjB8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-hgydkveZPHGu9d14xYKBpQ-1; Thu, 03 Jul 2025 19:23:22 -0400
X-MC-Unique: hgydkveZPHGu9d14xYKBpQ-1
X-Mimecast-MFC-AGG-ID: hgydkveZPHGu9d14xYKBpQ_1751585002
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad2a25b65so5064096d6.3
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 16:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585002; x=1752189802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhDtC2utRaPlDpGhYs17r5vvsrnmu45x3ymT5BDVHJI=;
        b=OiidnWPW2KodkEcWwH514/H0ikHecej58vIXoFFpeCSkWfgz9ogqSQRKRAiemZ8SAP
         0lzExNGoPS7lX5ysXqrVewyCL5yHQWrGJO1g3mCdoh2w0jhNRkWMUz2vYnsQxdBkzMXW
         6Fj9Od7xvyhyAK04N55+UcTIPx6aMfwv8ggeL46T4r2bKeaGA5hAQ/fgTC30nGQZDdar
         VzU665uue5ozsjHD62EoCRWuEWArXK2qa0sh7cqwONIfKg2GUPvL0TeZdQ9Y/PxkdXw5
         behnPFS6I8ggY6YVhgwiVrifQBIHuCzRRYNz51CY2TeWc3gACrCZAuCFziqcbGu6NdB8
         JX1g==
X-Forwarded-Encrypted: i=1; AJvYcCVCYUh+r/KpnTAUl7GGDZ5q9A0sfleS1F5UX/vp0tZp+2MhY3nzmG0fIZbtSTq03bQ5sYTPyF7t4v5KWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7o3446Vh6lEoA8TjvMeJw8mvhxMsvIPXJJ3HJOkkMX8IHXmH/
	TVa9saiodqlLyVw2wZuX+liUrDirfEyYoNHeTiU4fvlqTmNqKbE2poCRsL/NCrbqsOyBRia0fn6
	i8lCQ9n2v/NhujPQlbowM0kncZMt66fy32MlF0eolpEBusYRKn8Jpp2jvGZ/aCDyN
X-Gm-Gg: ASbGncueGL7Gvq0yDJ+eYxRFPBkrljJxgWDYDAhuXXaPY4MyCXYVzZ/+eCum0QO3ZSC
	ElcGlDsNW1OMo/W58HiBc0huaCJHiyE2/70MsJAhTRW2VAVVU7/o7o2KH7/b7DtVbMdkWltVczg
	o0CJTx5jKp3G/jSIsbBMbdUUfLuvFCuYEXOFQ4zOSa4nSEnZNaUrduJoAPhPQKUaTw5bzUylXpI
	r09I8OkqDPopcQ2jzZFcLQdz0rxUYWNw6iDUd8LsWl+uLKqQxz3TpocmOTaZey2I5gLrTYY7Ho/
	6tv4wte5h4As34sYK8JL52gDJgaaLXbUnm5fFyTGr0eRWikDqAuFNINiJ+8C7w==
X-Received: by 2002:a05:6214:5191:b0:6fb:59de:f8ab with SMTP id 6a1803df08f44-702c6d46e71mr3912736d6.10.1751585002084;
        Thu, 03 Jul 2025 16:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz3rcs3pEbfi+i10yC2fv924P24DnAprgiwcA1Xos8lcGEnsQWq4OIG7/Hd2meAunlCE03sA==
X-Received: by 2002:a05:6214:5191:b0:6fb:59de:f8ab with SMTP id 6a1803df08f44-702c6d46e71mr3912326d6.10.1751585001708;
        Thu, 03 Jul 2025 16:23:21 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:31 -0400
Subject: [PATCH 07/10] clk: sunxi-ng: ccu_gate: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-7-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1958;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=yI2SIQSpfv11yROCqsNTigI0LZL/+DeyReURO7gHFTk=;
 b=FBh/28zlwskIaAbPO2b+tu7E0IGz0egaTdlYzpasdj3/eWmqI5c+jiwwjhb0UWS08yNR6Uiei
 jR4ac0pocwYBwf2SDC9OhHItWpS1RcSUFKjbL5CgqDeWzQZ8d1jP7ws
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZxNlUd3SheGQQxfrVPiRviq5hRo3ao6mOeuZWcLOP9I_1751585002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_gate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index 474a9e8831f87ffcec7712c14ecb55b8523f05a6..30673fe4e3c2cd2c86f94a21929b144ba4cf01fe 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -91,8 +91,8 @@ static unsigned long ccu_gate_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_gate_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int ccu_gate_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct ccu_gate *cg = hw_to_ccu_gate(hw);
 	int div = 1;
@@ -101,14 +101,16 @@ static long ccu_gate_round_rate(struct clk_hw *hw, unsigned long rate,
 		div = cg->common.prediv;
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		unsigned long best_parent = rate;
+		unsigned long best_parent = req->rate;
 
 		if (cg->common.features & CCU_FEATURE_ALL_PREDIV)
 			best_parent *= div;
-		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+		req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 	}
 
-	return *prate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static int ccu_gate_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -127,7 +129,7 @@ const struct clk_ops ccu_gate_ops = {
 	.disable	= ccu_gate_disable,
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
-	.round_rate	= ccu_gate_round_rate,
+	.determine_rate = ccu_gate_determine_rate,
 	.set_rate	= ccu_gate_set_rate,
 	.recalc_rate	= ccu_gate_recalc_rate,
 };

-- 
2.50.0

