Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825173;
	b=t2sSMRmFO9RBdqS/POC5ADxbQsuCER3SHwy3uE5e4QgXFlnzjpG18B6VY9eAfWFNJJbx
	 LJ1TEE8zrYA7pwJnbU+VP9Yh+gycTV6YVNwmxPK67dAt0norjHSSPcl/Q168PiLBfxhGi
	 v7uxkhR5DDVqHduqoBhsQwCrOJpsmUcRlxA9lWgE89mk/fqdwOVPO74l2+3OG8hHn632o
	 ZkvCSpYe2dTIBHL//PKqxhHn4ZmRywhEBj+/RKLzy3VXvGS/uykPGvMs57Z/a+CaNWiBf
	 /cHhtzQjtg09APJ/Dc0wQU7psYMFWSYFBYro/axp4zSJzYSSbixnfo+rbLy/3hCGeFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825173;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=y7a0q8HOy+VPr1+g1ItZvGgTc1pYGBVyQJvrrdqK62c=;
	b=5hG0AJeQ/Gp0gbEX5DRtrMU/I0DgmjhyQNGCPrFVJ0A3l24e7mR9rEUJPzjLoXkTifJo
	 YtGPFzfZdXLwOtkukd497A3cs8Wokpo93nSsfyLcZSqLA7fs6I3X2y7C3OsAvMcRl2108
	 45ENhWH9PGSAk7fGy89MH2NDtQPr68g7RSW83XpqIdoj9FsAHeUDxnAZxQM9ykcwfV2TP
	 n7hFKCi1wZ0q0Cdb84YaZ4Iz2Ak2ua6pmRs8D26VVbKmzCTz4pLEaKk0kfHAiVCuuN+sJ
	 MjUfF9zfLlMbaly8jzHJzg2/66pvclkP//OfuEwad4TLS0QluGCGlVQ+NjtUSM+ddDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwjuTy90;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A38606A338
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwjuTy90
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501701F000CB;
	Mon, 16 Nov 2026 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825172;
	bh=y7a0q8HOy+VPr1+g1ItZvGgTc1pYGBVyQJvrrdqK62c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AwjuTy90Aa6n7TE18ENYiuyDNqxsZy0nTAd4fKEN8pFHemP781GXVXsbttXNX+31r
	 +Y3wwg2RYgQ45WIO5NDQy90d0/46ecRCaCrJY0x3a/WHxdieJY2w12d83rCsTL8clW
	 jdYyO6G9CHcZgaNJCt3dX2eqImTxyoecGMzkymX8aqUqRGTGW2zZr4AGK3sk/TQFxF
	 UOszkpocaM6NqhVo3UIv/iX+BZDH6vqhBVSZxQglnYl8ueKhIDegPFYnl78VpR+FIN
	 L+iFvrQ5oUFg4vcqMinchIlPjk5q6YPh2LhDgXU1svvFVP1X1y/gEsdrxZNAn0S1Ta
	 RfFhNoTNlVPGw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:52 +0100
Subject: [PATCH v2 36/64] drm/sun4i: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-drm-no-more-config-reset-v2-36-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xBKcJJXsKHEM1DlBgopNkNdLp7kgFpZeKdje7oKzFOs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bvv/7rp9tjR7x7QX1koPzPwyKjYZrQ1hOTTfyP+Qp
 ioHz7r+jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARtRTGOgO7Lar/eeuviTZO
 12WY17k20GVTzsqCdac7lUscdxc4JxzYLSWeevd+wsJtk5VPbn+szthwvyi1otj7LduZ7fxeRw+
 9tmT6v+Rkhla11lq39+pTFp3YfzbjqUp81l+Fpad6ZB4ZLRYGAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_drv.c         | 4 +++-
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c | 6 +++---
 drivers/gpu/drm/sun4i/sun4i_framebuffer.h | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index f8bbca6eb49c..248be5ff4f36 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -102,11 +102,13 @@ static int sun4i_drv_bind(struct device *dev)
 	/* Remove early framebuffers (ie. simplefb) */
 	ret = aperture_remove_all_conflicting_devices(sun4i_drv_driver.name);
 	if (ret)
 		goto unbind_all;
 
-	sun4i_framebuffer_init(drm);
+	ret = sun4i_framebuffer_init(drm);
+	if (ret)
+		goto unbind_all;
 
 	/* Enable connectors polling */
 	drm_kms_helper_poll_init(drm);
 
 	ret = drm_dev_register(drm, 0);
diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
index fc822bc2c62b..d7e5cdf76c16 100644
--- a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
@@ -22,16 +22,16 @@ static const struct drm_mode_config_funcs sun4i_de_mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs sun4i_de_mode_config_helpers = {
 	.atomic_commit_tail	= drm_atomic_helper_commit_tail_rpm,
 };
 
-void sun4i_framebuffer_init(struct drm_device *drm)
+int sun4i_framebuffer_init(struct drm_device *drm)
 {
-	drm_mode_config_reset(drm);
-
 	drm->mode_config.max_width = 8192;
 	drm->mode_config.max_height = 8192;
 	drm->mode_config.normalize_zpos = true;
 
 	drm->mode_config.funcs = &sun4i_de_mode_config_funcs;
 	drm->mode_config.helper_private = &sun4i_de_mode_config_helpers;
+
+	return drm_mode_config_create_initial_state(drm);
 }
diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.h b/drivers/gpu/drm/sun4i/sun4i_framebuffer.h
index 06901fb3a186..378f0de343d7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_framebuffer.h
+++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.h
@@ -7,8 +7,8 @@
  */
 
 #ifndef _SUN4I_FRAMEBUFFER_H_
 #define _SUN4I_FRAMEBUFFER_H_
 
-void sun4i_framebuffer_init(struct drm_device *drm);
+int sun4i_framebuffer_init(struct drm_device *drm);
 
 #endif /* _SUN4I_FRAMEBUFFER_H_ */

-- 
2.56.1

