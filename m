Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129064C70
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 13:01:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 42F1F580258;
	Mon, 14 Nov 2022 08:01:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 14 Nov 2022 08:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1668430878; x=
	1668438078; bh=KvcEkAmMRtWHBKqx64tFiR5YqS1tmdZAFamCVq7jyPo=; b=I
	HDdRMJWltsZ4HUaboDoaik3a+M28R24grEWzGQZIVxYayHdRRDSoXA7jLrJeYBYR
	s4fQeC1Qr8hJw4h7e7R4WOKM6KD8SZwTqGI1yiQx2+k95tUxZbVuQ8eiUfLfpRYM
	oVcoP+z9QQxTbLGahBfAmp7xxpTThoC5bxwlX7rAUUX2HeDB/UeHAmLCsaJO+qpK
	E0wmzc411OX1audIJ2W6GDvm14ERnvl1dmG8lZYACd0Mf5Y98Vmegk8pBHNszigW
	h5qAFquNJE7s6c+0t7eTU4+oby2EnKEQAWv25sDW0NUW+k1hQGQk6xndv8+sWQa2
	f4Rpttmnk5LdL6CTYgXRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430878; x=
	1668438078; bh=KvcEkAmMRtWHBKqx64tFiR5YqS1tmdZAFamCVq7jyPo=; b=M
	9g4qmFsqgeGGxCWzn23R5nTqMlCLcsUmcX4cbsbNXW7QmCvjFPBc7/lnjfBwhc/7
	VxkHgKOU+pkE+lu6k08UVE4q43yQS7NdLfdNyggpGLjttuANinOiGegulyIFx4IW
	6/y9Te663RrbQitL1NmSacOkqJ9flSZOW9JAWMshffcJe2DO0WSrqCPzwWW8f9Wr
	8FAEwLcDQUxVg14Ei+oZUZcwtsahTuUD1r0li5qtKfaTP3IOiTDFDfpa3Bgzjkp7
	+2zLf/yTE+2gCRT81/reVgdtEHbEczcx2H0Bz0krLKF7bFygl7GBbE+F7fgv11I1
	OGM3QZJDiJqiMnct3DmZg==
X-ME-Sender: <xms:HTxyY9ANEXARmFngpDwqIs_itChQrtHlbv38ggmTF0ZRg8NXXVtcOA>
    <xme:HTxyY7jdYW38uTyMcrBw0r3J3CaDhX_CRbf6tsKY_7RsfoeQW8LPM3_ofVwnoBZVY
    Gsx74FePzbOWtaAViE>
X-ME-Received: <xmr:HTxyY4kP32wEEJkX3O2EVmMUo7JigijFL7eg8CQcnOHUqBv3cJ_4TFTFMejxBaFtBqegpzxjPxN5x1vjbJoDdmyezvw9-po-Qr0gA8Bp4klWGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeevjedukeetveevfefhhfdufeektdfgteetgfeijedtffeiffehueehtdeh
    ieekueenucffohhmrghinhepmhgrrhhgihhnshdrthhophenucevlhhushhtvghrufhiii
    gvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
    tghh
X-ME-Proxy: <xmx:HjxyY3wfHigd2X5c1Dkt8wv9-TtJEm9qwWLj0vn3YNIhZDs8Lme-Eg>
    <xmx:HjxyYySUsO-zT1Z-CISaYTvvdhGlMl9iOthytM4i-9U-yFmrg7ejTQ>
    <xmx:HjxyY6YHXv0nCLpTGaG353jteqlpIQ-ddsQz0tB-88Vusb_13xorbg>
    <xmx:HjxyY18KCy7z4--1wVU0EoHe_sfNNGMu5R_itF3_jx3gZcJbf0cJWg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:39 +0100
Subject: [PATCH v9 20/25] drm/atomic-helper: Add an analog TV atomic_check
 implementation
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-20-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Dom Cobley <dom@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4021; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=tCfA1oIusW7UK3C18EiaE2HPo/KXbcrnpAd8z81wVo8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1m9qF1vzqV58znlD6NPPq+xWfja835bx/zx+Spb72sGj
 nwI1O0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARQxFGhrlfA/duaL0YdmibUFb7o+
 r8hXVLGe9O2blhx/5PG2d9Zmdi+Ke6g0NWqalULf4/9986qb9dWhvnpHP2fc9K9W2tTj1wkh0A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The analog TV connector drivers share some atomic_check logic, and the new
TV standard property have created some boilerplate that can be be shared
across drivers too.

Let's create an atomic_check helper for those use cases.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 49 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index e1fc3f26340a..3a467013c656 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -556,6 +556,55 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 
+/**
+ * @drm_atomic_helper_connector_tv_check: Validate an analog TV connector state
+ * @connector: DRM Connector
+ * @state: the DRM State object
+ *
+ * Checks the state object to see if the requested state is valid for an
+ * analog TV connector.
+ *
+ * Returns:
+ * Zero for success, a negative error code on error.
+ */
+int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
+					 struct drm_atomic_state *state)
+{
+	struct drm_connector_state *old_conn_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+
+	crtc = new_conn_state->crtc;
+	if (!crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!crtc_state)
+		return -EINVAL;
+
+	if (old_conn_state->tv.mode != new_conn_state->tv.mode)
+		crtc_state->mode_changed = true;
+
+	if ((old_conn_state->tv.margins.left != new_conn_state->tv.margins.left) ||
+	    (old_conn_state->tv.margins.right != new_conn_state->tv.margins.right) ||
+	    (old_conn_state->tv.margins.top != new_conn_state->tv.margins.top) ||
+	    (old_conn_state->tv.margins.bottom != new_conn_state->tv.margins.bottom) ||
+	    (old_conn_state->tv.mode != new_conn_state->tv.mode) ||
+	    (old_conn_state->tv.brightness != new_conn_state->tv.brightness) ||
+	    (old_conn_state->tv.contrast != new_conn_state->tv.contrast) ||
+	    (old_conn_state->tv.flicker_reduction != new_conn_state->tv.flicker_reduction) ||
+	    (old_conn_state->tv.overscan != new_conn_state->tv.overscan) ||
+	    (old_conn_state->tv.saturation != new_conn_state->tv.saturation) ||
+	    (old_conn_state->tv.hue != new_conn_state->tv.hue))
+		crtc_state->connectors_changed = true;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
+
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
  * @connector: connector object
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index c8fbce795ee7..b9740edb2658 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -26,6 +26,7 @@
 
 #include <linux/types.h>
 
+struct drm_atomic_state;
 struct drm_bridge;
 struct drm_bridge_state;
 struct drm_crtc;
@@ -71,6 +72,8 @@ void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
+					 struct drm_atomic_state *state);
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,

-- 
b4 0.11.0-dev-99e3a
