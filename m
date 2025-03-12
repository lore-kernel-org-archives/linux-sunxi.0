Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01CA1F152E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 23:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741821804; cv=none; b=B0DA0fPqKw/TmInrofu5Ib4cYGTsM0lHFMiWoab8UKZhlFLu1xxv2onS4FUn+MDtWRW3xe6tGJ+qRdc5OcyF4EMcklrxJzNNz1wLnNDDYFt5AgTDpvHtG7x4RPMgk3NtGEfiDkY8/lC+H9QD2XeZIja+gbC9lQS9K7v/SBViDWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741821804; c=relaxed/simple;
	bh=jKbOUFo/QpG3issCs2i4WX7naelfGHn+4IO1WTag5I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6nmE4gzvZgbJNPKBXkRyfQbc+W8SJouryaViEAFlNnhc6Z7pTZnFnpWR8UuIX27pg0xUz1J6LMzcAu1nmP/JWMXios10pF5DzP4SFu9H9/MtmQMISxkAL6nnFCz623S8+t6FW+ASuS8jrUiDglxc9t2d8fgv8IZI2Tujk/aNxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXSrr/ri; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXSrr/ri"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so611114a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 16:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741821801; x=1742426601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLItQqCf1upGBSXyTCmQWhPc9KffbuhOFWAykScbb6c=;
        b=mXSrr/riKHB64c1dFxT5KEyGb2QoiJq6+vebqGP7HZy3E25z30jsNDgvneG1nyJbQs
         fp0Yri6XI3oxGRlEcfij9pPGHZSTLkMDLhytDMDmNcG6Xds0/cXJhCrWZzl2e+znGYsc
         NMgN6zOJS++LkMGqPF54vlRtQdiBY7ZpllLykGqhIKSrSG5zkkWZULTA/4fq6+7sY5vK
         UQivJHqIK+GcOD6sYplCIiTayZYmJY1Z11PwenSe/yVtLQZ7l9H0NaGWEupIfpuBq1eO
         kkeA7A3g+//9GeUs25gp0swhtf5iX3wldqOt/Vtn9i7CTkyyZLRFH44F9xUMk/q4WMLt
         pYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741821801; x=1742426601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLItQqCf1upGBSXyTCmQWhPc9KffbuhOFWAykScbb6c=;
        b=nEPyF5mKuysB8lgHaa8fECH4QUefAuMwAsWIrGfTnPGMny64AXJ1zS/E7pWVHmf0z5
         J4TfqooSmbUrhbTazF3Ogyr+ohQIFAiOEQN8nSo/0rZt9UhuoutVJMicsZMjhsi511I4
         2kTABCztU9ASVYZte80FAsS2p6fJk25ZPMB2k7F8wQlqf+zRcxZx5LwmGZFhGGwOSZTn
         szDz+iTS8jzotxaFk9CXt1jzPFXjH2y3pTlEjueXE3I06lN2KTGN9rrB/W2JAoNzGu/W
         gjgn/4wqKJfx0OYAeriBIx0cXXW1LrzUFndKdcKfeosO0tvKsDClun1nnDouQC4BcGQw
         IvTA==
X-Forwarded-Encrypted: i=1; AJvYcCWNCnRpydWyEL/t3We0urdegTH+5vjgZCWHCB/xQyaQ+iixqNhFn+NcZVq+X+FJShDQ/005dtguT8mxPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaYrlMy4waBP3fX2yP5y30fFS1QPsQy5veK4H+Em1hTu6tmF7D
	blvCWNfEB1hulZHetvXyQMpiFnXqcNGijHNozlueo+uO2KmikNJ6
X-Gm-Gg: ASbGncuvB+0dy46iOHJPc396VLoTnx8u/xEfSNRdBTQJQpYSzkKGX6/QOvlkfXzaL3u
	V3l/yMdvNpL3pGHpbnSY2deLg4lewHf5Bhz++24b1cNNFTHTkeYBfMEd3IVqtMpE7nXSZI+iis6
	KsRykNqLO72ewr09dKEdwC0lEYd9+SAeIBtBSwDEj7BG3Cdhnogzyc9O1YR7BuN2G9jy5W4Ut8j
	a8MA7AdzxmgvK8lSX1ARrF4jDknMnC35LA2RxABOW1JzvVdvA7rKvr8O3TygbbdNrYB/sZjNNQg
	/tcFn1sddbNbht7uQpIahhMrX5SWyZIz0CMx7tTpih/bixRZ0YrHUvuP1N2MfoEGLgm1Fm03nYO
	1/Vp3CD9QRBxILxUK9GFokeUWW775wYo=
X-Google-Smtp-Source: AGHT+IGTT9lbHnlAuZxDgl2ruuPaXaEWe6rhYtxsk5VuLikqAKEjXsCw9yzdc7f50PpSyBlv1A41Nw==
X-Received: by 2002:a05:6402:5109:b0:5e0:58ca:6706 with SMTP id 4fb4d7f45d1cf-5e5e24db96amr31469423a12.30.1741821800942;
        Wed, 12 Mar 2025 16:23:20 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afe223sm26732a12.70.2025.03.12.16.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 16:23:20 -0700 (PDT)
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	=?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] drm/panfrost: Add PM runtime flags
Date: Thu, 13 Mar 2025 00:23:18 +0100
Message-ID: <20250312232319.25712-2-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312232319.25712-1-simons.philippe@gmail.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the GPU is the only device attached to a single power domain,
core genpd disable and enable it when gpu enter and leave runtime suspend.

Some power-domain requires a sequence before disabled,
and the reverse when enabled.

Add PM flags for CLK and RST, and implement in
panfrost_device_runtime_suspend/resume.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 37 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  4 +++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index a45e4addcc19..189ad2ad2b32 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -406,11 +406,38 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
 static int panfrost_device_runtime_resume(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT)) {
+		ret = reset_control_deassert(pfdev->rstc);
+		if (ret)
+			return ret;
+	}
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
+		ret = clk_enable(pfdev->clock);
+		if (ret)
+			goto err_clk;
+
+		if (pfdev->bus_clock) {
+			ret = clk_enable(pfdev->bus_clock);
+			if (ret)
+				goto err_bus_clk;
+		}
+	}
 
 	panfrost_device_reset(pfdev);
 	panfrost_devfreq_resume(pfdev);
 
 	return 0;
+
+err_bus_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS))
+		clk_disable(pfdev->clock);
+err_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
+		reset_control_assert(pfdev->rstc);
+	return ret;
 }
 
 static int panfrost_device_runtime_suspend(struct device *dev)
@@ -426,6 +453,16 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_suspend_irq(pfdev);
 	panfrost_gpu_power_off(pfdev);
 
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
+		if (pfdev->bus_clock)
+			clk_disable(pfdev->bus_clock);
+
+		clk_disable(pfdev->clock);
+	}
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
+		reset_control_assert(pfdev->rstc);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index cffcb0ac7c11..f372d4819262 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -36,10 +36,14 @@ enum panfrost_drv_comp_bits {
  * enum panfrost_gpu_pm - Supported kernel power management features
  * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
  * @GPU_PM_VREG_OFF: Allow turning off regulators during system suspend
+ * @GPU_PM_RT_CLK_DIS: Allow disabling clocks during system runtime suspend
+ * @GPU_PM_RST_ASRT: Allow asserting the reset control during runtime suspend
  */
 enum panfrost_gpu_pm {
 	GPU_PM_CLK_DIS,
 	GPU_PM_VREG_OFF,
+	GPU_PM_RT_CLK_DIS,
+	GPU_PM_RT_RST_ASRT
 };
 
 struct panfrost_features {
-- 
2.48.1

