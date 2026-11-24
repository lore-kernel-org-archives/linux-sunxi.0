Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515769;
	b=3MCjJr5f/GNpO7IYGPMT7CrQizC4SSGRiwCt+4wpKBIReT9Xt8tZMGD/hWvqjw3I716F
	 SDefrpJf5ajaJYB1U5vhqw3rrk+2G7RxACTu8++J1UPnGXl6BRburl1Roel+O3f4wgkFV
	 Z115yp6z2YwTLM6yNJ7aoIAi32igYya8DbxkNRV3Qs6FBM8okiHMPA9NnkMVICtUhs+KP
	 MvLYz9Vf4IjL2JhlPog87LrwmjP5ewxkWxwMJ9DGjiuFyzQYefOcaK6nzRgc5b20HQ3AP
	 ep8qLaNvDvLJbhCgyOPDq+l56eisf9xyQNrlaSOmDfuKkjjatu3iEuZfXqmBvvd/QZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
	b=pgZwUsJ+cxsgLWQXJvmHwt3b+QSgM0GjAXR1c4mf4ZYYyhPjj2ZU7saCfCCR8S//2uQS
	 slawuOBNJpAvB6dvYjCMm7hY9WBGD2oSPTCZbPOGjaHp4yZeh6dZvVC6kjUsybKKwllbK
	 FajTyDsyGK6DfIJiXR8hYxSJBs2x9HKA68qRHuNkCjXIF47e/968H20VYMHZv813leK3T
	 ENlwlrTsn1AcmKXnmzsFpwEqVkTpbrQ5I6Fpv5UzQebyusZ5hYwEAjroX5U5vYZ9K0fNU
	 JWneSk4jemssdgawmp+9vAoMKN0o2CxYyTuGO1uxfeoqhhC9fmG608qUwxSVlf/a5HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E73HZq1A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B670606A326
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 10:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B670606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E73HZq1A
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so28408607b3.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 02:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515768; cv=none;
        d=google.com; s=arc-20260327;
        b=X1qFNH0pW2MirtD/PJ8K9bmx/P+Tn6Cfm8y9DYANaXVzqSVQR7iF8SmoAK/dNyXetn
         Ty0Btm3IyUw6PGg2QdyvOpRogAhBs/dRXkkh7TYFWLP5vFQxpUfDg+Fc4jC1zJJoO8Cy
         I80EeKuvI6Qr5iZGQaQG2JkA8Uc/qaGM2Vwz6obptzEdZT23fLAdWnm0roztIlUKc80l
         /utJ229R71pYmtM6EMZYmgS+EeUMg3i3QtcZycF5itnUbuX244o7SVptNFeLkVC3dzPM
         X4hc1AK33EkTDbYu4idLl3iLWVxVglcFif18anMqa5xCvDjm07mn41oyGhlJ5WuWxhn3
         sIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        fh=ETOYB05v8c5BM8/O1z8XSuT8m+v7XJSzQcle/T7a+eE=;
        b=FjmxvZ/yd7nNaBnK38ZgXJtBD8swHmdNr8rJRE1UV9bXJ3pXcd7qeFIXNn0efs5cCf
         pUnY1OpJTluX6zA/j4zFSDYOV6zXdxjJfddnaWUpC6oTU+1d3CqwwDCPrEV4kJQFwBin
         9DJrBMQEhwAuMe7Mi/To9RwraAYyJnuqbMC6Z+RXktaYSBBT8RkCBxMVhUzHWQUwB5lM
         g16y0047BcL5cLrNIKISt0s804rr9KTn3XHwqhJaHHOEPygUGHpWYjVKZudqc/PQhOAV
         GL3Ja6K7BNRlJUL5ZJUbzJFlZLw2wIAB6FvS3X+WgvUb1tuwLQMC+LoFgV2HUO6WKsC2
         NYvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795515768; x=1796120568; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        b=E73HZq1AZY3A8zSMUOQwiVHyNHj0Fu64cjfjT0o9KkBQXei17HjJJ73maDXhcXtv0O
         0IQN02+9u0aWg1sAvTCBqdydEqvn9w8IEpmEO2IUG2eAcmYjaDy7oYS+IyKtkszfOBFl
         7eUl1lnfy4Z8MioWV3d/myqP6dlg7gUa/T1g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515768; x=1796120568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        b=LdJLfdKPJ6ZW7yHPhdDbB2HmOoSVMcLq5p5rJFOeDaJ/LYc19R+CPXitmyp3aweFGw
         wBZe4Y5KsPq+q+SqxSV7BuHi5uG2euPZ0zHvm1/2Fvi9VW5yGmKcw1z1adA+37jng3QD
         RDCOq5kzyMxuKr5vtJTT/vhcwSa8MknPfHT6eR6nYgTL9BsYKCvoO/5/uM4i1Pf+prMc
         h2aQUTY/TSDrK2SLb5/eFsBMY7p+I7LRKXRvMENDxyUA7VEz2axV9VaUuOm8MI0BaxRX
         OnAJCTFWGE6UPcj0RHoZ9n82Jj3XeKCk9JZB1LHIh9jIpOfp+dBE/1MPwQMyDGfXIMsa
         eJnQ==
X-Forwarded-Encrypted: i=1; AL+hErEPRRR116WCdjhBzjMYDfP3hvr/Uh4O8zzHIwtlFibO33SFylqvjqrKna7LeE6kSOqL4cCP1E7gzsatiQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8BU/jiikSaR0Uot+8uKnNa5+1NRh1jm693wb4Nw7XIBzEz9mYp
	7DyRfIYuSzHG82M0x/HviWp0ckYfAm3zC6zsjvYlupM7VluAgCuGufWu3QNiNaKYRg1VD5lBzpu
	eQRBPt/92RjDgEasEmVubaMKwMQMkcQxB4rV8617E
X-Gm-Gg: AZFdTZcz61c7xsXkHeD1USKOdz9sjKMjXBt63rdtBPW8uWpKZTsIl1gUohm7hnBXhoA
	9lxCEClgU7YO5+uehCJBhl2JdBlTjjnU6B0rNz/fbKY42l2DOzdC0ip8MiXu3oTzygy1o6CUhlY
	cveZyRYoztX4//x4unnNEeSx0ZPU2K3gPlBxUlmlOCmfiKddnSHsan/KviryqHHA9HP6+k9Pqs4
	ubfgGvHDDtqoZXYn6Rz1BLUyd3xYJ2n4di33iL0JhHkmC7lH480mULiyQI22n5+/G3/PBP5rXdb
	H9OmGdTdChTBTOLHUngr9Bhrv02A880jxdrrLNV46IwnT2i2p+lwp9DZQAmur6WEaVu491pRMm0
	z47nszh6bzylvQaaLVDhlylUqAoUsgK0syERcDi9gO3pUS1RciH8IPOJLBhvvWj9dZzw=
X-Received: by 2002:a05:690c:6e8c:b0:8a8:7e5a:dc2f with SMTP id
 00721157ae682-8b5204440fdmr67264947b3.12.1795515768163; Tue, 24 Nov 2026
 02:22:48 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261124074041.115251-1-wenst@chromium.org> <20261124074041.115251-3-wenst@chromium.org>
 <19cd5949-05dc-4107-bd2b-d8ad1e2332eb@suse.de>
In-Reply-To: <19cd5949-05dc-4107-bd2b-d8ad1e2332eb@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Nov 2026 18:22:37 +0800
X-Gm-Features: Aa3M54pNfcesZWo4EiEVJfs9QKzf9OEio3h9s-Qk4g3wBzB4RP2yK5vRHxNLzEQ
Message-ID: <CAGXv+5HSV7MJ96qTcOp+JaKWtmmYYWAmDROrT18pZ9PztNCJ-g@mail.gmail.com>
Subject: Re: [PATCH RFT v3 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 3:57=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 24.11.26 um 08:39 schrieb Chen-Yu Tsai:
> > drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
> > framebuffer. However some display drivers want the "clipped" framebuffe=
r
> > instead, as they are also using the clipped coordinates to program the
> > hardware.
> >
> > Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
> > the source coordinates replaced, while others have been incorrectly
> > converted to using drm_fb_dma_get_gem_addr(), which would end up
> > causing incorrect parts of the framebuffer to be displayed if it were
> > somehow clipped.
> >
> > Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
> > drm_fb_dma_get_gem_addr() for these drivers to use.
> >
> > Cc: <stable@vger.kernel.org> # dependency for next patch
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Use new drm_framebuffer_get_block_offset() helper
> > ---
> >   drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++---=
-
> >   include/drm/drm_fb_dma_helper.h     |  4 ++++
> >   2 files changed, 37 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_=
fb_dma_helper.c
> > index ab0f37d8a5ff..0aaf4926db4e 100644
> > --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > @@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(s=
truct drm_framebuffer *fb,
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
> >
> >   /**
> > - * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, =
for pixel
> > - * formats where values are grouped in blocks this will get you the be=
ginning of
> > - * the block
> > + * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped fra=
mebuffer,
> > + * for pixel formats where values are grouped in blocks this will get =
you the
> > + * beginning of the block
> >    * @fb: The framebuffer
> >    * @state: Which state of drm plane
> >    * @plane: Which plane
> > - * Return the DMA GEM address for given framebuffer.
> >    *
> >    * This function will usually be called from the PLANE callback funct=
ions.
> > + *
> > + * Return: GEM DMA address for given framebuffer, unclipped.
> >    */
> >   dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
> >                                  struct drm_plane_state *state,
> > @@ -86,6 +87,34 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_frameb=
uffer *fb,
> >   }
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >
> > +/**
> > + * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for clipp=
ed
> > + * framebuffer, for pixel formats where values are grouped in blocks t=
his
> > + * will get you the beginning of the block
> > + * @fb: The framebuffer
> > + * @state: Which state of drm plane
> > + * @plane: Which plane
> > + *
> > + * This function will usually be called from the PLANE callback functi=
ons.
>
> You should mention what clipping means in this context. It's not obvious
> what it's clipping against. Or maybe point to other docs that explain it.

What about:

/**
 * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for the start
 * of the visible (CRTC-clipped) part of the framebuffer
 * @fb: The framebuffer
 * @state: Which state of drm plane
 * @plane: Which plane
 *
 * A plane may be positioned partially off-screen, in which case it gets
 * clipped to the visible CRTC area by drm_atomic_helper_check_plane_state(=
)
 * (populating the clipped coordinates in &drm_plane_state.src and
 * &drm_plane_state.dst). For example, if a plane extends past the left or
 * top edge of the screen, only its right and/or bottom portion is visible.
 * Drivers whose hardware cannot clip by itself (i.e. accept negative
 * destination coordinates) should use this helper instead of
 * drm_fb_dma_get_gem_addr() so scanout starts from the visible portion of
 * the framebuffer.
 *
 * For pixel formats where values are grouped in blocks, this returns the
 * beginning of the block.
 *
 * This function will usually be called from the PLANE callback functions.
 *
 * Return: GEM DMA address for the visible part of the framebuffer.
 */

> > + *
> > + * Return: GEM DMA address for given framebuffer, clipped.
> > + */
> > +dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
> > +                                        struct drm_plane_state *state,
> > +                                        unsigned int plane)
> > +{
> > +     struct drm_gem_dma_object *obj;
> > +
> > +     obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> > +     if (!obj)
> > +             return 0;
> > +
> > +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane=
,
> > +                                                             state->sr=
c.x1 >> 16,
> > +                                                             state->sr=
c.y1 >> 16);
>
> I had to look several times to spot the difference to the regular

I suppose I should add a comment to make the difference more visible:

    /* Use clipped source coordinates state->src.[xy]1 instead ->src_[xy] *=
/

> helper. In any case
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

If the changes above are acceptable to you I'll send out a new version
with your tag kept.


Thanks
ChenYu
