Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1703749EB;
	Thu, 13 Aug 2026 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628710; cv=none; b=Px488WTsjwJzoUCWF7GO/6RAXhz4y1CQ8FvFQbks6k5ajesTqV+hF0WrVrZyaBtVxYLrMDvpiT9izAFjkgWIjUIs9MEhjPKf97ZRheeLjtKOR3XTEbf2hsIp6ONVBZ4vtvvhjHZCr4AqUkFjhtjbN82Kr5HuijprvHsW77hLdPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628710; c=relaxed/simple;
	bh=uqnEnOPWkIJui7qzcmARHhau5SfBP6TbZwsJTfXtR84=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=tve3tXdrCVkucZhH5kUJoqDgJVJ950RT2zoTXHA4FZhO46bVKHBzS2WJ4jP5+KGiHFVWg3XF1aw6IqmF1xU+TYqc1D8iFp/vfS364RqPY7P7BA8j9h+9liSq6Dg9/1fCMcEb4e52DX/bNrIo7xhXoJAZw9l1unrhW4b3mr6c7y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3Df+Rbx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3Df+Rbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A92E1F000E9;
	Thu, 13 Aug 2026 13:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786628707;
	bh=1cPfZ/bD6Z97U49M2447wQA3NGD5B4htgMrzWxyPoww=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=K3Df+RbxgUm4SC4zm2ucVvCWGJb4vf72uz1aaayTkRQLpcuRSaIxkrfB1HWAWHg9O
	 KXPhhHayTkqgGtzOC+gz6MRLRF28zAbJpu5N+voo0Gc2inVoIxiE73icOIDPVNDWSH
	 BigmAUhsF6ptF2TXs5v06LgwMI2rntR79vwvugIgCkUilf6eDVr5ulWnaP+lSjQOC7
	 SO7lIlNqXmsy2O4mempnYH9iSC/NZtjrMRvD0s0APhlTd6Akl9OKSup8DvxVxTJlEr
	 dbyccZe+HL4GEekw+YL7JFSybSDyS2NgZ+VDibBSzz/s8alxSz4/lZ7gZ482/hAqtH
	 7Se2Mw53nZG3A==
Message-ID: <b4902134934e37aaa9b8c0c332324e2e@kernel.org>
Date: Thu, 13 Aug 2026 13:45:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 02/69] drm/connector: hdmi: Handle reset() state
 allocation failure
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-2-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-2-294364b2cf15@collabora.com>
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
 Holland" <samuel@sholland.org>, "Sandy Huang" <hjc@rock-chips.com>, Sashiko <sashiko-bot@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 31 Jul 2026 19:19:09 +0300, Cristian Ciocaltea wrote:
> In drmm_connector_hdmi_init(), if the reset callback fails to allocate
> memory, e.g. inside drm_atomic_helper_connector_reset(),
> connector->state will remain NULL.  This is unconditionally passed to
> drm_connector_attach_max_bpc_property(), leading to a NULL pointer
> dereference.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
