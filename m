Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BA03783C1
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755614; cv=none; b=uagg5HlchAK2dMdr6wb1mwJpHNnReYtpAKm9X7R3M1BjsX/SlW6Xz35197UZg4QglaMjQrS3LYq6+GVHJOVNRMJkQIhYBSC/TDAoeSfdBD13KqSI/e2vJjdyuRki+CDefqoSkqn2sAgIL223AX8FdbSgNe/VaBEKbZOYyEScuZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755614; c=relaxed/simple;
	bh=ngR4pF8ZR4otDzXCtBy7fHvpHy+h0I18lkR5iYFkB5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZP402OfjFPksiDZUIJXeInMmbCAYoy+B2bFbpZ1sbCI7c8s6LBC6SxGgDN+4FaXTdfvqWLk8kgCJhfOMUtP4UqoapYQwRg/ab85Bj4duA3k2oVOrdVi2ILDQ9+164mW5Nez9njAW3F5auIQ8IdRCe548DjeK2kmVbNB1Neqs/i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lMzX2f5s; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lMzX2f5s"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc97653887so34139905ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 04:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785755611; x=1786360411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6Kz68yYAXo6+FxgCcZ8xt2d27kzI8ELfLUFCtIDH5c=;
        b=lMzX2f5saepmCAwWAa1IdueEOFVcVvJxfnr77QXRyQWyZzxejm3Hgvlm+xZTfSZWrT
         KOl9bkg1fJr6aPlmJh5M9iP4Jc+Oc7Dq8M+lbspQ5Us4ODNznAEThDNcuzMFBTziDeWx
         pl6jeH7TX0msU/ODtoTkHWY4NmywwC449cwR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785755611; x=1786360411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6Kz68yYAXo6+FxgCcZ8xt2d27kzI8ELfLUFCtIDH5c=;
        b=dPTH9UH5ChLlJbw8HrAytNc8Cs26YiseFNN3TdJJCShxuly/H1JgSf6skNPapFM6Ko
         JTVQrIi9d2MUtURSlGD7ODMdQKBGlcfVVSwomBIq7IxiVcCDoStVRETxvRlRK44ArNs9
         OpfQJZ2XHafbGC7XhI/dkRFgBS139L5R8yTG0C3ylpXZ8SqSI8Cs+6SCwd9cIkWJEpF0
         bWeMPl374DzVqSy9iKz6+immENOCwKD33SUflBpLfiI868isXpJVhoDpqs5a/Hscs5Sr
         1bgjwcOlTdOIHNj3aPSzTfHtTQJLxWwVEgKxsr2UevvpsWvqUJTV1MFQf6+IcHAp3SsV
         iMdA==
X-Forwarded-Encrypted: i=1; AHgh+Rob6I4PA/wDEW8PkC4cDgYAjw/c4goQ/FqE7n4JWlXWjj8++vgUcSle/yIRe0UhP1WrTDMvgF99XmK2Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwasPLprRHZUeqXpQpiWiflycTAbD06ERJM/gcvN35DXPUNLL09
	ucK0PCmICu6n8XXaP99DjGRKeJpzd1BOBvQg7q82ky7i3cCOBn4HLicJzJ8lvUQ2Fg==
X-Gm-Gg: AR+sD13tEBw/uQmRibcakB2pYmHopxMLdHOaEh9JD8H+m6ZBmGnkjlkFgUGCJt/6QOD
	/crlHEpLNqHDng/y/+9y13Vj7fULwrozGi5Q3b7m0MS8TjnGk1Vv8rCPMDOvGmG9aT/fxYslaGI
	WeViA5Z0zj/tTve08pxQczjiIq59p6Qpt/x3My7WlMDOEK8eto4SwnkLVPSCTmFgYMdNCQAKKir
	tLhSkFJkWZhZXPkTj6UgHuRcyLwyij5zCqndX4erlMRIhRwHZpz8QMEBNdosJ0CRpKAQfwX7B80
	FHYVUeohdFZkwn+Shia6GH32L9QBLajRfbUFjjWMEUC6rKNHf9XOh+Fs04f0PMGqRcc0nzDQuu4
	TJdLd9HVZVFr4MTJ7kIZtSSC+VMce1xXbCinC6nQb0UCfIre5hBy/gtEY3nXedRmz0c5QocqSRe
	hsa89D26/g8lNVS6GTq1kux+d94ASswZ+0wFLlbszSqKcGNII+zCO/lVIKKo/LAwUjggWojOIlq
	txpBvK/pY/3WgeGiIM4Qw0amQAHosZ1fO6XQXGL5k8TMg==
X-Received: by 2002:a17:903:1b50:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2d052297a68mr94429995ad.21.1785755611549;
        Mon, 03 Aug 2026 04:13:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:1c0b:57ba:92e2:e178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11e69asm36171805ad.56.2026.08.03.04.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:13:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sun4i: framebuffer: Set mode_config.normalize_zpos
Date: Mon,  3 Aug 2026 19:13:18 +0800
Message-ID: <20260803111319.2836240-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Back when support for zpos was added in commit 47a05f4a68f9 ("drm/sun4i:
backend: Add support for zpos"), a custom atomic_check callback was also
added in commit b8f1230dd3bf ("drm/sun4i: framebuffer: Add a custom
atomic_check") to have a place to call drm_atomic_normalize_zpos().

Commit 49efffc7fbd4 ("drm: Add drm_mode_config->normalize_zpos boolean")
added drm_atomic_normalize_zpos() to the standard atomic_check function.

Set mode_config.normalize_zpos and drop the custom atomic_check
implementation, which at this point is just a simplified copy of the
standard one. The standard one also checks whether async updates are
valid and updates the self refresh state, but neither feature is
supported by this driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
index 9c8ef927d929..fc822bc2c62b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
@@ -14,24 +14,8 @@
 #include "sun4i_drv.h"
 #include "sun4i_framebuffer.h"
 
-static int sun4i_de_atomic_check(struct drm_device *dev,
-				 struct drm_atomic_commit *state)
-{
-	int ret;
-
-	ret = drm_atomic_helper_check_modeset(dev, state);
-	if (ret)
-		return ret;
-
-	ret = drm_atomic_normalize_zpos(dev, state);
-	if (ret)
-		return ret;
-
-	return drm_atomic_helper_check_planes(dev, state);
-}
-
 static const struct drm_mode_config_funcs sun4i_de_mode_config_funcs = {
-	.atomic_check		= sun4i_de_atomic_check,
+	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
 	.fb_create		= drm_gem_fb_create,
 };
@@ -46,6 +30,7 @@ void sun4i_framebuffer_init(struct drm_device *drm)
 
 	drm->mode_config.max_width = 8192;
 	drm->mode_config.max_height = 8192;
+	drm->mode_config.normalize_zpos = true;
 
 	drm->mode_config.funcs = &sun4i_de_mode_config_funcs;
 	drm->mode_config.helper_private = &sun4i_de_mode_config_helpers;
-- 
2.55.0.571.g244d577d93-goog

