Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AA23BF662
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 19:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292530; cv=none; b=dDCvuP53BcJTMezKLzDVIDzKI53T6T5GjTufIZHdRyAUVmRs3XIb3cPEyP5vb4t83YQb+gqNjH6YqjUa+a0nQQ8Jb7s9/8eseb4i2ghusokoPVAaiaeWsRvikhrQY8acbCd+Zd0stdT/qnLlTqbgVGTAJ1oNgyGzQM0MFrb59kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292530; c=relaxed/simple;
	bh=rNmjp5qbL0Em521N/KdyKOqM5DzoKB8DSA0/Eo+vsRM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SbNbptBUXCOfqMKAL3gP9h5dnwkmsnAL9JMPeJKUlJs40CKLj18YpALdGK4OqPXwruHidwNbwC5oZ0UpYDDh9L+wT28Hvj3t/Myhfae2Ozqj/NUUfFO0meyPlM7TQWljlAx3MDwfqlE2xMeid14f7bWMRS5bOWlsyD/RK+2S5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItONi/99; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItONi/99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFD21F000E9;
	Tue,  1 Sep 2026 19:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292529;
	bh=+9eyGdDYzx+utB1WvkIlNywy4iOJVFHEAHXbVDEEeoQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ItONi/99A2GatKYWEFfdezCWMoOFhm828Cl6e1V9DE2mHpWuIYwAp/hfEkXrIMKiN
	 Wz9gPapoUpsUbIV5VSZ+EvuTKAQ6rci7PQHyBmDPAlTGOYB11dxhtV3Vr3g+iii1Ty
	 29v225o2VOOdZyqxEJN9ARVmkvil26QxN9noMB21fwhFoHVJarM4YTAaVZ+k7/VIAy
	 Ou+h5WAHSj+/pHVhDrDbRMoppAIAWnEZde8stcy99sTmO2zfp5FMGTWQN7qNP4AM05
	 HuUOLUuEl+T8IPZ8riH7bCz0BDvAzy2RF+J/stDc0A2LZaBI5XC0D+k7JeEuzbjVFU
	 iQY2Xb3nVJ5ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 38/74] drm/rockchip: dw_hdmi_qp: Factor out HPD
 interrupt (un)mask helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-38-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-38-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:55:28 +0000
Message-Id: <20260901195529.1CFD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free and resource leak due to devm_ usage in component b=
ind
--

commit cea67879af1ca4ad52b13c14999be678a504386f
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Factor out HPD interrupt (un)mask helpers

Extract the GRF-level HPD interrupt mask/unmask register writes into
dedicated dw_hdmi_qp_rk35{88,76}_{mask,unmask}_hpd() helpers, and use
them from the .enable_hpd()/.disable_hpd() phy ops as well as the
hardirq, threaded re-arm and io_init() paths.

This is a preparatory refactor that separates the SoC-level HPD mask
from the phy op entry points, so a subsequent change can gate the
platform HPD IRQ line without affecting the debounce paths.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9e48ec06eb660..ecf12403101da 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c

[ ... ]

This is a pre-existing issue, but I noticed a potential problem in
dw_hdmi_qp_rockchip_bind():

drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rockchip_bind() {
...
	hdmi =3D drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
...
	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
...
	ret =3D devm_request_threaded_irq(dev, hdmi->hpd_irq,
					cfg->ctrl_ops->hardirq_callback,
					cfg->ctrl_ops->irq_callback,
					IRQF_NO_AUTOEN, "dw-hdmi-qp-hpd",
					hdmi);
...
}

[Severity: High]
Can this component bind sequence result in a Use-After-Free?

The hdmi structure is allocated with drmm_kzalloc() on the master DRM
device, meaning it is freed when the master DRM device unbinds.

However, the IRQ is registered using devm_request_threaded_irq() on the
component platform device (dev).

Because devm_ resources are tied to the platform device's probe/remove
lifecycle rather than the component bind/unbind lifecycle, they are not
freed during component_unbind().

If the master device unbinds, the hdmi structure is freed, but the IRQ
remains active with a pointer to the freed memory.

If the IRQ fires after unbind, will it access the freed hdmi struct?

Additionally, are the devm_ allocations in the component bind leaked on
every component unbind and re-bind sequence?

Since devm_clk_bulk_get_all_enabled() is tied to the component device,
won't these clocks be leaked when the component unbinds and re-binds?

A similar issue appears in dw_hdmi_qp_bind():

drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:dw_hdmi_qp_bind() {
...
	hdmi =3D devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
				     &dw_hdmi_qp_bridge_funcs);
...
}

[Severity: High]
Does this code leak the bridge structure every time the component is
re-bound?

Because devm_drm_bridge_alloc() is called on the component device, it
appears this memory will not be freed during component unbind.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D38
