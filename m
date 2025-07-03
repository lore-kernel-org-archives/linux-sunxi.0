Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AAE2DCF6B
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584994; cv=none; b=M8M1M5/rcPZ0depABZJYN09+KEczSOu/pEExetWEBolZKVD5hL3aKr2TgI8lMKBIDth3Q211aQmMEI73nLTA6HJwd0rBvxTIyK4jDnpqqW/jkwHn15VkZU09z/TLJHege0RnkG1/bqaWupSI9NnhfmCbwxcAZNcMJddXs3ZYvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584994; c=relaxed/simple;
	bh=xV38q5FTl0giHcO6B1fUUKKklwS+ypfUiAE8QJ9ufs0=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=d6XzqpGD4QuFhDOE7IQMZsQW2hJ1GsqqolSj+9z1HnB0+d7Jdd6wIAT65RXTseMsKtqjdT3oqP/x/BknXJVcASqWYoRzSMjydhCG7ajwKRSxuBX1/FycN03uWKriK9Bd8zoNKnbryarTx1xpLik1BgYoNgWsbxBPfJ19H9T5ACg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gUby+oWj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gUby+oWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1AzaXolkpwLeUXX6Tltm5nUeMgctbaGRt9VbQb3Als4=;
	b=gUby+oWjPqW/5/Nq30l4jEALNJ2TX90Xy4/7IsN470d3ATBztVaBTPLkq9xagsYEO5aoqL
	0wTdk10kr+mi+aY0+LD8y5EsP4Z5cA8uBfbl0cENe22kjQAycVc6on2kVycPbpBhukI/7n
	+tGr9Li9RCOBa2Gy0IL7Uw2a3MwvFOg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-GwZDHq_7NzeUqes0cxlAfQ-1; Thu, 03 Jul 2025 19:23:09 -0400
X-MC-Unique: GwZDHq_7NzeUqes0cxlAfQ-1
X-Mimecast-MFC-AGG-ID: GwZDHq_7NzeUqes0cxlAfQ_1751584988
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6face45b58dso3734096d6.3
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 16:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584988; x=1752189788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AzaXolkpwLeUXX6Tltm5nUeMgctbaGRt9VbQb3Als4=;
        b=OLTDeahtStjhmNTxIUc80Sw/TvvHSQLR2BWxvqgYC0X9oXyRzC8sTpZxtWIg0v+YUF
         jHzgCebPJp9Jz+dHctpIe6DhxnXcHorLUohJR32El54DDfe9gfP2PS5azy2wtLQtrOLw
         TIxUwUdhDwzStJF/Ktxxt8XCAi4wjBTGL9jvfW1cUCr4/w3F3nHVzmgyuCK37R470LSN
         qHVmUzsuE2X68Qa6k4giG4ZtwFRXBlvBS0MSRQjjxTTERWh+xn7DArgJcSFuQigEt7Uf
         UFqQBiqZXfIi2E+jPSIdxWajNC/DCmul0Q/ot3V1hhcgByHivQw773WM3awRADzDzwhs
         DkVg==
X-Forwarded-Encrypted: i=1; AJvYcCX9o+1+NUP4PdHXkSB2PvYsPS48a2EkhcNB6IPYIlkuL/9uFQFYmB6TJYCCgWT8E/KvfC18ag0nhJRA1A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9JsGy0mnBDmNXAQmhzBDxieK9Rb/8FjiITc4pgTJqwakhGzEc
	4zT9Jbk4bKEGuwL/GzU6h0S9voVbdykEujlRBupKn51vBhD/IP0kjxHUOMUfKyZxaAGDYLs+7fG
	nNxwNqj4vsp1C7igpndTJgX11+MoPkbDoDyYH0RasrNMrTWRGdTqOdJg/8B+8wzAK
X-Gm-Gg: ASbGncts4b0/yR4u+nkVXHoWgLNyk7y/dllU9dYy5UT/X/VrYNcAPcikd5qs9KUfOO0
	kIHuLnTbdHSE7kT/Min/CVNHHH9uEDOkTyzuxEKjHStJtgIdzvFhLNhu5pMgR/UC5gPSAbKV+L2
	S/UKO+934xHMt6y0recDj46C0E0zFR75fYSTv7KoCJzmoMHEYayaLA7Knv3Yw7OQ0CZCim/miQ0
	JCXwbjEQOTQBkTf8UT+uOEBusulUhAnONNtF6RHNIlpr21YAUVNMPQ2B5HgZWFexiNvEj1gafJA
	+0zVVcxHG1jAD6gucbiPt6+tlXJivVWiJrxQkVRlpfL7yae6RX1M7y/RbNgOxQ==
X-Received: by 2002:a0c:f40e:0:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-702c6d89379mr3029066d6.32.1751584988545;
        Thu, 03 Jul 2025 16:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENUtIQTiH949ayUO0n64DI+W13Cd0LYVyie5G9b3GrNFyICIYDd0Xx0nCu+hVBZqsPuJ4DLw==
X-Received: by 2002:a0c:f40e:0:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-702c6d89379mr3028786d6.32.1751584988220;
        Thu, 03 Jul 2025 16:23:08 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:27 -0400
Subject: [PATCH 03/10] clk: qcom: rpm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1752;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=xV38q5FTl0giHcO6B1fUUKKklwS+ypfUiAE8QJ9ufs0=;
 b=svr9/D7uxrC1Dyo7FmzxHVdb3SQ3e3f4HK+SsFrtv7eZKxGDXZOMRTNco/2iQ/OKe5mC+FRhE
 8ilIx65qxJ/DEVqiPHJ60/E+M1hDDeodgGsGMkUI7YBfZ4ZMx7XNLc8
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yu6G5v4TEwgMSR_-uVCaIUBFFSuEAD7D-GLOB06MguE_1751584988
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-rpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index ccc112c21667ebf8522b06b37234f46c69b07698..be0145631197bea65438f3bed10344f18d6de802 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -351,15 +351,15 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int clk_rpm_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	/*
 	 * RPM handles rate rounding and we don't have a way to
 	 * know what the rate will be, so just return whatever
 	 * rate is requested.
 	 */
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
@@ -383,7 +383,7 @@ static const struct clk_ops clk_rpm_xo_ops = {
 static const struct clk_ops clk_rpm_fixed_ops = {
 	.prepare	= clk_rpm_fixed_prepare,
 	.unprepare	= clk_rpm_fixed_unprepare,
-	.round_rate	= clk_rpm_round_rate,
+	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
@@ -391,7 +391,7 @@ static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
 	.set_rate	= clk_rpm_set_rate,
-	.round_rate	= clk_rpm_round_rate,
+	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 

-- 
2.50.0

