Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411DC4EC658
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858477; cv=none; b=W91GvysBj92BWUi/4yfbPItYJubKyhfniXMpADSFZAKXTRn27ch0pXzHAb6OVbXVURbUN5u3SsjTkpspFJdnimPtdOx/Ggge/MfwcO8fP7wYWQJxTPJmtf1vlaTCzE8hoAk1tWsAKqaq0xzXzgWlxu1ynqhdhrb8HnQuBbWxuWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858477; c=relaxed/simple;
	bh=eI7mygHg5Pp/gueDQ8IVUiOrphdwqMR4YUjhIN93PJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnP61P8LW3MzFBKE95fBw3CHTgONTfoAz1H9p1gy8Fx7q5pCyZG3KaHgFkQNB24x6xB7d448V2djzrQXQqBzN/q4b+MCrUhPVhnrgdYypBjTEympZgftWboUXtcYNwxvcNFZfywnqiL7AgguvXSFAQnj8kl7OMn1Ehh7lMZyVg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G0KAhgIw; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G0KAhgIw"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3499229a91.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858474; x=1789463274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMi1Y04Cowkyywav7yYVH94ClrmOV8qsvBcUcq9aXsA=;
        b=G0KAhgIwDl5uKePDGlLU39ea9JwopKpi4bVH7aANQ8LdNLrr6XjvYYlVNEsgRG3CFs
         JCL2e5LXS5HkVZ+fHXmVbdufEIT+GKovE7nKgvuI4PuYGjZwtZ+4DHWxXW03DL821LjC
         smEEKze0BLTF6y+x05uE2MrxR40TO34JYKU54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858474; x=1789463274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMi1Y04Cowkyywav7yYVH94ClrmOV8qsvBcUcq9aXsA=;
        b=ZJhrvQaOnJ4bNhvOKdqGBA+l0aH/S6DxK7KUiDke0g8vcfTbdaaf28cCsuQWq3lV2R
         yjTI9gF3cmaHquMwAILjmZS4AYK1DgM0LgfFsqwXuIQWMPgYYi5flnbWi2oD38Ywx3/8
         9QJGTDsnjJygj48m6dFVU/YahJX77ULQBE5q1YunDpcVoJ4Og4zh7dDQp/BIAyuKfuat
         NhbG3qqMO/JYLhaeeDWwV0slY8jcxy4SYfw6uoS6DE3UGMfFLC7T4i+A1LGGNq/nHpCH
         8jAdwiAanJj2mQ4HqITFg5JAfH3L1RbATFt4DRSs/IZ4wkkUD7oIoZieZtcvcGvT7pjI
         botA==
X-Forwarded-Encrypted: i=1; AKwUvBxaZMsPLKde0c9Acrs0qCkE8xVLT9I8fKsvSu5kfBuA+kP9JFkJHgoOKAbPRcuz2pURz0kepE2yci27eg==@lists.linux.dev
X-Gm-Message-State: AFuF++nx063ZlIXklFvOzs1Z8nAptloy0ygCZuNP3gWg6wni6C7Sxpko
	1P0WuL9Rc9zAxIUw9XPKDewXhoRC3zwbB89Sniinu7o8besGWPnOkP2wZYAuUltD7g==
X-Gm-Gg: AYBFou2OwKHRNlKZcgK5Tk1pxqY1JUGU3bjdGza5qetmCTO9wJ+RU+HL+vlUL/7ix3r
	75tCYhT3AqPW/WMg9obXECvKfWHYPTZp1uaimuBV01Ft9rgtKSpVyqzmpOjNTowiHgP2nFui8T5
	VpkpDZH1YauMwe31WPqunh4+YzA3cWG/yxGv3KXq0yVdZ4zE9YX08pyQRBm9sZ+9StG/Fk6qaB/
	Cy9/W7rSb3qtBQazo6jDk3rZchDV4w+SZIHcBIPjihFRb92z/K5vDKIcZvTO2pZM4/NUMYrqve9
	LCedZQrvyo5gO/Kg9KsQJePyxUoJ12H94i7jy0g/zHdL+jK3+8Nk2NT+b/S6EW/E0z4wKoRv+5F
	Pd04M4n04DLYUU2souaM58/G8VBwURvoyLEJ2yv2lmwuxxnqMPW5U1JtemY+4osupfQZ3R3FFj6
	3Vf5mM2jA7DW96PUQps2ZRRqcqwEXbA4DQEXxKRDeTfxuHBsHS/E1aDHQzEVQceQapu+tcayDvs
	MihjhS7QFhwt+O7HRm8RIgi/eiJjuxvSZA/hr0kavWPWo0=
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr45630109a91.12.1788858474627;
        Tue, 08 Sep 2026 02:07:54 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:07:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Tue,  8 Sep 2026 17:07:39 +0800
Message-ID: <20260908090745.1089143-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address.


Patch 1 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 2 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 3 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 4 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (4):
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 63 +++++++++++++++++++-------
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 6 files changed, 83 insertions(+), 40 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

