Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBDA37B41E
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Oct 2026 01:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817796; cv=none; b=FbHD0J8dkdjZEq3EA11q0A6or/iz1Czh0b+SERl+OdeuqmZkr9bHEKROM1TfpzOGhf37rqlZ98s3ZnW3o8G89Qio2IcMGcgP/XvIs9wYumdxaB+ZEDWqpWVamZWa7NBp4M6mPnVjPoD6akpwx6EH0kXVtnOeGqgn4DZILjVZQEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817796; c=relaxed/simple;
	bh=HsbQOHvqfssogLXpU/r3/oOHz6BEqmCs0QQyip/F21Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bhzAM3rBK99vRAAV/UCxi0jrLlFCEuaL7N3+N29CKJhxeIzBRtW2JskLoiiCPL7oc92eApvpeV8rqaEmp7MxTQvsNWCf6r0oMQVVAcUYQ+DmLMzfojoF+C2qnoXPDbd10iyyrdvq/pmLtjuWon3cy064CxNIH3b8hTlT60xZbuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8qg/VWa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8qg/VWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C82B1F000FF;
	Thu,  1 Oct 2026 01:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790817793;
	bh=vTvZeF/Nhnq3jiQ437lHxmC8RA2jQksT3rwH45GKqd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d8qg/VWaOcKEaQTC+roW0LKXNO7GVASAE3A9D8lrq6DqVo9tt3T+MqfJo/y/b4JTC
	 WrQt07Yjl1rx3Js0dzjVxeUjfRFCQ4mJkVgkNlWbSesoEpk2z0RELKM5nKuMNToAck
	 B8y7tcuV5UBHvp+v2/7WhKE5N+6BWiIHquCque/Kap0S3d5g8YryP9wABiEs1oUXf4
	 8uvQD+JrAmIF1fiSjP/v61SMPqyz94M82X/GguZoVI3ShDeYqt8lm7jABMHOo1M7Nu
	 KPkglDhbQWkkq7qIyHKlZugyziJMBAn7KZs1tTNV5xY7goIxdXXGAJ3dxlRC7e880s
	 RnwfefH4B8b6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] drm/bridge: ite-it6263: Advertise HDMI 1.3
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261001-bridge-advert-hdmi-caps-v1-4-f8806570e243@collabora.com>
References: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
 <20261001-bridge-advert-hdmi-caps-v1-4-f8806570e243@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 01:23:12 +0000
Message-Id: <20261001012313.3C82B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused macro MAX_HDMI_TMDS_CHAR_RATE_HZ left as dead code
--

commit 4c0965b876d8cee6ad2805996d389a95afff88cf
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/bridge: ite-it6263: Advertise HDMI 1.3 capabilities

This commit advertises HDMI 1.3 support for the IT6263 bridge and sets the
maximum TMDS character rate. It also removes the now-redundant
it6263_hdmi_tmds_char_rate_valid() hook, as the core DRM helper handles
these checks before invoking the driver's hook.

> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge=
/ite-it6263.c
> index 550999491086e..e8e0197171e10 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
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

[Severity: Low]
With the removal of the it6263_hdmi_tmds_char_rate_valid() hook, the macro
MAX_HDMI_TMDS_CHAR_RATE_HZ in drivers/gpu/drm/bridge/ite-it6263.c is no
longer referenced anywhere. Should this unused macro also be removed to
prevent leaving dead code behind?

> -		return MODE_CLOCK_HIGH;
> -
> -	return MODE_OK;
> -}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-bridge-adv=
ert-hdmi-caps-v1-0-f8806570e243@collabora.com?part=3D4
