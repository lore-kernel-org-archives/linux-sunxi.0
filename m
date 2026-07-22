Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0435F3DD521
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713837; cv=none; b=FNhA5x+YtiWr/cMLEAP5Ek6N2jF3n4R9iKvQV7gr+48wFiSqzhFGzW9sXEbuY2Zeww1YMZkQ13NGkm6TF1ZEHF1wFi1Qbd2W/ATJzDBUws2NEp7NetMMnm7FLiSt2eeBXV57XJvJGj6qrwLVSgIILVC92nKi8/i1GnO78DnFVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713837; c=relaxed/simple;
	bh=GKxLhLt1irCP3sDTSIUkRbH6hBHxUxxSahsmRY+k2CE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p/RKZPm7Ueh3eGv/pXKIU+E9QJim0Kr/26aBT42pQAjRoxmlBTuK/db65FUgVeWalBydCc8yMReZllFIlrNtIwPpbd1fag7T0ws8RpTGM/eEmr6Uf0mxvbyFDdH90VQeZnMSoAT4Ee7qMggE9JCh0xJ/sbW4haYkIjIAlHQ+/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAfKanLH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAfKanLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E37E1F000E9;
	Wed, 22 Jul 2026 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784713833;
	bh=cGzKdDIq40NgsJAnJa5axHzzAzBU+82htX5o0TsEIUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EAfKanLHba0hZWecVFcPHeMzDbHjmAnIBvO9WkYj8Dr6OkgT9Ig6mFuNHo5eu69+u
	 g1ghJeFlOzqnVeGiIzdso1rUAl9nqnIm3Zq0foYc8u+a9LadlrnfhkEbrQaMKuXlhF
	 xabicKFUusC2OEoYzvzeyJozCSxq6b4FTIFcFQ9KWTofbHt5jMuxHx/STpldGtC776
	 a78YipHjLgLev/DWs3t4+j9SnbgLT154sL5G63PS9/9xvQ3VYEo4/6FfWi/0msJfx3
	 E2p19kReaj07TjtfoXK11eFMc8jPuVcJpgO6sRwE+AdQpOCvOZGY5lP8jNfptV4l9y
	 f03QIjGhJve0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] drm/display: hdmi-state-helper: Init SCDC
 debugfs for HDMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260722-scdc-link-health-v8-5-cd1dacbb85d9@collabora.com>
References: <20260722-scdc-link-health-v8-0-cd1dacbb85d9@collabora.com>
 <20260722-scdc-link-health-v8-5-cd1dacbb85d9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:50:32 +0000
Message-Id: <20260722095033.3E37E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `mutex_unlock()` in `scdc_status_show()` error path leads =
to a permanent deadlock.
--

--- Patch [5]: [PATCH v8 5/5] drm/display: hdmi-state-helper: Init SCDC deb=
ugfs for HDMI ---
commit a1a858eb6a63d66446abae1340fa115153801dc6
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

drm/display: hdmi-state-helper: Init SCDC debugfs for HDMI

This commit initialises the SCDC debugfs file for connectors that call the
HDMI state helper's debugfs_init helper, making the scdc_status file
available in their connector debugfs.

> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 8d5ee10ceb874..709524b40c26f 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
[ ... ]
> @@ -1116,6 +1117,7 @@ void drm_hdmi_connector_debugfs_init(struct drm_con=
nector *connector,
>  		return;
> =20
>  	create_hdmi_infoframe_files(connector, dir);
> +	drm_scdc_debugfs_init(connector, root);

[Severity: High]
Does exposing this debugfs file introduce a deadlock if it is read while the
display is disconnected?

Looking at the file operations wired up here, if a user reads the scdc_stat=
us
file when the connector is disconnected:

drivers/gpu/drm/display/drm_scdc_helper.c:scdc_status_show() {
	...
	mutex_lock(&connector->dev->mode_config.mutex);
	...
	if (connector->status !=3D connector_status_connected) {
		ret =3D -ENODEV;
		goto err_conn_put;
	}
	...
err_unlock:
	mutex_unlock(&connector->dev->mode_config.mutex);
err_conn_put:
	drm_connector_put(connector);
	...
}

It appears the error path jumps to err_conn_put, bypassing the mutex_unlock=
()=20
at err_unlock. Could this permanently lock mode_config.mutex and cause=20
subsequent DRM mode setting operations to hang?

>  }
>  EXPORT_SYMBOL(drm_hdmi_connector_debugfs_init);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-scdc-link-=
health-v8-0-cd1dacbb85d9@collabora.com?part=3D5
