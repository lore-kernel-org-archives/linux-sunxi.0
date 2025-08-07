Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A811E8328
	for <linux-sunxi@lists.linux.dev>; Thu,  7 Aug 2025 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754562896; cv=none; b=Q6NZYh291wUcXomE+WbPlsDIcca6LTjJjcVKX0TsdWFXJ7UDHGCvn13XN5eBxcXT3xMvk/wXvIB8659eQYeMECAcK8oQgmuM+mV5m92jJ+3JeAMnD8PIPFKhlBKzIDYTq7gIaO5wWGldP/LzFkYCW+Jx8zeVVmsFDELFZYCWpdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754562896; c=relaxed/simple;
	bh=gwjFiegsOP4xcnWbW0X5ifEkq0MsOmbvf2Z95Us2gCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aM4oUD29NFGO4pu8KOC5vm77MsmX8xrOMbT1iVFpxPk8nYnA7i2SKmCrejTi2pUXx1JrG7mHQFz+Wx/y5c91/iqJdi71UTOe9TwKR17yL/D5nto3BN/pbEedBtkypPx7qBT7tgdtBshjq1bZqHDp2nhfE4QaVJNCWwIZkUSFUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zSjelgR7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSjelgR7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so461081f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 07 Aug 2025 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754562893; x=1755167693; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+jqpfHFtr9RJd+Rj5jDYwLXh+hHq7pFdE9Sw57Atqmk=;
        b=zSjelgR76w47JxdApvtszwaWQpvt6MGFjbIEDpG4fzBzYYVJhlq7niKdj0g0lxSdes
         pnQxI+bk8iDHLalqfsWV2OLbXwJy+7znx67CNLZCUCrKhFJNFdeB9YwlQqw7G4AvdtOV
         irgKQu5mFlfZ2obwyB55b2JUDpgF2wCFvGJJ2vlYSUpvk3t5H5wjeDVQcGIAwMZUFCLv
         iqRjxkn86zUWDGBLprWDcN9dcWbjh40R1CgBRE5HQQsHmTCKYzOQL8vIGgUAKyUiyhga
         j8s5987arOI5g7rA/Vwg3FadgCwHAoInIBlG1suhAzTt6IpLaKxqgC+GFtj8AqCoc6zK
         VzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754562893; x=1755167693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jqpfHFtr9RJd+Rj5jDYwLXh+hHq7pFdE9Sw57Atqmk=;
        b=QPmp+PsmLDzWVA6iab5g6nWtpCiN0n6H5YEcPRrJp9ay9vgyvPqlMmAfOjNEJ9sqHb
         b7bb8Z/bTNLTQJgT/u3ngb2XqeORqjMLbBESo88Alx3DI8C9ohIQ0ClbEnS9QPKUgCao
         Pd0sVKhnEmINQ3MBhYN13qiXwa0zIFoQZkRW4OAmevP39vY/zEy053j3ZPBkmlWOw9Pl
         P6ZVoXoZ4pzIq838wfDT/7CPV/57vFUgZ2eOo2DeGUnULwf3fb/V23IIN41wOI8aJkRV
         6vsCLR3VcG3jiUA0a4JG1vCbwXSSmR/sQHk5Oi81/pUk5jlswwa6rhKy9JiJUMla8FeV
         CHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCULHo5TOiP69OQQ0uAphjbStMMh7i46KZCj92BSWKFe0A7Vd4epUocYdon5MEPdOS/PEC77syOQ7CKZmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0qIdX1sPaojo+dAsjwQPT5WdS6WJzDTU4r+nqe23pnHBOBgTv
	BvXQmX34Tzy3HDfw9bHXvNF9/2AaLhC1FO9VNq+f7ZmOBUWwFBLl9gU5iMIQ9YtOjpA=
X-Gm-Gg: ASbGncuyyM/MvWNDbco5DDD7RG1uGjpNN+tQF65Npi86DQk73fBHBwx/ukoTo9J4f0s
	Vj4XJQWwzg5C2oxg9ojqJfZCd2Ag3u0j2z47k94Y4bEHXED63VIep6+yqIVP+kqpjBtVRBQTsoE
	82SIaPFhr/zMb/GwVqSSmgQE4lu/XWdJpXfDX/tJzrANYrcA2O6vHgin+oY90/Ifkx0FqtUH0uc
	Q+5FZEQRp1t7ncHbiM859unzL6YSa1eCDg25yYdG+nZLXIHLXbXYADOx3qOSpSgCpH3hG2xDyF2
	OFDI8zQUNxcwkJhbTF+RGpeh7p9AiVOxNJEiyJQfsUwtTkPuXPq2jVx/l01nw+yeUmGRGQPNNnP
	m6emASt5wzgNy0zFy6/9ENtT2i2A=
X-Google-Smtp-Source: AGHT+IEJZFFSnC6OyV3Ckz3ldGk5h0RG3Okc+NeFrocarUAZUjxcjd1haqhnntbT67+wRuAV6TUqug==
X-Received: by 2002:a05:6000:2f86:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3b8f41a837fmr5055520f8f.2.1754562892893;
        Thu, 07 Aug 2025 03:34:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b8ff860acbsm70000f8f.51.2025.08.07.03.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 03:34:52 -0700 (PDT)
Date: Thu, 7 Aug 2025 13:34:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, wens@csie.org,
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
	airlied@gmail.com, simona@ffwll.ch, jernej.skrabec@gmail.com,
	samuel@sholland.org, neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in
 sun4i_backend_atomic_check
Message-ID: <aJSBSLvIeSpvaYpK@stanley.mountain>
References: <20250314012029.668306-1-chenyuan0y@gmail.com>
 <20250314-prophetic-attentive-platypus-3ab214@houat>
 <CALGdzurT1_fY_o8Hv92j4+XFQHu1iHRzqVtZAM8upHYBPfA1BA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALGdzurT1_fY_o8Hv92j4+XFQHu1iHRzqVtZAM8upHYBPfA1BA@mail.gmail.com>

On Fri, Mar 14, 2025 at 11:00:26AM -0500, Chenyuan Yang wrote:
> HI Maxime.
> 
> Thanks so much for pointing that out!
> 
> How about such a patch?
> 

This patch is corrupted so we can't review it.

> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
> b/drivers/gpu/drm/sun4i/sun4i_backend.c
> index 2dded3b828df..5ad0e90d3e6b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -490,9 +490,14 @@ static int sun4i_backend_atomic_check(struct
> sunxi_engine *engine,
>   drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
>   struct drm_plane_state *plane_state =
>   drm_atomic_get_plane_state(state, plane);
> - struct sun4i_layer_state *layer_state =
> - state_to_sun4i_layer_state(plane_state);
> - struct drm_framebuffer *fb = plane_state->fb;
> + struct sun4i_layer_state *layer_state = NULL;
> + struct drm_framebuffer *fb = NULL;

No need to initialize things like this.  NULL isn't a valid pointer.
This just disables static checker tools from finding uninitialized
variable warnings so all the expense of writing the checker tools is
now wasted.

regards,
dan carpenter

> +
> + if (IS_ERR(plane_state))
> + return PTR_ERR(plane_state);
> +
> + layer_state = state_to_sun4i_layer_state(plane_state);
> + fb = plane_state->fb;
> 
>   if (!sun4i_backend_plane_is_supported(plane_state,
>         &layer_state->uses_frontend))
> -- 
> 
> -Chenyuan
> 
> On Fri, Mar 14, 2025 at 2:17 AM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Thu, Mar 13, 2025 at 08:20:29PM -0500, Chenyuan Yang wrote:
> > > The function sun4i_backend_atomic_check was dereferencing pointers
> > > returned by drm_atomic_get_plane_state without checking for errors. This
> > > could lead to undefined behavior if the function returns an error pointer.
> > >
> > > This commit adds checks using IS_ERR to ensure that plane_state is
> > > valid before dereferencing them.
> > >
> > > Similar to commit da29abe71e16
> > > ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").
> > >
> > > Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
> > > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > > index 2dded3b828df..a8e0e2123764 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > > @@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
> > >       drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
> > >               struct drm_plane_state *plane_state =
> > >                       drm_atomic_get_plane_state(state, plane);
> > > +
> > > +             if (IS_ERR(plane_state))
> > > +                     return PTR_ERR(plane_state);
> > > +
> >
> > This introduces a build warning. You shouldn't mix declarations and code.
> >
> > Maxime
