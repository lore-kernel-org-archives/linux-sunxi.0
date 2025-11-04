Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FE3347FCB
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279842; cv=none; b=mST3unULc77DUUX1p8vZKibT+lySfZ6CuVsWjmxG2X+qINP6KKrLoTACycip0fh40oOKylkRlxsabYKpBZwi1HOy4euaDgvvfcA3Uoe/79PL3bBpUf8A+N5RYPeRrbHvH0m04eWSOx87W52ai4h/MvgGRHOuKpqsLDccMdjGEog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279842; c=relaxed/simple;
	bh=tn52gI++VV08p/JOXLBb4YMr7yaoLYJuCkLmlVFTHEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cS2kVDXAc95J9NCDcybINwoKgDFROF4wk9zhpG3DhM3h9RgkSEkbcprqi+W4J0UU3GFyq7UI2HyNt2WBzgSXmD+Kf5J/fj7014maxAPnhArVgeLfJCYPqdox2Jguf0wRICPVsBlU+E/3ZbssG5A5Bbr9xFJGlXnVKK6F7KZDlDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgbmQVbf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgbmQVbf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so47176205e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279838; x=1762884638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdGrKH1QE0kG7REtfLe4gBCoW5I7PDPHN1PH2jaotk0=;
        b=bgbmQVbfty8hfXvAj5eRDebLPAF1WHc9PkW8G6DMMt0Gnh8WSu5X5CVmnWq2qZQUQQ
         5WqZURzNrdkjdz1gfGh4lOyIh5SzbpbnQyFznGSFeU61XoNDs1UYuUQn0hEE6yezxEo0
         aLVc3vuZLYpb+jg87LpgIM2OSqb2i2qjN3221nN1IG66cCCT636cTTlecuAz7nniaGtd
         8VbgQdH2aua5rlBZB3vfZtqQzFHxBoaGt+3YCS1VAQm4IVyk+TFfhmRzwNJj83dlMRNN
         7l0oW5u9Ww+34b3/EV8SEVhq8ZgR2HBPxARgHckIYHZVdI4jt6AQmaV56rr33eq90uR7
         W8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279838; x=1762884638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdGrKH1QE0kG7REtfLe4gBCoW5I7PDPHN1PH2jaotk0=;
        b=KQnLydFfGZ50xXT0S0dujftZKUGZke9+bbZZyHve73+Ow7keq/OoGd6cSJV2l6WWGU
         tgAaAyB5wfNllWjp3Un/BPOgBQUcThmbx5/bx6eGMhgs5UgNmd/L8si/2aofrMX5U40h
         Rh0SwrnU+cOYep1BdUUzf+xxc9S5A+FzttHsdWLoKyTuTI0m6TtTn2xGkt4WbRrsyhpC
         fjZT9feauo0Ee6LfWFPJuUNXyeCF3Z+6+SpnwOAkPJ8XPpas00EvGzfmneQ0K7qU3kqS
         m4z/ZblmqJ8scY+f66W6fpoUVNVIaFeQaKEQ9NbPxNbFCqH8shCvJ9Fp4dQXDHPezgKF
         w9RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn+6gi2EOCYFaKP72BSRx/pW41jSoZekSOKhmT+2amQYCkGVeyCRAC1ZWVKevXzfh8XCmcq+7wY+pzOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/bsDQf3BsXdxjGbapvwf86V6GwCv9qrPqWaJrt0nzgHI+Nbwt
	2/jrOmV1BZXyApRL5bOWyEP0jgvGn7sf2PzdkAozh899m0i03IibbUnu
X-Gm-Gg: ASbGncuO4SiR+X1bsdPI0p5q7VcgmlAgUNels4Qyya6dN5JzaBGj+XQpwFYHX13gPUe
	zGZgrdj1t0lUMHEvDSIjsIHmq55Ajid3p1h0PtFIS6VL/sEi/IBR+ytWFB6+I/cnVZKUmZ9k0Yj
	4vIdKXzRtpyEPqVxiC0s8scCGLN53VgKelW5U6QiW/SsDcn+rOse1usgLU0DW6FJh/Yc2MT4PzI
	Ic4I5dnNLuVN/ijAPNmd/UOcPVZxf/DYY5nOQZYSuKlbVyzPKv7I3olP38cfCZ4AAdUvezlcBP+
	62NFqdghuTM0rt6hZScdieP19fal7rm3Ijm5680H/8yRl4df8DBu/WW8Z7YsCgdDC2QbBDaDu39
	89FkJW39rjLmUHcZmarqDNtvNjvZoUpZ9/G4LzgoMql+QMN4OeegePREemGF674cFy7Exye2fUL
	/tOCdT9miwXOp6UwLY5A==
X-Google-Smtp-Source: AGHT+IE6YV6xR2I6/+NCWHLkg0DglaeA9v7PSL0SkiyT31i7Bh4LMca9EcGx6brDtSF2nS0sWtPQUg==
X-Received: by 2002:a05:600c:620d:b0:475:f16b:bcbf with SMTP id 5b1f17b1804b1-4775cdc148dmr2023655e9.14.1762279838428;
        Tue, 04 Nov 2025 10:10:38 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:38 -0800 (PST)
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
Subject: [PATCH v2 29/30] drm/sun4i: vi_scaler: Find mixer from crtc
Date: Tue,  4 Nov 2025 19:09:41 +0100
Message-ID: <20251104180942.61538-30-jernej.skrabec@gmail.com>
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

With "floating" planes in DE33, mixer can't be stored in layer structure
anymore. Find mixer using currently bound crtc.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index afe38ea03beb..4534998af825 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun4i_crtc.h"
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_vi_layer.h"
@@ -62,8 +63,9 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(state->crtc);
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(scrtc->engine);
 	const struct drm_format_info *format = state->fb->format;
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
-- 
2.51.2

