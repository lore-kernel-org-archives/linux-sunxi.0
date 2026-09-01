Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA28B49C4D7
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290474; cv=none; b=YUYCllzNwOHa15y2JySONf0L5mgGX7R+2+ZjaBWBxYWW/cdmXvH7Eth8nZ92QHeDfytgsOAn9qpaTczScDwh4Qvn+bFNv0nI5+KHIhA5ntcVq47kvhaK117h9fxwtqxoiatWtFZpDe1DDYAgYRbTT6dZgaW1bZPWZoYmlayi6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290474; c=relaxed/simple;
	bh=Lm01fRwPLb8aWsvjfDbm9IiI2rBsHow1ikYQOFIJHws=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oozeS/5qkFRjgVdNbmcTAhR98G0VZpdSZgk3IbqYoavceJZ0PW+guCbwMWgjIcGG2Kycdt7HSO01Zxm8pRLXh3mEt+g1WHxqE7q7oYyPYb0YH/3CM900gXLAyqcW1uc5ulKv05AEJFaSOj63kKChsjM4nrW8uAltbmiBj6MvdTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaKHsATk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaKHsATk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3311A1F000E9;
	Tue,  1 Sep 2026 19:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788290472;
	bh=frppt93FEzadBVcpQ4LxvoMz77bCweVZukFlb4YaBSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DaKHsATkIqd6/hc3Eq0WgMcRzLDsBuTxFXCdauWNcrAsyQ555fjROZQb832iHtoDh
	 d6/0+wqhCe0fseqZNie3a8TcLp20zi5+8rdc008r8akRhZ4Ekg2T3PSExlvdvqgG0a
	 ijGBq0WHB/lLCn5CnA/Yfviu7dAu4Yjsc8o1JCtujRZKDL4FxRBeP46YSGOMefWpo8
	 WeytKEPQdbaWQ9I2WCVygTWgDHlm77dFDfhUgFoLbZshcZFll2/owzbuFAPWNC79om
	 xjfz4GkkTYJf86PRfX1zOf5N/cnYOgOfFInExEm2wKmSzxlVRfztCYwFojW+/32BLf
	 qzE8X6x1vUhbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 15/74] drm/bridge: Remove redundant error check in
 drm_bridge_helper_reset_crtc()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-15-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-15-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:21:11 +0000
Message-Id: <20260901192112.3311A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] drm_atomic_get_connector_for_encoder returns a connector point=
er without holding a reference, leading to a Use-After-Free.
- [High] Double-unlock of connection_mutex due to nested drm_modeset_unlock=
 calls.
--

commit d2f773b296aa81ea66367361aef51be8375a8cce
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
drm/bridge: Remove redundant error check in drm_bridge_helper_reset_crtc()

This commit removes a redundant error check after calling
drm_atomic_helper_reset_crtc() in drm_bridge_helper_reset_crtc(), as the
error path and successful path both immediately fall through to the same
unlock label.

> diff --git a/drivers/gpu/drm/drm_bridge_helper.c b/drivers/gpu/drm/drm_br=
idge_helper.c
> index 420f29cf3e543..0a3c8fee66b32 100644
> --- a/drivers/gpu/drm/drm_bridge_helper.c
> +++ b/drivers/gpu/drm/drm_bridge_helper.c
> @@ -50,8 +50,6 @@ int drm_bridge_helper_reset_crtc(struct drm_bridge *bri=
dge,
> =20
>  	crtc =3D connector->state->crtc;

[Severity: Critical]
This is a pre-existing issue, but does drm_atomic_get_connector_for_encoder=
()
return the connector pointer without holding a reference to it?

When drm_atomic_get_connector_for_encoder() iterates over connectors, it ca=
lls
drm_connector_list_iter_end() before returning, which explicitly drops the
reference to the iterator's current connector. The pointer returned to this
function is then dereferenced here when accessing connector->state->crtc.

Could a concurrent connector hot-unplug event (such as an MST display
disconnect) trigger a use-after-free before this dereference?

>  	ret =3D drm_atomic_helper_reset_crtc(crtc, ctx);
> -	if (ret)
> -		goto out;
> =20
>  out:
>  	drm_modeset_unlock(&dev->mode_config.connection_mutex);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for this unlo=
ck
to cause a double-unlock of connection_mutex?

drm_bridge_helper_reset_crtc() acquires connection_mutex via its ctx. It th=
en
calls drm_atomic_get_connector_for_encoder(), which attempts to acquire the
same mutex with the same ctx. This succeeds immediately with -EALREADY, but
before returning, drm_atomic_get_connector_for_encoder() unconditionally ca=
lls
drm_modeset_unlock().=20

Since the lock is dropped in the helper, won't this call to
drm_modeset_unlock() result in a double-unlock, as well as potential data
races for the code executing between the two unlocks?

>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D15
