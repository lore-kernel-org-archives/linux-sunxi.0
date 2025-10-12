Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A62B2FD1B3
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297058; cv=none; b=F5QSGBigw7ZUnDEiUPpEJ+kwi+RQCwh9smZ4eYTfnhS3fGMbFsNsja8DSKc6qQLAnDhAo6bA4neLlqcK+jA9LGD0xhDLaJDimxkU4RY1dU81qsEwtLqM6Wweq4uWb9Nwc0bWW+GCwe2TX3GZgGzmYtvkZAxzIYKfOZvQ94d7frQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297058; c=relaxed/simple;
	bh=AKEPEVp/D5bLHzuCgLd8B8iJEurynArxX4T5wTeN/QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fxga/iskpCGDrd0P4mjfPZ6xHrHT2AFNkuG6UnPRbuxm0cX08w7NXWb6ggyL4YdIDWqvoNdcs6vip9gVXtB/Yg44VDEP+psLn3Ev5krGgIMp7EMagtjY9jQJ1PppHBmeQ1D8h0z6xXk9JVzQ3UcdNEti8Z0SzVVT4V6KY9xPqnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9Hz1Swl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9Hz1Swl"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so642038466b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297054; x=1760901854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN8no7TuZPEE4ZrIoWOSDqFeNHwdwABVG2L9ibzW5CM=;
        b=F9Hz1SwlxDUc+7+m88u95bWcGNyQ9w4/8T3eTTF6LQjpIJyq/Y7VB9EOceYOe1Kpmr
         9J3Zbhl8BUQQK0NGuNos+amj7eXSBbfAmwvQTtDpSJIbm3SyWd+k55sBPCFH2PJkftrP
         QdWK8KjHfeb9W0vJbJrLHEyWsmTnISZwQo0Q/OolsvnNacqTr+n7Nb9yhGSLrHzrFpn7
         /o+1XTlOlfHDrX10n2B6XP40rfNEZkt9cS73CdjYRQrrtFNDRLDiT8DBnmYhWN6PL2ut
         Vnj71Ak8mcFmzOGj3mOv1pTbvlYGAigtFWKWJdqz9W3f48CxBW/YusnMfYQ2yjLF1FZa
         cuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297054; x=1760901854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GN8no7TuZPEE4ZrIoWOSDqFeNHwdwABVG2L9ibzW5CM=;
        b=wrNJ7tnCLH1jgxqNQxB3UiyQQ5TY5ZmPN1rWeBOx7TULjgiONk8z2Db1sHQkogxAN0
         X7uKqWM73tYOg61L3XCQCj9NI4a5wRiOUbReTuXzuiyB9tQqbIo+M3BCGheKY2s3G11S
         I1tOvwBuOkv7neffQeE/GFlYKWaTkWEpVI3cXYUh5sOuLqJSVnqNlGDrbBxt3bUiAvwD
         q6gDnG2YD78q63P+46L6KSWdwtqF+EPQF2RGXJyriFnT3AzZ7zmKaCc9zYlKudxLRGI0
         E1Ph922Zpxz5Vh/taEfoGvI5amHKiiDgzu5TH026qG8pT9ORobaXi4lwP4XV84nr932Y
         EUvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBqFi7yc7lrPkrnb425PxlwsDO0Ot0vCTpc5RV/GcTtpPFp2dExy94jj203g/h6732qgEVJFI9AxW+MQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/OST00Y5NBCjHG102e0PeA8yol43zY29E6o5Iy4OcRcVsD9We
	zfQqtwchNTA6TazKIMSZd3jgM3TjaHuaGyF9eDVpVBEI3oXb8AYeMuGS
X-Gm-Gg: ASbGncsjg6oRGEIKo+OOt1QgEPfEIqbSbx6pOP6iXpAx4+vD6ArMFyD1NcSHRy0BHJp
	3a7ECLVKytETZxd0akKmOdS3vQBSjREqvEElrZKb/N4LxOPNSaM/dec2aHw7IwgTUm2hlqV2go9
	U6DUGWWS/695zQxNE7+kaVnghCWFSl7fidFWr5QQNzeH2fBQ22u7djrw8Ux35HG7JGyk6rFdJGT
	v+Li+2jBdlMvXOvSSUHtC51p8NYC+uCIBbU8bvqLcwmuGsoZu4MwehEe71MJl8Vbbnuduhea65k
	sRVHMMHO8u0WPn2iJGRzpKNTVSBEbYfCgYZJ9vSRVfrm6Cp6mfAWqbljMDHQs0R2B7S9qlHXmC9
	AskbtwgV5U12zLbt73UZUGEi7+1AYd9fwDcxT0hoKXTkEbWyAnjLHkwVWWUcE3gEHMdnMvX8R86
	JCbxG2DAm8caD9tC5OC1LL
X-Google-Smtp-Source: AGHT+IGliGTnpTGRawNal6hhCfPRYBSBq/r1s8fnX2W1RihxLmu9ewXMj4AGe/8If5EcaR6rduNrqg==
X-Received: by 2002:a17:907:94d2:b0:afe:7b8c:a583 with SMTP id a640c23a62f3a-b50aa48cbb6mr1956645266b.13.1760297054099;
        Sun, 12 Oct 2025 12:24:14 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:13 -0700 (PDT)
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
Subject: [PATCH 29/30] drm/sun4i: vi_scaler: Find mixer from crtc
Date: Sun, 12 Oct 2025 21:23:29 +0200
Message-ID: <20251012192330.6903-30-jernej.skrabec@gmail.com>
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

With "floating" planes in DE33, mixer can't be stored in layer structure
anymore. Find mixer using currently bound crtc.

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
2.51.0

