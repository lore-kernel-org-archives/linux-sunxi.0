Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986171E3DDB
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297023; cv=none; b=SrriqEipRSjKvZtqVS0rIeaa0b7dXRJyWwEGs0fSrd/vNr5Nr0FPJMZfCWErC5tWvplcG9ND5UbKSf7kN0Zs8WVIrruyBKwzGnetF919r53DT9yzVQUD2q8pvysP4jGboGp5nnHigdyyr875eaGApvnKYDLbH/zw2VhEKgo2D3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297023; c=relaxed/simple;
	bh=/Sq/r9OQywSMAXzb5b4WcZt0oyxDkxQuNxV+8frHXhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZkiltR8KtcJX+P2iK2Wiu7ZXKSqltefL81r2nApBIaD7Sh/zELbuJKxbHSTcr79YZSfmnB2aiwaN9hy7hlToVHbjToUhohkXj0CUErm2YeM9f0OqLcEd9c4SGWCan6j1JqWlBg32Jo7dlTfmLncW82CsTrtKeJFuxpqwA+KOAoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGziZDkD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGziZDkD"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b40f11a1027so636754566b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297020; x=1760901820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7J9gAExUq+Oz4yzs8pY69VKrstKlhFOaCqrIXbzFC7U=;
        b=nGziZDkDpwFPcy3GETtKtWGChmpByuCz8ebdsPXUbuM5NXTIkhmPJ65yj/CwgCribk
         JcCr7t32A7j61uFXZWL6zPWr3sIDsT6YoimUbtl6Jn/SxJ5mTFWsLhxW4C60buFtt6KL
         zB+xc2V3jR/d5UnefUXDDLX1FRvQGv9Pr6BJW4eoyO+4c9lGUu2p+lRWug9aR2Ja8CKO
         V7JQtyS0K3KbPsoIduS0TzXQog10rZw4mI9oqk7jkrMIwGnYac6O0Q/lo1C8xmqoomGy
         LBCPmRwJgN1voZsR02xg1N60w4WzydjpAhe5UHjRjvaYdB6yJDYtHeY9WvHQOU0gJNKy
         lQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297020; x=1760901820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7J9gAExUq+Oz4yzs8pY69VKrstKlhFOaCqrIXbzFC7U=;
        b=JYHzz+sMTWKegKpu1eMAr2iRrhnuxVbjRs8cv+dvyH4acCzqPo/CL/mRHUXJlVrlhR
         r05xptyGxsiFdCQDMZ9eMZDfM2hGCHsSj/+vtp0DA+jr3ynL3UnLMqjJmXdMz/uvkJo8
         VC3EWVmJTNV3EgIT1re3ovIP4ikKNLv2Lm6dJItw3zFGvznrAyCpyDm3NXuR+x2LYgcN
         rT7GAt5BAywO0O88fK9e2Lg0tVtWChyAbDh4s3tTheBYEGiNzi++X5OVp+4f4dVumIC+
         9/gJeqCzVze6xgfB9dMsYgGai/Z/OUELt7I5LdxrcwgPXdj3LlCzTgQRXVLWmteNQz0D
         Kjvg==
X-Forwarded-Encrypted: i=1; AJvYcCU6/fAfUCFfyMmVYPQnngS5TmLFd3ymGF4zJJOB805Xjb8+JVaTYh4jLmpKBFoAzuqyhiI5OKYeV3hsBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdmZ4hUWTPRWHY85+Cym2ra/xnx6OypwHzSzEVgOQuR2DE4FUF
	pgq2mh3mqoqvdT70P3xnryiy/2hjEzsY9K2WmG3Bbl553+nJgYNRgLiz
X-Gm-Gg: ASbGncs2c591X5UuS5ZasxajgOZYODDQG0fFKrO1c3nlrAPeS7E/ytud14aNtYhi1cv
	YzB4HaLxQ3Jlw2aFPmoxCBRRmnfJgqPEFj7lCZM2AmEiL3ymW/tZKdU8CCpgpcU/KZiN43+k4CX
	G2xmaVPSxfv9eRBWknohMRzD1x/3QU09uSa9ZpZa53vpwW8BgAtYIjXNNGUdlZWMP+dDbtJ4dGI
	UwebYDdF7Ti65CX1KJ4GPWwwH1rsRJrHCkZapmyVzIZsAmo1E1eoHcMkMLxsIqKTWAh7wnhnIYN
	i/Vvhys6mgJwnrqnmZeKAqrahZXnqOIxW5j4oBD1drOgl5a8lL7KRLL1Z/S6YKvq/h01R5QFqQ+
	f29LcYlB/9A4bjSBp1w9uthES4u48uW/xXPu5PnXGZXMGg1p2xyjCCkrxrsm+cK789hPTqWEdzX
	Y7Sf6wJFJt9It5VEC2PMdai+PWAOvDOYE=
X-Google-Smtp-Source: AGHT+IF/Uy/U1nByaSaW88fFTBwL3trPURZFYBw8aStQyXQaj4POBOaMIpn0nvPCtXBb63j96D2NZg==
X-Received: by 2002:a17:906:c1d1:b0:b50:b508:d0e9 with SMTP id a640c23a62f3a-b50b508d6d1mr1500404166b.46.1760297019654;
        Sun, 12 Oct 2025 12:23:39 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:39 -0700 (PDT)
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
Subject: [PATCH 00/30] drm/sun4i: Refactor layer code for proper DE33 support
Date: Sun, 12 Oct 2025 21:23:00 +0200
Message-ID: <20251012192330.6903-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
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
  drm/sun4i: mixer: Remove setting layer enable bit
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
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  64 ++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 183 +++++++-----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  44 ++---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |   4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 244 +++++++++---------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  51 ++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |   6 +-
 12 files changed, 474 insertions(+), 482 deletions(-)

-- 
2.51.0

