Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8C94A3862
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294302; cv=none; b=Qk3/s+TsmA9a+2XrAC6y4lFjvovjPz6FLbRYF8oX0zdyiu+vdHlID54Fqq7jcMcguo9WzLqCbsFXdginn3ToS/2Ph/3vDnrfsYNRflx61GojLc97hfUqPo9m5z+g2YUoowvpPYUDNwZRmA9Sb6VwnQxK9gqyn7EodPXOZ0DTzn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294302; c=relaxed/simple;
	bh=EupIScE4CvGvN2TkE7L5SxbQ7Uk6YpJa2n72vYD133w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ITj+JdxNNwf85sRQjMaqPP/DmHfR2mbQc/u+QLvgYwfXt3BRHin2UvPvP+RoE9r9kut8+IUn7DuwMZcDx/Z1A0m4HYQY0VTUGC5E5l/6VHjur7FDatFYxfmOT+1nUzGWMYLJpmQc6BO4L3ESHJV54ELWeLiV3vLOQCM14RNgG0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMGmQdqS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMGmQdqS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC431F000E9;
	Tue,  1 Sep 2026 20:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294296;
	bh=sY1MV/aJmbhll6IpE85AlLpiMCq+eVtABRrN6TXDVdg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NMGmQdqSEy+Xffvi13OpuTuSjxjilvuKpz7khUKGsLkA++cu+Rq2B2j2g30yEwDc0
	 X8NspWUiO+be8KepwQaKx/SfRm1ThA6KKZ2HLaoi6ZKFsqpMgAfBYAWuF4StmU5cqd
	 g3IUa/5EMid7rKhxVqLi8FUKNqLEK1EMKX1OPNqrslsjg+we25Qb2Jzin/aOuUieTL
	 BuTDX/+Oa6Mre7aCMaJJv94sWP+Y7C4aaIoPbR5MCjBKSQUUVUMKieOpaS5Ws0jxQr
	 WPDZjBJqM5oxpYDbzS3ED2sf6IXxb4mQ3/AtlzPphQoAj4PjZgGxCStcXlUB/uaN7T
	 5yB2dV3wSfAEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 56/74] drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-56-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-56-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:24:56 +0000
Message-Id: <20260901202456.9FC431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sleeping function usleep_range() called from atomic context in bri=
dge callbacks.
--

commit e5405bf223ae48e74dcd786c773802d19ff07667
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4 capabilities

This commit advertises HDMI 1.4 capabilities for the RK3066 HDMI TX bridge.
This ensures that display modes exceeding the 340 MHz TMDS limit are
properly rejected by the core DRM API.

> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/roc=
kchip/rk3066_hdmi.c
> index f28d6a883e099..f748700b0ba6c 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
[ ... ]
> @@ -712,6 +713,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct r=
k3066_hdmi *hdmi)
>  	hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>  	hdmi->bridge.vendor =3D "Rockchip";
>  	hdmi->bridge.product =3D "RK3066 HDMI";
> +	hdmi->bridge.supported_hdmi_ver =3D HDMI_VERSION_1_4;

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing issue
with this bridge driver's atomic callbacks. The DRM subsystem defines atomic
enable and disable callbacks as atomic context paths where sleeping is
strictly forbidden.

However, the bridge callbacks in drivers/gpu/drm/rockchip/rk3066_hdmi.c
appear to call sleeping functions:

rk3066_hdmi_bridge_atomic_disable() directly calls:
    usleep_range(500, 510);

Additionally, the atomic enable path calls rk3066_hdmi_set_power_mode(),
which does:
    usleep_range(90, 100);

Could these sleeping delays cause kernel warnings or potential deadlocks
during atomic commits? Would it be safer to replace these usleep_range()
calls with non-sleeping delay functions like udelay() since they execute
in an atomic context?

> =20
>  	hdmi->bridge.ddc =3D rk3066_hdmi_i2c_adapter(hdmi);
>  	if (IS_ERR(hdmi->bridge.ddc))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D56
