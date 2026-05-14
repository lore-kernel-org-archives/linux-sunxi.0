Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7432F3600
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 00:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720238; cv=none; b=ZKy5Mp4Ep0RP/UhnoNggsLipKH3nUSJ49xmFT5gAAM8pGSjnPMDFjxVnK8K+OmHdJogR8zerTOZfSC5CQfDlbi/+NQ6GIo1mbeFbABM7rF6XWOCVIO/8GtgWYQIT/QpjwrVm4Fy+5fURpxU5AUFWzqw9AwQ0a2R+Nfff+CTh5Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720238; c=relaxed/simple;
	bh=vdxaZV684iAmC0LbL+438NFeA3Ar9PQQx1iwR27lhUw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EFuqXQkrXjQwKl72vjQerNfsauyYrnc4cQ88ZPS5Es61w58Za8R944ZQG1tjrP+berilO/Icg647kRj2PH/VZyz8Ilt/58vG+cXLeE21QwwN0PDxQzD3BbFci0jh0nzeCG1bB1rdWBwwGm0DTKi2YQhm08yi1iJBeWcuHpaJH2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQv8pDFy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQv8pDFy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE52C19425;
	Thu, 14 May 2026 00:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778720238;
	bh=vdxaZV684iAmC0LbL+438NFeA3Ar9PQQx1iwR27lhUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CQv8pDFyGefpXVHnhtiuz48mrEa+lMB/pSlxkmLzuWoI7+1iNvpFG4vFiHfKYBe+n
	 CrEkva7SsxReRiu/3UZxRu0zvfKJ1PQF4vHjrDYgh5Rli40vmJ5PA2UUptqAJ/uvFU
	 10hQE+W1ob+gLjdnk0eGl9/iZR9UNeFzU58mSj09k2BPLMQBmH67e22AevW41UIUkD
	 sTkjuVtv3pEYh4ehbhfCI5nSaJgYP+pITCBBLvHWQxJXVlcx+UzHl2rfpcD6/PhEbR
	 1vwc03hYeJpUoR3KbRYfqCphiCiDNri9ea9dmZgX8kSXMCAgiuAJQcMg3wNoTZpYgB
	 8hsTf8BrHTV2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 16/20] drm/mode-config: Create
 drm_mode_config_create_initial_state()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260512-drm-mode-config-init-v4-16-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-16-591dfdcc1bf9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:57:17 +0000
Message-Id: <20260514005718.3DE52C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `drm_connector_list_iter_end()` on the error path inside t=
he connector iteration loop leaks a connector reference and an acquired loc=
kdep context.
--

commit 1484ab42075b748d6480095cd1ab8eb591e8be02
Author: Maxime Ripard <mripard@kernel.org>

drm/mode-config: Create drm_mode_config_create_initial_state()

This commit splits the state initialization role from drm_mode_config_reset=
()
by introducing a new helper, drm_mode_config_create_initial_state(). This
helper allocates an initial software state for all objects, allowing
drm_mode_config_reset() to focus purely on suspend/resume cycles.

> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 9d240817f8b64..27fe951841824 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
[ ... ]
> @@ -316,6 +317,92 @@ void drm_mode_config_reset(struct drm_device *dev)
[ ... ]
> +int drm_mode_config_create_initial_state(struct drm_device *dev)
> +{
[ ... ]
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		if (connector->state)
> +			continue;
> +
> +		ret =3D drm_mode_config_connector_create_state(connector);
> +		if (ret)
> +			return ret;

Does this return leak the connector reference and lockdep context?

Looking at drm_connector_list_iter_begin(), it acquires a lockdep read
context, and the iteration macro takes a reference to the connector. Should
this error path call drm_connector_list_iter_end(&conn_iter) before
returning to release them?

> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_config_create_initial_state);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-drm-mode-c=
onfig-init-v4-0-591dfdcc1bf9@kernel.org?part=3D16
