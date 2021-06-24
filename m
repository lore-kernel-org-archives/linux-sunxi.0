Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C92168
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Jun 2021 12:02:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v20-20020a05600c2154b02901dcefb16af0so3445393wml.5
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Jun 2021 05:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
        b=A4ZJSYnWcvNDaAGkscckQ1T0JedTdFDVSuL2YBNdwwF7acWK0AZcsU5zvsVBjaEnE0
         vsxLXeiOkPXV0sDkt5mf5/o226lI7HBeiLI3sEq1aMRGbypsf6Bch2Kg62wRL1La4pDI
         oGZydtxItkAsfL83TfuEmUWoDMxV7rufPNivK3ryBzWPLuL+5usBc6MglcCUM6IzelM8
         Nz6qtrU0C9W4JeYrs7rwBFAjukEAoFywD8y16Q8wkRFeIXm2GbxrFHrfjHBLNTda9rqV
         SY0IiWXgH48K8ZPh9MWtQ5Dh1jLdaybwti7HCY0TZjkN9TbYA/yL3MNnHzS9FYivGbwv
         lUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
        b=ZNAolY9OQE6zX5YPFLurpTBwS+hKo+Fm9WNFNl2Zp7mm5/EeGBVyJS1p0BuvSapGpV
         MCi5MrEFwylGaEV1AkwfokmWEs9Z1dBpKj+uX54QCwp6ZI+20IDaacFHiuQSjSahFpK6
         9NJdyJcCoEYkJWcprAwJhGcdmIF8fwiiGxx4KuCeZL6cfafsSi3hzGTDG4Mo4IM4TX22
         fvnGxvyQl3PjI/hWngbOTmIo2e4QMOb3wX6aUrAD5I+BLHvyHmtebQ66+fWojYMVnpqo
         T4Y8e1uQMy/V4FI1iUaxtJkl2eg4E4IPqZvaTaxgkau0erxlaT3e/VKitArSzMVaH2v8
         y2gg==
X-Gm-Message-State: AOAM5324sDPHU6OavVHdALZBOBVkTg6sx5XCxsdamror2YQk0y+Bfl72
	1vweSnLa6lJ3Tqv7oRElQUw=
X-Google-Smtp-Source: ABdhPJwnAQpQT/2sEz7viSMJ7t/+2zmdWLWtmPK9rh67Szq5oWv4lL/lZy1xAEGpP06+iHH3w5wUNg==
X-Received: by 2002:a05:600c:4a19:: with SMTP id c25mr3844668wmp.125.1624536148907;
        Thu, 24 Jun 2021 05:02:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c12sm2972417wrw.46.2021.06.24.05.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 05:02:27 -0700 (PDT)
Date: Thu, 24 Jun 2021 14:04:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
	christian.koenig@amd.com, Xinhui.Pan@amd.com,
	james.qian.wang@arm.com, liviu.dudau@arm.com,
	mihail.atanassov@arm.com, brian.starkey@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	inki.dae@samsung.com, jy0922.shim@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com,
	krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
	tiantao6@hisilicon.com, john.stultz@linaro.org,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
	laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
	p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
	tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
	benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
	philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, wens@csie.org,
	jernej.skrabec@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
	emma@anholt.net, linux-graphics-maintainer@vmware.com,
	zackr@vmware.com, hyun.kwon@xilinx.com,
	laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
	jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
	linux@armlinux.org.uk, kieran.bingham+renesas@ideasonboard.com,
	rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
	hamohammed.sa@gmail.com, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 21/27] drm/tegra: Don't set struct
 drm_device.irq_enabled
Message-ID: <YNR0zpVzMxQauzet@orome.fritz.box>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-22-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ENqalYeZVO/RAx3+"
Content-Disposition: inline
In-Reply-To: <20210624072916.27703-22-tzimmermann@suse.de>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)


--ENqalYeZVO/RAx3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 09:29:10AM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/tegra/drm.c | 7 -------
>  1 file changed, 7 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ENqalYeZVO/RAx3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDUdM4ACgkQ3SOs138+
s6Ed0A/5ASxTJhpMIfL1u/g0kk5pjZX8ukNK72+ftE+sJWJhxDmTGuM+EzcPNaNg
sKT+65FK2YsGeoA5fnN9QKWuUyS+bpExys5n39Aty+YN4tI4CV7CbU9OJeYm9Iru
i+Ziu6gkJl2SYom/+cxuU42UkUDkQkWofYRel+HJZeDMogSRAIhiiQy5/fadGiJc
36fJrXjueiB3EZjkg7CubNsLgy08qblR+sZGpuq4RIc3aVe6j6U8QxHiZ1eA7tMD
ki2Nmub5WThcAUGn/ky+FD9m/yfieoI9sPkVWRpAF0oa6SDp6YO/oPFf2hJzl4jk
HPXABfAWIYFTEzjFkGdRHjOfGgahPAXvwd1ku5zjBuFSH3vM9kNaNRuIQe2Rg9ti
p3+b5RfPlO/1fiVRkuzXwROpjWNW44Y+eVVyee84h813aqYh9OOLJVrmxmrzZ1Xx
mzDTvyZXuxtVb79T4XSkb0LnRw3wrraylMLP1X4/QTqttUBoWgYeKM5MwDgy+6zH
Bx1VWtnjn9NmwEPfRmPpwIQNByNJ2DG/E8wZmEfeqJAEHo1SLOYaBixh9W7DUlWC
e9mZFcD+tYSTurqcg0mS5T1mSPJGyCjcZFP27RkFRSc9JbRAQt2uuKcr1R54mjTh
gAJ6mf8hPIWA8Q6ro+2TgW8p0X/wbPsnZdXjZrTGBsV1QA84k+M=
=pLLR
-----END PGP SIGNATURE-----

--ENqalYeZVO/RAx3+--
