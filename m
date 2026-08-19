Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBD8393DDB;
	Wed, 19 Aug 2026 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134118; cv=none; b=O2rqMwfW8B8OYZgp/0AOm3s/5g1kJ4UOLly10Cm/4Sorf1TCeJS3HKjZ1lsw/qY8bkrnDWZoQND5pVZ8T8KZyuqCkmVGZyI1f5KbhZi1mKYlqLRxf7ukS4QK+LsVbpgoVZ1lwuodunACTCmR442wiQE9oO8ZL4JCua28ogrlUr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134118; c=relaxed/simple;
	bh=K8U4P3bhmffz22Rd5sHe4yPZDRpds8gVrQKF62Pd9WQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=sVnSRQfeQaB21zIzUMrYH0e4X+iUhmK6Ifz84ihvzc7Fo1RD6p6t6QNXvOiNuC8rlXKd5XXS2jdsBNWlvmEiWZpAo4EunLX5Tcc3By9Y9Al7xoaY8yrfGJ+Ts7D90ZO2a2+82y7FfFTfxsIggjuQdDk7rKcEMjTy1pvXR8HIu7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIpfgmPF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIpfgmPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A2A1F000E9;
	Wed, 19 Aug 2026 10:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787134116;
	bh=8E1PsAOid5BC49DUgScuCeyJ/f6f5M/DlBTmbHrfJBI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=SIpfgmPFx0wpnKMwYIN+TgBcluBvATybKJErBVXdVRHD32SBb4BS3af8Nux7rFOJI
	 ocYTzhXFo6NJ3waRrd4K01LSXw21OABan6kd9N5WacixRwZ7ahLoofvG09bN6GQsY6
	 GqwveJCdVM+OoCjs9VabP9aOR/G53j9O/3J9aPxv89JtyHCgd4AjYubML4l6TgoFa+
	 /zywxYQWPVqdnz+RWy9hcvVN8YwMurRsVnpKheCjUj0uXcbKT2ZBbfV7D21gTCqkhl
	 +Amihg67Vby4VEFRHC/9SQpSk61oi5XOmMxspaTeyzHKzlvgHC/OGYGjEsVzRlIUqX
	 87OYYlkV6NZqg==
Message-ID: <7bcef767a1e204ab879ea0b3fdc54cd0@kernel.org>
Date: Wed, 19 Aug 2026 10:08:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 04/69] drm/connector: Add drmm_connector_hdmi_init()
 with new signature
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-4-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-4-294364b2cf15@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Phong
 LE" <ple@baylibre.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 31 Jul 2026 19:19:11 +0300, Cristian Ciocaltea wrote:
> In preparation for providing HDMI 2.x source capabilities, move the
> vendor, product, supported_formats and max_bpc parameters out of the
> init function into struct drm_connector_hdmi_funcs, and add new
> supported_hdmi_ver and supported_tmds_char_rate fields there as well.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
