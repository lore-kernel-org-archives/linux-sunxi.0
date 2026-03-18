Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045B3EFD21
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862109; cv=none; b=ceG2EdbRzSGYMB6SLHXD3kEzyjQxtvli/dOlUxRIdE/M3zl2qX0x+GBaIJ4Z/T/BnEvbDZXCG0sBpBW6djvAm3T5CtG695RZt4/mp+MYLlay/SH0sFZNkNNE2ZQ3C2EPrJW9xHwCqCnWFYTBXiHgl8ZGTjb0iLTDga4soHAhGHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862109; c=relaxed/simple;
	bh=rQgzNmdeBzkuUi68LwdSFXfsPmmfyRBvSJC88y6enxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOrP8D2rOrTegAPE6rZDouR31uOfWVqC0gc4Nia6vRHExyxPzTL8cVfRCao+KToPZTQUw5DH5InsDotsgDBc8MdTs+SXSqOiMlvfJpBiSSlhouTj3dIMqcLHndGMJjXl3ozPBVOeJjGHxl3QE6j5pzXTTPahN/Pe7ktWBn594Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BM3wz9pl; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BM3wz9pl"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4327790c4e9so88729f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 12:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862106; x=1774466906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wv6jP1e3M1+PHnQU5Hq+FG1C5SwOP02k/za1P8Uz0WI=;
        b=BM3wz9plVgN6VUbFoMhrDBP2afD5wv42QKc85FgG6S8s2iuZjr2rizBK6smIk6mWEZ
         iZcq+zzZtRwl1aiW0vo/F02jz6RZNv96mRLGLgoRzgOil7O+6YqEwQC6UWyk5M0PAuG+
         gyOnHhCXlAWxHbNVTEvDx4yhM93mDfW6q1bO104t4c2uyki9D0VIf2+ltEDNDwv0x+g/
         9Juhl2cZZYSLr5FwJMKkA6WKVjOhfe/CDTU3RySUHbxOWwY0dZQ4hIC8xH1WAeUrJCWx
         t/TF4JG8+ABjTCYW0LBHlesZ1FjNJPxY3C37f5kDUQiF8FntOlTkp+UzPYDZbuSbD/Wj
         DmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862106; x=1774466906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wv6jP1e3M1+PHnQU5Hq+FG1C5SwOP02k/za1P8Uz0WI=;
        b=Sd3oPsR2YOT6lPZUz1VWQ6+3xuHcbFNI28jA1YzYPnfy/tfgBs+UHzQJCndOfguXLK
         OT9puJilGMDZfzvxmZarbBJkpkNxUGORTISdIRzXfBnG+16/TfwRnOrF/Vh4EruTk+uB
         nLs/hF83G/OPYf1fYntHWhezpoeTNIKe7+KAZhdtye8lT7UKmPZGFliK2u2io4PN6+8C
         JoXMac0UTn/eiKIunSdrWFZL0ZlbAWbVoiIPnY9gjJiJWfihoN9Vc2gDmhQ0+ZfZAGhb
         /SXzvQKOTv+VRTLc/21kMVSIz+ynui4SJSdiyn25a8d1zm0QAALRsw0sCz99zTvuI2rd
         iPVA==
X-Forwarded-Encrypted: i=1; AJvYcCVJMSJN9i/quyYhLUoxLly0cQXfokj1TUVWwuaMR2zXixEghzuwFO1hSrwiq702M1S1/i002K9t36YLDg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2JZcIyHwKY3gVPQvMgHuYkpAFVeUxgIbDsyvf9uN6qwPs89w3
	COrtq7Y/a94wlhbyjmcCL+gSVylsemblijHz/k7Ja7lH+maQiaG1ur6H
X-Gm-Gg: ATEYQzy28uJosuPvqe4LuswEifUT8h6+UQAoC8vTr09pfI3KBZduGgtFT0TQZ+OF9PC
	OZeBDwaLgBczbpjFUruHRT/FeRJNznm7GMG+LLelN3WhGLVIt/K7Fsxa4jlrrkqaxIh6yTjLD4p
	BJnm3LHCmSgeCsJSwsQ2aoF14DU4Pl/TBjhkbQNbux4rajVk6hTt/xTNiFJZeFBJAB1WRW14ECX
	nyFgVK6Oq85L7ngDaInJFQ+g4p/VDrlpZU2PQf9wq2QAxXJLeaJXyYqqfYKsXsxdVT14h+L7lWl
	pOcWoUD/E87JHKHMAODIryt1eirewJyVNg22GHfNpb5Dpd6SdCWckmW1YX2XpCgFaZo4jCA5U67
	7FDIQ+KGqHAQqLaiNij/Y4da3pVeyqdtBufmJ3AHGE+XUgojH9VX9sEqcciJYUDBoT8JzeQran0
	khxsaTtIdedM17hB1TxRYY5KjfwA7MNM4neGp0Whfju1Dq4oySdrdDYSnJVN931XAmpiUYvQ8h2
	PAKxTEl
X-Received: by 2002:a05:6000:400a:b0:439:bcdb:95a8 with SMTP id ffacd0b85a97d-43b52648c7cmr7805238f8f.0.1773862105581;
        Wed, 18 Mar 2026 12:28:25 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-248.dynamic.telemach.net. [82.149.12.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51899617sm10663715f8f.31.2026.03.18.12.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:28:25 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, wens@kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display
 memory
Date: Wed, 18 Mar 2026 20:28:23 +0100
Message-ID: <6247601.lOV4Wx5bFT@jernej-laptop>
In-Reply-To:
 <CAGb2v67sA48gfecLKiGozULmTo45hXF25n+2+nAHVFY_QEL24w@mail.gmail.com>
References:
 <20260309165635.1138413-1-wens@kernel.org>
 <CAGb2v67sA48gfecLKiGozULmTo45hXF25n+2+nAHVFY_QEL24w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 18. marec 2026 ob 10:35:35 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> Hi,
>=20
> On Tue, Mar 10, 2026 at 12:56=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> w=
rote:
> >
> > Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
> > adds a new helper, which covers fetching a drm_framebuffer's GEM object
> > and calculating the buffer address for a given plane.
> >
> > This patch uses this helper to replace our own open coded version of the
> > same function.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 16 ++-------------
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 27 ++------------------------
> >  2 files changed, 4 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/s=
un4i/sun8i_ui_layer.c
> > index f08f6da55dd0..72c92203ae63 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > @@ -124,25 +124,13 @@ static void sun8i_ui_layer_update_buffer(struct s=
un8i_layer *layer,
> >  {
> >         struct drm_plane_state *state =3D plane->state;
> >         struct drm_framebuffer *fb =3D state->fb;
> > -       struct drm_gem_dma_object *gem;
> >         dma_addr_t dma_addr;
> >         u32 ch_base;
> > -       int bpp;
> >
> >         ch_base =3D sun8i_channel_base(layer);
> >
> > -       /* Get the physical address of the buffer in memory */
> > -       gem =3D drm_fb_dma_get_gem_obj(fb, 0);
> > -
> > -       DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
> > -
> > -       /* Compute the start of the displayed memory */
> > -       bpp =3D fb->format->cpp[0];
> > -       dma_addr =3D gem->dma_addr + fb->offsets[0];
> > -
> > -       /* Fixup framebuffer address for src coordinates */
> > -       dma_addr +=3D (state->src.x1 >> 16) * bpp;
> > -       dma_addr +=3D (state->src.y1 >> 16) * fb->pitches[0];
> > +       /* Get the start of the displayed memory */
> > +       dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, 0);
>=20
> I just realized while reading more code that there's a subtle difference
> here.
>=20
> The original code used state->src.x1, which is the "clipped" coordinates,
> while drm_fb_dma_get_gem_addr() uses state->src_x, which is the original
> coordinates.
>=20
> Jernej, do you know which one the driver is supposed to use? Or maybe
> it doesn't matter?

I would say that it doesn't matter for point of origin. Original coordinates
use uint32_t values which means origin cannot be out of screen (negative
numbers). What I found interesting is that clipped coordinates are int, e.g.
they can be negative.

Best regards,
Jernej




