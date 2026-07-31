Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669346AA92
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514813; cv=none; b=o9xfNhvW7IX7ou2/2sHHlm1nBpdAcgtzQ94gdJ0QZv29T6TdKMZLNwFkd0D+mUcm/yk1RXVj7HYOPfoXcA5k7ZqY+gVOHZMbqcFcJuNyo2RgMNYDwfwVFhuQ35vI5WGH6cwwkwks+zto12GVvymQwK3uXFvDJB3eDFtgqI84EJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514813; c=relaxed/simple;
	bh=9+B0lSYbOtT/mNa8n8pzlwF+N7/unRvesgf3I/R8mRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FMHxgjcMD0QbxKop/OoN2nxThvJ+zQz4gjhRz8f+GcRMUoyjS79NeEOYChIvBIs61DVR8MraFwkAVJEwEawuw5/0K2jbmIhZRUDjEvAwCRjTu9xacO/ofpUi+NQxSrwff7m6J/7nui6rz4HcWqPNvG8e1LIyqWve8Vrq9vKuxBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IIwuyw5B; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IIwuyw5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514796;
	bh=9+B0lSYbOtT/mNa8n8pzlwF+N7/unRvesgf3I/R8mRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IIwuyw5BA8jWEPG+nGLqT+NOCEphHcfyU5Bv02DsdqmgRqmnlqBRA5WyVs4xzvgK9
	 XQ1FXf4obJSaq/BTvb9wd4aKLbCyuqZG8CgM/+kN9ipMDhdOaxlS4+uMBxuflW08ll
	 55QCZEvTLx+Mk7PSZTwTvMGUPKiIVPwS6D7gFAViwqTGrS1bIGPxS07eiJcOb1R2Zv
	 TngoOaQTi4RbDv5bJTO4V+NRRxZ5/IkThkb0SpeS7d1zhVZI17VC99xm2PRN1eB8tc
	 18tFrJTsU6x7M7KDvdDETwUGX5lFRVLUCTeAms24dq1+taOMlrPTVV4WEhhsaHO2D9
	 fqm6ew1wZLoyA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB5A617E09A3;
	Fri, 31 Jul 2026 18:19:56 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:20:06 +0300
Subject: [PATCH v10 59/69] drm/tests: bridge: Set supported HDMI version
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-59-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new HDMI connector initialization API
is completed.

Advertise HDMI 1.4 as the default for the test bridges, since that is
the highest version that does not require additional initialization
data.  This also avoids implying support for HDMI capabilities they do
not currently model.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index 15583ade8494..a445f71c31b8 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -497,6 +497,7 @@ drm_test_bridge_chain_init(struct kunit *test, unsigned int num_bridges,
 			bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 			bridge->vendor = "LNX";
 			bridge->product = "KUnit";
+			bridge->supported_hdmi_ver = HDMI_VERSION_1_4;
 			bridge->supported_formats = (BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
 						     BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
 						     BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
@@ -597,6 +598,7 @@ drm_test_bridge_hdmi_init(struct kunit *test, const struct drm_bridge_funcs *fun
 	bridge->ops |= DRM_BRIDGE_OP_HDMI;
 	bridge->vendor = "LNX";
 	bridge->product = "KUnit";
+	bridge->supported_hdmi_ver = HDMI_VERSION_1_4;
 
 	ret = drm_kunit_bridge_add(test, bridge);
 	if (ret)

-- 
2.55.0

