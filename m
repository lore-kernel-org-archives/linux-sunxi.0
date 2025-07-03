Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490742DBF45
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 23:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584989; cv=none; b=g15nMhMYkaYEy2+9hc8SUXWb8DHznfTA2G66gPl6UATdmt5eJy4ROXE5nHjK3IugeEuP/gCYZIAcVykoaNP4Egv8wbi6CUebD8NPDFVLbEB0TUO2nWqZ8yOyNVO5ru8qysGGHPUpKllcOeBesFg0joligTJauDphaXDnNftgsPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584989; c=relaxed/simple;
	bh=bUDrRrVU7cuzvOkq/BXSXRrTOJz73kF5fGj8HK4w53E=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=VBIEc0qkC8qmiAVfAdFSi6nKn0cPpLZtxzj6NP3iWbqavXgvi1eA5YvkHCU+bS+fUIpQbANaNjnJndzG/ACU5/hWvwsrG+WPFHUQ1PdGatffIBCgTUfQB9fcroFc9Obr0s+PEWhYkHOBpK0yv9yeJSUOqF44tya6IBPuL6e+9nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gk1cZV0G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gk1cZV0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zb0t+bPuMy487CsPpINgg8YqC+3JQLKvQYW9mEqLvWM=;
	b=Gk1cZV0GikT/ki7nTyJCDn9BMAugT5HYGd6YZ9XWPaeUmAAC6i6CiS+qMe1PWhTJlVg4bW
	uNidOneClAPnq0Nzdtu346Iz6j5fbIvRMAz7+BeJAuBQpiy7VCkI6pV13lpRVmKZcaammc
	rWHv2C7x2N2JA/cMU460Ph/OH0tH7GQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-_Ev4-irIPqa2OotRsf2iRA-1; Thu, 03 Jul 2025 19:23:04 -0400
X-MC-Unique: _Ev4-irIPqa2OotRsf2iRA-1
X-Mimecast-MFC-AGG-ID: _Ev4-irIPqa2OotRsf2iRA_1751584983
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-702b5e87d98so6208866d6.0
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 16:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584983; x=1752189783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zb0t+bPuMy487CsPpINgg8YqC+3JQLKvQYW9mEqLvWM=;
        b=VwWb3Nn5ykfvWA3NdbBD8jehfn21i/uxEpb1+2koHpLeBFMJo/cwW2LVzBV3mfQ377
         dP9FXMqmjzIWYtdBx//FiUvZQvi7oktKRO0Xed1Xwdc9noA+eqC9J0g8vdHRMw2kn51+
         2SGSvOyNndqXUNlXXZEKSlYfqEVheyU4GcQKYYimyTigK2Ay4hp8JBB3sxZ06f3sMfm3
         rpMavgtZRbGdf54pEw/oXruDSCe0tp9TTi4A4OQOjnT4XWuENuRF5yKRMqaviu7SStO5
         WxPJv6IKpF4H3xzj3+6qCR3etgunbcsgb6UmD3p+fngoGT0/5aXx7T5HSDHSnf5+hIgI
         3MrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/S9cQXPeQKW8IsCK4qBRDQwgk5YVigqTCLj+McerQwEA7obSCklzqsso9T8HSgEZBEGr4QywQAvu05Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+QgW4BofpuBCBBedoBOp5BcvN7LO5VVedupZoVPPzS+HmWdOm
	iq1gxGfW1EjPU9gyf4Zg5N5vzWsIPDZzQdWHAzjcFIFC2Ns+E0Nuucvre0eyHXaA3YzLYZXv0ju
	+rXRAstCn766LztCVoGlY9bIVmNwPY4n2FTld/pCpq2bCZ0/bKN2lFV1Q/C+WAbk3
X-Gm-Gg: ASbGncv5Q6isNJOp5iErEw784QkYrduEJ1qafxGqpCCobGbPy8UO+D8a9fAcYnrO8tP
	9SvJPKhUSFRc9ezZyTAABS6i2+0oWutRCHGXBOuOP+77zIZeDDU1RDiJOd53123VJYPCuxFJHg2
	z3RU1ji+J5pHw3+SLG/gry46SGqyD6iXQ81R3+Qw1iCEBR3xeM3aX4CR/Wnzn6NXlDggrxJVMbC
	zoloV+lLOr7tkWVvsE6Pk3JcC3J8bsWSVrT/9SuludldeOChoPByMZWltoJvwUX8/EW/u2lXIxs
	nYk5z2GOjqyuzjYDKDo3CnB3wnl6z2s+e1trzFbsKdEMKL73X9JpkW0/U0w5uQ==
X-Received: by 2002:a05:6214:4109:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702c6dbd1d7mr2610046d6.43.1751584983558;
        Thu, 03 Jul 2025 16:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyxhZnZ049hC67seKLZMmTesEshAPctloMTDGwamaQuOlXGGQBJwFhr4CP+VGmOImhVXHj5g==
X-Received: by 2002:a05:6214:4109:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702c6dbd1d7mr2609726d6.43.1751584983157;
        Thu, 03 Jul 2025 16:23:03 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:25 -0400
Subject: [PATCH 01/10] clk: bcm: bcm2835: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1979;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=bUDrRrVU7cuzvOkq/BXSXRrTOJz73kF5fGj8HK4w53E=;
 b=xUB+8pQNqSYfMSMKtJ+gOj0YuRr7Wv56SqgY0gPYScWgdV1HkGtTwLwdx9iGFlUExmLZuwyku
 mHoKvxPW2vyDCFHfBUgtY5dZ7pH4PFh8nPq0RUUJZ7MoCOhvyogjc9p
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CMWiaQZ-LKWXDIkvvft6F639sM6xmBl9_w2ghiVbp3Q_1751584983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/bcm/clk-bcm2835.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index fb04734afc806286b6a68996f36bd8a49b542cc8..5e7788406de39c94884cbc3aa162c378443322c0 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -570,18 +570,23 @@ static long bcm2835_pll_rate_from_divisors(unsigned long parent_rate,
 	return rate >> A2W_PLL_FRAC_BITS;
 }
 
-static long bcm2835_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int bcm2835_pll_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct bcm2835_pll *pll = container_of(hw, struct bcm2835_pll, hw);
 	const struct bcm2835_pll_data *data = pll->data;
 	u32 ndiv, fdiv;
 
-	rate = clamp(rate, data->min_rate, data->max_rate);
+	req->rate = clamp(req->rate, data->min_rate, data->max_rate);
 
-	bcm2835_pll_choose_ndiv_and_fdiv(rate, *parent_rate, &ndiv, &fdiv);
+	bcm2835_pll_choose_ndiv_and_fdiv(req->rate, req->best_parent_rate,
+					 &ndiv, &fdiv);
 
-	return bcm2835_pll_rate_from_divisors(*parent_rate, ndiv, fdiv, 1);
+	req->rate = bcm2835_pll_rate_from_divisors(req->best_parent_rate,
+						   ndiv, fdiv,
+						   1);
+
+	return 0;
 }
 
 static unsigned long bcm2835_pll_get_rate(struct clk_hw *hw,
@@ -783,7 +788,7 @@ static const struct clk_ops bcm2835_pll_clk_ops = {
 	.unprepare = bcm2835_pll_off,
 	.recalc_rate = bcm2835_pll_get_rate,
 	.set_rate = bcm2835_pll_set_rate,
-	.round_rate = bcm2835_pll_round_rate,
+	.determine_rate = bcm2835_pll_determine_rate,
 	.debug_init = bcm2835_pll_debug_init,
 };
 

-- 
2.50.0

