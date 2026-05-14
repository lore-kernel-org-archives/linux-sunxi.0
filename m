Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174932DECCB
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 01:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721910; cv=none; b=uJ71ulz++9AJ4mq6MAMiYEccrlizfFSGtK45QJ7ZkRb9zi3uD3pGeqIz28nR5nvTSMBs85oHlJwQuNX3r7Enqf3tiNtiHn8C4C8eVpMrPX7cpgbiuj8MT7SrkgkQSyItzehqfSg4gCFVMzpxuS99xWlwlI/yzyyGaLQiuWXLp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721910; c=relaxed/simple;
	bh=g52s1Z7AzZw5Fchk9s3pS+elKLeQCzIGm3/ohpl0vnw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BA4SPDgsBZEXOi83l37+d2zCqZ80sQYZK7xafb0xnkCRo+GT5wPcW3HQaHPXfc+NMkmFAZ9kv/XRLL4A1ijDfBfN1qlWJpuXl+xdMal9J55PXQeHzLqeiIO+DtPMT57lI+mmFDyJVlB/ETI7ccYaPfsUK+6bLDgVqqQBDq9WpsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XG376Kap; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XG376Kap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDBDC19425;
	Thu, 14 May 2026 01:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778721909;
	bh=g52s1Z7AzZw5Fchk9s3pS+elKLeQCzIGm3/ohpl0vnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XG376KapkLAeHWVAhZR1iFKFadNMbhKHBfaX5vdlHtKeRh/P8OoZ6YEES0OY5EYIQ
	 Nq7S+dJaCdHqlEvmp2a6SmX7HSbFOZL3rWSNRU2DgP6xFBQKwidTALdc3wpOxSBvjJ
	 jA6aLZVVWcWE99UxNvd/PCwbRHbSN2DImsZDYoXOD2KXHvsbw7Qjnubr9jxhKTbPBT
	 PzVz+s+oV+3QeWgMJtedBW5Z1McxiKZL3C/3p1RdMY72O4tBTgNSD4hZQI7I2ikF1m
	 vrMu/iQaH2slrucPYrTXwfcIwCKZ1VEUlpUW+htvt4pJBRJQUVZtF9VR2ISBmMZN2Z
	 XvmuJAdDPxXrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260512-drm-mode-config-init-v4-18-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-18-591dfdcc1bf9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 01:25:08 +0000
Message-Id: <20260514012509.8BDBDC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Uninitialized atomic state for CRTCs and planes due to missing=
 `.atomic_create_state` callbacks.
- [High] Connector reference and lockdep leak in `drm_mode_config_create_in=
itial_state` error path.
--

commit e000ebef7fd981cd59e08b4a06776ff9e81cba3a
Author: Maxime Ripard <mripard@kernel.org>

drm/tidss: Switch to drm_mode_config_create_initial_state()

This patch updates the tidss driver probe to use
drm_mode_config_create_initial_state() instead of drm_mode_config_reset()
for creating the initial DRM state.

> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/ti=
dss_drv.c
> index 1c8cc18bc53c3..f5099d5d6e32a 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -171,7 +171,11 @@ static int tidss_probe(struct platform_device *pdev)
> =20
>  	drm_kms_helper_poll_init(ddev);
> =20
> -	drm_mode_config_reset(ddev);
> +	ret =3D drm_mode_config_create_initial_state(ddev);

Since drm_mode_config_create_initial_state() allocates software states using
the .atomic_create_state hooks for CRTCs, planes, and connectors, does this
leave plane->state and crtc->state as NULL?=20

It appears the tidss driver does not implement .atomic_create_state yet and
still relies on the legacy .reset hooks at this point in the series. If the=
se
states remain NULL, could it trigger a WARN_ON(!plane->state) and a NULL
pointer dereference during the initial atomic commit?

I understand this is fixed later in the series by the commit titled
"drm/tidss: Convert to atomic_create_state", but could this break git bisec=
t?

Also, looking at the implementation of drm_mode_config_create_initial_state=
()
in drm_mode_config.c that is being called here:

drivers/gpu/drm/drm_mode_config.c:drm_mode_config_create_initial_state() {
	...
	drm_connector_list_iter_begin(dev, &conn_iter);
	drm_for_each_connector_iter(connector, &conn_iter) {
		if (connector->state)
			continue;

		ret =3D drm_mode_config_connector_create_state(connector);
		if (ret)
			return ret;
	}
	drm_connector_list_iter_end(&conn_iter);
	...
}

If drm_mode_config_connector_create_state() fails, this returns directly
without calling drm_connector_list_iter_end(). Does this leak the connector
reference and leave the lockdep context acquired indefinitely?

> +	if (ret) {
> +		dev_err(dev, "failed to create initial state: %d\n", ret);
> +		goto err_irq_uninstall;
> +	}
> =20
>  	ret =3D drm_dev_register(ddev, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-drm-mode-c=
onfig-init-v4-0-591dfdcc1bf9@kernel.org?part=3D18
