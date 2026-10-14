Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0888563FA7
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 18:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001305; cv=none; b=A3eo1PBORFvvOfQpbB+dJQELNj5UB2HVX7Rg1ymmOgvUSlavtcFQYfMurEbtV5brGqQcjgOrMCf5V2Or3yq0sr5Lu80Qt8+sYtrTNNCZsh/oIEkb1TGFaaRds6d7PqUPtdAFiCvUxwfeh6eCBYATc89Zjf2yji+r96KICKHocck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001305; c=relaxed/simple;
	bh=QzQQdXRRLJojN5KwYnugbI1XFC6Q1TiOhaYuE6BrEwI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NjKZLqNPRDG5KxnrL4ql5dY0HS/svtKGZDZ5AtsPpblzXGdwgfwEwN9UlCU33P+7DpKJ8HaMyZ+7NWTfEf+gv4XOF1FffFVAfnn+qQIqbXOgFhzcahiZMFu9myrJHbeIB/KjXdlAUxUEnDuK3dDKux4Ch9QRpCDNMptNR4gv56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNCQPmGn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNCQPmGn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9301F000C5;
	Wed, 14 Oct 2026 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792001303;
	bh=aORF5Paq9pA6RqT6h54XsidXEbg1AOyu/T8W7o94gsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LNCQPmGn0I3kuQlWMfqj5c+CVQO5VjBo4F1oIFB74bLbYIGh88mvEeZTsIJ+NbrOz
	 mHC6KgNSfL8eQzPTaTOalVnbUTegI1b9VpbhHKFI5YdKcBbltHz29UqbV/RO2AC4sY
	 pws18GnNSjW9a1yi8vVzHtN+OknR3boFrjlQ9ADVcBb5xZNMmOntJ8fdHm3K/lF73Q
	 YSC3MEORSwKYll0O+ZgeCIkdCI/xlO2tPtM7vGKgZPB4g2Qmpw6S7m5G+Jb5aG7xrT
	 EXVZWSpyVk7HoaaQbrPEB8Ob5PW20l0phOKt3z0X2gi5NsM4+f5++fbuh3CGmYJnqZ
	 nV20hNl7Yk76g==
Message-ID: <sashiko-outbox-171662@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 61/75] drm/sun4i: tv: Convert to atomic_create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-61-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
 <20261014-drm-no-more-connector-reset-v1-61-586c9c026823@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:08:22 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm: NULL pointer dereference when initializing TV connector state
--

commit a85a6a0ad13c063d072cdcda87267ea8867cafa3
Author: Maxime Ripard <mripard@kernel.org>

drm/sun4i: tv: Convert to atomic_create_state

The sun4i TV connector reset implementation is converted to an
atomic_create_state hook. It creates the pristine state and initializes
the analog TV properties.

> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun=
4i_tv.c
> index ea86f8a6a35e7..a68e5f7a03d2c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
[ ... ]
> -static void sun4i_tv_connector_reset(struct drm_connector *connector)
> +static struct drm_connector_state *
> +sun4i_tv_connector_create_state(struct drm_connector *connector)
>  {
> -	drm_atomic_helper_connector_reset(connector);
> -	drm_atomic_helper_connector_tv_state_init(connector->state, connector);
> +	struct drm_connector_state *connector_state;
> +
> +	connector_state =3D drm_atomic_helper_connector_create_state(connector);
> +	if (IS_ERR(connector_state))
> +		return connector_state;
> +
> +	drm_atomic_helper_connector_tv_state_init(connector_state, connector);

[Severity: High]
Does this trigger a NULL pointer dereference during initialization?

When the DRM core resets the connector state, it explicitly clears the old
state before invoking the .atomic_create_state hook:

drm_mode_config_connector_reset_with_create_state() {
        ...
        if (connector->state) {
                ...
                connector->state =3D NULL;
        }
        return drm_mode_config_connector_create_state(connector);
}

The core helper drm_atomic_helper_connector_tv_state_init() then mistakenly
passes the unassigned connector->state down to the margins initialization
instead of the newly allocated state:

drm_atomic_helper_connector_tv_state_init() {
        ...
        drm_atomic_helper_connector_tv_margins_state_init(connector->state,
                                                          connector);
}

This causes drm_atomic_helper_connector_tv_margins_state_init() to
unconditionally dereference the NULL state pointer:

drm_atomic_helper_connector_tv_margins_state_init(state, ...) {
        ...
        state->tv.margins.left =3D cmdline->tv_margins.left;
        ...
}

The previous .reset hook implementation masked this core helper bug because
it assigned connector->state prior to calling the TV state initialization
helper.

Could we fix the core helper to pass the correct state pointer, or should
this driver handle the initialization differently to avoid the crash?

> +
> +	return connector_state;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-drm-no-mor=
e-connector-reset-v1-0-586c9c026823@kernel.org?part=3D61
