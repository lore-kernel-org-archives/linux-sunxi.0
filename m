Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C2435A8F
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510210; cv=none; b=cGozsoXRvHrvG67i1vuHYrE2nTuPmYsnwKxyKUqomsvlx4qnYmBP7ZHvSISVVXZU7TP9nUX6Y276z/foRgaWL41Soqx/NWZ3o+w/hQyqcsjhP75B0kvIwteKKAzjxGViYVh2i2rPvXKwOu/Klhee2aNpY62qZW5lZiDInco5dr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510210; c=relaxed/simple;
	bh=vBzFyziUWjliNDDBkuz8H0vizOlAd/t2Tq+tK2gR2BM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qGFFAldN4v8M34J4O6Do9M/+gAGB9jCfQx5EZo4/f3jV92FGHjPT6Q4w6EHhxQS8SDn9xp1IrIRp/6yN31EZ7TlK1diqp8KDhq2YiNo6srsrSLxZN8Bsh60KzNOt43AAwaK5Tk8xXBAQ/ob6XyEwEPnt+HFQu9IWUF9MYF83IaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KvffgtfZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KvffgtfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785510206;
	bh=vBzFyziUWjliNDDBkuz8H0vizOlAd/t2Tq+tK2gR2BM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KvffgtfZ7GSQynVjczrV++EGQQxtV4uoiDJGuk3AQ0LFI6XPb4K/6w+HwqRzfNlNa
	 lJEXFDmZodC6tyToTRWir+A15r0iWmdQEfwie79dYX4ZvExrZlj6D98xIBBVcEoNan
	 n3eAmFhpV8nNx12OnaA1DDw9o0+l/Jw8wFUCusnNQw5xw0SvMukqlWSKXnO54DK666
	 jfZ1dR5Gor1XSAG4Ug8nWL7MkUOVGXhY4PhgqfvKjvRy50sJwOU8u/kZUxZYjfuNmC
	 m6GhCMfscAqMGlVRsBYWbIK+KoRipoIs3zsV3Q+DgccaB5i9RWWCBVKivo98JpT91z
	 VBqWYYewwHWaA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C0B317E063E;
	Fri, 31 Jul 2026 17:03:25 +0200 (CEST)
Message-ID: <fa854383-a53a-410d-8b0e-554f70b918ac@collabora.com>
Date: Fri, 31 Jul 2026 18:03:24 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/61] drm/connector: Add drmm_connector_hdmi_init()
 with new signature
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-3-4fb12ea22ac9@collabora.com>
 <exkyukl6jnkwwoap62v4n5j4obyhoks5ysbo7iqjdhzhb2ltsu@nyp7csbmzott>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <exkyukl6jnkwwoap62v4n5j4obyhoks5ysbo7iqjdhzhb2ltsu@nyp7csbmzott>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 7/30/26 5:19 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 23, 2026 at 04:34:52AM +0300, Cristian Ciocaltea wrote:
>> In preparation for providing HDMI 2.x source capabilities, move the
>> vendor, product, supported_formats and max_bpc parameters out of the
>> init function into struct drm_connector_hdmi_funcs, and add new
>> supported_hdmi_ver and supported_tmds_char_rate fields there as well.
> 
> I really don't like the idea of putting data into the functions. The
> data might be mutable, it might depend on the particular platform, etc.
> while funcs are typically static. Even for the drm_bridge case we have
> two separate structures: static funcs and changeable drm_bridge
> instance.
> 
> I'd suggest populating that data in the drm_connector before calling
> drmm_connector_hdmi_init(). The only exception would be vendor / product
> since they use strtomem_pad() to ensure them being properly initialized.
> I'd suggest leaving those two as is.

I don't have a strong preference between the two approaches (functions vs.
connector). Let's wait for Maxime to confirm that he agrees with your
suggestion, so that we can hopefully reach consensus before the final round of
API-related changes.

Meanwhile, I plan to submit v10 addressing several findings reported by Sashiko
and see whether anything else remains outstanding.

Thanks,
Cristian
