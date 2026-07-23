Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C762F8EB3
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771750; cv=none; b=u8dzUhtOkjUpLliaPzkSXaN2huWjR4EiOHErAVdQYI/dIfXCpnPoFyobrO9UNPBdk+VwjCG4z5f1jsQh2w/MAgFKCaGJG8MvS+zoqPhejmO4MrGLf1ZjFjsefgNhIBIGiaZvl9k2AUXc7pqCVGCCZnzisvWVVXxwr4HJ6aPcBiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771750; c=relaxed/simple;
	bh=35UUGspQwGxb8yaAqgf7MHOBgMhOkbw4DBsTUXDxSVs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LG+cVd9Jss53D0bVigcJRM7w8FINypYx6HRQ2eMyHVc836XOfwIE3zkkU0rGnh+r46DcJSaQagqj1SluRvPORUSF4zFBZPvAgqVxCfspeDwq0I14zw3L5Fm3T/rrRRWQarJ68kqO+etcRnBSBz/vOsb/qIzZu7YX8MJ6SCjFT6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBDmxs0T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBDmxs0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B331F000E9;
	Thu, 23 Jul 2026 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771749;
	bh=0FXp1WbbR6jJ1xktq1Ard0VHYiHpePtLsYhQtudB9mc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HBDmxs0T+8McucLpw062OdnThyHjtZufpBGh0BNZI5x8yOLwfaPz3U6YXejsUC+6X
	 4wz5g90d9NnywxLDo7OxFVWXIuhn5Jvsep8LO/pN11ni/WDx8lNc5baZnevqif/OuJ
	 E+G3rcdZ+zHF0aLhxHzdLVCvnBgaRPmmh2GZNnuHxoXR17noF5NPMZHsyhzdhNIbWe
	 Xtjg24g6eo85wYECdHGLsYjIo6sv3MmwKnlYAKjeZ/f7yvZb5wtuKn/RRlFRe0+TIr
	 KoSpnqtmpNBr+Rx/oApiSRpdb+rMbZon1THQNI0oRDDRZ8HDQkAqhpgEcFyCIbiJYI
	 buAZG8X9oBSLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 28/61] drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD IRQ
 in io_init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-28-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-28-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:55:48 +0000
Message-Id: <20260723015549.00B331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Incomplete/Defeated HPD Interrupt Deferral Implementation

Pre-existing issues:
- [High] Use-After-Free and resource leak due to mismatched drmm/devm compo=
nent lifecycles
--

--- Patch [28]: [PATCH v9 28/61] drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD =
IRQ in io_init ---
commit 14fe26855150a57c0302feac3b2461064deead56
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date:   Thu Jul 23 01:35:17 2026 +0000

    drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD IRQ in io_init
   =20
    Start with HPD masked, matching RK3588, so the bridge framework controls
    when interrupts are armed via hpd_enable().

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 7e3e86d056116..12cd8db7cc50b 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -432,7 +432,7 @@ static void dw_hdmi_qp_rk3576_io_init(struct rockchip=
_hdmi_qp *hdmi)
> =20
>  	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON14, val);
> =20
> -	val =3D FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0);
> +	val =3D FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1);
>  	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
>  }

[Severity: Medium]
The commit message states the goal is for the bridge framework to control
when interrupts are armed, but does this actually happen?

It looks like the required .enable_hpd and .disable_hpd callbacks are
not implemented in rk3576_hdmi_phy_ops:

static const struct dw_hdmi_qp_phy_ops rk3576_hdmi_phy_ops =3D {
	.init		=3D dw_hdmi_qp_rk3588_phy_init,
	.disable	=3D dw_hdmi_qp_rk3588_phy_disable,
	.read_hpd	=3D dw_hdmi_qp_rk3576_read_hpd,
	.setup_hpd	=3D dw_hdmi_qp_rk3576_setup_hpd,
};

Without these callbacks, the bridge framework's attempts to unmask HPD
will be no-ops.

Furthermore, dw_hdmi_qp_init_hw() in drivers/gpu/drm/bridge/synopsys/dw-hdm=
i-qp.c
unconditionally calls .setup_hpd() during bind:

	if (hdmi->phy.ops->setup_hpd)
		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);

And dw_hdmi_qp_rk3576_setup_hpd() writes 0 to the mask bit, overriding
the mask set here in io_init:

	val =3D (FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_CLR, 1) |
	       FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0));

Does this completely bypass the intended deferral and leave the interrupt
armed immediately during bind?

[Severity: High]
This is a pre-existing issue, but is there a use-after-free risk during
unbind due to mismatched lifecycles?

The context structure is allocated tied to the DRM master's lifecycle using
drmm_kzalloc() in dw_hdmi_qp_rockchip_bind():

	hdmi =3D drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);

However, the HPD interrupt is requested using devm_request_threaded_irq()
on the component device, which outlives the DRM master across unbinds or
probe failures:

	ret =3D devm_request_threaded_irq(dev, irq,
					cfg->ctrl_ops->hardirq_callback,
					cfg->ctrl_ops->irq_callback,
					IRQF_SHARED, "dw-hdmi-qp-hpd",
					hdmi);

The component unbind function fails to explicitly free the IRQ:

static void dw_hdmi_qp_rockchip_unbind(struct device *dev,
				       struct device *master,
				       void *data)
{
	struct rockchip_hdmi_qp *hdmi =3D dev_get_drvdata(dev);

	cancel_delayed_work_sync(&hdmi->hpd_work);
}

If the DRM master unbinds, the DRM device is destroyed and hdmi is freed.
Will the IRQ remain active on the component device and dereference the
freed hdmi pointer if the interrupt fires?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D28
