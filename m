Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22042EEDE
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205107; cv=none; b=XuNLaCJ4voiuWb8FYiVd3WH57ZywEwkVHuO3ErMhDYxnJ+q3wwSN908WwSi+ZZa0Ba4BeSdphbYXvnmD+6rc/JEfHIFavQJn0WLvbPT22Tsa9hfpOs4mzIZWCz0cpraJ2TsZlqjOlerGsLKiAJqKjbriN/iK5urnn3IzcPixQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205107; c=relaxed/simple;
	bh=W3zF+qQONPOQKUi1XnVsQnrCFcFTywFDxoHqVbunmq0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nki6M92P4rnpaU9a2BQH4bEdkcSbybE+gzUtM1+x1DQ1f3MMGy9fT4SDgXDGy4KX4t83m0owgB35ckeJLAhomDgMyCEqrM1Dx+G8KKmQNobGDn6gZwlnRoD/BbDj2M6x3pPs+dP14ZEYl/2x7v48+9Puoj01DGZQ/s6yc19ZnoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvzUN-0006Py-1Q; Fri, 27 Feb 2026 16:10:47 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvzUE-002ujh-08;
	Fri, 27 Feb 2026 16:10:39 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvzUF-00000000Fpg-136n;
	Fri, 27 Feb 2026 16:10:39 +0100
Message-ID: <28096f2a0ff3fb3163dd19f2ff483f3f2415180f.camel@pengutronix.de>
Subject: Re: [PATCH 01/14] drm/connector: Introduce drm_output_color_format
 enum
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jani Nikula	
 <jani.nikula@linux.intel.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,  Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher	
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Yan
 <andy.yan@rock-chips.com>, Liviu Dudau	 <liviu.dudau@arm.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,  Heiko =?ISO-8859-1?Q?St=FCbner?=	
 <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai
 <wens@kernel.org>,  Samuel Holland <samuel@sholland.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal	
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Date: Fri, 27 Feb 2026 16:10:39 +0100
In-Reply-To: <20260227-overjoyed-glaring-dogfish-89effa@houat>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
	 <20260224-drm-rework-color-formats-v1-1-bebc76604ada@kernel.org>
	 <4ea869750681f5eee3bbb2978f4ff0ace70310a9.camel@pengutronix.de>
	 <20260227-overjoyed-glaring-dogfish-89effa@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

Hi Maxime,

On Fr, 2026-02-27 at 09:38 +0100, Maxime Ripard wrote:
[...]
> > Can we move this?
[...]
>=20
> I'm not sure it's worth it, the last patch in this series will remove
> these so it's not going to stick around either.

I agree it's not, I just didn't look as far as patch 13.

regards
Philipp
