Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6533C276F
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353230; cv=none; b=h/1cM2queqA7qnEqF2wJz8ZS8PjLKqnkRYirDZ4ZfrPhG2zRGw1IlpZhfkGoBr7CJYFxBkNn57oJllTavpJqm4JMV6dmds7jXoOnN4q3zjJ3ujBfYTgjNP9p31ungkVyXVbCB0t57iL6fZO/uxqKxk39mhake4ABKG7mLICUf0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353230; c=relaxed/simple;
	bh=dJZiUI/nXwbVKeTyU5YlTJh5eS1vXANNoICbkU5BWMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzZA0pA83JeB3dF1IEnDealZN3n2usXVHyCo/Ro7LZAa81WVpl980Yfb4GWE34Yo/aiGtNJ1uWwjWwTeJfIoaLAknAqtrqRCYYLUGrvFqG9ExrjJlb5VhOq1HwmrrLdlwXxDGRQPW02fgjBh9eCx6kJhQJpFISiydWFzcwFDe3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUON6Mld; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUON6Mld"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-449de065cb3so2793962f8f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 09 May 2026 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353226; x=1778958026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFHSVkKikAqL7V5/tk/bF1gVjwq2bK7i4HjBHfLDqaU=;
        b=bUON6Mldfv0yMaIb+l1u/SoO2rkgeijKzw7p1WIw1qKY9YbIOYUK56EPIya5k1SHBE
         95Of0NZr7DzXIel7XYYi7PVwOxw5Eq1aw6m8eK9nBVzlVPR8aicW+SI57wXfyXKznmK2
         8FwQ/yrCMJivU1Hg9zK9Ph7m/vhz1j0yT0U+iCPr9+++d0x3DiUGMg0vPXr1mCQ3PII6
         YtQoeMYtKRFjThtU1P270ruGA1axWtfYuIgAzaOx8veVJX9vU4V/lpK8FCeHgoB8TgAX
         f6KhlRskU2WXd31QjsK0eIRPfEh1xWVCYG4bdn9igNjfimupDjGqxN03z6CXIWsOd3W4
         hGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353226; x=1778958026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFHSVkKikAqL7V5/tk/bF1gVjwq2bK7i4HjBHfLDqaU=;
        b=Oyog5h+pEZPULkYFLnI4SFw6wq7LOzOXAkUvQ3yGilCQUVZjk/GhE18StOm31baX+J
         2526zLpeuXY78VPLaIU5kAr22FFbTAaOVxm7E8zbbB4uyeorQ8YIIkhEXIHsRYdG2vEt
         8pehQKhEUccEpobk5cO3uWVe7osMaeewu2W1A/94cuHCpBj0emSLza483InUJAHWdHAf
         P31KggC3Cc6viNqvsu/e2JX5p0YSma5dvI9kTPW837QEclgxLMc0/ATj8BYTwosWtzSm
         F+EojzyLu7YlHh2MugAvTMXWCkn4Uurn0bR4LA+jP8drFu9tgFHGW/sIU0lFDXKIPoiz
         1OXg==
X-Forwarded-Encrypted: i=1; AFNElJ8T7Mf1glF9gGA8du5UykCNuumNem6TJ2HNjiM0gUw64/Z/+889x1xg3hKpLpNmuvEciHQreDjqgDHWXA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1uJkdglyhIdg3wbZiB4BcbLIIo1sYOvfvoW1j6IDMW7gdLn20
	hdzGmTFTM6bF7ZbBdQA+txAVjOy9mFFRvM0cj3xuzgumx+tDVWcALe+a
X-Gm-Gg: Acq92OHNQIvQFqtPilmGUqx/dTCGPUzaLDgB6C3iVhRQUegzSpd4gZXtZjvXU80RCoR
	5UtavkwnOTbYPxUIDwDlXM4UhqCf3Mejh2RAzW2+ZkZc/HYAwt7G6Dv7sxI22Qc83r2Xbb29T5e
	csnv8HU/xT87iM5Iar+pbhgFEgi0g4vNEBOaabe+Qju5E8RoR4d0xE7BDKsakZJsZUfqOIiDY/v
	dZ1vJl7OIbzM6r50T8t7E9aK3BUu7Na/3wqyHYSub9yHT/Uyq68vSpvv15XqJ5MoIwl9qyzT0IX
	6ezG2n4pEIzUuEv6pAfYzBCrbtbJJ9ggG3YkC094vQPhUor7idPl8+5XuoBS4nr02+2+n2n4TSM
	5qC33G6dW/AbiyNdw97LS4fMfCFhomMFDXEIfP7QzduqD2OIaRSPyKAa2pLkNv0zM4wyyFtkhzp
	p9iUL3e6+YXAhW90Tl2FarbZSaLX4cun7TzRMmAKEiYVHUqjucjq4lTW6gm9jp5EWDnjs=
X-Received: by 2002:a05:6000:40dc:b0:43d:309b:9c4f with SMTP id ffacd0b85a97d-4515b056c90mr27920879f8f.6.1778353225999;
        Sat, 09 May 2026 12:00:25 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:25 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH v2 4/8] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat,  9 May 2026 21:00:11 +0200
Message-ID: <20260509190015.79086-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- collected tag
- generalize check to be dependant on scaler feature

 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 40 ++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index cd8d6c2da0c7..afbd41a18a0e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -380,6 +380,33 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+static const u32 sun8i_vi_layer_de3_no_yuv_formats[] = {
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
+};
+
 static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -410,8 +437,17 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->cfg = cfg;
 
 	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		formats = sun8i_vi_layer_de3_formats;
-		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		/*
+		 * TODO: DE33 drivers doesn't support scaling yet, which is a
+		 * requirement for YUV support.
+		 */
+		if (layer->cfg->scaler_mask & BIT(phy_index)) {
+			formats = sun8i_vi_layer_de3_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		} else {
+			formats = sun8i_vi_layer_de3_no_yuv_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_no_yuv_formats);
+		}
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
-- 
2.54.0

