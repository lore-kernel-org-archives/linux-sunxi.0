Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD327F
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 17:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1667843477; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+XyDxogaUVBf6HS7jo+DZrvfm9xqEIXgQV4MasKyac=;
	b=I4WGMPR7s2z5M/wHNBc/ayUSIPqMHRc4uyoGTHcaF7jQfd347WPruo18xlo7qIezQ+++S4
	qEJrLUIK9LyFsOWst/V8Qu3CQ3bD2svIWL14fhc3AOj5nzULXuI2WBmAL99apdBy8EYM2n
	S+xEBCam5RvZu0k+2GHgkxKdsS8n3GQ=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 06/26] drm: sun4i: Use the dev_pm_ops provided by modeset helper
Date: Mon,  7 Nov 2022 17:50:46 +0000
Message-Id: <20221107175106.360578-7-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

Use the drm_mode_config_pm_ops structure exported by
drm_modeset_helper.c, which provides the exact same PM callbacks.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index d06ffd99d86e..8147b2abe5ba 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -13,6 +13,7 @@
 #include <linux/of_graph.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
@@ -339,27 +340,6 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 	return count;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int sun4i_drv_drm_sys_suspend(struct device *dev)
-{
-	struct drm_device *drm = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_suspend(drm);
-}
-
-static int sun4i_drv_drm_sys_resume(struct device *dev)
-{
-	struct drm_device *drm = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_resume(drm);
-}
-#endif
-
-static const struct dev_pm_ops sun4i_drv_drm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(sun4i_drv_drm_sys_suspend,
-				sun4i_drv_drm_sys_resume)
-};
-
 static int sun4i_drv_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
@@ -440,7 +420,7 @@ static struct platform_driver sun4i_drv_platform_driver = {
 	.driver		= {
 		.name		= "sun4i-drm",
 		.of_match_table	= sun4i_drv_of_table,
-		.pm = &sun4i_drv_drm_pm_ops,
+		.pm = pm_sleep_ptr(&drm_mode_config_pm_ops),
 	},
 };
 drm_module_platform_driver(sun4i_drv_platform_driver);
-- 
2.35.1

