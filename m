Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C444A41D
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 20:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293135; cv=none; b=gjiF0b3J5WN4xJ52OFg9bzT3u0cU4yNPZZ2wNFw2mlkIPiLJqGaqWOyomcjP4aAYyJG+Muk7XJQFc75Eb846/oEEaglPhmlgObld76AkWGg5w8XleQhTwOCRBakKes/vIb8d3Y9UNb1BbhF5peEbuBwhT3XzC5NiwHYOt5v9hyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293135; c=relaxed/simple;
	bh=sE/L2hTmxiyYvxmgn0oPCq/C77OcSaFeIs/TMjMCgMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=krlSK9xj9O8p0fh7JI7DFpSbJ6LdAupNDBr6csXMtSoIAg7BtKrzDEC6aBjATEkCnWhMFkGTNwotHW3cdD+cKtg/ic+E48rWYmBSu5Ewr2GwUNa/BYPOrdl9gnGnPgskQSiXMLVjdDKabezZw4mLjS2LS8QuzA3SJdJmi0H4ngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4wy0lSx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4wy0lSx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9081B1F000E9;
	Tue,  1 Sep 2026 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293133;
	bh=SUKt+SUuV54NYqXuS4/Co5XK8uh/SiR7pbQUU7xi8pI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h4wy0lSxpuKS6oNCixPc8hHzYUqkPgzW4woF7/KioH1vTBIAguavh9xi6N/Q3DNOJ
	 /HVwFhGnI9M9q44sCMn8yquHe1y3rTS+XKL3bU9goymTRuKreAsnzIxhBj8FFBwS2Z
	 +lWfLI9IjQBH7Is9reo9bYXHfdp1P0sU2VErzPZVL1niV3cBoxffirD2EcaJN0WuEn
	 cefqIpnY9GcQLLAHmjY8DUP6f1Y8CJIUSyF8yx/YYGUabcWTUAza9+MojSNXO/dOUc
	 pb9fMw8PNxgfs7/fvLfrQuwaNBwNwoTXenh1kiztMrmmnIrOEzmFF0xK7GrOkQYzyH
	 GxQcqHUaNJbfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 40/74] drm/rockchip: dw_hdmi_qp: Use
 dw_hdmi_qp_hpd_notify() for HPD reports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-40-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-40-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:05:33 +0000
Message-Id: <20260901200533.9081B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lifetime mismatch between drmm_ allocated state and devm_ managed =
resources causes Use-After-Free and resource leaks.
--

commit 4f79590505cad08e229d9cf38e2f40905ce2991c
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: dw_hdmi_qp: Use dw_hdmi_qp_hpd_notify() for HPD reports
   =20
Notify only the affected connector instead of polling all of them, and
ensure .detect_ctx() runs on reconnect to recover SCDC state.

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 1c547016ee009..f2a1ea8dfefa5 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
[ ... ]
> @@ -398,14 +397,8 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_s=
truct *work)
>  	struct rockchip_hdmi_qp *hdmi =3D container_of(work,
>  						     struct rockchip_hdmi_qp,
>  						     hpd_work.work);
> -	struct drm_device *drm =3D hdmi->encoder.encoder.dev;
> -	bool changed;
> =20
> -	if (drm) {
> -		changed =3D drm_helper_hpd_irq_event(drm);
> -		if (changed)
> -			dev_dbg(hdmi->dev, "connector status changed\n");
> -	}
> +	dw_hdmi_qp_hpd_notify(hdmi->hdmi);
>  }

[Severity: High]
This is a pre-existing issue, but can the hpd_work or IRQ handler outlive t=
he
hdmi structure, leading to a use-after-free here?

The hdmi structure is allocated with DRM device lifetime in
dw_hdmi_qp_rockchip_bind():

	hdmi =3D drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);

However, the IRQ is registered with platform device lifetime:

	ret =3D devm_request_threaded_irq(dev, hdmi->hpd_irq,
					cfg->ctrl_ops->hardirq_callback,
					cfg->ctrl_ops->irq_callback,
					IRQF_NO_AUTOEN, "dw-hdmi-qp-hpd",
					hdmi);

During a component unbind (e.g. via sysfs or EPROBE_DEFER),
dw_hdmi_qp_rockchip_unbind() does not explicitly disable the IRQ or unregis=
ter
the bridge:

static void dw_hdmi_qp_rockchip_unbind(struct device *dev,
				       struct device *master,
				       void *data)
{
	struct rockchip_hdmi_qp *hdmi =3D dev_get_drvdata(dev);

	dev_set_drvdata(dev, NULL);

	cancel_delayed_work_sync(&hdmi->hpd_work);
}

If the DRM device is freed, the hdmi structure is also freed. But because d=
evm_
resources are tied to the platform device (which isn't removed during a
component unbind), the IRQ remains active.

If a hotplug event fires afterwards, won't it dereference the freed hdmi
pointer and cause a panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D40
