Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8D82D7DE9;
	Wed, 19 Aug 2026 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143121; cv=none; b=mA3MarE7XT+ITeDCA/haX3Pqa2Ly0p1YZnXTILFx4cSBl+rHNyXGn/BMDm/wEnPaV+XN5DdyDgU9hsvTsX5/ZYNLxRGMNOUww+g6hTEVDQP9xKTkI63CQo3UbOxcKHInkq10KkGln8rMk4/2KFdmtJqNYzPmqCpKHQX78AhAXHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143121; c=relaxed/simple;
	bh=a48gEZMOd+9cNhQaWWPCaA0GBcjIjweLkI5EPFnerLM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=FkInWuL/PGIoZsr7W3czOR0fUnzZ7nZTABjqp7LbPKpNFG/0LP/A+fRamb4EV5r7RCn9dYEoDWc65gw9r6yTwlwhsvTCV6Qz5veytFf09cPtLYTG16cKql8MczGkvjIb3T64aPnoBpdJxJWXe4Mv/6v0Owzq3xz5ahgTaH3EP9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBcmiwCK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBcmiwCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932A01F000E9;
	Wed, 19 Aug 2026 12:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143120;
	bh=YI5+4EM3RFcICzPCDN2acTJfMmmPcKyBf7I7kSJZ/L0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=fBcmiwCKTMtFxhOHtc9GRiO5wFb8YzJryug+nBPRhbxX0Blx+hzT3vEXbe8wkOdGS
	 yKFYI1ClaHRq+BevdMmiYujzSFX++/qptj30jlVXvilZY6mMGBztqXnP5lFfLnPztx
	 kG5bW5VkiSG8/LIqhupcHBprl1u3wA1coFPoS4d18Kp75h7L4qoczsF6+CHCNeFfN+
	 o/uqNvqwSm79VLyfb263d4TAqVXHxGba+W373PsrLL4cWRPKqV/oZHpX7JmTFxIngF
	 5hvlMAWi4DDiC3WBe2CGHcZF8SbCBJR893oNv06JWQ5G3Pq0saGilyIHFCr0FZF3WL
	 Ycp5KN3+KK/aQ==
Message-ID: <256502b250b2bb7ad413489a9bef0ac4@kernel.org>
Date: Wed, 19 Aug 2026 12:38:38 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 19/69] drm/display: bridge_connector: Wire up HDMI
 2.0 scrambler callbacks
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-19-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-19-294364b2cf15@collabora.com>
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

On Fri, 31 Jul 2026 19:19:26 +0300, Cristian Ciocaltea wrote:
> Connect the bridge connector's .scrambler_{enable|disable} callbacks to
> the underlying bridge's .hdmi_scrambler_{enable|disable} funcs when
> HDMI 2.0 conformance is advertised.
> 
> This completes the bridge connector plumbing so that the SCDC
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
