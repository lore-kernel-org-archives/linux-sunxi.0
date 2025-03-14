Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B3A79F5
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Mar 2025 01:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741915236; cv=none; b=s0rempQM4zd659fVvcIZmrZpA4SGurBmUdU/rmTHLix//2EY2AzuwaAHETXOzH56xkfR4Way/7ye2YYKIycy9iT6ymQrWFjTMsFtqPj/BGbgkNwA17e74vTSO7dHhbzJVvzZpMh0sKDMl6SkN1PLhW9TriI4Fxgd06XmY0m6HCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741915236; c=relaxed/simple;
	bh=muRcBqlYjNJn9C+Xi6e7cherHhMZOwbSRv+KvT3q0Yk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lpM8T6P3eaBvIKl4TNWxZrmyD9fgy8CYYvfuYLaPx4jcGITIu5nXImHa1Dzvx6H+2dueKFTfvTBKectcV5ih4ECnaH8UTlakiMssJya9iAtLnrKiHId0E+9v1hNYum7CnGUbEfRnQCgFq8SLp8fY3yOm5ofC9uRUysOa9tiEztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9TSu1pG; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9TSu1pG"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8ff1b051dso3013236d6.1
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 18:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741915234; x=1742520034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6RyOfs+Y+zXnQN7nD15L11CcONhA3EYNbvNV/ylslsk=;
        b=k9TSu1pGQ/AnmDVe8mVBwLXfsz1UXvJEoI/iOc0aYcYd6e+SqWhHeeP5TqKg6arwA7
         cSmUBKHcG8tdTqLMmIPnpko5xZFLZOpGgc7ZFiMSGUS0JYYem9iWhBHUuaT76sJpnIfU
         +kGJuUfeWZjeFnkwOtEkzzGPEd117Tuxjh5Bf1kr/wvPPacIdeMioBcyTxj8NIfU5Bxe
         dw2Glqk3Sg/5+/Dv3ajBoaDoCgtwYABWs7ib71mD1sHOsiZ2hl0wpZ56A/RKCotPEnUK
         d8S/AXpAElydH0ecPmi0ANHJ9i20qXqsbQ7Soxx99h3ht8w1QNS42Ogy1m5NrDIV8nZu
         pkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741915234; x=1742520034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RyOfs+Y+zXnQN7nD15L11CcONhA3EYNbvNV/ylslsk=;
        b=Kbmycgr6zwPyteu2KMxrA19BMJTqYBpG6mPre8kI7kn4ubDnej6ttHkul+g2KcYG++
         PbQy1p709Afk1+McwanQU9CG9MAlz/fjyvQT0YFW3NZMffjPCJ67FZd/LzV386TH47/+
         r1vPyjxpVWYKKPrQpaPXcHbxhbZyWUmA70aFyhWaIIWHu6ZwyCOFUlzmWHKvbSvqYbKV
         s0QUJkrcFGrq22tQceQKryGD3PL2S7JJZQP/126Y/+9OD3p5yBwantiMZ8VnC2I/yDWi
         AJYRICJCjtHcva13mHx8GP+vQLY/yvsfZew8XOPVu2Q9KPjHQvlFGFXxXgeD+0AKzmN3
         +lLw==
X-Forwarded-Encrypted: i=1; AJvYcCU837+ONw14LYUKCmYgawPS7JeByGqa7R8XEqC5H9HT7FUwCpu+AJMLW0k5hYrcz+/Iss/KwqipI9elNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiJq4O3WAZCvxkDdot11BWp1Eld23UcCPyLt9oM7YnGtJ6DRUv
	ot32pVCcd4hMS4UWz2WvuMuVgCOJoay0Mfzx8/kituXBrwrVbDcM7pa+epY=
X-Gm-Gg: ASbGncvZeW0shFTxOzk0qhQhhQUGlZjYQ+gKeRXCug/qmRjyE5T20Q4FMUbjzErsUeP
	VJ4L4RihKe+LrsqVNeylJzswm1y4ah6NMvHRRtIGoj/oDT0V3+JMy/XkTx6HpCbY3zbr3zu0A7P
	N+V8tYxr0h4st9MbgXFl11T4WXOGqn95DP61Xnpnjo+7RszEufRzCUemWNIFIYbDP2mXpVVtKOo
	A34gXG6jddPaR1FFNYNsK0VJ1lJGgApKfU7dup7Sc/vld9rveJCF9vG7Gh26rDF+e5UeeGN4S5S
	WxWGpx3C8ctNv7SHS5G6rQT8zg0cEgCvqMYLHc3RmQ==
X-Google-Smtp-Source: AGHT+IGfhPTAxaf8B75RLgjVfZQ9MQSuBX9YLluLR5rXcZosHQPraRrM7+8ySbbt1uADkGdyWm5Dew==
X-Received: by 2002:a05:620a:440a:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c57c930378mr23367385a.13.1741915233700;
        Thu, 13 Mar 2025 18:20:33 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c719f8sm171847485a.36.2025.03.13.18.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 18:20:32 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/sun4i: backend: Fix error pointers in sun4i_backend_atomic_check
Date: Thu, 13 Mar 2025 20:20:29 -0500
Message-Id: <20250314012029.668306-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function sun4i_backend_atomic_check was dereferencing pointers
returned by drm_atomic_get_plane_state without checking for errors. This
could lead to undefined behavior if the function returns an error pointer.

This commit adds checks using IS_ERR to ensure that plane_state is
valid before dereferencing them.

Similar to commit da29abe71e16
("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").

Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 2dded3b828df..a8e0e2123764 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 	drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
 		struct drm_plane_state *plane_state =
 			drm_atomic_get_plane_state(state, plane);
+
+		if (IS_ERR(plane_state))
+			return PTR_ERR(plane_state);
+
 		struct sun4i_layer_state *layer_state =
 			state_to_sun4i_layer_state(plane_state);
 		struct drm_framebuffer *fb = plane_state->fb;
-- 
2.34.1

