Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81BD3093DD
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771544; cv=none; b=Wi8Sp4PKps0eEE10DKLJF5Y2NSkdRymKwpb9+9XhMm4zeio41MbwAhIaT2zBHVbXgwsEYO2oXF5r7/RLnqA36ZrnjHD2Gf0Mu5tbjinqsZtcU7VGKTYyy/tgZ6vkrMQQNc+OlnB97FpJpvT0n0UGqlWnqrU0ULwF55oGcnHZrSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771544; c=relaxed/simple;
	bh=YenA6iiMTpvkHKvzzI3G5UwYvYlTv8sdb+/yfRhRZYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o1G6ZIbLkqNi1HpH3jJxDceWtmUcZVD9AIjkWEIDntuxhHDRrKYz55uNHM6In5ksZJOwScXSQu5gJkFNRS38XA5Fsxhm97Gebi2/p3s66wediv0X7VeE/C6FwT3QlK7ZclGzsIt5OeZO2bz/34hWVgKCApiX/9+DzAZvJIwxE0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4MImNFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4MImNFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3911F000E9;
	Thu, 23 Jul 2026 01:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771541;
	bh=6FWO1yh2ahSgwSdyb0AymlvjvW4KFjGkextkVbB4ZUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B4MImNFOrHp/7/q+n8H6HV3ZhcRPUyJT+A6pK3d45GWAVqsOPM0kgZ4qhA0U+WNT3
	 vcfWQi5KiRP9AfSX49zJLb11nwVUB5HiaqNXYzlt/osEFQeC7ZUjlOLrkxctgn06Yo
	 q+pyj7WWtyXJmAuUdJ5DjuN+OoFP86vTUVmErGg2H7lvBLO0MU4M3gX442//ktFjXu
	 CNRlZVA4Z+QCHq87W2pxIsgeKb1xV0E5YpBLP/X7+K4A3HK0kb2TTPiLOgE2hRXogZ
	 iTWAZZxz+T3lbFkPGEe4NazYLdlUjAynHEH3KxbbQnfw46QaZLcFr7MuEvNDdqCMlb
	 okt1Lr1bNPJNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 20/61] drm/bridge: dw-hdmi-qp: Provide
 .{enable,disable}_hpd() PHY ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-20-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-20-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:52:20 +0000
Message-Id: <20260723015220.CC3911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The patch fails to achieve its stated goal of preventing prematu=
re HPD interrupt delivery because the underlying PHY driver was not updated=
 and HPD remains statically armed.
- [Medium] The bridge implements `.hpd_enable` but never calls `drm_bridge_=
hpd_notify()`, bypassing the DRM core's hot-plug notification callback.
--

--- Patch [20]: [PATCH v9 20/61] drm/bridge: dw-hdmi-qp: Provide .{enable,d=
isable}_hpd() PHY ops ---
commit 1e237fa22e4f4ffd6fd8e88a7191823f910b5d7a
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: dw-hdmi-qp: Provide .{enable,disable}_hpd() PHY ops

This commit implements the .hpd_enable() and .hpd_disable() bridge callbacks
for the dw-hdmi-qp driver and extends dw_hdmi_qp_phy_ops with corresponding
hooks. The goal is to allow the DRM core to control when HPD interrupts are
armed to prevent premature delivery.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index 7475b6b71836b..a0613f0d2ebcf 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -1189,6 +1189,22 @@ static int dw_hdmi_qp_cec_transmit(struct drm_brid=
ge *bridge, u8 attempts,
>  #define dw_hdmi_qp_cec_transmit NULL
>  #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
> =20
> +static void dw_hdmi_qp_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +	struct dw_hdmi_qp *hdmi =3D bridge->driver_private;
> +
> +	if (hdmi->phy.ops->enable_hpd)
> +		hdmi->phy.ops->enable_hpd(hdmi, hdmi->phy.data);
> +}

[Severity: Medium]
The commit message states this change enables the DRM core to control when =
HPD
interrupts are armed to prevent premature interrupt delivery.

Does this actually prevent premature delivery? Looking at dw_hdmi_qp_init_h=
w(),
it still unconditionally calls the setup_hpd hook, which statically unmasks
the HPD interrupt before the DRM core assumes control.

Additionally, if the underlying PHY driver hasn't been updated to implement
these new enable_hpd/disable_hpd hooks, won't these callbacks just be silent
no-ops, leaving HPD statically armed?

[Severity: Medium]
By implementing .hpd_enable, the driver opts into the dynamic HPD
notification API.

This API contract expects the driver to call drm_bridge_hpd_notify() when an
HPD event occurs, so the DRM core can execute its registered callback. Since
dw-hdmi-qp.c neither calls drm_bridge_hpd_notify() nor provides a way for t=
he
platform wrapper to trigger it, won't the DRM core's hot-plug notification
callback remain unexecuted?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D20
