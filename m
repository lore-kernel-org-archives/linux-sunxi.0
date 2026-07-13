Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D2740C5DD
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947052; cv=none; b=uRoQRDqvXSXX5AxGHdpBD8qINTqPdWOMnQjgKeCX3VGLLcc/FtLpdnhOK4Ecpc4XWkUwE0mR2QBXXTr0otSWcdaABiO3OE4Cr0iS6NVM6ZnZzlodEbuzkYG/w7sQayZEv8Prep7mCfQg941lGpXS7ymjXpcMk5doAEMfToh/a2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947052; c=relaxed/simple;
	bh=31MQfY9NvRLjYTMlGrp+H9KNMPnbdIhFc33jeP6gZqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKMKm8UuhNYQtT+Un5F0045Dqtfa6w8d0rGtj8AGSRSA4m7SARwVbHdcGE2W1ZHH/hwFxztkw63cFZvhlawCluN0Gk4M5AehaT67UeE6k8eaTVq4cCgP5oVNkpEEIgXnnhFTf2TiLSSRFzSAh/DFbbw9mfC6EaSZhjB8z4MMhVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KrR/YWcm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KrR/YWcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783947050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y5514gjBH+tEva2wlfuCJ1QoRwC/nd/W+ENw0Fx/t/Q=;
	b=KrR/YWcminmXetwrEpEtiF6ueP6BeHJnxw6oK0/jM+tZMC7UtWJbfusbObEkKn6MbKGKp/
	JWWmTA9Nl8riogCjEA6YdoOyDWB60Cw6Rzr+NoJYWtRVXWuBUsJhL5mm3UGwtCODP4E4qF
	dlwFqRLTPy2gdtNLjVNOb4V08ma9ByQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-jr5bWPWkPnGKzdOK6AT_Jw-1; Mon, 13 Jul 2026 08:50:49 -0400
X-MC-Unique: jr5bWPWkPnGKzdOK6AT_Jw-1
X-Mimecast-MFC-AGG-ID: jr5bWPWkPnGKzdOK6AT_Jw_1783947048
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e8653ad27so71479667b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 05:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947048; x=1784551848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5514gjBH+tEva2wlfuCJ1QoRwC/nd/W+ENw0Fx/t/Q=;
        b=OfdLhv+nTSLu/7xjdkLvmZBk6pTQIZtlQJ1j96LrVJHPUCHEumh10KuO7BqPtgtAFF
         gbxjsiGnu625PC/t2wNJ0xHKm6Xvsfi9i4wDCOVpBMbYADI4BodtZDYBWqmMwXr7euBv
         LuwO+MMf/2QxzlQplFivL64/lUlHlw73bxlZgvwGsowUVbG67AZrraGvSm4uclwD8DyA
         oJFmsaVpgEOwZXEEEvTA4akdAg8uNqzs/OfM2poTMErS1rRFV0L4xfpU3SY9wFITgkRN
         RnmHDTYMOA0M5fFjuVaQ4VwAMoq9qCaesstVBLbsCIZ0rWSC+JnnMILPoRCqVhYf64zW
         fWlw==
X-Gm-Message-State: AOJu0YyXVsUVQ/1B95KA60Io0Sca5DAX6o3nqzsTDp4qsYooG6chDXPL
	A0G8cVwHLlarmPDgTxtCh/p1yn/GaymcPgIA1H0WYuEITKVErA3cS45UoWP+vcJKLJiVyWLMlQ8
	Xpoz4Xzl/MIbPaVs/8ZI0SYdtqIHGMDWlfsrBvbzOtvGeCuplzzcp/3XzQ0NQSl+J7OIGo70Qyy
	DxRfQrZpEX4NEphMDY6W1kJW1nE0nB4GRV6REBIXc=
X-Gm-Gg: AfdE7clSsM1M7au8ssU9LWP9yGJvsoM12xfC2EJY7vGYS7O16SOma2dFiGqLwZlOvty
	oLrsxWifVF1WaYSRBX142LSHOroINrcPXSgya8UicqwiPLS2RqDn4WE220mZ80hL88tFOdiQb+r
	8jymY8Rs7pTESrXIIQSiLLZpOiKTvuImFb7sFGPOeNgEAcvlj9cJENSP0DWA/d/XXJBao=
X-Received: by 2002:a05:690c:688a:b0:81e:8988:a76e with SMTP id 00721157ae682-81e9013f452mr69897677b3.50.1783947048375;
        Mon, 13 Jul 2026 05:50:48 -0700 (PDT)
X-Received: by 2002:a05:690c:688a:b0:81e:8988:a76e with SMTP id
 00721157ae682-81e9013f452mr69897527b3.50.1783947047964; Mon, 13 Jul 2026
 05:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-4-d3bb61f4bd4d@redhat.com> <20260713120850.50A971F000E9@smtp.kernel.org>
In-Reply-To: <20260713120850.50A971F000E9@smtp.kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 13 Jul 2026 14:50:36 +0200
X-Gm-Features: AUfX_mxIjyD9JT7DCnH8TLnCNyM1WFtSvLQWD-3yymdZrL3l4dLm3EqYUh3A3BM
Message-ID: <CADSE00KCw_dA89NcKg-9zLf-HLhy=ASZyDrAk+15ko_eyowOUg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/panel: find_panel_by_fwnode() return a counted reference
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev, 
	wsa+renesas@sang-engineering.com, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NqYzNvCCyuSE0QsTixT7nzIRqrSwq_qLcbYVgF-qY7M_1783947048
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 2:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] Drivers calling of_drm_find_panel() directly leak the returned=
 panel reference.
>
> Pre-existing issues:
> - [High] TOCTOU race in drm_panel_add_follower() when acquiring the panel=
's underlying device, leading to a potential Use-After-Free of panel->dev.
> --
>
> --- Patch [4]: [PATCH v2 4/5] drm/panel: find_panel_by_fwnode() return a =
counted reference ---
> commit 5cd4c479944cf29f6f5aa4a3e31207bf48dc0567
> Author: Albert Esteve <aesteve@redhat.com>
>
> drm/panel: find_panel_by_fwnode() return a counted reference
>
> This commit updates find_panel_by_fwnode() to return a refcounted pointer
> to the panel, mirroring a similar fix made to of_drm_find_panel(). It cal=
ls
> drm_panel_get() under the panel_lock before returning, ensuring the memor=
y
> is not freed prematurely. Callers are now responsible for balancing this
> with drm_panel_put(), which is added to drm_panel_remove_follower().
>
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index 72cf86253c0cd..a00ae98ed0956 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -542,7 +542,13 @@ int of_drm_get_panel_orientation(const struct devi=
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
>
> [Severity: Medium]
> Since the earlier patch in this series updated of_drm_find_panel() to
> also return a counted reference, do drivers that call it directly need
> to drop their reference to prevent a memory leak?
>
> For example, in bridge drivers like lvds-codec.c:
>
> drivers/gpu/drm/bridge/lvds-codec.c:lvds_codec_probe() {
>     panel =3D of_drm_find_panel(panel_node);
>     of_node_put(panel_node);
>     ...
>     lvds_codec->panel_bridge =3D devm_drm_panel_bridge_add_typed(dev, pan=
el,
>                                                 lvds_codec->connector_typ=
e);
> }
>
> Because devm_drm_panel_bridge_add_typed() takes its own reference to the
> panel via drm_panel_get(), does this code leak the initial reference
> returned by of_drm_find_panel() since drm_panel_put() is never called?
>
> This same leak pattern appears to exist in other callers as well, such as
> samsung-dsim.c:samsung_dsim_host_attach() and
> rcar_du_encoder.c:rcar_du_encoder_init().

Uh this is a real issue that I missed in several callers. I will add
drm_panel_put() after the bridge creation where needed in the next
version.

BR,
Albert.

>
> >  static struct drm_panel *find_panel_by_fwnode(const struct fwnode_hand=
le *fwnode)
> >  {
> >       struct drm_panel *panel;
> > @@ -554,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const=
 struct fwnode_handle *fwnode
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
>
> [Severity: High]
> This is a pre-existing issue, but is there a time-of-check to time-of-use
> race condition when callers attempt to pin the underlying device?
>
> When find_panel_by_fwnode() (or find_panel_by_dev()) returns, the panel's
> internal refcount is incremented under panel_lock, but the underlying
> struct device (panel->dev) is not pinned.
>
> If a concurrent unbind occurs before the caller pins the device, the devi=
ce
> memory could be freed. For example, looking at drm_panel_add_follower():
>
> drivers/gpu/drm/drm_panel.c:drm_panel_add_follower() {
>     panel =3D find_panel_by_dev(follower_dev);
>     if (IS_ERR(panel))
>         return PTR_ERR(panel);
>
>     get_device(panel->dev);
> }
>
> If the panel device driver unbinds immediately after panel_lock is droppe=
d,
> could get_device(panel->dev) trigger a use-after-free on the destroyed
> device?
>
> >                       return panel;
> >               }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-drm_refc=
ount_wiring-v2-0-d3bb61f4bd4d@redhat.com?part=3D4
>

