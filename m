Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93E470EAB
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771951; cv=none; b=ZH72hESgVGo5l846tKzIzsXQI9ROgBcS5otm0EYdziR6RCsMmVuyH4F/Ot3y1aVjZuOEMRVzDZiBtH59jIl5eciKSDsLlbR345zymrxfSXNRnUrFbV3gxwEmi4qt+nQ/UxO1oeih1PNCSUnRBvoYydTSRyfWDBeJvVgIhXlxpSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771951; c=relaxed/simple;
	bh=kIe97NRbB0ljrDp+rsfojfHSSpCiNl2Aq9SvnzJbwcU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BdCPPn9gz70YpO3ErGh6aE17aUfwPePpAObM82KEkm77Y4pZZSEpPPSWJ5JsAWkFp6eS8JR33nwG+4QiERpE2+v+tBR/tftooPB/hQxlZIS4j2iMHfq3bwBkuKIZ0NTxdCrFwWu+ECi92JG6NcVrklMZkvgsqmT3cNlXK/vYmKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vr7yOV/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vr7yOV/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F79A1F000E9;
	Thu, 23 Jul 2026 01:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771949;
	bh=IjBr7boVj4c8ABH3KPjMnf5kuNBomzupq5CTDtiQ8Fw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vr7yOV/FlhQXsCVoxSFolBpPKkAH/530kuY6VnXmE+8JZ3AvgkO96KXxnKlcMsRFe
	 +qm9ZK7YNkR1as4GipDMZQZ08m6Hj59+5sXwXBFthRvPQxknqsTvuhTlcKbrrhGf/c
	 DnUIblm80XGqeze0Z5eoCUjURzw7rMry5DoMOIWpCKRLVD5IAz+hePJjQHzRbnYu15
	 YLK+X+q6N8+MJA6rq0CJ7u62myeNSANywnyMbi8YYxMVafT9CKkmCa3pQgQu4UJS4k
	 5CWOB6Zi3hH2vVW9oxCycCycV+uARUH5CvuwIb/8XwoQrvEtRvysoLiEaBGUP55CUK
	 tWXvPKABHzfnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 31/61] drm/rockchip: dw_hdmi_qp: Control the HPD IRQ
 line via the bridge HPD ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-31-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-31-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:59:09 +0000
Message-Id: <20260723015909.7F79A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Delayed HPD work is not cancelled when HPD is disabled, risking ex=
ecution while the display pipeline is suspended or disabled.
--

--- Patch [31]: [PATCH v9 31/61] drm/rockchip: dw_hdmi_qp: Control the HPD =
IRQ line via the bridge HPD ops ---
commit 1832550496f2064373166520bd5d2d00accd260b
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Control the HPD IRQ line via the bridge HPD ops

This commit changes the HPD interrupt handling to request it with
IRQF_NO_AUTOEN and enables/disables it dynamically through the bridge
hpd_{enable,disable}() callbacks.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index cdddbbb8b80b2..534a2c8da2a0a 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c

[ ... ]

> @@ -308,12 +309,14 @@ static void dw_hdmi_qp_rk3588_enable_hpd(struct dw_=
hdmi_qp *dw_hdmi, void *data)
>  	struct rockchip_hdmi_qp *hdmi =3D (struct rockchip_hdmi_qp *)data;
> =20
>  	dw_hdmi_qp_rk3588_unmask_hpd(hdmi);
> +	enable_irq(hdmi->hpd_irq);
>  }
> =20
>  static void dw_hdmi_qp_rk3588_disable_hpd(struct dw_hdmi_qp *dw_hdmi, vo=
id *data)
>  {
>  	struct rockchip_hdmi_qp *hdmi =3D (struct rockchip_hdmi_qp *)data;
> =20
> +	disable_irq(hdmi->hpd_irq);

[Severity: High]
This isn't a bug introduced by this patch, but does this leave the scheduled
delayed work running?

When the DRM core disables HPD during suspend, disable_irq() waits for the
threaded interrupt handler to finish, but the scheduled hdmi->hpd_work is n=
ot
cancelled. If an HPD interrupt occurs right before suspend, the delayed work
might execute 150ms later while the display pipeline is suspended or disabl=
ed.

Could this access hardware registers (like GRF) after clocks or power domai=
ns
have been disabled, and cause a system hang? Would it be safer to add
cancel_delayed_work_sync(&hdmi->hpd_work) here in the disable callbacks, or=
 in
dw_hdmi_qp_rockchip_suspend()?

>  	dw_hdmi_qp_rk3588_mask_hpd(hdmi);
>  }

[ ... ]

>  static void dw_hdmi_qp_rk3576_disable_hpd(struct dw_hdmi_qp *dw_hdmi, vo=
id *data)
>  {
>  	struct rockchip_hdmi_qp *hdmi =3D (struct rockchip_hdmi_qp *)data;
> =20
> +	disable_irq(hdmi->hpd_irq);

[Severity: High]
This isn't a bug introduced by this patch, but this has the same issue with
uncancelled delayed work as the rk3588 variant above.

>  	dw_hdmi_qp_rk3576_mask_hpd(hdmi);
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D31
