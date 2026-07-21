Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CC23C13EE
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jul 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624512; cv=pass; b=LYckO1K3Fh4D4GGv++khenaQLsZ3WBqtdVZbbONWEidJAFLRzDJnNLGMUgP4OlIPaMU6QAsCW5Pa/oqMGwFqvYw9JJn6lESq5GWkooDoOgOtSCTI4SESAvufM3gG3aJ6cDETi4epJWSw9dZE9YFH+sHXkpnP8bjCCRmphjHunYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624512; c=relaxed/simple;
	bh=hDUe1RQPhda6qL3w5SEastkGLPD0L2doCP9j9yz7TjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G12njs5Lt0hvMcfS04aecSi7KGaUYtRE63fTluQTllRrBNErYVPgA4+sOUtIedVVjPG79XFkbVheHPFAQRNqbrdJSpzrctAD0ZJvIFRfre+cppe743Pcec48brgEBjNRRM93ef4QZfcTUwjGvBC02a3jGf8Hb5aYFAw6ne3huPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=MpWHJhvH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="MpWHJhvH"
ARC-Seal: i=1; a=rsa-sha256; t=1784624366; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AFOE/1f5WcKKGS2q3WzofHxMMtgS3H36V7SR69W2G9l0th5TW5nnEPLW/v2T2Y8FdY895TW9L3hETHXo472J59CduwROt88i0LrPFftRQMLALYEQTDhazY1hZ/l+A1yxnf06s9APsPIpZZ5sAm777OcpXIkJr0NhVCj70vIPVVQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784624366; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D0GUxHD8Q9JSYP82sYc8lospznA2NKpGPVZdowq2lU0=; 
	b=HL0MqyJB9KjURdAJY1H9ljKTEyysbSj3N2PcTCLoxOv9vtJrUWfLTXqbc9st95Rm633vxcBWi8DkWudT3RhktSN7JfsSXwdd2KCXv6qr73VTKP2WM5YG52bXOKuswyyG45zd5E7CuZvttGEtADcryHBH9EICbkX+/HBf8xcZSGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784624366;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=D0GUxHD8Q9JSYP82sYc8lospznA2NKpGPVZdowq2lU0=;
	b=MpWHJhvHP/XndVZNW7g2L4TueH5543MIu2BDN1tL2/gGo0/rsCqNK29tBEetIn+t
	lmHFssLNjSAKZzJzBpa59rYWqwOYZ/uWfdKnRloLi5VPKaQRaTb38idoSVM5rsizEKh
	3uBgVDAtwcTUOFODfWgPx3hkH3ZL7RZm1sNSaX+M=
Received: by mx.zohomail.com with SMTPS id 1784624364795409.78457540046713;
	Tue, 21 Jul 2026 01:59:24 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 21 Jul 2026 10:58:57 +0200
Subject: [PATCH v7 1/5] drm/scdc-helper: Don't use ssize_t return type for
 scdc_read/write
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-scdc-link-health-v7-1-92df1b6ad5fc@collabora.com>
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

