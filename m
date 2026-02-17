Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AA23A98E
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310481; cv=none; b=UejzuIKrqgeOj/M4quUgUc0WZOVEfei9YBsT20vxuhv0UuST/Wj3QlMo1APTUnCHjlGE3YrsyjKNG99I9mQRR+zmxJAtGY/AGGvbOWfBsRdSA9iFyxfldZNmlIBvJUI9bkS45ji5BcO5T8zcjQF/kZ8MCqYP3gFXqLIehp7K4BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310481; c=relaxed/simple;
	bh=b6fozxzVNt91ArkkX7mMFIqIiWOrjat/rI0YNINE0Y8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s2f7z2XAAHRcINCM2DQik2dGT+UVR51dUS7mBGPpf3IHRkTYZuI1unYiIxqJHqgLWREDwhxtQnJLMDWGcqPHnVF4S5Ic2A/3L8KMQpB4o/UMhsU0OTE67Em7pi8n7FcvoIJdg61I1ypMIzLnjmU/JoJ/wzj6UJyQaSapLFsImg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXSgBQ7r; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXSgBQ7r"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4362507f0feso2499069f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Feb 2026 22:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771310478; x=1771915278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOXtW6od1zlHQjqV/EZdllOPLIouYyoAjrU3Sc1yNCc=;
        b=WXSgBQ7rPYgku3TB4jURVp35hHuTNDM9nwTo5usl0SsTXoPImnUC3voSS76TpBCFqK
         vr4c7kphDExpr00zSUSUveTv2oCm+ZGeknT/SVI2CZcB2iEFvbrGqLler88yZW77x35o
         UoR+7TXDMPoMtXOPet9wURy/PIKhdQ5wEBlBAQUbBCpiFG8TQRpqbz9kOC7Cbp7G46/4
         65onajlf4GTEQ0tj+AMH8nIGcmYLumDiQluzdfig4cjLFRY9XU7t06fEC+un/CnjsSz/
         gJxu//n3uLp3J00huJzDj0J2GN7TuEpJtqAG5IKvI9JTQ/rCFtJcraiWmvExSw0SH6fI
         ahxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310478; x=1771915278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOXtW6od1zlHQjqV/EZdllOPLIouYyoAjrU3Sc1yNCc=;
        b=a9k8RfPyLkXFlAGpFrqfBHx1CRMzgknnpVg1WRNJnHqcuw6Ta83fNGUaVuQfNmGxMA
         4McTZFRsWDklT7GQexLYgC98uOFMVPdIkoMjD0ZpYhNU4xqwuBZVSC4JwICRqcZjFjXJ
         kkUnIUhLta7OOplgbVBvT7F9uq9iYB+GA9S80fU/vz9U8rmLGDoWA+bHC5j8iQtHdmjW
         7QRePDSUzAIXBcR5YUSR/I9cB9WiY2drAumcffM1xY7FqB28Zz6Bvq12xktZNiLn1mHe
         hekg37qoHl5duoq2Zhqc8iFFwl0phHNF1WukX+jRGvThM7y2h+sLRGsdMSP1Yj5Sj1xf
         KpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9zHSqvqkxswUO0dQhhmXr5yorfb7YKN6A3ynbDtiApj8Bd5OtCZhscNnMSOZaXj7/2faO/Ld+Ukj7GQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFsiMGbi8iDGQ9AOWwMpIQoknxnn7UnOd5dtdYw72k9IdZ5MlJ
	nnv/VHj8NOAhb0nt5nbBN4DWQ11CewgeWvCJAAbWyl8r12H/G/FP5u02
X-Gm-Gg: AZuq6aL13tlHKJwVB4FKi/MgxsUVigJSmrn8Ww5R+2oRL5BDpYhtOhP8TuglpZf6PJP
	0ttTi+qxJrGY1zZaH6cXexlUEXP2pOdKwp7EZJYsWd9pBiwHLVDyA+3OWtAe54+nIa8GRJDQYlh
	TChTwg4dd5PJk4ZwnVPYnAsgxJeOexRw5FbLgoVsEcNv/wVU6CUTpg09paJblN5PAXR0ly0ASh5
	5+hH2qiiO6TmHyvE7TlIuuTpHjYI0sDZ71yNHXa0wGOlmurltM9aucI6jPjLMz+wCdqVysOhqIA
	Tj1rkps2sWBPCyuduWWJK2f4NEkbUyxpYcQ+Ep16VVlHx9whsmdUqjmDYAPXdILoD2hqZ2JeW+h
	f20nt08CERhssvkJjpYxbnHdZg3TvT4U4ZBD5xEfTQL1nnnn0tONbqeOBQY6m3GITKvVAoczx++
	oB5Vdd8t4mTX6bD5JUdRAAa21tr2lKsIYHsbVxWv5mczjwc3MvdHL4/ynokvO2F6ZriN5lUYmQS
	Oj6YZxACw==
X-Received: by 2002:a05:600c:c3dc:20b0:483:7631:befa with SMTP id 5b1f17b1804b1-4837631c7c9mr167329625e9.5.1771310477728;
        Mon, 16 Feb 2026 22:41:17 -0800 (PST)
Received: from thinkpad ([204.18.30.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dfb4bd4sm442562555e9.7.2026.02.16.22.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:41:17 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 1/3] media: sun6i-csi: bridge: Use V4L2 subdev active state
Date: Tue, 17 Feb 2026 10:10:48 +0330
Message-Id: <20260217064050.18388-2-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217064050.18388-1-arash.golgol@gmail.com>
References: <20260217064050.18388-1-arash.golgol@gmail.com>
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
---
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
index 65879f4802c0..a21a146fb02a 100644
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
+		capture_height != src_fmt.format.height) {
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

