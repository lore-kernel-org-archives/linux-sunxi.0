Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFFB3921D0
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Jun 2026 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456232; cv=none; b=PS946cdfMx4P0DMZqggTJfNUDWyf2A+BvnWc58j4Fz6G4YcBqtUMkFbeAMvTipTGEQfdx9SkWaOO5esapbVzxAZnqcYkkevyHDtZpETO7fVdYqvKWUW6fer/41SW1OSRdYh2KIdUWbhD+U9fUeCekJ7NOKHjXe5x6BYq8nx8Nd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456232; c=relaxed/simple;
	bh=7Zhy1mQVW1t/ztSSKPcZqS28xrO83pxbCfwKTPiB0+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/4O8HTa5NNpEMZbNgHH05FsSjKg9QUx67KTZsY4VDp4LSQESLG0LZhLPpbZXr441zr1ELjJzrrW//OzXFR+jgMl7kSr3Z+cuaMj+UFaoFTUmpNThlrLUUNt9lqD+1s2voUNZuOfBbASqzzRdx/NdqGaE5YwLMZnybi47JWkxvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAyLNGbs; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAyLNGbs"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso14425175ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Jun 2026 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456231; x=1782061031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QY5Ip+P8KRx1IM1Wpd7OwQvhD0XfR0winv2zlXLefIQ=;
        b=QAyLNGbsRcS6vVg8QFjvpSzmFlWURTwqIcDJndLuHGLSdKKj+JsMkCn56y+dEXJyHc
         HXssZKXxSBa5+gB7ndFKUcN9soqR88XtRvH//cnthGlFF9+X8qMLZ7AoBdZIi8nvIrjo
         4DESej4up4etUkIyGiVFAwvKBcsCs3flc1cYpAKlt4C1Mk2bpEAyYBIuKoGtFSfm3JxT
         HZYAxzVnFp/kGTnmFUKz9NBsdd6TcOsFP4nRvN+73a6mEThYM7ywrxjEC7Xvc6QFHQfb
         EyAnWQhb5XYpIiZfV0tiiCxPV9YBRFy96cRwBTXxqwBQwqrYxASzhE7xY62tWyMPJsng
         vcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456231; x=1782061031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QY5Ip+P8KRx1IM1Wpd7OwQvhD0XfR0winv2zlXLefIQ=;
        b=WRr0oiL5IgzkbzaClp6ofrwiPsgheEoo2wkVd5MveROpFaJE2mySGvCq9DJjUTFCDf
         X7E1ATfrWsvvsvoX7NlpnFjRXtdwhbTzuKrr+L/b/6SkaWefBHE/TIRAZTnq/yAevwGU
         EFTRvNe2IKg0GLRTXRyFrF24HgylN8NLlkoK0b/A4tmFSIkfT6ratPex1iotd5kY/iFt
         skoCTyJM8MfYbN0rQzPzAyGumllxNVKTDAg00kJkZTcWZw7g/dR8JeNUt/ZR53R1O+6Y
         QiCwaBR/1AUlBojmoXjJydRStvB3olCcAJIucGCotR1cv0IrY0pnFV4gWu86m5AcYele
         mLYw==
X-Forwarded-Encrypted: i=1; AFNElJ8YNsyI6CkO7Ax3LiAdn3T3Qzi9StRj90+Oza8lAiD0vMMJpYOcTXW5JAx9Jy1roCOCW6L3qK0qT/EmKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOzRC37yhejClYKK3RjsnObNSmecyB2gB9jdXaMeStxPEkz7dF
	FpRnCI8UOlbBwA+6vl4kny6Ro/n7peHctI5G4LTcFJp0n9TaWGFlA4+H
X-Gm-Gg: Acq92OFGuIxYpPtIXBskHgQ7WDuLONMXOYbc426Y9UZS/SCOYUoeSXJU0ANN06ZuZiU
	kxvqhz5/E7r/j1reejsW4gSspB/r7PK3bK2zibp2MwyYu5N01n6yrzDkMb2Em4zFz3+k9SLSL8F
	APqrJYh3zFGkOGQsToWtTzFJGUaSZphEgRrFLnruhWkbME+ZnG81mfj6duJIl9NQEbZ1ghbGyVL
	49FWP4izTAsL6NSEZa5irrqc9cF56fPZ6//vw8Bag6WuKqTpVSeOmZcZtE08LYannhDP8RauVKW
	tk/IdD45ib5ctoPaHgRnO1shu8MQUr6za872+W25vtqR+76TDx83NiUpAT/w/n8g1TvuaxfmMok
	Y5E7RU9jaVe+DBS8jr3nfhBHK1F6cy72+8tozIR74oKI8c1Y/IzZR451vI/PK7wDWPAJYT0mpO1
	bYD87vP/1aEep8ezmwv/jGR2umTQTRLsbccHBd0bJOjRouT6cIhCOqHSSLbc9xYQg=
X-Received: by 2002:a17:902:d48f:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c6641e28f9mr86805045ad.21.1781456231128;
        Sun, 14 Jun 2026 09:57:11 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:10 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/22] media: platform: sun4i_csi: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:44 +0530
Message-ID: <20260614165630.3896-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..f50d97ca795f 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -242,11 +242,11 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	vdev->entity.ops = &sun4i_csi_video_entity_ops;
 	ret = media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
 	if (ret < 0)
-		return ret;
+		goto err_clean_subdev_entity;
 
 	ret = sun4i_csi_dma_register(csi, irq);
 	if (ret)
-		goto err_clean_pad;
+		goto err_clean_vdev_entity;
 
 	ret = sun4i_csi_notifier_init(csi);
 	if (ret)
@@ -266,6 +266,10 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
+err_clean_vdev_entity:
+	media_entity_cleanup(&vdev->entity);
+err_clean_subdev_entity:
+	media_entity_cleanup(&subdev->entity);
 err_clean_pad:
 	media_device_cleanup(&csi->mdev);
 
@@ -282,6 +286,8 @@ static void sun4i_csi_remove(struct platform_device *pdev)
 	vb2_video_unregister_device(&csi->vdev);
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
+	media_entity_cleanup(&csi->subdev.entity);
+	media_entity_cleanup(&csi->vdev.entity);
 	media_device_cleanup(&csi->mdev);
 }
 
-- 
2.50.1 (Apple Git-155)

