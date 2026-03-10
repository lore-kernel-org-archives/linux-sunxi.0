Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25E32E9757
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 03:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773112839; cv=none; b=oTsT8tsOal/OOB3qpn+50w5BJ+q6RQrsUBHFYDUmt1UD9YF6LC79EcE4ByYbvg2eyzSgKPUOFT68cEC6+5N/PTExCfLKoSgxYlrXvIh92jhbf4OmqWoY3ZavBBJbsvibL8ivqOVH+/MzKIn934nOJl6xpYEfWxF0HBUaWRylrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773112839; c=relaxed/simple;
	bh=nW0gE2uSilWfbT4+upjDtgGRG+odry5LG5qMMvRLlKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3/kqpRkSVew6MPH3NIyiLlETWDJRg6mURkx+CapY+FJocpJC1udyc6ldA2PoLs8RQxGazkmW0wlSeHsfNSXLLk6r0wO2xczO8bVQ1r3XtLIMLNq3AWTMt+QDi0K81N3rTDXpRK1jmeY2xYaoBY4ADmjiUYFcki8txEEcfd3AWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i83woz4k; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i83woz4k"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so7083755a91.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 20:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773112837; x=1773717637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSXqr7QpO3Zkkd0iv/RdDeMyqizg8C0r/CigYk0bPqI=;
        b=i83woz4kPdPhgrJWQxWPU45LUtOPcgQlOdznxzsRAp+PEGRG4Xi3jG6GiXT+GXDGMg
         I6IFQSUDuHqVbSgLHsZq+5UZj63lq/LeoWmqgilBgOoWtn9vPb239SKJT0ZivEAwqInq
         CK8ut6qsTsSLeYga+rIU7nJZu8fBBBti7LeF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773112837; x=1773717637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSXqr7QpO3Zkkd0iv/RdDeMyqizg8C0r/CigYk0bPqI=;
        b=jz2s7gjbKVd+N+DnE6QGKzj4s2ZyamDY64wAl/pw3eV+Y8lYyCQWtlDNlectEAWMP5
         EPZZlyr2hsxXmwBNaPkErTX1UJxu0h28GDZRz9ws1mN4OJ0jAl+Wr9FwTCIfLpaMoMU0
         xmT+5Z4NnpA9fPCXKV2BSahnYKg/CZOz+fVNbws/m/KbU81zo2RNImSldqM9PkOGqeus
         oE3CcrkSpGo/aPBeI2PKXpABZgqNDFqVGQ0GCG6GcVzxzCo1fdk/KlvKx1gctLOPMB1X
         2YmWhY7F6n0IE6+uqco7Hs7I6a/aIQ0S7qhwn7QfyptLY2g/sUJYUbpqB45xy1O2EtHx
         lNKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0jq0qFxgRkK3gnOpGyITBIaGabAppNANqJzyTKz/sUuCQ7NnOoueynKriPpAFrLhEcv1kudU5lB/AuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf/eeDnrJzKWEqllV3eb8zrX56hUCrWfP9/eFE80yTED0KXSLo
	0Uwd4DJvjzHvjBZ7fdiFAWSR68tYwmOutRQgvwM3Md9s94ko/9ziNwysujDKKw4UlA==
X-Gm-Gg: ATEYQzyit9Qz/omlE/xXRzx9UeQcPc12xbEBcLKS47v5it39MHTUmTv+7VMJoHTbFTE
	dc7DrcG65M+p3mSUcYKQzrvti53kG50Y0SM6OzKFSDYX1Pfxq5zR1fkeTjfRF2TTqlHIx/L4HcA
	bx3K2dl3A0mxw6Yh5QGsfg82uJlOn2ZTNo+bZTutr0gj1nuOvyFpg16YEmYB0Hu6JO/hlyQwBGZ
	L/HrNnqGVFO/LQde1wtRuQw/JRwVlk6ueduc0cG2RdpdQ4FPB42b+t7/jHVrmnqOzdE4rehL338
	VI+K5LTU0lzCKWUXVaGTjzKT1DdtIM9SHcBq/NKpb4tQDGXEacxhpTmFQhDCbgt8iXazu2FwiOv
	O9BUODJuP6XlECSZtZctFvSwH5qYZN4fwCDNVpR2NFbOKCQj4cpXIg0/NRSVyFNIzNfsRfulReV
	YCnXJrK6pNHTVAdpUmVdRbRnws5RhMvs2aGcDOlsm7tDy77lB/V0mhO+AJ2Fv5UADiF/wYusV1w
	K4evAsG
X-Received: by 2002:a17:90b:534c:b0:349:7f0a:381b with SMTP id 98e67ed59e1d1-359be298ae2mr13611645a91.8.1773112837116;
        Mon, 09 Mar 2026 20:20:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f79absm1154608a91.6.2026.03.09.20.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:20:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.or,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/gem-dma: Support dedicated DMA device for allocation
Date: Tue, 10 Mar 2026 11:20:03 +0800
Message-ID: <20260310032012.2542334-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series expands the "dedicated DMA device" support in DRM to the GEM
DMA helpers, and converts the MediaTek DRM driver to setting the DMA
device and dropping the custom GEM helpers that implemented this
function.

Various display drivers implement the "dedicated DMA device" support
with custom GEM helpers. These include Exynos, MediaTek, and Rockchip
to name a few. Allwinner does something entirely different, calling
of_dma_configure() on the virtual display device using the OF node of
the actual DMA device. Recently this causes a warning if IOMMUs are
involved.

This series intends to allow the core helpers to deal with it, and not
have every driver implement it in slightly different ways, duplicating
code.

Patch 1 adds dedicated DMA device support to drm_prime_pages_to_sg().
I believe this was missing from the original change that added dedicated
DMA devices for PRIME.

Patch 2 adds support for dedicated DMA device to the GEM DMA helpers
for GEM buffer allocation and mmap.

Patch 3 converts the MediaTek DRM driver to use the dedicated DMA device
support, and drop all the remaining custom GEM callbacks that deal with
it.

Patch 4 converts the Allwinner sun4i DRM driver to use the dedicated DMA
device support, instead of the of_dma_configure() hack it currently has.

The series should be merged through drm-misc-next so that other drivers
can take advantage of the change.

I also intend to try to convert the Exynos and Rockchip drivers, however
both also have options to set DMA_ATTR_NO_KERNEL_MAPPING when using
dma_alloc_attrs() to allocate memory for the buffers. I intend to
resurrect the DRM_MODE_DUMB_KERNEL_MAP work from Rob Herring [1]
to handle this. The Rockchip driver also has custom IOMMU attachment
that I'm still trying to understand.


Thanks
ChenYu


Chen-Yu Tsai (4):
  drm/prime: Limit scatter list size with dedicated DMA device
  drm/gem-dma: Support dedicated DMA device for allocation and mapping
  drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
  drm/sun4i: Use backend/mixer as dedicated DMA device

 drivers/gpu/drm/drm_gem_dma_helper.c   |  21 ++-
 drivers/gpu/drm/drm_prime.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.c    |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  21 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 -
 drivers/gpu/drm/mediatek/mtk_gem.c     | 231 -------------------------
 drivers/gpu/drm/mediatek/mtk_gem.h     |  17 --
 drivers/gpu/drm/sun4i/sun4i_backend.c  |  27 +--
 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  27 +--
 9 files changed, 46 insertions(+), 302 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.h

-- 
2.53.0.473.g4a7958ca14-goog

