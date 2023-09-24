Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9957F65B
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=vxKS9KC6iytiKdRb2T
	ho88kJjzndWMEjO/j3A7H4hhM=; b=hbJlbzNbkdwJvE9ncepntQnc4b6BFS3zeb
	69DhD8Rx5jVE4bpQzGiXx6G0KGRCO8OTD78i6zxT0Da3XigfR/cPmmrfr5241Sov
	U7uXTAiAEiii5qhwYpmLgCj1qzF8I/ZsgddF8XtUXhlWh+rhCV2UprizD32HXN/m
	QhUs1Elbw=
Received: from localhost.localdomain (unknown [223.104.131.178])
	by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wCHb49k6A9liNKvCw--.59887S2;
	Sun, 24 Sep 2023 15:42:29 +0800 (CST)
From: liuhaoran <liuhaoran14@163.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liuhaoran <liuhaoran14@163.com>
Subject: [PATCH] drm/sun4i: Add error handling in sun4i_layer_init_one()
Date: Sun, 24 Sep 2023 15:42:16 +0800
Message-Id: <20230924074216.17390-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wCHb49k6A9liNKvCw--.59887S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4kAr4fZr1kGw1rKrWUtwb_yoW8Gr4DpF
	4rKa45Kr10ka9aga43AF48Zw1agw40g34fWr9xArn3Xrn0yFnIk3s8G3sxKr45GrWkuw4j
	gw17ZFWqkFnFk3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UsZ2hUUUUU=
X-Originating-IP: [223.104.131.178]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiGAb0glv2oA1IfAAAsc
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

This patch adds error-handling for the drm_plane_create_alpha_property()
and drm_plane_create_zpos_property() inside the dw_hdmi_imx_probe().

Signed-off-by: liuhaoran <liuhaoran14@163.com>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index 98f3176366c0..a3343afb7935 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -224,9 +224,22 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 	drm_plane_helper_add(&layer->plane,
 			     &sun4i_backend_layer_helper_funcs);
 
-	drm_plane_create_alpha_property(&layer->plane);
-	drm_plane_create_zpos_property(&layer->plane, layer->id,
-				       0, SUN4I_BACKEND_NUM_LAYERS - 1);
+	ret = drm_plane_create_alpha_property(&layer->plane);
+
+	if (ret) {
+		dev_err(drm->dev, "Failed to install alpha property,
+			rc = %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = drm_plane_create_zpos_property(&layer->plane, layer->id, 0,
+					     SUN4I_BACKEND_NUM_LAYERS - 1);
+
+	if (ret) {
+		dev_err(drm->dev, "Failed to install zpos property,
+			rc = %d\n", ret);
+		return ERR_PTR(ret);
+	}
 
 	return layer;
 }
-- 
2.17.1

