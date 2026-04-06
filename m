Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF533260D
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Apr 2026 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513691; cv=none; b=hvM0NXET2aqn5atLQEbd1O6wHyQdVZdMX139COrXJyaNLGNg+CYA7eB2UeXpa9Txh0T8Y9ZwXQlZ+3d/g9jPPlU+ue4uIYb5vJTkqh4TG1+VjPXSzOjaBoggLhi7pG8sp7GCWs3St1igJ3xjYl3kf2wKEnVhfOpiP6Biey0r8ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513691; c=relaxed/simple;
	bh=lmqzuOQqgNOAyPi5swfvuKRWX8HE/D1ZIzOxJVc5ihw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptpKkIzpq9EaOusIvHnP5mg+YK70SnGA3AAfRy5pGnHj67Z6PaevllVieUfNM3ugn75gZ3KMl3emlLYdacXb2p1fqGu+t2FQq7z+R/SA/mw2j4ZG/b1oD8MVPI65lVtrXnWLTp6pZDa2IX56t/IQSCwMEIsaj31rwv7sVMS/YVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtLzsGVx; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtLzsGVx"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e09b14102so8371111fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Apr 2026 15:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513688; x=1776118488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpN+/b8lu9/yvEaNtHU/WVfOxILX+ZQUzWAcfY4lXzo=;
        b=UtLzsGVx6zhEMEwwVUEKnyZNPXzNGfvWx0bPPbR3+VIj/kHLEGUqA7kVGwVegoddUg
         m7+CUI3+Pc9vAS8i4o+WOcv6SQv94a7n8nLT8nXgp7QkWW6xe0pVOcW+A/c/K0k7c+Mh
         81pX3GUnP+U5Opg5eSyR6x1NgC7n5zho1uY5zDyF8D4O2zh4B1pmr145o0SmmK3VNjFA
         z4mwKRtn1HoAAVd9rwZ9Fha6mYGPprS/1U8x0uzdsbuKZT+F4KO15aYLiDFliYSO1V04
         wJ4/TiIFzaTeoUD+vQHplHumgcf0jJvWqVjtyFgu7MnYOhroSthlbahIMmFiN9Mpjm4N
         9gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513688; x=1776118488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpN+/b8lu9/yvEaNtHU/WVfOxILX+ZQUzWAcfY4lXzo=;
        b=bf+YMgci2Di1kfmbJErAHf5tPZzMZuzLqaItNZD3PfHbhcxAyQAmh4sYRTXTHBm4fU
         u2DlUtWBGhhqvcttmyGD0dulHfCIVUPO6iGSfuODlJPR+5EXIoDFEw+PFYz3R8BI5gFb
         HjPrK23eYBKAy5SFGTHwscmPQCRCwWTOy3Ec8RzPnaFJdntyHanTOQVlZ3fB9pwliPG5
         Py7O45ySjv93IDJJvqpoyxtCeW//einLqN4y4s57m69bncs5Ro+mTGkZ4jOXOu0hSCy0
         zHFJd6cWxOv2s8KGOrFlaHdRlnHDqRcG5fqQZXwLfxm5GvmYBkG4o2yKnfQ4V7+TObcU
         po5A==
X-Forwarded-Encrypted: i=1; AJvYcCUARR4m+R81oylhrdyVrQ58Aic/UHkAaqTiq++jrZKHNGhgTZkeuZHiKuBKrbEE3x3+IZbbTzGKR9MHPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbglVkmFq1jO1t7yJxtyd/wpP/HtWzTdM67JNw4ZJUhgfZIqdw
	8OV0GVwYGroxY0Vpxy5R1/aHnYTeTQ+eg9jvVsT4Oztrl/Ijhh+aGr7x
X-Gm-Gg: AeBDiesFnP/uZQPhIdjd4DFjtGeJFwCUNzp851Espmn0QNxiUx64q4HafjeQftY4xf4
	wHugOCQtMh59g1Bz925bWJy8Ac/kw9Gp2goq/ogMYpFHZHXUxEvRu12EkTRBT3dhYPbHuXOVlUm
	J18WxGnIJjorKInrvp8fsmqU8qOQwOIDZH1Zc/JcKkcyqTr8eINSHoVjq3jeJW0bZ/lJewfjMAV
	Arar499eGAslcWbJUmYGXKdcluHhuyONTmpTMcnTOWdjI8kqR+Mnkh/gKrfUgdQ5DjJx4IkqONn
	7q1wMDhiwYTy78Oinqdug9QzDtPNHMj2UPgOuygXjWbgIGozW0BHniCO+mLf2uo+4AGCZ2FufqK
	d5DLDsk/D9/VuOb9yZfZ0yt5LZ9potpxBB4Vdjm8nwv6LV93ggKJjSq+suyzYEwCel6rlXrp4/8
	BTWokcZHAYbQz1b1MDN9Puk+hOIQ==
X-Received: by 2002:a05:651c:1b13:b0:38b:f0f0:e38f with SMTP id 38308e7fff4ca-38d91d78c88mr39211001fa.2.1775513688308;
        Mon, 06 Apr 2026 15:14:48 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108c9dsm31924801fa.21.2026.04.06.15.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:14:47 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v2] media: cedrus: Fix failure to clean up hardware on probe failure
Date: Tue,  7 Apr 2026 01:14:40 +0300
Message-ID: <20260406221440.3721863-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

If V4L2 device fails to register, then SRAM still be claimed and as a
result driver will not be able to probe again.

 cedrus 1c0e000.video-codec: Failed to claim SRAM
 cedrus 1c0e000.video-codec: Failed to probe hardware
 cedrus 1c0e000.video-codec: probe with driver cedrus failed with error -16

cedrus_hw_remove undoes everything that was previously done by
cedrus_hw_probe, such as disabling runtime power management and
releasing the claimed SRAM and reserved memory region.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---

Changes in v2:
 - remove duplicate 'in-body' From: record
 - add more technical details to commit message

 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 1d2130f35fffc..ee0e286add67d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -477,7 +477,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register V4L2 device\n");
-		return ret;
+		goto err_hw;
 	}
 
 	vfd = &dev->vfd;
@@ -538,6 +538,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
+err_hw:
+	cedrus_hw_remove(dev);
 
 	return ret;
 }
-- 
2.51.0

