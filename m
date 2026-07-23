Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE0372058
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770542; cv=none; b=Rw4ig2y4Fhf0rHD8VgEutaAKKn0QOjLYQ9OtltyqbSMwfGLGXrOwPTejL8LfDB8UCmuKH2xNr+DmFknMZcxqItnTiTMhhtg88c5RQ4hS93+YQyExzZcpVykfScx1J0N5HiCDdgNHRWuMNAygbIr9P44BFEgNx7U77HkGr+nPi/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770542; c=relaxed/simple;
	bh=9+B0lSYbOtT/mNa8n8pzlwF+N7/unRvesgf3I/R8mRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsXoEy2GxYo1nWdTvaDkeY7FDk7mZqGEuBjFnfbD1yW+atKcHEfVy1FcAooBXCUH4QUwQH29RdTTTS2XUjzyne2sWYnwhK6xFojkETBk09ZGVig5KPwAT1nqFXS4Vzu3nVQAL5syFzs8Fs9ft1Aaskk4WGzY0p5vBy2c21P3dic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lxNuNLr2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lxNuNLr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770537;
	bh=9+B0lSYbOtT/mNa8n8pzlwF+N7/unRvesgf3I/R8mRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lxNuNLr2+tsjhNb/KyqgzsiC+habEpAVZbWWVdCmbWDe4hHTNDulOLQFUHEUUHpLA
	 D/zXoG+Djc4iRVMCrScFeHJ/QtIojYsKsPV7JIS+FVyZ/X2HvmWPJykQLFfvPMD9YA
	 JeNa6TGrdYTXHp336dJPNAQuGi/g7i5DJpdO2ePK2S5QHfUfGOD7iTpXgPHSP7m/n+
	 /y7Vtz7LEWciCp+yBrMiLlJJOfplqth3jd7Vcn+Xq5OskljnRpig1wyKeMg+EHz/UM
	 26sVCuyfwGvHOD1IMLJvFWeWoxf83/GYkvSk7Z+kDHA0d0CygyaeQwS8BZ8K7ab3Ah
	 JO3j2n0Eifo3A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A98C17E023C;
	Thu, 23 Jul 2026 03:35:37 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:40 +0300
Subject: [PATCH v9 51/61] drm/tests: bridge: Set supported HDMI version
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-51-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
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

