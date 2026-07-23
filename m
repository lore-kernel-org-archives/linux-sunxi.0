Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7864223AE9B
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 02:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772026; cv=none; b=SgLm2SIq926u/I1fG7XotXCEKvSyf7YvhH0gbnhWNjjzfNZJlonrflQiD1IIKOSad8SI9YaoBbBuEQvPBQ0ybUWqVHrmk7F5VL+n1OX82W+gCxwQrEIclNruzUAT8rR8yh6mz+nAA1rhppa91OePp1ncYTY2UfOHlSVrBXGxCjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772026; c=relaxed/simple;
	bh=o5mc3wxEkUfmsBqCjd4jOJDepfO1BKumIOCmpuCpSiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YHI7Xi36u7mtczkb5p2OBUfNlmL+YGZf5EfjumuzvpNikCy49831iGFfGiifusxZN/cFVQWOgowYDAzyRl6lqboOYBj4Hzw/QzMMbNiTrR6/qJO5jGovfB+v65VStKbAgZJ5Sg9nvE/yxFS6sO6oewEcMNcVZbFhAGCPAWEYeuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlBuz42q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlBuz42q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FDF1F000E9;
	Thu, 23 Jul 2026 02:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784772021;
	bh=0wIvtxksmu2zmw77w3WMtvWdst3JYaZrwdydLk1tnZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZlBuz42qq6PXt5Ofkv7YuA6PlGkXoer0i0pflvgbcjG17P6Be7yFbzgvmoyl7J6rs
	 UKpyAYMz6yx8b3cJvrOJywObl9IOOCMJkU/SkMCFAn+65Aiij5yuHg75SNAoSLAeYZ
	 DyIBwHI02ZCcvPbsxvmlKsU2QOXDWac+ovjH2WmPX0Jkb4tDJIi4r0tix5/5ypnVDz
	 G0GTKA++ega0OsfTYrFwN631UTBUnwtMe4+B5aUh9SiXLEn8j6Ik4/FQCUVJvebsST
	 MXJgFNamQeIbLHjv+NE4YkM/iRk9ZZqo+KUDOgkRX31dIsJZnUq8fAjvj9ftvsOHu5
	 8+NK/lSuZne7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 45/61] drm/bridge: lontium-lt9611: Advertise HDMI 1.4
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-45-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-45-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:00:20 +0000
Message-Id: <20260723020020.F3FDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling sleeping function msleep() from atomic context in lt9611_b=
ridge_atomic_enable
--

--- Patch [45]: [PATCH v9 45/61] drm/bridge: lontium-lt9611: Advertise HDMI=
 1.4 capabilities ---
commit 68a26d2eb02093b29ceceec99268ce3f7d8ba524
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: lontium-lt9611: Advertise HDMI 1.4 capabilities

This commit adds HDMI 1.4 capability advertisement to the lontium-lt9611 br=
idge.
It sets the supported version and maximum TMDS character rate.
It also removes the redundant lt9611_hdmi_tmds_char_rate_valid function.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index b6a368f712853..19971ffade8ba 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
[ ... ]
> @@ -1029,7 +1018,6 @@ static const struct drm_bridge_funcs lt9611_bridge_=
funcs =3D {
>  	.atomic_create_state =3D drm_atomic_helper_bridge_create_state,
>  	.atomic_get_input_bus_fmts =3D lt9611_atomic_get_input_bus_fmts,
> =20
> -	.hdmi_tmds_char_rate_valid =3D lt9611_hdmi_tmds_char_rate_valid,
>  	.hdmi_write_audio_infoframe =3D lt9611_hdmi_write_audio_infoframe,
>  	.hdmi_clear_audio_infoframe =3D lt9611_hdmi_clear_audio_infoframe,

[Severity: High]
This is a pre-existing issue, but since we are modifying the bridge
capabilities here, I noticed a potential sleeping in atomic context issue
in the existing lt9611_bridge_atomic_enable function:

drivers/gpu/drm/bridge/lontium-lt9611.c:lt9611_bridge_atomic_enable() {
	...
	lt9611_hdmi_tx_digital(lt9611, connector->display_info.is_hdmi);
	lt9611_hdmi_tx_phy(lt9611);

	msleep(500);

	lt9611_video_check(lt9611);
	...
}

Is it safe to use msleep in this path?

DRM bridge atomic enable callbacks run in an atomic context during non-bloc=
king
commits where sleeping is forbidden. Does this msleep cause scheduling while
atomic warnings or potential lockups when triggered via display mode settin=
g or
hotplug events?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D45
