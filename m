Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E562730C15F
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 01:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771859; cv=none; b=TKZT4vMER2He+36Poi+1o7uwKIAUSH2hAX2lYaSJj0nRq0srPsi3wUbOxThSn9rSx4N71Q9fQslXWVAEi3BnqPsifpFGRfUCN98izxax14GDRWERGz5J4p0ECRJrbR6LeIvTwicjPFhsTKLbhoMaxyopJPGzBJLe6lmCsQCuLIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771859; c=relaxed/simple;
	bh=1aoLR5Y1xaDHGaqkHfWE0e4uZM+6TRrY4ggVeCislyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MMLpx9hTQ0Y3GvSiQxmEoj0hUQfNEmbVR7EfhQcF9WgzKGqEkLFCt0McIkVrdEXCLhrFZklNqXX5hyl+xTM/3p0waInnwQsEYP9Buf4i0MLqAugsC+Mi6N+oK0YCDQtzfSbmwDY+a9YISuEkyAvw7yPsOhDFp95gamhqtPrc8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PteqLDvH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PteqLDvH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE061F000E9;
	Thu, 23 Jul 2026 01:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784771857;
	bh=flyAF6dPiFK1NlLjNnw6W9jLjtEMu4HfgGX5vw7hbRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PteqLDvH3yGyZrnrOMKXSQZBv+JkhQUFY12C8Ovn06d7oKDzLxoSTggDav4PMtHCo
	 hVdXzpG6FkzsCxF7dNGA+fai/mb8tO9W6gBJhiwNLyJUJvs1K40fvprhXudlsfyeIb
	 Z9s4tQHN4cmI6HzIBZPE2lRMeDqZC8S6G5pcVEZsd4mLJUyZesx2CEJsava4ZvGG4i
	 wUzq9b+5RYnl0vpPJZYN+gEzHNmW68PUJM44LcRN9RwTsxaOgegE1dM/imyOYn2Um0
	 x/2gMqxwgX7h9qFISRtQiUkeCcaSmpzVcl/ajxMATOo7Kn3JBe4HMQZ4UDIo8xnXuN
	 3hJeVyI35iB1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 46/61] drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-46-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-46-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:57:36 +0000
Message-Id: <20260723015737.3DE061F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The code assigns `HDMI_VERSION_1_3` instead of `HDMI_VERSION_1_4=
`, directly contradicting the patch's stated intent to advertise HDMI 1.4 c=
apabilities.
--

--- Patch [46]: [PATCH v9 46/61] drm/rockchip: rk3066_hdmi: Advertise HDMI =
1.4 capabilities ---
commit 8a400446251ad4e071bf0a6818a9b90370bc4528
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4 capabilities

This commit updates the rk3066_hdmi driver to populate the
supported_hdmi_ver field in the drm_bridge structure. The stated goal in
the commit message is to advertise HDMI 1.4 capabilities so that the core
can correctly reject modes exceeding the TMDS character rate limit.

> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/roc=
kchip/rk3066_hdmi.c
> index f28d6a883e099..c080abe676c42 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
[ ... ]
> @@ -712,6 +713,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct r=
k3066_hdmi *hdmi)
>  	hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>  	hdmi->bridge.vendor =3D "Rockchip";
>  	hdmi->bridge.product =3D "RK3066 HDMI";
> +	hdmi->bridge.supported_hdmi_ver =3D HDMI_VERSION_1_3;

[Severity: Medium]
The commit message states the intent is to advertise HDMI 1.4 capabilities,
but in rk3066_hdmi_register(), this line assigns HDMI_VERSION_1_3 instead.

Does this cause the bridge to unconditionally advertise HDMI 1.3 capabiliti=
es
to the DRM core during initialization, potentially disabling HDMI 1.4 featu=
res?
Should this be set to HDMI_VERSION_1_4 to match the commit description?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D46
