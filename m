Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0D619885F
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Apr 2025 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659537; cv=none; b=fPObHytT9lvMw8Jyk2RIE6XysNB/ZLzyMWUHCi6tkGX0XxndZv56d/eBmRwizg9/S5eZW4AVF9Kq5/j8g3BBOI+JDfv2PiONjPjUtA6WQWXIZ/N9hwCBGeTGPnPmq1UfLb1udq+u8kldkP/vrW0qtT9mcScciTlYzQpgPzfC7Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659537; c=relaxed/simple;
	bh=xqaWFB2eEfyjUN2xMOM8m6X3PZ0qLCEaxIqtF51PdEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5U2p4S9+l/EzXPsDdhX8ZXlLhFogcljJT4gyVv/x8Q40HlukFdwh45bwHNkpS4JoUwUvUaQJseSYSdt4NFBf1ep/D9AuGl9Jt+5V+RU+DmWLvdDK+aeIhMv9ZTVVSIuVctxHY9BCXwC5gew3/1DxDZQuFCNA6rmqUSrwCjQGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6oF8eCv; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6oF8eCv"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso809684a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Apr 2025 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743659534; x=1744264334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41S4es1vorl5OsNJysl7iKCyKcDv122Tfjuk/+jgW1g=;
        b=W6oF8eCvvKHFckKyTacQYExA8s5lIaxOAQU01pFcAUrSowRTAEg8LrII2CcHe4LI+N
         ovfGV5PRuwtFQYH5l7yuvOcElNiHJyGpMnqPNmlAJsjXpzzheK/1stfsPAVjSnoGTVRk
         m4bzwWwpApaPGapjiqfcHxOC6opQSWTS6ISLTPDnCdLq5u3iMnif4xSK3RltrMfHJ8h+
         AB4fidJTfYRGw1HaVUfxL/kb/99XM7zr77beES21WYpA1lt6S57Eev1tMhazLLW3gX1i
         jzL51/iVUUbDO6Cd2i1E9xsqcx57gH5p8maFxMbE8F1xCJs6MnjZi2fYfNCjiPN++7OW
         7HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659534; x=1744264334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41S4es1vorl5OsNJysl7iKCyKcDv122Tfjuk/+jgW1g=;
        b=l/uwf8d0taEWkOAjkjMfJnVfxiB3b0GhdCZj7HBraBr8F+E/jak6NG1pKcXW9Hdkny
         QdWt+bU71ENR16/eyTn5Rjcasp3/3yGFEUhkwLR952TeoPigh/kvi4L/H3uD/hrY2ofi
         ma8dtV7/W6OTknKFZCrftS8bNTuOd2zKadGi4EuRkWnn1nIid+4a8AmIm8MHTrmfoAjT
         RBxKkcV+zvU3zm3/vTp29jIrWrBXhDu/cfLnvr5ksV6hbqAaBnQGJ5lV5VewN7ueprIX
         hAoAlfRdogu+Cvo+3xLwC9nwLNBV1Blfn65MM8vu0NvyuBk8Cii8Oyt5cGUFMFZqR90n
         OXDw==
X-Forwarded-Encrypted: i=1; AJvYcCUYNd+VWa/GH5EOv7hitCICrlLsYvhk1Fv2xp4rrDjN5RjiMbRbVap7gWFYpvSf4/pljOfaDOMSrCTi1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJhktARkWsfos318SCjjU4z+T1rvgf24CfHw5XA6cBGr9syEKY
	xNGtud2XFBLWayexA/YDsGeraj8Iq75e+ZyUVRVZKFR4fZNsoXDK
X-Gm-Gg: ASbGnct5Y9v1RSxZbyID2QloZKZetkGrld6HtIPGjcV6MxcyDm9ghiL/YzDU+XuvSLy
	rha3B3obQDUCLKWVaKXTiCT6dSl5c17UkSoo6oz6MM3uF/NnzKE6xb8gwv37g/cr3XG5Vars/+/
	g/ChaaS97wfYxVFpaz4dKJnTfqqZajmWPTUBDAW5xpVnoo+b1O6y49kLZWgm5bEhkjEXj5BLFO+
	U8/T4bM0z4k6YVHMz12r0ZR+kcZ9AIWtGu7zdIUmB5XL3JsJIukHpsgS7Ha68S6GiE5guPu6sB4
	JPK6opKcMOnyo0IX5ZwwFnlHRDyM8P8MvbHi7ZwNfMi9F3fMjjD64BR6+cFSjAl9mCZBeG5jaQK
	+AbXYOkqJeveLDC3512F7V4ZIgQ0nNq5krcJwkfNmTQ==
X-Google-Smtp-Source: AGHT+IGvOCvIqvOLzLo5rKC+/GzFkobXsM4xMWpa8Y6+du0CrzHRHpNOACAws2OZUfVAnczPiZyASw==
X-Received: by 2002:a05:6402:42c5:b0:5ed:6192:3759 with SMTP id 4fb4d7f45d1cf-5f04e6df712mr3822253a12.0.1743659533634;
        Wed, 02 Apr 2025 22:52:13 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 22:52:12 -0700 (PDT)
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
Subject: [PATCH v2 1/3] drm/panfrost: Add PM runtime flag
Date: Thu,  3 Apr 2025 07:52:08 +0200
Message-ID: <20250403055210.54486-2-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403055210.54486-1-simons.philippe@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
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

Add GPU_PM_RT flag, and implement in
panfrost_device_runtime_suspend/resume.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 33 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index a45e4addcc19..93d48e97ce10 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -406,11 +406,36 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
 static int panfrost_device_runtime_resume(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
+		ret = reset_control_deassert(pfdev->rstc);
+		if (ret)
+			return ret;
+
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
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
+		clk_disable(pfdev->clock);
+err_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
+		reset_control_assert(pfdev->rstc);
+	return ret;
 }
 
 static int panfrost_device_runtime_suspend(struct device *dev)
@@ -426,6 +451,14 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_suspend_irq(pfdev);
 	panfrost_gpu_power_off(pfdev);
 
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
+		if (pfdev->bus_clock)
+			clk_disable(pfdev->bus_clock);
+
+		clk_disable(pfdev->clock);
+		reset_control_assert(pfdev->rstc);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index cffcb0ac7c11..861555ceea65 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -36,10 +36,13 @@ enum panfrost_drv_comp_bits {
  * enum panfrost_gpu_pm - Supported kernel power management features
  * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
  * @GPU_PM_VREG_OFF: Allow turning off regulators during system suspend
+ * @GPU_PM_RT: Allow disabling clocks and asserting the reset control during
+ *  system runtime suspend
  */
 enum panfrost_gpu_pm {
 	GPU_PM_CLK_DIS,
 	GPU_PM_VREG_OFF,
+	GPU_PM_RT
 };
 
 struct panfrost_features {
-- 
2.49.0

