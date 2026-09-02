Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3653B1ECC
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381341; cv=none; b=KUb6dTnqIZCnHQm15dZfzMntJ1cfU+ie79SSzdf2R0aclsJoPdHgqePrnbt6vM+m3ovN1I4OaYrnXe66/LuNLO65H5t6/QqXU66S3pOSdbUxMoWZ3b4ADoLNVHpp4sbtRQKRNMNVFPWWKI4Ab/IfojovC3QiLbK2vSNentMQ0qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381341; c=relaxed/simple;
	bh=6oYUjI6iNMZkf1An7X4M8pqZvzY0Vzn2mnhYHa0hV8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0ZUoekbF3Ag1p5wxDeR6fcpZAcYa7RLGOpnMzBPp054I+qnsF+yzDQv/BBor+4hMRp1NVpqZXLTuE+djQZkJ8AzWw82WzP3QnHlxZ6H85kgguQ3LiVIHJQlytuek6iMFNoFraDNdYXp5t30lgIIR3k4NaITOBybJQK+kgSuZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKR0oxsE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKR0oxsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3E11F000E9;
	Wed,  2 Sep 2026 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788381339;
	bh=PxHB2HwsqAP6BSC9LExwzxr7NZTZnEg/EtVrzdf3vAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKR0oxsEfSobYydxOT0ECQMywVY0PrfwzfAqL1RHpC8KXZcNLCnftMwgQCv8sGwzN
	 vVbERzW5dDK75IuzXekK1IPvfP97sO/ImIemVN/MylfwsKVHBrGBEtNKoIBAmLAwxp
	 SCcccY0ZgWbCbX1qzp86lxJG+azBLi/h5kVX6kXUCyNEaJaOkzeW8fPZ6vSoLr7ELI
	 M3ssQCLvDUZsCv46zgN0/xsrQUZe5IdTzUIlEzvFXWefxl4BOB6Hx9p6mxIMfo5pB2
	 6+Wz9YCb3UpY73ANdDv+l2tFYjWeZfDVsaZ9aWGqkAfnOXG9fPJq8imSWn652BokMG
	 6fAg3sAttkIRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] drm: aspeed: Use
 devm_of_reserved_mem_device_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260902201640.2024648-11-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
 <20260902201640.2024648-11-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 20:35:38 +0000
Message-Id: <20260902203539.6F3E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using devm_of_reserved_mem_device_init ties the reserved memory re=
lease to the physical device unbind, which executes before DRM GEM objects =
are freed. This leads to a kernel panic in dma_free_wc() during driver unlo=
ad or when userspace closes the device.
--

commit af4228b344b701076f4bd88aa57c810ff4e26c48
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

drm: aspeed: Use devm_of_reserved_mem_device_init()

This commit replaces of_reserved_mem_device_init() with the devres-managed
devm_of_reserved_mem_device_init() to ensure the reserved memory region is
released on device removal.

> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/as=
peed/aspeed_gfx_drv.c
> index d4577663a1f0e..2c7e54fc35d93 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -168,7 +168,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
>  		}
>  	}
> =20
> -	ret =3D of_reserved_mem_device_init(drm->dev);
> +	ret =3D devm_of_reserved_mem_device_init(drm->dev);

[Severity: High]
Will tying the reserved memory release to the physical device unbind phase
cause a kernel panic if a user holds an open DRM file descriptor?

The devm_of_reserved_mem_device_init() cleanup runs when the platform device
unbinds, calling of_reserved_mem_device_release() which clears dev->dma_mem.

However, if userspace holds an open DRM file descriptor, the DRM device and
its GEM objects outlive the platform device's devres cleanup phase. When the
user eventually closes the file descriptor, the GEM objects are freed.

At that point, drm_gem_dma_free() calls dma_free_wc(), which relies on
dev->dma_mem to identify the reserved memory pool. Since dev->dma_mem was
already cleared during the unbind devres cleanup, it falls back to the syst=
em
page allocator, which results in a kernel panic.

>  	if (ret) {
>  		dev_err(&pdev->dev,
>  			"failed to initialize reserved mem: %d\n", ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902201640.2024=
648-1-mukesh.ojha@oss.qualcomm.com?part=3D10
