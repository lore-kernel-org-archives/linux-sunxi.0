Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998483932CA
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521952; cv=none; b=NaYh/Jv/f8OK7gj0YYuP2+IzZNEBtdH/l5sC0blpW2CeS7OOEk11hS7yfiPMwAwY+FF+Pz+71CdYCsur9Q9jxc9+5EidOFN2CpuHwUkd8WAQjfQqH1WXAbhSLUl/uN+CdZh92o4vCit1bl+qa4YS5q/8mTIMAJL550wZidHCSAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521952; c=relaxed/simple;
	bh=iGxLkAPjn7iwM0RTaaX+V0ufn+VTyGjgMAZb+r2eUQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZnvOFRczRl1S3l5QgD18p3VpHhy2Hlo67/QcFI53zoRJo6fIxXAvMynA3nIixWzvjXUg1DlWJV0Uj9VemWhBDUhicN+D5RTWgnlk+X1VA8RKfyOkIgTJ/7wPd3AvrCkEAqLQHJykvq3bPQG8Si/J2miLP+K74sVtCppbFpdSaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULd1AXUv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULd1AXUv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso13159375e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521949; x=1791126749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=ULd1AXUv9ysrxVHN8WzFqMBSboNUnznnK9Gak4RigE1pjyU9qZ3rz5UjOn2uWRyPVi
         UaOJfz6LDRI5sGqvzxdXxLwHnsBmdqfwvsEFsUpPBJMhScTpKZgRbCvOzE2Y1pDmTeb7
         05tdyE+xLHI2/Xh//CZoqG+ic6wSv6JGrtaW0Ys2oM2Cp1ZhHBbao59AIDxVQzkwQriT
         +u4obosz835ASZE4wl2lcJZmGTFDZtn7a6fpKh2E9PIUyQIuOAmPbKDsWAT81uO4kqnV
         pBHJVMrt/1VSIDZmjSN1AhMU/3ogqs1SC7lUdi1S6FQYBlS4IngRZzZM/HtksjIkN/GX
         olRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521949; x=1791126749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=x/oGupKS7zH2aA0jD3v/NncILpg+O321Q0A6jC2pYT15OpfOcj5KksxCb2qshhHZ13
         QX2WlvwmMlY3VgtB+0IH1b8QMqePjyuQHVybGrk8mVI3++4DCaQLC/H6ybtGGas5v+lI
         G6l+VJo4z2OhVjy8SGYfBVQDI7GaZoX5XY5rSHAyYjkvx1dQbUbCBBtD38SwKZXqvL0A
         YgywhUYc6SuMizgB6I8ctZwcHquhcND0MWjadm/Zah/1ebmxieznxCnIQeROVd0sXPzS
         TYuxZiAxAHH7LTjiFyhX0yh3YTaPbN9UNywt3M6FW7kQUbOVhBT+r4qiHL5vx5zeI8Sl
         HVaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQH3ojzjIBRrkIE9PMw095YMXAhqSWPM79bmCSx+REGGisgFFG1fGF+qocJeQ8LA25DhuLrTUtVc6+uw==@lists.linux.dev
X-Gm-Message-State: AFuF++nZ38LNF9uCcr+FdhEgKiUZ+YOgxWaEo3JhxrJote3ZARAsT32L
	FKtPG8qvnjZuIhbUyl3MeC6eG9RK8OjEATcKBOAFbL//EVYuLddT+4N/
X-Gm-Gg: AYBFou3Mfry3bsu0PkTcnQXAgBSPkFy/cMruJMVExxjQNCrnYFmUiz/3RYx3xUFb4T4
	ix8wQZfngSDobVGYzla7XSP1C1/Q0zSPwovKfH4EIsW2CikGi42nySxaTJlS8KuzCHZoJmd1+sA
	9cdYeF0zOJa7veUQEgx/nvvRFhqKMbSIftHQAXpRUpXejjrbZuVmX0l+kvCjDLa8XuqrAqycX82
	iuSFATnGLHhY7CoNay0Khkf7RezO8loPEE9bkjscwQTZW1Ith4YA2eCY6uNuPSa3fOtx+HTS235
	iBGPUY/un5fzbIIIRg7nJ5IER54hRM9qJfXUQsSdPYPkXq31hGp5ngnGiR+R5XpkAXeXSthxy8h
	Wr6gKeR0KKyqHuCOTjnT2WWwc6zdz3Q43+K1ZaTr8wLAl1nC8yXrh9W1wZmky9IEZSlBsJGWvwx
	k9EwZFil6nRvZCt2t1Id7OsB4ic44+duM2nbMbqOL/mBYIAks/stV83r0Qb70NxhK5jzjuwrN7a
	U0Liv7bZfSk6E+KBu9PekTxQLGLnY/HHTYMyPreRkU=
X-Received: by 2002:a05:600c:4694:b0:4a0:54a:bd36 with SMTP id 5b1f17b1804b1-4a0054abee2mr1501255e9.35.1790521948886;
        Sun, 27 Sep 2026 08:12:28 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:28 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Sun, 27 Sep 2026 16:10:11 +0100
Message-ID: <20260927151016.186493-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only uses one alarm interrupt, so no functional change.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..cd6ac5bb20cd 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -859,6 +859,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.53.0

