Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FCB33BBCB
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279807; cv=none; b=ajHpCwz87wTYNsSRzvVcU30ETfGEC1cRlsoslR81Dk6vnmuzdTr8eb4BFbThBhB1efBQwbseBVw8AMYe8et5THT6KjQys3/Y85oYV08g9Sed+4+iQjSbrAJGbl0SfTwUgGVrqKSFKGF/ftFMn2/MnyRa3EXpdC7Yy2HkhNdiOHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279807; c=relaxed/simple;
	bh=4G5UrM8a7/K3tV3l71rgb1Dcgib61vdWac8QHH1DBdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mumH4ftKPFDvJOLr+6ovStcXwaGPt7kx6hEq1nVU1+j0RURgtWiC5Appv+TyTTgPb5upQGcM79A5IbgUj52fK1vO/RQHPRE9Bfb3xs0AiwfxLf192iOZ0MFIMC6AMUkYPV/leI3kpFMVcQ3XThia5zkZkW6y5p02dNIgDIBlWQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFJFKLw+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFJFKLw+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47721743fd0so31651725e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279802; x=1762884602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBEyfODAKvgwzHmkCm17lPDKK7nQ8zv0WCO9yDZDp4E=;
        b=lFJFKLw+7mkOy/UINVA8KluOfobAjEzh8ChmZLiV5VayNRum6aROtyaz9i2RFPFaWF
         kHBj4cMMi1u3rGZbfTtKO3nYOT+rdUINpeOM6a0SVRUSh49DP/QbncZCbMp7RiJu0YqO
         Ai+Q/uLRnozl0++WNbwlMIqeX3f2lEkuC8xwGs9NGxwtQ0ZqFeqrWkPZyKB78/wPv5DT
         0xcQ3hrZUyQYDNF1Kq1ZDAu6YPLDcTINT7686q+tmoH+DwYKCXgQOwKhBViMTQTFIoik
         HqsnRUUl+FWx8Hv6pvOvSE+O2NYGMsiK15hOVaezrK11mLwsoZcvmB9J97FvsWLlSvZe
         gHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279802; x=1762884602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBEyfODAKvgwzHmkCm17lPDKK7nQ8zv0WCO9yDZDp4E=;
        b=FvnABvBumLMfZeB8tLxYG5fBfWZOLOf1BkKldaBn4QM5UB1Yw/EYkzwyn4/cd/J8Dt
         2sIpYZAft9lOWhXmUeuBcoWNYSgM8ZSpLTv041CVaXex65b4erWU93DcB6HgsPxMMv+Y
         YA8x31MRAnXYEs6GaHzYIZ/vRFWqFS0+x5bhJMk6ZygGn05p5D1DQNbc4NABqF3k2Jk+
         XQP95GENaBtWGhPzEb23rHqVBDAbci9EJiUdEqc8QL+glEw5G00bUAtOUO9L6T8Lq6Pw
         PlP0IXdDiHQpjZX2Pl1FyGdgLYVBxlpG6Ve/lU2gPTiNFJNY6SNgZ4VuPdQlk9GN5RkW
         EBYA==
X-Forwarded-Encrypted: i=1; AJvYcCV2ecUgCHaWJ8kUQ2x/vORlSQuJPPQsKM5JL9dDI8YCbLd11iSeMeGS0qKIF0PG7rdtodN3lRq/IUMnqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyVfZkEiyJuedjbL5zKpiNuC+0jTn5w8LB9BOMsNnX7QiuBi9A
	drnhFLt9sB46pVeanznCshpD4mg3XzXu8dcfUKNPZI5NGm8mkrTDTy8D
X-Gm-Gg: ASbGncuCsXN4HcjsdsgzwZ91+EDyYFHwrRO/LSmw3u7v00fzf7YqwFWJaAnunVf/AAr
	uXQSt4CIbjk8qVpDiav3lssrAiy/HmXI8dOUo8xp81MrZ5MJ8NLMPPcZXvT6Rvit10aXWkXxaLl
	UGJh4W3kpgD5gDPvfzMveCDNfm1P72FfsGureJ3mxpckebqSXpCsp4SYK6Ze+gVb3wBpyOI2m6l
	aYjpK82n3Y9N3tf8rDGqkfUh7gS2QxExlNP9WX8BY9eLk+ii8XOzMIkRvRvk4S7KRafV/wl9DQy
	to5Oo+NuWuzTqSnd+3hYfPdPNphDH2U98gkmzImhRqpvtUARbdPLooa/JxUOZhuEBi6nwuYdcK2
	vXj/jNUo2leWCmaSPw7nMEMqtyFUq3n1jDSVUkrMyHWHfN/ROC4wG9VU5aNf+zWQWuH5DTSAkIc
	pp6oFm473w6ISHmBAYyw==
X-Google-Smtp-Source: AGHT+IE+3VWITYfmpHgFCOUqnzMrVHgHtPMl6DRBEJeRwc9yMJmO7cxC+Ce40qfK3g3txnNqIhsCKA==
X-Received: by 2002:a05:600c:6388:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4775ce1874bmr2405065e9.29.1762279801598;
        Tue, 04 Nov 2025 10:10:01 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:01 -0800 (PST)
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
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 00/30] drm/sun4i: Refactor layer code for proper DE33 support
Date: Tue,  4 Nov 2025 19:09:12 +0100
Message-ID: <20251104180942.61538-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current DE33 support in sun4i-drm driver is based on my PoC code. It was
written with *a lot* of hacks, because it was never meant to be upstreamed.
Fortunately, DT parts were never merged which give us a chance to do it
right.

This is first of three series with proper DE33 support for H616 SoC. It's
the longest, since it prepares terrain for new drivers in remaining series.
Point of this work is to completely decouple mixer and layer code. Till
DE3, mixer and layers were intimately connected. However, from DE33
onwards, this is no longer the case. DE33 and upcoming DE35 planes are
shared comodity between all mixers and can be assigned in any way driver
(or user) prefers. This requires planes code to be completely independent
from mixer. The only exception is mixer clock frequency which is used in
VI scaler, but in that case mixer pointer is obtained through currently
assigned CRTC.

Second series will introduce separate driver for DE33 planes and adjust
mixer code to new DT bindings. Third series will introduce TCON(-TOP)
adjustments, HDMI PHY and finally, DT updates for several boards.

Current WIP code for remaining two series can be found at [1]. Code has
been tested on Tanix TX6, which has DE3, for any regressions and on Myir
MYD-YT507H board [2], which has DE33, with HDMI and LVDS panel outputs
running simultaneously and independently. This confirms that plane code
is properly decoupled.

Please review.

Best regards,
Jernej

[1] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/
[2] https://github.com/jernejsk/linux-1/commits/okt507c-v3

Changes from v1:
- collected tags
- updated commit messages
- added missing kerneldoc description
- moved vi_scaler_num position

Link: https://lore.kernel.org/linux-sunxi/64c0a4e1-15a5-4f41-9fba-852b0e83fd6f@app.fastmail.com/T/#t

Jernej Skrabec (30):
  drm/sun4i: mixer: Fix up DE33 channel macros
  drm/sun4i: mixer: Remove ccsc cfg for >= DE3
  drm/sun4i: de2: Initialize layer fields earlier
  drm/sun4i: ui_layer: Move check from update to check callback
  drm/sun4i: vi_layer: Move check from update to check callback
  drm/sun4i: layers: Make atomic commit functions void
  drm/sun4i: Move blender config from layers to mixer
  drm/sun4i: ui layer: Write attributes in one go
  drm/sun4i: vi layer: Write attributes in one go
  drm/sun4i: mixer: Move layer enabling to atomic_update
  drm/sun4i: de2/de3: Simplify CSC config interface
  drm/sun4i: csc: Simplify arguments with taking plane state
  drm/sun4i: de2/de3: Move plane type determination to mixer
  drm/sun4i: ui_layer: Change index meaning
  drm/sun4i: layer: move num of planes calc out of layer code
  drm/sun4i: ui_layer: use layer struct instead of multiple args
  drm/sun4i: vi_layer: use layer struct instead of multiple args
  drm/sun4i: ui_scaler: use layer instead of mixer for args
  drm/sun4i: vi_scaler: use layer instead of mixer for args
  drm/sun4i: layers: Make regmap for layers configurable
  drm/sun4i: csc: use layer arg instead of mixer
  drm/sun4i: layers: add physical index arg
  drm/sun4i: vi_scaler: Update DE33 base calculation
  drm/sun4i: mixer: Convert heuristics to quirk
  drm/sun4i: ui_scaler: drop sanity checks
  drm/sun4i: mixer: Add quirk for number of VI scalers
  drm/sun4i: mixer: split out layer config
  drm/sun4i: layer: replace mixer with layer struct
  drm/sun4i: vi_scaler: Find mixer from crtc
  drm/sun4i: Nuke mixer pointer from layer code

 drivers/gpu/drm/sun4i/sun8i_csc.c       | 113 ++++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h       |  16 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 217 +++++++++++++--------
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  65 ++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 183 +++++++-----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  44 ++---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |   4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 244 +++++++++---------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  51 ++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |   6 +-
 12 files changed, 475 insertions(+), 482 deletions(-)

-- 
2.51.2

