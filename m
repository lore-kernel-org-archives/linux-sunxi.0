Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C7D35836B
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Apr 2026 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777208379; cv=none; b=AIr6/ZJxEKBB/a3usrHLNMu5Gn/ZOdjeClPhj145bdl2pbYwj0QKKZyVgQEkj/V06RG7U6om1Ln6T2JlDic0Ihel9TjER/jMqN2UJ4hRLadsBkPdlBUxfDJxj3gILSYf91RDYXBiRPdm8WCVdJ1rk+BLJ6XvWUIS/Tho7beWhR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777208379; c=relaxed/simple;
	bh=GS6hajXwZat+NBSlsYlaHhAw7w0PBNcSVaczRpYLUFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o5MnA/tPr7BlRahkQ4FcVKvx+Nwu2N7ipu07FBn6LU8frgnbmbGuoSamhjXBGvVAcpFc93JmoysXIV+yCIs3uIGwydb3G8E/p6x++Bs2Ok4viCKqbf7+FMSDBbIC3jm815RhhcUU9p8leUif+l5k5/U+E7riUL38ITDr7rBY3As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhT2W0ST; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhT2W0ST"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b23fcf90b2so88944745ad.3
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Apr 2026 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208378; x=1777813178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTPTOzgWIzvWPxNyi6nl7Pu4rXDNr+FjMwz85mVxP+Q=;
        b=mhT2W0STrPb4bYNuYS14dKnsnxeirmGJm3JFquB6+LfbJ3TUb3GCRnD4SKDABIy8Mv
         3Mtok1sLqlSCSVITaYnqFgb9Zd1xmXKFeWXtDuu63AzH3YaZnOm+YVezDrDge1dltusG
         uvdW+qpJin2Hd2l9Es9LJBeFX+7kdUBIhyJeCGfV6SB+v7p2R5fqZWzQU9RMtWp4luLo
         SIClC+uEWJiuJQLGKjWAAE5j/pHYW+xuIHhsJWO9cCZeCogxvUVLOw7CUxLo253si7Az
         VsmBoWy5ZIQOR2f6P72lOGlPbWcHQnsIy47ujdYeLTkvHu+6Hj5WnwB7NkoLh7v6m2n/
         4AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208378; x=1777813178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTPTOzgWIzvWPxNyi6nl7Pu4rXDNr+FjMwz85mVxP+Q=;
        b=Esx4DRJCr2BWaW5QxUDNFR07xktiVqdndRiYIA182eEsPD+EBgx0XC//BZ6ljxxJuS
         07/aDpDlmF3FiWEWpoihh/nZqFrb3/w9W38H9D4Whfs/4Yzw2hPM6e4JHPtw8FZoeXAo
         vODf55Q/yW43Odnisp7gQfheszwkZ+L2T/AYVuTgyQvKfcIZOO1KH5E86kT/LAAc0H/f
         ju1R0CMIi3P+x/kvq2TxgvTp05E2i9iSX33zCKqiIlZ1P6ju7IfhwaZ6GlO7rRPM7j+Q
         LQ3QkF7u/S1rPGtlMXPnsJsFSjFeJrcW97biQbuTvj9qQSFEemDsMoSYw0HYEO7jxZKC
         nyAQ==
X-Forwarded-Encrypted: i=1; AFNElJ88Aeb58RGx8h0wAV5dHkYMC2Hs+wttJl61bg7pfelEZn0qCECPldC8pQbDfedGTcFjCKH3UcVirIakmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpVUcKcSuzBy58XWEFfVB8LzgrpKZNBFXWxeaEH79Dt4EGwCjY
	J3USJmkh/NcYe1qo4Ta8imY6VaiUQ/3CiGfKZQ/EQFy932Qic+7Hh8c=
X-Gm-Gg: AeBDieuVTCqIbmUMW02cae5mwFB0npPErX7cSc1yi2Tz5WT/8OjN3t0JEC/s0oKNvKs
	BT0UmllhES+zzpQYqfQ8LcejdWSRrFUyrMPYU42U5BYi79UUvV/GIM2iil/dEelFo8busQ5h7po
	huuU3aCBPvBheqY3tdvI/QyZOxp/x5eM3e1qK53uR2Kiv3ok+1tN5c5Of6gfDezbEE3tXdo7Nqv
	HnHAJTwmx0SCd2fCX8DO0oKncXLjhZtJyMHnpORk9D3KxG4VyYZwMz8nRUxKJq0k/YGExpeG+zM
	p3mEUel/GtlKGVR6cgWOuFHJB63tN0vxim9tR+Jkq0RNZEVI+5w5QTUvFCZLkQTi7BS/E1unujy
	5D56koCDXGJxrHlm3qSeAmvFzQGr60uJaCTa5CcbagLNyKzNyriV9WPnqh2rKKTSnF1M9oSnkzf
	osdyKvSAt3E27zcOFwm5kQ7Nwi02DXFPvhYbwPf4uQW6nTiDrhsYkEDetARXLXQjppWztmmKIfp
	qqYXtXqtg==
X-Received: by 2002:a17:903:17cf:b0:2b0:6829:9414 with SMTP id d9443c01a7336-2b5f9e64c6cmr396098325ad.8.1777208378015;
        Sun, 26 Apr 2026 05:59:38 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20c6asm252710075ad.58.2026.04.26.05.59.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 05:59:37 -0700 (PDT)
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
Date: Sun, 26 Apr 2026 21:59:11 +0900
Message-ID: <20260426125917.53665-1-mhun512@gmail.com>
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
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 30 ++++++++++++++--------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770..f6798cf0a2 100644
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
@@ -236,13 +244,13 @@ static int sun4i_csi_probe(struct platform_device *pdev)
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
@@ -266,7 +274,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
-err_clean_pad:
+err_clean_mdev:
 	media_device_cleanup(&csi->mdev);
 
 	return ret;
