Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC76233941
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Jul 2026 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772714; cv=pass; b=ufdu1OIb02IDCIU9MMNlYUTjPmZJ8h4oUMLO6YzUMSuDlYLUKFexWfQuLrJFkm+tsAH1cDWW0+J0Lcg06mmj5bP7rspl7HPlMim2RQXF6DikT62fErxS2gj1Pvpdbf1Wf9W5jKyXB8VURdSrb/xxUs1oOGGaLdPkPIS0VlUteaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772714; c=relaxed/simple;
	bh=eXS2K1ZOIg4i0JyO+8HG0S1D3oCOCAXtk2WC8NBtWZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmObxcCkmzxi4jTaE3ednOVMALdK5Pd5uP19kaDTFOfCuu42Bf4jJI8IfxVH+qWi7x2fHekESDmhIYxyLPK1aC/FXCA2ZfGwYriPBiAH9Bo8sUqJFgkXj6FZSwzTB9VtcEsg3Y8SPZHdWxysOkYcrkutmt7h1kHbB3rljGi9Zu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhJKOJfF; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhJKOJfF"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-495b250b01cso1284217b6e.0
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Jul 2026 05:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772711; cv=none;
        d=google.com; s=arc-20260327;
        b=Wt/JF0vk8UQQB07ubQdqN0okfoI2/T4URFRm8ZZc56ZZXhQeLyOOMuQm/ZlBGetNs/
         MMoOIGW+Yflu1Rao1Q44rt+YBW522IAe/gPlfWN3PZzb5+HHGVi1iaJWpQwkx1WiKGkA
         iltG5Du6RSbB7GPQeI3zaAob5ZGa5UG2BDKyUd/6OFoaQ+rxAyjglcspYzaK8P7JitgH
         RjBu1gUhmO792lyqRJOxIImOFWlYZ1lH5J+ArDYA/R3YhtfXpUnVz2rEKtoV7SSaD2xG
         81QYYBfx+q32lt77iGoq21I7TYmiceXLHLOpRXM7376KzN+rqW+PvgHtGW9y4XIodiDk
         xRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGRyG/0ys0P2Ahtr58LtuFXAaoT80IRB3dXSGZ/SVSo=;
        fh=jbUWv3r6qOd2qqO1QbiT4hfO/750WZX1/PQuaKAcAqE=;
        b=sj50s47x9YEi8KsDnhyFCRRO1WZBCs6bfH5zu1ruhMoGi+fVqfXoiyqjrkPtSgiVjK
         nUZ+5ftxhuPHEVBAnZ3n96AALpbl3yfq1Rgt8mWtwYHK2XgGMOTM4RIU1A7z5UfkDc+m
         3XGKenZA3nxwOUBa+tmbqV9bpyZvPi8qSMgN8UG8H7oFR+WgjGXooJv8x9HtWTWUO/7G
         ngqXivtLOUV8IDCelmaTpesxnTImOHzsQB3RnxDyrhqw0AiaVrBfwIXppFi5HiIZulcL
         xWHGK9Z5XAwDtr0eb1bo4qMcbeTUkbfd8TgR5oVb5p+NcQRWSX80L6s1+fj/sE5sFELW
         gUVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772711; x=1784377511; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGRyG/0ys0P2Ahtr58LtuFXAaoT80IRB3dXSGZ/SVSo=;
        b=qhJKOJfF1nWByr5sZaLnDxfuVDxIZ2N4KIWVmEGQ6vSAP3aLUC+W3vkVfZsoLM7oBi
         ckf1MBd9/QZoqYCfOJV/TzpnGEvN1LV5iBmTUgbn+dpbozz4GEM563xVKIFkqA7bDpcb
         kD2g+CJwXyC2J9U7z1wZKi3sAhAGhE6ta6C3nGN2KrSZccx7R9P5/jRa1thgIg182pSb
         N/wY2m9Ur9x4fkGfpdvdTO5TazG/qTloESWdR36mTGzAgHRnlHWPJlpnKqzQ5EINOgNj
         KahD8cx7fEk1uTHslBdGuuHvy2vnHoQ6KllHuXXS8wG7mtEQfjmPkNXvIGBfAOpmu8YO
         PXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772711; x=1784377511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGRyG/0ys0P2Ahtr58LtuFXAaoT80IRB3dXSGZ/SVSo=;
        b=e8P6iR/mKi53nETsv/t4INyLHhD98ymwlvQ3ngruWWGyAwq/cYECkRPWi+lVwrHVAO
         HNcwYA2Hp7zmZpv9gzGSSiZdmiBsa5A7N1OoFSKahjxajM94MkcWHm0MlMZaoRI8dpxj
         v49leRXOv6oU8Z1HLC2MyCrQi6lKKzkvVUIY+Oj0UpLamGM9Uj7KkyH7cLeSOcumjEPM
         qaBU6UO7z5+QAiP4e1ebaowrDw699J/pWozUzw/RRsqJWozgZNxiYIkUpp+DwWiWTs64
         3V9uHz1N1KivbAzPnwUqeQUvJITvfQkiqk16iVN3Rt2X45CX31s7u7zYhXuVZ7mlWx6B
         IvzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2SnDa1IZ3+kxKCcTZEHRUqptrlDSlUxlUmZcJm4eArqOO2MyxCP4jRGNZ0vMbrTNNU9Q40L6/Xdq17g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1suvnHDxH5nMnkyecMAiWaVWWgsnvjy+BiucB2TQPVcK2Bigr
	HpXxMulE+fsGIKNDlXFWznrJTsQ2eSZWgBEau1seOJ1qazYOSq8dkpG4smUs59gKz7N4wfpeinQ
	oiwBw5TkGJ4RH9tWaBXKCJWIR4HlSwts=
X-Gm-Gg: AfdE7ck5vA1IVstIKIcc+T3O6L4gyi5v80cvk2SqP0LTxOPgvEyLR/RyW184rZliwi/
	DGMR4yBlvt9STQsP4Uz8wrVIuRL15lC1lAK9doJaPeVlja9Sg89Sydz0D1eZK7uY6VIEd6jzFkM
	5cOzfuxTJ/UQp46NAF7HHrSau9HT2un4nZvDYj25rnRH8CFVi2E7DyBmB3fu5Il+5DaqMRVsr8y
	atXLmv+Mcj/RyX9o4Pq+3kl3U4OoBExvtBTE45RuM1vjsF/pJ6Jlv3sWspUA5SzUULmv8x9VAVB
	tW4lW/K5bwqV30NVew+ztqCO7szvlTX4zP1nGXpAfP6kFxDGrY4dbXAVcA==
X-Received: by 2002:a05:6808:120b:b0:487:61da:70fb with SMTP id
 5614622812f47-4a42ad68ed8mr1719757b6e.10.1783772711465; Sat, 11 Jul 2026
 05:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515173101.8978-1-arash.golgol@gmail.com> <agowixYIRIB7D3J3@collins>
In-Reply-To: <agowixYIRIB7D3J3@collins>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 11 Jul 2026 15:54:59 +0330
X-Gm-Features: AUfX_mzm-LNAe1Hj9LjE4lheklMeFv48h1ivIxDbQ5HN67cH33p6CC2n6a3BTpY
Message-ID: <CAMxPZkgMMQf52aOcPUkanhEOrNJnecNgppVmJ5044SDhWUPAaA@mail.gmail.com>
Subject: Re: [PATCH v3] media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 18, 2026 at 12:48=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Arash,
>
> Le Fri 15 May 26, 21:01, Arash Golgol a =C3=A9crit :
> > Use the V4L2 subdev active state API to store the active format.
> > This simplifies the driver not only by dropping the bridge mbus_format
> > field, but it also allows dropping the bridge lock, replaced with
> > the state lock.
> >
> > The sun8i-a83t-mipi-csi2 hardware does not perform any format
> > conversion. Enforce identical formats on the sink and source pads in
> > the set_fmt() and init_state() callbacks.
>
> Looks good to me and works well on the hardware!
> Thanks again for your work.
>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> Tested-by: Paul Kocialkowski <paulk@sys-base.io>

I'd like to gently follow up on this patch.

> All the best,
>
> Paul
>
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > ---
> > Changes in v3:
> >  - Fix active state lock leak on runtime PM error path
> >
> > Changes in v2:
> >  - Initialize active state before calling v4l2_subdev_state_get_format(=
)
> >  - Fix line wrapping reported by checkpatch
> >  - Link to media-ci report: https://linux-media.pages.freedesktop.org/-=
/users/patchwork/-/jobs/99865145/artifacts/report.htm
> >
> >  .../sun8i_a83t_mipi_csi2.c                    | 113 +++++++++---------
> >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> >  2 files changed, 56 insertions(+), 59 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a8=
3t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a8=
3t_mipi_csi2.c
> > index dbc51daa4fe3..2b7635f3952d 100644
> > --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi=
_csi2.c
> > +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi=
_csi2.c
> > @@ -144,12 +144,12 @@ sun8i_a83t_mipi_csi2_disable(struct sun8i_a83t_mi=
pi_csi2_device *csi2_dev)
> >  }
> >
> >  static void
> > -sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi=
2_dev)
> > +sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi=
2_dev,
> > +                            const struct v4l2_mbus_framefmt *mbus_form=
at)
> >  {
> >       struct regmap *regmap =3D csi2_dev->regmap;
> >       unsigned int lanes_count =3D
> >               csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
> >       const struct sun8i_a83t_mipi_csi2_format *format;
> >       struct device *dev =3D csi2_dev->dev;
> >       u32 version =3D 0;
> > @@ -205,7 +205,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >       struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_sub=
dev;
> >       union phy_configure_opts dphy_opts =3D { 0 };
> >       struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi=
_dphy;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
> > +     struct v4l2_subdev_state *state;
> > +     const struct v4l2_mbus_framefmt *mbus_format;
> >       const struct sun8i_a83t_mipi_csi2_format *format;
> >       struct phy *dphy =3D csi2_dev->dphy;
> >       struct device *dev =3D csi2_dev->dev;
> > @@ -215,8 +216,12 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4=
l2_subdev *subdev, int on)
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
> > @@ -228,7 +233,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >
> >       ret =3D pm_runtime_resume_and_get(dev);
> >       if (ret < 0)
> > -             return ret;
> > +             goto unlock;
> >
> >       /* Sensor pixel rate */
> >
> > @@ -254,6 +259,9 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >               goto error_pm;
> >       }
> >
> > +     mbus_format =3D
> > +             v4l2_subdev_state_get_format(state,
> > +                                          SUN8I_A83T_MIPI_CSI2_PAD_SIN=
K);
> >       format =3D sun8i_a83t_mipi_csi2_format_find(mbus_format->code);
> >       if (WARN_ON(!format)) {
> >               ret =3D -ENODEV;
> > @@ -292,7 +300,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >
> >       /* Controller */
> >
> > -     sun8i_a83t_mipi_csi2_configure(csi2_dev);
> > +     sun8i_a83t_mipi_csi2_configure(csi2_dev, mbus_format);
> >       sun8i_a83t_mipi_csi2_enable(csi2_dev);
> >
> >       /* D-PHY */
> > @@ -309,7 +317,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >       if (ret && ret !=3D -ENOIOCTLCMD)
> >               goto disable;
> >
> > -     return 0;
> > +     ret =3D 0;
> > +     goto unlock;
> >
> >  disable:
> >       phy_power_off(dphy);
> > @@ -318,6 +327,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >  error_pm:
> >       pm_runtime_put(dev);
> >
> > +unlock:
> > +     v4l2_subdev_unlock_state(state);
> >       return ret;
> >  }
> >
> > @@ -341,22 +352,24 @@ sun8i_a83t_mipi_csi2_mbus_format_prepare(struct v=
4l2_mbus_framefmt *mbus_format)
> >  static int sun8i_a83t_mipi_csi2_init_state(struct v4l2_subdev *subdev,
> >                                          struct v4l2_subdev_state *stat=
e)
> >  {
> > -     struct sun8i_a83t_mipi_csi2_device *csi2_dev =3D
> > -             v4l2_get_subdevdata(subdev);
> > -     unsigned int pad =3D SUN8I_A83T_MIPI_CSI2_PAD_SINK;
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
> > -     mbus_format->code =3D sun8i_a83t_mipi_csi2_formats[0].mbus_code;
> > -     mbus_format->width =3D 640;
> > -     mbus_format->height =3D 480;
> > +             mbus_format =3D v4l2_subdev_state_get_format(state, pad);
> > +
> > +             mbus_format->code =3D sun8i_a83t_mipi_csi2_formats[0].mbu=
s_code;
> > +             mbus_format->width =3D 640;
> > +             mbus_format->height =3D 480;
> >
> > -     sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
> > +             sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
> > +     }
> >
> > -     mutex_unlock(lock);
> >
> >       return 0;
> >  }
> > @@ -375,55 +388,33 @@ sun8i_a83t_mipi_csi2_enum_mbus_code(struct v4l2_s=
ubdev *subdev,
> >       return 0;
> >  }
> >
> > -static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> > -                                     struct v4l2_subdev_state *state,
> > -                                     struct v4l2_subdev_format *format=
)
> > -{
> > -     struct sun8i_a83t_mipi_csi2_device *csi2_dev =3D
> > -             v4l2_get_subdevdata(subdev);
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
> >  static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> >                                       struct v4l2_subdev_state *state,
> >                                       struct v4l2_subdev_format *format=
)
> >  {
> > -     struct sun8i_a83t_mipi_csi2_device *csi2_dev =3D
> > -             v4l2_get_subdevdata(subdev);
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > +     struct v4l2_mbus_framefmt *fmt;
> >
> > -     mutex_lock(lock);
> > +     /* The format on the source pad always matches the sink pad. */
> > +     if (format->pad !=3D SUN8I_A83T_MIPI_CSI2_PAD_SINK)
> > +             return v4l2_subdev_get_fmt(subdev, state, format);
> >
> > -     sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
> > +     sun8i_a83t_mipi_csi2_mbus_format_prepare(&format->format);
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
> > +     fmt =3D v4l2_subdev_state_get_format(state,
> > +                                        SUN8I_A83T_MIPI_CSI2_PAD_SOURC=
E);
> > +     *fmt =3D format->format;
> >
> >       return 0;
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops sun8i_a83t_mipi_csi2_pad_ops =
=3D {
> >       .enum_mbus_code =3D sun8i_a83t_mipi_csi2_enum_mbus_code,
> > -     .get_fmt        =3D sun8i_a83t_mipi_csi2_get_fmt,
> > +     .get_fmt        =3D v4l2_subdev_get_fmt,
> >       .set_fmt        =3D sun8i_a83t_mipi_csi2_set_fmt,
> >  };
> >
> > @@ -540,8 +531,6 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t=
_mipi_csi2_device *csi2_dev)
> >       bool notifier_registered =3D false;
> >       int ret;
> >
> > -     mutex_init(&bridge->lock);
> > -
> >       /* V4L2 Subdev */
> >
> >       v4l2_subdev_init(subdev, &sun8i_a83t_mipi_csi2_subdev_ops);
> > @@ -570,6 +559,12 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83=
t_mipi_csi2_device *csi2_dev)
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
> > @@ -603,6 +598,9 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t=
_mipi_csi2_device *csi2_dev)
> >  error_v4l2_notifier_cleanup:
> >       v4l2_async_nf_cleanup(notifier);
> >
> > +     v4l2_subdev_cleanup(subdev);
> > +
> > +error_media_entity_cleanup:
> >       media_entity_cleanup(&subdev->entity);
> >
> >       return ret;
> > @@ -617,6 +615,7 @@ sun8i_a83t_mipi_csi2_bridge_cleanup(struct sun8i_a8=
3t_mipi_csi2_device *csi2_dev
> >       v4l2_async_unregister_subdev(subdev);
> >       v4l2_async_nf_unregister(notifier);
> >       v4l2_async_nf_cleanup(notifier);
> > +     v4l2_subdev_cleanup(subdev);
> >       media_entity_cleanup(&subdev->entity);
> >  }
> >
> > diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a8=
3t_mipi_csi2.h b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a8=
3t_mipi_csi2.h
> > index f1e64c53434c..819527bcd64d 100644
> > --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi=
_csi2.h
> > +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi=
_csi2.h
> > @@ -33,8 +33,6 @@ struct sun8i_a83t_mipi_csi2_bridge {
> >       struct media_pad                pads[SUN8I_A83T_MIPI_CSI2_PAD_COU=
NT];
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
