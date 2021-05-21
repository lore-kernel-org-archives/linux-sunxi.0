Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262F70
	for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 15:53:21 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id o127so11391465wmo.4
        for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kdAs0Ep5+2K53fiSGhNfrLNzj7MMY3EgOQjni9Umht8=;
        b=IhYlOGhD14MnNUDN3/gcfgDBq/BNMorjLEdyQeq1zzib97z1tEhGiiXaphyov0B6rm
         Fnug5G0nwmDNTjmkdcXodXq9U/gz3ibsum4pzrkpfI9FmltJSw2CUcxsWX7jGXwwmyCj
         6vxc3W7raymKSRp3BSh9pxV9ixt7fhYnirv/L00YJBgVdZZYogPdXKuTSkEFfH1IrFRZ
         Da9BK8RCuQqZjWtJt4Z9PY1PYT/d4yv4t/as1y1Bzr1dc6M55Y5AjpEufmJ68LUqwnaN
         r/4pWcKNmcNKigTm4vX1D6oC/E3gRqOexUh1NDZr0Zq9RS8nw5b/KoUs/ymofl20nPkJ
         EdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kdAs0Ep5+2K53fiSGhNfrLNzj7MMY3EgOQjni9Umht8=;
        b=hXHDF97OvJ+uAtVvfW2N8tEozwMAwl5M1DooRta2/cFS+YItjUBx24jrN+eb+wYnXa
         H5422m5SyxdE3G+SL8pyvEKhd7LwqD0GjwjV8Vqrk8aK2Rbe8jP8uoVn1Sql63u2Hs7m
         qFgG2Q/LdpvSQznvaZOqjVDZs5FZ9orkf1bzipHJxLgry9lH3ga4gQ8H90LE1W16qAYl
         cffgWWrFkfjdjzZidfcaEjFfg9eIK9KgQajLiUPAaCL/GAeBDoBef/ALe774oulYQZTX
         lbXmtdeofW17KftWKSOiY7n3+mq6hGG84eE2j0itv6g9v4mvFflj0HXzv5CcLNHj3+Hd
         tJ5Q==
X-Gm-Message-State: AOAM531xTujV3vjww8+YpDUngRiMmNq3UY4fsKqs77eR0VgfRz4vC01s
	iEobKZRNDGAC2fM41/ap7Xk=
X-Google-Smtp-Source: ABdhPJxTn/ueWgal7rvRO3A3ECHpC111Q7o7SxwZUm6zNTqM9YK/SolsENlCqq1BAUxDrXnfxploOg==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr9425116wmi.101.1621612399794;
        Fri, 21 May 2021 08:53:19 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id o129sm13051356wmo.22.2021.05.21.08.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 08:53:19 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: DRI Development <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
	Daniel Vetter <daniel.vetter@intel.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Benjamin Gaignard <benjamin.gaignard@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is now the default
Date: Fri, 21 May 2021 17:53:16 +0200
Message-ID: <1940958.iMR1v07LRx@jernej-laptop>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch> <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne petek, 21. maj 2021 ob 11:09:54 CEST je Daniel Vetter napisal(a):
> No need to set it explicitly.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-sunxi@lists.linux.dev

=46or sun4i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


