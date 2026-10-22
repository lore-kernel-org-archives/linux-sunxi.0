Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672596;
	b=ZA+7OGMqOREH6bfNq3yv5P6+QFgumTaI2oVLbEtabRf3MDf/oXbkJGxyp27ztyqxh7py
	 EOxdvWzKD4lxCAkp+ivCIbH1Qxy+w1ySmLrXy+wLqQrUW8jCrcXl3FbNA3dsbIORVxjW9
	 qe0Vx//hDOQ7A4QuHTmg88GRKtu7Mes7rb8WOpL/dJQyf76LSa+Zm4RmmX0xSKBM7MVcD
	 i7lxERJD993SB/GxTgCum57I9fPqPvBQ+CuS2mO6AJ5m88+/nEuFJxFKgbgO3E5Njn7PN
	 pc+K0XL5+slleRq6qxz6laeILcu5aY++3S9h5Upveg87RIEhHrZIwR2As0OyggtwKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672596;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LUcl12gwkN8B7VfualkhTFi3SbBn5mj0wBC5eClpxhE=;
	b=IFKZ31HA6V0TER7xODU+3Hz9YPgQAK2w1mPGxvZm7a4Wo+8CHqfxetohQU6+K7UTERlv
	 ZnBHsigsvh71hUiPfHIekL3z8Qj3+9HuP3+VihS/P0BSsiXTm0iSzkBN9i+uzKeR8v2Gh
	 1IahEwkSsYZWKXfO8YOzQTtYwxkKLKYaQyGbmNy8geYyPAHahKZVsHYVNnhH1HJPqhXnX
	 Z+Skna3Vig7znOg3wbP/IRHKih6Lzk9PtTTP4A8+VOWSjQ0v23DdFlcpnivDZnlikX+/D
	 jGrM87z+/DAYiNYQ/BcA/HjDEkXHTFryp+crTOukUKNOM455cFTNjazsOmrEmG5VXCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cswfRlBX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C5606A319
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cswfRlBX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEFE1F000C1;
	Thu, 22 Oct 2026 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672595;
	bh=LUcl12gwkN8B7VfualkhTFi3SbBn5mj0wBC5eClpxhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cswfRlBXSmu5Mf4wULxcuKDDwWwZVpnZtPbJVn+Pnn3Mx9bV8cUq9FrPs65Kj2udo
	 j8r7bdY2G57A9CICKPS7OVn5H0rwEqnTtdMvl3EL0JCnNAO0VHXznJKm3buV2UmJzC
	 0qi5iG0XoRnGTfHuhbiv2vBpuig9rabuUbo5un5scReQcaWfey6CeRLcIBZ/iVRil5
	 ArUy6XZAMYYhFI1oTQ9bfHIPrtU4KAwXFvCBu1EnOmMyYMc64za2IZQ2XzZvwO4Mtw
	 yK6U468EmHmA8WtO4inedGH+LCxyH6YS7VUr5WllA3nfEHGJ9UbUPQBZNic24cu6yU
	 TjM4k/zpMaUGg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 14:31:46 +0200
Subject: [PATCH v2 47/59] drm/sun4i: hdmi: Convert to atomic_create_state
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
Message-Id: <20261022-drm-no-more-connector-reset-v2-47-0b7e4e85b1e8@kernel.org>
References: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
In-Reply-To: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001; i=mripard@kernel.org;
 h=from:subject:message-id; bh=w9nESPjYXbVij1sc0qXET6/o4C+Z94CFJROMxWaY4s4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3mBbFnSo1su/UKjKwK88JnW+9uFD55b0lVndrhT37l
 yRfWhXSMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyWoOxVlQua5f721N//mTX
 hq+f/KHPlW3lSUsxKZ/QlSc0OpjX35m5XMdk9R+xcvdpna7H2E5/Y2yYdHfzm/tPVU/3BQslOGx
 7diA41M5RPIJB65iMsNa07Iq/bJobmHcs2fFa7XFegfblZk4A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The sun4i HDMI connector reset implementation creates a pristine
state and initializes the HDMI state. It does not perform any
hardware reset.

Since this is equivalent to what atomic_create_state expects, convert
the reset function to an atomic_create_state hook that returns the
initialized state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 3084f6570c29..58626d0562ae 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -291,9 +291,17 @@ sun4i_hdmi_connector_detect(struct drm_connector *connector, bool force)
 }
 
-static void sun4i_hdmi_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *
+sun4i_hdmi_connector_create_state(struct drm_connector *connector)
 {
-	drm_atomic_helper_connector_reset(connector);
-	__drm_atomic_helper_connector_hdmi_state_init(connector->state,
+	struct drm_connector_state *connector_state;
+
+	connector_state = drm_atomic_helper_connector_create_state(connector);
+	if (IS_ERR(connector_state))
+		return connector_state;
+
+	__drm_atomic_helper_connector_hdmi_state_init(connector_state,
 						      connector);
+
+	return connector_state;
 }
 
@@ -302,5 +310,5 @@ static const struct drm_connector_funcs sun4i_hdmi_connector_funcs = {
 	.detect			= sun4i_hdmi_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.reset			= sun4i_hdmi_connector_reset,
+	.atomic_create_state	= sun4i_hdmi_connector_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

