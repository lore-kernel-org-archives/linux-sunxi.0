Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6D72AE70
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760894815; cv=none; b=pLcAt0wrREOsto7IPJDpXLVnbSfuZz+udl7BuNP6gTIVC/IWIzmCA+TypFyJ+KWxbUKxTVGNKZQMmtYPOOudxKpZ4fllv1ZGSwf4lPWXLTKgvO8c8AA4G/FHrEEcggkDXikqsE9iKjCB6xU90dUe9mEwpXpOucun8DRL+RlP8PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760894815; c=relaxed/simple;
	bh=WKISn3FBpc6krbzD+pqM1hrHFUEYtLB5hDapFGbIkww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rie/1U5xxeX7GtCbeQuyj+uG33OqXL9B4hEBJcO++coGjqtVpdFxk4VK39CwHUumvauj6rcndfuJWL+9eFdHRDfZzizkjjXJCRHDAKNZKu+2whiFIazXjkkKgynsBWGsAMYmf/45KGlMRy3CGQd5DJFE2JxG+rjavzDmp0sYR0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhepkgoU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhepkgoU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471191ac79dso27597865e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760894812; x=1761499612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfk3Iz74iG04i8jgiAEKJ+IUy9T7n6c85dOHEZsHbEw=;
        b=QhepkgoU5puSDpEceB0sqk7zihYu0VRb7lLJp9WfEPZHHBV2kpgt3MNUFBgup37aw7
         Cq8WTuZyjTN/xL85qX0VauRk4kX/nk5m+a269ISMDRBq6TLtmrW3+DO+WQHJ8lbi0EHX
         rieewaMIoo/+LJxrmgVRlGEhcekRX8uu1w1q3AlkPTs1E7ie/KLBap4VWJtovdD3iCg1
         9/ymRmfq1TyrxmnBP9E9SbNXHUlFrrHC/8qxIa75TZyBghX3OTa4an/lRdBKRhjqQYB1
         VtzFl0lYVTWN9dDVCKAJPNP2BZDzcwXXM6FZfh4iJoSxBcg3J0RB+56n16TuRUbirwXh
         aKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760894812; x=1761499612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfk3Iz74iG04i8jgiAEKJ+IUy9T7n6c85dOHEZsHbEw=;
        b=m35iFSqBKvZ5kksTnMtxs82P8h/Hdw5UZg+576OI17pK1SaZcMbaoJiRMcFTV3s79a
         BZE0oOSjV1/hNc1uCqsvsaAgJAzLt6BhaCU4s9gi/jGPSzaMY758vBXWBT/7M8B9bjXr
         /zeuuYXUNkQEWaxm+VwuDZ0xRcgl3xfV7B13uqf5lCMB7kX4fjU6fPNHQZBRAyX8eNIN
         SC3GednmbOP0Zm5QOuWYRAHCl7CskZBfjwQILeKJy8wBx5k2tAajrq3xDOpBFNABS9EE
         G4VX8QtAnf0Z0j1D0fUWe48zjByVK0B88h06ari9HcOoEiKlwkHyU6QvPzLnabHjNeGa
         LrzA==
X-Forwarded-Encrypted: i=1; AJvYcCWpUFudZYWfPUlNIzAzRxsT7yrR37V4aHtEAqlfgtqJXdUwqbuSbwG9D+T8Fyw1QtpuJOx4Br5wWLydjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWbHH7+T2m+i6qX7K/HwDV8MX9TyMoiRaVpwSYzNV2CVGoLTY9
	+ezrRN6p1dFNNA5lIFQncNkHZEwsH1mLjvhmvcprClm/DtFLRzBXOdD9
X-Gm-Gg: ASbGncuo6PT2hAZDyE0WbAwV37ebmCgTTjL55fXb1bYCOaGcIsx42yeOEecttmhECPx
	KNTEOd6CZdIC/prI7PXtQdMNjAbCTU5YT6SOTcp2nWvgff641fKrMh3m1Ego+yppZ9O6600xwYG
	Qmecj/LG/Qowf3qFQh1F1MFT+zIujFeNN73W8Lxh60bMoh4/RC+3goLn1cmyFe/Ki+O2WjmHp5I
	lCp+UFCYCcIHbEJHXicSef5R1VNbCjVQuWiDWXXUehU66mk8kTwTRfQnX7Qd1LVPw9h09u++25y
	SN3aC7Wriuu/2Ql8oTvPCQ4VfFsp1bRiUxEfsedQdTZqL5MqlFoMaKOtebspeTZMGhZOwa/FZlN
	vzxl3y20v7mh7csLNcEuANz+ovYqLTkn+iFDFuG1Rx3VZr+WkN3+BwHdL5I31tSOFb7PG3hrofL
	Nmu4jlC3pbbKCpcROPLD4mPy69RQU4kE3d8UwwdwAr3jsPiACLRFmPSFzRHmLMtZhVWIuApa98w
	fNd
X-Google-Smtp-Source: AGHT+IEPw1kFE6Cr0CGLWoQL6JabKMRRHciBsQ11hcnzheTmiOhMaQJbH3sEDwu47c9YBtVmkqG8uQ==
X-Received: by 2002:a05:600c:3b8d:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-471179174cfmr75189675e9.27.1760894812237;
        Sun, 19 Oct 2025 10:26:52 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d916sm101069715e9.4.2025.10.19.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:26:51 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
Date: Sun, 19 Oct 2025 19:26:47 +0200
Message-ID: <20251019172647.80379-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bus-r-cpucfg clock is important for peripheral which takes care for
powering CPU cores on and off. Since this operation is done by firmware
(TF-A), mark is as critical. That way Linux won't interfere with that
clock.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index 70ce0ca0cb7d..c5b0d4a2e397 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -125,7 +125,7 @@ static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
 static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
 			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
-			 &r_apb0_clk.common.hw, 0x22c, BIT(0), 0);
+			 &r_apb0_clk.common.hw, 0x22c, BIT(0), CLK_IS_CRITICAL);
 
 static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
 	&r_ahb_clk.common,
-- 
2.51.1.dirty

