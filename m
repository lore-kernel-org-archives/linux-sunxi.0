Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A6033E377
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279811; cv=none; b=M627N23y9nBcR5DMECLzURfGT72QLRRQMPAZtvt1/i+CS2oBqep8/0lw24sTXkuPAGN5vQeqW3gJXJofjLgwziNEl3S/9+CghsGUHEJfsEaYVbQzJ1FykcRdbHYxYuOuN5xyLlc5Ov0G+J9H9Tu+U2Z3QQgmcXoq9jpDHms+7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279811; c=relaxed/simple;
	bh=v75gTyjSy2HSa3UfhJ4KqrZ90JgtcxjZBdZ9oY7/Htg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzULA0qWvJGRWL5X1Eu/BZsZdyjMkN4drAJXyDSmWSlk2FWnp1hGoqCcvtyWvU4Hby+CDVMYjBQJZ3gn7E/oBomBQnRR3UXdYA+IjnaAwbyv6SFmyreBg6H7B9gm6VtiM2c9XTyXiVXDJq2V5VoWwPn2zTissldy3suPnEhqZj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNRmGrxg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNRmGrxg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47755de027eso7473375e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279807; x=1762884607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/mUaml8jAYrXfg/EZn9k2T0kOPXbCuOkx1KYxiElS0=;
        b=VNRmGrxgXSeiFIX9ietq/d5UvWUBfi2YeQq1Iv5UE3AY7qGBkJB01kOMMqM5JWQL0N
         DKL6ol8lMPup64MZsnxzWYbiRijc3zPpRKP0aQKMT8MywkwZ1v/X5FUKCNCQ5F3sY3na
         7JpM2I4hHNfmuZnSCwEm8KoGwmpvf8/dkjSfOU6v8perS6bCAVVIhRO6y47K/tztWx9U
         48xz58hIoNDHO12/XK3YY2XzBU5g26c3m0Vtwrp5rF5mgsXWwmESYB24VxP5IqH1+eYy
         F9Og5fS9oMlrHutBHVOxwf/7elZHa+ePjkVsOrGPabU3pYAQ4UqP3kAGyY4oP8DJdTzz
         uCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279807; x=1762884607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/mUaml8jAYrXfg/EZn9k2T0kOPXbCuOkx1KYxiElS0=;
        b=Hv+juTMorQr9ACi2eD/Z/KAtqCXXEVdxxV4l2h+J5FI9KCW4wH7pkyTxfFTabGODzV
         Mm8L1AV3s1s2sXjtpN0PN5F86cWfn7P/B7hDlvqnwQpTpSP4PRdiwUTb/1ZLFs7vsvXc
         H13g+lDnSkBUWXbt+r+cRiHhGbIANB4lxRStyaO3n4IuFllNl33pqnUNGg8/CXhwffkX
         3mYMkADI2m42gP+NYxbo4XkbSFLFfzAwSPiwWtTJvzk6ElEwTEEfH9lSAUGwwQ7ianu1
         GpY8kvr3NM0hu3RfMCPd2AeI8QkmHcRn4jk1uF7Rz6mF9DnEL+/xu26uli9JvU9210VS
         o02g==
X-Forwarded-Encrypted: i=1; AJvYcCWEz8r1dPFwQFZop82KJmkP6qZRELpHsaP2jrfQFp1671KtdKNiAyFnimBW2Xn6eHuFo8eAAeiaQSEDaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaW/7kRoHFvzxiN6ZTJ7rq0HuxiwEvAGON9U1OM7yvgHN2qUjm
	cEaoF+k1zSBI80uGE37lmxge7MAs4EUy/Zv3zY4UnrEKdZLxZkUJQJLr
X-Gm-Gg: ASbGncvRnmWTytU6koXN7np8H8nKadpFNesQRIT5Q9CnlW09JO535sX6u6/SKW8PXke
	I+SA1JwqzHkE83M344hsMiVYdrVi4SHOfoNkWutS08wOv+t2rjXsm4r0qKCYj87zM3254aUEQFa
	6b5eE8AbA34zQ/e5oHhAfylnnMxEXoVNHVcd9f5GnI0Db+KmTrO8KErWMajntnBEaq46CnvGrtW
	5s83SqC8WT/6BOfOZMwFSo5T0rV4zuXkCaN5vXbb3tAzXaZG4W/eNHtPoUXrKlDc3BP4Iz1EyhD
	kj3wMIzckhsedBatIj7VwPuAQL62RbrfXSkeoncMKtcor0IQggPhvE64YO64ZjBVekyLANO5Rzs
	WC0CcQATW+hA6lQLmu61vNKdr1vxfRVyjueO8ni3Tsa117Q1ijNcnhxfNFW9pZgzofOYWoRbhVs
	U/FSJjr0ciC92TOUjwRQXPMcLcMXQB
X-Google-Smtp-Source: AGHT+IFmRzImpuQKxnU59wlPaEzVIfge0eS811Rho4boK9lxVttq6F0W8N4VKTddLMFMzKY8tP/Egw==
X-Received: by 2002:a05:600c:608a:b0:475:de68:3c2e with SMTP id 5b1f17b1804b1-4775ce3ebedmr2220945e9.40.1762279806649;
        Tue, 04 Nov 2025 10:10:06 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:06 -0800 (PST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 04/30] drm/sun4i: ui_layer: Move check from update to check callback
Date: Tue,  4 Nov 2025 19:09:16 +0100
Message-ID: <20251104180942.61538-5-jernej.skrabec@gmail.com>
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

DRM requires that all checks are done in atomic_check callback. Move
one check from atomic_commit to atomic_check callback.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- fixed commit message

 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9b786e5c7f3c..fce7b265c5d8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -134,16 +134,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
-	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-	if (ret || fmt->is_yuv) {
-		DRM_DEBUG_DRIVER("Invalid format\n");
-		return -EINVAL;
-	}
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
 	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
@@ -201,7 +196,9 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	int min_scale, max_scale;
+	const struct drm_format_info *fmt;
+	int min_scale, max_scale, ret;
+	u32 hw_fmt;
 
 	if (!crtc)
 		return 0;
@@ -211,6 +208,13 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	fmt = new_plane_state->fb->format;
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret || fmt->is_yuv) {
+		DRM_DEBUG_DRIVER("Invalid plane format\n");
+		return -EINVAL;
+	}
+
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-- 
2.51.2

