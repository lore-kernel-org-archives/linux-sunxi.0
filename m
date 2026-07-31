Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D43736A343
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540279; cv=none; b=H/0ty++hHPnNq10vUcKF5Xmt3tw2BIrttMVBk4RkU+INzuangJR2I49rLd436zS+qJobvPJInGRAqxSuqQTblUiw3p6uhAJeASK3XrNM+++N0gaFYTSxgsKvq/nD1NF+nLRlknvpvfZOOA7WzIzcKz+2l77dZVPgzdPM4p0UVBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540279; c=relaxed/simple;
	bh=LIfHxGCi9Fu0b8zsdkKFG8bgKFKCA6pta2Z1kMjlZRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QrDMikdRvrWiEf55Vq9aQ+KWXOcHppe9TXZw/kSDOFP8AYH3FBtBy87I8c9JXedlMMzKXT5Hy4/3Iv0k3pKLxKInQolf0gzROEX8yXloveep07K3pbA+cdQoxOkqB0pdXv+F7Y808euU/m8pb8ZggJFIAQbxjhyCVuUfDfY/KEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4Diy8O+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4Diy8O+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F7E1F00AC4;
	Fri, 31 Jul 2026 23:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785540277;
	bh=XnovqiqSPO9qXkYFQ9a3Bzdd9DblbyJK4dwwFmE7ZvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R4Diy8O+nrqgkHECBciR/M9523P0WurIeqrt4nFt2YAPVubljXKjHgTPBpkl0QmcD
	 0SJFKq2k2Hoqd/PDZ6YafUoeIfDdLv814bbeng6rYtTSLY0rYDgoG9blq/PgGdCJ9i
	 mKQsAXt2B/Hxq52tNcJECMR0mWOfrjaMXEzBOLCZQb/fIGUh3BmAAAEIvi2eUgp17b
	 x0fRECBi0rX/4te4y82zW9YxneQRWssdP4Yy3hcH7QpW+VLMMA2OTRoOuM8s1xNnZU
	 bQNrKj7HdDfBV7wXhrcMtiwXRNaBnQ5WpxMLWX+92rLw2Bvj+9L/V8qE974WqNQ6U6
	 VUo3WdrWemykA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 51/69] drm/bridge: ite-it6263: Advertise HDMI 1.3
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-51-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-51-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 23:24:37 +0000
Message-Id: <20260731232437.87F7E1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The macro MAX_HDMI_TMDS_CHAR_RATE_HZ is left unused after its only =
caller was removed.
--

--- Patch [51]: [PATCH v10 51/69] drm/bridge: ite-it6263: Advertise HDMI 1.=
3 capabilities ---
commit bc899868425793b3c769c7eaa96a7d6bb7256b3c
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: ite-it6263: Advertise HDMI 1.3 capabilities

This commit advertises HDMI 1.3 support for the IT6263 bridge and sets the
max_tmds_char_rate limit. It also drops the hdmi_tmds_char_rate_valid() hoo=
k=20
since its checks are now handled earlier by the DRM core.

> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge=
/ite-it6263.c
> index 550999491086e..e8e0197171e10 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
[ ... ]
> @@ -738,20 +738,6 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_b=
ridge *bridge,
>  	return input_fmts;
>  }
> =20
> -static enum drm_mode_status
> -it6263_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 unsigned long long tmds_rate)
> -{
> -	if (mode->clock > MAX_PIXEL_CLOCK_KHZ)
> -		return MODE_CLOCK_HIGH;
> -
> -	if (tmds_rate > MAX_HDMI_TMDS_CHAR_RATE_HZ)
> -		return MODE_CLOCK_HIGH;

[Severity: Low]
Since this function is being removed, does this leave
MAX_HDMI_TMDS_CHAR_RATE_HZ as dead code?

Looking at drivers/gpu/drm/bridge/ite-it6263.c, the macro is defined near
the top of the file:

#define MAX_HDMI_TMDS_CHAR_RATE_HZ      225000000

but it doesn't appear to be used anywhere else in the driver now. Could it
be removed in this patch as well?

> -
> -	return MODE_OK;
> -}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D51
