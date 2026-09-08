Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4827A462
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788844647; cv=pass; b=USkgPgMZs9rXv46zgGJaPO1YP0zVMgVLxZcajeQxAI+X/y39NSZrW/fdiqtN+aKJdAXi8hkL4zCwdZ2eM0Y3HCXtzla1mRIsMC8pVeYowq/O2JxuCsGZeVTrE/+nlRM3pEnYX7gTpAlqFR2Tl5jOrGxpkvc3DH712kbt1PnwylU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788844647; c=relaxed/simple;
	bh=jj8iZbJ39WK9flKdG5MjPLxzl/UYfk7onXSn9gYx1lE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Exf2DB8y5IcFBJOkNrz/qsPphVEdDWUSYwdh3ciU5JK9MHbiwBzUz1oXV2RHle5FBXzsXt/fS9dRwnWo+k5YjFJ6L7SfSkwg1S8QIIF8D9k7oiYaRL/TNB+Kx/XNR1Hpzr9bTbGnirL9HmaLQ5TubJbAzx3RWtZIN2ZvJpCu9ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VBuJTTto; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VBuJTTto"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66fc7196ca0so2389671d50.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Sep 2026 22:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788844645; cv=none;
        d=google.com; s=arc-20260327;
        b=PNTvMUzABmY0si+Qz1J4sQZoGTf4ERZ9ntMp3k99Ti9WX4xqma8eIteV9TXuhGbCh2
         gbtzTWczWKkKWduzSE2f14RG0wIrP6/+ex+xQ9qEMPUgY4/jP6y8GgaogYyZDq6zvevA
         DQ8VY3pm0IPC9gUrVQURjmNJAakPl4knUAbAJS+MiorKSGRGecZYGHQ/L1mV3Bgb83dP
         XeYX1EvTDw10OIGbZ2v5ORXDk3pGGtUeWjx7xKG5E7Dsp6BWW4tEbMfaYCcei/+PUyJ4
         OP7ZmpzODiICUZUex5kNLBEa+p0HVwYYSDbWBwf8z1vkzlaoqSxMb0iUmCyWXFNYqMcS
         MP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=;
        fh=/3DNef0h/65jUhnpujeK1cxfDD9b5LWoN81HB1rYwtU=;
        b=PuTxPZX0FOye4P6xa+/k79AIZYgHssV3DoeAVtIAutqFNe4/kw78xCTbtIzVQgQh5L
         k1rilEeKi47eOI8twidBriqNPt9vFcjBJ1n5CKuNjVqYTn5FIyom54z6SL11le8Vq29J
         n3Py/KGplnxZM4OJqVAGTSfYNvd40TVRvhBZqcoeApKbEpQL7u1Vj3xWf5mDyuJrx3QB
         VeffjrX6sfNTtAu3ArOEqcbmkeR6Aa/SPUlU9QAHRyzwmumvyHKkvwv+ByRb0YVcMZUF
         dGn7UqNGjU20mmrunutt4hZwlH10ymOpbGLqQeybk/lLyooYtBx6D2D/Ay7ly8C0O2ZK
         a3cw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788844645; x=1789449445; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=;
        b=VBuJTTtoTsK5P373CujdNCn7P3BF++r3Abcg1/gPwOHKfKbb9urhs5Y7e0gtKvikn8
         sqBbF1+Jns+HpbZdz1OQtz2d6fP49099iE/P4lNB/aO68yUAi6cEfHdW0p8u0yGVa7d7
         grHSAc4Ly9lojH0GFvJ/ix/jis6cJOxcyKcMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788844645; x=1789449445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FCFgCrO8nYxa4w36rz8tfzjeCQplkAjHhgkmQ0tkA8=;
        b=nV52h9ECRR+H8oTrYANxhc+9dPw0lTtUG4jum02N6VIHjBJev0YG8YSILAvNXbMnjN
         encTZxgd45zNVCXL56mi6q5CxLFyoqCCKIFK7R9cyAigEIqzqiFM1JFSdF1ud0tGVPfQ
         k5JN7fntgU2NRLReA0G1PSs9xEgx06BorZmHOFK94KIsxpUFOTQgAHwqM23RcdCykdUz
         4SIfV+csrtw+8EPUrs6mL7aDlL7bxWPymJD3OUue2Jh9wfs+ha6iO4lpbVNlswRO/cii
         mdV6m91BWRfiqleT7TqawWcICPNdgr4Wibu18i3P/vBV0Ny/LvE3sQtBZhCiE84/YXbz
         g3pg==
X-Forwarded-Encrypted: i=1; AKwUvBxu5IYugRUzcsOAkDxYdAKynm5IRQsmaoOOOl2xddXQf9f2qIh7zGUr+LbNWQ8nuq+32PocU++reZ+gkQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kRh4U/zfz3bPNSeIPqZqYVsWHEGQ3X1gn92+7oKHy8Gtx39p7v
	0sMHMu5RqQfemq/mBBSoAhDaKCH8X93rAKiIBt/A5OlzdMWIu3rdWpctbOC7BMVMWOYxsaXrGUV
	acWCvn0Re5qsnBAD2UrIuE2XbMXJmg3vPj16aKAqR
X-Gm-Gg: AYBFou2d7o/Mb8ju3McD9L9rizqoXMV9v2dp7xf7vZslzXbjIGfO44TKLaFryVysyxJ
	YLEmJCvFRbOh5yrPGAH9FHYbQNynRt/gzmmMKEulxvvfXhG9RJrWkGHQouFNMPnQRNwHZoUYoHN
	3QnI26b230+83ve1XHnIQ55ahHx4vusOpbxJzYQSXJiAoaIjd5TYYuZ0d+lDz1k8qJza0vEYIBa
	PvIYzGC0RGKe/585FwdTcfu6/bv27fMt2PQKwcGMWCRppf3BpY36g4n2f6lMC9nsUB430hVm8o2
	0ZrHlagqbS+bJwRkcCz6z0UeTnOf1qCGDkcE9YMyHjS0JlWxrPGygkXb4sePkNXkbtjYl7tYPQM
	=
X-Received: by 2002:a05:690e:d49:b0:66f:c1bc:87db with SMTP id
 956f58d0204a3-66fc1bc8991mr4871587d50.52.1788844645029; Mon, 07 Sep 2026
 22:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908050229.754977-1-wenst@chromium.org>
In-Reply-To: <20260908050229.754977-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Sep 2026 13:17:13 +0800
X-Gm-Features: AcwNN1UvbZam4KMBF7rri3O2usHHuyHcUFKj6A3hEX1XxQedM-d5CJUALYS2SIM
Message-ID: <CAGXv+5FjHY36sHc+osF2ENjpz9Y97WDCzFEE0c+unXtyxR23Dw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sun4i: Align VI buffer addresses for subsampled formats
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
> get display memory") dropped the code to calculate the framebuffer's DMA
> address in favor of drm_fb_dma_get_gem_addr().
>
> This turned out to be wrong in a couple ways. The hardware can handle
> pixel offsets within a sub-sampling block, but the buffer address must
> start at the beginning of the subsampled block for all planes. The
> hardware then does the interpolation internally. However the helper
> gives the address exact pixel for luma, which messes up the result.
>
> Instead of reverting the commit, calculate the intra-block offset and
> adjust the buffer address so that it points to the start of the block.
>
> Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to=
 get display memory")
> Cc: <stable@vger.kernel.org> # 7.1+
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Please ignore this one. As Sashiko pointed out, this could underflow the
buffer address.

Instead this should be sent along with another fix I have that switches
this back to the clipped buffer address.


Sorry for the noise.

> ---
> This is an alternative to Jernej's original revert:
> https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785=
772659.git.jernej.skrabec@gmail.com/
> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 2e9cda45c04e..185e9e5211c1 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -207,6 +207,20 @@ static void sun8i_vi_layer_update_buffer(struct sun8=
i_layer *layer,
>                 /* Get the start of the displayed memory */
>                 dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
>
> +               /*
> +                * The mixer can handle odd offsets into sub-sampled YUV
> +                * planes, but needs the address of the first pixel in ea=
ch
> +                * sub-sampled block. Adjust the luma buffer address back=
wards.
> +                */
> +               if (i =3D=3D 0) {
> +                       u32 x_diff, y_diff;
> +
> +                       x_diff =3D (state->src.x1 >> 16) & (format->hsub =
- 1);
> +                       y_diff =3D (state->src.y1 >> 16) & (format->vsub =
- 1);
> +                       dma_addr -=3D y_diff * fb->pitches[i];
> +                       dma_addr -=3D x_diff * format->cpp[i];
> +               }
> +
>                 /* Set the line width */
>                 DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
>                                  i + 1, fb->pitches[i]);
> --
> 2.55.0.979.g7e5102b832-goog
>
