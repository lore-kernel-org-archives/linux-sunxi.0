Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8276C328B71
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182035; cv=none; b=oSEBZlaHk49FXOavuZZHytG/lsvC/8htklTmkTjwSV+E7x9w+lx1OFeK0T+4tGtu++wgns766CDwBfTs5OkxNYhtnbapGpMacYH/up7xIAh/s3V+emTqaHQQ1A7MNPPSzzYvvCEV0FzpXAj0k/dEGo80Vl6OHo9nzUQZvBNQDIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182035; c=relaxed/simple;
	bh=oyGRNsT58ApU4gZ45X12Y1i7nMSaFUQucosNFlaEJ94=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LGOIZrC577lDewNOXm2D+nyl8kdMFbCu5LOOHdir9kDELXwU6yXc8x0FaafNNZhQJ0cQN66L5B6bQ++JciALCiXAtDyQwZPN5TXEm8KJpAD6UPz4h4gG8IeMz6TzLe5EJ091hYQalgHMRke/fB7dFOW278nD7nG61RDMapO28NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFAC/tDq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFAC/tDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15823C2BCB3;
	Tue, 19 May 2026 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779182035;
	bh=oyGRNsT58ApU4gZ45X12Y1i7nMSaFUQucosNFlaEJ94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZFAC/tDqtrq081fCW+x6UH1Nggfop1LODYAxN25kLg7WUd0VODtUQ/8I9wOXsWrZS
	 IeNAIrKmtHht54vqqhSS33RtjV5hd9V2KKiXlcLEhvc01psxdeneB2e1xgoeiqEKs7
	 i2IzL5Eze8Pi0RNA4q8cmamdAxKMh4Ti00tCA5CGL0vTkTuw4i+EvuZJxSbiesCkFH
	 jFZjxofLBgyPCXbWI3Bky5W92+nWgJnmhxHIVD/qyDCXI0O9BeBqJen7gBdQclJEMR
	 JE/MCSlOQmnd2o57AS2KkRMU4+vnBt90F1RfPbjT1j4gsd1tA6RAoNytmmMsX74K3W
	 Zkr3QyZJnOKLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/19] drm/hdmi: Rename
 __drm_atomic_helper_connector_hdmi_reset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260519-drm-mode-config-init-v5-14-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-14-388b03321e38@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 09:13:54 +0000
Message-Id: <20260519091355.15823C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] __drm_atomic_helper_connector_hdmi_state_init() dereferences new_c=
onn_state without a NULL check, leading to a kernel panic if state allocati=
on fails in drm_atomic_helper_connector_reset(). This problem wasn't introd=
uced by this patch, but existed in the previous implementation.
--

commit ca36932b2899a887d5e634584333e43a5290dc5b
Author: Maxime Ripard <mripard@kernel.org>

drm/hdmi: Rename __drm_atomic_helper_connector_hdmi_reset()

This commit renames __drm_atomic_helper_connector_hdmi_reset() to
__drm_atomic_helper_connector_hdmi_state_init(). This prepares for
consolidating DRM objects state allocation around the atomic_create_state
callback.

> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index a161d3b00a255..74dce4be0c008 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -508,7 +508,7 @@ static int vc4_hdmi_connector_atomic_check(struct drm=
_connector *connector,
>  static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>  {
>  	drm_atomic_helper_connector_reset(connector);
> -	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
> +	__drm_atomic_helper_connector_hdmi_state_init(connector, connector->sta=
te);

Can this result in a NULL pointer dereference if memory allocation fails?

This problem appears to have existed prior to this patch, but remains prese=
nt.

If kzalloc_obj() fails inside drm_atomic_helper_connector_reset(), it will
set connector->state to NULL. This NULL pointer is then passed into
__drm_atomic_helper_connector_hdmi_state_init():

void __drm_atomic_helper_connector_hdmi_state_init(...,
						   struct drm_connector_state *new_conn_state)
{
	...
	new_conn_state->max_bpc =3D max_bpc;
	...
}

Does this code need a check for new_conn_state before dereferencing it,
or should the caller check if connector->state is valid before calling this
initialization function?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-mode-c=
onfig-init-v5-0-388b03321e38@kernel.org?part=3D14
