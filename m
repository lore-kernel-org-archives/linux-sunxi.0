Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F7237C11C
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Jun 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486736; cv=none; b=kHBeTp9gtMZrEzbNsXF4JC1OF2UScc4g1xKDqTSLvGkYroLKlRJP48xe2z3ZvcJpUExhyJq4XqCD4ZPx16x5g01nQzb8i5xlDXgHGaKdmbszYkBXg8ejdw2trKVfyGsieydmfp+alASIWk8lYEwlXjHPeDaD2lEQKR34GRFMb7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486736; c=relaxed/simple;
	bh=Evlqo2mKiWd3GWD+tOTSIJ+Llo4YzdKnMs4LsgHm9FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Op449kKPj1ei6OiKssH5yrt6DsoSYMmJSJxfMmJdWFrjy1i4q62GDfty92kGYokShI9Si1Usi6aVOHlBlStWHCMckqN4H+45bcYcK6KSQZ2xHNtu97fVnXcxYmYulRRkoh+zdGcpsm4gV+CXzSFKIdxcuJljEhN7yfCtSXR10Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IucztFzk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IucztFzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782486727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
	b=IucztFzkThIEwOajAhn+zqBfJ+suPv8RGKGssYWDwzdr0BSp0vnPP3ftsf2Gt+aE72xgXp
	+mvnYvC1WxPjQH/1O0Ng7MSfUljHI5ukMrHCtOahfWnZF9jxS7dEb3FEZW4kz03y1o01lG
	obCYAlOckTf2RuBpW6st8jTakSMFPKw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-ma2JLt35OjWouqrJgw8-9w-1; Fri, 26 Jun 2026 11:11:54 -0400
X-MC-Unique: ma2JLt35OjWouqrJgw8-9w-1
X-Mimecast-MFC-AGG-ID: ma2JLt35OjWouqrJgw8-9w_1782486714
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7fe0184fa91so20191957b3.2
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Jun 2026 08:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486714; x=1783091514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        b=qVijYb85MKOMsa9y2UWmLLT2z3qqISdBWmOiRUdkDXx9jZc8fyXq+rbvXU3Q5gGm+Z
         u3C/C6ngiyQx3vY0bt0QIWhNUtY9U8zqyO7bZh4yoAPFEvxmsvvFV1MaFpOrIK6Dm/wf
         mQY+baL8HEAYayT3CD5jf2QiXaLNHHTEnNtq5G3I/jV7IIJ7eQlyc1DbUvAtXgboggxS
         BTbU2EqSxYlrtM9N9xEaOFwCu9unYO9A/mAnZVcpFlLDUzYm6sCEykm2eOJxhY0Dd7sH
         HQq1qL+K3fQ1yd2qan+ljGXwRfg03r9SL79Ev6XgbQbaxY3iHGPIa4I3tj87VamuGojD
         0Vtg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2SjkgE+1ojIfjASDg1L5CcxOdjvgoprjHHNUk1X6uLGv7surlxuNQIARtFVdHHF0Gxm7wyqCcgYqT7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVocYwEF4OHkIb/5dBgbH7rZNGqlDwogn9tUyGV/6Ydy/jPrW1
	twd+eHVGOB4Iow/+jd5AnEwNNxQk2MAeMt4AoEK3AB1Arerp8phj51XyWwAd+kRqygsDgbFnno+
	EsS+ec0fJYIbQX1BBs3CCuaLAxWej/Y2s0UCAKHAX24Pu5DhCJ1JwTyY6J0ZLVRHPlCiXYGEQky
	zA/CqDjSd7Xn1tUr5YVfozfIqblmoWx3ORRxeR+ik=
X-Gm-Gg: AfdE7clBezFrPH6EyMrDeK6iiDLjGxsNoAugimZEH4B8COEoMfnvEjDKkDP9qrDOiFI
	hCih63NN61wVtmnaVy3/+945iNVzXGDZFfL7A5fZYQxAYZqzebQePVbfZo37/Ris2lAaStnUEgv
	+QATP/Tc/5htpU1BYTfa2rjmhbfMaszoMUTfxNtSyTNViyAUAOsyXGibrLNwzz6QP6
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id 00721157ae682-80c73fe6f4bmr9719567b3.42.1782486713998;
        Fri, 26 Jun 2026 08:11:53 -0700 (PDT)
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id
 00721157ae682-80c73fe6f4bmr9718797b3.42.1782486713496; Fri, 26 Jun 2026
 08:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-3-cca1a7b3bdef@redhat.com> <20260626-successful-badger-from-neptune-ae2bc6@houat>
In-Reply-To: <20260626-successful-badger-from-neptune-ae2bc6@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 17:11:42 +0200
X-Gm-Features: AVVi8CdeJARTOKb4ohxfJd8a69EdpRugjimEtA7qtwxmMR2cbKOdWmwQblTZgKI
Message-ID: <CADSE00LO98u6aDwvjijO_hAaMBXSGXaWPuFWiveQi_RWQ0MTVA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: make *find_panel*() return a counted reference
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FEKRZtdA_jVnO0YBj_0OSVzdphhSieIvQE3qNv0_cV0_1782486714
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 2:50=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:25PM +0200, Albert Esteve wrote:
> > Callers of of_drm_find_panel() receive a pointer with no reference
> > held, creating a window where the panel device can be unregistered
> > and freed between the lookup and first use (e.g., drm_panel_prepare()).
> >
> > find_panel_by_fwnode() is the fwnode counterpart of of_drm_find_panel()=
.
> > drm_panel_add_follower() worked around the missing panel kref by callin=
g
> > get_device() on the panel's underlying struct device. However, get_devi=
ce()
> > only prevents the device kobject from being freed. It does not prevent =
the
> > panel's kzalloc()'d container memory from being released when the kref
> > reaches zero.
> >
> > Fix both lookup functions by acquiring a reference with drm_panel_get()
> > before returning, under panel_lock. Callers are now responsible for cal=
ling
> > drm_panel_put() when they no longer need the pointer.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_panel.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index 545fe93dc28fe..a00ae98ed0956 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -458,14 +458,17 @@ EXPORT_SYMBOL(__devm_drm_panel_alloc);
> >
> >  #ifdef CONFIG_OF
> >  /**
> > - * of_drm_find_panel - look up a panel using a device tree node
> > + * of_drm_find_panel - look up and reference a panel by device tree no=
de
> >   * @np: device tree node of the panel
> >   *
> >   * Searches the set of registered panels for one that matches the give=
n device
> > - * tree node. If a matching panel is found, return a pointer to it.
> > + * tree node. If a matching panel is found, the panel's reference coun=
t is
> > + * incremented before returning a pointer to it. The caller must call
> > + * drm_panel_put() when it no longer needs the panel pointer.
> >   *
> > - * Return: A pointer to the panel registered for the specified device =
tree
> > - * node or an ERR_PTR() if no panel matching the device tree node can =
be found.
> > + * Return: A reference-counted pointer to the panel registered for the=
 specified
> > + * device tree node or an ERR_PTR() if no panel matching the device tr=
ee node
> > + * can be found.
> >   *
> >   * Possible error codes returned by this function:
> >   *
> > @@ -484,6 +487,7 @@ struct drm_panel *of_drm_find_panel(const struct de=
vice_node *np)
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (panel->dev->of_node =3D=3D np) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
> >                       return panel;
> >               }
> > @@ -538,7 +542,13 @@ int of_drm_get_panel_orientation(const struct devi=
ce_node *np,
> >  EXPORT_SYMBOL(of_drm_get_panel_orientation);
> >  #endif
> >
> > -/* Find panel by fwnode. This should be identical to of_drm_find_panel=
(). */
> > +/*
> > + * Find panel by fwnode, returning a counted reference.
> > + *
> > + * Behaves identically to of_drm_find_panel(). On success the returned
> > + * pointer has been passed through drm_panel_get(); the caller must ca=
ll
> > + * drm_panel_put() when done with it.
> > + */
> >  static struct drm_panel *find_panel_by_fwnode(const struct fwnode_hand=
le *fwnode)
> >  {
> >       struct drm_panel *panel;
> > @@ -550,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const=
 struct fwnode_handle *fwnode
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
> >                       return panel;
> >               }
>
> This part should probably be in a separate patch

Yes. This is another place where I hesitated on organization, as it is
very similar to of_drm_find_panel() fix. But find_panel_by_fwnode() is
much more self-contained (it is declared static to begin with). So it
makes sense to split them. I will do so in the next version.

>
> > @@ -686,6 +697,7 @@ void drm_panel_remove_follower(struct drm_panel_fol=
lower *follower)
> >       mutex_unlock(&panel->follower_lock);
> >
> >       put_device(panel->dev);
> > +     drm_panel_put(panel);
> >  }
> >  EXPORT_SYMBOL(drm_panel_remove_follower);
>
> together with this one?
>
> Maxime

