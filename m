Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F83955D8;
	Thu, 13 Aug 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627698; cv=none; b=KP3KF9Z+XkTC5zB0hn06OIBgYV1OL6xRE0F21nRN0bEgGIvULzFtVqXmZhn04dEIKfkL2jTHZCsJPaVoP+I0sz427NFpvQU4HZjM6LelD4pejUAqp+ZtUUXUSJLS2Sd+0drr1BW5rogmjX/tqFtAH+ZBFDytatAwY+vz5T6GZgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627698; c=relaxed/simple;
	bh=t33iBUcgiZ5Jqcdd+ePdZsqa4eck9LeC+QKWs1HeI7U=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=CblAdEQKj0sLhxOOwuLc3bNoTrtDZbe+oxTatRryfYM8EwUVE2zwLrHfbQhxQv5rzgKgf027uk+wNWJr0KS4lC42jprOlp5HybE8gfcx+0j7fzLaTdpjI0e4bcurer05IVv2+HO2/if0FU+poa6cU3ZBowLBoqyC++EP3r9ZIDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLLR93bR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLLR93bR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9081F000E9;
	Thu, 13 Aug 2026 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786627696;
	bh=HFLGRf1OptuEnjBGG4ZtLeQrN6SrGXqYJaR5S/NF7lI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=TLLR93bRjaY/MLZEpaYZ0/OQdva+N0w2HAG4QFzVLlxgq4MBj3w7aEIUPsDq0lPLD
	 tiBX7x7GEuZDrqP4kvSh6Ycs4SCjtBqNK45xM/dMvRqVCok6WaTJaybpmqTpw/hv35
	 t/6d479+w3DiLTFxMfSJEFVTe1U+G5UFXNNTt3AlrFnpkP+QCnN9fYL4NGoRxpdDFJ
	 2u0IzblPbr9el0PcsFezPrChpy2bNiUfICSPHbDOuSgidIOidFa+jIaSaIHmr0ua2T
	 GIuKYd+rXgXACi4jhG83yyOL/yn6mSAxzHABlzG7nidDoWftAHW1oqkJTj2hTlV9+B
	 yT0v3tRBQy9Qw==
Message-ID: <13e95609da0a43f874381b248e8a7404@kernel.org>
Date: Thu, 13 Aug 2026 13:28:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 42/69] drm/vc4: hdmi: Switch to .force_ctx()
 connector helper
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-42-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-42-294364b2cf15@collabora.com>
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

On Fri, 31 Jul 2026 19:19:49 +0300, Cristian Ciocaltea wrote:
> Use drm_atomic_helper_connector_hdmi_force_ctx() as the .force_ctx()
> implementation, so that the acquire context created by the probe helper
> reaches the HDMI connector framework.
> 
> This is a prerequisite for converting the driver to the common HDMI 2.0
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
