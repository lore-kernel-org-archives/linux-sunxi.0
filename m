Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202951C701F
	for <linux-sunxi@lists.linux.dev>; Sat,  2 May 2026 06:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777702361; cv=none; b=EqN8kGYr3NqxBc5EshN+77I752asAnlyRArgjxNOqvEob8S52XiWO1+L8eUtU/A9oz+YLvI5cn4bpl2WMUtSjRNse2izuo54rZ8UIv5UkNiQlNFDANLGjG1GnSwEEd7Nd3J24gZ6ShH9uomDV1/GFQTKTapEyNqCNP4scXwHsdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777702361; c=relaxed/simple;
	bh=TueC70Q2BnjUS5mq/ZnFlpCzcBfCUG4Cw+8Fdn9sjoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EE9q5OuQxxhTggpFO+VI5Qjdf+LdEhOdX7taOO9nUU/AwVHd063C6S23q9zfNclwf3xHuwCSgkzSFiO7ou5gvd07A1NYWBS5XZ2FPZh57XkKwrfnNIWPLePzwduLzRZJ8q0tpbm7e6Rssm9EPTrirfOq1rOPZEUvdmbJ6uGZSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtXYDe/N; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtXYDe/N"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so13379075ad.3
        for <linux-sunxi@lists.linux.dev>; Fri, 01 May 2026 23:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777702359; x=1778307159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Szko83JYninv8P7/ry56S2EbzBdJ5J0YLPwpoWRzN10=;
        b=gtXYDe/NQfIUcNhijjgOMMRbxu9ADu2Lh53KEo07PWSbkkv+p8wrWd4YCYc1LQVV4K
         3L84ZTAu7wp2UIdgyBNR8J+fKOyZn0rLERK91OjRe5qlUHsgMU0DgHSiGjYUxlFwWvOX
         yhPuuGN3Phr4VsKAMBJawpSq4UWKcsgcTI68eyiFopJcRKvkLOofACXlZ/U8pmtzfQGl
         nyfkSB20FnN/UowqMbG6+dI7MwXvRZ2cY/oq19+aAjgnMRdqtldkFrOdkc5+dBVJUCGJ
         rMx27t5vNEHy/YzA0dgnfqSKY2ctB/2brXJmR4lpL748Zu3w0a7+iJqVuGWt2Bpf0Vie
         mPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777702359; x=1778307159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szko83JYninv8P7/ry56S2EbzBdJ5J0YLPwpoWRzN10=;
        b=bN+26uK/j7OCyTB4fbH5J1KC8LE49LzocnKEgFuv/UopIVTn1cLQJ9qXg6Xsk9Zk/o
         I2KIpurCxrNeWyBg+5YSXP7Ez0EjUXYQxsL4IsCxlzhSS2V4kjUURA/6iTHt8Gih/UN5
         pIihcgKDfVvzQXO20DVKqAlBkTPiSbg/PNRpumUO7LCvdaRIPXR0jJKU52H/WX9CdptV
         sS87Tbm+FmV6Uk+rK7VYQT2HtARJTSewrViDzgO7KZb4WwZg8ACSE/LML3Yd4olGiyd6
         2vlGKmm/rEHjBHESeIzcbsuvGc0Dj3op9zznJqmfjLlUqPCQgOrW7xLt8/Zba7MGgtD4
         UEsA==
X-Forwarded-Encrypted: i=1; AFNElJ/GsAf66pLiHh06BhrQyLmaQpOzLxy1WnhCeW3bcYqjPhOtz1plsSbrtpEmVrjcdNIhUN15fNycAsV2GA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGfmmLrUOF6IGQktNo90Q62t6SJ/hZfXfS5crecTk0YMPCTy1f
	Gx4bYqKHFvaYk9bzYKlXs0JYEd0ONVypGn181wXGcs+ZAnj8zaR+YlA=
X-Gm-Gg: AeBDiesEdISqYeoz9gKGz1oP6Bcqy1wZtfPjkoV84UGT8hr9Dhhwn3JhaLmHpKtWG2Z
	c6jL9Hg9uztkahzyaOMCkv8G0KQxeKQjvgFfJNIqJXyzdGvT9u9TDl0IyohPKEWWMBsiWkKgm2h
	wL+c0+OfxlwsZsolmcEOfG6jG++8bX8z2qEFkzu4mFQvLheNPtcd7qAMvWRDyz4LJEYetdePRCh
	qftcEGpKI+6K16RsCzEYcDg0+JEZHFZsrxHBMFu+jxR9ku6Y7PfzQEyKlj6/AZ86sa2vXNOqQhR
	RWp45i3SG0xKCH1424jwg2AqujJ9wdY6DJ+iX7YOKIrmup9FQYPQfetKhIE7CpP98DFnL04WbZt
	9X8lI/s+w5132aa//VIOoT1rv4Qd6jfpGZDbhT8tyxdeXoJee7cG9zYQOjCP7cS6QViAMgpPsKX
	0KJSH602IpmPvkLhJNjiVOZCXlT9glo3R0HlNhiOR+oNiV+SNlnGWfVhfXeRGZO2RCHkECddNzW
	CXPrsa3YQ==
X-Received: by 2002:a17:903:3847:b0:2b0:9101:1b77 with SMTP id d9443c01a7336-2b9f2586e79mr19418775ad.17.1777702359380;
        Fri, 01 May 2026 23:12:39 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae54860sm37981415ad.72.2026.05.01.23.12.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 01 May 2026 23:12:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] media: sun4i-csi: clean up media device on probe errors
Date: Sat,  2 May 2026 15:12:25 +0900
Message-ID: <20260502061231.50473-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_csi_probe() initializes the media device before acquiring the
MMIO resource, IRQ, clocks, reset control and media entity pads.
Several of those failure paths return directly.

media_device_cleanup() is still required after media_device_init(),
and a failed probe does not run the driver remove callback. Route
those errors through the existing media-device cleanup path before
returning.

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Fix the remaining sun4i_csi_dma_register() error path to use the renamed
  media-device cleanup label, fixing the build failure reported by Media CI.

 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 32 ++++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770..a504a1c78e 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -187,37 +187,45 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	csi->v4l.mdev = &csi->mdev;
 
 	csi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(csi->regs))
-		return PTR_ERR(csi->regs);
+	if (IS_ERR(csi->regs)) {
+		ret = PTR_ERR(csi->regs);
+		goto err_clean_mdev;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto err_clean_mdev;
+	}
 
 	csi->bus_clk = devm_clk_get(&pdev->dev, "bus");
 	if (IS_ERR(csi->bus_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our bus clock\n");
-		return PTR_ERR(csi->bus_clk);
+		ret = PTR_ERR(csi->bus_clk);
+		goto err_clean_mdev;
 	}
 
 	if (csi->traits->has_isp) {
 		csi->isp_clk = devm_clk_get(&pdev->dev, "isp");
 		if (IS_ERR(csi->isp_clk)) {
 			dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
-			return PTR_ERR(csi->isp_clk);
+			ret = PTR_ERR(csi->isp_clk);
+			goto err_clean_mdev;
 		}
 	}
 
 	csi->ram_clk = devm_clk_get(&pdev->dev, "ram");
 	if (IS_ERR(csi->ram_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our ram clock\n");
-		return PTR_ERR(csi->ram_clk);
+		ret = PTR_ERR(csi->ram_clk);
+		goto err_clean_mdev;
 	}
 
 	csi->rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(csi->rst)) {
 		dev_err(&pdev->dev, "Couldn't get our reset line\n");
-		return PTR_ERR(csi->rst);
+		ret = PTR_ERR(csi->rst);
+		goto err_clean_mdev;
 	}
 
 	/* Initialize subdev */
@@ -236,17 +244,17 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&subdev->entity, CSI_SUBDEV_PADS,
 				     csi->subdev_pads);
 	if (ret < 0)
-		return ret;
+		goto err_clean_mdev;
 
 	csi->vdev_pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	vdev->entity.ops = &sun4i_csi_video_entity_ops;
 	ret = media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
 	if (ret < 0)
-		return ret;
+		goto err_clean_mdev;
 
 	ret = sun4i_csi_dma_register(csi, irq);
 	if (ret)
-		goto err_clean_pad;
+		goto err_clean_mdev;
 
 	ret = sun4i_csi_notifier_init(csi);
 	if (ret)
@@ -266,7 +274,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
-err_clean_pad:
+err_clean_mdev:
 	media_device_cleanup(&csi->mdev);
 
 	return ret;
