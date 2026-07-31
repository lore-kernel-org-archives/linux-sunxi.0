Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38912F83A2
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522703; cv=none; b=GeLnCN9QKwB/06cL+Gz+rMiJmkeeihS4Eh0i2NFG+blyE+4z5fBuFK9+tW9m/A/TQJQEhT36F0J46AVhBjfk+BYIlao/LGZD9+/u9g2qHEMyae5lJhHQiM+2iTwiFZNi9AZTyk+fbcGhY8AypV6LYPTfwqnxw83D8bNS+vCOePo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522703; c=relaxed/simple;
	bh=lZWd+7HgHThrU2YdD66QMyUyjTkzGApbYivOq9Fbn0A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AW/rtnSDPlpBuBWbUhewAezz8+aD+tkYCfKIl2pJlasjHHQNmbtG70vgnUUQtz+y6a/ElwyYnsx+CDNUIyq8je3aJIsJYFjT7WJawTwxJlLutPhwjmv65wl5k5IKOOyf+gvrSZ40DUFRea0A2hrhArp5hCr8vYsAx1SerfdCFnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S669h1iW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S669h1iW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695A81F00AC4;
	Fri, 31 Jul 2026 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785522701;
	bh=vkl4mNUOmfBTL0RLtoKzHBw73Pl5gzZLcFculT6MCkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S669h1iWmnBBTVF1vRff3jzyATBudFbYvFSdjS8b6kbqWFo1JQfI+PHj47VoZOQiT
	 vrfXjNYMA/uwBPiPb8mRd9irPW6byTZZrD4BxMaKWVdikEeo0NLFc/f2CE4987Q/EF
	 Jinugi2M/5x5PkVQhY7rOpPJc5Mxur4F/W3TpLtJXYSdrOTtmuwv++DEhY3OSDL9AN
	 lXFi1MJmU3KwsZ4YBjoOOY2CQCNyJ4raPtXohWcfGR1jbbj3ByaoqWtTymKsZHrAu8
	 vHtPj/bQ0K6rnvqY3JLkv/vVuPH+5dBgfz/mBMWMrtU2/+VvUa1baSs1SCMF0C5m2o
	 PA8yYAV7yot3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 18/69] drm/display: bridge_connector: Switch to
 .force_ctx() connector helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-18-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-18-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:31:41 +0000
Message-Id: <20260731183141.695A81F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch replaces `drm_bridge_connector_force()` with `drm_bridge_=
connector_force_ctx()` and calls `drm_atomic_helper_connector_hdmi_force_ct=
x()`. However, `drm_atomic_helper_connector_hdmi_force_ctx()` is neither de=
fined nor declared anywhere in the kernel tree. This results in an implicit=
 function declaration error and undefined reference during linking.
--

--- Patch [18]: [PATCH v10 18/69] drm/display: bridge_connector: Switch to =
.force_ctx() connector helper ---
commit 01a7e2cca1b495d499fd78712842111769ad4146
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
drm/display: bridge_connector: Switch to .force_ctx() connector helper

This commit replaces the drm_bridge_connector_force() function with a
.force_ctx() implementation. It hands the acquire context over to
drm_atomic_helper_connector_hdmi_force_ctx() for HDMI connectors.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c

[ ... ]

> @@ -322,6 +311,19 @@ static int drm_bridge_connector_detect_ctx(struct dr=
m_connector *connector,
>  	return status;
>  }
> =20
> +static int drm_bridge_connector_force_ctx(struct drm_connector *connecto=
r,
> +					  struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *hdmi =3D bridge_connector->bridge_hdmi;
> +
> +	if (hdmi)
> +		return drm_atomic_helper_connector_hdmi_force_ctx(connector, ctx);

[Severity: Low]
It appears drm_atomic_helper_connector_hdmi_force_ctx() is not declared=20
anywhere in the kernel tree prior to being used here.

Could this result in an implicit function declaration error and an undefined
reference during linking when building with DRM display bridge connector=20
support enabled? Is it possible a prerequisite patch introducing this=20
helper was omitted from the series?

> +
> +	return 0;
> +}
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D18
