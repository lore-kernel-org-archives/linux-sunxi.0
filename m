Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18E3AA197
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Feb 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770381329; cv=none; b=dHQa7UPNcEOFrspMYYuA19kcYlxI8/+x7OCJpBRDwqp/NpP5L20+vYIyiNgH/paT87J9aG7fREv+nLlCpMuM/1/od1H/mf+bx68MW7jdjgbDMu9g7pPkHkDjeCvxqM3GkPdVwSeZNQwE2RZvkkX2HeCOGxORL2VE2mRgbarFPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770381329; c=relaxed/simple;
	bh=+G7N0NCeWpH5sO5UAdANmGLtEtncFZE84BA13C8/i9k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pdABBaqsFxTx2BddlpLsLpa4mUbGZDcloVSrkXd55kMR6uJy9lSUh6mUBjpa5E72AKo4MH595LM7D21HlmLXERmzvxudQ+SXjo54Hmkzf9bmpOMjdUYPRrXXaOg33r2fz+27OtTPmwU62wEPnQ57ONR0BKkxPoLDtGO/WA7icGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUSvid6u; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUSvid6u"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43629377370so794414f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Feb 2026 04:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770381327; x=1770986127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8L+MplGnfLupn0gC3EMJ4Rrvkql9QUJsgcWoyz8+F+4=;
        b=ZUSvid6uVDbdyfox4k09stYBwODZK73jdrw0h3qjXsjCT/VuMY4kF+M/Yf3CvtIA4V
         5VPEYfPARtfve6FFSJ0dsBol74+la6CpPIddDTNOo+nq98b2BvO5I1GgqoortlRFGnVh
         IWlg/lW799veds/gdXMEDCWk3unQ1zeVpqbn2UOOb7lRIRLrYwv7YJlgyp34E/cx3cDh
         zzG2szsy+34WwhjWlL6PGEOils1crxP+S1irJOXprwdKs+GWuKQajJ2gMDsIdDyl2lem
         C0W4DPT9MnWwDe+Yz7hR6FU95Ta7iJJanaP+SyZLViw5d303/ULVjOErGZjM17oFRfER
         Sgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770381327; x=1770986127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8L+MplGnfLupn0gC3EMJ4Rrvkql9QUJsgcWoyz8+F+4=;
        b=bPVJOTZSBDHE81YDjzINK4zAiq7A8kZ6Or8MyiYF+Zo3NF42lp89X8Jt5B52CvI6u1
         usocMHz4EcjlkVNXr2WHYNobz9sP62bPaGoprznj715CigZGGhmPswC3UeSEX1gVmxxt
         afdEuA/D4eZ1JtPxJvyhoHbymCn+pIq+DwEqCctFTia5AsqWOwyByKepruwijjOYL7Ld
         bmF16m+Gt/klMa5i+MJoozs82BDuN2/lzbWcPaZ/sJYOFxD+45hAoGO2AgQkqQmOveQe
         h2huwdCrIcaoGCgES0DIMmuZJihGEMdz9VI2DPfiWwhYHXDbpHgXOlhJMH6QUFciKfTi
         58yQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/GxNu2Qcllkrc0j/JlCc2/cYrWivyDN+ZJZrb65zI6UIGyoHlqSZ9cDTmwEzbm8RlVIIkc3yS2JVArw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKQ4vRsDBS+WeAVfSICOcIIUvKpyWHxd1j1x9LAuC2B9z3Rv/l
	vJ9ES6qJhWpcxlX64sxgIA+c3C0Dd/i+FDF3BPSeRdknfM5zYxIcqg3WxwKLySjZ8K08gA==
X-Gm-Gg: AZuq6aKVCGUiNb48AK2rJmHTR0BdgPuhx4nT0qFnz9IP/bAtX+YyCnWQG+4+MW8c2Tr
	8Se0khDDnlJX1ng0pwn4AeGDKibz6UCEgPjn0Cvh4fldh8m+1k89tqQAfEp+K2xRkbqaUgUxVI8
	GH+xaLRyjCjA9hg7w5RneVM8Os6z7taxnlb/wdE5upcAWr3gbqc1L0bs0EkYshR5bLm+SOPbKI9
	YY5QBc9atBEPxFfoT3RcAT9ARaYwAevE9fJ3OIf06GtaNofOPVJLkkQa3G6PO/7vcdW8/vXs1Bj
	wvMikz/wxhKn+VWWQVZgCAvc7wgUhJvZAbPrbots3rkjZWE5UIFElW59oWnG3XT8x4U3gycggW6
	DVD+gw2nILj9TvHCNCaXeqrIU+YizV6JlPQ82fQwEgO/yypC2X3q8chs8GHcWqi/cfjEQjMcdoc
	aDuryHO+xiRzVcd0QTpn/jy/rRwTREa9MVqHXnWcNdE6W3V6wZmTigvrhV9np1LM90spAM5g==
X-Received: by 2002:a05:6000:2384:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-4362938b1ddmr3942356f8f.40.1770381326957;
        Fri, 06 Feb 2026 04:35:26 -0800 (PST)
Received: from thinkpad ([5.238.217.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362974b230sm5892524f8f.36.2026.02.06.04.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:35:26 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH] media: sun6i-mipi-csi2: Use V4L2 subdev active state
Date: Fri,  6 Feb 2026 16:04:55 +0330
Message-Id: <20260206123455.46476-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the V4L2 subdev active state API to store the active format.
This simplifies the driver not only by dropping the bridge mbus_format
field, but it also allows dropping the bridge lock, replaced with
the state lock.

The sun6i-mipi-csi2 hardware does not perform any format conversion.
Enforce identical formats on the sink and source pads in the set_fmt()
and init_state() callbacks.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 110 +++++++++---------
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 2 files changed, 54 insertions(+), 58 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index b06cb73015cd..42384e2c9458 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mipi_csi2_device *csi2_dev)
 			   SUN6I_MIPI_CSI2_CTL_EN, 0);
 }
 
-static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev)
+static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev,
+				       const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi2_dev->regmap;
 	unsigned int lanes_count =
 		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
 	const struct sun6i_mipi_csi2_format *format;
 	struct device *dev = csi2_dev->dev;
 	u32 version = 0;
@@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	struct v4l2_subdev *source_subdev = csi2_dev->bridge.source_subdev;
 	union phy_configure_opts dphy_opts = { 0 };
 	struct phy_configure_opts_mipi_dphy *dphy_cfg = &dphy_opts.mipi_dphy;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *mbus_format;
 	const struct sun6i_mipi_csi2_format *format;
 	struct phy *dphy = csi2_dev->dphy;
 	struct device *dev = csi2_dev->dev;
@@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	unsigned long pixel_rate;
 	int ret;
 
-	if (!source_subdev)
-		return -ENODEV;
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
+	if (!source_subdev) {
+		ret = -ENODEV;
+		goto unlock;
+	}
 
 	if (!on) {
 		v4l2_subdev_call(source_subdev, video, s_stream, 0);
@@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Sensor Pixel Rate */
 
@@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 		goto error_pm;
 	}
 
+	mbus_format = v4l2_subdev_state_get_format(state,
+						   SUN6I_MIPI_CSI2_PAD_SINK);
 	format = sun6i_mipi_csi2_format_find(mbus_format->code);
 	if (WARN_ON(!format)) {
 		ret = -ENODEV;
@@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	/* Controller */
 
-	sun6i_mipi_csi2_configure(csi2_dev);
+	sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
 	sun6i_mipi_csi2_enable(csi2_dev);
 
 	/* D-PHY */
@@ -274,10 +281,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	/* Source */
 
 	ret = v4l2_subdev_call(source_subdev, video, s_stream, 1);
-	if (ret && ret != -ENOIOCTLCMD)
+	if (ret && ret != -ENOIOCTLCMD) {
 		goto disable;
-
-	return 0;
+	} else {
+		ret = 0;
+		goto unlock;
+	}
 
 disable:
 	phy_power_off(dphy);
@@ -286,6 +295,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 error_pm:
 	pm_runtime_put(dev);
 
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -308,21 +319,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
 				      struct v4l2_subdev_state *state)
 {
-	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN6I_MIPI_CSI2_PAD_SINK;
-	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_state_get_format(state, pad);
-	struct mutex *lock = &csi2_dev->bridge.lock;
+	unsigned int pad;
 
-	mutex_lock(lock);
+	/*
+	 * This subdev does not perform format conversion,
+	 * initialize both pads identically.
+	 */
+	for (pad = 0; pad < subdev->entity.num_pads; pad++) {
+		struct v4l2_mbus_framefmt *mbus_format;
 
-	mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
-	mbus_format->width = 640;
-	mbus_format->height = 480;
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
 
-	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+		mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
+		mbus_format->width = 640;
+		mbus_format->height = 480;
 
-	mutex_unlock(lock);
+		sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+	}
 
 	return 0;
 }
@@ -340,53 +353,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_state *state,
-				   struct v4l2_subdev_format *format)
-{
-	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi2_dev->bridge.lock;
-
-	mutex_lock(lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_state_get_format(state,
-							     format->pad);
-	else
-		*mbus_format = csi2_dev->bridge.mbus_format;
-
-	mutex_unlock(lock);
-
-	return 0;
-}
-
 static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
-	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi2_dev->bridge.lock;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(lock);
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN6I_MIPI_CSI2_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+	sun6i_mipi_csi2_mbus_format_prepare(&format->format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_state_get_format(state, format->pad) =
-			*mbus_format;
-	else
-		csi2_dev->bridge.mbus_format = *mbus_format;
+	/* Set the format on the sink pad. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	*fmt = format->format;
 
-	mutex_unlock(lock);
+	/* Propagate the format to the source pad. */
+	fmt = v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_SOURCE);
+	*fmt = format->format;
 
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops = {
 	.enum_mbus_code	= sun6i_mipi_csi2_enum_mbus_code,
-	.get_fmt	= sun6i_mipi_csi2_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun6i_mipi_csi2_set_fmt,
 };
 
@@ -502,8 +494,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 	bool notifier_registered = false;
 	int ret;
 
-	mutex_init(&bridge->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
@@ -532,6 +522,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 	if (ret)
 		return ret;
 
+	/* V4L2 Subdev finalize */
+
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret < 0)
+		goto error_media_entity_cleanup;
+
 	/* V4L2 Async */
 
 	v4l2_async_subdev_nf_init(notifier, subdev);
@@ -565,6 +561,7 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 error_v4l2_notifier_cleanup:
 	v4l2_async_nf_cleanup(notifier);
 
+error_media_entity_cleanup:
 	media_entity_cleanup(&subdev->entity);
 
 	return ret;
@@ -579,6 +576,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_csi2_device *csi2_dev)
 	v4l2_async_unregister_subdev(subdev);
 	v4l2_async_nf_unregister(notifier);
 	v4l2_async_nf_cleanup(notifier);
+	v4l2_subdev_cleanup(subdev);
 	media_entity_cleanup(&subdev->entity);
 }
 
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
index 24b15e34b5e8..d72dfbd6a993 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
@@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
 	struct media_pad		pads[SUN6I_MIPI_CSI2_PAD_COUNT];
 	struct v4l2_fwnode_endpoint	endpoint;
 	struct v4l2_async_notifier	notifier;
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct v4l2_subdev		*source_subdev;
 };
-- 
2.34.1

