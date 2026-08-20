Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E573EDE6D;
	Thu, 20 Aug 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221027; cv=none; b=YqyM69CN9SuwXbU9Na8VhamrEdO/5tv1O5JRms8zqhiFyVxUpU68uLsrvH+EfweMb+bLLc6IuGJvDh1mKXVyplqls3pIoh5TA/bVCLaz1gVWhDL+HlGaOJkznlQcGL533bHOOxGzsYFuyg/1tf9BPnf0+Z31pj+kT7tLXeCa8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221027; c=relaxed/simple;
	bh=3TyqgnotUwJmEVNmwvAnesudlfI6OPBVZgDediEevVs=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=LtM+WyJwV+2Yd05Qxr0npSQ84uerJO5Wg7J9BtE1/tl5N/GhiYBQ+ChaTus+uegR1tzNsDy7sFSBShiElxLWaoQRJbeRIJRQZs3PELFX6mh96vWKRZ39aFOriA4+qL+0KwKk2ejOVFaojxmM0Dmg0G69j1bEE1rCzKXQkjasyJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgkoSClq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgkoSClq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611B71F000E9;
	Thu, 20 Aug 2026 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221011;
	bh=jHmAuUOPImzJ5rAL7cyz/qtpECyL3DDK1QmhFFgMO3E=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=HgkoSClqpy/nkjycg84GKonoZEvaOHjbf3qmXWRIzWrONZdZG3Hw4T8Jo4m/mggfj
	 Umfh4V5/k7fzKseNVuBPcH8QTVaxSG+eeWbwzHyimlKUp6aKsTPPNm9o0sGBpqqKnE
	 ZAguyouDBwOhVS3Vhd+Vfns0d5/5ksD86VL8eA4CLDDsKjLigNS6eFPk2fBtCt1HX0
	 9GKu/RXkP6knDgGGYSGhMpGtT503fJ/h+sXs33lVITu6LxL9BTGuFTiNhfU7apgN5C
	 NP7SS7fRlIHJzHjhFDxF45vI0Q3BhrmP70IvpMKesA6xPBzH4UnqR0DyKhWErgw7m+
	 xKQ4af2TB1/FQ==
Message-ID: <a03dbed70e428feaa1250b378c9ef8fb@kernel.org>
Date: Thu, 20 Aug 2026 10:16:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 47/69] drm/display: hdmi-state-helper: Drop
 drm_atomic_helper_connector_hdmi_force()
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-47-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-47-294364b2cf15@collabora.com>
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

On Fri, 31 Jul 2026 19:19:54 +0300, Cristian Ciocaltea wrote:
> With all callers converted to the .force_ctx() connector helper, this
> function has no users left.  Remove it.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
