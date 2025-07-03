Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386062DFA5A
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585001; cv=none; b=a56DKfXygtQI466wP1AnDlORw4YPKmRuoFnMXK4z+rk/4Q6GQpT21qBmFz/gepk7/PlEiW/ntLKFBhIe0NOsFJf0lV8O+EkRXxLCKFmIFdo4LAqENW5RHbZXDx2n51DWX0rnHzLOTBhexdkfPqJehyCn/JiNbOakDqpcYQxF0sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585001; c=relaxed/simple;
	bh=jJkTWWJF3/5RXKxSt11n2asRYUE42Jhyt7x72H7Kcqg=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=UgCfU4gsBkv4+XctufuhifeW9B4cVRRa3mjfgN7XAzkpYp+ydH2EMKonTSIflISTeYqjffl3jiyOSQoJ4xoE091VW0e1SRTP8L3BUmc+CdH//gTnGZStCt12V6Ub7lDFU7zv/lT9eymFLjglSMk4nIevETbL0tcndPp9oCZrXmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3ZnMapY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3ZnMapY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kG8RA2RMN+WwY2ubKngIBCBT47zo9cYuBqM+5cnEdCI=;
	b=A3ZnMapYgGhv9SkS1q8QAuUAtbL5OqJSzwOHl2iC7D5+dE5UKon8bvNvV0Gbbbe2vd1a4c
	mW4jIg/J63cAnQxtlHpJR0atHytJWDedWwNQh8ABcWdhNU6FCW0J66+X/ndPr5WEmOebi7
	G31+Z4wkIjMEz7ok6cFSpaKEpX3Eebk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-rW7Tujh5NzCJtpdWI6hqqQ-1; Thu, 03 Jul 2025 19:23:16 -0400
X-MC-Unique: rW7Tujh5NzCJtpdWI6hqqQ-1
X-Mimecast-MFC-AGG-ID: rW7Tujh5NzCJtpdWI6hqqQ_1751584996
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabb9286f9so6594496d6.1
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 16:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584996; x=1752189796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG8RA2RMN+WwY2ubKngIBCBT47zo9cYuBqM+5cnEdCI=;
        b=QWCxiJs7HRe3ZUpq+tKbJ8Hcxq8s8xtZmf6J63x1rAqGJDDgle5knX6kPIPLu03zeQ
         OSa3hDKhMXrjOCADpIP5dHE23NJxwk7jcsz66n/G5Q1x4M1RVBH5ZqwTykEMZxSXKMt2
         mbk0uFDPRpa1rD6jkdRU0tggch2njv+XpNJMTvZdnImEPMnRtaC3Tl7LwwdwbEhvjNwy
         h5H7GETNttfwSu7YMSWciDUaM2rOS0t9WmCCNBrvxxfdxnhRZlKE37CdYQwZMHyvafX/
         0gx3YfO19A4dhxqa7TiYTksXJPH940on//x7u1v12KuPGS9lJZYm9kIJLf0TgpQE59PV
         Zkew==
X-Forwarded-Encrypted: i=1; AJvYcCVWpGEXNUlKudrW4P8eocPrizfDiFE/qqDdB2UOmhUK1ACKJQiv2I/4vA798mUzQ884JdNXwHBYmBGkjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwF4Yay9Pq2itEkoHBTi3nWWsnivmlelUgzGpBzP/O2UVGhG8Au
	7Lr9Txku+HzUPrgYaXufKMznLLvQlbfm3SvLLQqalnxmbcLFvhYMUmIJGkguYEiVTvPcUc/liN3
	rmnCZPn9sHQjRZttuEKr8y+sqQ5hUz4CTS1PYZcNbUJkZWqfP8ThNHvEmHsrQgUWr
X-Gm-Gg: ASbGnctzmbSsJvFL6zTRczIjGBGxK3ZN3Zsk/i1P3kmZmQ9ufcEfldH7FzOo27Eadou
	ek+myqpDPYTXsTfu9PpJ3LvoAq5JysfZ/bZBcGfIrplbwRJ4a82nuZCjdubj+NmEMRFlkZg/dfD
	zdjyMRADiJD2hjFP5hHg0/Dwqmdq2fJB3zdq4JBcw00fH62gtyj/mEVxtW/2xTseA/6vaOPUdkU
	+POIYy63ULQ2ZaTZ1CH/WKZ6fZkjosO23LzvWalSEECJnryyTSlIcNwfhyd7l+qW6c+ADVHVgHd
	o68SCKM6U+QFLL2kFrGz7Vv/GKMNOp6PxerZx+5WfiSge5Gngp+6D2KSYAb0zQ==
X-Received: by 2002:ad4:5ba5:0:b0:702:c123:da1c with SMTP id 6a1803df08f44-702c6d5a1bfmr3133316d6.18.1751584995740;
        Thu, 03 Jul 2025 16:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYU49F29nXLLJhUF6aQEdxZXPH42Yhu1DTnmyZaul5HXNd1rIQI+KPYemKNRW8NflwAqOr4g==
X-Received: by 2002:ad4:5ba5:0:b0:702:c123:da1c with SMTP id 6a1803df08f44-702c6d5a1bfmr3132936d6.18.1751584995402;
        Thu, 03 Jul 2025 16:23:15 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:29 -0400
Subject: [PATCH 05/10] clk: qcom: smd-rpm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jJkTWWJF3/5RXKxSt11n2asRYUE42Jhyt7x72H7Kcqg=;
 b=WVf99xpXURqHDMOlRG1isIsZmcxQ2hVzruPLXEZLBIO4b3rIoDFPUB+65Us88g7XSb6xd555r
 vRtnzyNPfgpB/pkwsRXhEbFCMwp6sgfC61aI01PDavIaz23Jb23DZ8c
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fXFLF5CFJebYibr-3YfDecy0vUcewREOO4KwNB3kI7s_1751584996
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 3fbaa646286f284da12b902873b079863a2c0d77..3bf6df3884a542e7be572f2319990c2bfa7bc642 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -370,15 +370,15 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_smd_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	/*
 	 * RPM handles rate rounding and we don't have a way to
 	 * know what the rate will be, so just return whatever
 	 * rate is requested.
 	 */
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
@@ -427,7 +427,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.round_rate	= clk_smd_rpm_round_rate,
+	.determine_rate = clk_smd_rpm_determine_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.50.0

