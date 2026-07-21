Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B15E39AD51;
	Tue, 21 Jul 2026 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643560; cv=none; b=Xb2qxmumjEa/h6FTI2z180thcio/jvZvR0pytebEjx+Xj1dLaQDcPTJo1zG5xR4+vVwH4iu1nWrfzzu2aGqxZaNMrIUt+kbQSJ2bdmsdNi+8evtJQIq9aQV2YJdaw87t3SJJime0fFd8iWxPNGm9U5wu0orGEYU4yeehUqX4aG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643560; c=relaxed/simple;
	bh=rucSTduMpSmID0o2N2P4+4MsVRMmVfPeoJbuewKIyj0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=bDZYcKkvnvvOAVTtYvH8BSr+WXM3UlzTPgqmyzaBTyjrSaNWyNNvK7x4CzgBUz8NQ1UqaL32h+U/HS65z9X+vqgDmhV5NlFuFU6gutNoVAR2PYuSCZ5ytXpbDzaXB4P2UqqiAwsOLFjNHmSOJKkmz596N1gk8Ta2uThoqJNMvc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7GRxw8W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7GRxw8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC091F00A3A;
	Tue, 21 Jul 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643558;
	bh=doxlar0h1i/Mc/eyGBx3FgbrfxAmZ8ASm3b2ucZdj4Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=G7GRxw8WUXfAFYdaeTm340OKqVwsM3pgjKqi658oBzEJArpgcXW9knXwU8T25VR4a
	 F3cZe2hY5XwAd3TmJYfMgYC8dWlY6xPppV0vrcZ5DtsvCBggKMkHm3kApoC+9Y6Rai
	 /OteLMOyfX3s1ssPqCk9tXZTmHluhuinWGYC6hbzYOGyXb+F6KrcJBDniwNikbKUvt
	 VqFjji77T49zcZNP6armTeUrSlgk75f7nxgvBae1ADT3rjzHV6ZQmNcer8a++tJ3Y5
	 afDoLmwZQ5DzCuuG0sSsyQo02eOfhtAsRJZIgmisxac4ZtOZzS6zo7B7bCoI729Nn+
	 fDcuPhWEFPnGA==
Message-ID: <351720a5ab7640ef0239448b1f7965c4@kernel.org>
Date: Tue, 21 Jul 2026 14:19:16 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 4/5] drm/debugfs: Move HDMI debugfs registration to
 state helper
In-Reply-To: <20260721-scdc-link-health-v7-4-92df1b6ad5fc@collabora.com>
References: <20260721-scdc-link-health-v7-4-92df1b6ad5fc@collabora.com>
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

On Tue, 21 Jul 2026 10:59:00 +0200, Nicolas Frattaroli wrote:
> The HDMI debugfs files are only useful for connectors that already make
> use of the HDMI state helpers. In addition, relying on HDMI-specific
> functions in drm_debugfs.c can lead to circular linking problems later
> down the line.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
