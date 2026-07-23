Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46227191F94
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771369; cv=none; b=R9fLnDsr9UREM+cK4p88UOs36sIeZ7bE7tsNrkFEz/VrONLWqr7IwMETIvrE8ZqxoET6/Nzy6R5NWcltrSgp2IHia/G4bRF53hNQ3thdM0yCOJA+PVqShOt4yMAhe8MyridGUaC90g0sfM9a8P7QYD6kLzXwe8mLlST9y+5bfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771369; c=relaxed/simple;
	bh=TU0I3vUBZd6xegLjkzS/uRvEEtgAztwrjZDOX6S7r68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ffEHJLH8io+NHzOP3N6Py8ak9Ee/eTyASRiAwWDDKPErGtvwuQa2bh2ubkPtJvlYOdDO/+y9nSyFTY6D69Z6SLAMpWZmlJn4L6yA0U/l9isG/xZqPU4p0jkrASs6PIkIxOneSqhwbXhEQ41aIL9rWMR55RLRG/GtGu1dr3VJXmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDZtGZ4K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDZtGZ4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9979C1F000E9;
	Thu, 23 Jul 2026 01:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771367;
	bh=oflAwhgRqtKE0S7ON5eYSqn7GLVsm6zmiJuQ6Y156x4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XDZtGZ4KbrnpLkQh7kI/vx8jrvUszoJ3hcdrkDNkNQeTNNEkYn51Q79UgzFjpfuPf
	 3WmEgFN+UO2URKp7z9wBgLyHSCa4zz9/Lj3CeF0NBJ9Gvo4NENYipFfZYl89lRklcs
	 Bvfm2Ts8d/YMargylH8Rzdv2d+8IhqrGruaDDpo/aTyIGKkaQUhm0w6k9B/Mvyy/SI
	 fS9o/eh/hq85VxtoFnosOSP1/1ABKuqEEzS+QuZZKO8hRWWnyAf+U3GZ3lq4ETCdf6
	 bni+GFZxBMrjKkzA9ItYkrX+FL5NMijARN/907BLXwKu7mZ+vkY1q+R7X3bfFolieq
	 xaxZFpAaTiMBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 23/61] drm/bridge: dw-hdmi-qp: Provide
 dw_hdmi_qp_hpd_notify() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-23-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-23-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:49:27 +0000
Message-Id: <20260723014927.9979C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unprotected lockless access to `hdmi->curr_conn` between atomic =
commit threads and the HPD notification thread, leading to a data race.
--

--- Patch [23]: [PATCH v9 23/61] drm/bridge: dw-hdmi-qp: Provide dw_hdmi_qp=
_hpd_notify() helper ---
commit f35dc78b72396dddf94643e1b74b8f00fbaf1275
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: dw-hdmi-qp: Provide dw_hdmi_qp_hpd_notify() helper

This commit exports a helper function for platform drivers to report hot-pl=
ug
detection events. It targets the affected connector and ensures context
detection is invoked on reconnection events for SCDC state recovery.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index ee74266b7aa9c..be1bd765cb033 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c

[ ... ]

> @@ -785,6 +787,8 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct dr=
m_bridge *bridge,
>  	dw_hdmi_qp_mod(hdmi, op_mode, OPMODE_DVI, LINK_CONFIG0);
> =20
>  	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> +
> +	hdmi->curr_conn =3D connector;

[Severity: Medium]
Is a WRITE_ONCE() needed here? hdmi->curr_conn appears to be read locklessly
by the HPD threaded IRQ or work queue context. Without WRITE_ONCE(), could
the compiler reorder the store before hardware initialization is complete?

>  }
> =20
>  static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
> @@ -793,6 +797,7 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct d=
rm_bridge *bridge,
>  	struct dw_hdmi_qp *hdmi =3D bridge->driver_private;
>  	struct drm_connector *connector;
> =20
> +	hdmi->curr_conn =3D NULL;

[Severity: Medium]
Does this assignment to hdmi->curr_conn also need a WRITE_ONCE() to ensure
safe concurrent access during concurrent hotplug events and modesets?

[ ... ]

> @@ -1409,6 +1414,37 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform=
_device *pdev,
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_qp_bind);
> =20
> +/**
> + * dw_hdmi_qp_hpd_notify() - Notify a hot-plug detection event
> + * @hdmi: pointer to the DW HDMI QP controller
> + *
> + * Platform drivers should call this from their threaded IRQ handler or =
work
> + * function to notify the bridge of a connection status change.
> + * The bridge's .read_hpd() phy_ops callback is used to read the current
> + * connection status.
> + */
> +void dw_hdmi_qp_hpd_notify(struct dw_hdmi_qp *hdmi)
> +{
> +	struct drm_connector *conn =3D hdmi->curr_conn;

[Severity: Medium]
Since this is called from a threaded HPD interrupt handler or work function,
can this lockless read of hdmi->curr_conn race with the KMS modeset thread?

If the writes in the atomic commit paths use WRITE_ONCE(), does this need a
corresponding READ_ONCE() to prevent compiler optimizations like register
caching from causing stale reads?

> +	enum drm_connector_status status;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D23
