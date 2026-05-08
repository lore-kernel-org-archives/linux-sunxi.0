Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4737F8DF
	for <linux-sunxi@lists.linux.dev>; Fri,  8 May 2026 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257047; cv=none; b=gLsgOE2DQG6NIMLd4d4KbeOIPS5pKNwXqPPlFZbHw9zFM8oKiwivKKSTfo4gd2l6kQnhjS0df42WvwQ5vT0gwHsqqDbix78F7+XxKxsQMZ9AejXDKGhyTnI9MD0NAASQlJuQnIgbFst/I/VZSwfW1bf0CnJkLmCzEQ+/hcE8DUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257047; c=relaxed/simple;
	bh=R4+nLgoVAuFWhqHVtGCJNj7vWvD4oK/DuuOzcemREh0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=srZzSvnjBZzM4+p9S6Vgr0Dv5fIsVJTE6A30/8jnDVGcWU8xxINjW9xHnvJgq5aHMCOrr95QhAEwl79A+z7Po/r+LTW+maRK4Gg25oshHG6jDy2GJMHfB93c9M9V8Z8BafsCqAgNpwfQZxFgIeEX4KSyX0EggSwSQiaskwIGRew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kybQQdA1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kybQQdA1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891b0786beso15311655e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 08 May 2026 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257043; x=1778861843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3XkqNiuObg+Eg83bTwhKKS4jJUDgRyEKJp/bfR24Wc=;
        b=kybQQdA1uRqY9J5pn4Udb6cqKgc04VxBR4oxpEa/rqfrsR6m5+G8xjEzf8BoBiK83/
         RnG8mhjQHEKDY7I9hdUu1fQ2pxcAW7GdRKygVGXJLYa7ko9ahxN6Bg+IO0NpTWwRlTWR
         GE2SXxzyvj6491DmrJLvSLmnvZ32DLqSra8xtajYCNHgxMoZym5HVTFrt89CgQnqW3Yf
         PbzY1Bxv/mTkudL/+4xTippj61HZASe6EMpTioJu7MFn9amlRkXMAG7oZPuhq1bZ94XQ
         KWWlNuIZWUlgu5LasuCx0Uxt6pSx+KRCDRb+Q7qGs8/vtYVRUWC8n3HUIXIyRv6zIYq1
         hGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257043; x=1778861843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3XkqNiuObg+Eg83bTwhKKS4jJUDgRyEKJp/bfR24Wc=;
        b=JNMyoVvjl2C9olAuzXileSnjOF4/KSpfN4QTAL+EOkP6oBylnZrIO3XTPJIsyMyMyl
         vr7x2Q/J7QHM93DsVpijLLuJ3tc/FaIh68ieR1uDajB0o95uofMwONwdKJKgN17C4bd9
         U284rw5umdVOO1WhZaCPdsWUkOUvNfsA02R8oY03wNiEeyqMD4xfPXVJ5ALTzJ5p8LXV
         FfWwVp4cbIgFf/g48QcQPhhQNDRvA3anvCzyoefoq6rUrhMN33NPAesxWdNmBN6INBrT
         VeJ7MhelepR4zk2VLZX01n/FPym/YoE7JbWfhEghvFUgq9xtiiXym5oZoRaLPvCeKqu8
         Yw5g==
X-Forwarded-Encrypted: i=1; AFNElJ+VFTC0WuuLW7zlBd58t7kgVmOu+HGeeHjUwBCRqhYOservtXFf6Q76DuX/fZZugNS5g7t82KxXP9JZPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeFOVClIbfqLtgyV9DLoRf7fG4AJ0XQkP83k++Gdb9LF7scfky
	iJB4h+M+QOZ8iJ4waTFbDtaq2J0DsUvgqajYW68BCYLiXIEv8SzxkILx
X-Gm-Gg: AeBDiesRUN4iERUUmADNRkcr1vC7OchwLTMO2/tcdg60wxV3CwCl01rHgo0IqxrLSch
	3u9gFgBq2Qb1rkcUZ0zyKxAFgQDQWNUxOjQnFLgrmS9++hjeryiVyxNgkrtOTQPGfKeKoZsNpAs
	ZRG3qhwiQWOn4JP0rHD8k3A5FVTe+RIEd+2MXLbO7amnNrpd9GcNVzjSo1MjXDpE9bDsDmGeykR
	FrvGO3CbBppYO/i8R347G/ENCEkG2YQUN128EUWdn6aorOGU4xZgYo7w/Z1fx6060ZndNrzrsMQ
	vlVedC4EunPa+/g/Jo9bVlHpH4mhJRrpwXcIkUSzFDEfd4l2z5zhTCnwcsJxt+MMu0dPfalxC5T
	P5cn3wLCv3iqgXP7GPZ36fEtW37Wjz5EbJSf+Ug+ZtjnQU9yXM2PJOI3dTHrJglIj1Wq3UuZgtQ
	eDD6TYEgX8JGj1BQU27XGh+2AaLPB4sU1BZ1qGdPsz2v2LpsVNE/22cWalLWK0WUywmJ377rB5n
	yiGWvFYmg==
X-Received: by 2002:a05:600c:8b65:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48e51f4e5fdmr240134475e9.28.1778257043079;
        Fri, 08 May 2026 09:17:23 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db098e0sm2930305e9.17.2026.05.08.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:22 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v2 1/3] media: sun6i-csi: bridge: Use V4L2 subdev active state
Date: Fri,  8 May 2026 19:47:19 +0330
Message-Id: <20260508161721.94285-2-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508161721.94285-1-arash.golgol@gmail.com>
References: <20260508161721.94285-1-arash.golgol@gmail.com>
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

Previously, capture accessed bridge private state directly. After
moving to framework-managed state, resolve the format through the
subdev pad API.

The sun6i-csi-bridge hardware does not perform any format conversion.
Enforce identical formats on the sink and source pads in the set_fmt()
and init_state() callbacks.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v2:
 - Fix indentation in link validation path
 - link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-2-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
 3 files changed, 85 insertions(+), 105 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index d006d9dd0170..4406b0f8c839 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -13,26 +13,6 @@
 #include "sun6i_csi_bridge.h"
 #include "sun6i_csi_reg.h"
 
-/* Helpers */
-
-void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
-				 unsigned int *width, unsigned int *height)
-{
-	if (width)
-		*width = csi_dev->bridge.mbus_format.width;
-	if (height)
-		*height = csi_dev->bridge.mbus_format.height;
-}
-
-void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
-			     u32 *mbus_code, u32 *field)
-{
-	if (mbus_code)
-		*mbus_code = csi_dev->bridge.mbus_format.code;
-	if (field)
-		*field = csi_dev->bridge.mbus_format.field;
-}
-
 /* Format */
 
 static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
@@ -226,7 +206,8 @@ static void sun6i_csi_bridge_disable(struct sun6i_csi_device *csi_dev)
 }
 
 static void
-sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
+sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev,
+				     const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct device *dev = csi_dev->dev;
 	struct regmap *regmap = csi_dev->regmap;
@@ -234,11 +215,9 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
 		&csi_dev->bridge.source_parallel.endpoint;
 	unsigned char bus_width = endpoint->bus.parallel.bus_width;
 	unsigned int flags = endpoint->bus.parallel.flags;
-	u32 field;
+	u32 field = mbus_format->field;
 	u32 value = SUN6I_CSI_IF_CFG_IF_CSI;
 
-	sun6i_csi_bridge_format(csi_dev, NULL, &field);
-
 	if (field == V4L2_FIELD_INTERLACED ||
 	    field == V4L2_FIELD_INTERLACED_TB ||
 	    field == V4L2_FIELD_INTERLACED_BT)
@@ -317,13 +296,12 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
 }
 
 static void
-sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
+sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev,
+				      const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi_dev->regmap;
 	u32 value = SUN6I_CSI_IF_CFG_IF_MIPI;
-	u32 field;
-
-	sun6i_csi_bridge_format(csi_dev, NULL, &field);
+	u32 field = mbus_format->field;
 
 	if (field == V4L2_FIELD_INTERLACED ||
 	    field == V4L2_FIELD_INTERLACED_TB ||
@@ -335,19 +313,19 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
 	regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
 }
 
-static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
+static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev,
+					       const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi_dev->regmap;
 	bool capture_streaming = csi_dev->capture.state.streaming;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	const struct sun6i_csi_capture_format *capture_format;
-	u32 mbus_code, field, pixelformat;
+	u32 pixelformat;
+	u32 field = mbus_format->field;
 	u8 input_format, input_yuv_seq, output_format;
 	u32 value = 0;
 
-	sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
-
-	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	bridge_format = sun6i_csi_bridge_format_find(mbus_format->code);
 	if (WARN_ON(!bridge_format))
 		return;
 
@@ -391,16 +369,17 @@ static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
 }
 
 static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev,
-				       struct sun6i_csi_bridge_source *source)
+				       struct sun6i_csi_bridge_source *source,
+				       const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
 
 	if (source == &bridge->source_parallel)
-		sun6i_csi_bridge_configure_parallel(csi_dev);
+		sun6i_csi_bridge_configure_parallel(csi_dev, mbus_format);
 	else
-		sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
+		sun6i_csi_bridge_configure_mipi_csi2(csi_dev, mbus_format);
 
-	sun6i_csi_bridge_configure_format(csi_dev);
+	sun6i_csi_bridge_configure_format(csi_dev, mbus_format);
 }
 
 /* V4L2 Subdev */
@@ -415,6 +394,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	struct sun6i_csi_bridge_source *source;
 	struct v4l2_subdev *source_subdev;
 	struct media_pad *remote_pad;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *mbus_format;
 	int ret;
 
 	/* Source */
@@ -433,6 +414,10 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	else
 		source = &bridge->source_mipi_csi2;
 
+	/* Active State */
+
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
 	if (!on) {
 		v4l2_subdev_call(source_subdev, video, s_stream, 0);
 		ret = 0;
@@ -443,7 +428,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Clear */
 
@@ -451,7 +436,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 	/* Configure */
 
-	sun6i_csi_bridge_configure(csi_dev, source);
+	mbus_format = v4l2_subdev_state_get_format(state,
+						   SUN6I_CSI_BRIDGE_PAD_SINK);
+	sun6i_csi_bridge_configure(csi_dev, source, mbus_format);
 
 	if (capture_streaming)
 		sun6i_csi_capture_configure(csi_dev);
@@ -472,7 +459,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	if (ret && ret != -ENOIOCTLCMD)
 		goto disable;
 
-	return 0;
+	ret = 0;
+	goto unlock;
 
 disable:
 	if (capture_streaming)
@@ -482,6 +470,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 	pm_runtime_put(dev);
 
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -504,21 +494,23 @@ sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 static int sun6i_csi_bridge_init_state(struct v4l2_subdev *subdev,
 				       struct v4l2_subdev_state *state)
 {
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
-	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_state_get_format(state, pad);
-	struct mutex *lock = &csi_dev->bridge.lock;
+	unsigned int pad;
 
-	mutex_lock(lock);
+	/*
+	 * This subdev does not perform format conversion,
+	 * initialize both pads identically.
+	 */
+	for (pad = 0; pad < subdev->entity.num_pads; pad++) {
+		struct v4l2_mbus_framefmt *mbus_format;
 
-	mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
-	mbus_format->width = 1280;
-	mbus_format->height = 720;
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
 
-	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+		mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
+		mbus_format->width = 1280;
+		mbus_format->height = 720;
 
-	mutex_unlock(lock);
+		sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+	}
 
 	return 0;
 }
@@ -536,53 +528,32 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_state *state,
-				    struct v4l2_subdev_format *format)
-{
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi_dev->bridge.lock;
-
-	mutex_lock(lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_state_get_format(state,
-							     format->pad);
-	else
-		*mbus_format = csi_dev->bridge.mbus_format;
-
-	mutex_unlock(lock);
-
-	return 0;
-}
-
 static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi_dev->bridge.lock;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(lock);
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN6I_CSI_BRIDGE_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+	sun6i_csi_bridge_mbus_format_prepare(&format->format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_state_get_format(state, format->pad) =
-			*mbus_format;
-	else
-		csi_dev->bridge.mbus_format = *mbus_format;
+	/* Set the format on the sink pad. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	*fmt = format->format;
 
-	mutex_unlock(lock);
+	/* Propagate the format to the source pad. */
+	fmt = v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PAD_SOURCE);
+	*fmt = format->format;
 
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
 	.enum_mbus_code	= sun6i_csi_bridge_enum_mbus_code,
-	.get_fmt	= sun6i_csi_bridge_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun6i_csi_bridge_set_fmt,
 };
 
@@ -780,8 +751,6 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	};
 	int ret;
 
-	mutex_init(&bridge->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
@@ -809,6 +778,12 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	if (ret < 0)
 		return ret;
 
+	/* V4L2 Subdev finalize */
+
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret < 0)
+		goto error_media_entity;
+
 	/* V4L2 Subdev */
 
 	if (csi_dev->isp_available)
@@ -818,7 +793,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 
 	if (ret) {
 		dev_err(dev, "failed to register v4l2 subdev: %d\n", ret);
-		goto error_media_entity;
+		goto error_subdev_finalize;
 	}
 
 	/* V4L2 Async */
@@ -852,6 +827,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	else
 		v4l2_device_unregister_subdev(subdev);
 
+error_subdev_finalize:
+	v4l2_subdev_cleanup(subdev);
+
 error_media_entity:
 	media_entity_cleanup(&subdev->entity);
 
@@ -868,5 +846,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev)
 
 	v4l2_device_unregister_subdev(subdev);
 
+	v4l2_subdev_cleanup(subdev);
+
 	media_entity_cleanup(&subdev->entity);
 }
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
index 44653b38f722..a5b0a6f064dd 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
@@ -42,20 +42,11 @@ struct sun6i_csi_bridge {
 	struct v4l2_subdev		subdev;
 	struct v4l2_async_notifier	notifier;
 	struct media_pad		pads[2];
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct sun6i_csi_bridge_source	source_parallel;
 	struct sun6i_csi_bridge_source	source_mipi_csi2;
 };
 
-/* Helpers */
-
-void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
-				 unsigned int *width, unsigned int *height);
-void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
-			     u32 *mbus_code, u32 *field);
-
 /* Format */
 
 const struct sun6i_csi_bridge_format *
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 65879f4802c0..d90abba21309 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -888,14 +888,19 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 		media_entity_to_video_device(link->sink->entity);
 	struct sun6i_csi_device *csi_dev = video_get_drvdata(video_dev);
 	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
+	struct v4l2_subdev *src_subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
-	unsigned int bridge_width, bridge_height;
 	const struct v4l2_format_info *format_info;
+	struct v4l2_subdev_format src_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index
+	};
 	u32 pixelformat, capture_field;
-	u32 mbus_code, bridge_field;
 	bool match;
+	int ret;
 
 	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
 
@@ -904,19 +909,22 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	if (WARN_ON(!capture_format))
 		return -EINVAL;
 
-	sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_height);
+	/* Resolve csi bridge format. */
+	ret = v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_fmt);
+	if (ret)
+		return ret;
 
-	sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
-	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	bridge_format = sun6i_csi_bridge_format_find(src_fmt.format.code);
 	if (WARN_ON(!bridge_format))
 		return -EINVAL;
 
 	/* No cropping/scaling is supported. */
-	if (capture_width != bridge_width || capture_height != bridge_height) {
+	if (capture_width != src_fmt.format.width ||
+	    capture_height != src_fmt.format.height) {
 		v4l2_err(v4l2_dev,
 			 "invalid input/output dimensions: %ux%u/%ux%u\n",
-			 bridge_width, bridge_height, capture_width,
-			 capture_height);
+			 src_fmt.format.width, src_fmt.format.height,
+			 capture_width, capture_height);
 		return -EINVAL;
 	}
 
@@ -947,7 +955,8 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	/* With raw input mode, we need a 1:1 match between input and output. */
 	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
 	    capture_format->input_format_raw) {
-		match = sun6i_csi_capture_format_match(pixelformat, mbus_code);
+		match = sun6i_csi_capture_format_match(pixelformat,
+						       src_fmt.format.code);
 		if (!match)
 			goto invalid;
 	}
-- 
2.34.1

