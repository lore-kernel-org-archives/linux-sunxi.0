Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3325A72
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Oct 2021 18:10:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so4633502wmz.2
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Oct 2021 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XkQbOoP/+0N5j4wytKxJfGYLSAuO1fbKKTQCyzqNEpc=;
        b=ZAwL72nMvl8TZfTQepywrkwV7ioeJAUrEnyM2HrUBojS+OCkLHwmYwpHNbRIsSe5gI
         P8UOh0ne0mxguVVlK/pF6AY8Jhjy+U8YpRBmmrYf6tAWPVEIJq8l4PWd4UH8dJg6IRWx
         pM6B+9pfH8L7vnmRcoTgb7BoIu++BXvUPy1zlbbztIJgNtQD8X0FEd8j8iAylUV8zwUK
         JTBQhMEmDw6X4D7N1NApqDNpCgNcHI/QWBwbYkdvYMHMB4gkxxXK984GMK1clGmk3ZdH
         OoC7XJgno9aBIQdLpFV3ZB0NL09dAm8dFH7+CWd8ZNvS2eWKZDTUGK/0EDYu84UCdJvr
         n3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XkQbOoP/+0N5j4wytKxJfGYLSAuO1fbKKTQCyzqNEpc=;
        b=ryVFRH4ifGohCmkwXJBe0xmlC6M+6RZIJutOoiSKOyOkwm1uA5QmbTiEQHZSnmF4Vx
         ascAMJ47FU+YPPhhl+GQ0+4x6Ce8UU4ovjBwNUpZN5QcjGBcBibJ64nhMPsj1suK3f7G
         exNVOrPioVjR19xFg2awYpvGqwZFxQJXRPd2/D7rKNDvx3T79lsAONwG3PCbQ1F0Oonc
         WJEaIBzlEDJR2tNToYDg2aJ/8Vz9wDDgcvIsCGi86F9cfTLCDgrMldFY0TgnDS1Hbgs7
         K/weFRAFZ8MfGeNR2EhIEYc+vT7mF/qQAofCiTtSeWTFdlyHa5++crA97ztxu4R1Ri9r
         ayMA==
X-Gm-Message-State: AOAM533UrpbK+/Xk1XRYuAudfWa4vL2RNqHkfirqZXJeWTvCJvjQaFxI
	n6aC/CsquXP3z+3N+NsU7pA=
X-Google-Smtp-Source: ABdhPJwDTK6c1LsA20fuK4Ogpi1SXUC1fvQIs3S0dKO9MfZhXz+PO+ZSWdQI8kQ/4/asgaInGjujKA==
X-Received: by 2002:adf:bb81:: with SMTP id q1mr46649180wrg.119.1634667043622;
        Tue, 19 Oct 2021 11:10:43 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id 73sm2871763wmb.40.2021.10.19.11.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 11:10:43 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: virtual CMA addresses are not needed
Date: Tue, 19 Oct 2021 20:10:28 +0200
Message-Id: <20211019181028.4190737-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver never uses virtual address of DRM CMA buffers. Switch to CMA
helpers which don't deal with virtual mapping.

This was actually already the case before commit ad408c766cef
("drm/sun4i: Use DRM_GEM_CMA_VMAP_DRIVER_OPS for GEM operations"),
but only convenient macro at the time used helpers with virtual
mapping.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 54dd562e294c..b630614b3d72 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -53,7 +53,7 @@ static const struct drm_driver sun4i_drv_driver = {
 	.minor			= 0,
 
 	/* GEM Operations */
-	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_sun4i_gem_dumb_create),
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_sun4i_gem_dumb_create),
 };
 
 static int sun4i_drv_bind(struct device *dev)
-- 
2.33.1

