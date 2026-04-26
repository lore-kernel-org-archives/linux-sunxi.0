Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8AB363C4C
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Apr 2026 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777211905; cv=none; b=IZnZIYzeznkLu6oy0lWW864uDE8GYh0GD1CTSkfyCk4iyrdV5I3L06/L1+Daq2wprwKjuROEF30npTGnTGmNVB5VCbSGBEyNf3pNywtdVHvN013HDYL9c8dqcsM0Fsu8LRI9ZtLpsWU+0x9e+dl7MiDzBKlRkR4gPNzlEHs4yiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777211905; c=relaxed/simple;
	bh=9mxkbIYzrVb4tEULWkgR6CtT2TzXnJT1Hr+hwp+gk18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FizelF9ej6fUXfP0ko3Nk+hp4j3GMqbU1gnVaGqhviHiamaeJjXF0NC81afTdyo8dzA6U/gkEBqtU+bp9Ev+Wu+aIzLszu9aUi54Ixb+TFM1AjFPfqIZ32CkVcFH8CqC7y1qlfP9TOXv0dROIgZnwHblBfUVW1XW72Sw6UXEBSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gupTCyMC; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gupTCyMC"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f943870baso3793843b3a.1
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Apr 2026 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777211903; x=1777816703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PBfpNfiIjOJFFL0xA0IF9h53jT9Y+7A2MFAc7Sp6JM=;
        b=gupTCyMCRfkEo7tndzPiwp6Od6JfDQ0FrMKLLOtfyEkgSlzue6z++TI1YWgox3PllS
         EJrEnJuXEvf/go3YEPwL6TDgyymNhsy5vOpY4vKsHZ0OunH/5mHCmF62GdoW9oD/fHMD
         AkNWL3flYmkI4zsCoZHrijtamRALFISx5PVpt32d2hqOKY8JaehQ5qW2LbK8pMrVOX45
         vLKMKDn0s2Mv7u4Rv3IdMJVsEFUpyePizonsJyj9P0y9vdzFGz+gwbOn83S4klXWOnIs
         udLLLmdG1JKmKURWipctK4uXvglV22A/mtYDvtwRPaohrp7/xfaCryerXWu5Rkx7p7EC
         36CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777211903; x=1777816703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PBfpNfiIjOJFFL0xA0IF9h53jT9Y+7A2MFAc7Sp6JM=;
        b=ad3MhPdOUIt0zh+9rT/aXjw38V2tj3IXApkTdASZ9X0auU6VbjFxZIazgACvmvCQGc
         1RXJIQBqXiFhuDow5RH6b0ipdYHgMiQ5yaFlsdDbBHrk42f4q97kjgeNGPp7Pi89M+Fx
         S4fpKNrwD6Gh1v/hb0IIioDQBQYeVCMWSnt2Ods/wQv01Xtl0/c1DC/ohYufSBzCjpjk
         /AmtiM5oLK32wqr1EzP1jojmD1/qg3AVWmXZW15cqcA95C5ufi+VFkeVhDv1c8EWbJcv
         KUXs1HTn0Lmdml0BHg+D3fuOZqaJ8NAvAbv1YhYuxxAHl3KKL9ZHZWAbXNKPLkPLcj06
         HDkA==
X-Forwarded-Encrypted: i=1; AFNElJ/RcqfKVuMB3MdEPN1CxQetgVEILQ/lD+WIJgBOeODVrgbYRGQqlnOK7F4rGFrCcneCHvmO2t5hC6hv5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJb06AZIiYljRuCFxhu6tIT4ZvnXGBhdEfBldYPbvX0QPMjrWz
	npxm+LUUbu1pppvztbz0HZFThmf5bLa+xgF3JYPcax3PonBN5vFVtog=
X-Gm-Gg: AeBDieu86OIc2oUPLs23vTn0yqpL4hhb9uV3yHUL2bxFhck0tCYjy8nIT7OdpJqRrAj
	LsGy3eGB1FAuO9lfh4cHZlqZrsbUA7OBdo/0UOiFxfYOaob/BVJ4Bz+wJI2AhyqU/NIbYCFD+kH
	tV8augKwRDnvduD/3IcBXwliBL7eaUOJtB++R9heHT/3IAnZ9ldjiaOzd6wezDd/oLsk/hOvzik
	TS1+wgW6fjv6kKUu02QJIw4ryj+vjjZyGCqTBlbepTZ5j+nsr/ROg2eeyI6ww3qJxvhdus3BDDy
	ZcjxKt5iIBRxmH3zJdMf+HsWXT4ljYAHwYLI9rW3+8V6m5VSEIoqoWc0vjqvQ34lrTetBlpXGSd
	j+j96qttlZWJUfS96YHERQZUCkuOA5nASrAY9kT1mWTKKzfNE9NjaE689SbcnXxFSnbHElRZbnN
	mWZAq0v8/P1/jq7LJMyeXMMQ+HypxG11htLTQINHUu+0v2P+4V+CJIDkZ5iFI762oC75mR12LtX
	ySihwlkCg==
X-Received: by 2002:a05:6a20:e210:b0:39b:91d1:6bf3 with SMTP id adf61e73a8af0-3a08d8ff2b2mr42090665637.56.1777211903497;
        Sun, 26 Apr 2026 06:58:23 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebbcfd7sm36558098b3a.32.2026.04.26.06.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 06:58:22 -0700 (PDT)
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
Subject: [PATCH] media: sun4i-csi: Clean up media device on probe errors
Date: Sun, 26 Apr 2026 22:58:11 +0900
Message-ID: <20260426135816.8080-1-mhun512@gmail.com>
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
