Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633843C5DC3
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 14:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240039; cv=none; b=mBORylc9U8fGHeDLwmrlLzzWxrkvj8r7LdZuPqZscTgJAOiLas1efyaL+ZWa0pDvH9K2lkIIbWMK7/CZZnZZ1n9xDvQd9K4XjAQn3r4sbsQUEq6YbGsAInFEyMTKAUsIM9tGnz/nsWzUX9TMdD5HQoz73vQpY9Jrrsi8UFIquzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240039; c=relaxed/simple;
	bh=EekSZLy6YP8Ncof+v9UOx5ImSQYENZkwGhIqc48E0EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYIgOSidw4V1nNQR79jpwopZNvAB7HNS0P+M3fyjKIejRdejUtZHCFXhhKBbD2Fd40BeJEvDybBBQPhjvsDpDOxCrGAeT6ell8EbfCRnk9LZ0RsRFNTjlhVQkNH2Y/jPXjUgkRhlIamnwCtxaAXWA15qh2eBelhe5SpQS/CcNBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HHm/RvA0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HHm/RvA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773240031;
	bh=EekSZLy6YP8Ncof+v9UOx5ImSQYENZkwGhIqc48E0EQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HHm/RvA0k+wuRqG5eVqAq6vTr3EYEyG1/AVKoth99YHN9DYkQGkFLRIUpRCve5fJu
	 qgKC7fIh0VJfeRlsUFZ8JciREDTXgX/hLriuusk46yl/6813q2FNsVkGH27miFCVjN
	 Kkp411oeQ6Zr+fu+h8B82wMXlvt7RSpE237QkbMaUkZsyxpFvT4THrnQH7Dsoz+rEs
	 mQzlDAz9c/4GrudO+9eOQoMLebe4hKRCfICWF4NLvWY5At6ilQkPxX2Y/M9h+X8OrY
	 DfC3gkBLvoc0YwFyv0C6QCAoohHVhahbyfgP3nImn07s4JALYHXrU8acHiR9X7FNXG
	 s371L6bUbYthQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D120717E0FA3;
	Wed, 11 Mar 2026 15:40:30 +0100 (CET)
Message-ID: <68d3d2f0-c356-4a27-bc96-c4f1ac25b756@collabora.com>
Date: Wed, 11 Mar 2026 15:40:30 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/gem-dma: Support dedicated DMA device for
 allocation and mapping
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311094929.3393338-1-wenst@chromium.org>
 <20260311094929.3393338-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260311094929.3393338-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/03/26 10:49, Chen-Yu Tsai ha scritto:
> Support for a dedicated DMA device for prime imports was added in commit
> 143ec8d3f939 ("drm/prime: Support dedicated DMA device for dma-buf imports").
> This allowed the DRM driver to provide a dedicated DMA device when its
> own underlying device was not capable of DMA, for example when it is a
> USB device (the original target) or a virtual device. The latter case is
> common on embedded SoCs, on which the display pipeline is composed of
> various fixed function blocks, and the DRM device is simply a made-up
> device, an address space managing the routing between the blocks, or
> whichever block the implementor thought made sense at the time. The
> point is that the chosen device is often not the actual device doing
> the DMA. Various drivers have used workarounds or reimplemented the
> GEM DMA helpers to get the DMA addresses and IOMMUs to work correctly.
> 
> Add support for the dedicated DMA device to the GEM DMA helpers.
> 
> No existing driver currently uses the GEM DMA helpers and calls
> drm_dev_set_dma_dev() to set a dedicated DMA device, so no existing
> users should be affected.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


