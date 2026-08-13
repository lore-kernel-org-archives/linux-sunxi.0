Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC73955D8;
	Thu, 13 Aug 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627775; cv=none; b=rnyr4iys+WG+HxWtsuCQjvHVT6OwPI5gEWcXsAPuZJdzflDVpgMhiuYCpu1xXwOiS8A8a00kJ9ixWQjqeEBS2tWHtdPrREnkI0/9BcoF2ZVNQiXWLvpo6Q4mor6vNAj9yUHz+HyRTSUqsCc4xdeF5+41BnbmPzBZvx+jXMz/O3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627775; c=relaxed/simple;
	bh=DAqSoZuNFrtZGd4It7BSrzRjs1Memoob1Wo0TIH13Zs=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Knj4vVWGOfbKCck6XEkMPBuLFB00oax/0OXeMAvJXXCXqetq/Mb/emrmwyI4GMRLO+oSukpFtwt5d+3LpIWrErqKHdFTaVVY0qxICGPy+G7kh645CwMiCS3z4lf2TCRQfB5L14+LG9slevG/d3TMoACTqOoYiQBaAMF1PPu43fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRKCUPsV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRKCUPsV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92F41F000E9;
	Thu, 13 Aug 2026 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786627774;
	bh=AJLFF08mlIeE/IaoIYnB9WQvz/G/9RrPj8LIHZ81MUA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=ZRKCUPsV2DcAo7/uNBRzJ5M9T3+Q5wbDsU50aulixxpZp2tJCLJEOzo9xpB4DvBqw
	 JiP8zIhDOcdkaOO9A9sj0C6Yivmu+DzyFinRvAmSVh2VMic6UAoxZ5FG7zIK3chKYT
	 z4aDv4EnWWonKLN5OCw1zwmoLmsUse62geBB4GtkbE2FrBgGSPWutIs3yH5wHN/2Ya
	 yC06XlME0PfVSZp4Cv0eysB+DvKVsjTnSLIlmGCv6wqOeszXAvgS8AyByVUXp/M0Ij
	 M8KvoiBto3KduG974o7B+FZr2xSRFTfeAL73fLio9biCykRwBhbPdDtkwV2E3g1J3Y
	 hGGqtaE5vwzBQ==
Message-ID: <98a2bbceb9e9bcb99cddbd43d21e18ba@kernel.org>
Date: Thu, 13 Aug 2026 13:29:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 55/69] drm/sun4i: hdmi: Convert to
 drmm_connector_hdmi_init()
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-55-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-55-294364b2cf15@collabora.com>
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

On Fri, 31 Jul 2026 19:20:02 +0300, Cristian Ciocaltea wrote:
> Switch driver over to the new drmm_connector_hdmi_init() signature and
> advertise HDMI 1.2 support.  The vendor, product, supported_formats and
> max_bpc values previously passed as arguments are now provided through
> struct drm_connector_hdmi_funcs, together with the new
> supported_hdmi_ver field.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
