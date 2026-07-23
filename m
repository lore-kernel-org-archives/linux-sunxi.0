Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307E430E84D
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771318; cv=none; b=IjvAE7SnIxtLflx31TLB8UtuVG+SKOVXvxVIHwjoXhNti/CrUQLc0Z2C+mUmrgs7sCqyUqqBnxeMJPJIsC5JzsOCUl7DDT7d14y8Ezcs9X1v9lukxqXfjJ9rQeYggBhbkMf3euLgFM1yYx1or73MJIOcR700+A0rXQsVq6cy3Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771318; c=relaxed/simple;
	bh=qypAdYRz2yn5IRcxUO7Z8SaZki0bEJhf6FeOIsJQ1i4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QTN4ptlWN0ATKnsRj8Fsai9SRgPmknFZ32xgt4XF9hqI3gScFIlDdw5bqE6rhBskbbEa+nrbF41RZkOV3oXJU7KsNKBSc0bzCJMgYQ/rcZD+W3yWkHBx9lGrY9RhJCUAd1LfdzUaSVfhHYLlXgSH1sSjZF000uFV3mLp4fFeZ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiDvUf5q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiDvUf5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D601F000E9;
	Thu, 23 Jul 2026 01:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771317;
	bh=UzO6x8bOH730sBsnprJ4tCFfCtAaZNg9hfdjU9RDQ6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SiDvUf5qg537wa5Sm+EUTJsB2bOrI9+sBvlyQb/prRJV2pf8wn3+RdJNQOiemWNqz
	 0yKUZaFXFIVydjsdJDP6eKedl95RGAqn9oC2BqNwwHGdOgHxqoqLOUPJ5YvQ25Xhqx
	 KenguSs4Q2NXLu14XQ8SaF9CX8aYQI8zhWcjzV1ri3Sb/x3njj7zk0RXsO8Egmdtsf
	 IRNV4oeTRSmc5ZSqPwFDNDo2KpWeavOJ+W+JkRf4vfpHA8HeJll821A1w12MS0EMbo
	 RWJLCFmtn8Ydg6EiPFa/bJkWOup5YU8drPKnnFjHiQOz+6WXtYPBXBAUVab1HYzPQG
	 aI4w2eELRwPZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 25/61] drm/rockchip: dw_hdmi_qp: Add missing newlines
 in dev_err_probe() messages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-25-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-25-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:48:36 +0000
Message-Id: <20260723014836.C4D601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dangling pointer in drvdata leads to Use-After-Free during system =
suspend/resume.
--

--- Patch [25]: [PATCH v9 25/61] drm/rockchip: dw_hdmi_qp: Add missing newl=
ines in dev_err_probe() messages ---
commit 999c1afbb80ca84beaa74359eb4e6c431826da22
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Add missing newlines in dev_err_probe() messages

This commit adds missing trailing newlines to a couple of dev_err_probe()
calls in dw_hdmi_qp_rockchip_bind().

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 7c9d26d796642..369f1066dabe8 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
[ ... ]
> @@ -681,7 +681,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>  	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_fun=
cs);
>  	ret =3D drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NU=
LL);
>  	if (ret)
> -		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder");
> +		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder\n");
> =20
>  	platform_set_drvdata(pdev, hdmi);
> =20
> @@ -689,8 +689,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>  	if (IS_ERR(hdmi->hdmi)) {
>  		ret =3D PTR_ERR(hdmi->hdmi);
>  		hdmi->hdmi =3D NULL;
> -		return dev_err_probe(hdmi->dev, ret,
> -				     "Failed to bind dw-hdmi-qp");
> +		return dev_err_probe(hdmi->dev, ret, "Failed to bind dw-hdmi-qp\n");
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to a
use-after-free during system suspend?

Because hdmi is allocated with drmm_kzalloc(), if dw_hdmi_qp_bind() or
drm_bridge_connector_init() fails later in this function, the DRM framework
will automatically free the memory. However, platform_set_drvdata() has
already stored the pointer, and it is never cleared in the error paths or
in dw_hdmi_qp_rockchip_unbind().

During system suspend, dw_hdmi_qp_rockchip_suspend() fetches this pointer:

dw_hdmi_qp_rockchip_suspend() {
        struct rockchip_hdmi_qp *hdmi =3D dev_get_drvdata(dev);

        if (hdmi && hdmi->hdmi)
                dw_hdmi_qp_suspend(dev, hdmi->hdmi);

        return 0;
}

If the pointer was freed, does the if (hdmi && hdmi->hdmi) check operate on
freed memory?

> =20
>  	connector =3D drm_bridge_connector_init(drm, encoder);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D25
