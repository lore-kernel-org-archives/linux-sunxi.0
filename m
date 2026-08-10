Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE63B255E43;
	Mon, 10 Aug 2026 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786353824; cv=none; b=XhMAv0tRR39z5JY2h4IxM/QS1A45lNwNXmilqxykv5nVOR4WY+gt1iTPaezmacCsgU6Dqhe1MQkjXTnzJO7zqIVTXQc2VVXdtuOsf0XBM+6RTBALsNXfoY8wklSjaQ8riW+DDtCxRIjbKDPbcNExwJBmManihPOVXq78I1AdyYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786353824; c=relaxed/simple;
	bh=49acq+2vpPfsM80s8ETRUJMtP9pZuXInuRix81JFcKg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=MTiAFTJxzqt6y8rDhWNJXVNvunu9/TZHx2CL/T4PnxorMtePBWzX2nepKmmwUkVCAsQF+rLcdTvjkyDKkXEeMPC9bhgWGlREX2JAq9QE+2U+aiEwppdcGCMvj9nE4gsbIw8CI1SzOwVXNLVhdYzpVNyhVCCy3OYbNA8oGB8pFDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVZbQw1u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVZbQw1u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285BC1F000E9;
	Mon, 10 Aug 2026 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786353823;
	bh=IdvPpAswqw4/3CBhh1oPtwObG87J59MBx/ZFjS/sjZ4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=IVZbQw1uWdTUO6bW6TK+IUk/hHy1q2s7kOEkTjNWa4XzEJ7N5L4oBWdsOJBOG/BQL
	 uFQWH/vvS0l9j8DYBrYYi13Khavxk/4QTZvquJX9eYmDZakA2UetFCL9yTymPoTHMg
	 pkoJ3tfo3//cjHiBwPDSATQ2ddyXX3e7Xs0lMcMVCGTwd02Zxv3VmPBI3yZJcnFgN6
	 0Ebbc+U5q5CbiL6bjBK1yjoh9Z9T/zo/X0nGcWqIcltxTUB7tvvdyjyLgHOKj0hUTC
	 xKr5Sk1GL+VAu+kZpKMgFKX8fWatXNVtEaKFUfSyP2zjo4ZJKxhGrzLa7GwRWe0dXr
	 oYXfb6zHaqdZg==
Message-ID: <4ffd340eee7fbcaafdb93f203a319416@kernel.org>
Date: Mon, 10 Aug 2026 09:23:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v9 2/5] drm/scdc-helper: Add scdc_status debugfs entry
In-Reply-To: <20260724-scdc-link-health-v9-2-bdda406d016d@collabora.com>
References: <20260724-scdc-link-health-v9-2-bdda406d016d@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniel@fooishbar.org>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Hans Verkuil" <hverkuil+cisco@kernel.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 24 Jul 2026 16:22:37 +0200, Nicolas Frattaroli wrote:
> SCDC provides status information on the current display link. At the
> very least, it may be useful to expose this info through debugfs.
> 
> Add a debugfs entry for it under the connector, which displays a few
> more details parsed out of the SCDC registers. A new
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
