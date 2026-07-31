Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4634749D7
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 23:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785541307; cv=none; b=P4eq/MlKWekvWEiDSc8ZnzflQl96mn3JPAsUiKoGu3TEATpkBeU9fbfOerPIr7IWp5HETmfbr7pDu9zo05NGpFYyDkamzEscMjerR9yZi9k1CUamolPR7Aui/ObsjdreeUgvNRF7iFCBTKsz4S+s1vDsg1pHDXcgG6reypV5lUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785541307; c=relaxed/simple;
	bh=LBTN41VyvvzUGs030Psj9lir9lenzi8XCliML9tZnDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bDIzdWOTCV9X0HkJscpijPL9oqcDC3o5ryHvGJDf9MuQ4fgVWsMvv3m0wYn6lBkhyDxYW/a0ubw0ha4TxylYW9ICt4RcFYrtGqHPYakMUux5xfrmkz2LUOQMRan+c8aY6C1eR0o39YubrNxMb88WlvmDIVL35eJ3mt6C91vCLF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFGSZicr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFGSZicr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE751F00AC4;
	Fri, 31 Jul 2026 23:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785541306;
	bh=9Kz2Jdd4EUfbP7yiPBIp3LG0+L2DP1L8Au1EyeOylRE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aFGSZicrgrQzeoTn+IG7WhZjGh/f10nNAmkGHQ2Zqk2zdvJ4g0X+sro7aHES69jcG
	 dUM/1WmuY1pS/VzeqNClEDRomffeRHqeNvZFbyUPtDgLJ5vWeYIVfAwhLN41cGLPb5
	 GKmM5fTv6CsONmzoVMzp2l+7x9PjY5W6vZwyKMl3gskZpVyBgT5uAeHMoJojL0KiKM
	 eljMdItV13dc/oitMwr1UgHqJaXaiHNCAzWbDOiJBztCwg9CjZ0UyHEi/XcakqredI
	 4RI2iDX6dAi4HaKVZnVcgGfmRiZTXaZVY1KoslvpWMk1TzF6/pYqmb9NkSXPW9Siw3
	 DQgxBmgKOgD8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 54/69] drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-54-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-54-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 23:41:45 +0000
Message-Id: <20260731234146.3DE751F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Using devm_ functions inside a component bind callback causes reso=
urce leaks and permanent re-bind failures.
--

--- Patch [54]: [PATCH v10 54/69] drm/rockchip: rk3066_hdmi: Advertise HDMI=
 1.4 capabilities ---
commit ec81435b2b3f978e3738f994975d9efc7aae982d
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4 capabilities

This patch configures the RK3066 HDMI TX bridge to advertise HDMI 1.4
capabilities. This enables the DRM core to properly filter out modes
that exceed the 340 MHz TMDS limit.

> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/roc=
kchip/rk3066_hdmi.c
> index f28d6a883e099..f748700b0ba6c 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c

[ ... ]

> @@ -712,6 +713,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct r=
k3066_hdmi *hdmi)
>  	hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>  	hdmi->bridge.vendor =3D "Rockchip";
>  	hdmi->bridge.product =3D "RK3066 HDMI";
> +	hdmi->bridge.supported_hdmi_ver =3D HDMI_VERSION_1_4;

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in how
resources are managed in this file during component initialization.

Does the use of devm_ functions inside the component bind callback
rk3066_hdmi_bind() cause resource leaks and permanent re-bind failures?

If rk3066_hdmi_bind() or a subsequent component's bind() returns an error
(such as -EPROBE_DEFER from devm_clk_get() or rk3066_hdmi_register()), the
DRM master driver's probe will fail. However, the resources allocated via
devm_kzalloc() and devm_platform_ioremap_resource() in rk3066_hdmi_bind()
are tied to the subcomponent's platform device, which isn't unbound during
this failure.

This means the resources are not freed. On the next probe attempt,
rk3066_hdmi_bind() will execute again and devm_platform_ioremap_resource()
will fail with -EBUSY because the memory region is already exclusively held
by the previous un-freed allocation. This appears to permanently break the
display driver until a system reboot or manual unbind.

Should these allocations be moved to the platform probe callback instead,
or explicitly managed so they can be properly freed in rk3066_hdmi_unbind()?

> =20
>  	hdmi->bridge.ddc =3D rk3066_hdmi_i2c_adapter(hdmi);
>  	if (IS_ERR(hdmi->bridge.ddc))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D54
