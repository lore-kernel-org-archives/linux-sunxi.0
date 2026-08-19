Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62A244E679;
	Wed, 19 Aug 2026 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133247; cv=none; b=QK8P2e8zPf5+EBpk3lFXu7hUZioxNWccx7cheE9Hswid4NXqcPHhY293HNUI1qMCuTI8SDuyPdvFJfYulz8eyg2uqHJ0xKJ8JheIsdgYIWUQ5eIxwQwDxp/uRUijpJ4UzZzvrm7yJ6LDQk4mtirmKIhXymqELGlbcb6+t5Pwwxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133247; c=relaxed/simple;
	bh=3aRyeSia7VOHOOQcof6Kpr+6zIHCxZx7NTXSbGvVDOA=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=BOpBCMb1EuI0psFuRk1qB3b06uHboYVc/CoohlobozdW3I/QqNqroGHQj9zUXqTDQwR0gwiQj5IRdU8BKxonOWUKfKfoF+H3vprou2a5vKxvSg0q5eRTSu6H1qq+aBcXYgMkiEdGxJgV75EjQQ6E8l96Bp9qz+sROTyuFg60+1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2hhq5Ok; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2hhq5Ok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1DB1F00A3A;
	Wed, 19 Aug 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787133237;
	bh=bsPdTqWQt9EZk/eeiAqslxNuDLvoJkFFPkauf4L5tk0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=c2hhq5OkjEM2LNDasG7lPfDRbVfEJif6bxj67WGTbBdHTiadFvQQXoA2fQ0neQT6T
	 4i5qwwO0M9gG5noky+pLzjJ93ar/MwHRTZ0J2iGINErNFH1lQr0HSSY+MMCU4b5+W5
	 X12t7N33ycJ8qV3O5EhF9sN5cOPySXovsWtlKicQBWqFuFCaEsqRoxhjGzdcnvY6gq
	 CGsVIjkg/lmiPfMXBLXuJfYj9oKu/2dLY2SS0uUuCVXOVzUETXpzCusGzY25FuSk2+
	 3r17g6OhrO1AYrp0AqLmj0qDB1TiEtpINzpHbzc/ZNy0GMIKj7fi3mnIw4iE4NsQ7Q
	 TFhoDui7dzr+Q==
Message-ID: <f969e994fa74d4e376c6c8f4a705c7ef@kernel.org>
Date: Wed, 19 Aug 2026 09:53:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 06/69] drm/probe-helper: Introduce .force_ctx()
 connector callback
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-6-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-6-294364b2cf15@collabora.com>
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

On Fri, 31 Jul 2026 19:19:13 +0300, Cristian Ciocaltea wrote:
> The .force() connector callback is invoked by
> drm_helper_probe_single_connector_modes() while the modeset acquire
> context it created is live, but the hook signature provides no way to
> pass it down, e.g. to support implementations needing to lock further
> objects.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
