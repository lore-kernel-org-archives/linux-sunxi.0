Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373993C5DBA
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353228; cv=none; b=KtFmxCF3nWEOtAzcl7f1Hn8W/ZnV+lCszCy73fbqwslZH3zzqpPD99hIfYb3DebexIZ+FZSGcmmBGx4F92vEwL6QR/jeD13uVqS5wxPOXxHBTkyeDW9bFrqU3NpEmRRh0BHevZvawGbZEL9cJzwhUg4kaRMCaJAnV6Ws9ciNfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353228; c=relaxed/simple;
	bh=L6dj0kDI2fqtZ2CWX89EK2nkipCryFY/CsWhogL/8pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdkifIT/eFhqpVhZKcfI/jMBGYAE4Q2zKZHSdqhdD3GpjcaKS9bYR6pAIAPjHjb7znJSzk09UTUrqzrnCFYu3c1xbvN+6fHBAArgjvhUKiEKgmpuYiTWYH/vafNgled0F5C8JDJl5SeNiXu6OG02Y1+w0jwNZYhMl4YzKvBuzGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n31SSyO/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n31SSyO/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso2406775f8f.0
        for <linux-sunxi@lists.linux.dev>; Sat, 09 May 2026 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353225; x=1778958025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CrDBvKu/hcgSB1anyD1GXBKe06ZzlWC9+3i2f9q0bQ=;
        b=n31SSyO/03DFy9UJEiO9u3Ctg8DynOF/vHrbKpC7kMeF1LDCfE5+0siea4W/iQ9KpU
         vJSi7qClvYDoFPanCb69/n9iMs6Yh5Ws7DPIQUKraqpvN8H1HCh6I642iPhlcJ6vfonr
         wJq+Cj8aP+t6KN3lUIC7aGdKJIqHqeEnelKK4fOqlLJWvmQAiUuoQ4VGRuIVhTHsBw59
         FRGV4ekWLKRJ6Wefw+he4NvqaiXIlTQhGN/J3pMWb1AzYAZ5HNEZYt3ehunKyTwdGjCi
         2GcBRCx4VAEhOzWGCl0BYstE6ATBX3hZGR9HjOrX/Z+tlSCiBuA6OaTIoVdrWTwD00oa
         zQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353225; x=1778958025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+CrDBvKu/hcgSB1anyD1GXBKe06ZzlWC9+3i2f9q0bQ=;
        b=Z5QFbOm2lPjT/ax5CZ3kgH4wcFLga9DepezXqtQPAaOF2bMp3XN1asybAdNxLV8YJd
         Redifc9mjla8kWFxMp+tDb3EfTdIwEJWHDeiFSlVtTDae6KXlxC1p0usxO4DUJgabk04
         RPp8bUnlqkJym5Z7ACrCxXqVwLG2VOT7DT09Qn+YC3YUSO1FIgDvFdMCbTfj/bXrxW82
         WE47qz4wWU5xrPjCxo73EassSLb0giHNK+1ZAqD4Vb36CJIAbW55go5I5y5b/qTVrWpy
         OXDBHKGO0OHoHgyknLw+7pc5YBlfuAv3E4I78at44MZqHBikfyb1fHP5dgzTh7TIkZAB
         dmog==
X-Forwarded-Encrypted: i=1; AFNElJ862yKfbvLtbyqFDfwYE3UFGyWb51rPp9IYTUM6nPlLKaqCPwNxT+PnfNUiasWdb89q2/zMtmKLERY4IQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFxlbo0/VI4sxRcrqf3d8FcB0F+cM9F+GBus04nGX7b1fKbERL
	TooAaHNQhx99DJdWADFtmAi4lb5Yc85EKPxFzjgYCYuOrFLNQiTa9WAX
X-Gm-Gg: Acq92OGMveGCYcBxGx82JxrTAw31Mgf7Kj3KMi9dRi0lrLE6gYqRqu2ia4PyyjgeNFK
	tN7lXSfY1IzC/ypNCWw+br1TgR2vxEqDxzYtnRk0drhje2QyUcOzV9ZF9hLvEl6pqblKZ5OaUUP
	ECLlhhAL60psm91RM7fmI9GVhCeK91C2cdTrIcxJzZ9+Y/e/YUCjLp2U/3has3+/qhRozg7qDIU
	e585J1xLM5jGXc5sVHVmW+GpXEKGPKIHe/2hzaryzxof2CGG2KSi2OvClHNgwMtdNozM7c+voxi
	Z5w4m+OVoX1JOKijS7mYIJ5d5V5iboDXZmS/UDeiwUH/MjKhK70bilxRT8wq6zXAG0f1FvdA9hY
	Sm4XEnKr1EIDGAPGlNPvN2zLdaPWOeQYK1Q4KWm0Djj7YiUhzUZ4iNdpOy4cJURe03HV4sHqscc
	5HzN3UK/YbCAgYKptPthW9TkznBJymKpOwg/lcKBtFy0V025s3A+NBoVwK+yU74btREdw=
X-Received: by 2002:a05:6000:2910:b0:44d:821:1a0b with SMTP id ffacd0b85a97d-4515d3dc326mr27958440f8f.29.1778353224452;
        Sat, 09 May 2026 12:00:24 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:24 -0700 (PDT)
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
Subject: [PATCH v2 3/8] drm/sun4i: Add support for DE33 CSC
Date: Sat,  9 May 2026 21:00:10 +0200
Message-ID: <20260509190015.79086-4-jernej.skrabec@siol.net>
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

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- collected tag

 drivers/gpu/drm/sun4i/sun8i_csc.c | 71 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  5 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ce81c12f511d..70fc9b017d17 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -205,6 +205,72 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct regmap *map, int layer,
+				  enum sun8i_csc_mode mode,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val, base, csc[15];
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = DE33_CCSC_BASE + layer * DE33_CH_SIZE;
+
+	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
+	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case SUN8I_CSC_MODE_YVU2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 {
 	const struct drm_format_info *format;
@@ -238,6 +304,11 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		sun8i_de33_ccsc_setup(layer->regs, layer->channel,
+				      mode, state->color_encoding,
+				      state->color_range);
+		return;
 	}
 
 	base = ccsc_base[layer->cfg->ccsc][layer->channel];
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 2a4b79599610..d2ba5f8611aa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -18,9 +18,14 @@ struct sun8i_layer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
+#define DE33_CCSC_BASE 0x800
+
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 void sun8i_csc_config(struct sun8i_layer *layer,
-- 
2.54.0

