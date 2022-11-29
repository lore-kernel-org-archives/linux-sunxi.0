Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EFAAD5D
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Nov 2022 19:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1669749479; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BEjxKDNm3i4FDiWmBekbtVQ5t/EpC9nOnul1c9i1i1M=;
	b=Taryu9xn7LuS8c0dGYEZkB9nNj0a7nz0bW0TjxOfTRSglh8anKk2e3H8RCb0mxFe8jiqET
	h9AlKR8lJOljzO1Dly2Ye7OAmnAkZoamwKHHwPKR0XQ3eHAw2F6kGRNsVQc/7fqXBe7P+b
	BOJYFPUGDN8RVcomPQ2KFZyZPc9daao=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 06/26] drm: sun4i: Define and use generic PM ops
Date: Tue, 29 Nov 2022 19:17:13 +0000
Message-Id: <20221129191733.137897-7-paul@crapouillou.net>
In-Reply-To: <20221129191733.137897-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro to create a
"struct dev_pm_ops" that can be used by this driver, instead of using
custom PM callbacks with the same behaviour.

v2: Use the DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro instead of an
    exported dev_pm_ops.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Samuel: since the code changed I had to remove your reviewed-by, sorry
        about that.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index cc94efbbf2d4..178ada09b467 100644
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
@@ -434,13 +414,15 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
 
+DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(sun4i_pm_ops);
+
 static struct platform_driver sun4i_drv_platform_driver = {
 	.probe		= sun4i_drv_probe,
 	.remove		= sun4i_drv_remove,
 	.driver		= {
 		.name		= "sun4i-drm",
 		.of_match_table	= sun4i_drv_of_table,
-		.pm = &sun4i_drv_drm_pm_ops,
+		.pm = pm_sleep_ptr(&sun4i_pm_ops),
 	},
 };
 drm_module_platform_driver(sun4i_drv_platform_driver);
-- 
2.35.1

