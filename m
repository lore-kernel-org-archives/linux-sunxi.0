Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AAC3C5543
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240041; cv=none; b=qvnabsILV8bX6XrpTfJD9qHeB9mqVa+eK4GMtZ0VVMlpG6TIsIPTy3nmT+KHp9mY692xLV4aGfvKeQmDt1veT/Q9Rsroh2kTgrlwhOyoZOkQIRw4RMHmU1unWDJyA+Fu4oBdhixbRgehZHPOZ0TvCB6QxGYO0pazoNpB2GWrRzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240041; c=relaxed/simple;
	bh=q5ScAZDEKF2VEyUynEqfPeutGbzwz5gnnQbsnc+Tk30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKhcsBnp5KeKBFl/T5YCH6RcxeDxb5ELTNDNpC0ojRvf6zo4RVIfakBX+t5APxHGetpVitCO0z2NzSAqSZOmMfPaL+mLOzj6sv/1ck/SBZ7Bq7Tz315dHPYbm9KIPjxiUMdJeD13Bgvn9rDjoGbju+jDXCxjvQ4/HkwSPWUrdc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bU7krmzx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bU7krmzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773240033;
	bh=q5ScAZDEKF2VEyUynEqfPeutGbzwz5gnnQbsnc+Tk30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bU7krmzx5llznTGLf+9qLLITgGJVOK/Kk/xFq1ONmp8RI8P2aQk9OP2mdUkUD04HZ
	 AqF4MlOKAXKRAWcim76VH5CrcMy+/vt6ywj1DOhFVqHXDdLPy64lSKm314/s9Y31wn
	 DBotw3nfaUIysFHS32T/7djBu+3BqLaFXhemwY4SttgHJuP7DXQICCf0TfIKQjC+cZ
	 wIfRX5Dy84X6J+hkZ2kPyxfL5hjKXBODNR7Gtm19uh3cbwbIZGKIhd87muP6zkyQ28
	 mV2UEq83BJutaH8+aZOXFFyrctP1P15HZ+dMM7sZFIm61hS6gY3Q/SG6FqgyFWuk1q
	 rJVgK9Eq4dwgw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B1D5617E1005;
	Wed, 11 Mar 2026 15:40:32 +0100 (CET)
Message-ID: <6d8d846b-f140-4294-aa2f-8fda230e0e18@collabora.com>
Date: Wed, 11 Mar 2026 15:40:32 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/prime: Limit scatter list size with dedicated
 DMA device
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
 <20260311094929.3393338-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260311094929.3393338-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/03/26 10:49, Chen-Yu Tsai ha scritto:
> If a dedicated DMA device is specified for the DRM device, then the
> scatter list size limit should pertain to the DMA device.
> 
> Use the dedicated DMA device, if given, to limit the scatter list size.
> This only applies to drivers that have called drm_dev_set_dma_dev() and
> are using drm_prime_pages_to_sg() either directly or through the SHMEM
> helpers. At the time of this writing, the former case only includes the
> Rockchip DRM driver, while the latter case includes the gud, udl, and
> the tiny appletbdrm and gm12u320 drivers.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

