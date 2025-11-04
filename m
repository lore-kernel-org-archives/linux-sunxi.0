Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ECE33E35B
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279818; cv=none; b=jtB7jVzyKBW1rskIsCrYdw+3vk6ncRzFSOi5/WFNxnnWHF6Fm4Lo9C4ifhxX4MTaVjtPwOUqvh3cQBx4OtOiStlGjt/dS2VRasBW8SGsr5SU4bdmWUSFLesUJWvJprFalYPKMgW+vPKId4vj8IWLj0nReNSNdBGSjvMcVbnylQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279818; c=relaxed/simple;
	bh=FlT80Jvt6ahoDIAqeU5jws3NHItu0JW+7T1K9WvKkP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kU1nL7wy5dM5wRFWc3qL62cIjeuR8INOvNtfUfySKfssYySDeLEuIPQP68ycib1dR9NVoytTdZhUqDT8MqK3NVagiL0x9krfPyIKJPaiPDPsum1WNMoNn45aw2HHDEER2XEc4isjvtT/Q8G0YHTeBowSbw5HxzHymc6S1Rsv3gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3IaTqoZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3IaTqoZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4710022571cso54538515e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279814; x=1762884614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqox3UkaoHNgrz/QIvGOJuxPYXtBZjdwtd1IyKwMyfs=;
        b=J3IaTqoZbYZ265vSUBF2nL7KdAkvHOtFmjmixYwei1N/10rUKsLCFziQc40CQqWNS5
         ZSCJDxnIwkvNO6+OpSThOtIIb9PtXhuAJJfDFrCJowREQ8OjYsQgIJ3aI5wdpyaiHDLl
         R/FtIXzrtxYWKEPrEyOE4bvI8unPAJEawEn4XjOF0tR5WjQFhszexN+jcp64RacjtJxC
         lGHzreNZyyc+sJBJ3id1DZ4iDm4hrbKTvCUhsBZXShYziq+e96ohei+T8RDSe17oItgj
         PKfQyCH9/lwuOy1U2D5fe9Mw3wKt5mSK2ykKoiCu9ruAT7FiuRr/MFehATEtuvmmFJH3
         I+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279814; x=1762884614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqox3UkaoHNgrz/QIvGOJuxPYXtBZjdwtd1IyKwMyfs=;
        b=vOw5Ui9Usbi0X63KD1r6FihflPdzff8MaDBSTatU4ofqHUIKUknR5WrByrGZTLS3mc
         /1yjgQDHBsmoLUyFFrBdJYRBmqenBsXFWWNETKvxoAZ7bdl/2BSFkZw+O5i9IAMAxyFS
         Bh/ksVzTU9ZQLKAnKMTphVUJATWx6AX1F91ww66WhjMXO1SX8irkBJT7p3LxXEge+lvt
         WrVpukk5m6ho1edbFEvP+WsjOTYTkrsQIrTlFFVr405qVxnfLjlU1qHEMo3qf2E4Ef5N
         CibxfqUd2e6qbuEz7Ch53Y8ViDreLKyQKub7HRfhOW2al84xKLtbC/52hEZP7PMMyJQg
         IO+w==
X-Forwarded-Encrypted: i=1; AJvYcCVri8t04GwnPX+3Mc2k7WRH/wXIa+bvmofxX9UjyOxNr6JpnTZp3AZahPmnhBvl0nEdzejb/dWfIbeKzA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi5M5UhflAHovDPOxvc3rrpju0yAXBh0BWpThAo3flqFnSsFSD
	bS5yq9bEC5yqsvEegLUm5EN9diIYTnDryKiqYxZqkIfZDwZuOai+dvdP
X-Gm-Gg: ASbGncvjznzK2ybxa6wc6Zs7ntjBDzfTSnqO1DwsKoKSv7ltCvN6vjV9io79AuUily8
	wciJJi2k7xsSO7PugCkVm0tK7/abjYDoPE00Ce2lqO6uK86qh6UWybqk2H+PnIywZ5ilUIRjNEd
	Mwxna04tJkCaWuRwK30XLd2xWYbO57JFHwDcqd27+xyuTtj70zVRNp0SWmGPtBQkI8GHDUHnf5N
	S8A81jYjr2MX3PJe6V7Wmff+7BSWTpfPmjHCibueSnmUtf8JFHKB70ixNe2ybJiZHqFBpMcWgeI
	KoSUL344S4j8QPSvfA7Xjy01yZWf9+SAP3KUI+bTsSaxgWGfW+Vz5YzOHX/MGgG2A53oVq1+bAy
	1V5vsyPpi/EDlScb1umxu1/hN11ZzliroG/IeWKib3Jp5i3OBOMuBVXs2nViJyXseQuzIwYlREZ
	L6If8wqvRZpw4VQZWDUw==
X-Google-Smtp-Source: AGHT+IGHcjr5LVZvJCkn6ps5FsbaEzRecmaWoSpniwlTk12WxNdiygIkQQYkFJg+89wFF5L7fhoGZA==
X-Received: by 2002:a05:600c:821b:b0:477:54cd:2029 with SMTP id 5b1f17b1804b1-4775cdf4f48mr2528695e9.4.1762279814190;
        Tue, 04 Nov 2025 10:10:14 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:13 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 10/30] drm/sun4i: mixer: Move layer enabling to atomic_update
Date: Tue,  4 Nov 2025 19:09:22 +0100
Message-ID: <20251104180942.61538-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable or disable layer only in layer atomic update callback. Doing so
will enable having separate layer driver later for DE33.

There is no fear that enable bit would be set incorrectly, as all
read-modify-write sequences for that register are now eliminated.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- rewrited commit message

 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 24 ------------------------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 13 ++++++++++++-
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index a3194b71dc6d..1fca05a760b8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -250,24 +250,6 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 	return -EINVAL;
 }
 
-static void sun8i_layer_enable(struct sun8i_layer *layer, bool enable)
-{
-	u32 ch_base = sun8i_channel_base(layer->mixer, layer->channel);
-	u32 val, reg, mask;
-
-	if (layer->type == SUN8I_LAYER_TYPE_UI) {
-		val = enable ? SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN : 0;
-		mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
-		reg = SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay);
-	} else {
-		val = enable ? SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN : 0;
-		mask = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
-		reg = SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay);
-	}
-
-	regmap_update_bits(layer->mixer->engine.regs, reg, mask, val);
-}
-
 static void sun8i_mixer_commit(struct sunxi_engine *engine,
 			       struct drm_crtc *crtc,
 			       struct drm_atomic_state *state)
@@ -304,12 +286,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 				 plane->base.id, layer->channel, layer->overlay,
 				 enable, zpos, x, y, w, h);
 
-		/*
-		 * We always update the layer enable bit, because it can clear
-		 * spontaneously for unknown reasons.
-		 */
-		sun8i_layer_enable(layer, enable);
-
 		if (!enable)
 			continue;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8634d2ee613a..9d5d5e0b7e63 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,6 +25,15 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
+static void sun8i_ui_layer_disable(struct sun8i_mixer *mixer,
+				   int channel, int overlay)
+{
+	u32 ch_base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), 0);
+}
+
 static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
 					     int channel, int overlay,
 					     struct drm_plane *plane)
@@ -201,8 +210,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->crtc || !new_state->visible)
+	if (!new_state->crtc || !new_state->visible) {
+		sun8i_ui_layer_disable(mixer, layer->channel, layer->overlay);
 		return;
+	}
 
 	sun8i_ui_layer_update_attributes(mixer, layer->channel,
 					 layer->overlay, plane);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index dcc4429368d6..727117658c6c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,6 +18,15 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
+static void sun8i_vi_layer_disable(struct sun8i_mixer *mixer,
+				   int channel, int overlay)
+{
+	u32 ch_base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), 0);
+}
+
 static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
 					     int channel, int overlay,
 					     struct drm_plane *plane)
@@ -320,8 +329,10 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->crtc || !new_state->visible)
+	if (!new_state->crtc || !new_state->visible) {
+		sun8i_vi_layer_disable(mixer, layer->channel, layer->overlay);
 		return;
+	}
 
 	sun8i_vi_layer_update_attributes(mixer, layer->channel,
 					 layer->overlay, plane);
-- 
2.51.2

