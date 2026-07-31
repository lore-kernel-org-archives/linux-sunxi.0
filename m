Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24544606C
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521387; cv=none; b=afLdKuvq7I29xvrD6QXL/cbYwoTYtErfDXXx+zHQcc/19xfHdXdJ7vVYs8iYJpfLThBHxShQ3OutO1XsW3d8c3g/FSF3KWdm7nZBUMfuJxVSHmskBb5GRwIaW4zz20/q1+N5QPq33kK0iYwaqWZ6K4vLGDeJWdkXJfPIC2T2aNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521387; c=relaxed/simple;
	bh=Aqu/60dwxoTp/5uxwX+tuw/uYl4dapLwSiZq+LDo3UU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UBbcXCDfyGpPdqh5oS4vypZrZkkdAw6t/eM1m+xjoFgRWYsl5lZg4vKiMLjNr1OkT47/oxaNDBLtHO5hwZR6XbdtWl2P2AErTapMo/DKcpmadlNhUMxwAQn785Kh57BOhwOc6P1y11DcFXKoFu6ooquhJ+t1JoJTvHmvkVQ7yCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1KeE601; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1KeE601"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD9C1F00AC4;
	Fri, 31 Jul 2026 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785521385;
	bh=eIKarEuyOY8dzXdFlVkd6J592fiC7ID6E9bBmVQlRPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T1KeE601riSC5Vy+e5KwEeig8YokWTmJGIWPMzw6FC4VCp4Pud89a3Xn4bLYyndFy
	 xi6VYgSQtzybGaI2QF+0QjwHwQ+x1fK/EXZe9Nuut1o+yvQKGjkA8w9jGJf880BLPT
	 2bwJhownVm/SDPj4wwK+xsFoZY6KtT72aZX0XJHPIuY8BGmSH0ps7lo/caubGw3QHj
	 OFlgBVS6aXHad918Xk2L8YjKdFjXA+EXFV7jhVOAnL2VJJonwEQdYWBPabbifG3LHc
	 wsOWpn9qP2HHv7o/2ziWR0g9FkyAFtmVnxXFU50EAa97RPmNCHISmmF9afoC90bwiU
	 04bUNnsx4f38w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 15/69] drm/bridge: Add bridge ops for source-side
 HDMI 2.0 scrambling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-15-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-15-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:09:45 +0000
Message-Id: <20260731180945.8DD9C1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing API implementation for bridge HDMI 2.0 scrambler callbac=
ks causes unconditional probe failure.
--

--- Patch [15]: [PATCH v10 15/69] drm/bridge: Add bridge ops for source-sid=
e HDMI 2.0 scrambling ---
commit 5577332c0f45e627e54f1e2997be97e38fdecf40
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: Add bridge ops for source-side HDMI 2.0 scrambling

This commit adds hdmi_scrambler_enable() and hdmi_scrambler_disable()
callbacks to struct drm_bridge_funcs. These allow bridges to enable or
disable source-side scrambling and high TMDS clock ratios for modes
exceeding 340 MHz.

> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 5a5a25995471c..77b3ffe692304 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
[ ... ]
> +	/**
> +	 * @hdmi_scrambler_enable:
> +	 *
> +	 * Enable source-side scrambling and the high TMDS clock ratio for the
> +	 * mode currently being applied.
[ ... ]
> +	 * Returns:
> +	 * 0 on success, a negative error code otherwise.
> +	 */
> +	int (*hdmi_scrambler_enable)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @hdmi_scrambler_disable:
> +	 *
> +	 * Disable source-side scrambling and the high TMDS clock ratio.
[ ... ]
> +	 * Returns:
> +	 * 0 on success, a negative error code otherwise.
> +	 */
> +	int (*hdmi_scrambler_disable)(struct drm_bridge *bridge);

[Severity: Medium]
Are these newly added callbacks being hooked up to the DRM connector
infrastructure?

Looking at drm_bridge_connector_init() in drm_bridge_connector.c, it
initializes hdmi_funcs but doesn't seem to map these new bridge callbacks:

		bridge_connector->hdmi_funcs =3D drm_bridge_connector_hdmi_funcs;

		bridge_connector->hdmi_funcs.vendor =3D bridge_connector->bridge_hdmi->ve=
ndor;
		bridge_connector->hdmi_funcs.product =3D bridge_connector->bridge_hdmi->p=
roduct;

If a bridge advertises HDMI_VERSION_2_0, will drmm_connector_hdmi_init()
fail with -EINVAL during probe because the connector's hdmi_funcs are
missing these required scrambler callbacks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D15
