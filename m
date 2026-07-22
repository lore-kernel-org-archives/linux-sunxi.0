Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6993F2F12C5
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722538; cv=none; b=m93ponQAEehKwJROiHfhzBNs7qM0a1WkYyf5t9yOeQ13C9WkVyIRhNr675VtJc0gL+6omhR0zOSbsSOCE7OjEO5CfFDhaIDisgx8bHRudbrIWnlI9IxxxUQsvbhOcn0svjH5J0RIJNQ2ifUTUjUWQhBNio8zbN/cNwODa5IgpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722538; c=relaxed/simple;
	bh=95InElf/4mMVvsvkCeBo9ZBGIRSOpJ7fiMvMn4rFSdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bk4gzEdFSTcgSJM36UJC+feCWWnQAVUFnZwimgGDQ/aOPH7TyEA1FNRdHDZYomtSO4gCCiNM6gLG7mMqxzPfKNsFnx/rJZkiogsbBUTjv2zfPv+LbzvfDZ7t/tVicqABJxKridLMvUoDUg1CV0+1SSinhrUkujeI1bBr4L/Z9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdoRbCfV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdoRbCfV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f752b3423so2687295f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784722534; x=1785327334; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VI2Isc4fgmRJDTCJfmw/OSW5rvOEVOT9p4D8XxgQ81I=;
        b=KdoRbCfVR/zzfRjQNKMjY0V0TFqdoGmepUcNNy+2FkfhArVK/1mIA6xkAWYa6P+uUF
         08pC6aCFSvbbZ2P9tSDpGY7sfpRxzsZpAK7Pav7rN0FDxTlL73LighwQcVy/JbHjrBT+
         fxSM5uuNVEtgRFOFnN1XJYpHN3ob3z63rwIDUJS5SqvFW/1caoSK8w8EVO0+GTLJPP+P
         YdfUk0mq3/Gp0Q6l4FoTqkqEmZo2d41WizorT605+FZIVA1JRD1lFbnq266Z3mRqUvfU
         7165noYrWGqPN04EJY8omPagTfX5deeD5xc/Kc+ZE+1lZHt/qEJ7f0XdlYspk6WqXuTp
         uSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722534; x=1785327334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VI2Isc4fgmRJDTCJfmw/OSW5rvOEVOT9p4D8XxgQ81I=;
        b=rsXC7GjtnT6hAH0Axafo89vQ6gPW+HPaHVQCr15VmLabRZapIdDpKO9iy+KjZbIqoP
         qyM/grGv+hZQeZeFolc79sYwCL8SLCNhF1Mdd2CwHQ7mOfu5xpQod7imTpV0unWnHiT1
         1kWBifwZOonKTfJqcAB+VdSbgofpRv44B25bfOqGDQcL5qLMtDehyIMRXy9OrVSkMNJ0
         wpcfWYaOs6yeB2TOd2pk17tt42EQIrw+5PnN7kSdWhzTItRsRzyOFI63GunXJ5ldxw8m
         trTp9LRcdHU8Jm6KO6DPginQTbAL/gDLPhcWyTRc6xnmHSUJBgi8++Y+eRUXLy1X2Rm3
         dyEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMQenFoJN0NdT2dd/VFq9fU+J1XrTmhfVOe085ySORt07HPl11i2m6c531imfyOEj2r2GkzkZnKfj9Hw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx4+cImQI2/i6oqneAW4Dni5MN2t0o0z/VlAlrfdq1D7pF1QvB
	WZwZmS7QFnm9954V/bQFc4fH0JRolPow7LlVpgPFBhOiTECCtUoOQupaawk58e06BAA=
X-Gm-Gg: AR+sD136nuE/NWV+LpZBZxnEPvu7Y21ZPCYIAHKDQUqK1w4YDh/up0Q3u7wwMZwBEfV
	X/GfsRXkDIVH/T4MlWxXSFPYnQXLWgRtqEqlaA6VU1K2bsG6UnNT4GFUtUb82JMEVqGwB1mOGMK
	tPx+aCFeQ9/rTOiYEieuuagXw0GVIwGOan2O86+Dj8WNvvs6WzftY72unYJIqcArSxt44oDkB1m
	nT2TjFizUvzmEpSw0Z6+hri5CxBy6TNMA8lruIePMqVAV9UpS1g2MZYLaKDKn2GSmBQ6qhlFIJj
	aGlZ4IkQ6y09VrHI0cqMC4j8FY89dJ8NjcaH76kikqnMIBi8C3P68nA1mUV1OWLN6Fz2A6JzWg1
	kcwu8dZMZq1M7xO5SoFus38b2sp37m5vAfQU3GeEpW0f+noBNNe/l5W8sYEet6dJFHNfA1RvuXa
	4bOTJ2ZuRJJcsbsyNOggN2euA=
X-Received: by 2002:a05:6000:46cd:b0:47f:70f4:7c5 with SMTP id ffacd0b85a97d-47f70f40972mr13998165f8f.53.1784722534372;
        Wed, 22 Jul 2026 05:15:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f8635c8d7sm4379093f8f.21.2026.07.22.05.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:15:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Linus Walleij <linusw@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Jingoo Han <jingoohan1@gmail.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alison Wang <alison.wang@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Albert Esteve <aesteve@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/4] drm/panel: refcounting panel lookups and references
Date: Wed, 22 Jul 2026 14:15:11 +0200
Message-Id: <178472247762.1745070.2847290153778032256.b4-ty@b4>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
References: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On Fri, 17 Jul 2026 16:02:03 +0200, Albert Esteve wrote:
> The drm_panel subsystem provides kref-based reference counting [1]
> (drm_panel_get/put) but almost nothing in the tree actually uses it.
> This results in a systemic use-after-free pattern throughout the codebase.
> 
> This series aims to close all those issues.
> 
> Patches 1-2: fix the infrastructure. drm_panel_add/remove now keep
> a counted reference for the list entry. drm_panel_bridge_add_typed()
> now holds a counted reference for the lifetime of the panel_bridge.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] drm/panel: have drm_panel_add/remove manage a list reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/61aebeadff40cded27168e53406e0120ad66e114
[2/4] drm/bridge/panel: hold a reference to the wrapped panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8f79d34ea8950fd825e0d6ecd713705a42f06417
[3/4] drm/panel: of_drm_find_panel() return a counted reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b71a623598d319cae2acd9df1b297cc948c58bc7
[4/4] drm/panel: find_panel_by_fwnode() return a counted reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ac3baea883dab989178dd4186090d6bcf52b8d55

-- 
Neil
