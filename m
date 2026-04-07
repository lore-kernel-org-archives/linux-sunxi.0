Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6DC25A2C6
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Apr 2026 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573638; cv=none; b=mz3AtqWn6xG4NpBldiZrgin5y1lnarldE7MRWl6JyH3R+nBHNcrV69bIEN7S1DnlMA52H3UoB4xAqB2b7MnBZ/V96KNRY3MhpVFhHKqxvmGjz8/YAuyBdwKwmJqtRdGt4t0XnzvOP66Jr6MuRy7JfZqNGtfd22P41SXwgOYu8Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573638; c=relaxed/simple;
	bh=kGTJiUzDyRNJKS4BNmmUipf00HRrYPNl3hHxzfb9418=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=lvI3KF1wVSm2gLyHzmBbEpwlObIMg1mM1km5EVwE/2ayW3xO7KJ3oABQJSjN6wt7bCrKtoXkdzfc8MdB6yNe2Np/WmJDEjxtwtDc3499MZGndFhSodNVjQeqRop8vYe/b3Ch5u2oQoxXlal3odFigxi5NicFyU4f+tOtqh3TVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jyg5zU1h; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jyg5zU1h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A24D41A31C6;
	Tue,  7 Apr 2026 14:53:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 74AD7603C7;
	Tue,  7 Apr 2026 14:53:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E190010450234;
	Tue,  7 Apr 2026 16:53:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775573631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dFpKKgJSe3LDnkGc1FYdedAaRZnlCAUJQ/ukxoYtD4Y=;
	b=jyg5zU1hYNkpXLJb6meqXDq8VXWt5eBi1yf3MaMX4NsBnSaVC/ZPYaTPMHOcbkpkgn7seX
	HdjHcw4PrpZ0PYHJ18lCo/NHNq/wkP2Ku+QULqsv8pSWhETT/KsLi7kQeTcjZWYThxn7Q4
	l7zHJtiDTJiJlC1CO/bQDYp8BnlXkGJuxUHCWCez3KNaNT6ICV89h3x6N65jZYF6dnuQhC
	xOEOeYuOK/aBMpBgzW0JucXrgPsddZzoiqseZiqilL5Fht5CfhYh8s8Bs8eo05cTOYj83O
	phfnzk8yElIsP6clYK1BZPlnI0lWTWcda3nfyaoQG1wnb5XiWHJf1bmTtOtIUA==
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 16:53:40 +0200
Message-Id: <DHN0BGS5NT7V.364S1W551CQW6@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <wens@kernel.org>, <samuel@sholland.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v1 2/4] drm/bridge: dw-hdmi: Allow
 &dw_hdmi_plat_data.output_port = 0 without DRM_BRIDGE_ATTACH_NO_CONNECTOR
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <victor.liu@nxp.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <shengjiu.wang@nxp.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
X-Mailer: aerc 0.20.1
References: <20260403070032.447102-1-damon.ding@rock-chips.com>
 <20260403070032.447102-3-damon.ding@rock-chips.com>
In-Reply-To: <20260403070032.447102-3-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Fri Apr 3, 2026 at 9:00 AM CEST, Damon Ding wrote:
> In the previous commit, Luca split the dw-hdmi attach process into two
> cases:
>
>  A. hdmi->plat_data->output_port =3D 0:
>     the HDMI output (port@1) in device tree is not used
>
>  B. hdmi->plat_data->output_port =3D 1:
>     the HDMI output (port@1) is parsed to find the next bridge
>
> For Rockchip, many older platforms (RK3288, RK3399, etc.) only support
> case A by default. They can support DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
> after adapting to the bridge connector helper. Relax this constraint in
> preparation for Rockchip dw-hdmi bridge-connector adaptation.
>
> Link: https://lore.kernel.org/all/20260402-drm-lcdif-dbanc-v3-6-27cd247a0=
847@bootlin.com/
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index dd50dda3a4f5..20b2f9e145b0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2912,9 +2912,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge =
*bridge,
>  {
>  	struct dw_hdmi *hdmi =3D bridge->driver_private;
>
> -	/* DRM_BRIDGE_ATTACH_NO_CONNECTOR requires a remote-endpoint to the nex=
t bridge */
> -	if (WARN_ON((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_dat=
a->output_port))
> -		return -EINVAL;
> +	if ((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_data->outpu=
t_port)
> +		return 0;
>
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>  		struct device_node *remote __free(device_node) =3D

My understanding is that a hdmi-connector node is required in DT when using
drm_bridge_connector and DRM_BRIDGE_ATTACH_NO_CONNECTOR. Among others, it
is necessary to expose the correct connector type instead of defaulting to
DRM_MODE_CONNECTOR_HDMIA.

@Dmitry, others, can you confirm or deny the above?

If I'm correct, then the right way to support
DRM_BRIDGE_ATTACH_NO_CONNECTOR here is adding an hdmi-connector node in DT,
perhaps reusing the device tree overlay I proposed in [0].

[0] https://lore.kernel.org/lkml/20260407-drm-lcdif-dbanc-v4-8-247a16e61ef9=
@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
