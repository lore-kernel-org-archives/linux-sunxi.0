Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937D430675F
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771292; cv=none; b=MA/VPNMLhBYfibOEIGe2Aogcv0wzddPHVrWoLJR93yD5hrBHjAcI5DKtXNAZyc+HmtDTQ54VLFOIbtbtY91Tm3oPjPFh0u+fjf+VoP9V/c9QYLyaJnOGTU7LTcKwD6K5D8p/QFdEmIMXrRW2wtn3yj1KBCXXjIQE4E7haD315Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771292; c=relaxed/simple;
	bh=IyS9R8QZHB18ZQPP7xmVVVjbIUcl85fcew2wUO+/GRg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zz/cunjuE7Pe9ME6iEcmGOqKvUtJHmTv7BWvCO6hkX4Rh5tFNMqKDU5lGEA19nj3GPwlc82SEKK9ncScNZWP3choYIeiKeHFqWzJNz3Ege5XZv531pavD/ejoYvSGR93uNWrGNjSM9twk30JVuAEdnxmgc4a2clYOCf0dlsFVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvi8ctWV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvi8ctWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9F01F000E9;
	Thu, 23 Jul 2026 01:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771291;
	bh=Fw4Lagvlba1Ufjzo3WhxE1lQumG23VEHtg/nsGZIaG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cvi8ctWVCqQ+cY1ckDa6/oZz6swPc368dRfwWmzqjhHN5XUl+fCSV9d/ShXJreMlE
	 wYDFb1145Wd1gst09Dshwj84IWiTy3BonCq1p5U6WdaEocEZhiSvkZPQYs8YEXkaBU
	 Qb9EKWzlUxU21Xb2O2K8IrTElPGR6ueG2rtV5FocuzitwLBt0ZfkquaFiYvuIY5aIQ
	 NquHqtWqZsmYXNVCQGQYgWUriwQXqhyIMPGrowPigMOFBUUpzq46wNtqAFJqc2g7gO
	 S2QTxqNw6GFDC+3Cr6jI7CbfhpGSEYfyt9y9Ik7f/+BzNr/iogJ89BnMd1p1iYfOAA
	 NIlZwkVaXN7og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 24/61] drm/rockchip: dw_hdmi_qp: Fix NULL deref in PM
 ops on incomplete bind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-24-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-24-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:48:10 +0000
Message-Id: <20260723014811.1F9F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Use-After-Free in system-sleep PM callbacks due to dangling dr=
vdata pointer when component bind fails or unbinds.
--

--- Patch [24]: [PATCH v9 24/61] drm/rockchip: dw_hdmi_qp: Fix NULL deref i=
n PM ops on incomplete bind ---
commit bcecf290cbabd0264ffa7bbd8cb566bf124348f0
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Fix NULL deref in PM ops on incomplete bind

The system-sleep PM callbacks fetch the driver state via
dev_get_drvdata() and dereference it unconditionally. This patch adds
NULL pointer checks for the drvdata pointer in the suspend and resume
callbacks. It also sets the hdmi->hdmi pointer to NULL on bind failure.

Closes: https://lore.kernel.org/all/20260702151550.8E14D1F000E9@smtp.kernel=
.org/

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9c4cf68d79d50..7c9d26d796642 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -686,9 +686,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *d=
ev, struct device *master,
>  	platform_set_drvdata(pdev, hdmi);
> =20
>  	hdmi->hdmi =3D dw_hdmi_qp_bind(pdev, encoder, &plat_data);
> -	if (IS_ERR(hdmi->hdmi))
> -		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
> +	if (IS_ERR(hdmi->hdmi)) {
> +		ret =3D PTR_ERR(hdmi->hdmi);
> +		hdmi->hdmi =3D NULL;
> +		return dev_err_probe(hdmi->dev, ret,
>  				     "Failed to bind dw-hdmi-qp");
> +	}

[Severity: Critical]
This is a pre-existing issue, but does this error path leave a dangling
pointer in drvdata?

Since the hdmi structure is allocated using drmm_kzalloc(), its lifetime is
tied to the DRM master device. If dw_hdmi_qp_bind() fails, this function
returns an error and the DRM master tears down, which frees the hdmi pointe=
r.

However, since platform_set_drvdata(pdev, hdmi) was already called, this
leaves a dangling pointer in drvdata.

Also, dw_hdmi_qp_rockchip_unbind() completes without clearing the drvdata
pointer, which causes the same dangling pointer when the DRM master is
destroyed.

[ ... ]

> @@ -735,12 +739,15 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resum=
e(struct device *dev)
>  {
>  	struct rockchip_hdmi_qp *hdmi =3D dev_get_drvdata(dev);
> =20
> -	hdmi->ctrl_ops->io_init(hdmi);
> +	if (hdmi) {
> +		hdmi->ctrl_ops->io_init(hdmi);

[Severity: Critical]
This is a pre-existing issue, but does this lead to a Use-After-Free if
drvdata holds a dangling pointer?

Because the error path in dw_hdmi_qp_rockchip_bind() and the unbind function
do not clear the drvdata pointer, dev_get_drvdata(dev) can return a non-NULL
freed pointer.

The if (hdmi) check succeeds on the invalid pointer, and
hdmi->ctrl_ops->io_init(hdmi) will dereference a function pointer from freed
memory. Could this lead to arbitrary code execution if the system is suspen=
ded
or resumed?

> -	dw_hdmi_qp_resume(dev, hdmi->hdmi);
> +		if (hdmi->hdmi)
> +			dw_hdmi_qp_resume(dev, hdmi->hdmi);
> =20
> -	if (hdmi->encoder.encoder.dev)
> -		drm_helper_hpd_irq_event(hdmi->encoder.encoder.dev);
> +		if (hdmi->encoder.encoder.dev)
> +			drm_helper_hpd_irq_event(hdmi->encoder.encoder.dev);
> +	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D24
