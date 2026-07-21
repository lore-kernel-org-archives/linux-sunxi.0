Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098ED34DB4A
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jul 2026 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624426; cv=pass; b=aPkvANo5+kp1kf9JOgxz58l7Y3WZU+6iCrdB+BJMjXB4PEKx0Fm8SxT0sQm2icdDI3HDaihg7oV6+hDaj1Meo/AOwWWshv9Ycb914ZfuqTR8qYlpAoBWImK1pyvrttVEan3gV/ZLa7RYQBN/kcoeW2vmn5CJe9dJNNW3/0CxlLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624426; c=relaxed/simple;
	bh=Qx0G/Yn6jsLmyegpc6a/oPwrF6iNdGErqHDLOxg/M/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SedSMulggpETSjhrQ1DrQwkYRr2wZRZC8s5bzQlk1l7UkMVw5n7iPiDm5/7tEI9koGKHDMv8OTHZ4BPoQ+5nFflVVm0rUag9mHtAt/5WmzpYnaukIP59nPRrgEYMw5lFa3U0gAJRf9oTRt4OsuQ6at0L14YXoCCoSOmnzL0vOsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=hmXhdRS5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="hmXhdRS5"
ARC-Seal: i=1; a=rsa-sha256; t=1784624384; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h5xljdTgT+s0PcGqm50zaHhb6nAkfZ5U6gX+BspX8AkrlrdYG0Oh+wY5fkuz5kxBLDy43LsEkLBRsSsDg3SqyjU2RlqUW/ABk8LBZ07s2pTc92MHxf2fDCbhUpvCAutgLbEXXtdm23hiSHXAhEgFOC5f4Uop1oR7rkp15MKWKiM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784624384; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Nf4YfT/PVuNJI6rw/ahjdO4P2Ufeq7Km/8hgSrV69+M=; 
	b=DNFjxAaVNFiL5zgS29wQ6MkGYJpgISrYyT1q/4ypVJTJLyPqlUGMvZMzSYY0DEMZ9qgc4fuj9bCl/rvnAqzzbzcjRaXGvweYogCDCKXkq/WB+tKsjDqz7ETPdkcsCeDZNc2UA4gWUEE8ydd5RKl1LVqeYNr3M9bV9QHRtb64Jkc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784624384;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Nf4YfT/PVuNJI6rw/ahjdO4P2Ufeq7Km/8hgSrV69+M=;
	b=hmXhdRS5RBkTEI/CYLOIBIKL13OBlmSoFw352AyAKjQBZY/o8pc5uPygYEWg8IvA
	DrBYlTOD/cs47VtjOTreJuuyJp4o3X4VKx/0t8pCbAYSDU/iUOpBLzCUacQrYR2r5HB
	3HYzQrB65M7pMpbV4vcOIRhpgrbmJn8w82UU9VSU=
Received: by mx.zohomail.com with SMTPS id 178462438340847.379787705359604;
	Tue, 21 Jul 2026 01:59:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 21 Jul 2026 10:59:00 +0200
Subject: [PATCH v7 4/5] drm/debugfs: Move HDMI debugfs registration to
 state helper
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-scdc-link-health-v7-4-92df1b6ad5fc@collabora.com>
References: <20260721-scdc-link-health-v7-0-92df1b6ad5fc@collabora.com>
In-Reply-To: <20260721-scdc-link-health-v7-0-92df1b6ad5fc@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

The HDMI debugfs files are only useful for connectors that already make
use of the HDMI state helpers. In addition, relying on HDMI-specific
functions in drm_debugfs.c can lead to circular linking problems later
down the line.

Move hdmi_debugfs_add() and friends to a new helper in
drm_hdmi_state_helper.c, and make all current users (vc4, sun4i, bridge)
either use it as a debugfs_init func, or call it directly in its
debugfs_init func.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c  |   3 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 154 +++++++++++++++++++++++
 drivers/gpu/drm/drm_debugfs.c                   | 157 ------------------------
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                  |   1 +
 include/drm/display/drm_hdmi_state_helper.h     |   3 +
 6 files changed, 162 insertions(+), 157 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8b54069fa53a..00feb73e63d7 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -263,6 +263,9 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 		if (bridge->funcs->debugfs_init)
 			bridge->funcs->debugfs_init(bridge, root);
 	}
+
+	if (bridge_connector->bridge_hdmi)
+		drm_hdmi_connector_debugfs_init(connector, root);
 }
 
 static struct drm_connector_state *
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ce17eeefc2da..8d5ee10ceb87 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/debugfs.h>
 #include <linux/export.h>
 
 #include <drm/drm_atomic.h>
@@ -965,6 +966,159 @@ drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
 
+static ssize_t
+audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct drm_connector_hdmi_infoframe *infoframe;
+	struct drm_connector *connector;
+	union hdmi_infoframe *frame;
+	u8 buf[HDMI_INFOFRAME_SIZE(AUDIO)];
+	ssize_t len = 0;
+
+	connector = filp->private_data;
+	mutex_lock(&connector->hdmi.infoframes.lock);
+
+	infoframe = &connector->hdmi.infoframes.audio;
+	if (!infoframe->set)
+		goto out;
+
+	frame = &infoframe->data;
+	len = hdmi_infoframe_pack(frame, buf, sizeof(buf));
+	if (len < 0)
+		goto out;
+
+	len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+
+out:
+	mutex_unlock(&connector->hdmi.infoframes.lock);
+	return len;
+}
+
+static const struct file_operations audio_infoframe_fops = {
+	.owner   = THIS_MODULE,
+	.open    = simple_open,
+	.read    = audio_infoframe_read,
+};
+
+static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
+					    struct dentry *parent)
+{
+	struct dentry *file;
+
+	if (!connector->hdmi.funcs ||
+	    !connector->hdmi.funcs->audio.write_infoframe)
+		return 0;
+
+	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	return 0;
+}
+
+#define DEFINE_INFOFRAME_FILE(_f) \
+static ssize_t _f##_read_infoframe(struct file *filp, \
+				   char __user *ubuf, \
+				   size_t count,      \
+				   loff_t *ppos)      \
+{ \
+	struct drm_connector_hdmi_infoframe *infoframe; \
+	struct drm_connector_state *conn_state; \
+	struct drm_connector *connector; \
+	union hdmi_infoframe *frame; \
+	struct drm_device *dev; \
+	u8 buf[HDMI_INFOFRAME_SIZE(MAX)]; \
+	ssize_t len = 0; \
+	\
+	connector = filp->private_data; \
+	dev = connector->dev; \
+	\
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL); \
+	\
+	conn_state = connector->state; \
+	infoframe = &conn_state->hdmi.infoframes._f; \
+	if (!infoframe->set) \
+		goto out; \
+	\
+	frame = &infoframe->data; \
+	len = hdmi_infoframe_pack(frame, buf, sizeof(buf)); \
+	if (len < 0) \
+		goto out; \
+	\
+	len = simple_read_from_buffer(ubuf, count, ppos, buf, len); \
+	\
+out: \
+	drm_modeset_unlock(&dev->mode_config.connection_mutex); \
+	return len; \
+} \
+\
+static const struct file_operations _f##_infoframe_fops = { \
+	.owner = THIS_MODULE, \
+	.open = simple_open, \
+	.read = _f##_read_infoframe, \
+}; \
+\
+static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector, \
+						struct dentry *parent) \
+{ \
+	struct dentry *file; \
+	\
+	if (!connector->hdmi.funcs || \
+	    !connector->hdmi.funcs->_f.write_infoframe) \
+		return 0; \
+	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
+	if (IS_ERR(file)) \
+		return PTR_ERR(file); \
+	\
+	return 0; \
+}
+
+DEFINE_INFOFRAME_FILE(avi);
+DEFINE_INFOFRAME_FILE(hdmi);
+DEFINE_INFOFRAME_FILE(hdr_drm);
+DEFINE_INFOFRAME_FILE(spd);
+
+static int create_hdmi_infoframe_files(struct drm_connector *connector,
+				       struct dentry *parent)
+{
+	int ret;
+
+	ret = create_hdmi_audio_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_avi_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_hdmi_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_hdr_drm_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_spd_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void drm_hdmi_connector_debugfs_init(struct drm_connector *connector,
+				     struct dentry *root)
+{
+	struct dentry *dir;
+
+	dir = debugfs_create_dir("infoframes", root);
+	if (IS_ERR(dir))
+		return;
+
+	create_hdmi_infoframe_files(connector, dir);
+}
+EXPORT_SYMBOL(drm_hdmi_connector_debugfs_init);
+
 static int clear_infoframe(struct drm_connector *connector,
 			   const struct drm_connector_infoframe_funcs *funcs,
 			   const char *type)
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index ae1c6126c2c5..a72f9723d3a9 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -633,161 +633,6 @@ static const struct file_operations drm_connector_fops = {
 	.write = connector_write
 };
 
-static ssize_t
-audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
-{
-	struct drm_connector_hdmi_infoframe *infoframe;
-	struct drm_connector *connector;
-	union hdmi_infoframe *frame;
-	u8 buf[HDMI_INFOFRAME_SIZE(AUDIO)];
-	ssize_t len = 0;
-
-	connector = filp->private_data;
-	mutex_lock(&connector->hdmi.infoframes.lock);
-
-	infoframe = &connector->hdmi.infoframes.audio;
-	if (!infoframe->set)
-		goto out;
-
-	frame = &infoframe->data;
-	len = hdmi_infoframe_pack(frame, buf, sizeof(buf));
-	if (len < 0)
-		goto out;
-
-	len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
-
-out:
-	mutex_unlock(&connector->hdmi.infoframes.lock);
-	return len;
-}
-
-static const struct file_operations audio_infoframe_fops = {
-	.owner   = THIS_MODULE,
-	.open    = simple_open,
-	.read    = audio_infoframe_read,
-};
-
-static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
-					    struct dentry *parent)
-{
-	struct dentry *file;
-
-	if (!connector->hdmi.funcs ||
-	    !connector->hdmi.funcs->audio.write_infoframe)
-		return 0;
-
-	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
-	if (IS_ERR(file))
-		return PTR_ERR(file);
-
-	return 0;
-}
-
-#define DEFINE_INFOFRAME_FILE(_f) \
-static ssize_t _f##_read_infoframe(struct file *filp, \
-				   char __user *ubuf, \
-				   size_t count,      \
-				   loff_t *ppos)      \
-{ \
-	struct drm_connector_hdmi_infoframe *infoframe; \
-	struct drm_connector_state *conn_state; \
-	struct drm_connector *connector; \
-	union hdmi_infoframe *frame; \
-	struct drm_device *dev; \
-	u8 buf[HDMI_INFOFRAME_SIZE(MAX)]; \
-	ssize_t len = 0; \
-	\
-	connector = filp->private_data; \
-	dev = connector->dev; \
-	\
-	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL); \
-	\
-	conn_state = connector->state; \
-	infoframe = &conn_state->hdmi.infoframes._f; \
-	if (!infoframe->set) \
-		goto out; \
-	\
-	frame = &infoframe->data; \
-	len = hdmi_infoframe_pack(frame, buf, sizeof(buf)); \
-	if (len < 0) \
-		goto out; \
-	\
-	len = simple_read_from_buffer(ubuf, count, ppos, buf, len); \
-	\
-out: \
-	drm_modeset_unlock(&dev->mode_config.connection_mutex); \
-	return len; \
-} \
-\
-static const struct file_operations _f##_infoframe_fops = { \
-	.owner = THIS_MODULE, \
-	.open = simple_open, \
-	.read = _f##_read_infoframe, \
-}; \
-\
-static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector, \
-						struct dentry *parent) \
-{ \
-	struct dentry *file; \
-	\
-	if (!connector->hdmi.funcs || \
-	    !connector->hdmi.funcs->_f.write_infoframe) \
-		return 0; \
-	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
-	if (IS_ERR(file)) \
-		return PTR_ERR(file); \
-	\
-	return 0; \
-}
-
-DEFINE_INFOFRAME_FILE(avi);
-DEFINE_INFOFRAME_FILE(hdmi);
-DEFINE_INFOFRAME_FILE(hdr_drm);
-DEFINE_INFOFRAME_FILE(spd);
-
-static int create_hdmi_infoframe_files(struct drm_connector *connector,
-				       struct dentry *parent)
-{
-	int ret;
-
-	ret = create_hdmi_audio_infoframe_file(connector, parent);
-	if (ret)
-		return ret;
-
-	ret = create_hdmi_avi_infoframe_file(connector, parent);
-	if (ret)
-		return ret;
-
-	ret = create_hdmi_hdmi_infoframe_file(connector, parent);
-	if (ret)
-		return ret;
-
-	ret = create_hdmi_hdr_drm_infoframe_file(connector, parent);
-	if (ret)
-		return ret;
-
-	ret = create_hdmi_spd_infoframe_file(connector, parent);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static void hdmi_debugfs_add(struct drm_connector *connector)
-{
-	struct dentry *dir;
-
-	if (!(connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-	      connector->connector_type == DRM_MODE_CONNECTOR_HDMIB))
-		return;
-
-	dir = debugfs_create_dir("infoframes", connector->debugfs_entry);
-	if (IS_ERR(dir))
-		return;
-
-	create_hdmi_infoframe_files(connector, dir);
-}
-
 void drm_debugfs_connector_add(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
@@ -815,8 +660,6 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 	debugfs_create_file("output_bpc", 0444, root, connector,
 			    &output_bpc_fops);
 
-	hdmi_debugfs_add(connector);
-
 	if (connector->funcs->debugfs_init)
 		connector->funcs->debugfs_init(connector, root);
 }
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index e99f52ebb26f..e6c4f121ad0c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -292,6 +292,7 @@ static void sun4i_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs sun4i_hdmi_connector_funcs = {
+	.debugfs_init		= drm_hdmi_connector_debugfs_init,
 	.detect			= sun4i_hdmi_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.reset			= sun4i_hdmi_connector_reset,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 17c8635c5afa..ea1f2013b20e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -513,6 +513,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.debugfs_init = drm_hdmi_connector_debugfs_init,
 	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 13375bd0f4ae..596c57d9d250 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -3,6 +3,7 @@
 #ifndef DRM_HDMI_STATE_HELPER_H_
 #define DRM_HDMI_STATE_HELPER_H_
 
+struct dentry;
 struct drm_atomic_commit;
 struct drm_connector;
 struct drm_connector_state;
@@ -29,5 +30,7 @@ void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 			      const struct drm_display_mode *mode);
+void drm_hdmi_connector_debugfs_init(struct drm_connector *connector,
+				     struct dentry *root);
 
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.55.0

