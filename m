Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA21433BB9
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Jul 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903028; cv=pass; b=C54Dn+ISSGMt0cDUMp/HWGsp1RNo3fdZscpf862QzR/Ac3/WZZKSklGzxYBAL7bwUh9VEPdGmb4J5A0IlM2DMZpB5A4P9uGNx75VpUjWbdJDZ8cbRBgZatoI3g6ReS6wQ1ji2xQdbKEBazRAcDO055GkyO5h90LmPucjFm7gJ0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903028; c=relaxed/simple;
	bh=hDUe1RQPhda6qL3w5SEastkGLPD0L2doCP9j9yz7TjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A16MQVYrcJUsl1D+aCecREQJcKjYeW/GLr+0iPcVyHkZKYWjj1ZJRHNZyaoQbCK07QaCXF0yX3ivtCNZwfr9SCbTOYZ3MkVtqdox2mdZhnAl8oYC8IqSotTUsshiZCn5hw2hi9kZ8PeYkqO1zaOqvtuOk9QqqfBXgV7NKjsvwLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=fSIPeAja; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fSIPeAja"
ARC-Seal: i=1; a=rsa-sha256; t=1784902988; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kbqIspr+cUC8RUJbXTmhve7wPOtTpcQQYaYF0QF+G16e2vFD8tD3bQob84w0GrwGydKOrDPKJL2EqRcb+gRGnSyd2WyS239IdSI1R0hW0WUXse7ZdroucX9aIFTGcfPulc71yHlLwfpVVrq6LoCydQnXQLygHo4R8FMcJiTmuI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784902988; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D0GUxHD8Q9JSYP82sYc8lospznA2NKpGPVZdowq2lU0=; 
	b=WsAyRjka3QTIYx8TxwyAosI5tq+oMdFfm+fpoBT9QVdma/R6j6+vX8WQIRZoPB7PgoLCZBDN/lGckiBo33AKVw6/DM2yKkQnmRAYgZJx0QbCmTgXa7BIlWkLFt6FHRMydhh8rG7RgpWuEr91e6F2Iiq5cuuNJPQGGeTBFJVk1aE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784902988;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=D0GUxHD8Q9JSYP82sYc8lospznA2NKpGPVZdowq2lU0=;
	b=fSIPeAjaTuCMrA5HqVEjwoVjoJCBoM9yUiSSaps+/LgJVDAi9S3WQVqaZfBjnakN
	+gRMe191iqnSElFuyEUQ0E589MGGmTSikMmy2D3S5igrhTUMpG50dhDRZVbKjHOpkIw
	pEmZWbkABlaqmORSO0PGqDfSRtSMooB6Bn4G0Z0o=
Received: by mx.zohomail.com with SMTPS id 178490298790344.75121009588497;
	Fri, 24 Jul 2026 07:23:07 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 24 Jul 2026 16:22:36 +0200
Subject: [PATCH v9 1/5] drm/scdc-helper: Don't use ssize_t return type for
 scdc_read/write
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-scdc-link-health-v9-1-bdda406d016d@collabora.com>
References: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
In-Reply-To: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
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

drm_scdc_read and drm_scdc_write, both of which are only used within
drm_scdc_helper (although exported), use a ssize_t as their return type.

This would make sense if they returned the number of bytes read/written
on success, and negative errno otherwise. However, they return 0 on
success.

Demote them to "int" as their return type, in order to avoid needlessly
using 64 bits when less suffices.

No functional change.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_scdc_helper.c | 8 ++++----
 include/drm/display/drm_scdc_helper.h     | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index df878aad4a36..8403f2390ab6 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -67,8 +67,8 @@
  * Returns:
  * 0 on success, negative error code on failure.
  */
-ssize_t drm_scdc_read(struct i2c_adapter *adapter, u8 offset, void *buffer,
-		      size_t size)
+int drm_scdc_read(struct i2c_adapter *adapter, u8 offset, void *buffer,
+		  size_t size)
 {
 	int ret;
 	struct i2c_msg msgs[2] = {
@@ -107,8 +107,8 @@ EXPORT_SYMBOL(drm_scdc_read);
  * Returns:
  * 0 on success, negative error code on failure.
  */
-ssize_t drm_scdc_write(struct i2c_adapter *adapter, u8 offset,
-		       const void *buffer, size_t size)
+int drm_scdc_write(struct i2c_adapter *adapter, u8 offset, const void *buffer,
+		   size_t size)
 {
 	struct i2c_msg msg = {
 		.addr = SCDC_I2C_SLAVE_ADDRESS,
diff --git a/include/drm/display/drm_scdc_helper.h b/include/drm/display/drm_scdc_helper.h
index 34600476a1b9..e9ccaeba56dd 100644
--- a/include/drm/display/drm_scdc_helper.h
+++ b/include/drm/display/drm_scdc_helper.h
@@ -31,10 +31,10 @@
 struct drm_connector;
 struct i2c_adapter;
 
-ssize_t drm_scdc_read(struct i2c_adapter *adapter, u8 offset, void *buffer,
-		      size_t size);
-ssize_t drm_scdc_write(struct i2c_adapter *adapter, u8 offset,
-		       const void *buffer, size_t size);
+int drm_scdc_read(struct i2c_adapter *adapter, u8 offset, void *buffer,
+		  size_t size);
+int drm_scdc_write(struct i2c_adapter *adapter, u8 offset, const void *buffer,
+		   size_t size);
 
 /**
  * drm_scdc_readb - read a single byte from SCDC

-- 
2.55.0

