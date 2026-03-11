Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963353C5DC3
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240038; cv=none; b=QEyDz75FVEFc8W+zOSOUwWD8C5HokcVVH5YxwJGHPvFmaRkQXEzgNI0mzNxsMtqOX8Sv82bbs0VUaKQTAtURsdQv8ac38zepX80tzgmmdZBeyG+uH02wmW0pdFxlGBApBae8MR+KiQcpKFcP8PYwu/H6UPQoMl429XlDOJHKkn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240038; c=relaxed/simple;
	bh=nzYLErF+rKuMbmIvpwK9XSY2PctEWxTOicG7WCugCiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPOmbE3xxRjRlKPbjo+nJ/Bofwtaa+oSTZsY/d8c35F7JbnwSoZs9jh7WGJInfYvg5oNuYLwmrk1cem6DgZ+T6XkYItFUF09cPLFMJSPCScsy/qJCn4cHefptLHpwkrDFr0Xt7mxr3wFTUyF/Jx8OdoTMB7IlI212RTl1olumFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SDIuy/ap; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SDIuy/ap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773240027;
	bh=nzYLErF+rKuMbmIvpwK9XSY2PctEWxTOicG7WCugCiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SDIuy/ap7S/UwJ70JlObrZN6gJfPs8RCSCsxRB7u0IniF1h5BADbzh6Xe686Pt/+w
	 Q6u6uTvVebjTTWQGIXqowvmlwh9GNxynAFzfFDhuVFoRxuWD+oKHTqjaMUEV4qY6Tk
	 6uV0goOoAKCIDFzmmZ3uNXOi6TwvJKZCSkCyT6XHEwfIEop5KxE0Yq0rABA9gFms5U
	 OhTHw8IC1RhqxmWtLzrRwZNMiMXlb6oCp3U+CzctvHKG8ngUcshgZQDdIxiVNfPS2U
	 RSOAYdqdB6q9kgk35yyyySS/siNOIRCQD1uhDr3vck4HBGfyC88MFPMWMZ3lw/xSoq
	 p0lTGOfSfzwAw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18C7317E0EAC;
	Wed, 11 Mar 2026 15:40:27 +0100 (CET)
Message-ID: <6dc969eb-0dfa-4ab9-ae39-13c4bef90704@collabora.com>
Date: Wed, 11 Mar 2026 15:40:26 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/mediatek: Set dedicated DMA device and drop
 custom GEM callbacks
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
 <20260311094929.3393338-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260311094929.3393338-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/03/26 10:49, Chen-Yu Tsai ha scritto:
> In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
> use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
> drm_gem_dma_object, but custom callbacks were still needed to deal with
> using the first device of the pipeline as the DMA device, instead of
> the MMSYS device that the DRM driver binds to.
> 
> Turns out there is already partial support for dedicated DMA devices in
> the DRM subsystem for PRIME imports. The preceding patches add support
> for dedicated DMA devices to the GEM DMA helpers.
> 
> This allows us to just set the dedicated DMA device for the DRM device,
> and drop all the custom GEM callbacks. Also drop the .dma_dev field
> from the driver private data as it is no longer needed.
> 
> There are slight differences in the mmap helper: the VM_DONTDUMP and
> VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
> VM_IO probably doesn't make sense since the buffer is allocated using
> dma_alloc_attrs().
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Aaaaah you're removing all my code! :-P

...but it's so pleasant to see that. Brilliant cleanup. Kudos!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


