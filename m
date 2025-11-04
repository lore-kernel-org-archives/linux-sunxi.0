Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A133F8A5
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279812; cv=none; b=W/pshIMAq24yEZlUeMWUNT0faPgDMMRojb/Pi1dml+bHD4hC3mDvG8d/rcvB1HwiBaQ4mwahLZ8FV/XpOLUb7vdUtM/5cXEIZYXBvIAvHpRK+8Q4rrzj5Qw3kMrGeZfni4IxrvxHtwz1ERkjx47cXeiGSRLIXMZc7HrIKCrc8E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279812; c=relaxed/simple;
	bh=9iuYPe+y3PbTHR/R97DFIicMKJlmsqd/U6tW26GqMxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9rhVv/dQdx7LNGftXncBXMEhTCRQCqlodo+e7RF3mrJaMMGMFkBF4Flf5PkMIibWBbu9yzCNVbmujvSkXV4uVuwSnyzaPSevm+TwFtPxBz7vvcsZdEQ+9wHyhJLqFH5tJ29DHFkE/c89TiFLFLaVKqzf2pkLDhnhrPOFYZe96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzIa/rP4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzIa/rP4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775895d69cso4840305e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279808; x=1762884608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nl1ilT/sObHTqPC76FAptDP4x6azYGMRqYkHZHMZay0=;
        b=XzIa/rP4IbI8gQh11Z7KiMfMAmS3uTohiqCfmf27HdrMHWaBepW2Jd3Nktx6j/ZSg5
         3ZYRiryVEpVUaXQcj/7PRRIL3qlcagtYTzfkWl4GdmH92U9IiquArrTcvNjBbX6Ycoqn
         h7CyR3teZxHdvw5Ga7ipnRW0NwJGRxUZqYlQy89AcNgNdcxWDtMRv7ers5xQhcxsaVxD
         vsqxTGABU1+ItmdaOs9iqBKx5eh1k9/hjaMIJWHclyqrErWqNKN3+EQVkhhxPnbdmy9Z
         yMgiLUu+lXUqFFsBmphwmiUVHSUXG2gZtF5U9H9zrDMIXejDgi2JsUYI/lipepf4RQBY
         BiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279808; x=1762884608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl1ilT/sObHTqPC76FAptDP4x6azYGMRqYkHZHMZay0=;
        b=UonHnuyUril2NKx9G228rJjdx5fVrzk7Vd9gIfLwqTWj1Y21ovpmrFA8oaaQSm7mlk
         U95uJIU0cun1o93ihBOq/azUqCJi94OuUIFcNCRMnieDWfEYwcpVlyN850Z0liwe9H1b
         UNLY9go93cLityL4kzY2ld2sDvxw+ESz+4J1+khKi8uax1PREJ5QmBnr0TTC+FcqZl3q
         CUrKZIWhbsUkDoEu8LbDM5RFF/5R+in6PPF92bY0jh8DKchySgSVp5kfSkDBOEjpWBlt
         l1xFnVjYBgF++sA7FsTU7r6XlBlC0lHZ27GriLvqE/0ErjDaiiuWeRmW4U9PAGgdwquh
         PM8g==
X-Forwarded-Encrypted: i=1; AJvYcCWY8FEw1fQMSiyJPtHOwUt22OhjJeeCrjfcVvna5Y88JoRfzEHhys0meCSZCl7083MN6OsArD55GQoFDg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxuq3FRT/WQSCbgjoz0BQC9HjkNRdpL7NLBIojRpHU+nDElV60c
	StEOJeXCecwYwRet+ZmfxjObcLA6mstDCN0YB958xSVl8uBJ5Wo+9ihQ
X-Gm-Gg: ASbGncsRcst6FnOE0tDA0+FFt5YtleeHGYATm5oXZpGfgsmwAw7WqJ09nNfry1eiHN6
	TSkUEBGLKWTL+mzP+rGi+YsUuJU6lYaJZNSr55uCJBRcx8FEcBhaORcZlqT6MgxDroat4s0Neo7
	RpGtY8SlohCD1z60Xgd0UjfhrTbXiNSvjbQY7n3+6Zbi9e8Fyl1+JVAu2uaT3z2B5YX3UVH+FRf
	PAOoBh0+ujL6tQ0ONMHfnbrnxtcw+uKCm2d37sONNmMgMtP1a93oAnxUCAyS71Hnm6IgETy+Wpx
	LQVQDKPzDy3sI2Zx7kENTF4qmP8kC/Vp/ilmOl4QXPi/GzI/o+tm9Z1fb2Kxn9GYnFcVQH8YWBT
	8XEZn1fR5a9CIsjNBnQP7qmXwmjUnrzvnuxyLk+3z+2BzvN8x6MuTKxb6KNit2TvUN5weBTEpj3
	TxjxIWRC3CDU0Kh8WT6A==
X-Google-Smtp-Source: AGHT+IEaQ0kJCmYAyDupR48ISzZYJfw4Ug61ieLu3o3gUFaY4n5a/nzq0x9jBMUVbLw7oK4nsgRXfg==
X-Received: by 2002:a05:600c:34d0:b0:471:6f4:601f with SMTP id 5b1f17b1804b1-4775cdf54aemr2431095e9.19.1762279807980;
        Tue, 04 Nov 2025 10:10:07 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:07 -0800 (PST)
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
Subject: [PATCH v2 05/30] drm/sun4i: vi_layer: Move check from update to check callback
Date: Tue,  4 Nov 2025 19:09:17 +0100
Message-ID: <20251104180942.61538-6-jernej.skrabec@gmail.com>
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

DRM requires that all check are done in atomic_check callback. Move
one check from atomic_commit to atomic_check callback.

Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- fixed commit message

 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bd6c7915bbc4..c80bdece5ffc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -217,16 +217,11 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	u32 val, ch_base, csc_mode, hw_fmt;
 	const struct drm_format_info *fmt;
-	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-	if (ret) {
-		DRM_DEBUG_DRIVER("Invalid format\n");
-		return ret;
-	}
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
 	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
@@ -322,7 +317,9 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	int min_scale, max_scale;
+	const struct drm_format_info *fmt;
+	int min_scale, max_scale, ret;
+	u32 hw_fmt;
 
 	if (!crtc)
 		return 0;
@@ -332,6 +329,13 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	fmt = new_plane_state->fb->format;
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret) {
+		DRM_DEBUG_DRIVER("Invalid plane format\n");
+		return ret;
+	}
+
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-- 
2.51.2

