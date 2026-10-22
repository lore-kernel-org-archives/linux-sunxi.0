Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672438;
	b=ndMx0OoMwlcepgOc3nFTp9QzlSonXgfGaEpX8RV52LGK+F6/mbtQ85GqC9DGTFFqOmbS
	 zBAcUCTAIoY86kgQW7CLs5ogfdNV+cqk5pLrIjgJ32sS79TmOF4N66yxXC7wLgSIvJcIA
	 Ck8WcKDqPJXXyPm7E/1NUdSGDwKuI1t9R/j65YX6I5S6zJ+zIx4ONelCMsL0hbOe6kCB7
	 DFPgsAjqjtC8qRTpU+MU6p2pgDILYdBzHLeizoewjyYwq0iIvMXVwzl0Fjo6PdehRD4od
	 GYDsJHouQnirz1xWHAsgVdZECGKQcLo11i5+XQAH6D5oIZJDnR4U5Ait29k79DtaJ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672438;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=R5NqjsBtdfSlBxgApwXp7wa9JoQIf7G6bjvd02RO+To=;
	b=UXsVdOIMyIyW4QUMOmd4GbUAhK7qnfzwNGr7hzki2zJiP8BjUnR7hQp6OalzsVIIGhCo
	 PbyhgmSbRGsuTsXYYx1W4xWCGC5jt2EfGY8IaN0JQXqfObqgDqPT2qjkkOjLmQtngv7HK
	 TM2pT3ug+Txezh0w7nqc/1YMkG5AYjYSWSWSm+h2ZqdGZWsig3MambGdPnSihlt76xEbQ
	 Eh4AopEeRRccn/dwb2EGS9VvoSQQyY8pucvZ0x55opMPyMqni1G+h6vqZvrplHCLsRgvT
	 Jkb33tdT1gVdX7PtqPwBOwhGHnQjrL8wL3+7U1ivUN7cAlQJTEO1WeK8yvE7u7kgglg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XG0gN8fW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6148C606A319
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XG0gN8fW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F5B1F000C3;
	Thu, 22 Oct 2026 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672438;
	bh=R5NqjsBtdfSlBxgApwXp7wa9JoQIf7G6bjvd02RO+To=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XG0gN8fWDlyEoORJM9sSAOwW8Qf0rV7hZIISN56tWT1/z3daT+Kq7Bt/JmfAtOSEY
	 BCTAgMZF2fwBJvVzsSZI3vTnU78SmEm2kg6vNEBgHiEkiQgtHJJSJhW2ZJcxZ8I13W
	 mKQgEfZ9okkd330sFutQ27OW1q4zM9osF8eudipU2pDVwykX9uTMrOlWM25QAarBXz
	 jGNNi7fp6fdl1v/bTgxnNYeKwgnSnaOkthxQJeN/QYdaIdxpPAiagk3terbNoGmZku
	 uFOlP6JKAjZDZwiuknxeMWJXxg9nBnj25FldGjLUF++OB+3oZSko+L8LCbC/bg+g83
	 TNsLXWGyyGuvw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 14:31:02 +0200
Subject: [PATCH v2 03/59] drm/atomic-state-helper: Rename
 connector_tv_reset to state_init
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261022-drm-no-more-connector-reset-v2-3-0b7e4e85b1e8@kernel.org>
References: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
In-Reply-To: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Chen-Yu Tsai <wens@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4565; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4UEBRjahnLkdgx7ZqR/1VzPz62Lw2lvUFE2DNgvNxQo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3mPq2/Gd78sBJLX/KhosfrPxCFidzTC6tXOdj++Qri
 1euwfTvHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi3JMYG7avuqMZcEj0W1q4
 u4NveHnVDhaZzQXTtD/teXo+/dWlZo7+mnsXnriWr2TcuPzO+vncExnrDN7I1a1kmHDx8evP3Qe
 dXh5Lep8f8kai+f7qQudyo3rhz52TzKu50qtv+MoFTb6k1fQGAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Recent commits renamed other reset helpers to use the state_init
suffix when they only initialize properties rather than allocate or
update the object state itself.

drm_atomic_helper_connector_tv_reset() falls in the same category:
it initializes the analog TV properties from the kernel command line
defaults without allocating any state. It also reads the connector
state through connector->state, coupling it to the reset path.

Rename it to drm_atomic_helper_connector_tv_state_init() and pass
the connector state explicitly as a parameter. This decouples it
from the reset hook and prepares for the conversion to
atomic_create_state where connector->state is not yet assigned.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 13 +++++++------
 drivers/gpu/drm/sun4i/sun4i_tv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_vec.c             |  2 +-
 include/drm/drm_atomic_state_helper.h     |  3 ++-
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 565947c544fe..3534925636d5 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -502,14 +502,15 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_state_init);
 
 /**
- * drm_atomic_helper_connector_tv_reset - Resets Analog TV connector properties
+ * drm_atomic_helper_connector_tv_state_init - Initializes Analog TV connector properties
+ * @state: the DRM state object
  * @connector: DRM connector
  *
- * Resets the analog TV properties attached to a connector
+ * Initializes the analog TV properties attached to a connector
  */
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
+void drm_atomic_helper_connector_tv_state_init(struct drm_connector_state *state,
+					       struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
-	struct drm_connector_state *state = connector->state;
 	struct drm_property *prop;
 	uint64_t val;
@@ -572,7 +573,7 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 			state->tv.hue = val;
 
-	drm_atomic_helper_connector_tv_margins_state_init(connector->state, connector);
+	drm_atomic_helper_connector_tv_margins_state_init(state, connector);
 }
-EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_state_init);
 
 /**
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index ce22f1662c0c..ea86f8a6a35e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -409,5 +409,5 @@ static void sun4i_tv_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	drm_atomic_helper_connector_tv_reset(connector);
+	drm_atomic_helper_connector_tv_state_init(connector->state, connector);
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 215b5d3dc5c5..7ab77f97df31 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -381,5 +381,5 @@ static void vc4_vec_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	drm_atomic_helper_connector_tv_reset(connector);
+	drm_atomic_helper_connector_tv_state_init(connector->state, connector);
 }
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 4dac741af22c..5e8619aeef21 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -72,5 +72,6 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector);
 struct drm_connector_state *
 drm_atomic_helper_connector_create_state(struct drm_connector *connector);
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+void drm_atomic_helper_connector_tv_state_init(struct drm_connector_state *state,
+					       struct drm_connector *connector);
 int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_commit *state);

-- 
2.55.0

