Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AB6283FDD
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771379; cv=none; b=jXv0AHdhHaYJRzzHq9MZGXr2UyLeCFhafTD3iNxQ9Zu4r96WQVabYknXCw4Wnp58IldUjEkOaNj4S+i8D22mdOlUJfEus2Ddh//VhZw8PzHawY+8VlYUqcDW1eBNhEJ7dFKbIdKwyb16okShrZi8+sY9WwIl1PEr08ZaieQJZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771379; c=relaxed/simple;
	bh=GsHozsOFF5Z76vPUAmcjK4lTfAbswBPr21ie0rYOh1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nWqMDYjssW3WxcGCfTSOAcqxXiI+Oiei4JvtpZFMjcBbpfT0YfqeCWHbG/qkaVf99JVrqmPEFY17jiCphsX7O6Pg+MClxlRcaJYPxCr40Shgw+m9/8LVxp9mqhz6LLl5dqcWobq6wuLG8yb/wpVG+Sad1JEmKgfc08EJGGLeBlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRgfvjne; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRgfvjne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE5B1F000E9;
	Thu, 23 Jul 2026 01:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771378;
	bh=JniMuYXn5y8uuNtZYtXDnsxCGIfuoKcDaI5LWqxKrBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gRgfvjneca65NaltK4dCBPeZobAeJKxAxs28F51EVYKlpzNI3L1T4lyUsOJfjqSFo
	 2yF7tcMWR2mwBn1+Sov5Nx4GsBA0yS+Taz/51ac/rL7tR2IxROh+knmjQNcdOasdIu
	 PIg1//90ADEQUiRurbKZRahjdFJQrwCpDqVcKSeJX9iu0Iz0agQ59bGOdfQkzyRoQe
	 qqCkFLaw6bvs+hGOHI0Nb8ImWwXzEh0pt1jY/m6y/Oh4MBtPXoGoqYRUQ9WqpzZDkd
	 RERfazXJe/HNzbV9cZhWsKNGKTpnlexrCXFRInA5Yln0qGF2eA4/RvIfUTouwdG/qp
	 Cu2PaD3o6g/Hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 26/61] drm/rockchip: dw_hdmi_qp: Use local dev
 variable consistently in bind()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-26-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-26-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:49:37 +0000
Message-Id: <20260723014938.4FE5B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Improper use of devm_ helpers in a component .bind callback causes=
 resource leaks and permanent bind failures.
- [High] Missing drvdata cleanup on .bind error paths leads to Use-After-Fr=
ee during system suspend.
--

--- Patch [26]: [PATCH v9 26/61] drm/rockchip: dw_hdmi_qp: Use local dev va=
riable consistently in bind() ---
commit 791ba45ce63b6456a9661d02cb988ba23b16a42a
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
drm/rockchip: dw_hdmi_qp: Use local dev variable consistently in bind()

This commit replaces indirect struct device accesses via hdmi->dev and
pdev->dev with the local dev parameter in dw_hdmi_qp_rockchip_bind().
This improves consistency and readability.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 369f1066dabe8..2aceff11d14b5 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
[ ... ]
> @@ -622,37 +622,36 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>  	hdmi->regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node,
>  						       "rockchip,grf");
>  	if (IS_ERR(hdmi->regmap))
> -		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->regmap),
> +		return dev_err_probe(dev, PTR_ERR(hdmi->regmap),
>  				     "Unable to get rockchip,grf\n");
> =20
>  	hdmi->vo_regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node,
>  							  "rockchip,vo-grf");
>  	if (IS_ERR(hdmi->vo_regmap))
> -		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->vo_regmap),
> +		return dev_err_probe(dev, PTR_ERR(hdmi->vo_regmap),
>  				     "Unable to get rockchip,vo-grf\n");
> =20
> -	ret =3D devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
> +	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);

[Severity: High]
This is a pre-existing issue, but won't using devm_ helpers in a component
.bind() callback lead to resource leaks if bind fails or unbind is called?

Because devm_ resources are tied to the driver probe/remove lifecycle, they
won't be freed if dw_hdmi_qp_rockchip_bind() returns an error or if
dw_hdmi_qp_rockchip_unbind() is called.

If a probe deferral causes .bind() to fail, won't the next bind attempt fail
with -EBUSY on devm_request_threaded_irq() since the first allocation was
never freed?

>  	if (ret < 0)
> -		return dev_err_probe(hdmi->dev, ret, "Failed to get clocks\n");
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
[ ... ]
> @@ -681,7 +680,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>  	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_fun=
cs);
>  	ret =3D drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NU=
LL);
>  	if (ret)
> -		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder\n");
> +		return dev_err_probe(dev, ret, "Failed to init encoder\n");
> =20
>  	platform_set_drvdata(pdev, hdmi);
> =20
> @@ -689,12 +688,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>  	if (IS_ERR(hdmi->hdmi)) {
>  		ret =3D PTR_ERR(hdmi->hdmi);
>  		hdmi->hdmi =3D NULL;
> -		return dev_err_probe(hdmi->dev, ret, "Failed to bind dw-hdmi-qp\n");
> +		return dev_err_probe(dev, ret, "Failed to bind dw-hdmi-qp\n");
>  	}

[Severity: High]
This is a pre-existing issue, but does this error path leave a dangling
pointer in drvdata?

If dw_hdmi_qp_bind() fails, the function returns without clearing drvdata.
Because hdmi is allocated earlier with drmm_kzalloc(), it will be
automatically freed when the master DRM device cleans up following the bind
failure.

However, the component device remains bound to its driver, and its drvdata
still points to the freed hdmi struct. If the system then suspends, won't
dw_hdmi_qp_rockchip_suspend() retrieve this dangling pointer and dereference
it via hdmi->hdmi?

> =20
>  	connector =3D drm_bridge_connector_init(drm, encoder);
>  	if (IS_ERR(connector))
> -		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
> +		return dev_err_probe(dev, PTR_ERR(connector),
>  				     "Failed to init bridge connector\n");
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D26
