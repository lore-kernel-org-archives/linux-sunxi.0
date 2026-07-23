Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346F2D063E
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771853; cv=none; b=PM7sBRoeK5Gx0w8q0RiFTjWB/umo6uhXtNoeo1DQ1tOrA0m2HD0uDE1nRL086Qnv3S5IKlO7Ah5t5b0z8CEBqsZTQGeakxzzTueqigckD14a2oLtz8AJR1mGoZoCsuDq5OTQa1diWDjgvItgjlNJnn0EiJ7CcweZI0xsGsHS9Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771853; c=relaxed/simple;
	bh=Bbz1U9DuGsVBZAd94F+K9apC549JhCKabF3eDDXxLWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VBw0qmfwK47MyMjDhXpOCttKM8XyfrEveaK6AYTUx1CEe7aq7Lhf3uSM91ZhXA8neO7OlOeD6DZGxL4dMTaIr7YI4BTwrcMF8i3AXQTH2sE2/bQdpWsZUyeQxng7F//9dwELOV0ybznHLpgu5q/GedOyrLsUxV32mDwAuKWDvpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/+PVFmf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/+PVFmf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AF31F000E9;
	Thu, 23 Jul 2026 01:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771851;
	bh=6ALM3Ug/lkiph3BMDnj3ItF3Nb1FkSkSG4SbkJuzGyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P/+PVFmf+2XC7QJ5GBnTzb07pKtF5t9gc3IQ+oAzKTZAJmPlJyLOjRpk0dW5IbnFk
	 zNTMfXWWT5Wyn6MsER2AO29ODzPthPvmY0/EqIzRSWi2zAx6sqzvGIy970M4xkK34O
	 rCjWeTKnyUsBxWJo4evPmAyh3O8FVM4WUfcxsdXrjFb8BLukV46Kyf1szxXYBLII7R
	 5AcHYktvX1nsjMJk11hLDLo6CT1S8A/S/r84Y1KyYM1cd8pBb/jZv6Ox35NJ4dZTmp
	 p0dzPVKFd3eyIFzUiTbSMeynbMJGzVc6qL1k9c3bGEmT5GCj5bdmuKe4BMVu2qrBrV
	 RNqc6L4H5VtSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 29/61] drm/rockchip: dw_hdmi_qp: Implement
 .{enable,disable}_hpd() PHY ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-29-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-29-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:57:31 +0000
Message-Id: <20260723015731.85AF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Threaded IRQ handlers unconditionally unmask HPD interrupts and re=
-queue delayed work, leading to state desync and use-after-free during tear=
down.
--

--- Patch [29]: [PATCH v9 29/61] drm/rockchip: dw_hdmi_qp: Implement .{enab=
le,disable}_hpd() PHY ops ---
commit 4e3d155ee238497812dbae4f03f0d9c85824af5a
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

    drm/rockchip: dw_hdmi_qp: Implement .{enable,disable}_hpd() PHY ops

This commit implements the .enable_hpd() and .disable_hpd() phy ops for
RK3576 and RK3588 SoCs. It also consolidates the interrupt clear-and-unmask
and mask-only sequences into these new ops. The .setup_hpd() phy op is remo=
ved
as it is no longer needed.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 12cd8db7cc50b..5067e3cf0e881 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
[ ... ]
> @@ -364,15 +385,11 @@ static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int ir=
q, void *dev_id)
>  static irqreturn_t dw_hdmi_qp_rk3576_irq(int irq, void *dev_id)
>  {
>  	struct rockchip_hdmi_qp *hdmi =3D dev_id;
> -	u32 val;
> =20
> -	val =3D FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_CLR, 1);
> -	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
>  	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
>  			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> =20
> -	val =3D FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0);
> -	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
> +	dw_hdmi_qp_rk3576_enable_hpd(NULL, hdmi);

[Severity: High]
This is a pre-existing issue, but this threaded IRQ handler unconditionally
unmasks the HPD interrupt and requeues delayed work.

During teardown or driver unbind, the DRM master is unregistered and drmm
resources (including hdmi) are freed. However, because the devm-managed
IRQ isn't destroyed immediately, the IRQ thread could race with or run after
the DRM core's attempt to mask the interrupt.

This unconditionally calls dw_hdmi_qp_rk3576_enable_hpd(), unmasking the
interrupt again. A subsequent hotplug event could then fire the interrupt a=
nd
cause the hardirq handler to access the freed hdmi structure, leading to a
use-after-free crash.

Does this need additional teardown synchronization or checking to ensure we
do not re-enable interrupts and requeue work when unbinding?

> =20
>  	return IRQ_HANDLED;
>  }
[ ... ]
> @@ -401,22 +414,11 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int ir=
q, void *dev_id)
>  static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
>  {
>  	struct rockchip_hdmi_qp *hdmi =3D dev_id;
> -	u32 val;
> -
> -	if (hdmi->port_id)
> -		val =3D FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_CLR, 1);
> -	else
> -		val =3D FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_CLR, 1);
> -	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
> =20
>  	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
>  			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> =20
> -	if (hdmi->port_id)
> -		val |=3D FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_MSK, 0);
> -	else
> -		val |=3D FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_MSK, 0);
> -	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
> +	dw_hdmi_qp_rk3588_enable_hpd(NULL, hdmi);

[Severity: High]
This is a pre-existing issue, but this RK3588 IRQ handler exhibits the same
behavior as the RK3576 handler above.=20

Can this lead to a use-after-free during driver teardown if the IRQ thread
runs after the DRM core tries to mask the interrupt, causing it to be left
armed?

> =20
>  	return IRQ_HANDLED;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D29
