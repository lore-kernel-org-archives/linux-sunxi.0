Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42DD3C4546;
	Thu, 20 Aug 2026 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221237; cv=none; b=XD/5FKmw4z8E2I67qGT4eRta7M4OKFxlmNasRtGZSn1s7Qm1DNSOVF6mBPGDIYr+2h9GtWkdZpBKIFfHeQUHWO94/TCTtQXX1U/YCIinp3HwC4tf2AV9rH448YQHXQpS2G1OJYEwruiBSddlp8wmKXf+0/j2bgNyHAM8RSoNjZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221237; c=relaxed/simple;
	bh=QR+tyN76RLKZZyKv2RNehMgmdEnDTJNpTFaJEkQ/iPM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=nWjb8CBXAnThTzEMiFrGshGSW4nGSYNkT1d2pysVYzM0bRH5yjsS6FIkeAI7n2Y/FHAewrndshnqQxjQFP1Vpwqu2mL9tiduadsBYlKNuCp8L7Rj864u3U5ayiy/szHFRJirE37LJRMB1qnzD3bCNiYlyUQB0QRKWgDTaPPWX3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHAHjyZt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHAHjyZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B66C1F000E9;
	Thu, 20 Aug 2026 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221230;
	bh=U3yivdMwt6Gg2HYaKSnwIc0VL2gtJGzznDItKCo5jGg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=fHAHjyZtyyp0qu5upaGuQ2c7JO9vEOO+eBRCR3+jpa4/VLaDTgxK0cnLzG37eunvY
	 bsU4ehZseKSkvFyjDYqcUmilm6LuKtBcMS+b2ErzVjYDkd2cc/pWiuzbqFezEWlaq3
	 WrlLDWzuu+FEgLX7BDP/J6S0peGYrjf3LSjuAZyZvZvGwKbP+hE8beihfXDeRrZBDV
	 YLdwX7Jc/oWFiSMfgky+wCHSF1I7UhQSkqTvD9o+MWdKG8fQKV/FlS1JqzN6tCirqe
	 7bdfZ9T2VUTb8/4ngpUBf5YIH9EGQx7YbpKf8Z9Tb04icA2oeddNQoBAeQoKmyU4YQ
	 OqkyAem+wzjGg==
Message-ID: <689199296dc533b3088bc6f40312d066@kernel.org>
Date: Thu, 20 Aug 2026 10:20:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 69/69] drm/connector: Drop redundant max_bpc field
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-69-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-69-294364b2cf15@collabora.com>
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

On Fri, 31 Jul 2026 19:20:16 +0300, Cristian Ciocaltea wrote:
> Now that all users migrated to the new drmm_connector_hdmi_init()
> signature, max_bpc is provided through struct drm_connector_hdmi_funcs,
> a reference to which is already stored in drm_connector_hdmi.
> 
> Drop the redundant connector->max_bpc field and point its users to
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
