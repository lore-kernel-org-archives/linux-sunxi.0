Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356CC23A984
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Apr 2026 19:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070915; cv=none; b=F7Ab0e0RyvmuSNg6Wv2HGlw+mwE0zzTwWvS/hOiJFDBPnW2pC6qdAFDdt6X+MEM1JZzoScnyZ5HHrGwQyGxDS2ZhRbXz74w9aPhMFM8dQcGNNrTh9tuhVlOgxwDljZ8b4qGlvOBjzXn9GRs5Tk0fnKyi9Ik65OEAdcAsNUVA2AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070915; c=relaxed/simple;
	bh=OJ8d86r1cv2Dz9K0VOKzDX9IeSSniN4yMPUR9rzI5RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9wI7DTmSd9J5Hlfn21AzwQEl4ESp/6oqK4OZ7e4p83wBHdJSPxcAh0sq2gLz1Do7zHiAz61EsgYdy/aMXPtC1+J87Q5IetdBMfV4FbQ0fdGKUC1SFuh1oaP4jJYloaPvS9WpNURM0e/YdRnjlfKG1xCR+u1+hvJxZ6qqfv5UoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFadfKeM; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFadfKeM"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so192950e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Apr 2026 12:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070912; x=1775675712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8KcYzflmFoH6kQuwH+mgkFuRmADtPPTvOe6lcVTKSM=;
        b=lFadfKeM8LfUepjK8L+7IPkc8R9HMlRmB6zTa9NSMS0cwYl9EXZZKVC5KJRhnkcNg+
         RejIqVj3NpLyFmVysdVz9/Y1WJ5YMtSkc/4z7iJgZADziyEZBJL+B7JUUqZnZYRW/B/p
         0OYWjBIy5vg14N31i1nuhS7+FSxvQEqpXZf9HHSeSKzQOfdmozvA+qVlYW4gB5KIeQHn
         /P3cxPntC7sTKQnjVddz3Qw8+RqIeQ4/HivgByfVsuv36RfFi5HiS0FHXgyNHEvvK8Q9
         rpscdMpbpq/1kdlQSqDJJDW1G/Wnzuvl70NX4wo/KkAhs/ED2tR3LLPbuGiSRlpKbIaC
         tx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070912; x=1775675712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8KcYzflmFoH6kQuwH+mgkFuRmADtPPTvOe6lcVTKSM=;
        b=EHm+R1P/wdz8DgNpa+pklwKwI8Mxv6oHfnDIWB1KX+i+qYE2hFI5GmrV6HjBdcgjgp
         88vD0mTO1pRxreCv6jg02jCm0lwiqxTMAna3qxNGPuPg0Iulo0EDfLcSL0Of4Ih+bu6c
         6FVG8a76s+w5W74w7twiwyKH836eUc67PQrX2MHomKkXgRaG1ujNz9U81MHemaHBymL1
         tDT54uelCATyetsNI4s/lB9kll7dqmix8TUsIsqPh/hY7/SoqklqD+TAkKOG3W7iXZ2B
         QIhhDmaz30omyvSoGBbkHaOVm7NutcGM4T8VJChYnjl7SEkmGjek5ekATQU6QePDlzB2
         I6ng==
X-Forwarded-Encrypted: i=1; AJvYcCVIY+t1dgvVgRxByq6MKsxY0mHUoGweV5IpLi2kOfU8NPWrmJqXTVMa0sNbYUAANnxNgB8fLmh7coUobQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQGLhI/S2buKJTccTozuwOcLmxXZGQzOCr+DBNzLWu64x7Iz4y
	rfyGKVG4dqFsl1NJfeJvutLF463CucBnKwJwOhZpZJCbKyv5ASJ+VuUs
X-Gm-Gg: ATEYQzwR/e6jQ0TQ9xVQ59V0GFL1ZR9mFt4spbfSfKlGsa93+uVyO3ymrrYIZ2Wd6dq
	2EYINLgmswwVKIgV7Bp0PW/Z3RFNg+46jMO1xhZt4SLxqrjT3gL6lgcgMYjX2VsIIt5H+eaiurd
	3Iejhmh8m3R9W9RVekDEq0AahdXCQJnhDV/YiLT7ltxEwuknJRRrMnMENDV2Lf/uI1gIUwMV7lS
	GS4akfYtDcNZyiyBhVpb5cQDiwkmmtGATN20J/zCjuTsRLQjNUSxlcf8rCm2Nk8i2+a9+L3wM37
	5eeBvlMpIdYaM3ps8bfuy2ry9xu930jPEFDdUgGvQ1ReI3FwKUqaA6JEZ+tHrUC5GzI5eDe1d+g
	6uykEe7bCf/G9OQjT448hmunjazfNMuX237kv5kVleX+1qnVuMLVhBMrL7TlK9uUlsQSRVjdLwM
	Emj6pRhrwjF1YPei2rLRXHJ01oQwsQrt5arBLm
X-Received: by 2002:a05:6512:318e:b0:5a2:961a:f7c7 with SMTP id 2adb3069b0e04-5a2c7676402mr92043e87.21.1775070912245;
        Wed, 01 Apr 2026 12:15:12 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm141855e87.60.2026.04.01.12.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:15:11 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
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
Subject: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on probe failure
Date: Wed,  1 Apr 2026 22:14:41 +0300
Message-ID: <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

From: Samuel Holland <samuel@sholland.org>

cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
like disabling runtime power management, releasing claimed sram.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---
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

