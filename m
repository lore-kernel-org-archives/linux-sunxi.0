Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DC823DD
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Mar 2026 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508320; cv=none; b=usiKi7Hd41XE0TqEHfChDDsVHXiMLHby4ieXw398e9xTLS/O/tH+GoI1jAVRpfnUNBOsqegcHCnRqmMiRFNFm77J/fMXilCXem0sWMAfPtQhT5JWPm+BFQjy2GjLfixlq4f5rVOsRYdctMVAeus4mLqJQCIQLWPJq+l5XvFPeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508320; c=relaxed/simple;
	bh=cH8D9Uq/LzYOvZjq25rc85Ook1VAnV3/WpOE5rTOB1k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kJ32at4v4/aqzHTW3n/yVCBTH9r7xMQX0AqOe5QVE7aPzfgg1aSS1f0sUwruc72P+rIjQZoQAooQhXb1Wpi16iJxApyd4m16jX0xcF8FOxNb6PBdMHbKJp6NQzmKzS6C5riUjqAIhuiEIfGIRPx0zCVjCgBIEbYsQqGALY4b32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ek8LkRfE; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ek8LkRfE"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso265397a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774508319; x=1775113119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdEPxGlOLVBGmER9WSTa0ssfO+YRW1Jn+IHrzAWzqJM=;
        b=ek8LkRfEeBwVL208U7OgkIhKBZYwV6k2Z71Wg9VSGABE+4vLPmn46XT6sn0oP75uNe
         xZshy1LWpmEetp011Trr5Lz+0MLVJGkyY/WfaCcFU5cn14l+yqO5iPJIHFIKq+KZK9/f
         c+UYqolZ4uvaPLYxHw7ZSFQJqMZJc88AACzVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774508319; x=1775113119;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SdEPxGlOLVBGmER9WSTa0ssfO+YRW1Jn+IHrzAWzqJM=;
        b=Nk+LPHuQi8hWxrFTSNcEicmDFJn6RDBEwVlS2seC3OAZhHyPSLH5/1m0ewJPLj3nNw
         HWkkHpBI0vWo97n1KDJTP5vf13DjP57nDJH1r7C25y0iHLd7cpT8FBwmyRETUOyzwkrT
         8RrnFGQLAVlEJVwJf5IN/SGA9ZbJGSda4d0kUrURepOUcaFU+GDjJB3zh/Hv2L2Hisvi
         pAotIVm3DptUY16cLBfF+MiSuLGUtHjv6f0fDhhl5NeQ55jSXoTwJeFk2xYfUSyXQUhG
         /lo4v2tB1AuTi1b7Z5lwTxqPdmw3rhGjY4E7UdT33GujtOmr19VBxmVFtdoq9EY4SiwI
         P21g==
X-Gm-Message-State: AOJu0YzXV5Nmr6SoESZjwzyJ/exVu1i9zXkz5hH2K+m5lcdxVSpLWeYn
	Fd9q9E7ZOVcZbt1YbD1mN2bIJlpz6VkWpAOf+kq1DJJGUe895W+b/ST0hG4Ejs056g==
X-Gm-Gg: ATEYQzxZ3JWBs1/nryh4yKT+VYpORyoaPuxLyPkq+Ycnf3k/Jy1EXgpZY76648AGPxD
	479O+M7Y2iDpUz0Muk9Jw7VG2+dcEJG7VlQrQdcKt6zetlEtxCYooIS4gHSHR6JB9z9vm4ewHmd
	vBJwbPIUnzu9zmcDHT86/IEqzqet5IM9v45qDVeCzvrPyEmN3VN6UKbR7/wCbM3brAkGNtCauL0
	BH1WmESfDlDRDrcph6meBjqxYOcszAtMvBhrzm4TQPEwS3+IGP9/oxSzuLclitwvMBil2w69Wry
	PhPqG4Fku/z3oN+RSfprhasxFnbpwzA+tWxAZlzxFr8NKNjFfyRtUcj4AZi7HbbUZgmB5vr1Lj+
	vEDphLRhcUxvHyyiu0LjMfHAC+q3Wf7F9gePwgYWWkHFJ58vS3yKCCUww4yfmIWlVQyA4DABo8i
	v8jSEYAq+jRbk/Rdhx0yd1nGD0GOWudytxBug7w7ejRIUJeMR501p01BhD3xtnlGAYozoSyly9S
	/CFprBw
X-Received: by 2002:a05:6a20:729f:b0:398:7b1d:87ce with SMTP id adf61e73a8af0-39c4ab57c36mr7202940637.20.1774508318941;
        Wed, 25 Mar 2026 23:58:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76736e54e4sm1345254a12.0.2026.03.25.23.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:58:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
Subject: Re: [PATCH v2 0/4] drm/gem-dma: Support dedicated DMA device for
 allocation
Message-Id: <177450831563.1057981.13951871384462146640.b4-ty@chromium.org>
Date: Thu, 26 Mar 2026 14:58:35 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Wed, 11 Mar 2026 17:49:24 +0800, Chen-Yu Tsai wrote:
> This is v2 of my "support dedicated DMA device for allocation and mmap
> in GEM DMA helpers" series.
> 
> Changes since v1:
> - Link to v1: https://lore.kernel.org/all/20260310032511.2545500-1-wenst@chromium.org/
> - Collected tags
> - Removed reference to mtk_gem.c from the Makefile
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/4] drm/prime: Limit scatter list size with dedicated DMA device
      commit: 864279920b2b2c1dd491eba0d0c64764c0c03d9f
[2/4] drm/gem-dma: Support dedicated DMA device for allocation and mapping
      commit: a9da24732aaa80d631bffc8a1390836d4b896690
[3/4] drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
      commit: e21b1a91430d5ff626a35f72951ed80268e26de6
[4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
      commit: 25e90f486f5bc8f606f4263c9d86e2d2b1db4613

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

