Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0805369D55
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 20:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530320; cv=none; b=W3F+nsQxla4fP64EwApXcnDv5JlnXrT9GZG8M2dDfDWV+8DyeMegKnw/ImH0pfdxaIof3NBU5S0/lPSoJ/wkl08/RgfbVDplnW+GNvXmXCTVTpvKq421Qa69bb9c929P9Jkx3Jojs8IxMSSEWXJdco/Sid1h1ploJ2WPSAsRhfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530320; c=relaxed/simple;
	bh=dpN83SnLbjVQXqe+VbzN2XEMHN821FX9Avwcz24O7bo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DocbwzKY0ZdMB8HcOX5Nvh9vCjk9Iw6LbDRiHHBIzo3KhVDu5KB2PU+T0jb2uRNbNvk9RT8oSGkq7qVWomJVxGqabjeVkrd9SZ0DqTkzGmxQzY4R5uQfgLZNMdX1yvSnEia/eknWYlOG9NegB3PG78M3DQCUKW29DXX0uH7jvB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnJ3OSYw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnJ3OSYw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368561F00AC4;
	Fri, 31 Jul 2026 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785530319;
	bh=FcHTgj0FjiiqQNxBUceCySXuTKLdfxQa4oLhA1pqPcA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RnJ3OSYwdK6evyt/7IBnYxWLUUtYEvCUdY2OT+QyNqJB99iJN4Vmlm581ph5rhnxW
	 /OhDjvaD6XpO75+WzMXr05JG6ICww3Cqc92qMEnSmBSIYfO53GHga4+1HgkxIgL2wJ
	 qwqWl18AumWLlElB509pz6v/GJjwh45mZhKjq/lrqNwMlaTwaXgf6R5SulDPP60dXa
	 5bgmwO98ZLBeOysBbkV3H7vJr9klij8ce8FoAtGOdVWQh1Md+auMC6yFuFFHxtK8WS
	 TqwXgHL+oSqPr4fExJ8fWCPSkTjqIRRMfAx4VWreg55jTNz8OecE4MenfiCJn+5b7V
	 rkPSWapQV1hSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 31/69] drm/rockchip: dw_hdmi_qp: Add missing
 newlines in dev_err_probe() messages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-31-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-31-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 20:38:38 +0000
Message-Id: <20260731203839.368561F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Using devm_ APIs on the component device in the bind callback caus=
es resource leaks and a use-after-free on unbind/rebind.
- [High] The dw_hdmi_qp library lacks an unbind function, causing permanent=
 resource leaks when componentized drivers unbind.
--

--- Patch [31]: [PATCH v10 31/69] drm/rockchip: dw_hdmi_qp: Add missing new=
lines in dev_err_probe() messages ---
commit 5dd7ce4a56ed7d72cce118d1d9700cdba6b578d8
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Add missing newlines in dev_err_probe() messages

This commit adds missing trailing newlines to a couple of dev_err_probe()
calls in dw_hdmi_qp_rockchip_bind().

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index e9fda67b8ca94..8b48558deb3e7 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -681,12 +681,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>  	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_fun=
cs);
>  	ret =3D drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NU=
LL);
>  	if (ret)
> -		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder");
> +		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder\n");
> =20
>  	hdmi->hdmi =3D dw_hdmi_qp_bind(pdev, encoder, &plat_data);

[Severity: High]
This isn't a bug introduced by this patch, but does dw_hdmi_qp_bind() leak
resources on component unbind?

dw_hdmi_qp_bind() allocates multiple devm_ resources on the component device
such as memory, regmaps, shared IRQs, and bridges. Since the dw_hdmi_qp
library lacks an unbind function, these resources are never freed when the
DRM device unbinds.

On rebind, new duplicate resources will be appended to the component device=
's
devres list, leading to unbounded memory growth and multiple shared IRQ
handlers firing concurrently.

[Severity: High]
This is a pre-existing issue, but does mixing drmm_ and devm_ allocations in
this component bind callback create a lifecycle mismatch?

Earlier in this function, the hdmi structure is allocated with
drmm_kzalloc(), but devm_request_threaded_irq() is called on the component
dev (which hasn't unbound).

When the user unbinds the main DRM device via sysfs, component unbind
destroys the DRM device and frees the hdmi structure. However, the IRQ
remains registered on the component device. If an interrupt fires, the
handler will access the freed hdmi pointer.

Additionally, dw_hdmi_qp_rockchip_unbind() only calls
cancel_delayed_work_sync(), leaving devm_ resources accumulated on rebind.

>  	if (IS_ERR(hdmi->hdmi))
>  		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
> -				     "Failed to bind dw-hdmi-qp");
> +				     "Failed to bind dw-hdmi-qp\n");
> =20
>  	connector =3D drm_bridge_connector_init(drm, encoder);
>  	if (IS_ERR(connector))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D31
