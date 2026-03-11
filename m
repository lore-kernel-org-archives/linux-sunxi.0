Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0363A543D
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222595; cv=none; b=mRphEFpmRo+Kwh6zz3iABX9U4jV8zng+EyFFaBhiF7oXLLgmpsC9KXO60maHyu4J3uUewveSsbSDCHTiEqY1lqd5JMHTfk1kY/RlGLeVXtydTNx9Z3kxUDQgevoa0tGOuwv76XqxxCwMc8I7z+HKVN6oj8FzNdTff6HDBULbf8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222595; c=relaxed/simple;
	bh=n5ZK7F1V2KiNJeUD9xBYVwS7lRGLh4RYsfTc7g92nTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DEF3ZvuV+/llKjom+LGXt5CQ5Wd5dTLIbXT1U2LLODptXfAJkHFQQZBPNWGM7HvP5oRpvLZOHQf1l9mGbIs/0EmnzZrQapygEtGwej80mSQfjt0o0bR1hA58YoNbJq5wAk0SddwrIxca42SMnqV6+xLoDy4KvVW+3Pv/ZoVBXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZagtIJ0+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZagtIJ0+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8297310ce0aso4405896b3a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222593; x=1773827393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3c+qlxblsTBEXvZcg0JlOjOHrwtZ50FEnfrmL02pXEs=;
        b=ZagtIJ0+w+Lc4zf/Ntz0bAyetnS5DU/ojEs43Wjn8z6ds5HKcEAgb33wIMbkQN6HzY
         zAJf1ZsT+kVsVhvbpEjPlltHR6e+5Z/NS3p0OxBYloLJkSt+1w6MdNd3Uyj6yjRqHLz4
         82dg5HhM5wuferuAsxVyx50rhpY99HG43wejI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222593; x=1773827393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c+qlxblsTBEXvZcg0JlOjOHrwtZ50FEnfrmL02pXEs=;
        b=YxlQxL2rYIfqHiZbhkbkNp3mVHAcBTlPvG/PBrci22JBsiGFYL+iTYk4a2YTNtuFrj
         I5eIDr11jMc7U67RV2iFU4BMFVbpLdPO+FvQfTBSZiI4OLuDVQy1gEJhJvP37XBVSmbF
         RiE9gDntr2npuLON+MYhkG/GTrJvK8QKD+mI+4XmcDlH7R9OKYzqTY0CWAgMQUuxCu5l
         xG8cvV0Ne54dLAqJ79aXqWJdT1pAV28gubNWE6Yfcna3efJOVSbo5aJrwkO7+t/DkjpY
         qoD7LszYCw83KVbTNwVFss75nvxhhQqfebdI2tpSzCE+Rxr4vUWAlhKoOEiz0fAnsqfL
         Me8g==
X-Forwarded-Encrypted: i=1; AJvYcCUpxX1SmHBpcAm3D6OaMQE7K/DMw1TkgOMoj4g4CXcmLC/mHYjZXcTqkmcUsNjS3aRQF69mSDuB4jmVBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAn57XcFgcZ2598Jn3AZTr/oUfmn8JSL2tuTVxxACt3rsoppv0
	o/uUVGf/3krFMxq/kYMtbChBm2pbD4KJl4c/cFIyRIFgasaSNBz6JBVvFTxZTxiOMQ==
X-Gm-Gg: ATEYQzw9Is4+HXldvmkVndTDl+25eVhX/fk1tX+HGCJjtnjbkJidMewISjKmTm+YeTx
	pkkwJBPdKRaE946fh0g1kdUWp8H7kNN1II53AL4MSB8goREbK3BXyjyVpDMDD5pg11iYpNwRe/J
	LWgj7c94Q9DRGNyQZarVLyqTDn1dm+LCAiSKkvFE1/u180ZOg5AFKoCd2BV/+6R64LyPe0NaCwi
	ucBC6GH3v1Pjnmkw8N+OGxso18DSQgHmUHuwDu3QI3yWvV7g8RtHGbQttFq3slDwZ9OyBBY5SWg
	6lgrPfXSOiXTRaY6NZWXiWwIPmpY3XbBL5JCOdMcdu34URgNjkf0U+GU9UVBWFK1eONOq1MVVox
	v8GligjXa6WQAdm12XFSnqltFOOWY2J8aE3TgEKO+VRCJPfTTNWFQPp3tyA6u0KBTZgi3So349T
	X/y6bVeOVEnwcOgLTnXPUDpgQ9fKJqjIAoa6LsMjOCb0TN6i4OxdtqRqNTXwRBxXm1suYIfM43M
	YRxSwfm
X-Received: by 2002:a05:6a00:7095:b0:81e:7496:f826 with SMTP id d2e1a72fcca58-829f706cc42mr1683975b3a.31.1773222593454;
        Wed, 11 Mar 2026 02:49:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:49:52 -0700 (PDT)
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
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] drm/gem-dma: Support dedicated DMA device for allocation
Date: Wed, 11 Mar 2026 17:49:24 +0800
Message-ID: <20260311094929.3393338-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This is v2 of my "support dedicated DMA device for allocation and mmap
in GEM DMA helpers" series.

Changes since v1:
- Link to v1: https://lore.kernel.org/all/20260310032511.2545500-1-wenst@chromium.org/
- Collected tags
- Removed reference to mtk_gem.c from the Makefile

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

The dedicated DMA device is set by calling drm_dev_set_dma_dev(). Any
code that does DMA related actions should use drm_dev_dma_dev() to get
the DMA device. If a dedicated device was not set, then it shall fall
back to the DRM device's underlying device.

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
 drivers/gpu/drm/mediatek/Makefile      |   1 -
 drivers/gpu/drm/mediatek/mtk_crtc.c    |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  21 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 -
 drivers/gpu/drm/mediatek/mtk_gem.c     | 231 -------------------------
 drivers/gpu/drm/mediatek/mtk_gem.h     |  17 --
 drivers/gpu/drm/sun4i/sun4i_backend.c  |  27 +--
 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  27 +--
 10 files changed, 46 insertions(+), 303 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.h

-- 
2.53.0.473.g4a7958ca14-goog

