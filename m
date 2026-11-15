Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723088;
	b=mM0ZiwSvdIfaQjiMQXaee51tKvmzhQseIfKV6xEgsZV2nSMmgb5Za8g0g4TngQqhmGzL
	 RBGuOs6sZtJAPIVgwSWo2P5VZFLPjQWpMZ/m01J7pUZIp4qaLCiik739yRU+tDCHWd3yD
	 bTdGApBOBcNKVsndWT6X/EIrBD1gbKB4mFHW85+h8edCb9v2Cx6E1KYTxYrWScOs5yFn9
	 vE/eUSvDuvaNgOSFipyzMxgUWPVF1rFHrlZ1m9mA9Qhrblpp+ne/a+BrO1VyOQOE+O82j
	 /PAlu/XjeBgO8tNaTe264r3lGuBHj5xcRmSzEbNIn+uFTpuoln0ogwy7kI3f62BN0Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
	b=QJlgmv/T74jQ83wIklrxOIDtw4jtiuxBZWOdVh4iSbxWJ73T9q5DOygowQKUncYU5FwC
	 5LFRyWsQ5C5SEFfoTnqVDhaAdtEfPMMzIQPjUBjIxjHbJ4AC+RMIGWNwypRimTOHXbK6K
	 3QJvsMynlfdLHnVoUqFHAvvNBX/wr3sudaFgqFZkZnjXqGc+bb899AhN6MLz4WMaWWR5n
	 LMl9uMXF6HL0VzG/kzROdNpvwEuuGW9vmPDnDp1cwvcU2q+yYKYU8Fry0JhUuILFx+ai9
	 cUcXWtENtz4TUfd0FIGGOsSTozev61mkBInBZ1q7O9ktbA92d2+Sk2g+zR3mNvFGr4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flW9WiU9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FB606A8A5
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C41FB606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flW9WiU9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso14906055e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 22:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723086; x=1795327886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
        b=flW9WiU9+TWPQlQAK+8Y/JrzuJ4aH7GkUy1+ZQlGDqrvmtQUCW3oXp3LHJok8BBOrI
         yED5HAqmTGgYhL6S7rTLLgtbqhe7bLF+rfZ24ZBrCHHK1CZsN0HfLMx4CyHbQzCWrCAw
         LgDRSd/50GS3S0Lq4PCL5nSzNKb2kRpXj82taFH7DS7hSK84/L7ssTvtCyLbMeYPWCmE
         pktIeCYF6TIJJr2Yu8fFOECpZMPPvuwINE9VwUFUtKzrjJaobQJJR7MgBYFoXNSp3OIN
         qsaupx/lWcLGa0cjDvHvfqk8Sce4+12CjDUAfu94v7wOc6KlRwlEV+LCR4F0HBG9sUYR
         lyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723086; x=1795327886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
        b=f25GuBBwU9BQD6pj98e+pMe00hxKPzYyKwQmOdmAq9exYo61iqwGrKK5Z74YB8WK54
         ecQOFri0AaHW9cUB9emXmTw9hYvSgfMIZ4aTpwTqIEgaYN6Y0zcR3fIqyQI2UN1k/8o8
         Ifp4kl69m29Tn/PtlMXypPhrpX1qpM7zo+yKAnflL/O9ZyAt8ftkxDVx+ZldQC7WgHCR
         6Zkam9AG0TUbwpn/lwxuKK+GKSBaC1cvDe8J8B7z0+JAfJ//1wxaJ+GBttv1K6atVgpW
         1nOumf+pwMUCTPJfBuxVEiRxmfPzfA59Qz3qQlFj0Cf6NuIafGjFst6xfhENQCVidd7D
         WOnQ==
X-Forwarded-Encrypted: i=1; AL+hErHPHj0XaDSqFdYvIMQcgrgFzNbAZwriN/3feWH0/Zd0S68mIolMoKe/6GSlXOUyhu/x16kSPtso+7epCQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+h57ZN6YUp4iy/f8KSH3AHBqg25u0mSUxTnPPqsy1PIqhZTKV2
	S0pfQZyksyokIyl9Ki+FeUaGdCQohC7gsa2mQ6cTheNixnyw2gRRkhbw
X-Gm-Gg: AYBFou27FjVVo1DgBSEkkbOWmJq2F2dNI+5W4t57z/3zUGg07bkOfPC6rDpJ/0rbI11
	oy16joJyP4Ud2HKSVwSXpOOauMtSp+bsUBvynR7McKKNtuCn4Ax26wy8BwPkEdHox5NuObl6tyA
	jUA8EzMItnFJHcjSuTCYBIgsJuoIcS5L2FJO5gk3VBnmzRrcMLw6OBHrqE5VmssXEs9MGxLbAgo
	Bu3w82wJ3MjA0iaHSpQJVYz5rfkxcSVGAsQzD3qvTcERRsqLtA8n74cIFfgKbL93uUU5uoCED5U
	ZO8jhv2NI2r+zfkveXsOt3WOjQahMS1wTSscFxGHgf1/PHK6r+goI/gNZY8Cw4xOq1qUMtG0ZvF
	3Dia6UgVehBXxfhvFCTpDeOlzL6OCQiLFMgE2A76enspKdKIGNtYHOJ0vqGzbRzIfIodG3uB4lt
	CZI+3YMVAOeCB32y5L1ACeEt5ae68CLZ9BkP1aRqcFu8nyCRMwr0owQdB6S5v+rZjixaU4emTY6
	bCOvbp/UKSaxrAaZc08njzOTmJMB3z0rS4bCRvI0oMja808XFnfO8LHQ71YJ6HxQZm9Uv5FB4xO
	baEe4z8q2JJ2ZFKwVg/LDPeIJdItoRuQ1LeZlTOepwIPrsFs27XTa7EWiPAJrjO5ArGRBrdFAN8
	BovuPjN9sAGQX42t/1NhDyfRAd/yXDxqaRhwKeAL4WgzGPY7Z2L/qhDj6+UjwZvWkrx/IvYOrou
	mVkMCYewR7dBem/4BEmhj/NJQtkoTl4BFr4GwO/z8dtb55tXQvTdhxRWNhc4dv6t5qcmjI8A169
	G2Z/iNSqjCTHQ==
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr151025935e9.13.1794723086291;
        Sat, 14 Nov 2026 22:11:26 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 4/8] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sun, 15 Nov 2026 07:10:58 +0100
Message-ID: <20261115061102.229680-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 72 ++++++++++++++++++++------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6b19fafd50ad..09d94f7f9977 100644
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
@@ -395,6 +422,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	u32 supported_encodings, supported_ranges;
 	unsigned int format_count;
 	struct sun8i_layer *layer;
+	bool yuv_support = true;
 	const u32 *formats;
 	int ret;
 
@@ -410,8 +438,18 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->cfg = cfg;
 
 	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		formats = sun8i_vi_layer_de3_formats;
-		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		/*
+		 * TODO: DE33 drivers doesn't support scaling yet, which is a
+		 * requirement for YUV support.
+		 */
+		yuv_support = layer->cfg->scaler_mask & BIT(phy_index);
+		if (yuv_support) {
+			formats = sun8i_vi_layer_de3_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		} else {
+			formats = sun8i_vi_layer_de3_no_yuv_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_no_yuv_formats);
+		}
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
@@ -443,22 +481,24 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
-			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
-		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
+	if (yuv_support) {
+		supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
+				      BIT(DRM_COLOR_YCBCR_BT709);
+		if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
+			supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
-	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
-			   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
+		supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+				   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
 
-	ret = drm_plane_create_color_properties(&layer->plane,
-						supported_encodings,
-						supported_ranges,
-						DRM_COLOR_YCBCR_BT709,
-						DRM_COLOR_YCBCR_LIMITED_RANGE);
-	if (ret) {
-		dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
-		return ERR_PTR(ret);
+		ret = drm_plane_create_color_properties(&layer->plane,
+							supported_encodings,
+							supported_ranges,
+							DRM_COLOR_YCBCR_BT709,
+							DRM_COLOR_YCBCR_LIMITED_RANGE);
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
+			return ERR_PTR(ret);
+		}
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-- 
2.43.0

