Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CF73750CF;
	Tue, 21 Jul 2026 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641778; cv=none; b=GbUMtlHfw5XNA8pCX0n/czBCdauqxBP6lCr5MablQqO7hJa0xNF5C7qVJzz+UkFShD3kDYzpvZTj2NNkO0m8V1fynXXf3lRVw63ganO+IN1rMrXPaGO4yBkap7tATIyawQNLOWRFlBIHBKzT3j5G0scL5Df5CGMAuHyyNmrA5hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641778; c=relaxed/simple;
	bh=Gbe4wTCP2EwNjXUCsZDbUb79GnOwE64n/U+cTE8TgUk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=EixLE7lf/2LTi2Sj2WQ1JcrOFRQIHGBgtLi4FCfsNmFQKt4gd+qNNCi3gZDsx/zeBGr4/jd8lvWd/FpGwNg5m4aAUe5yXzhFE3D7Lo536Zox1Wkh3S/yktolL+MrghoGZHOD5/p5cl/Qvm0Zul140T/0yoRpwFxau7Y1NzmXKJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDJ9u6Rh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDJ9u6Rh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F091F000E9;
	Tue, 21 Jul 2026 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641776;
	bh=T71grAhlefTCoaH3/HnR/Gxf7jbUfL6CXZ/mQnb6MnQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=QDJ9u6RhEeqAQ8jRz5BRa0K3ugTnmhNm7eztASTRdi5Y93mY+g3mkl5aB/7e68AKh
	 tIKQXQvBCnCJVEPkg+wTDAiVWVwiUqVK/TCvMdMPCVjkbf+ia+0kupgi786QSHjrPp
	 uTiuNedR3H6uLoeYDNzl9cwTvJtdJr/fb8nwubMlqBLK8bcpqr/Ca52ZLoG5hRErfn
	 J6/cwCL4/Ik5o+a2zOXOiOxc6YezMtne+yDrx68yGv6Zlpec7+b1Y+9A8Y0p62zsn4
	 HnCZZ3j0tCxSX4HjrTgmQv7RUiy//p73Vsi7rtGVOI3sqEACeM7ZOaW1Rg1mqAvkO/
	 guXxfX6ju+7+Q==
Message-ID: <41e0ff0b380e6f4bf4a9f64061f17d58@kernel.org>
Date: Tue, 21 Jul 2026 13:49:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 5/5] drm/display: hdmi-state-helper: Init SCDC
 debugfs for HDMI
In-Reply-To: <20260721-scdc-link-health-v7-5-92df1b6ad5fc@collabora.com>
References: <20260721-scdc-link-health-v7-5-92df1b6ad5fc@collabora.com>
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

On Tue, 21 Jul 2026 10:59:01 +0200, Nicolas Frattaroli wrote:
> Initialise the SCDC debugfs file for connectors that call the HDMI state
> helper's debugfs_init helper. This makes all connectors that use the
> helper expose the scdc_status file in their connector debugfs.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
