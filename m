Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC928506F;
	Wed, 19 Aug 2026 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143073; cv=none; b=qoiexk2IHqF8abF9z0e3EvJ2lgA2IBym9zLCFl+82GqB4EGdWYRTjfH4nudmTrRAm8jKdGHnADUbUtpb/seWfhsBaUNsdrmSGB2Ada3Q1TjJk4hgMAZ7rNUEFg8sMsxSMNQTCAF0lRGsibjEwGY6YTRlnt0RRaEsK9wGuHuIlUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143073; c=relaxed/simple;
	bh=vZZlE0kBXZJ+tK/kPYiQIhjTuvQ+ZjnPkPMrvyRk8Cw=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=XxtS7qcyGSY7m2TzFpsBbpZPudakxM0V0ni9+g0dC1pgLPGM/XUhJyl6PbR8CRCQbehZYlypKwdtYI8LTxQFVzYMV5x9h5LwnzrA7UhhqxE0Bq9PdWqEt6KPUMOKKE0fHQ2KNUT/sTUCdiWD9JsDQ6v5HFRA33KXwHeFjz+ZQvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6INs1Qf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6INs1Qf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEB81F000E9;
	Wed, 19 Aug 2026 12:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143071;
	bh=Y0tJoZ7ZFXTl/tMoaD1TEZl2H8Uq6kgMx3rbwieyM5U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=O6INs1QfspOL+mcZFjses1Bw6NTnyn30eBjytQOVUnC3lv8KvPFc1f5RgXJX5fhd6
	 U5dTPQUIBGTJshfMXxDQbhx7sdJ0mV3ou6FFBjinfJzZ6gorg3XP9211PcPoXp8xik
	 reYg8mlQEm8tq44N5if+hlCEEDPmICIeKuyk8wNPQFJ/ibf4oAdbxke1zVFhJTn00q
	 bC6A9odn2W9OSbmdN0j3Yp2kGQTjp+9LNyCLqby2AQc6X2KYEIH7OJ3+adOQzlljUG
	 wF2Pi65c8BLpqb7Ty+ibH4vBL6w7pH9QEN65JWzFm/n5dAJPufr/8hjR30X3Pm/y7d
	 oQhTczfskp9bA==
Message-ID: <f2765a490c501ccc6e410b94b5497ec8@kernel.org>
Date: Wed, 19 Aug 2026 12:37:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 10/69] drm/display: hdmi: Add HDMI 2.0 scrambling
 management helpers
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-10-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-10-294364b2cf15@collabora.com>
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

On Fri, 31 Jul 2026 19:19:17 +0300, Cristian Ciocaltea wrote:
> Add helpers to manage the full lifecycle of HDMI 2.0 SCDC scrambling on
> both source and sink sides:
> 
> - drm_hdmi_mode_needs_scrambling(): checks whether a mode, bits per
>   component and output format combination requires scrambling, which is
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
