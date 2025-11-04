Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5223D345CC6
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279832; cv=none; b=LBbI7mqXmYvSauEs6auxDlPKNHjvWxdef2iYlb4AF/mWVX9Nvg/ZrdGKQcxpKtCD4OHwUwBOGR1JgFL/9Hha/D1I7weHHYqZBX2GDA6S9jvp5F/zRopXXHJHBnxI9HLgeICIWNdj3XUdfqluBYfx6qforSgw4EN2lXRoQkKtJeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279832; c=relaxed/simple;
	bh=VFseA8+0asa6bmZbTX8OqhwqKLycWDdmZpgLOdy9Z7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OV787sJSvIwV7SHzyH55Nl9zoRInECVMqXOJXS+O3vuErxiP/Y1rngeFQpkHNSN0aSKTjsTlDyxODcGSOY3EQ54KroJBCc9t1+1CzhAmyIejnqmRpCS/WV7SBZhPTEAUNZkaR5NMjliULqPC+OTCB6J1hcvxCNHGARAgkV0px9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4ttean8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4ttean8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso7993355e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279828; x=1762884628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxUKDaL1Q7bL2awForB4PNE5HPywXNIJXgBLrPAkKJk=;
        b=h4ttean8KJUQvw4pEuXrStYRTLGnRRsTUegorWNVAR1P886x0h5WwR5IDlXF7QJyif
         sdyp6oRwR2BCDOCxUNs5PbbzzRj5K1+ro+TULuP6tB6AS2q91Loy/5O/QGoWulAj+BZo
         Yb12nitOOYiEDu3XcQ7R5owLd7tbwHKoaGNHEXSmRjWDGIUBFzJZyhNvfWxMgA/Y6kEx
         wS/QDwUc8k4VP4+PLyUpr0dAgRhWHnrLAlIm3TohK1DP3lXmjhkufCXj85I4d2tID8sd
         uVt0qEg2TfL7QdKGXvNXBRd0/k8h32XsNc1QZ+16P/PKKsOTruB7axfswkrDle2rD6mU
         llpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279828; x=1762884628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxUKDaL1Q7bL2awForB4PNE5HPywXNIJXgBLrPAkKJk=;
        b=igfdznFocSMY15H5KOIme97lhUFs3u3o3DF6/gI42GI2U6o2gG1NNNw5v25V7eFqRT
         ImkBkXiQyfq7bI13aqzUXjbtOvtpcXvkF1ywKMkTzhn2bIHB0FePlmKk0wOJzf+G5X2x
         GoG0m+7qTNwRgULOdTW/1JZubZScwcd8JNQIR2Xfjj53COowMI1qq9Pd3B9KmBc7+zKB
         ZmDTwOjcGlKE5x22aUWAYnqXCmURyejRRjOwhR2pXmyRT6FhXbIRENeeL2bWpZgJSXMD
         RBwuQAKW7GAYP5M/WJlf38cx2vFhB7Y/cBddSk+0ZCQPw8C/CbGKKutvJJJgZAXzzH8s
         CGBA==
X-Forwarded-Encrypted: i=1; AJvYcCUkPMo7XU3+fNa3rGGQuztCZRvBKR++a0tKO4xB1EIYQC23yUqeX/3nYVn5LLMXO4Y8G5QdVSReoyKSLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPQnn/xI52RcTrf+C0rWc75tVGTSTECJujLYfsa1tR1BX/KGGI
	dtIl/jReRuxUkwY6xhOm1u2toL7SfPuocDDJdwVI0EyIfuEqvTqgQszA
X-Gm-Gg: ASbGncvuP94mYsaQbhFC3pNUzyzOCnWkyWlGEA6K/ZnZ7VjVW739Epg4A5KYtHGnt7g
	jyaQPwI3EEdouW5sJGlK7fgpmXXh0Bp+zml730+acj6RS9U3oZu5byhmi1tESYhWU4x9nHNIMIM
	iPh3vHOGt/3o3x2v1H59GX02jF4OJdueAB0WnfNq+25z/wHyofS5+URAEzh8naossHgsyKQVyrZ
	T272w2ySFS3cSKx/z5acx32ny48B7EnlU0vW83/vKQYSyAqmc4mOZCEOjUi5mBQXBbjYpfAEaOL
	PVXloRRQO0xfxpdgDjVk7lcHc/ChNF+IkkHgY6r/Tyzp+cGqCPqj04idW5T89VHdZv3/nHo9Pn0
	z70DrLgqQuVlXO0eGphCm+dJVVr68uWzF9kyeuPKdCuVhzd/j/vgfO5igZr+FRrgk34UEhXp6JV
	NzwGr5ovvkextaePdDH2BomkCMScR5
X-Google-Smtp-Source: AGHT+IF5c8+mHZzz90mVXQjinbLLHXZDEwGQ66eyEvr+K8f4HxTWYfLZ4fwJ/Z+IpDrhmhZsMsoK/A==
X-Received: by 2002:a05:600c:64cd:b0:475:d917:7218 with SMTP id 5b1f17b1804b1-4775ce7df88mr2080215e9.36.1762279828376;
        Tue, 04 Nov 2025 10:10:28 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:28 -0800 (PST)
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
Subject: [PATCH v2 21/30] drm/sun4i: csc: use layer arg instead of mixer
Date: Tue,  4 Nov 2025 19:09:33 +0100
Message-ID: <20251104180942.61538-22-jernej.skrabec@gmail.com>
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

Layer will be more universal, due to DE33 support.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h      |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ac7b62adc7df..c371e94b95bd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -227,22 +227,22 @@ static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 	}
 }
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state)
 {
 	u32 mode = sun8i_csc_get_mode(state);
 	u32 base;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+	if (layer->mixer->cfg->de_type == SUN8I_MIXER_DE3) {
+		sun8i_de3_ccsc_setup(layer->regs, layer->channel,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
 	}
 
-	base = ccsc_base[mixer->cfg->ccsc][layer];
+	base = ccsc_base[layer->mixer->cfg->ccsc][layer->channel];
 
-	sun8i_csc_setup(mixer->engine.regs, base,
+	sun8i_csc_setup(layer->regs, base,
 			mode, state->color_encoding,
 			state->color_range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index ce921521aaca..2a4b79599610 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -9,7 +9,7 @@
 #include <drm/drm_color_mgmt.h>
 
 struct drm_plane_state;
-struct sun8i_mixer;
+struct sun8i_layer;
 
 /* VI channel CSC units offsets */
 #define CCSC00_OFFSET 0xAA050
@@ -23,7 +23,7 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2290c983e177..4f0c929faf36 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -301,7 +301,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 
 	sun8i_vi_layer_update_attributes(layer, plane);
 	sun8i_vi_layer_update_coord(layer, plane);
-	sun8i_csc_config(layer->mixer, layer->channel, new_state);
+	sun8i_csc_config(layer, new_state);
 	sun8i_vi_layer_update_buffer(layer, plane);
 }
 
-- 
2.51.2

