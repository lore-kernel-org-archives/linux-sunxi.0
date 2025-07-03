Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7B2DECBF
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 23:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584999; cv=none; b=PFowXrmao7KIcE9MhRqa1KPkzEzJrFrecdTyGrZNFrypktYGNP49OsRyrDikR0g+XIbNprMrFyov0+YcUjh69uOkQrk1J0ticxNNCbBA+yuvGCICW6xxPKtdI38a04OWYfmrFvC0QEhip8nH/T6Y4z1nEVh2COkKYUZjPyPIIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584999; c=relaxed/simple;
	bh=JjW2YpRPz+0lPSN1r9ZPq4mBQxxVW0XXtxuqTB96kpo=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=nDxMPZOf2H5IdyktDPbRSAW+u7WVqw6kiWyZ0jIxIDV6ybrLaaMGKdMmSzpyIAhhO+yZQG7za6TSxc55TFhXkSo/IjHX6385TGwSxI+7YtStTqmXPlTZbMZDCkBOTN4AKmxCcqAUuHgrstFZEI6j4WS0vUPwCBMouEmDIF+oHHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OplFvO4Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OplFvO4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
	b=OplFvO4ZSj2UzNogJRGa5TU5WAEbqwA5v37fUMuADvcXNJOQermEJplm2z1afrTEh/smOH
	raIeAWCnAS6WuXtkT+du2LbGhGqQwn0+vHCmMtncXS81dqgftHT525qKLAiJIWuR9siUzc
	w8jyArnOZt7gmMIkE83bWYR2ETs0W5g=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-kH-crHlLP7iEa969jm5uLw-1; Thu, 03 Jul 2025 19:23:13 -0400
X-MC-Unique: kH-crHlLP7iEa969jm5uLw-1
X-Mimecast-MFC-AGG-ID: kH-crHlLP7iEa969jm5uLw_1751584993
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso5073436d6.3
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 16:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584993; x=1752189793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
        b=W3R2TGy2ptb1KOFv8843+5Vs4fkH1w/njSsrMWEK79ASKY35nHncD+kj9iygOdVjdy
         2b0EBjxkoNSlSQsC+tGF1CbHl7jhEpTqA99jtPL6lp9u27m+oejru/1ezO+t0fMFiwfm
         B4qlst/OUSv5bolK3WUqCnkP+EFs7mafIVg5RLwDkhCiAqp3K1gGjvoUC175UBgIG3Mj
         cVgVlKX2J3dNG6BnW96Ea34baY1+epQSzqREdW4/j4E51I4qQ7GFl6yXg9Od7g4qF0It
         6CK/oXWnbPRJ9dN56NonUB8NH6NJweelPlUqjpQ1K4dASsq2+qty5h3/NxgJwys2M2Ic
         G0Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWAeGUISNGcp6oPtFRhBx2BddrpijlmNt3encF51mHYOTS1jqRB7RB4j1XctkHsLZIJHVFSQFQtRs8gMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAl57jIJYto7bE4qbz8jdPls00g79V3KcBVVqk9l+4l+EJtc3D
	aeXY/7GzSWXd2g7AkTAIgOuSNtcIX1Ax84SEjEaIQ2+zz7+LjboI+cU/nlLX0GpvqZ1O1gmAxNT
	oT1DVKQWKzlnJ8bXk7epihaWquDk9EMblhBCl4L42zg7jSbsLPnb9EvA0meQYGahG
X-Gm-Gg: ASbGncu6w6fGqr3hphP6LpyaqVNb9Fnjsfq65FzAQ6sTW698l7w0y3s1ivFE8ZuGwuD
	JeelJCof9VbBgk/MANR7Z+AsJTIEa3VwozR/fm3vp2YGtbfSePhNSObUgB3qjbyskO1EcilEFhV
	7NbVEaKFigDIez1mtp4TgWhbgxSzQXHEdNDgMxKwWFlSeB0ugO7bNDoW0mGytVJQBlv88ybSjFG
	itEY5bIYFCcm1be3Z0HmkIKk8ciNOzbFXcW6pFRlb+9yaKAdnul8JE46X3HEIG+odEPsFiKP3Zj
	KuWb9iruOIszh60G5UORb/sLlavYORv++d0A340RUbPJe7TZdiPgFzxzlx9dAg==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496436d6.44.1751584992861;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI3ipPg2Jg+5GD7hTnCiXfrGoYgoIQ3H/qFVOQMX3H3uHxeS2iTGlz+BWau3PM9f3haP1PQA==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496116d6.44.1751584992485;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:28 -0400
Subject: [PATCH 04/10] clk: qcom: rpmh: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1326;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JjW2YpRPz+0lPSN1r9ZPq4mBQxxVW0XXtxuqTB96kpo=;
 b=zf4/vhBsMxt+TAFqD7aUPTk19Bt+lcfBLX/WML5Wb9wvluceirqF+3xXA/SRJdeeVovfmzXVw
 wjKAv88CuWoAzAa7aZ5FVjlB+6EYYOYea3w9xYISlQIYpuJFVJ7J6Lu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J7piwRieQvF1ad90sBR-5nLiL1X9E5wsAKiB0AoqJko_1751584993
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-rpmh.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..74b052ac1ee10bdeeb59880019fb06ad58db3f74 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -321,10 +321,10 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_rpmh_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_rpmh_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
@@ -339,7 +339,7 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.round_rate	= clk_rpmh_round_rate,
+	.determine_rate = clk_rpmh_determine_rate,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.50.0

