Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8560270ED7
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 00:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778718146; cv=none; b=KAXOKqAVQrwPUZCfwQ3nThV8K2SGpbJDD1rSWt+NI1A23Z2B0EC2GmRyOyOf9Y8znrYv/AMDwfbiFD7LgQUBNH+Ice3kS+P7Xp4bIbsx9cFUOp51ubLzo36wM/8ucyrjKVZtxNi2AYkf4saaYc/uPqOFOHhL2oeiSqH+2yX8Yb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778718146; c=relaxed/simple;
	bh=Pq3ZL9VcSYaipEjRJuCl/S6Mhy6auM1sxivR25gqhLA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DHgqSTc7agf+ScN2dE+zo0xTjzHOyk2e/9rRLw9QyD7mwDKJdGL6VfJnYLj4Z5HdNPfVnvVvw3a34VhnodKDm3wfpQrjQ/bToLfB3G2FlHXEu1U7hARndVtbOZ+C8ZEWIDLO2GWiYIZub97jj8/M9NB1VkYodKHKpAzbk7WNPsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NipP67Dz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NipP67Dz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D423C19425;
	Thu, 14 May 2026 00:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778718146;
	bh=Pq3ZL9VcSYaipEjRJuCl/S6Mhy6auM1sxivR25gqhLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NipP67DzGapf3yBf7coC4TDbn7I2ns5mNjYk5COUtU5MHCjR/qI2Etl7ZA2EA/Kdn
	 VCJiTWN7X5bG5TgbCIscb53SL6XvhYd8BaBklktEj6yITFAxT7w5k1i+l2/IJ3+b7a
	 zROHgwf/WQjl7jpL9pXgFBREDq8NavUyYC3TNQQaDVV+jYdDrIbT46+iAi7I5Ov0/Q
	 9RJQvBwQ0hPSx4x/8RzLxwbohl7PgvP773ovwTBqOJbuZqQapwDlI26ZpETbpqCdPI
	 BEZgAsOWjlT2mk3Fha9bVD23z77IPciS59lpI9Y+OwUSLczsT58MVtKSs030TcZ3xu
	 E+RF9nsePJKMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 14/20] drm/hdmi: Rename
 __drm_atomic_helper_connector_hdmi_reset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260512-drm-mode-config-init-v4-14-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-14-591dfdcc1bf9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:22:25 +0000
Message-Id: <20260514002226.2D423C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unchecked use of `connector->state` after `drm_atomic_helper_conne=
ctor_reset()` leads to a NULL pointer dereference on state allocation failu=
re.
- [Low] Extraneous space before the period in the kernel-doc block.
--

commit 4088843a1b581a7e32488e55861fe134c72198dc
Author: Maxime Ripard <mripard@kernel.org>
drm/hdmi: Rename __drm_atomic_helper_connector_hdmi_reset()

This commit renames the HDMI connector reset helper to reflect its new role
as a general state initialization function. It updates the callers in vario=
us
drivers and tests to use the new name.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
[ ... ]
> @@ -272,8 +272,8 @@ static void drm_bridge_connector_reset(struct drm_con=
nector *connector)
> =20
>  	drm_atomic_helper_connector_reset(connector);
>  	if (bridge_connector->bridge_hdmi)
> -		__drm_atomic_helper_connector_hdmi_reset(connector,
> -							 connector->state);
> +		__drm_atomic_helper_connector_hdmi_state_init(connector,
> +							      connector->state);

If drm_atomic_helper_connector_reset() fails to allocate memory, it sets
connector->state to NULL. Does passing connector->state immediately to the
initialization function lead to a NULL pointer dereference?

While a later patch in this series converts the bridge_connector code to sa=
fely
handle allocation failures via atomic_create_state, the sun4i and vc4 drive=
rs
modified in this patch share this exact pattern. Could this leave those dri=
vers
vulnerable to crashes under memory pressure?

> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
[ ... ]
>  /**
> - * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @dr=
m_connector_state resources
> + * __drm_atomic_helper_connector_hdmi_state_init() - Initialize all HDMI=
 @drm_connector_state resources
>   * @connector: DRM connector
> - * @new_conn_state: connector state to reset
> + * @new_conn_state: connector state to initialize
>   *
>   * Initializes all HDMI resources from a @drm_connector_state without
>   * actually allocating it. This is useful for HDMI drivers, in
> - * combination with __drm_atomic_helper_connector_reset() or
> - * drm_atomic_helper_connector_reset().
> + * combination with __drm_atomic_helper_connector_state_init(),
> + * drm_atomic_helper_connector_reset(), or
> + * drm_atomic_helper_connector_create_state() .

This isn't a bug, but there is an extraneous space before the period.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-drm-mode-c=
onfig-init-v4-0-591dfdcc1bf9@kernel.org?part=3D14
