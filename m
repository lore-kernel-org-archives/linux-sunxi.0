Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A474E30BB80
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515826; cv=none; b=MC2uJnA6guoQ57FRoxT+2CCZcw7oMjL02429KijPx4PxUfs0tyGgeskKAocuKVxY6f/6723n7K2f5ekZCylXE7GX7mA2INNUJA8NeQahQoLWjzJ0Wqk6CinSpbA6jNQElSLFgJ2FQLTnI7TNXtDz0xXAxkTcfsNc00a8E8z7JCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515826; c=relaxed/simple;
	bh=Oaru9XepEPTWgL1Kk0DG++lKTebpRaosEa2BKIeUuA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hVFDQtlMmuRZx3M1pxSvi8/wMJzVWAVBNwxs0GCpmbePZn2FRVIt1X4NW/PGXqonMUnNYAryRe2B0HERHn1gGc5tN+dNrjDnPn3RHESujM6UaPFFNyZgn3Q3b5oCRCY1w+Fzc1D1S6dg2rhgEXAZ8JV0KqsoXhU2WMQ64rnvJyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rw49zLmn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rw49zLmn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0C21F00AC4;
	Fri, 31 Jul 2026 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785515825;
	bh=AKCGoTcOfnlQ/QrJRsQtTzw1ANMSu62FTKRtBbqj+EA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rw49zLmnOsMkFaupLSClaYmYxpaAoNh2CCG81nrP2rDPh0VCA23GY90IaPqvkChI8
	 1UNY8xzlDq6Ht1KCFJES3lvkquTYANIcinBZlQqTXYK7JAWOV6QkQR+NNzzh+AeBpD
	 sncOxxKXzGHjH1T05NQCym3Hieeam+m8pbz5k+4upMNcLItzNAC2QkY0rSt7Ri3S54
	 jLBz3slgYD7/bX4xL3guTfivVv1WTaxxyZbcI5PlK2Js7G/kyXTM6rjbG345Q+hOa8
	 wfOY/V7d7dP1LvJFVeSLevp0jluLEe/1psTQKhDMJp9O7lbBq1VoD9F7gvFJHbbIwT
	 oDvWkAuREAMFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 02/69] drm/connector: hdmi: Handle reset() state
 allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-2-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-2-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:37:04 +0000
Message-Id: <20260731163705.0E0C21F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Custom connector reset callbacks and helpers crash on allocation f=
ailure before the newly added NULL check can execute.
--

--- Patch [2]: [PATCH v10 02/69] drm/connector: hdmi: Handle reset() state =
allocation failure ---
commit 4612d8e6373873b0631394a087aa684911dafc2f
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/connector: hdmi: Handle reset() state allocation failure

This commit adds a check for memory allocation failure during the connector
reset callback in drmm_connector_hdmi_init(). If connector->state remains
NULL after reset(), it bails out with -ENOMEM to avoid a subsequent NULL
pointer dereference.

Link: https://lore.kernel.org/all/20260723015306.C94241F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 8b4baed060f3a..0e39431e85b20 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -628,6 +628,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  		connector->state =3D state;
>  	} else if (connector->funcs->reset) {
>  		connector->funcs->reset(connector);

[Severity: High]
This is a pre-existing issue, but does this patch fully prevent the NULL
pointer dereference?

If memory allocation fails inside the reset callback, connector->state
becomes NULL. However, custom reset callbacks like vc4_hdmi_connector_reset=
()
and sun4i_hdmi_connector_reset() pass this state directly to
__drm_atomic_helper_connector_hdmi_state_init():

drivers/gpu/drm/vc4/vc4_hdmi.c:vc4_hdmi_connector_reset() {
    ...
    __drm_atomic_helper_connector_hdmi_state_init(connector, connector->sta=
te);
    ...
}

That helper unconditionally dereferences new_conn_state:

drivers/gpu/drm/display/drm_hdmi_state_helper.c:__drm_atomic_helper_connect=
or_hdmi_state_init() {
    ...
    new_conn_state->max_bpc =3D max_bpc;
    ...
}

Could this trigger a kernel panic inside the custom reset callback before
it even returns here to be caught by the new check?

> +		if (!connector->state)
> +			return -ENOMEM;
>  	}
> =20
>  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D2
