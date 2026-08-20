Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF4410D3D;
	Thu, 20 Aug 2026 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221248; cv=none; b=qKI40geXakqglcjskgLxKQuWjwnpX6AiQ+KtehXRjZC4Hq2KpzNClob404wjJ6Bb4I0zSbuks6+dprYFJasXSelDrEAdv3IZOq/Zl3md+KuR/XZQjlO69rIfnUHkKohpUk9U7cWhxkdEQY5ZGjzUkX+PHV7rcSN9tHAfB2NwZ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221248; c=relaxed/simple;
	bh=EWgkEsvxtSvvoq+U+5Y0xFxgXPEZ0w8sGEyAjHFIRKQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=G8TCQB7BgggIa2Th+SghBZezwYFLF9ptUzALclB0S5WjzqcJSUi/SiM6lu2K2MDo+VGfXWBMtV5oON+vwb/gck/lSVc6UCouop3BndfUn/uduf/jzEnSN888rt8vIzNQgNe77pxSj+RdNKi6Yi63x3HNbR02AXQuORyUdApYFCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIrrhK1J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIrrhK1J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49E41F000E9;
	Thu, 20 Aug 2026 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221244;
	bh=Y7A9sj2I+9f+ApBdCNkzkJ0UFPvM5uYskNE27rgUXC0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=lIrrhK1JB67kNZSh544PmkOfj3zrHAYu14z4pU7Riw+0oAf3zbkx7OQ0llVWpHM2T
	 hWL5biFZJUzn/MAiLQh68SZ13pxPIX8S+8XmewhfPwVUOk42WWoB2wI0igVWZ6XTr5
	 Vy4jPaH+Bxv5idq+wPN+bMKb03Axhav95v7nTVMIiXqaUUZH5SRnClfrHhf8TO1Skq
	 pG+l9c36qQ2nCqOCQGXYNt49gwHTaqsE/CCq/Il2tulS1T46qcNIX1hFYg3GD9a5Na
	 vzqkSz5ITVgQu7hRL4MMcyn15NpMyuzQQ9UigvIA2nX2KXesP+H+YhEtVkY3pcBLZj
	 +CYil+z/iD2tA==
Message-ID: <63f164a4dba863e1b6b356fac4c87a7e@kernel.org>
Date: Thu, 20 Aug 2026 10:20:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 68/69] drm/connector: Drop redundant hdmi
 supported_formats field
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-68-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-68-294364b2cf15@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Phong
 LE" <ple@baylibre.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 31 Jul 2026 19:20:15 +0300, Cristian Ciocaltea wrote:
> Now that all users migrated to the new drmm_connector_hdmi_init()
> signature, supported_formats is provided through struct
> drm_connector_hdmi_funcs, a reference to which is already stored in
> drm_connector_hdmi.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
