Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F822FD1BC
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216057; cv=none; b=biyTxWU8ZYxleZDKjglUJNan/sQcz5Ugs0vJ8KnTskqV9fI9A0Zyqs2d5rZaUQa/hxhiRKG/09IFBmB0SWLE2jnVHkO4mjst5pHBhHZMj3GPDnOR/eDiTiVjOsCubUxKoj5IENBiF+w1FXH7s93eLHBuSSRIkafxkwd6tZpiw2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216057; c=relaxed/simple;
	bh=aG0vNN2zVi7p1GToVdpDOjQmhx7Tshg7Tk0b4TzISHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/Y3+fFVugAg5RtbquW13Jb1VtwKqWVdgdhx6krg7urCNF6lEuwrPud9nQpTBnWYW71x6QhQKnHUwB1Fb4FRiX+LPwTvMYLlMARYrp0YpbKmtW6r+sFXdDMS+PdKh//6cTBBwahuc2w8m15EwM9NVV4lnrE4qhi3LRAhxnSCBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isGJw+zQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isGJw+zQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so4064448a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216054; x=1763820854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MocqCxWcaLZfsHWYqTZWM/wBzmMvMPkWJzIzBgPappQ=;
        b=isGJw+zQqmqi1idYRdBjeQ8MW/Px+GtAHTH78pm2FJRFsaD8l5qaR2AKzAH27uHRzf
         kXJkptGCxWtpJ/WO9kewmZ26rUGuq0GhFiVu/8scep0stsrQKamh6+8VHR1qr5MGs/t0
         Dy2shz+2DmMy1lXf5wDKPkcVP4wqeCIvHVbXtwqbXUpuK++y2J03wRUp2RF2PtV+4Q0p
         wYLb0Nm98eiCGQzmhIddRM3uqSzA33mPA9odrjainZsNjZWba3WUaoHCjWwEyaPzc/W2
         mkhZ/mT7E/2MpFVO+gG+NezNRjEAIzGg/L2O+c9p1s3j0WRQPshyoJv7dBAobILRpAs/
         qILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216054; x=1763820854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MocqCxWcaLZfsHWYqTZWM/wBzmMvMPkWJzIzBgPappQ=;
        b=EwpkTcvEppRRDEs64WLtuMwiyQXv52mecTc26eLWsSMY478i/yajtVe6Yb7YTSTMV9
         BLJ6/dfCLeIe4M/LVjJ64BwzlrzK7ZkXHZr4LtruxtT4eMg7PJ0dcD16SuEtbbkKsHZP
         mEBiQsfoXH4+reuHYKy9FxZkHoZxnMCriuNin1gwWVQP+FQpLhjp5pRAXn9yxwMTh9ZU
         c9TkHoeygqZjDSGzRcmtjdjIiTnzcH2vHFmAe97yUai5p3rBFM4CGCYX+mm5X9tEMA1g
         8wiId1a/GqpL4mYJqHLvNydrm1NC5kR0XCwcAO88knm/EO4k4lfTWUH88bOAWmDw6rpy
         WxvA==
X-Forwarded-Encrypted: i=1; AJvYcCXfgOjAKcf8KneD5wxDDQnjsCo9oS5FsNcwHXqg7mx3NhF/rAQ/Iy+N3+LX98h0cC9tT7bmlpVq3RTPBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk/Ba0+btfr3OqkxqkqUevuwRXNZB2BJP+pUYwFuUxtOEWuB/b
	va1ztDBkF4Z1zDbqFnAsQsnaV5hCic42uMO9WZk3GlNVK59zURW0frjA
X-Gm-Gg: ASbGncvCAsCx0nzrlTN2Zv/OzpCIzn3jWxBItHVsPTFZEjUxv88fgnHEJMpXQ/3DcQc
	y41s8Q7LujWCF580JAwYXPj4/6CL+vUobpRW2OB4GcjAPO8LJTCdQsIZTQ9zCoqwrzR7w5Sz3vs
	gv1O3zoUZBPt55C9omCbGwTg4Z02IPr77FQ4STykg9snsBrOKL0o6cx4LruVBGDed+BfCTigtze
	2oF+VMYYknCe8Y5sKuDRGh/ttcywQrMyKg7tZCCvK3k9cfjSadJUlWfI/eWqaO7gci/g4YhiS8k
	LmIjzaGfIAsb3yCJ9SN8YMztpS/fQytBob9TEYZu9dwtuhWzqwn5fyNtNBqQ6maA2ff440r4WLI
	RUzhiUhk1l3NsQUOPUtFlg9297B5DjekFonuIzseZDt9SuXF0Sz5xba1HcAQhnCZnJeLLon8Ppn
	hScg44pAN8QufF0SNvnSBQfplUt6XvXI6r5PHxuRX2ZR2bi14gXr34KDo3
X-Google-Smtp-Source: AGHT+IFSj1aDwiro/wwK4L9h7pp1M9ctQw+POyBArF5AsNHZz7cGsgDc33Ii1wskS73N5JZnJxCpEQ==
X-Received: by 2002:a17:906:f145:b0:b73:6d56:f3ff with SMTP id a640c23a62f3a-b736d573ee7mr440406566b.20.1763216054020;
        Sat, 15 Nov 2025 06:14:14 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:13 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
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
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/7] drm/sun4i: Add support for DE33 CSC
Date: Sat, 15 Nov 2025 15:13:41 +0100
Message-ID: <20251115141347.13087-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
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
2.51.2

