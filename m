Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FEE3B961A
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113144; cv=none; b=GdkYbRj+JR7JVoBJDVdeMgq0jst2HZWckRuSOGoc7Rf58ff3INZAhnYu0QumThkXl8fx3HeTR4zM1750f87z2YuG9fHmB275uGAd0i1TZfD2x4dLyf5G85rwQuTzv24lYfPmQnIvZPSMMFN6SBf46MF/M9hhXBQRyuCNeGlETN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113144; c=relaxed/simple;
	bh=qjJaApwZbfZd0J7pts/UQOlOFCjVYPGc55U5XUfe+HM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YHvkXBnUNTzmkW2O7tk4zBMQ9yqzzLgsjYduKPmYszCuyejJdwaeJdZ5R428Lzkuz2c3vSTya75+h1Pc6FSkWn2QRMmTK5pNET9Q9SEMrMn4W4CRIqouiYirrMGSrMLT+g/0olcvw1lSVQm4vKyH9wooBk50GNODexdOQa5myFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lyvNEJ42; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lyvNEJ42"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a8fba3f769so53811405ad.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 20:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113141; x=1773717941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OoV76OKOjG7uxIKEUxi5pEmwh+JGNhbt1HMoxK+jnjw=;
        b=lyvNEJ42nzB5JqnvScBv7aRqzk4G2igMSN9F8sO4JH+vmXi9FUbU42B4dmgHktk6Ri
         2tDEqUs5hznpA0ehYLCWo82REMqZ2FB9vICPwq/h3gAXsgtoXMR2jX9lI6n2nW1MlZZh
         3ioiPw7vaijr1TY4ijNytECmpG2+7p4yFfu44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113141; x=1773717941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoV76OKOjG7uxIKEUxi5pEmwh+JGNhbt1HMoxK+jnjw=;
        b=maJLP9SrL7fvjQCnXm52h9VmdeH6GPs4yxDPmbGCaEHLEkNkmc9+VFzw3VMa1LuSDT
         dn9zv3F1VTv/h/X6AKfyzJkjhSs1fZU2x8QpGp4NYGUDT2CoIIgKApyenrvQpdfheYOn
         NjE3PVFCHvD1Wo3elTsLcJ7e2M+TD3KuFGxZQk6SM2oA9RoM59M7iLF0O3HZxUSVEg5r
         Mxne6LON2kHouTvjBZL45VgIaCaXXL5fXgrnXLz1OOZT4d179kfYlQZIMeE/gl6RrCsk
         ZFkSUBAgqcjyKIaKlweUk0KOl8woltY/r4SIU1jNH3QsYFVGObc6/NHZPHgWO/XffHFa
         7RMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoOR72wwuoPLbMCZRRfCgvH8LzpkvnV96to29YeoVh29q0bVtMBfD89Dn1sGC00YVl2ifK8r2895hpAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyH3Mhko0NUt3nNsk8fzpTO5SY/ERX5bC+95hS+7SmkYp/JCRDR
	Uwq2ndQWyEPHmrV+tSWE5P1XZn11O8Cfl273kjGGtWN1Y6zn7ilUl10Iq7M/8gtUqA==
X-Gm-Gg: ATEYQzyMEX9f93Hi3EDXFXJH2N8q/f2PlUGeHCNUsPEKPJ7sceSxo2DabWuxrvs+cD2
	gD1AiIxg22FNJsSkNHrY/zNp+kdFhrBXyn19H2thTa3iNjMR1688LKqmrs0kjGadiHM16EeIm7W
	yQk4GgcN4mux0R2s6u0lr9W54vo0K8cC5Hhen34rebRE0yDNeqAM6hkwxwcJ7pSjtgw+/vo9StO
	Yw7HE7EuHVrFwP/CIpWJQNd3HAbHPU48U9qOCmKbDlk7EpdDb+6ESiiyvbbPfNPxTZbPeQp6jrc
	7PGgqH/YqLIZ1oiq6cM2W9EXmPoKL6U2uUEyKlN++kyyDYKF7QowCypCFic5JtCvay4CLpPVWPd
	ywUTMhXv//wWJC32khbuwHJ/NmYprzO0o7byN0cuIFsJmAWJNwVqS+49xknf7kQ2cG67VtWzKEU
	DKCVEuTNKY05vLIm9daN0vWaAxXnLpfXulSmiksGWrKyT87QiyyOC4EPXl5kl0C1y1UKSUTovJr
	zteWOLL
X-Received: by 2002:a17:903:2452:b0:2ae:5752:af82 with SMTP id d9443c01a7336-2ae82498328mr120569975ad.49.1773113140915;
        Mon, 09 Mar 2026 20:25:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:39 -0700 (PDT)
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
Subject: [PATCH RESEND 0/4] drm/gem-dma: Support dedicated DMA device for allocation
Date: Tue, 10 Mar 2026 11:25:05 +0800
Message-ID: <20260310032511.2545500-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(resent with Samuel's email address fixed)

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

