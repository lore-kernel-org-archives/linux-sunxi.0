Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6FD4B2044
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232110; cv=none; b=tzoDKhPQ2cQ7qCE9Gqi42sNCboLJAk1JfftauKd0kzb9TaoQW8bJNmp6ewSX5zmbtr5rvQanGWJkwdZ1lVwprznn9eq2oJCBIImZmlnWYx0oMSlkcQijL4bUi8ZXxz4zglWl3VINiz+hNEgbZi53zUKo5AtN11ZcP/kZCdL4JJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232110; c=relaxed/simple;
	bh=t5uHcWG2fEqeLYYeHJcY17uSk+4BZ4G6OSSXFcdnRnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=In1w7VQYfSqsNq3Pm9da54m1bZbYF7nZDrSwCENCsdfzctgJzO/IezoE8VFXietplLcf7AI8WfT9xySOZzxpaVu7HivCEkViKM7AsGJY2KOZ1xYsFwy7r1NX3p37VP9rQSjRQgHRv4slCHc45G310FvfaMGC0wP5suWgNdUd/N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdnQi3wn; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdnQi3wn"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaf10bf094so2954368a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 13:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232099; x=1791836899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2lAdfxofOjXBbqsp0/iF1q0AKoAn+osrW0QUEeXjGUM=;
        b=hdnQi3wnmk+STDeJ+mZi1E4gE9b3jodqJjMtcWZtHY5+/APA65TcQshTsvh1EIf2dD
         EHnIBdHZmye6qAZQIjrkq6Fxyk3eUmDtQ16/7PTpvyEn3blX2ejU71w1b2VuCk8qP2Vu
         8twKZlTlkbbmwg7ll2VwM46WXz5MrvJHmhxr/dnohtq4TAYUxJ3zKGNi+HPG1/MoGn6p
         rYutp4mC3q8AaA9goyouuS3EEfPx7N5/tUudWPFIeUmYaq6mJZa/IoWQks9Ah4qPZ0Qo
         7k1h9jElzHwn+t1dSZc761lbUfQn7DWqgIy3viCZcx6/iVlF3mUK1/U5KbBoCft9Nd/t
         Marg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232099; x=1791836899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2lAdfxofOjXBbqsp0/iF1q0AKoAn+osrW0QUEeXjGUM=;
        b=xoGGBZVrR3zKjeg5wh8n0FwfEmeNEiB/GZwMc+NqXSQtJEkeDFfeUM1FZ65woHci6w
         pGxfqmrNDWCAWf0kBvi4WdOy61+7RnEJ8ADmykfNMOFLGPb/YfJV2b4W76ZGDM7nTf24
         jnYr34WhQytyTsP1zl3QwDHtMDtGo+vcxa6+oCnoneF3Rt2w7d+ZWnYbm2XwTcozU44L
         eM7dvDxXiGkfegK/t87GR/zongeYnUFn476YrkernPzj9tB/THhDTYaaiEz4NvZZbMVc
         aU1CMUt/la1BG+TU75DhNdy53197ZtMcoruR9LEDOGIpMUfruayJMPOiGRufVDMCtvG7
         2T5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzx9Ff453gVsD3zn4F9cIIWJd4PFdV5l+sCrH7FzVRL+FfIQmcoQPXRHuNnhDL6qiGYYht3YGCpCw4FuQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKdH/xU3r2QZTpls7lHDONbr+ibI+r9kwskcCqt3THXSFdRJk/F
	QtidgJezVKFk4Wd0C8aJoc5fPL9INm1DX2bcMEfz7qesgCUX9eZrJoB/
X-Gm-Gg: AYBFou0VUW4pS9FY3FEivXGAWrssiQrDgq3An9Br9pL4yVc4Z8zgJTpXTsza0qYQAYu
	cUt67XDtHkOJ1A/7w/RBzlbCgmtBGVaRCz0/6oKWEa6uduJYJ+i/UzXbilzYkhxT5vGAN0+a0ty
	MOqXUfKtcjWXw1XwgmIqfzXnPz3ioVP1NjorWTssUHjPXBRq4Nb4149B+IPtt7u/Td7OBr/qXi1
	PINTUXpeswAXENT9O0/mjZdTY0vI5X1OtfkNPwq1gwbJzAbfn3WNrUt5e5dCFqsC93wGrJaQr/H
	MMEdrUUzYqDbGCl4sToTnkDp+EazNBPgA7Vqn76CpuSXGC/SnFUNCzZpOxeNBC5QTbSGCuIlSUz
	9mUPQjaucSqewV74oB54C+MfSDxoONdvodzDtE6P2utuY8wWtcXzmeSd8fKPsPDue1o8oC5oyO/
	ZgkfIdtIGuoTkssKE/WcM3d9l/YYaBhuujqkslOce94ho2CJleGLS/WSVUW6aVLmPvApxBWZK60
	vcMt874YRTrPCVHQz92ze4q5Ia8MH124A==
X-Received: by 2002:a05:6402:3905:b0:6ac:73f8:2e5a with SMTP id 4fb4d7f45d1cf-6af9e3002b7mr10742942a12.41.1791232099075;
        Mon, 05 Oct 2026 13:28:19 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:18 -0700 (PDT)
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
Subject: [PATCH v3 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Mon,  5 Oct 2026 21:27:26 +0100
Message-ID: <20261005202731.153971-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
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
2.52.0

