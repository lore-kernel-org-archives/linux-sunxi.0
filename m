Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D17E3B8920
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 03:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773112843; cv=none; b=r2CH8Cn5Uggm7s95S0/VCTQzPDC3e4guMWgBpt+k5YruwtnJJBn3tXf4200p4iCl6/6bef1UEX9tnqhGU6Dmbx8fUz49VeBJc/pADfxHjctT6PKfZIZzPdeFvNH22+6VlVu1baGabEbvG4iT61OuGaaFosu/30RFr3jqNUCoTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773112843; c=relaxed/simple;
	bh=oAfrAdUsiN0HiFEo2w26stnO59aZMIB4kMYEsBwkc3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScpfurvvYIrE94oYU+9NeR8QO/4AdxvGzHuwSlrXugIwwPe/JQnE+I5q42UNt0bmFe3tzHMYLJPro+AIryfp31ND/QwTFjMSFrQhGMy0Q6cKwqgL8GOnMm6QEnK4ZqpmgxN0Ix9xkpOf9XaGZdLp/GWoRMFYvquXq3A90wvYuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z76seK1M; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z76seK1M"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35980423087so4498967a91.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 20:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773112841; x=1773717641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=;
        b=Z76seK1MoKN/5zH0+Om6b0f6YR02QkFnIez/Ml+PtLcZpdlCyGuGu1PRkwBkYNkQXw
         BE95ZUDgGEP83YmXbx8iBh4AZe/WYsQe3tmhce/EpF6ji/PoY4WHmzpgr4kF30BY1mL4
         H16c7lvf18yyGfPvjmdlQG72YTTMP7YSGZAiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773112841; x=1773717641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=;
        b=mM83dqYw5K95HV/t2bzhlsXjpdXbCMZm0E1hzALwfh6Tt7OcaF29YjavrtHMVe2Vzk
         kdtCHZ/vVzR4rN9rsEPtFP2/eG8OtSw9NUmvjbx7s1/nZZwYAEMPHX+mQXf0DmoP71SR
         AaMBUm6XoCqwrh8D7vjeqQ40XUm3YuEIE+Nv7EmJ70smBIrdjdMxJX0fgQsgQegyFSmh
         JMm197OEmsmUn8dlqhj/8MkhMDDBvrN8LDUIbDOCt0hUHKCgkM5VPE3yCAOe4G/rDaJB
         805SU5FMhAXjgjQdalK3yDWnMaxpJYOgWU5hy57rzKceBrs4MgrEZN8ctb0gilRIgLHP
         sHWw==
X-Forwarded-Encrypted: i=1; AJvYcCW9nledDmcrE/BxlG24lPRMx8JS/4f10kyE1hVdLoR5dcsJt2d1huz1HXm5gfKlztzukwcbiUJz/2Utng==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDsznTXfPmUMM4k3jCsARtj8bFwQJVAFOp8o/WrBL0aMJpuwin
	oUnlNFc+WXYkD+ZaOZjq0fyiyjtLFgMc0BwUz/qgtwv7nvLMOFMFq4MIbtPJe/joUg==
X-Gm-Gg: ATEYQzxfpCNhikQE/X7QPjG1y6u5g6/BqkMulpvbSYStWoyNGkzy6qwjxv7uVTlONIn
	YfuqdFfigY/5mjF1CcN1FZr1Ajo3iKzxDYKv+Y0xOKx31idWwuDq4PF/ghB9Ue4QRqlygag6ZNo
	LZa2bY9HBXcNj3Ggppary/aM35Uqr7CJku2ucus7euXbdMobHWhRqd6NOw6LosI0STzKfqKDUK4
	oztc3fH31SM7MWrVeNfLvoYgTbt2Zf4eYeJw1Zbf8cci5yCV1XckUdWOpLVtMeINPtKZygTfEc7
	rFOAW3a5hvPdO3x7Xupf8fwTdnfQXtnajEbqkaFte9Aa3ycG7up030JCXjC5ZZMt0p/rWJdkmGv
	n4JwdQ3r3E2XaXux4FZRBL5uY4Awu32T7Y/yEiUqfYHu906aVhLFFqG38tB6lGes47fq8aEtsYu
	nNWlFnnnAIS43B0J20/rpZAfWvA4GwRM7+49BorvzAPOA2kqec4kehtFCn+XCh2HwXojbTchGjc
	oPJv5YT
X-Received: by 2002:a17:90b:240e:b0:359:c7ef:97bc with SMTP id 98e67ed59e1d1-359c7ef9b32mr6509980a91.22.1773112840798;
        Mon, 09 Mar 2026 20:20:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f79absm1154608a91.6.2026.03.09.20.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:20:40 -0700 (PDT)
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
Subject: [PATCH 1/4] drm/prime: Limit scatter list size with dedicated DMA device
Date: Tue, 10 Mar 2026 11:20:04 +0800
Message-ID: <20260310032012.2542334-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310032012.2542334-1-wenst@chromium.org>
References: <20260310032012.2542334-1-wenst@chromium.org>
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

