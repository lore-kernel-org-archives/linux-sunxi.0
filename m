Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7E92F1FDF
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297026; cv=none; b=UBRB/I9AoMqKmaqk59AlSVPttU3ZEcDNXDptSFtrUpPFFw2CgFcvlaqMRMrIeuWv/vpV7thslLRaFU3pZJqpangndnEVw6mUoMWats2UwM7EwhY7q9lrJotMZIYgULvActIFzpFQre5/1/Kh1WL9aOiJUzgyr4IWBeMlTYh6dfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297026; c=relaxed/simple;
	bh=tT1h4I4+dPWk/KoNyiQ6dHE5u1ti8FQV1X36C3i1/1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTUbHE7UZem1yPZzjOGcylSZpL/j/kZJ4g9QausYSSQBLTJOGOB9I3JKhjPVKidA1AzN6eIHCUqWftHm7jeZIQkj/4ZlUrmFfGVdSiN5zgQlJJjQfoV0VHNVCU3UDxSDSAp8A4cZZcd522SXligE7g/f9Iy7f/f87oM8xVd1zqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNvw7V8p; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNvw7V8p"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3b27b50090so653277666b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297023; x=1760901823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/RwR7PkAt08sGqCqdeSYXHmOvdiEO3Sen57EH3VrWU=;
        b=gNvw7V8pyMhskcgWumUCOTZeTaHH9ZvcwTNat9rbmSG6H2ftrHVLBRBFXHJL8jPBpo
         iJHXS064u7SZ9xXD0UMTMjrnS790+s8k1v5ysvk9wONaR3JFcjQjjSXC6IArIbf3UTIc
         9yhSuuiy2Nlf8mb5msB0xhghMwgm063moWxRchL1SCOKByjP1ykviJysrRT77GSt2Xbl
         SKOV1QIUJavFTpKTGGVjFuh09LjLzlqjnOIdRLCKLJqrFWfl42zeZIofGsLKV2ZnXPiu
         4DEeZDKp7y15BjsZSywY18LsUWXNpU7js6erWx7ne20xFZig1xD3tLT3ajKZekrEUyaO
         FYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297023; x=1760901823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/RwR7PkAt08sGqCqdeSYXHmOvdiEO3Sen57EH3VrWU=;
        b=ZghUgOjGA1BqsC021TYsOpj+/JAX43IFtJ0OiPVnvPPrODTzrAFG7o9VEN83qlGhuO
         w21qBYRN6JU4NzWzNfpM7EMWRE0vgG8JTv6NpZ0WTIlWIZVUpcb007pvDXP5V4WkJ0y2
         e2ZmnwkylzjueRlmBKk6gO7UCJDaJkLAL79ObAql4LrvikTui23HXjJOO+9Jzg71yjd2
         yyKX1wXhEdXHIpimDbJ7rEbBqZ4au4nb1ciQIHU7VLpS/E34PemBDQO3S4fWuWfqGXiI
         bBOHyrLIF4PcSsWuptXrZ2s2r6WayedegQoKDTZwUGMbQABivNrqA3TP0uPiX376aIFs
         KxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/BYlT4LLQFs4s3/ReuvLghmKv0i+VJRHS2JmVoNDJGsj/p7ah/6n1cuXnSvplqteY7loAujt8L7ANMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws9gFNvoSllEd3NbyCKsiqzVi6fTI39lHbFnflJ20cGsY+EabZ
	Kcta2V05i2I506lyUy4WaVctspJnxChK3toDD/rn779q4tWvJq7Nd8vB
X-Gm-Gg: ASbGnctN25OtGDgtnFuJUp94H5G11fum6pkmuzlsv6EHtskmEIoJX/6KsVX79Zh41zm
	5ZdcUbh5G6UFmlNAV6lpOWCTRQaD4w/Mg3Th84QCv7FdVhIjVe9/FmkYX2gK4Ccs9CWGF7po6KZ
	s5SR492HF7lH6Svwcbk+N0T+F+VacnAz+XZMQX9dwnxR/LUX7KY3UXhvUnM1wUw24TOX1VDYi51
	MhXmg7dwmO0xf4YmETma0v+mqKPQONQj8s6hWxUTa435bMyvJ56bwVbUqpD5BmJwJ29i4BwIUJ0
	3A0/LrRoJV7IFiEE+Gp/CQAFCyOPwGUPq4BMLTN+W+QeuAkdwtFPC4KgBlVbcreFr1Td+1RpAdL
	PCCotb13pKlV1OA6XSs5xzqzzsghRcTWIuRjeav7thUaRHQFm1/qe/CCHlvTRbME+7WrrGZy6TB
	yZkcNnm1hf2XuJJ4bEHhgLvahrV3DkX7k=
X-Google-Smtp-Source: AGHT+IFr7DIU5+0XZbE3hR+c44DsyFKY1NvkxnYeQndJ+rW32FEQNP/zDp5N5Glq490y6QrN3W54Mw==
X-Received: by 2002:a17:907:c09:b0:b2b:63a9:223b with SMTP id a640c23a62f3a-b50ac1c5db0mr1978491866b.31.1760297023111;
        Sun, 12 Oct 2025 12:23:43 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:42 -0700 (PDT)
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
Subject: [PATCH 03/30] drm/sun4i: de2: Initialize layer fields earlier
Date: Sun, 12 Oct 2025 21:23:03 +0200
Message-ID: <20251012192330.6903-4-jernej.skrabec@gmail.com>
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

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 9 +++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f97be0040aab..9b786e5c7f3c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -304,6 +304,11 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_UI;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -334,10 +339,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index a09ee4097537..bd6c7915bbc4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -485,6 +485,11 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_VI;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -543,10 +548,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.51.0

