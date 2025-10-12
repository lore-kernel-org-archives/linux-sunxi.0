Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471522F657E
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297036; cv=none; b=Q+JSUy8DT7tziG1UG1jmqKDiLnz9lnUZC2fExUC+amkay3JgGx+TBThu3rbvHiMRv21gEvoYqyvq07tXtgdZegprHxWsCp9ws06oWNDq0ptRK1q3wTJb4xK7EbFDMKRj/xxQyX+Wx3zGMzQ4zJ8zyoAAHL11beixPRQBOymPupI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297036; c=relaxed/simple;
	bh=SaVD3AEZ10Hpq8T4pFkv4DgWHHFAOjNyqWufbjTCFFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuAkkCtGZ4006j8vnUFRPZPEs84p3BeikIhha3Mdnvl+K+mV5oOBUFUOiqoP6n8lvTit/s7HepTqPWiQzynW1qJdsXwSEo+iBgwWLG4RrBF7B7drIcCgRVcywI38kveUDttlFWu9toaNxDUSYB5+5M4gBUh+bR1odmbhfggkpXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RU57Wnib; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RU57Wnib"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b48d8deafaeso791274266b.1
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297032; x=1760901832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r6Ut7kV6R9HZszR3tkt2ETSQ6gt6SVQ7s+jJ4oPNx0=;
        b=RU57WnibjqlE9cjxM+u2phcKNc0OdB7aEpgB5iNj3QsR7wIG34mvS7+xyzJNXVqusy
         oeXh+XfViL4VHDE18bTjhNLpnt70ZOV933Cf+F4Gex47zodmQ74rVvApXb6R9R0pfm3B
         Qh5yEPHlBuHhS4r5gUoOwaGiishPu2b5K4Itt9p8N3+y3Hdygcp3INbs3PuOR06DYkzH
         jiqGzp2jLNfiTGSz+sjNfsl8x/TAPeQj7cAEMPVsfdfRqkBL9zkFPEyu1OEaNCP6W7FN
         lyKrZxvOAxTcexPfP6ODVzZSJuA4JgfjAlZ38xpRVQxZlpm7iShZycYbaWXpPb0rArnG
         OhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297032; x=1760901832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9r6Ut7kV6R9HZszR3tkt2ETSQ6gt6SVQ7s+jJ4oPNx0=;
        b=RoipSRVe/M/8x6IqXI9FHeySZ+HY+hxiRPw9fA7WKDW1vLHx/TKwg31ddEZrR7HhOe
         oRnRkqsal3kNtBWlPoOyn6d8L7Lg2+oDiI60MKcETMv/PkFm5kDqVvhnXPxqA0FtQTa8
         I7ujJmYPxs5RnBMp1dxZx7x6mgo6+Ed8zGf55yErl1PxpfD7mNmrOYfVaivJxz0W/Phf
         +3preaekc4EelAsABQ3Z8YAFAwG6hq3/22L4AQkRmP+LHxVM5oyaTByjBfA4LhiBTdyS
         TZbRxNceRRj6ADZNAF3E2f9Oz5+sZm5Imr7oy4rzx5kzbFjlq/KQdT1EgL3G/Ig+TK2H
         9Wbg==
X-Forwarded-Encrypted: i=1; AJvYcCUjlkcbzua4faJXZQLayO8+Ixuw9ZBOdwmUbh6eZfA/mtPD9v9sw6KX+EsRWbNybCCi6TP9QKHI34W2ww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw08a4xLpXMm6Bmd5By2ctAHsd0l2tt4RqgfJNp5fp1Oor0BXmg
	BiX8IU7D8bINPZ4i41S3O6OJWJan/KooMLT19Pa2H0VPmuzLAbZQIGzr
X-Gm-Gg: ASbGncvocQRxiv5OtPOCpY77O0DuQyPyaXEYhKej8NvApRy9m6MkS6zZmMYYmg223Oz
	Vi5byq/aRguW6ENBi7TwYqpgCPvyF8Ufn6imfeQOtKGyfLaH05m9arwCK9nUaxydbGHmcvI8gau
	mpoU7r/6PtkoZTU/D3zVbJbNWeggizIcNJFogmEmIw/2/6csVjD+tVDFTgY7XCyizsQbhheR6Tb
	TC83uIueYVXZGw1NNzvSY5vcFO8/BZe71x2zLB7rHCQ7qN6pKJ08cdKDHO+sxjts9O7Adws33KM
	iT3rWaTV3JYw6U8pnSextoR1MPUyKndnaZczuayxaWR5+9T/IGnIdfHSx35zAaMCKVe8EV11aQz
	JTXuRTKYc/UZslhM2ohSQeNRPqcQBT6iBdtFdCc5qF59qBBxKh/CerLvj9cNrUVQfz4MgeianxW
	CdGSdzoNQecoMgFW/+KaGI
X-Google-Smtp-Source: AGHT+IGoU1lxXeWRIACneUv9HL1g56vOt419IJ1ZpZA1Fk2BOr5WzpZW402UoRq7f5Pp8L61Pkb+Rg==
X-Received: by 2002:a17:906:ef05:b0:b50:a389:7ab0 with SMTP id a640c23a62f3a-b50aa48d2d7mr2059077466b.4.1760297032494;
        Sun, 12 Oct 2025 12:23:52 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:52 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 10/30] drm/sun4i: mixer: Remove setting layer enable bit
Date: Sun, 12 Oct 2025 21:23:10 +0200
Message-ID: <20251012192330.6903-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This task is now done by plane atomic update callback. There is no fear
that bit would be set incorrectly, as all register reads are eliminated.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
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
2.51.0

