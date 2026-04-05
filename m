Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7EF288B8
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Apr 2026 03:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775360438; cv=none; b=Q/oF5tRubX0TA6anL3XaFxkY8R9KuPs5D7YIryVypgOS2HieGtCYcepGusPWbdU+5VfTyxfQUztlo8i+k4CNgpWNRuYPg0b6B/dBkeFTPJcNauFQHcO3SDGGMN+BEadyFR/yojVNPjal2+apvpAU6RB0F7GFWCbvTPM5RlonJ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775360438; c=relaxed/simple;
	bh=QYam+d4n776bCkVM54lnTAL+sqyeNTTk+1AnYmT3twY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fsyBcng+XlyrLCOWzzj8GB1WOq/ZPoxuCuNIc8yHLmp5lPrgiFqhLcQTY8kF8gYZKSUXAkmLlnVoZ0JT+aicTBXWd/HaSK2bnFYtgqRnLvH1XXh8DskVJ+/DvNbFtZJkP06LOnZoQUDMz/aDcIPMsVAOSSLBU8sDNuLTpnVS4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1kClbUm; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1kClbUm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad9f316d68so12087295ad.2
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Apr 2026 20:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775360436; x=1775965236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/FN5NlH0iS1DMIQZnLtbDssQz5F0UojDeaXB8HEsec=;
        b=Z1kClbUmLGnt8j9Cq2o90JhEZ0DL32n/5WicjsFjMTuKV3leDWh+IucLYEI2VNtmen
         dWaO0KFD6rcm8FC0oQR1xXYBV/w2ym5uckpmbx9NueYkzHms7bjx+4qnBtyFtkVrzzMx
         p5N7ELTqcqcoa7FD/zxa4VtNMwQ/2cwLIaggZsP6HtA5lRTk/GQeDyvn6wsq7vCGCAX2
         5QSy1FT2B0O4hk6ScFoZmQcoUZQGmEjAEuGwemrx629zRvxDcxQGTTfYaL3u/sCbuXgo
         27o7lqMnrwQpztAPkf1fxNSvaTCqbJqeWPjwrk9CwBbPsWwDAaZSQsOVcDMY4b3wqsZa
         nUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775360436; x=1775965236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/FN5NlH0iS1DMIQZnLtbDssQz5F0UojDeaXB8HEsec=;
        b=AejM0sTM0m6BfVaewcra83AhkYSLMskJ2oq0CX7yqiiN5vksvsDgMbsuNgcKrF0p1I
         sjn8hT/bAvOw7Y6zmQ6V0Vr84k8og0kJDRjnv3qJQf3b5zVbdHEz7GlEOUHiISs4PS/Z
         xV21p59aImxjEQ+ZEWa+F75Gex6qyLch5BEV2THvdX7H2DWGifcMoVJrz/RAfH4Q5rkn
         G8KU3nqIip51yTP7CegZ+QYralZKqY58jx1GKdSHUOkC7vAYkiJarIwJaSe/Moe+j9fT
         o7ZE1MmTcIuSbW5ZGF2DFnNdjWuQkkugt1WBbXheAtF1SdB+sO16TqPTUgi/0vPrw/5a
         yP1A==
X-Forwarded-Encrypted: i=1; AJvYcCUGgqhlZp+GRfBAffZ22jm3KPz+i/zCN4f8DV9hCN9Pt+XkgITYwJRos3kogGJ+/22FsVvpl0pTXPv2bQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXtgilSrcf8u3ciewCHyaTP/BTRaqZNjsS6znCxAr06eaY1DXS
	OBhZOctyLETGwqnT3KJcOFBVewvFT+fQsF6wDkMZ8gYFshPtUbGocufa
X-Gm-Gg: AeBDieulRq5uMEmHU29wJbRKKC9emyRu/HS6g5vHLa59SyBcIEfgNlPhjp8w35AvDbt
	JUg6Ia5OQidOwL6jHlMIizxcwp8hAA39BlciVw/jsQHIY+KxxeT8RXnIKUykKRHsgw9gz9uevt+
	jg0iF5Z3DgT9ZB18Hs+7xOZ+V+WbSnq2je5BKdnjabnZwQbUdkC0CKqzO3Jvq3uV1bczT/Scv/O
	NKcn4nbjdptrm3uCx4XsBPQK77aQ/bdrZneuxUAqMI0bxXdB1vjog8rQ6+G0Hk9B3ardaZNZfz/
	hZ2NUSY9zjmZbkEmC3tyQug6ULZfaAt1v698sBkwr3rhsP666az7hXhxrsNPdZK7W1prxTnb4CV
	HBfEd+59a9jn2XugX41/spQ6qcdH11WzivcP+cMI+rkNVf/Z0jJae26QmGNXf8fWWvBFkOWsD9U
	LlrB8l8MCpkuNkT1Awtnqv63QPOhrCBlhbCzw3I3f7DJ83BLOFCXH1ytH2ujj5+KTYcsyqJtnaT
	9UZAcyigOi+uP3NE3AZ3ms=
X-Received: by 2002:a17:903:2c06:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b28164c3ccmr87459365ad.4.1775360436559;
        Sat, 04 Apr 2026 20:40:36 -0700 (PDT)
Received: from adeel-linux.ad.umanitoba.ca (nat-243-cc-130-179-243-228.umanitoba.ca. [130.179.243.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497aeffsm99743195ad.43.2026.04.04.20.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 20:40:36 -0700 (PDT)
From: Adeel Zahid <adeel.m.zahid@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Adeel Zahid <adeel.m.zahid@gmail.com>
Subject: [PATCH] i2c: p2wi: use dev_err_probe() for clock and reset errors
Date: Sat,  4 Apr 2026 22:40:21 -0500
Message-ID: <20260405034021.12435-1-adeel.m.zahid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded error logging and returns with dev_err_probe() when acquiring the clock and reset controller in probe.

This makes the error handling more concise and correctly handles deferred probe.

Signed-off-by: Adeel Zahid <adeel.m.zahid@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..2be6d50273bd 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -245,20 +245,16 @@ static int p2wi_probe(struct platform_device *pdev)
 		return irq;
 
 	p2wi->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(p2wi->clk)) {
-		ret = PTR_ERR(p2wi->clk);
-		dev_err(dev, "failed to enable clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2wi->clk))
+		return dev_err_probe(dev, PTR_ERR(p2wi->clk),
+				     "failed to enable clk\n");
 
 	parent_clk_freq = clk_get_rate(p2wi->clk);
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %pe\n",
-			p2wi->rstc);
-		return PTR_ERR(p2wi->rstc);
-	}
+	if (IS_ERR(p2wi->rstc))
+		return dev_err_probe(dev, PTR_ERR(p2wi->rstc),
+				     "failed to retrieve reset controller\n");
 
 	ret = reset_control_deassert(p2wi->rstc);
 	if (ret) {
-- 
2.43.0

