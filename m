Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9843787A
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380808; cv=none; b=mcgsC+kLfMqPS4yPLBlO6JVr0iz3ijePN3KGawlaAkG/3GEidAPDJli+H/0dOmC6Ta2X+AHTvr8lEv1IZgMzJOKB71YtWY8bkXqBGAUfTUBw+MXu9pN81uGYZn8Wl19KO8JTfOs0uWx5SziklZ6qhJjd8KPFj9i9gJVP3WZORKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380808; c=relaxed/simple;
	bh=clXcKO8ha5lpNLTYqRvE2MTXBn+N1Ho1YeAKHWa5cpo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IstnoeiNarFiWq2zvP8l9al+3BjiYlwP7iW7nONFlKXe669Xu5lIik7Kcjb7ha3pgS9DGTmUZDhbU0Pd4cZIlNFivywhTes83QWyX0I6BP7wuqy5nk5iygBupDP525hCkUNDFFWCJ1kuH05n8XvLBIVd7C3dUSoL51zmHWIOMRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIKXnYsD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIKXnYsD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74161F000E9;
	Wed,  2 Sep 2026 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788380807;
	bh=Wisf+oTKsU2kjQO2KN2NHHRgZZOhJDxxTx77HGny7zY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SIKXnYsDw0GXOmg+Ma6G1mSJMfRKZX4jQCVB3rVuOUFHe45KrgUMO+dbZ4BIkZ8eG
	 G+ABqEsPqY512PhjKzOb1rk0oZwgg2GpYIBujC7OXYqh7Ql5yRUi8tvYJN6dthLYIJ
	 Xex8+e43VtCLbOYCZW0nU8VTCX8JnuRHH6cI0v0YBYg2im22RgQ+3ft1v3yLEk2pMG
	 Xr9E6Ly9azFgrLLblnHHPf/rJw0E9+v1sqIfq/wAAhw8FR0/c+gvOFYx6mdajiHt2u
	 4/syBSmH4ZGlcWPUGmTXswK2pvck88r/VR9Kl7M6cx2oAjlFFQ1w+iPhodeUwfO3N+
	 YGtPVh33kZBmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] staging: media: cedrus: Use
 devm_of_reserved_mem_device_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
 <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 20:26:46 +0000
Message-Id: <20260902202646.E74161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Early IRQ registration and incorrect devres initialization order c=
auses kernel panics.
- [High] Devres cleanup clears CMA area before userspace file descriptors a=
re closed, causing memory corruption on free.
--

commit be60086a6fce8e7046d627a68c0fd2fc94983ddb
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

staging: media: cedrus: Use devm_of_reserved_mem_device_init()

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 444fb53878d12..4a15f45ad077f 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>  		return ret;
>  	}
> =20
> -	ret =3D of_reserved_mem_device_init(dev->dev);
> +	ret =3D devm_of_reserved_mem_device_init(dev->dev);

[Severity: High]
This is a pre-existing issue, but does tying the reserved memory cleanup to
devres cause memory corruption when userspace holds file descriptors open?

The driver unregisters the video device via video_unregister_device() in
cedrus_remove(), which does not wait for userspace to close open file
descriptors. Userspace can still hold v4l2 buffers allocated from the
contiguous memory area pool.

By using devm_of_reserved_mem_device_init(), the device's memory area
(dev->cma_area) is automatically cleared on driver unbind.

When userspace eventually closes the file descriptor, cedrus_release() clea=
ns
up the context:

drivers/staging/media/sunxi/cedrus/cedrus.c:cedrus_release() {
    ...
    v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
    ...
}

This will eventually call dma_free_contiguous() to free the buffers. Because
dev->cma_area is now null, dma_free_contiguous() assumes the memory was not
allocated from the device's reserved pool and falls back to __free_pages(pa=
ge,
get_order(size)).

Since the contiguous allocator returns exactly the requested number of pages
while __free_pages() frees a power-of-two block, won't this free memory
belonging to other allocations and cause severe memory corruption?


[Severity: High]
This isn't a bug introduced by this patch, but is it safe to request the
interrupt this early in cedrus_hw_probe()?

Just above this diff in cedrus_hw_probe(), devm_request_irq() is called
before dev->watchdog_work and dev->m2m_dev are initialized (which happens
later in cedrus_probe()).

If the bootloader leaves the hardware active, an interrupt can fire
immediately, and cedrus_irq() will dereference dev->m2m_dev:

drivers/staging/media/sunxi/cedrus/cedrus_hw.c:cedrus_irq() {
    ...
    ctx =3D v4l2_m2m_get_curr_priv(dev->m2m_dev);
    ...
}

Since dev->m2m_dev is still null, won't this cause a null pointer dereferen=
ce
inside spin_lock_irqsave() in v4l2_m2m_get_curr_priv()?

Additionally, devm_request_irq() is called before
devm_platform_ioremap_resource() maps dev->base. Because devres cleans up
resources in reverse order, dev->base will be unmapped before the interrupt
is freed.

If an interrupt fires during this unmapped window (such as during driver
unbind), won't cedrus_irq() access unmapped I/O memory and cause a page fau=
lt
or similar abort?

>  	if (ret && ret !=3D -ENODEV) {
>  		dev_err(dev->dev, "Failed to reserve memory\n");

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902200703.2016=
410-1-mukesh.ojha@oss.qualcomm.com?part=3D6
