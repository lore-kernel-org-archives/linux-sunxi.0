Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691592FD1BC
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216060; cv=none; b=mmFkqIrvio/7FNiJLRQ56xpBgK7VoZ+IBzwghXVqvkUQNrbw5mtpS0q9cHANX8k2KynXK3+X3Kf93A1zjYjnsK+zAGlILyAczViVVwnrHppdMrn/HJfms7XkZua3Cj1z7ojqr6s5XPzNhclQyIubs6tXDwIpBliHl8RUE0Sy4/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216060; c=relaxed/simple;
	bh=S0twu21aOxJ0VLQedxu7u559MvY/4tOCK9iLWkudnWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuRWUrW29X8XCwofbxzxfMfCnOu/aPa6b/zboEBaeCYiMjUS+u2u851wCNmWlJoT5S1RjIHOOL3r1590e9zlWFvfQdXHDHI6NQYpeusibkRUkenpFU3PxU0qxvXvU6+TU1wn+LM/G8+v9In5Ugza1Spj6rGZqCp5iAgHh87LLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ajky1okO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ajky1okO"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso5066111a12.3
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216056; x=1763820856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdxCYAFUxE8TEo/HdclUzBmM8/cH8lgIgGUaiseaWSY=;
        b=Ajky1okORsYL9006RvdkZyaFvBoT5zko1ILT++cOcWnYHWb37+bwKAD7DGhrxZetFn
         OdT/XWLB1egJUktG6SgnHxhJGbR36m/qMpWgD0a4Gu+74gGEVSJqafBM5yIKzbBa54LA
         xkOGECYLPqimEzrbkRzpdx2/l8LY1M0zqJ363z67E3aKy3CLOougYumbrhBAOi0oI8gv
         OEoZWO4e5QwqPlYsjb9ezBthsC9lLeJZIWYqyDx7GvTpLOjNqlr2SraCNi45fohUPcd8
         HRiU1+isK8m6Sj+tGqUWR8KGdMhznvqqZc7Ady4D01j2oLSqASkaUDK2biEOdQM4uSkl
         OegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216056; x=1763820856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TdxCYAFUxE8TEo/HdclUzBmM8/cH8lgIgGUaiseaWSY=;
        b=MSLOugFjO3/OlyTb8gbh+FC4u0a80b78ZinV6aoAdA6pupddTHFl6bBeA1tdduuzgI
         2OdxspBwpVEhVC8BJ6mqvh/CzSMDmyBb+LXdA4Q2Dsfi+NC7M5ZFBsBUeoWaKPIjKZGM
         usZjKDEbFGPaWSrt1EtNs5Wp3zUevbr7+Z5FD6ChO/RUUVN7ZmpWgWp27fN1otRVR3ln
         yFZf91Q4XYthxVqdf+I2obx6FGO0yamI2Gd/HG1RN3X5rybs/O1n7HMVrfVPpFp6b4by
         p4+yvPSt8OqSLnzfd3bBlFLs0xMVHpEXwyfAXKLLP9Jsqq3XSeHUrXC83Quf3vOd1e53
         iJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHiHzTCJ48YLD13OiY40KV1G09IJv06v2ZA9XJrIA8Wikpi1N962/2EvQpuUoGfamK7FLnl6wZd5RqyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDTpRA0IDSMHT7tcsGcYbpFtXjcrwV44mHSyfhuEZ+/UJF1qC7
	cxW2ndBRorR9AxDESNlNLUvC5rQw2/ASgYGJYnYpgxiBE0etaJYvqKM2
X-Gm-Gg: ASbGncuiiDMbBUw+MOZm4/y0u6tSTYIl1H887oMBL0dWeCZZdZnhPHpVFeZxpTri17s
	ErEcqLjWd+08tlGbl4x7ENyh9sbvyI8xhbK3LyceK4h4LHsbUxPOVEFSVEw4+rKu9QChoNf3KAP
	bhjLeNy8Vv6TdSJcTIixxkwoKJxpKsQYdC5HdQw8fB9eNNihEwM5jlEf2ijuH0ofaCp8+Pdkxlj
	+ce7Jt1agiCdK8xj1bI0S9H41lknmSyN/KfsDSMSJnx/6KRyxnBIBveZSMGY9vUTKmINNqXg1tk
	dr9qCWZg8DWxiiv73JzoTY5HzI0EVPQvvil5yiBOPanExbfYwGgkXIKniA8kbUrtQcdHOgeSIIe
	vIFuoMfxYo6FTWSwZoxHsqAwpvg3Sr4UQtAClMRCoahnKAC9egpEA0RCZ2NPC7yVJQ+bWQnNB0Z
	qYshMgJfX/oCW3tbrpsieiZ26rVSZG6N+VeH8OPoPkRT3Jew==
X-Google-Smtp-Source: AGHT+IFh8CjX1reglk+d9qFWiwVdzTnZZrgC6zCnkQGkRjSeca5TyFvpwvWCslriMZOQG7eYdwduUg==
X-Received: by 2002:a17:907:7f05:b0:b73:880a:fdb7 with SMTP id a640c23a62f3a-b73880b0177mr94905066b.35.1763216055478;
        Sat, 15 Nov 2025 06:14:15 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:15 -0800 (PST)
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
Subject: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat, 15 Nov 2025 15:13:42 +0100
Message-ID: <20251115141347.13087-3-jernej.skrabec@gmail.com>
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

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 40008c38003d..baa240c4bb82 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -403,6 +403,37 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+/*
+ * TODO: DE33 VI planes naturally support YUV formats but
+ * driver needs improvements in order to support them.
+ */
+static const u32 sun8i_vi_layer_de33_formats[] = {
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
@@ -432,7 +463,10 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->regs = regs;
 	layer->cfg = cfg;
 
-	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		formats = sun8i_vi_layer_de33_formats;
+		format_count = ARRAY_SIZE(sun8i_vi_layer_de33_formats);
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 	} else {
-- 
2.51.2

