Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE22F5A09
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297032; cv=none; b=OKqC/2sWGJbR+23REP9GVQ+Zb/B9b4PebKiw4orQB+n8Po85wwV69u2aJ2POs8GaOSFd3g8q2Wtz8YLB0PtApiICfdoZ3r3AekdGTAOKk4TqWzKPvvi2OYNeOfYomkZuU5nn09aTjYXoJgMVnLndS2VfW0r9tny8AtWZ/NHaRXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297032; c=relaxed/simple;
	bh=5DSQADF6PYceeHGtb5MtZGmBEcXfqbbawxpIMOZcwi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jm0EaNbxCTdOFkCi+LDy9nmP02pRMMD6PsXNGYtTgcTYU1Ztvj5n5wf2ZJPz77xmx7fyFjBFwjnfjPVpxRT1v6dSE2OUYrPd80Y0FGRYEzjDF4qvRXGpLGDj0t6fACu9LgWp9JBAR7JA71mmJlBF1Msi7bdNQz0DLo5KFXS2AEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGmj8plR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGmj8plR"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b40f11a1027so636765866b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297029; x=1760901829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9SmCp0RhICJrtT3B0EVlMoJ5KkuRntCLc/b84MPeMA=;
        b=HGmj8plRcO6fI9ENEhsIW2myJ2LB1CNzif8YhPiMNVAbSyw7tKr82yDqJ1r6+qax2g
         VNHS0GvXWqopC11fY6dPVeMSMK2wCBMMrV/dOHA/Yw2DsNPBYXKnvj7uoWaJp+BeCVl/
         Zg8Umwke7OnfBTMxiieVM++Be3VDTrIhTx3c/pOOc1wVPvO3ujPtAD8z9fwxb8J9E2Nd
         UToS0u7aV0VVeNW9jbyuXLKZkOmkGn9nCGdKS7/qfVziRee84aJs2urDACd9MaYqrO/8
         H/SFARSVPja9GPK/kyAFQv8M4h8PfDLjVb5hXlExe/ta7+4uJPwrqxfMCJjGodr7Ggxg
         4Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297029; x=1760901829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9SmCp0RhICJrtT3B0EVlMoJ5KkuRntCLc/b84MPeMA=;
        b=OgghsbaIpcnqlAYbfUDvLB03jhFYmFshdqh+0vxS03VBB39DyLjR/rwTxp262ZkN3N
         6QO8h67GBY6bGnX1S/olB3tqgVzxSCjABXjW7tWcDu+BxiLW94P4bzXLwnM9VQa7ztcY
         OdmefNtC+DmMx7zGxVsR0wabtDcrewCV9ixVstz+W0OiK9eQt71vxR5mcYKfxOxPHJaY
         zI3y5TRCqexYgeLfPnYiM+6lSdccfN65oCk3FbKGPAXuMS7BRIBLWwcmjNv3C4sVIDO5
         smuNJXdjjpUSbQasaiNsdOrxeLFGCbfAtV+zBdk4JuiQs/2DbDPWb52KnngzEjAd49NX
         bRRw==
X-Forwarded-Encrypted: i=1; AJvYcCUkMhmp2u1LYQPzI90nK/ZZnL5yPbudfiUDohLVMPTFYoTCjGAqc+sb360j8dRE6JnE0A48vw84J4rGAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgTQrDvFw9F8htho5QL+c567cIJs2friTbwVzNSJHcac+ZU1UD
	gEvfcb3z/xPeOlG6UA2h3eIPmx+aTkrOYEFIfXzCSz29idwde90Ejy1Q
X-Gm-Gg: ASbGncu9KF41DgiE/3pnLzO/+OxJyGUKxls3f1W3gVJYeSm3p7BOx+hSYHt5T2whiyU
	BGtwT6sKo0hsDEr5CFy8i9JQ7hWvkfm3IiorbrXmgdheEUyuz0OA1f2TNC8T4zBDGHcji39eL3l
	leVtSnYeN58z1bnKvjEFPJMm52L1xuVAG4zap+ojPg6SreC5RNUlNmE49764zk9Hi8qiR3sSnfA
	+NypurCWktHTy9f1uzZgSNapM/9UkbC7bdN9x9gK+K+XVOEdjt4JTPIrhGJ2nKnIg1iI6vOai78
	++QWIMEIg2sFA8/mBLff6Li4NhiU/qxFywSnZTrKUDd6HgsZp1RLmgdwzUzAuMqdPFSqrw8Ye70
	W9BDY6JFU51rKWYN0SfsigaK2TrzhMCJsMPjH/mlK1HBpKAfAhjdM9gv8oUlPOwGfFFxyZhU8WB
	bn9CLZejdx9o+hYTSPbLraI+zz4IdE0KNuoG5ZBXqWpA==
X-Google-Smtp-Source: AGHT+IF7Qq6jQqzYZdDrJkaw6UlpFKkxTue0qnLTmhRFyadA1ihDqW2+FAH2PNlrJyvCEAGwchJGLg==
X-Received: by 2002:a17:907:980f:b0:b3e:c99b:c78a with SMTP id a640c23a62f3a-b50ac5d07e0mr2126585466b.54.1760297029128;
        Sun, 12 Oct 2025 12:23:49 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:48 -0700 (PDT)
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
Subject: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
Date: Sun, 12 Oct 2025 21:23:08 +0200
Message-ID: <20251012192330.6903-9-jernej.skrabec@gmail.com>
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

It turns out that none of the UI channel registers were meant to be
read. Mostly it works fine but sometimes it returns incorrect values.

Rework UI layer code to write all registers in one go to avoid reads.

This rework will also allow proper code separation.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 12c83c54f9bc..8634d2ee613a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,25 +25,27 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
+					     int channel, int overlay,
+					     struct drm_plane *plane)
 {
-	u32 mask, val, ch_base;
+	struct drm_plane_state *state = plane->state;
+	const struct drm_format_info *fmt;
+	u32 val, ch_base, hw_fmt;
 
 	ch_base = sun8i_channel_base(mixer, channel);
+	fmt = state->fb->format;
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
-	mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
-		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
-
-	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha >> 8);
-
-	val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
+	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+	val |= hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
+	val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
 
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   mask, val);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), val);
 }
 
 static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
-static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					  int overlay, struct drm_plane *plane)
-{
-	struct drm_plane_state *state = plane->state;
-	const struct drm_format_info *fmt;
-	u32 val, ch_base, hw_fmt;
-
-	ch_base = sun8i_channel_base(mixer, channel);
-
-	fmt = state->fb->format;
-	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-
-	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
-}
-
 static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
@@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
+	sun8i_ui_layer_update_attributes(mixer, layer->channel,
+					 layer->overlay, plane);
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_ui_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_ui_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.0

