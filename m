Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2910200A6
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 09:47:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWRH-0001YA-85; Wed, 12 Jul 2023 11:47:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWRF-00Dr5q-2M; Wed, 12 Jul 2023 11:47:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWRE-004GUJ-AJ; Wed, 12 Jul 2023 11:47:12 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH RFC v1 38/52] drm/sun4i: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:48 +0200
Message-Id: <20230712094702.1770121-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2175; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3WmcgxEhIb+kIfNsnyuONOq6syCI8py5Q4lzRW/k+0Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaCA1VEFXP3r072g5yo9cHpkC7nyFE+Lamoj IvbGdVrvy2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52ggAKCRCPgPtYfRL+ TiNPB/kBKkhZEPVyh1b/aiAjKn9Gudd8u8/3IvqoSlaTplhEYq/Rlfo586y43mYMDC9bKqFK0t3 k5Q3HHiQuvTY57c4FIbjX+22mVha0IvAWqETD/WJj4AhLg4z6b9RdIC8yRXseT8j5VcI1WTSLgq UvsuX+WcgMpIL6F08D6thKHjtKv3uoYbjwfpVWFS2T+s+x5kblhV5lqGwd8U/Xwz/pNka1Qihh6 PKZ2iYuZF/h1gXPdW+U/oHtsIG7BpJGQ6PXspJZp4UCs/Bj2k4A773eVYiAEIFXtbPwnw0ZFge0 gEetnbGfP6f0DzZtydhW5Dpsn25WrcfY1orX7KABFhpUoReX
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/sun4i/sun4i_crtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index c06d7cd45388..a1e38bcf3125 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -38,7 +38,7 @@ static struct drm_encoder *sun4i_crtc_get_encoder(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
 
-	drm_for_each_encoder(encoder, crtc->dev)
+	drm_for_each_encoder(encoder, crtc->drm_dev)
 		if (encoder->crtc == crtc)
 			return encoder;
 
@@ -66,7 +66,7 @@ static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
 									 crtc);
 	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct sunxi_engine *engine = scrtc->engine;
 	unsigned long flags;
 
@@ -96,12 +96,12 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 	}
 }
 
@@ -118,9 +118,9 @@ static void sun4i_crtc_atomic_disable(struct drm_crtc *crtc,
 	sun4i_tcon_set_status(scrtc->tcon, encoder, false);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 
 		crtc->state->event = NULL;
 	}
-- 
2.39.2

