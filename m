Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A684E43BDBE
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 19:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292217; cv=none; b=nFcYMoxMu68HMTcKKAdDA1lDklylqYdKykiNHaSysQq39fEHR+zA+5pE+Frzv0Iuv/QQnd+QlvwkAOEosDieMCbkQkxvuojiRzYXz77kFe+tYYuoG6TVhC5lpx8t6xiXqTI6QMKCbJbfM10Hm0pRu4zowpfU+hP3gX4/1RU4WRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292217; c=relaxed/simple;
	bh=Iy0qhy8GWB4zqmNDj7M1EfUySGP7uC1MOqrkhE61s6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bAlL6aoio93izAG4twFSwwKM5waogR0Fu4p1Bep9+yDnPb+NjSGhKTDlTfWtdHOu2l4OlNZc8qISW4B1TbPKrIadqRrc9Igy7NRL3+dYNlmeubqTpc2OomfId30+Tpfv1B9GS+2Zp/d72CV0kgLJVeMP9W8+sp9rkOshy2LiHWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCnLgsV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCnLgsV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085751F000E9;
	Tue,  1 Sep 2026 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292216;
	bh=LNB6mCwfycAE3mE4jEYceLSAgZl/L0RsMy63uKYcOjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VCnLgsV/M8U55BuY3MFrU8DHfrig6w3ceF73CSHwjg6BPri2hxt3prr+FjM1xxwfo
	 XEIThYGoXL0YHflw9bfYMoULnhnHa9Py7H85Plf9OB/GT0zp7NsqLxiaxFQEPJJmfF
	 o/1SC4gKp6CUa68uGtz6u1hcCLC5Uc+ZSANlHnTaVJHZI4WZn1nrmzfOO9K5FnR8BL
	 MeLYC5JQWs+OD/H4TtgnIibKvRF6TZG5XyqA1KaMTRGYpU72ekpwWkThaX7PV+yJDg
	 wOqdCwtq5BaNVw61fda7vZs4dlUbjRXwi/oSeWZq0V7JLYOjEgKUkYh2+8SnOGllIr
	 QulL8p+hkAd+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 36/74] drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD IRQ
 in io_init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-36-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-36-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:50:15 +0000
Message-Id: <20260901195016.085751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Component bind function leaks devm resources and creates use-after=
-free conditions with IRQ and workqueue.
--

commit 44b7706481ee59b636405417779ad4e2c3cd6fc8
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD IRQ in io_init
   =20
Start with HPD masked, matching RK3588, so the bridge framework controls
when interrupts are armed via hpd_enable().

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index dff4002331546..bcfa6646546eb 100644
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

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing issue
in the component bind function:

drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rockchip_bind() {
[ ... ]
	hdmi =3D drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
[ ... ]
	ret =3D devm_request_threaded_irq(dev, irq,
					cfg->ctrl_ops->hardirq_callback,
					cfg->ctrl_ops->irq_callback,
					IRQF_SHARED, "dw-hdmi-qp-hpd",
					hdmi);
[ ... ]
}

Does this code create a use-after-free condition on unbind?=20

The hdmi context is allocated with drmm_kzalloc(), which ties its lifetime
to the DRM master device. However, the IRQ is requested using
devm_request_threaded_irq() on the component device.

When the DRM master is unbound, the hdmi context is freed, but since the
component device remains, the IRQ is not freed. If the IRQ triggers after
unbind, will it access the freed hdmi structure?

Additionally, if the driver unbinds and rebinds without being completely=20
removed, will the devm_* allocations leak and cause=20
devm_request_threaded_irq() to return -EBUSY, permanently breaking the driv=
er?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D36
