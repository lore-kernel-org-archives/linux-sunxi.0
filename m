Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A037C93C
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532443; cv=none; b=ahkVBAPqXWVR4g/7oRasgO3N8Nh+og9S+1IZMYjeCrrp1brF/RvrXeOu3RAWmz7T01RKD+un+Awdcyoqgtf2c7L/N980PTMtZxvCZX3rJEcV1g0vCT63JB6Sm7BSrWa6zcf4h2EbHj88FV2mx5AIngrH1PF8d1c58hAQaOr3yKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532443; c=relaxed/simple;
	bh=v2VVXaRQXaVZiXsz+ed8A2d4rGand7DnuvpAPtmIyXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OY02uU7982ba9Z8r4m5yvQ4pLhZj07Y3J8E4OOtrNJx1RhlPp79UuB7on3x/+JTNyUyS/u3RVX/hF3cZ7LA1JvZgynsayai8hM9nRSHgycxh458C7RyXOiNnxDp7zhqxC9XcJ54YzfRPgjxG9tjbAHPp4WUUA8nIckWXEI1TIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4dGNBqt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4dGNBqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2891F00AC4;
	Fri, 31 Jul 2026 21:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785532441;
	bh=0+PsXSi9WOoj167CExU1ZB74WXeNBYQvaj4DuB3jRnc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4dGNBqtxZVYL/XkcIlXhJnvFrCwv9vsHn/VfcLGae5RBXcXaqeBYuxq47bx3Qpe2
	 Q97OUIrKBR4CpWoybyJK8oiiNEUMlY8ep4DR+2klfS5XkzZg8B6bhNFRbYnBsGIk/U
	 qszFMk9VbLcYtEc2kElNznp6VTgEsZ0Aq9vF0Q1lj0rsRrabfj0q6vprymCA6Y/s6R
	 fUwp76TYN7QsoYQfSMkSF5+MvPRGFEFqcY8O3hZ3vDeti9jqgOY9uQM25eH+XSYV/o
	 td7CM7s55WsUq2CW9B9JwlxYPNcQFG2xg2m6CQrnle9ZeAawybUSrqK/qe3Zl07Egw
	 zqJVwpSC7rLlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 34/69] drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD IRQ
 in io_init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-34-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-34-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 21:14:00 +0000
Message-Id: <20260731211401.4D2891F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Logic error: HPD interrupt is unconditionally unmasked during `s=
etup_hpd`, defeating the patch's intent to defer arming to the bridge frame=
work.

Pre-existing issues:
- [High] High-severity Use-After-Free and resource leaks due to improper us=
e of `devm_*` APIs in the component `bind` callback.
- [High] RK3588 HPD IRQ handler clears the interrupt status a second time w=
hen unmasking, causing potential loss of hotplug events.
--

--- Patch [34]: [PATCH v10 34/69] drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD=
 IRQ in io_init ---
commit 1e56140d6c0038883d14ac31b8ac46f871e3f59e
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD IRQ in io_init

This commit masks the HPD interrupt during I/O initialization for RK3576,
intending to defer interrupt arming to the bridge framework.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
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
Does this change actually defer the interrupt arming?

Looking at dw_hdmi_qp_rk3576_setup_hpd() in the same file, the interrupt
appears to be unconditionally unmasked later during hardware initialization:

drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rk3576_setup_hpd(=
) {
    ...
    val =3D (FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_CLR, 1) | FIELD_PREP_WM16(=
RK3576_HDMI_HPD_INT_MSK, 0));
    ...
}

Additionally, it appears that rk3576_hdmi_phy_ops lacks the .enable_hpd and
.disable_hpd callbacks. Can the bridge framework actually control the
interrupt without these callbacks implemented?

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free
in the component bind/unbind lifecycle.

In dw_hdmi_qp_rockchip_bind(), devm_request_threaded_irq() is used to
allocate the IRQ handler on the platform device:

drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rockchip_bind() {
    ...
    ret =3D devm_request_threaded_irq(dev, irq, ...);
    ...
}

However, the dev_id passed is hdmi, which is allocated via
drmm_kzalloc(). Since devm_ resources are tied to the device probe/remove
lifecycle rather than the component bind/unbind lifecycle, the IRQ is not
freed in dw_hdmi_qp_rockchip_unbind().

If the master unbinds, the drmm memory is freed, but the IRQ handler remains
active. Could an interrupt firing after unbind cause a use-after-free when
it accesses the freed hdmi pointer?

[Severity: High]
This is a pre-existing issue, but does dw_hdmi_qp_rk3588_irq() accidentally
clear the interrupt a second time when unmasking?

drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rk3588_irq() {
    ...
    val |=3D FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_MSK, 0);
    regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
    ...
}

Because this uses a bitwise OR, val retains the RK3588_HDMI0_HPD_INT_CLR
write-enable mask and data bit from earlier in the function. Does this
second regmap_write() clear the interrupt again, potentially losing hotplug
events that occurred between the two writes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D34
