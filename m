Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582023F329A;
	Wed, 19 Aug 2026 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134014; cv=none; b=CzuY2iHzCUFDQsN/Py7b3em8N/xDf1xeqgLm5Qm+/oKWsU18liE4yPpoSmsppUJk4Ko7m07b7MmYqrnXFbPlWAfqHqGCAwGe+JwoO7MfJ5GOkLYFkgSdpuJNF5JZUrXZBESqKWegN44HXNVbXBbKWssNJ865ZMWD+15MyK9oKdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134014; c=relaxed/simple;
	bh=zwJGRxRjd1dopL5dVdpi+lztfY6U4JJ9hfXkTxbL1qU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=C91/BHlKPq0VmIzylGOSJTSq8epIzDVv8M64eAoqA931oAFbeeGXfMh/5+NtqajMQoba7En3gxYiSDVDUIXE0Y7SNwbz6dkCFu3jcUMH3cLHXGRJLPh6M+m5oCp02OeNjKba1bJ9TgwSfipi0d5mf+JzbgpoqathakZ/YEGRAx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAQdG2Yp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAQdG2Yp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C8A1F000E9;
	Wed, 19 Aug 2026 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787134013;
	bh=1WYn3c161YZqw3fFtuIGc8EghhdEQghHW6rnKSB7sxc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=gAQdG2YpwkhluiX/Prxa6DtqdZ8Kq6BX4zzVJ5JwnkS+vXEYDgukALQ6n3LzOEk36
	 SLeeO0Zf07FOF84TyXbP6vMtDCn4uP7J4lpJgYbLP88vGT6lSG2piv1G+hsAWtR3f2
	 b7dM9nfIUrL7yT5vt0cBDVA8EZxyloS25XCYNJLBLkc3HbnTfnQ3V1js1Gj8MGp+WI
	 Q/gUiJGbcZNsuKkCskKZN1UW3gsn7pXc/32zgvy009ULGSpcFvRTf3J/mKwW8I+9YE
	 Zlt/tcvrqJ6vjT/TqRmd2cCBHdbsLnGgG+6OCex47bGseObwKyrvccANBOpc4gmgYB
	 QbBJxgeYj/IiQ==
Message-ID: <9a87ecb22b23e51d3b755d8591bbd0f9@kernel.org>
Date: Wed, 19 Aug 2026 10:06:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 05/69] drm/display: bridge_connector: Convert to
 drmm_connector_hdmi_init()
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-5-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-5-294364b2cf15@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maud Spierings" <maud_spierings@hotmail.com>, "Maxime
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

On Fri, 31 Jul 2026 19:19:12 +0300, Cristian Ciocaltea wrote:
> Switch drm_bridge_connector to the new drmm_connector_hdmi_init()
> signature.  The vendor, product, supported_formats and max_bpc values
> now live in struct drm_connector_hdmi_funcs instead of being passed as
> separate arguments.  This allows future HDMI 2.x capabilities to be
> plumbed without growing the function's argument list.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
