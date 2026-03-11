Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D793B3884
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222599; cv=none; b=rMeILLzuUN9cp4KlgOHpkLz2HN3VuAgUm9r+gzK+lsA6l7E/8MFxf2q6DdNKNEDESiZJaESR2pKOsTaEEIJOvShlk4my3i6YDuaH7cTBF3qs0rYm8cNDUU40/iZOytEXTdKskD6QhJfe61NsVJsNhSVG6vzndpYzxZnob/R3brk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222599; c=relaxed/simple;
	bh=PTu8avjQH0uE2z2RBz4QfV8RqQGcOxGaplS8ZRyvoqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVliDlgCnOuj/oxQnwZHDNgoOX2jiNx0MQhKGwEXziPLGSRZALRBt7QvhcdJf9fFFZ2L+zAqF7z3X0KxZpji+PljiBYUXg042cWGuNuTcNuY29jnInTcaz/PgWOf6ocOBQVzbPSQCQ90tW/5aQQnLlEA96AzmlZww+VaAa44yQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OhErwQeZ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OhErwQeZ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c7384f5a9cdso2931633a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222597; x=1773827397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT7ZzcC3UQ69KoSxqnkGn97mAkV5xCuC7gmeayRSfVQ=;
        b=OhErwQeZnzx3fSRoZYrL66WX7JX1Uvd4/AQoX4Ej2DI0h7GWqDrPBXQIiGVz2Ctft6
         gbMkUtV2FobTf6imAtY+hvvyRa4s1kM56HX5rS0ggYNYZKfeFPh6YhI5qJju8mgN/mbx
         YD7zDm3EFobHRHLQt6493lSWoAKld5CaE8DtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222597; x=1773827397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VT7ZzcC3UQ69KoSxqnkGn97mAkV5xCuC7gmeayRSfVQ=;
        b=iGJS3ZqLIuuvu+7PQllVvncgaJnNDVkmGHVSexXqrpnEZX7ohNmnkD2M6SgCsoMgH9
         K5kEjCcs2lfg+LuN1H1Uu2O/494epePY3fqxTCwZn1PZPH3xJXF6dU6UaWzjwrMAoRB+
         ERaOADan96ZEJIFmxiPDKYBFHRnqg8LA+e5L2h0MYv3uZj9v9h2s4zJrFUKjNcNvPJPe
         AXXAxy9Yxq7hGmbYmvUyAFsAIQPT6iyefXB3YC/HNj8OdWtNCcjrtbzDDkvBjWFKjUVa
         3cASdSgWUchX25XiKCczoBhjqmcaD/QKpUOdu4UtYRYAlB4axuHhF/0pqBmwFdicthZ5
         I50g==
X-Forwarded-Encrypted: i=1; AJvYcCX0fQQ7gT5mG9zFa56p/UjJP7RjfK13Um4LLO/jzpk8qqtAbYn1snjyAEskwClnBBVu4HKZeYa9CqK7QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3hlVR33r4xREM3iKyW+m8vRB+YrG5ICPVfr6dhyUtUS+OYp41
	WZ4z1jFMvjrJ8NZ7Iwmny1MCdJU+YoqEvaFbjhbPmK4Z9yl0ooXIW4we79WE0mP+HA==
X-Gm-Gg: ATEYQzwoIebuKZxmVYRt3zGBm90LEr9Um1iJdKD4SogRLKFaY85ThZzuy8ZJMFIyD1b
	wGF4jAcbVXa+i6zrOyGK89rN7yKDEbShtEwpaCMJtWzgYCm7h5pu7f9FKP2FCZrkXm5fWogzx4c
	qeDEhfJbCysUxDzUH1fH+Zyp0A5ho3/oiK1k4BOjKKtCHTIIenV8vPQeTKQIC0TneOo/1t8+DwA
	99ip3rrWBtgD9D2WLiT05pK/HpkYf30ilZ/o/TlKpcJWEBRDslDtbifHvrdOpi1LDhmanvvepvJ
	B9c3CpEuAXJ4qMctaNp3PxQHLu9TZngC/QqtRAIF+sfJ2FT5OsgkT2Ue17v0Y4fCniArM7amGQ6
	c9jWQ6jQocXpvu9alY2t7njzbKqCengz6PLYSMrzRqb8tzOBlxeMVxColvkNz/ZOfTQ5UiY2487
	xt3NNK+HrKDSbM9yUpKOajgX0jfk76scq3CZ2ZKSu5hGBFdwjPUkjMmplfw52g6dbOo+wb3a6Q/
	+WrYEXkDTO7WQYYXGE=
X-Received: by 2002:a05:6a21:6e0c:b0:389:8f3f:50ce with SMTP id adf61e73a8af0-398c612795emr1755090637.56.1773222597656;
        Wed, 11 Mar 2026 02:49:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:49:56 -0700 (PDT)
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
Subject: [PATCH v2 1/4] drm/prime: Limit scatter list size with dedicated DMA device
Date: Wed, 11 Mar 2026 17:49:25 +0800
Message-ID: <20260311094929.3393338-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

