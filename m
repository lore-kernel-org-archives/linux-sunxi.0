Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED6A28
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jun 2022 08:57:47 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id f35so5095892qtb.11
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jun 2022 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7zhHII/DS4QRjgxHtKGpmTA0qCxEvYRa7d6vBVg1/3I=;
        b=THwBYsq46Go8yRw7Wlg7M90twt/p83YwtRg3qL/1JSR0F0T37iyEUM00c8QdBcsznG
         F8IuFGaDjeC1Z4+BSm7HnHXkuhwZvrj0ymkj03rHZF6ZOqi4nt1yNgWyu/x5HC8tpPEM
         Qlq7rERMDHI23AVBflNh4oDOQCY8ZsjZeg0CN5GL6+qkpxaXow/UenFc4rSfYfe9cvwi
         6IAliYt1FzAzZGD1mFWSYNw9SxUfk2MtK2ffcXDIBEsUyIIPTv5aW+HLNemTlBSMbOQk
         7Tjn5zPedMx7yhaSebSseH8l1dEFx29eDx0dNpaJLfDGrgY1FQn/aSU5eTYSAy5iJcUX
         CMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7zhHII/DS4QRjgxHtKGpmTA0qCxEvYRa7d6vBVg1/3I=;
        b=BJIr+F2tT/cYekIgHhrMiH8O8LTY16Cs7eHDKFQP9oQVAfmQcsnmlshGVfo64yFyq4
         NLYl3y0YWqMStpVAIRIGPvFIwM/M5zo/+bKAnJsOS1Cq3Yw8FRme0Oi+m/6mlwHEauKk
         ljvBET8BxhELqlxwV87RV/eQipaipdZ699M+reUz/FqoBRJzG3dQCbEfs/fURlW00kkt
         vYmFKPUDXOE1Al7sTzY9FJJL1gzi++mhYNClAiKBQwECDGlDhfSBvA6uvOdEPAqUPEma
         S0uZsuINtnDzHsOgXlt5tAe1Y/a65iHSdGeCUxXdrzjERxFrYHi+PU/NE2+iJ5P8JZYS
         e7Ng==
X-Gm-Message-State: AOAM530yoEjNBO7NKEYWvtvWuwCWVkifX4G6Wy8BPLNyDvFSHIVz2gMV
	BDGaqZp93hb7gKJM1PzkUU+GI3++QgYyvjhLA88=
X-Google-Smtp-Source: ABdhPJy16OoYcLy5R6zXDdyw9O3WXdWXOFOwTUrT9zCMmhkGZeY0qh8vg7dtsB9fpa1i/GTJSVWKf/DI3dB7vtkuJk8=
X-Received: by 2002:ac8:5896:0:b0:2f3:d231:58a9 with SMTP id
 t22-20020ac85896000000b002f3d23158a9mr6574470qta.131.1654246666777; Fri, 03
 Jun 2022 01:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220602180118.66170-1-r.stratiienko@gmail.com> <20220603082416.ukohug3mwzu43csu@penduick>
In-Reply-To: <20220603082416.ukohug3mwzu43csu@penduick>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Fri, 3 Jun 2022 11:57:35 +0300
Message-ID: <CAGphcdkPJ57bkw4nxuSnk0TD1RGW5j9M-A0ek6t1rDnMY2PS8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: sun8i: Add the ability to keep scaler enabled
 for VI layer
To: Maxime Ripard <maxime@cerno.tech>
Cc: wens@csie.org, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

=D0=BF=D1=82, 3 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 11:24, Maxime Ripar=
d <maxime@cerno.tech>:
>
> Hi,
>
> On Thu, Jun 02, 2022 at 06:01:18PM +0000, Roman Stratiienko wrote:
> > According to DE2.0/DE3.0 manual VI scaler enable register is double
> > buffered, but de facto it doesn't, or the hardware has the shadow
> > register latching issues which causes single-frame picture corruption
> > after changing the state of scaler enable register.
> >
> > Allow the user to keep the scaler always enabled, preventing the UI
> > glitches on the transition from scaled to unscaled state.
> >
> > NOTE:
> > UI layer scaler has more registers with double-buffering issue and can'=
t
> > be workarounded in the same manner.
> >
> > You may find a python test and a demo video for this issue at [1]
> >
> > [1]: https://github.com/GloDroid/glodroid_tests/issues/4
>
> Please describe the issue entirely here. The commit log must be self-suff=
icient.

Commit message already states "single-frame picture corruption after
changing the state of scaler enable register", therefore I find it
already self-sufficient

Also I find demo videos and link to tests useful for the followers to
go further with investigation.

If you have something specific in mind when asking to enhance the
commit message please say it.

>
> > Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 12 ++++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  4 +++-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/sun8i_mixer.c
> > index 71ab0a00b4de..15cad0330f66 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -27,6 +27,18 @@
> >  #include "sun8i_vi_layer.h"
> >  #include "sunxi_engine.h"
> >
> > +/* According to DE2.0/DE3.0 manual VI scaler enable register is double
> > + * buffered, but de facto it doesn't, or the hardware has the shadow
> > + * register latching issues which causes single-frame picture corrupti=
on
> > + * after changing the state of scaler enable register.
> > + * Allow the user to keep the scaler always enabled, preventing the UI
> > + * glitches on the transition from scaled to unscaled state.
> > + */
> > +int sun8i_vi_keep_scaler_enabled;
> > +MODULE_PARM_DESC(keep_vi_scaler_enabled,
> > +              "Keep VI scaler enabled (1 =3D enabled, 0 =3D disabled (=
default))");
> > +module_param_named(keep_vi_scaler_enabled, sun8i_vi_keep_scaler_enable=
d, int, 0644);
> > +
>
> It's not clear to me why we would want to make that a parameter?
>
>1 If it never works, we should fix it once and for all and not allow a bro=
ken setup at all.

It's a hardware issue and can be fixed only within the hardware.

Current patch is a workaround that if enabled can cause increased
power consumption
for existing users. Therefore I think it is better to give existing
distro-maintainers a chance to test it prior to delivery.

Also I do not have all the sunxi SOCs to test it. My tests were
limited only by A64 and H6 SOCs.

> Maxime

Best regards,
Roman
