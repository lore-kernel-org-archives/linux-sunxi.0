Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D83B9605
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 03:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113148; cv=none; b=uKwUDvLYDsAZhiBZuQMNrlYMdGKPxAHT8KCHImqQWBtSr6MsyvLfNHdIwugm4RKJn7k4Bok5JJxNT+5HZ9CtCsGCCNRMZzVrXaD96skMiDZ3FsFC38ed5z6wehKf59V6QHUsPhR5GLjCbwqTWiWFbTbjNZ+0y5a8OGkGbkb8Tik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113148; c=relaxed/simple;
	bh=oAfrAdUsiN0HiFEo2w26stnO59aZMIB4kMYEsBwkc3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bA6v4hsXngP+xWSZpPyi85F+T+szU3CsuHiwDnfB2luifaZw8ED3fGjSCracYX+bhnPLwtHsMMUrbJ34T58hTVUXSq4w0/iqtIH77nwJ3+b0GPTCKUXdWgybW1GV2YZWwQGEQJbzPi7PaJRPAEqhjXDAPaVTXxLNz95H1n5zT1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UF/NF7hf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UF/NF7hf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab46931cf1so84671555ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 20:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113144; x=1773717944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=;
        b=UF/NF7hfwJUsuRXKVIpuXUOrXgkQVsiFsnn3uthLDsfAW3pBV26M1nUpLLMdxk9z7H
         O/EUppSejMVhER4B2zzxM+LjR4B+JCxfzZKac1MAAqanf3DDjoeygITqtqjfGN24ZRbv
         6GXU3aPzpOEbl1kPecpFb4AaJDV71pwv6lNt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113144; x=1773717944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=;
        b=jxGTzWu4IUrKYT0J9oqltgq8leR9IF7zUiv6/KqKU6fq3ZfKpCtAL3AFR2Qn177UeB
         hqFCu2odh4JBGekpaiuaDB5q9eBtJto7Fs63PkhqbsovB+SM9MlftFVp3sfPlhdBXBi0
         ZRLNIALqXyoUPH3L77souwKLFYtPQWld8WsrsyjBQpQLh+8QDKz7AyHAkn8qEbKek2v1
         YgMtYNGKeS/1mvufHJ44PVD3hHMJrfyON+IQcfbgLp09cZKARgxeJOlxYuMkMcvfrkcd
         FwRLEtl9biQH0w/dyFORD1011R09XgSpbLI7H800uasX4uN3Or2rswMpPQWv7j5EEbGZ
         DV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBP3GqB96CR1WwszQqwaeSUiZ93i3xEkGgg+ElmkX3db+bU7gYwb9VDedudGRyV6be5s+ngxBZi+5LQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyD71U8BGh5BFhF6XELTAffQEtLPX4RYohl5EGKryg0SDF6UZbm
	Qc5BS9y565g40WbkRi1JdU9gLjdSnZZS6xscdPWSrmj8EaJhGEi550u4CaQI47rHQQ==
X-Gm-Gg: ATEYQzwL3/31IInLJXppkjEeEgEAoicuIs802F0+jEXgmCWeqaEJNzbdSeReEmU1hLd
	BwjjrDncXcRj3HbiOg3CsFfwiVXU5YrwNn9QHELpHElmVa+Oh93S9OpWiFIQDMRNw2wZu9vc7qS
	WsQaNyJr3SCZ8lk04KLSyuy0h074ZyKVFUAlhQo002ngf3vf+XywcTdd7nGFiDif2tdW41P+hDO
	e2x+lmEYXUN5uavxifPeRYf/I803FNJXqUIYjcl/vV7AsGe8E3/HClEpj0mBp31FHzE55GndZqO
	q+ZWGNSk8iTyxcxbeoskqoWe2daQAukTkBOxa4J4fZbyJEps6HkfgFxJHk2f32Vl6DqtHZRukLm
	6ha7tK58MUOLl2QQfJEKrExbO7DnG9Mj8x/PhUr0/3tFNbeKmTiYN8F3yMS9xB97DBeE9dJrlk1
	OGYkf/SApVy4sKSx/iKCcXjWgnbYX1bQv0Ug2y4QGwELpl5NEuWOOmGmip7khd7TYXimqkWN/4A
	X8k7GSe
X-Received: by 2002:a17:903:2349:b0:2a0:d454:5372 with SMTP id d9443c01a7336-2aea1f2f79emr17542375ad.22.1773113144386;
        Mon, 09 Mar 2026 20:25:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:43 -0700 (PDT)
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
Subject: [PATCH RESEND 1/4] drm/prime: Limit scatter list size with dedicated DMA device
Date: Tue, 10 Mar 2026 11:25:06 +0800
Message-ID: <20260310032511.2545500-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310032511.2545500-1-wenst@chromium.org>
References: <20260310032511.2545500-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a dedicated DMA device is specified for the DRM device, then the
scatter list size limit should pertain to the DMA device.

Use the dedicated DMA device, if given, to limit the scatter list size.
This only applies to drivers that have called drm_dev_set_dma_dev() and
are using drm_prime_pages_to_sg() either directly or through the SHMEM
helpers. At the time of this writing, the former case only includes the
Rockchip DRM driver, while the latter case includes the gud, udl, and
the tiny appletbdrm and gm12u320 drivers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 51fdb06d3e9f..9b44c78cd77f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -859,7 +859,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	if (dev)
-		max_segment = dma_max_mapping_size(dev->dev);
+		max_segment = dma_max_mapping_size(drm_dev_dma_dev(dev));
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
 	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
-- 
2.53.0.473.g4a7958ca14-goog

