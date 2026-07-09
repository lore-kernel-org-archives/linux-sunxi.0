Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49894276049
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Jul 2026 04:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783571665; cv=pass; b=YjF4hAT/sm4sDAF8gZe+uBIbtnSHvh6imxCDTg2lExfl8cuLN3HEfSBtJLLTcfnghbH0QsoyOqtV4Ad6q5Jth1Yv2teifpstagyVBNve7YSLpPeo1v8j1PxB5aza814/5LqJMijFYKy8EAMPpkICaHbJsvco4qHQVD2XrIu2vwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783571665; c=relaxed/simple;
	bh=Xb/+x0K2HXIg+20+Or3W3rwEtW/sdi5K90Jo0JKmC08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBXXMJGd3HLhENpRSHaFhBDClti6CtRYxd+rfaV/n8IOu04yQIm49MqYUlVBEgDcsrahNt28o9hCJGG0Yfn5xr+0c2La+wy+YS3eb36pEb3cDDe7OdXmOjGzlA3cHUbVfELo11zttW7lhwzJBehSpZz19Fg+duepFnpggl9novQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDiqIeWX; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDiqIeWX"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9dc546f40so396954a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 08 Jul 2026 21:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783571663; cv=none;
        d=google.com; s=arc-20260327;
        b=s1wae9HT7/6uiqzNos0xTWwWFo2uTgTlRRKQ9iSvENi8IOQgl3pQ1Jy6WovYW2m2nG
         KsqgF/jbtGOwa4yYT6StePMAlEHvEsYzDA3lN4LkOQTyDgEG+aZVXCD+0Q6rzhECSrlT
         aVaMdG12t766PMMD8VT4RPYapIkrjpg6rhWLUtHLJBc1IkdPuqOe9hdDsCE71F0kj01x
         4BTiGoTVTrIz1B1luq0RAKNic+ncRhISw562BOpy7SAIuYLnY7SsDUytD+Fx4kcxBNqe
         1gUjYfZjXJoYmf642Znn9Ecc595rddWsOv7ptDPcIE6YBN0zugvZsuliyylD3Mea4NXp
         q96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y+5mi5LqTF73iewEa2F/cq/mCI++zy608mfHssXjHys=;
        fh=BYqZhfANbSQPZBi4/EGIypCIXB4edfoxLSfCL+WFCYY=;
        b=B9QgCc9+odzHKPuN74Kdi/k20QhyOWsSpMD+5FEGlTj6DJnXpNancjFIlTXN4Jp9Bw
         UqopGOleMeevXmwX8tj/pQI+ghccir6pv5Qae0VKOqzLf0ubLtvf7kzjBkuZC+bQmKzN
         azQVEFt2ruli9amHYw9p1Payl4qbhAKeJuo9w/H7fnHb+ABhxeblNp4kHp4465HC5vXX
         Kl2tz+DZYXOAMOpR4pB1ETrKJq3xE13YL5aPkFffn778oWBqYdwPg2uSKeVWr91JIs94
         p8tF01REdbGfUieUYTAiwtKEQMAPK8hddaIJLwvU69d5yUeVlUOybBnfAlo3u7KyubRc
         o8jw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783571663; x=1784176463; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+5mi5LqTF73iewEa2F/cq/mCI++zy608mfHssXjHys=;
        b=TDiqIeWXjBdFI+dn31b9kfRoOCckS7S2hXsWjZNqwFdoo+XqDHYicneFrypHqIF9RA
         I2GRnL9qEHPgK+YbOLwuk7fSBfIFCjZCwZvyguDXjUTwOV9VhrgGfwosd8p4EcyWC5Fg
         xwBW/S8QSKDdPVaEQOZ8Kp6Go0oQivlTnLhYGgGdADk4d30hhSJSnzX6z2ZFHpf0kFCY
         FkbIq452HeWQqJW8M2p6W/+sYGB6SsVbhi7tOPgUjvH1P0T+knAl7Z5WnD/EWLZbtrZe
         Q/Uks3FIC+3gPA9hFXN0BVY400yCR7SOCgc6Pme8MIUJirrbUqs5CapPPg5i4jN0XkbW
         DDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783571663; x=1784176463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+5mi5LqTF73iewEa2F/cq/mCI++zy608mfHssXjHys=;
        b=Xw+sxdf8irs3fFspY194QNZ+RR1iH12QKtlcs4CCLq1ml4kHb1TW8fZRvgRdjk8/pn
         Ro4TyWG64BWTXObpGsn/e2H7dffrCBiin2xHUw9q80Qr9iViuPcHh7btj14CUQlgQiwd
         L2baxYm0CgMsffnpVlpEkxArqvWooxY7DEIf9bS3KKmXJADcgR2jDmcMC5nIDu8YmFEy
         bBU+IgAP5uT1AvT1Njc8cAmaLsZeAXaM/LQGIpf1hOO4VfsGARnt8L3fKda9+v/kaNmq
         b58GHN5R4D1ar/pZZmp3Bwp1YGjN/n2XeFtRWG4Zr4w49wk2CfoSN2fh3kyThJbcg5+T
         eN7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+9V/1cPadOu7F5O18kMdhTHAbACjzCA4xWJqyI+x7VnsBFvj3AUJl6bvc47XGVHWpNrTIfB4P02fSc+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YySjky6PS90jj0UWu9ffjb8SiACjs4OIK4eFjw3hMewXrIAGpvH
	mAlSNIqTbtAr1KtqUGkaQNrsspjLsMJp8bX89zVxUFXpOJ0Ca0sE0D0jWAb0hQWPtjxTweos6Jw
	dhc7fXpmClOQs89RTSn5Dy93mvcssWPI=
X-Gm-Gg: AfdE7ckhbOWYVcXnE1Bqy059I6+U7gb3uOK3Ab/dYirLHlE7Z31Onj6EXs3FhF0GBan
	0UvfBCJBkoctdHz0bRjGhP0R1zy73zCMyEHDp02tHFOMLm3VA1Lz9wAfk64U/K/lxGY4VuTNd06
	qL6a3E/MSMFNA+JE85hO2e9mKJJqkRiE5luGD5LdK5xYpgXOEgceBrsuceWqr6dI9SsyXPnBFA5
	WKdOQuIgDK/+tBSBHpnnDCWr9qk207+H/xuEdzdRhxKOLKHTVULhkdbUqzLnM5VYfosXBo3/xDS
	A7vUUJbFuJnjwsg/TVXNLstFN+ICcwASolUbcc7SfvvuZYP2/BE2rw8w
X-Received: by 2002:a05:6820:1351:b0:6a1:83a4:8175 with SMTP id
 006d021491bc7-6a37d979bf7mr1046031eaf.27.1783571662872; Wed, 08 Jul 2026
 21:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214050943.6306-1-arash.golgol@gmail.com> <afx-yCUZAvWfMNEe@collins>
In-Reply-To: <afx-yCUZAvWfMNEe@collins>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 9 Jul 2026 08:04:13 +0330
X-Gm-Features: AUfX_mzXA53liaYn69cbaIPlddhq3zUcVGLrtRT5LMMElHdHeEB_6JlBdeHn1d4
Message-ID: <CAMxPZkia0_xHtaQfcfmizPz_AX-tLA7g+nC2FhgKtATiMUkfLA@mail.gmail.com>
Subject: Re: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, linux-sunxi@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 7, 2026 at 3:30=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi Arash,
>
> Le Sat 14 Feb 26, 08:39, Arash Golgol a =C3=A9crit :
> > Use the V4L2 subdev active state API to store the active format.
> > This simplifies the driver not only by dropping the bridge mbus_format
> > field, but it also allows dropping the bridge lock, replaced with
> > the state lock.
> >
> > The sun6i-mipi-csi2 hardware does not perform any format conversion.
> > Enforce identical formats on the sink and source pads in the set_fmt()
> > and init_state() callbacks.
> >
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Looks very good. Feel free to let me know if you'd like to do the same
> with A83T (I could test it on my side), otherwise I will take a look at
> it later. The driver has essentially exactly the same structure.
>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> Tested-by: Paul Kocialkowski <paulk@sys-base.io>

This is a gentle ping for this patch.
As far as I understand, the patch has received the required reviews and tes=
ting.
If there are no remaining issues, could it be considered for merging?

> All the best,
>
> Paul
>
> > ---
> > Changes in v3:
> >     - link to v2: https://patchwork.kernel.org/project/linux-media/patc=
h/20260209055529.16644-1-arash.golgol@gmail.com/
> >     - Keep error path jumping to error_v4l2_notifier_cleanup on
> >     bridge setup failure
> >
> > Changes in v2:
> >     - link to v1: https://patchwork.kernel.org/project/linux-media/patc=
h/20260206123455.46476-1-arash.golgol@gmail.com/
> >     - Simplify control flow by dropping the else at end of s_stream()
> >     - Call v4l2_subdev_cleanup() on bridge setup failure before
> >     notifier registration
> >
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++---------
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> >  2 files changed, 53 insertions(+), 56 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_cs=
i2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > index b06cb73015cd..682bdd82098c 100644
> > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > @@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mi=
pi_csi2_device *csi2_dev)
> >                          SUN6I_MIPI_CSI2_CTL_EN, 0);
> >  }
> >
> > -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *c=
si2_dev)
> > +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *c=
si2_dev,
> > +                                    const struct v4l2_mbus_framefmt *m=
bus_format)
> >  {
> >       struct regmap *regmap =3D csi2_dev->regmap;
> >       unsigned int lanes_count =3D
> >               csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
> >       const struct sun6i_mipi_csi2_format *format;
> >       struct device *dev =3D csi2_dev->dev;
> >       u32 version =3D 0;
> > @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >       struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_sub=
dev;
> >       union phy_configure_opts dphy_opts =3D { 0 };
> >       struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi=
_dphy;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
> > +     struct v4l2_subdev_state *state;
> > +     const struct v4l2_mbus_framefmt *mbus_format;
> >       const struct sun6i_mipi_csi2_format *format;
> >       struct phy *dphy =3D csi2_dev->dphy;
> >       struct device *dev =3D csi2_dev->dev;
> > @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_su=
bdev *subdev, int on)
> >       unsigned long pixel_rate;
> >       int ret;
> >
> > -     if (!source_subdev)
> > -             return -ENODEV;
> > +     state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> > +
> > +     if (!source_subdev) {
> > +             ret =3D -ENODEV;
> > +             goto unlock;
> > +     }
> >
> >       if (!on) {
> >               v4l2_subdev_call(source_subdev, video, s_stream, 0);
> > @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >
> >       ret =3D pm_runtime_resume_and_get(dev);
> >       if (ret < 0)
> > -             return ret;
> > +             goto unlock;
> >
> >       /* Sensor Pixel Rate */
> >
> > @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >               goto error_pm;
> >       }
> >
> > +     mbus_format =3D v4l2_subdev_state_get_format(state,
> > +                                                SUN6I_MIPI_CSI2_PAD_SI=
NK);
> >       format =3D sun6i_mipi_csi2_format_find(mbus_format->code);
> >       if (WARN_ON(!format)) {
> >               ret =3D -ENODEV;
> > @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >
> >       /* Controller */
> >
> > -     sun6i_mipi_csi2_configure(csi2_dev);
> > +     sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
> >       sun6i_mipi_csi2_enable(csi2_dev);
> >
> >       /* D-PHY */
> > @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >       if (ret && ret !=3D -ENOIOCTLCMD)
> >               goto disable;
> >
> > -     return 0;
> > +     ret =3D 0;
> > +     goto unlock;
> >
> >  disable:
> >       phy_power_off(dphy);
> > @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >  error_pm:
> >       pm_runtime_put(dev);
> >
> > +unlock:
> > +     v4l2_subdev_unlock_state(state);
> >       return ret;
> >  }
> >
> > @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_m=
bus_framefmt *mbus_format)
> >  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
> >                                     struct v4l2_subdev_state *state)
> >  {
> > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(s=
ubdev);
> > -     unsigned int pad =3D SUN6I_MIPI_CSI2_PAD_SINK;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D
> > -             v4l2_subdev_state_get_format(state, pad);
> > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > +     unsigned int pad;
> >
> > -     mutex_lock(lock);
> > +     /*
> > +      * This subdev does not perform format conversion,
> > +      * initialize both pads identically.
> > +      */
> > +     for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> > +             struct v4l2_mbus_framefmt *mbus_format;
> >
> > -     mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_code;
> > -     mbus_format->width =3D 640;
> > -     mbus_format->height =3D 480;
> > +             mbus_format =3D v4l2_subdev_state_get_format(state, pad);
> >
> > -     sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > +             mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_cod=
e;
> > +             mbus_format->width =3D 640;
> > +             mbus_format->height =3D 480;
> >
> > -     mutex_unlock(lock);
> > +             sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > +     }
> >
> >       return 0;
> >  }
> > @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev=
 *subdev,
> >       return 0;
> >  }
> >
> > -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> > -                                struct v4l2_subdev_state *state,
> > -                                struct v4l2_subdev_format *format)
> > -{
> > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(s=
ubdev);
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > -
> > -     mutex_lock(lock);
> > -
> > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -             *mbus_format =3D *v4l2_subdev_state_get_format(state,
> > -                                                          format->pad)=
;
> > -     else
> > -             *mbus_format =3D csi2_dev->bridge.mbus_format;
> > -
> > -     mutex_unlock(lock);
> > -
> > -     return 0;
> > -}
> > -
> >  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> >                                  struct v4l2_subdev_state *state,
> >                                  struct v4l2_subdev_format *format)
> >  {
> > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(s=
ubdev);
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > +     struct v4l2_mbus_framefmt *fmt;
> >
> > -     mutex_lock(lock);
> > +     /* The format on the source pad always matches the sink pad. */
> > +     if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> > +             return v4l2_subdev_get_fmt(subdev, state, format);
> >
> > -     sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > +     sun6i_mipi_csi2_mbus_format_prepare(&format->format);
> >
> > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -             *v4l2_subdev_state_get_format(state, format->pad) =3D
> > -                     *mbus_format;
> > -     else
> > -             csi2_dev->bridge.mbus_format =3D *mbus_format;
> > +     /* Set the format on the sink pad. */
> > +     fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > +     *fmt =3D format->format;
> >
> > -     mutex_unlock(lock);
> > +     /* Propagate the format to the source pad. */
> > +     fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_S=
OURCE);
> > +     *fmt =3D format->format;
> >
> >       return 0;
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops =3D {
> >       .enum_mbus_code =3D sun6i_mipi_csi2_enum_mbus_code,
> > -     .get_fmt        =3D sun6i_mipi_csi2_get_fmt,
> > +     .get_fmt        =3D v4l2_subdev_get_fmt,
> >       .set_fmt        =3D sun6i_mipi_csi2_set_fmt,
> >  };
> >
> > @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6=
i_mipi_csi2_device *csi2_dev)
> >       bool notifier_registered =3D false;
> >       int ret;
> >
> > -     mutex_init(&bridge->lock);
> > -
> >       /* V4L2 Subdev */
> >
> >       v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> > @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun=
6i_mipi_csi2_device *csi2_dev)
> >       if (ret)
> >               return ret;
> >
> > +     /* V4L2 Subdev finalize */
> > +
> > +     ret =3D v4l2_subdev_init_finalize(subdev);
> > +     if (ret < 0)
> > +             goto error_media_entity_cleanup;
> > +
> >       /* V4L2 Async */
> >
> >       v4l2_async_subdev_nf_init(notifier, subdev);
> > @@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6=
i_mipi_csi2_device *csi2_dev)
> >  error_v4l2_notifier_cleanup:
> >       v4l2_async_nf_cleanup(notifier);
> >
> > +     v4l2_subdev_cleanup(subdev);
> > +
> > +error_media_entity_cleanup:
> >       media_entity_cleanup(&subdev->entity);
> >
> >       return ret;
> > @@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_cs=
i2_device *csi2_dev)
> >       v4l2_async_unregister_subdev(subdev);
> >       v4l2_async_nf_unregister(notifier);
> >       v4l2_async_nf_cleanup(notifier);
> > +     v4l2_subdev_cleanup(subdev);
> >       media_entity_cleanup(&subdev->entity);
> >  }
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_cs=
i2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > index 24b15e34b5e8..d72dfbd6a993 100644
> > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
> >       struct media_pad                pads[SUN6I_MIPI_CSI2_PAD_COUNT];
> >       struct v4l2_fwnode_endpoint     endpoint;
> >       struct v4l2_async_notifier      notifier;
> > -     struct v4l2_mbus_framefmt       mbus_format;
> > -     struct mutex                    lock; /* Mbus format lock. */
> >
> >       struct v4l2_subdev              *source_subdev;
> >  };
> > --
> > 2.34.1
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

--=20
Regards,
Arash Golgol
