Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954324570C3
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293017; cv=none; b=eoioasW/lzTR+aM0T95Km46+hV8lM/lsKRX0enqsmBKM3hgt9DEKnAVK1DVwKp5yT9rWRFWVvxvwk2N/faAwfhznHc3XWPRifx0fQpmGlMs6vahRFZYpNTgbYfuBSUo5695iWndNsJSOivpUIZqqi2lPkWBjUR8Zc6E3cIDVBoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293017; c=relaxed/simple;
	bh=leiUNKYBPbis6v/tLNcSBEl3kG3/E8Wv4Ty7009v228=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o6iwBG2hxFeLFT8TLl+LfOpCcNiKkm0rxCpdUpvfN2LBSGtA0Y11SagpoBN58P3DBVy8OVQ2yc/yyEor/L4WJBrXLney0lq3s/YgDpLaVZYkT/sgp6ZO+KtTCMcljR3Wkzl0jIjEb1VPeJSGuybMAwbplXj6IF4nK9JXmY1y+oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZVzWoKz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZVzWoKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7101F000E9;
	Tue,  1 Sep 2026 20:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293016;
	bh=XSbxaalQOrhIJoAwc2588+xTulo9F1QIUWiQ3fjk/Fg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZVzWoKzT1lwJqnf6LU1NeZ3igmQrfO8kM2Zb23ISrpohZDStaViVn/QaE/yMjwfg
	 yg+zxYFZX1fDXwKlU+6hu0o8XVYFj0cTjxFnzwZ9RBGFBoULF189VkQSE4otI1Rylj
	 DyBGk8EpwzVw4xdvZeTMMUKaTTpyCW9jwfVHef2qqSC8QTKciTgsOS4Y1OHY+mwvuu
	 HryuPMheQjX/bT1P0vFpDwqJCovZcmX3pjwAX416s5R24kj6kLl57dHUWtB02x9C9B
	 yqRCEY0485GpcAJhgOWHxxL2dCXUVgAHn8TNllz2gjTDSANG3Udy0VggP24tnJjWBP
	 /winTENFaBVAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 39/74] drm/rockchip: dw_hdmi_qp: Control the HPD IRQ
 line via the bridge HPD ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-39-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-39-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:03:34 +0000
Message-Id: <20260901200335.EE7101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] devm_request_threaded_irq() is improperly used in a component bind=
() callback, causing resource leaks on unbind() and -EBUSY failures on re-b=
ind.
--

commit 227c25b0617d912242b79d253aafb0a1dcfaa430
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: drm/rockchip: dw_hdmi_qp: Control the HPD IRQ line via the bridge =
HPD ops

The commit changes the HPD IRQ to be requested with IRQF_NO_AUTOEN and mana=
ges
its state explicitly through the bridge HPD ops. It also removes the IRQF_S=
HARED
flag since there are no other users of this IRQ.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index ecf12403101da..1c547016ee009 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
[ ... ]
> @@ -688,14 +709,14 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>  	if (plat_data.cec_irq < 0)
>  		return plat_data.cec_irq;
> =20
> -	irq =3D platform_get_irq_byname(pdev, "hpd");
> -	if (irq < 0)
> -		return irq;
> +	hdmi->hpd_irq =3D platform_get_irq_byname(pdev, "hpd");
> +	if (hdmi->hpd_irq < 0)
> +		return hdmi->hpd_irq;
> =20
> -	ret =3D devm_request_threaded_irq(dev, irq,
> +	ret =3D devm_request_threaded_irq(dev, hdmi->hpd_irq,
>  					cfg->ctrl_ops->hardirq_callback,
>  					cfg->ctrl_ops->irq_callback,
> -					IRQF_SHARED, "dw-hdmi-qp-hpd",
> +					IRQF_NO_AUTOEN, "dw-hdmi-qp-hpd",
>  					hdmi);
>  	if (ret)
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but dropping the IRQF_SHARED flag
here exposes a pre-existing resource leak as a hard failure during re-bind.

Because devm_request_threaded_irq() is used in the component bind() callback
(dw_hdmi_qp_rockchip_bind()), the IRQ allocation is tied to the platform
device, not the component lifecycle. When the component is unbound (e.g., v=
ia
sysfs or DRM master unbind), the IRQ is not freed.

Previously, with IRQF_SHARED, a subsequent re-bind would succeed despite
leaking another registration. Now that IRQF_SHARED is removed, if a user
unbinds and then re-binds the component, won't devm_request_threaded_irq()
fail with -EBUSY, breaking the display driver until a full module reload?

Could this be fixed by using request_threaded_irq() and explicitly freeing =
it
in the component unbind() callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D39
