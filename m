Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A134CCDC2
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645385; cv=pass; b=kCzxYgTW/tfgzvUA6xv07TUObWmf+2HtbSumioEi0kKnZWvQGpZ/q2cnUz6LzS8qt66kSNfCU/diq9+X9LdH6EBzb/SdxtSqG27MYZKc+VDeOFQwNWHVF39Tkq7YH1VUNOOIBDhEGPElf5vzMlFj1xCplS2oBMMbgBVEaql5rSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645385; c=relaxed/simple;
	bh=vbrxd5srWOipj09aXDQHzqS5lMVRJ7HAcTG0L1bqBDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsKza4bTVirLvEStbe10UHbixat10Fez2NdbozVAptde2F6m1TZpBrdr1qH/7MFTuMjgGYD/t9vhUS/10pDn8qTgOp3mICiws6dSObJwJDswX3nTit0HrlF+jr0JccIQMZF4sgsW/Hq4j0kO2kXLnzV/rv2LecJRWqV3R8zWiwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L7gi7nnf; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L7gi7nnf"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso687289d50.0
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 04:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645372; cv=none;
        d=google.com; s=arc-20260327;
        b=eLSbn2dv9TG3tlkiRZfrNhb73HXsJhMDuXd3eqXopGI9SqG0GPbR3aR2e6+gUWjHW3
         DWDzIaQXEn85wt+b32t7FEga62dbDqHj1k40ghd8j3b6KW3nl64vNNMNWKzFYYHarW/a
         7j8xPL77uLlgJz4XoF1242w6GxCVHTcfy7MuJsVH2jmhpNFsGkZp8Ju3WCEFToYa6mug
         a/0hjDPeS6xFmfiN6GDvVoTALezTU2nAfEJhbBykK9xicIRASXlc7YXqY4DBxqKUd7k5
         Jcr+qd8By4qxUG0jF7Tpzcq+1A2vOuilUIX1qvBz+dwKHg4mhtB/fy2Q2e2lOcJr31mc
         1aQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        fh=hS1m84R08mw2k+rAPSQ3biPSn8lb6TN5pg2sZIZJxgA=;
        b=GlR5TIeHoM2gDRbuxVy0INAYeXy3lC5gJybcJpSciOo2B9DkMmhOLxFLzqaYxamo49
         Gj2Rbp9zB6dm0Ee/3V2c0J79pgMcJjuUIKzTPOecKpk5C+hn7/jQBZsS82mWDdx2xH5+
         BKgxqABHYiw85d4WmhvGdeCzLIawGoOFmk9xqQ6S9jfgrQGQJBYSIBa8e49rqRwVe8bu
         obr7EsIsYL9EBODQnBzIeTaEWTln/Hk45+E3C7Hxh1TcsQGBoOcSIaxv1VJFU2wXNSvx
         dLjQX9tVvnN5R8qUimH2+8iMl+6/L/3z9fgPkpb5jOI9F4hdOjP7Xnj1LU5lLNbuqunj
         sh9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789645372; x=1790250172; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        b=L7gi7nnfZppgwD2qjz5Ad7tRbxH5hIwL/Q6sCAyf2Ylq0qdrUv4xGyq2dfAVq5CBko
         7y/MbQOBQiiIII+E1rdYurmkRzxLwwgb011NsmzLefGr5raYeTZHqQavqjvRO/YBAYq4
         CB51O94imJPhsD4olXHWrlTO0Sdxi+MlsK9OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645372; x=1790250172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        b=DVeOZWq7MlMppOxPKltU4ouL5Om1KQ44hBeL7gGVfDmrAs8+RvM8zonM12WljC6xNO
         dmOMnFXiimwLiE+c0n4UpQsYujSYBBAtGnKUaN8hIo2gtBXctNRLJGlOXJUtTaMq24YG
         ja6mr97bpon0F8BMBhRKfjSXqLs7CpHQdqrbwvjRUMUGLmoBunjo/hWkkeIRzNeGiGt+
         6ZFsBhbzrbvKStLsTLHfvmW5Io9zhcvF7blXX7RYEv0LK6nyqlG3cEQAESxHvyrDuv8w
         0UhMyJbkRHn4Xn1DH6KPqJpN8s5xgtB0F8D96aRG2z0Ffs8ZyXZYv3eSmfIqJTJ5+z5F
         ylVg==
X-Forwarded-Encrypted: i=1; AKwUvBwSBM5b6Q+KAPQZE+D9Xrb8AXgG0f/0aW3Tl6jKSy6QofI2N8kQvAZGtiDTl/Blzi5ZkeTYC78SwXQt4g==@lists.linux.dev
X-Gm-Message-State: AFuF++l81tz+B0y9mtQvfagY/05UR5v0MYC103PhM1vSwbNft7jWMJBU
	gRkTnKg770DHvvRZc+rHge5Y2+TOyoKwuXTOuECWKXuw2Wdtraz7InkDW5F442zr74et2ufcfAm
	P/RTscqY6aHNVDJHRl7+5GrQf9MXzX8lEmTBy+ziZ
X-Gm-Gg: AYBFou3bwyKqxEL/vfKEFxGmr942GlvPAyFja7M68usojKaF6qRvXtekJnc0etAYPBG
	hyKlvV/PELYJu1g+s8Bizp1ONFS0DHiUQRt9vmb/BpEIWFLI9VqAG1Fg9QnE5RfkA/GGY7EI1/6
	wRBIoqIcAfnFvzSvspH+wUk7VTr1ckCFPRtQOK7rX1hY2osKi90QUeOhgSH7yNo5a4bD5WHuIK/
	yZTFkBW6/3RE+0YTpHcfkIV74R4ElPbBSPg39g3gfiBhAH3hW6TJDwATL3Bwr0Oz4CBERFn8deW
	OQPG4WQo49FjgBJYRBiKhfoA5tZYyF954nHPW+WSLG/TFoSSQ4ku1dz23zeTPd/J9KO1syqfw4k
	MHYnsJxBA
X-Received: by 2002:a05:690e:1181:b0:66e:54a0:cdd3 with SMTP id
 956f58d0204a3-6717724501emr313133d50.42.1789645371777; Thu, 17 Sep 2026
 04:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <6d21e808d343283264665ec16d297317000fdf4d.camel@icenowy.me>
In-Reply-To: <6d21e808d343283264665ec16d297317000fdf4d.camel@icenowy.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Sep 2026 19:42:39 +0800
X-Gm-Features: AcwNN1UiSWBQWxLfTBKkSaF0uFiyhB3L4EIUoSHVNJlTekBmF6uuJ4F5EBEDj-E
Message-ID: <CAGXv+5FHiW8umZ=wLLb5wK5Qz3hf-mbxC_zH5v+pwxxyUNTwew@mail.gmail.com>
Subject: Re: [PATCH RFT v2 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr()
 helper
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:16=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-09-16=E4=B8=89=E7=9A=84 11:33 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > This is v2 of my drm_fb_dma_get_gem_clipped_addr() series.
> >
> > Changes since v1:
> > - Add and use new drm_framebuffer_get_block_offset() helper (Thomas)
> >
> >
> > This series adds a helper to retrieve the buffer starting address of
> > a
> > "clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
> > which gives the address of the full buffer.
>
> Should vs_fb_get_dma_addr() in verisilicon/vs_plane.c be replaced with
> this helper too?
>
> I implemented manual framebuffer offset addition here.

Didn't I replace vs_fb_get_dma_addr() with drm_fb_dma_get_gem_addr()
already? At the time only primary and cursor planes were supported by
the driver. The primary plane can't be clipped, and the cursor plane
had some custom clipping, but seemed to want the unclipped address.


ChenYu

> Thanks,
> Icenowy
>
> >
> > Some drivers program their hardware with clipped dimensions, so they
> > should be using the clipped buffer address as well, unless the
> > hardware
> > can advance the scanout directly. (Side note: many drivers still use
> > the non-clipped dimensions.)
> >
> > While at it, also pull out the offset calculation of
> > drm_fb_dma_get_gem_addr()
> > into a separate helper in drm_framebuffer.[ch], thereby separating
> > responsibilities.
> >
> > The sun4i driver was recently incorrectly converted to use the
> > unclipped
> > drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
> > pixel groups, but also exposed the mismatch between the dimensions
> > used
> > vs the buffer address. Two other drivers were also touched.
> >
> >
> > Patch 1 adds a new helper to return the byte offset into a
> > framebuffer
> > for the start of the pixel block of the given pixel coordinates.
> >
> > Patch 2 adds the new helper to return the buffer address based on
> > clipped coordinates.
> >
> > Patch 3 switches the sun4i driver to the new helper, and fixes the
> > luma plane buffer address offset for subsampled YUV formats.
> >
> > Patch 4 converts the imx/dc driver to use the new helper. This fixes
> > a
> > mismatch between the programmed coordinates and the buffer address.
> >
> > Patch 5 replaces the open coded buffer address calculation in the
> > imx/dcss driver with the new helper. Existing behavior, which might
> > be
> > wrong, is preserved.
> >
> >
> > Please help test. The series is only compile tested on my end. The
> > sun4i
> > changes should revert its behavior to before the
> > drm_fb_dma_get_gem_addr()
> > was adopted. The imx/dcss changes should not have any behavioral
> > difference.
> >
> >
> > Thanks
> > ChenYu
> >
> > Chen-Yu Tsai (5):
> >   drm: Split framebuffer pixel offset calculation from
> >     drm_fb_dma_get_gem_addr()
> >   drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
> >   drm/sun4i: layers: Fix VI buffer address for clipped offsets
> >   drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
> >   drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
> >
> >  drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++----------
> > --
> >  drivers/gpu/drm/drm_framebuffer.c      | 45 +++++++++++++++++++
> >  drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
> >  drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
> >  include/drm/drm_fb_dma_helper.h        |  4 ++
> >  include/drm/drm_framebuffer.h          |  3 ++
> >  8 files changed, 118 insertions(+), 51 deletions(-)
