Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD4B42AF91;
	Thu, 20 Aug 2026 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225116; cv=none; b=DWnD1xErgt7uLB99NrJPtVMDDV16o8pxTVoBwxZxunTHknZVLDemJAcgejoH6eTMr7F/EEE37sGyBnDsuZQqm4P2ENnXTOGt84OD8huO70NO5rF6Ey4yvLyBU3Yqs+sOhz/nnG/hsvqluKe27vP9pt4bVhWUS2gVKevYkPCF2EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225116; c=relaxed/simple;
	bh=uXCsRx2gpHphwD5vA8dz8s6UFkUjR25U3djlrwNwVt0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=FF9UeTT2urCCfhheHTLQxM1ezP3AeBxLZCiqkzGM5q6AaGJxFLJoQDG/FD6gOzzNYzlS53fzLU6YslPc22QkbGXxZT1P6cRMt3ERabncZ5VfB3SSA11i3DGMvz1K49+vrJqiqD6MoTpshtNZAaXfm33tyIEgOzPoYRQ9FrtpRXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+DnkccL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+DnkccL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1351F00A3D;
	Thu, 20 Aug 2026 11:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787225106;
	bh=/c60mbhcS4U8Xf5+mb+pxutuXKJgTlFQK+FGzZ5Hvz4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=W+DnkccLOEc6tIO8oUfiNSsEn7nL4BbZyzMM0gkpESvZTwqE1AzRr4jJ9Vvfm20bt
	 UH1bmjPw8cfFwxORVQu6WFahYiAr8MQHe344cSU09qUZPolOh4Qdsob7ugBXS/Jsa5
	 gfcYFcKDJnXwpit4NFiXKv/T2PIPkymFykvLDicUU6xcLB1Trpj++/Bksy6ettMbq3
	 sSg7lzOXdDDr2tLgJqq1iKWVmSzHw7DKokvmeAJX+qZmiDZwpteum98hTChkS7CteH
	 rz/d+ndoAtWjcImdNQeC5iy0Sv7cDF6zwx9xtOIeQVy/M0/v4D0RJBedhTLINhLCXR
	 E0ehyYHNLoXEw==
Message-ID: <b413cfa2a6229fe0883d1a3116d9e88c@kernel.org>
Date: Thu, 20 Aug 2026 11:25:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 44/69] drm/vc4: hdmi: Convert to
 drmm_connector_hdmi_init()
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-44-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-44-294364b2cf15@collabora.com>
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

On Fri, 31 Jul 2026 19:19:51 +0300, Cristian Ciocaltea wrote:
> Switch driver over to the new drmm_connector_hdmi_init() signature. The
> vendor, product, supported_formats and max_bpc values previously passed
> as arguments are now provided through struct drm_connector_hdmi_funcs,
> together with the new supported_hdmi_ver field.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
