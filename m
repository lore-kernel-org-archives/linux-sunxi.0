Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398C63D9DC9;
	Thu, 20 Aug 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220989; cv=none; b=qHzCmRwXQRivwdXUZEQb7NusywM+fRQCsTa4KPuKg7MthONwEZoj0eH4iq5xyflOd5FiM0bAUmzDphjRhG1e+u2DDl78WNVDSuCesLNW0O2AAOtWzZLdsU0MRWg+33ReI8U2lTJyCCUKclVU4wNIcgY9ES7C6eMg5fDieozcULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220989; c=relaxed/simple;
	bh=TeW80l081N5wgaQ7kVXTp/8L0fm7Ol2oMNSwmXYvEgI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=hk34AZA/UeW+02m+Z2twYkIgMwWj3TfvvvKnI3HvtA3+k0qP+LaKBrUoxCSTiXiHjNYNg9+4ewn3fpQC7jOtKdLJ865TLiVc5ydh3iqm5BcGyu0r2UUWWFkPWx3DnmsgNoXgepgZZAqSfqbn/GbC+Lam+yay19/ua6rZVGiLkAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaVpEuwT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaVpEuwT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E961F000E9;
	Thu, 20 Aug 2026 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787220979;
	bh=k/x/Ldk7pJn5hAaYG+4LmXlk3NMFui0TNJgVftohRSo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=jaVpEuwTCkHducIWFaPzemcmRsz9Y6z6HW+eT1ezml7OORLHvBMN8whKTNwRoBhk2
	 0RdQ8QeLhTDxrUtl4zHYcgxcPTc8KaLbUX7YfQcul+paiJYAu5+8CJEcBGeVB4b6er
	 KQ7r0uJD07gjy6oGzxS/yR28+ANd2XRT2UVpckttsrfbEHmlsXsZzA9Tw/3bigaAza
	 VXC5U3q7n/3Ve0HazQi9/N44qlNU43jl/eZSUY/crkISqW2lwCbWYuEagKZ2UOVrOY
	 oKMZ1U3PRJsy5/j/ozutNsMOxgR7BLHdvjVM80n9ZLpqj0sDtcjaAY+mcUgmT0CSFV
	 NQeYPvC0pUK/g==
Message-ID: <9ad943a20de08d78ff7c2133fa4a3e05@kernel.org>
Date: Thu, 20 Aug 2026 10:16:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 46/69] drm/vc4: hdmi: Defer pixel clock validation
 to HDMI helpers
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-46-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-46-294364b2cf15@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert Foss" <rfoss@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Sandy Huang" <hjc@rock-chips.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 31 Jul 2026 19:19:53 +0300, Cristian Ciocaltea wrote:
> drm_atomic_helper_connector_hdmi_check() rejects modes whose computed
> TMDS character rate exceeds the connector limit before invoking the
> driver's .tmds_char_rate_valid() hook.
> 
> BCM2835 is capped at 162 MHz, slightly below the 165 MHz limit of HDMI
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
