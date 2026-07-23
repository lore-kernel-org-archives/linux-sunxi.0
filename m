Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95EB283FDD
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771494; cv=none; b=I6skIvCuNPnxSLQc2r73OKMpgikT9xi4WVj4brocABl9ZodSqc7h36GigJCzrult9m3gB6eG1CpXLehmU6yHYkBIzXvTWJGWboWPfrCTGTANOXtvrEhjC+/ldHbNKxnBs6ttovpUR30er22IeLHEzKPYMu+IZV4v6CbCf3Xo9Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771494; c=relaxed/simple;
	bh=2pahczy7mlKcMa5nKWIu+UbknVH5YvS6vEv+gbmBROs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mBlTjE/qqXUgA495/C1xMmdtkQF5SyVjD2Ip13d59btK/e4oub8rpVluD8kiMpEntjjgD2kEQMhwXMk6wssdT/fNiTTxSwHkSeS+7WIOyf7qhh6cX1/CrEIYcKt1grc1xN68Z94A7BQWG+zZUvRvvXaMgIdr9vtwvMcAZMzVBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9KF3yPO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9KF3yPO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0561F000E9;
	Thu, 23 Jul 2026 01:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771493;
	bh=yK8dZkZDgZz/rowkGvL7dSgIrXxpohN837PBMgSYhiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R9KF3yPO7h72HM7V2mHO8q2noICNLtC9YbcnhGLMWDEwy+C1ytLhz7qISBJT3aQdq
	 izz/49Y8lwjYNA8hB594kXB7OwNlXetFfMrDZcYmfeyvSZv6sI1KNPCRnHHAYtzVLm
	 yu/Xj7TRalkHIR3SjmyX29iqQ0KsVKlcmlIhPbeonObtsiWpmYsDv/yaeimlLstRf6
	 ug1n2qUgmlDi1syDyUVNxqyI5PA0Irnwd3V+i2Z4lSMoUEVlp9qCXYFF++TysTKIJK
	 qk3h7iUojhQ/PxC0AbjohOluVHf9QAUFP2Bnu2nmNzHaBhV6/8DWtrJs2PhMgrNbBn
	 1IpCMUU55eKtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 27/61] drm/rockchip: dw_hdmi_qp: Avoid spurious HPD
 IRQ thread wakeups
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-27-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-27-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:51:32 +0000
Message-Id: <20260723015133.1C0561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free and resource leaks in component bind due to mismatc=
hed devm_ and drmm_ lifecycles.
--

--- Patch [27]: [PATCH v9 27/61] drm/rockchip: dw_hdmi_qp: Avoid spurious H=
PD IRQ thread wakeups ---
commit fe0521a96f0ae3fca18406e54bcdc6ddbecf6e85
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Avoid spurious HPD IRQ thread wakeups

The RK3576 and RK3588 HPD hardirq handlers read shared status registers
and currently wake the threaded handler whenever any bit in those
registers is set. This commit masks the status value with the SoC-specific
HPD interrupt bit to avoid spurious IRQ thread wakeups.

Link: https://lore.kernel.org/all/20260702151346.5A4EC1F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 2aceff11d14b5..7e3e86d056116 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c

[ ... ]

> @@ -381,6 +384,8 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq,=
 void *dev_id)
> =20
>  	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &intr_stat);
> =20
> +	intr_stat &=3D hdmi->port_id ? RK3588_HDMI1_OHPD_INT : RK3588_HDMI0_OHP=
D_INT;
> +

[Severity: High]
This is a pre-existing issue, but could this handler trigger a use-after-fr=
ee
after the component is unbound?

It looks like dw_hdmi_qp_rockchip_bind() allocates the hdmi context using
drmm_kzalloc() (tied to the DRM aggregate device), but registers this IRQ
handler using devm_request_threaded_irq() (tied to the platform device):

drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rockchip_bind() {
    ...
    ret =3D devm_request_threaded_irq(dev, irq,
                                    cfg->ctrl_ops->hardirq_callback,
                                    cfg->ctrl_ops->irq_callback,
                                    IRQF_SHARED, "dw-hdmi-qp-hpd",
                                    hdmi);
    ...
}

When the DRM component unbinds, drmm_ frees the hdmi struct. However, since
the platform device itself isn't removed, the devm_ allocated IRQ handler
remains active.

If an interrupt fires after unbind, wouldn't dw_hdmi_qp_rk3588_hardirq()
dereference the freed hdmi pointer when calling regmap_read()?

Should dw_hdmi_qp_rockchip_unbind() manually free the IRQ and other resourc=
es,
or should the IRQ be registered with a drmm_ wrapper instead?

>  	if (intr_stat) {
>  		if (hdmi->port_id)
>  			val =3D FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_MSK, 1);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D27
