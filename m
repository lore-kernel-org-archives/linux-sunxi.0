Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624C349D591
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 07:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715235; cv=pass; b=ODKffI7HdCSPMvxKRUf75XikQQhLhYm+gV1j38Lj41UDPLrNOaem7av804PH3DeFb6egVIycrc2P2NHGYJxkt+9ndlaZYlsgW3A7YHejR94iTs5Ilfa5h5QOqcwVY1+mxCcx1ec59ZRxm8tmHL8N7rhOe+RFE8gv4KVKGSsNlMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715235; c=relaxed/simple;
	bh=hnGmBkKP9ldG990awhuRYySkLT6FFnTZIuKmIFeC1Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHZ90l2d63jQm+/CpqTGJHeWumIxTAQHSOq5lwlGHd0AsBgDFyKsf5idGenbwnThUUc80XNOwpwsrolfbHJYYraqkIbuy5Bit7TMU7nFoRPa/hHb/AFHQCvRCfPOCFgr2K1dhjbpUpYbbNqPddmDoyfkytxzBV7OfuzjeE9L4tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WJJE+0Mt; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WJJE+0Mt"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8d881so444404d50.1
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 00:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789715223; cv=none;
        d=google.com; s=arc-20260327;
        b=lpFBZsfILODJtnrR3sZk58P5Tas5ktP4flgEBqSf7CLOqtPSJtQLEAbdFIikS4dxBQ
         ARkNkIQTSnz8siB6gjC8zbe7M0ET902nixqyNComg8wXIIzzB00CKUWurR2lz+6+Kqe/
         KFqmLtkU79oBxwbvxewtD2rwUA339V/pb4In1cPdj0yWtbwClFzvlNy8KOlFkwMs6d6n
         D+31Xr361Kn8vqakrMTmZ8/Z283nKTnxx0Ky8KnmLRvOpbPSRaiXw78UlX90KeUvaeV0
         sw4cmij+lSDOcGx8XdRUrRzE/tzucHElK89a8F3KoUEuxY1EiTBxD1TmyAONvOrRBHqp
         tZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=;
        fh=2lEWxdJuuDfrtVNNxxOxl12V7mgp3KQ7B8vIkjrWUrg=;
        b=jkKDP3uYsUSl3yVtY+Ms6I+Md5oymOLIAFLdVVbDY9i02Gcoja4R5D+QgWIB5FcNFB
         7oWQJO1Qy2/W56sJCbR8exDu6DHS05URONIQDXanvZBxUOVgDn7IfBm2qjq25PyGwd92
         eWOLKPUKGCw+6PJODSmW5MMDJvDU6EjBPQUp8pHlgr+CDvgThSUCYe0nOD7sSXbnPIyk
         ELzSAJEoDIazBDshvIv+yfWBhTIhGV3G4JVu3p2UVSvb8sIhha+fK/QXmt8AVdvnMq6t
         GKbviF+GEFmfXVwP+2BFe2EJYg9f1uqD4FTBMgjpotnZ4YZXoOCnXCjB31mAXJMMzUpN
         irug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789715223; x=1790320023; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=;
        b=WJJE+0MtbBwQJMbBdYRFjNqvzY1PLEfcKCmo2knoBdKA4K9hrJRrHS83ehaiNpdiyw
         m9ZkriRyVHdO5qq4CEc94iJwMKO70FT6d+Ge1qo2Wa7iuwe80fD58SI82vBOOEHAgcv5
         Tx85Gots8bR2HkEe3xETJloYkY8kkV6a9YbgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715223; x=1790320023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVTLUeibsWBPZCdD+qqGVF/fmQVK7DA4WjMhu8zs7u0=;
        b=JQ8bjsVxfNetJe60v7d1iDfEJz+vOcrBsSzULcIPMw4SYriewHEKyM53EpOkMuzaLo
         xY4y335pl4HWPF4+toIzcteLVM2qc3suTEvULmF9cJgvKGV9YqavBXPjUok1fzZU3iaJ
         wD3HC6RXA4d+VQtJin53XHMjzsIMskyQUWoCS1eb/kqZkPVh/4PqDZ+IGL4tIY85Kw/C
         MBWnlJYh8whMU35IAULiKGavt8QYS+oVp7oZF8U4FSlZeNU2+99w4KD0gyjanUIn96O2
         O5+nmMzFO9CYAhvBv6kwwP14z/SL1m0/58x7OTPMpIrVkU8lDJlE4GZ5+WngA7n5nq+Q
         ITxg==
X-Forwarded-Encrypted: i=1; AKwUvBy4Rdm09R/bw9K569T04KZzW7WPh3GNyLeU+IKqOSEP4tkCVniXhbVU123SwUh2q7JGC876hV0USH9pLw==@lists.linux.dev
X-Gm-Message-State: AFuF++l/lfbDvBJ4dew6h4oOsRnx/3oaSl+6qFPgf543LjwCYfZqd/Qm
	koqPH4W3lMHh9h+y7sEC52layKmSI0yH2Y5ffrepBxcQvuLVdKRDN2FQdjrb9uTqG5Q5eSG6njv
	C1RJ7JMgnjAVeo5+kVxQWUq2l+rPYjYMZl1MZ1pU+
X-Gm-Gg: AYBFou2lErjCrW0WYXlqUYPyOsIJWzE3jeFL4EBLIB07sJ1qukmZYqVqZqoA4xgGFDl
	IATQWP2SjV9vhFVV0rW1K065OdL82bo92HiL6WZ+6VyhJ4VRkROEF5y3ivVN/EqRFVW7/UXRQ8x
	hGOq2tACIdJOV6ud4TyWQpUlHPGqzrFz6UL66HMj4pLz0PxjuHbmkqSnPepjtU0eIusZn7/yAs4
	nKEUCMAXcDZp+rXUnY3fNQ0rpGv5a1VQ27Qr3vNbSEg6eRVeSkjLQr+L3LeECTYnoFuamS396My
	DtdAErEiCjq5vsyR4xP/jqjSlqLRuGSt0vavtpbaiG9mBqKp3ld4Jk/euc68xU1H2gXHrUORxPP
	WRDn4CwAAPA==
X-Received: by 2002:a05:690e:c4d:b0:671:7b0:e5ce with SMTP id
 956f58d0204a3-6717fdf1073mr497902d50.75.1789715223118; Fri, 18 Sep 2026
 00:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <20260916033327.3054126-2-wenst@chromium.org>
 <f6ace486-70d8-4e81-89cb-e9d55ad9ac8b@suse.de> <CAGXv+5ErgWVNtnRiW+QA7+Mzh=W_Y+HGL_iRa1fOaXCYSoAwMA@mail.gmail.com>
 <f7fa4c4c-bc59-4822-94bb-6e9d68f8f0ca@suse.de>
In-Reply-To: <f7fa4c4c-bc59-4822-94bb-6e9d68f8f0ca@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Sep 2026 15:06:51 +0800
X-Gm-Features: AcwNN1VLg__gblp0p9qUFHinFpHutsjL-_8trTnXduaSEQp1OhTN0-X1tjhNQaU
Message-ID: <CAGXv+5GNjKxzHuBn28PbRtbFA1yuJ7h02xDpght4add3emuKJg@mail.gmail.com>
Subject: Re: [PATCH RFT v2 1/5] drm: Split framebuffer pixel offset
 calculation from drm_fb_dma_get_gem_addr()
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

On Fri, Sep 18, 2026 at 2:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 18.09.26 um 06:16 schrieb Chen-Yu Tsai:
> > On Thu, Sep 17, 2026 at 11:20=E2=80=AFPM Thomas Zimmermann <tzimmermann=
@suse.de> wrote:
> >> Hi
> >>
> >> Am 16.09.26 um 05:33 schrieb Chen-Yu Tsai:
> >>> Currently drm_fb_dma_get_gem_addr() calculates the offset into the
> >>> framebuffer memory for the framebuffer's unclipped source coordinates=
,
> >>> adds that to the framebuffer's backing storage, and returns the resul=
t.
> >>>
> >>> We are about to add a variant that uses the clipped source coordinate=
s,
> >>> so there is already some reuse of code. However, calculating the data
> >>> offset for a given pixel is not specific to the DMA FB helpers. The
> >>> offset is only related to the framebuffer.
> >>>
> >>> Split out the offset calculation into a new framebuffer helper so tha=
t
> >>> non-DMA users can also reuse the same code.
> >>>
> >>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Cc: <stable@vger.kernel.org> # dependency for next patch
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>> ---
> >>> Changes since v1:
> >>> - New patch
> >>> ---
> >>>    drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
> >>>    drivers/gpu/drm/drm_framebuffer.c   | 45 +++++++++++++++++++++++++=
++++
> >>>    include/drm/drm_framebuffer.h       |  3 ++
> >>>    3 files changed, 51 insertions(+), 25 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/dr=
m_fb_dma_helper.c
> >>> index fd71969d2fb1..ab0f37d8a5ff 100644
> >>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> >>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> >>> @@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_fra=
mebuffer *fb,
> >>>                                   unsigned int plane)
> >>>    {
> >>>        struct drm_gem_dma_object *obj;
> >>> -     dma_addr_t dma_addr;
> >>> -     u8 h_div =3D 1, v_div =3D 1;
> >>> -     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> >>> -     u32 block_h =3D drm_format_info_block_height(fb->format, plane)=
;
> >>> -     u32 block_size =3D fb->format->char_per_block[plane];
> >>> -     u32 sample_x;
> >>> -     u32 sample_y;
> >>> -     u32 block_start_y;
> >>> -     u32 num_hblocks;
> >>>
> >>>        obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> >>>        if (!obj)
> >>>                return 0;
> >>>
> >>> -     dma_addr =3D obj->dma_addr + fb->offsets[plane];
> >>> -
> >>> -     if (plane > 0) {
> >>> -             h_div =3D fb->format->hsub;
> >>> -             v_div =3D fb->format->vsub;
> >>> -     }
> >>> -
> >>> -     sample_x =3D (state->src_x >> 16) / h_div;
> >>> -     sample_y =3D (state->src_y >> 16) / v_div;
> >>> -     block_start_y =3D (sample_y / block_h) * block_h;
> >>> -     num_hblocks =3D sample_x / block_w;
> >>> -
> >>> -     dma_addr +=3D fb->pitches[plane] * block_start_y;
> >>> -     dma_addr +=3D block_size * num_hblocks;
> >>> -
> >>> -     return dma_addr;
> >>> +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, pla=
ne,
> >>> +                                                             state->=
src_x >> 16,
> >>> +                                                             state->=
src_y >> 16);
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_=
framebuffer.c
> >>> index d32aceb6ca9b..9e1231162047 100644
> >>> --- a/drivers/gpu/drm/drm_framebuffer.c
> >>> +++ b/drivers/gpu/drm/drm_framebuffer.c
> >>> @@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_pri=
nter *p, unsigned int indent,
> >>>        }
> >>>    }
> >>>
> >>> +/**
> >>> + * drm_framebuffer_get_block_offset() - Get offset to start of pixel=
 block for
> >>> + * the given framebuffer and coordinates.
> >>> + * @fb: The framebuffer
> >>> + * @plane: Which plane
> >>> + * @x: x coordinate for pixel
> >>> + * @y: y coordinate for pixel
> >>> + *
> >>> + * This function will usually be called from the PLANE callback func=
tions,
> >>> + * or from one of the helpers that calculates the framebuffer's DMA =
address.
> >>> + *
> >>> + * Return: offset from start of framebuffer to start of pixel block
> >>> + */
> >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, uns=
igned int plane,
> >>> +                                  unsigned int x, unsigned int y)
> >> Better use u64 as return type.
> > To avoid overflow? Not sure who would use crazy large framebuffers, but
> > doesn't hurt to play it safe.
>
> I'd be worried about a malicious user space that tries to access OOB.
>
> Apart from that, we use u64 for other framebuffer-related sizes like
> pitch calculations or dma addresses. Using u64 here would keep that
> consistent.

Indeed. It seemed weird that the helper originally used u32. Maybe it
was carried over from CMA on ARMv7, which predominantly only had
32-bit address space data busses?

>
> >
> >>> +{
> >>> +     u8 h_div =3D 1, v_div =3D 1;
> >>> +     u32 block_w =3D drm_format_info_block_width(fb->format, plane);
> >>> +     u32 block_h =3D drm_format_info_block_height(fb->format, plane)=
;
> >>> +     u32 block_size =3D fb->format->char_per_block[plane];
> >>> +     u32 sample_x;
> >>> +     u32 sample_y;
> >>> +     u32 block_start_y;
> >>> +     u32 num_hblocks;
> >>> +     u32 offset;
> >>> +
> >>> +     offset =3D fb->offsets[plane];
> >>> +
> >>> +     if (plane > 0) {
> >>> +             h_div =3D fb->format->hsub;
> >>> +             v_div =3D fb->format->vsub;
> >>> +     }
> >>> +
> >>> +     sample_x =3D x / h_div;
> >>> +     sample_y =3D y / v_div;
> >>> +     block_start_y =3D (sample_y / block_h) * block_h;
> >>> +     num_hblocks =3D sample_x / block_w;
> >>> +
> >>> +     offset +=3D fb->pitches[plane] * block_start_y;
> >>> +     offset +=3D block_size * num_hblocks;
> >> User space controls the values in fb->offsets and fb->pitches.  I'm no=
t
> >> sure how well they have been validated already at this point. Did you
> >> investigate this?
> > It wouldn't be worse than before, since this changes is purely code mov=
ement.
> >
> > There are minimal sanity checks done by drm_internal_framebuffer_create=
()
> > in framebuffer_check(), such as offset overflow or pitch size too small=
,
> > but that's about it. It would be up to individual drivers to perform mo=
re
> > checks that match their hardware limitations.
>
> Right, makes sense. Looking through the framebuffer validation, a
> buffer-size check could be done in framebuffer_check().  But that's
> another patch series.

That's further covered by drm_gem_fb_init_with_funcs(), which
drm_gem_fb_create*() goes into. I didn't check all the drivers that
implemented their own .fb_create callback though.

- rockchip uses the GEM FB helpers
- MSM reimplements the GEM FB helpers, but does have proper size checks
- nouveau has size checks
- omap has size checks

> >
> > What sort of issues are you thinking about?
>
> Again, I'm thinking of malicious user space that crafts these values to
> force an OOB access.

I think we're covered.


Thanks
ChenYu

> Best regards
> Thomas
>
>
> >
> >
> > ChenYu
> >
> >> Best regards
> >> Thomas
> >>
> >>
> >>> +
> >>> +     return offset;
> >>> +}
> >>> +EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
> >>> +
> >>>    #ifdef CONFIG_DEBUG_FS
> >>>    static int drm_framebuffer_info(struct seq_file *m, void *data)
> >>>    {
> >>> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuf=
fer.h
> >>> index 38b24fc8978d..c07aea1cc59f 100644
> >>> --- a/include/drm/drm_framebuffer.h
> >>> +++ b/include/drm/drm_framebuffer.h
> >>> @@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffe=
r *fb);
> >>>    void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
> >>>    void drm_framebuffer_unregister_private(struct drm_framebuffer *fb=
);
> >>>
> >>> +u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, uns=
igned int plane,
> >>> +                                  unsigned int x, unsigned int y);
> >>> +
> >>>    /**
> >>>     * drm_framebuffer_get - acquire a framebuffer reference
> >>>     * @fb: DRM framebuffer
> >> --
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> >> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
> >>
> >>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
>
>
