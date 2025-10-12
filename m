Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72522FB60A
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297049; cv=none; b=UvkA3wU+2eGBGFGxYu6ZpJjd0wRpG2UTGco2YPlm0eshCF5TjkcD+4DVmnq44C4pqNdU5ASCsDpYtr07+6aEIugXalfRZh35d32MeSPXF+qBN06rpX4OwKqHrG+5W3p5maUIW1heFKdvlIWNuHmbiLmvg7oaWbmgEw/8UA+3DAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297049; c=relaxed/simple;
	bh=2rEgqEZ2KuPdRGMl0QKQlefkIl3FEYhRSxtjPD2zq0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9DN+aOJH271+njiw5BfYGojqZEPvJRUA9YFcy0JI18g1/JvCAAsD8F2d1q6M4Cw1K21hvBhdU0LZNCppR9iFqWDl6G9pgWh8aICma09sFTSxZhXg27djHgpxOoNV3TBmS+BIr4N+zlkWhkFqBsc31Egy7AF54xdh/PLUsPOTwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il7ZI8uZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il7ZI8uZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b463f986f80so805967466b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297045; x=1760901845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08VhihKvGZOzCvy6uNWRiLafS0nfxwn+0WLCtxZhCew=;
        b=il7ZI8uZe8vqZixug1Q5G8zAYAL/7AowBxLjr+bKyJ72+qUWiyeG0GHzXVfeeAr/Xu
         DfS/krDfYYCseX8WyfoOoeCUhSBXboNh8ZN+D/SXlVyorgs0AQ3d2s289/bUTF8OqY+D
         bvLTi/acL/bzR7DTZXVS0rAu05W/JsuDlno9PjNjJe+HtDDk8fPUjsewP6asskuVqnru
         PZMBUAJ1SO+m8mcS3PxIOtYkMB+cRN7BpXW1YyR5Wepx0vqBC2NwBwj2EEPa57kB0+Zf
         WHiBl5m5vbFaOBF/ZFYCO87kB6S6kb3h7xn/ifDnCWDwgdYYWh0MkU7sx7QmdGT0KyOj
         qfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297045; x=1760901845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08VhihKvGZOzCvy6uNWRiLafS0nfxwn+0WLCtxZhCew=;
        b=ZMexebWq17yR/ON2Lzko9Yo1CGeh7HqiFRgpNMS21nSqo3puVkQzdaH6tvjJV/m4ot
         AGCkft1ePPgxILF3Gt9/IXzFYRmad/OqHLUdcnTXOx0MZCzsWCsW84IrKp1SRMS/16FX
         +hprdHWXfosF3j8VCpNC5PzIBJvAM3olAxVBGISr7QLKFGqJoc7dea5BwZEYuHTM9noC
         TGKLEJFHydJvggcIIjUDkd+EDp+IYTeC/qPJEyamWWQo5B/8444zkfPHo5pH9MvFx4vB
         Bigav1bqrigf5pkbX6kX0F5VQOrapmMMBk16cup3UNHMCYHEHj8bUrw1RQe/O2gaSarL
         e/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+ajPYvD+xiSSA6e9Vj+N5FhxJkoEXpPkKA68znGEKUgkG3EGnzUXgPMnjUC8TWoiaFKC5ieco8+BEgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZnMnYIDEMQA11TX8HL0e4aywyGV3VT6qV4jhkQKTq8wyiTsB2
	8VJjkRAr8BSa6niqJyXDbT9WHhCFVwMfmTN6SUydmAfgnTNAK+CX99VE
X-Gm-Gg: ASbGncvWeHcBzG76at0Yi9Re2g5VE+MjbXEcr3/Mlk0G+vZrazUAzFJ7AdvKJ2t8lMr
	0djrOO8+hzBWiLUSH00x9s7QXCRk66R6kiZhyjSbdbFJmtns5Swl+mZ9vigTaPZaqM8+upCkM/o
	gIwlMebOgX+FjM0yXweZoPHLLf7eAXB3MI3RmDdmJjXCUeu85gE+FfyDdaKROP44DXniHOQiFZ2
	u29Pw7cmvV6Iw8viHkafE5orLXclxWuaZZx2J/w4h600c/rYYJQsIyWOKq0JGEkpANIQKus0/UH
	txxmi3l9W4Sn86F62HLEtEDpVd5V1/lV9yOsWPyMKveDlacZAe8S+MyvqTc6y3/mzGa2XcnoOT9
	fzuS2mTc0EGGw/EzOBwW6fqRwqpK2gmkYwiOeq2H5nuWzYp+A26gzRq9nNg+ZrFqS/rq596fQJo
	k5zUNnbgv7bvm1RojlhqEOerZbFCQFIko=
X-Google-Smtp-Source: AGHT+IHvhXW73NXWnN/w1+a157WT7XVAMC9an0CwaQWq1dgdtB3ecG7lOa+m5GizVxeaSFFM+lpHgA==
X-Received: by 2002:a17:906:dc90:b0:b41:873d:e21f with SMTP id a640c23a62f3a-b50aa292f1bmr2074832566b.18.1760297045043;
        Sun, 12 Oct 2025 12:24:05 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:04 -0700 (PDT)
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
Subject: [PATCH 21/30] drm/sun4i: csc: use layer arg instead of mixer
Date: Sun, 12 Oct 2025 21:23:21 +0200
Message-ID: <20251012192330.6903-22-jernej.skrabec@gmail.com>
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

Layer will be more universal, due to DE33 support.

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
2.51.0

