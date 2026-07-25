Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E9235358
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Jul 2026 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917116; cv=pass; b=u6U5UFE8hu3ggmNPITKRY6P+EDFkwp3xECaHdNoxO+Nf14wxP6gg15DWaBPlECG5qcJ1PS3vAoKpzyunG8cNzbhA94LWeeJ4qFKDpFjwLV91nld1DDNKzvv1sqLYqyfzrMoNstxxpKm7332O1FnKbKx7VN7oyAH+jD8sU3Le418=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917116; c=relaxed/simple;
	bh=h/EHnUr7lunz5Db+KPTar0ziC2d6S7/v6vFWOk9+/Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONTpunbapyhVT+b1n/grCaAzAVEC40gpAAfs/C5eNRRYAL9tdy9a2PcoFEVS5BwYQxr9GDlAPFrRrmYKxcXuTXQOT60mELDtk+Qc+7yzzaO9ptljg07iD7x0LRbJYFTKpzRfRXWxcBJ9SqzRrUPgKrEZ/FEaXVFCcLl05npZ0Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwqOnPzO; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwqOnPzO"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-44868d6a066so352411fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Jul 2026 11:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784917114; cv=none;
        d=google.com; s=arc-20260327;
        b=lyvRSiMrZXlwyzN5Y5/HqlPyix7DIdEA1TyE/Yffrtb3WxFBUeSczJH5+hz7xSDg71
         76X5Fe5M3V6d9bw8eylKWeoNXcKNHPG2t33C8RyC8gjHmOEPgB0IuZOfnsABoPa1ELC+
         IyEDZSPZP/SxuT419ERCOYlayJzrlhFgqAqMUuCgqI5sOlwRmbmgtc7URRzml8n5eO/4
         SpmlA+hT6jJPRTt9B5mCBkPLjn1OfcS9d6RnYAoUWaNX7HXHV5OwjrjQOK86NUxezeXC
         D9nFh7ZtZjkYGGthAXcUdW8PSHE50nEnBPzrs9wUqrIGSS+nkBElEYhrkW9lx7DNDQox
         FbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sX1KDNxM9OiXTvNDmoD8ot6nH9bARF44QBDDUnFOimQ=;
        fh=yN+qr0NnlESUi1Y/HGG9jpoeqUyAsvx4q6YAjOH/FXE=;
        b=g9aco66Y/80VBdVzC5skfR0MO0BiBMjgRWXOUTMOC5euv/dtA1001LjW0RwbmmY3LI
         kpdO3WN145aGRoZbpSWXZE5frEhhP5QBQY6MUq9aEUOlC+kmwGZHMZjU8wGYWncYWjM+
         zDIl5qEpdW0xL+1gWmNMqQxKALefWEVf3AAq/xV0EUdp19b2KONsiSCJ3FzHYRFmAyzd
         ydrcqTxy5LF4puRJ89RoEIjVun0GFoMHJW2hVOsNJ1bhDJIapvspsKLOAKF14hAQHVp5
         mxwWypKon49tr2ilsxTQds5swA71+r+Gqzl2GbC61ocigsdjyeTK+R7L0ku5iWkVD1/x
         tm1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784917114; x=1785521914; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sX1KDNxM9OiXTvNDmoD8ot6nH9bARF44QBDDUnFOimQ=;
        b=LwqOnPzONh1FUpnwI/XCDyk+ANmPSRC5m4UOpmyw0Rk7eDYwqIVD+/CcaLa7wCe7Y5
         Fsk0zuT4uvX2nYctnU7JOoOHGOXclxXorizXOpGls2O5DK93Z5rFZjFRg+pa4VgmIrfp
         daHdHCXhQX08Bk6BCSI71PBWDWZWK8Evazft31nl5aFEwEmK8DG8ypQ5XMWT5FOXI/uz
         lsFGj131hnmWKZWqaJH0dXJ/0SoGwR19/OC+NEjD5lgm/2x4z/STZPUTOp1opiUYCWor
         IObVcdWM9voB+38sTgaFEKmVVFaLvGG/QrbVmrA5LL4zArb4Stvy6sN5FGo1tHS+GUIv
         flZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917114; x=1785521914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sX1KDNxM9OiXTvNDmoD8ot6nH9bARF44QBDDUnFOimQ=;
        b=RkSiEWJSJHjac7ocnIyXabuwCocR5C58TxWzHjOVAUrrRoElqLuFxynaM4rt3n9Osc
         9F0wN6GvFcJaxAIjPyvel8Lc3px442JY5ayJg/mscd5yxkwVEgeBM37SFzTa/Qd/jycE
         rB+Hu5LvoHbVIRZpl9CbGWEXUWyHtpMWjv2znuHhzscaZ3Jpu3oyHnQnLezl4bAwIur7
         d+mChEuivwsUZCAQXECh4YGNe0/MGXZwZIQ1LdhpYLSwD3BjxqBmKO/0EIDonghrf/+3
         abnJnLBWpEykIyWIVXpfpWHiiVR0FmyvcBysKFUD8PFPR/cdC1kHlGbrIphRqcFYM5a8
         P0Ww==
X-Forwarded-Encrypted: i=1; AHgh+Rpzu+TX50YIMUpBWWigzysv6HoY/80yGKiDtMxGSPpGBstOyaCNC+pfa5v8J6/8ntou87DARY7aIfWikw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2nveuho18TQ6N7WrGqwVY+HW6ffoqhLPnpc6xpoBQ3M/RLUIV
	B4Z9UmrGhcVyVbCLQuAEcTfUWlMYsAa61gHEoyEu7kwkbBl6H6RutpkOfmK3qazE4/PyNbdQhfP
	ygKQOPeetnFbT+zx/BGjpLjemjps2na0=
X-Gm-Gg: AR+sD13WrZ+ZXvwbSZJmlNn6KbFgH8dpTnw6s4kQna5sK7/95oxnftyUtHgXNLtaCsz
	DZUuVjGwwhqwTvPlmdunX6VPTN/s4iNmn6lIAnAQ78DORy6hZ6rw/qOpalTx2Ftx9Xu79WVjE9V
	l+L8FeT5uEX+XQvkp96msNvpKNxgkY5RXveznq6s6tc0PzCymYUleZ6a62NKDyAMDHnD97cxZ+P
	XtGGwbdH7m18HZPIT0WST+A5m8AjZW3R9rtdru+4aI//kxpgHpeZZ21tagbXuMahimgfQqsxKcK
	fJm8J+lh6TzqDxF9AhpH1Bh4b/o78BcvU6y8MrV6eyktv+k=
X-Received: by 2002:a05:6808:14d0:b0:494:9c17:c336 with SMTP id
 5614622812f47-4ab3560424emr5473315b6e.34.1784917113746; Fri, 24 Jul 2026
 11:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214050943.6306-1-arash.golgol@gmail.com> <afx-yCUZAvWfMNEe@collins>
 <CAMxPZkia0_xHtaQfcfmizPz_AX-tLA7g+nC2FhgKtATiMUkfLA@mail.gmail.com>
In-Reply-To: <CAMxPZkia0_xHtaQfcfmizPz_AX-tLA7g+nC2FhgKtATiMUkfLA@mail.gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 25 Jul 2026 21:48:06 +0330
X-Gm-Features: AUfX_mzL9LQI71UhGymklcqxGxTDFX_f-A4Y8x1IQAzLfmvOSMg_5L9ySjMf0lI
Message-ID: <CAMxPZkgi+-2tTABJFb3Ec7v+_2nJe5vFXSzxGxWTZM0RqaRKyw@mail.gmail.com>
Subject: Re: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, linux-sunxi@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Thu, Jul 9, 2026 at 8:04=E2=80=AFAM arash golgol <arash.golgol@gmail.com=
> wrote:
>
> Hi,
>
> On Thu, May 7, 2026 at 3:30=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
> >
> > Hi Arash,
> >
> > Le Sat 14 Feb 26, 08:39, Arash Golgol a =C3=A9crit :
> > > Use the V4L2 subdev active state API to store the active format.
> > > This simplifies the driver not only by dropping the bridge mbus_forma=
t
> > > field, but it also allows dropping the bridge lock, replaced with
> > > the state lock.
> > >
> > > The sun6i-mipi-csi2 hardware does not perform any format conversion.
> > > Enforce identical formats on the sink and source pads in the set_fmt(=
)
> > > and init_state() callbacks.
> > >
> > > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Looks very good. Feel free to let me know if you'd like to do the same
> > with A83T (I could test it on my side), otherwise I will take a look at
> > it later. The driver has essentially exactly the same structure.
> >
> > Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> > Tested-by: Paul Kocialkowski <paulk@sys-base.io>
>
> This is a gentle ping for this patch.
> As far as I understand, the patch has received the required reviews and t=
esting.
> If there are no remaining issues, could it be considered for merging?

This patch currently has no delegate in patchwork (you were the
delegate on an earlier version).
Link: https://patchwork.linuxtv.org/project/linux-media/patch/2026021405094=
3.6306-1-arash.golgol@gmail.com/

I appreciate your feedback.

> > All the best,
> >
> > Paul
> >
> > > ---
> > > Changes in v3:
> > >     - link to v2: https://patchwork.kernel.org/project/linux-media/pa=
tch/20260209055529.16644-1-arash.golgol@gmail.com/
> > >     - Keep error path jumping to error_v4l2_notifier_cleanup on
> > >     bridge setup failure
> > >
> > > Changes in v2:
> > >     - link to v1: https://patchwork.kernel.org/project/linux-media/pa=
tch/20260206123455.46476-1-arash.golgol@gmail.com/
> > >     - Simplify control flow by dropping the else at end of s_stream()
> > >     - Call v4l2_subdev_cleanup() on bridge setup failure before
> > >     notifier registration
> > >
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++-------=
--
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> > >  2 files changed, 53 insertions(+), 56 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_=
csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > index b06cb73015cd..682bdd82098c 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > @@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_=
mipi_csi2_device *csi2_dev)
> > >                          SUN6I_MIPI_CSI2_CTL_EN, 0);
> > >  }
> > >
> > > -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device =
*csi2_dev)
> > > +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device =
*csi2_dev,
> > > +                                    const struct v4l2_mbus_framefmt =
*mbus_format)
> > >  {
> > >       struct regmap *regmap =3D csi2_dev->regmap;
> > >       unsigned int lanes_count =3D
> > >               csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mb=
us_format;
> > >       const struct sun6i_mipi_csi2_format *format;
> > >       struct device *dev =3D csi2_dev->dev;
> > >       u32 version =3D 0;
> > > @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >       struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_s=
ubdev;
> > >       union phy_configure_opts dphy_opts =3D { 0 };
> > >       struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mi=
pi_dphy;
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mb=
us_format;
> > > +     struct v4l2_subdev_state *state;
> > > +     const struct v4l2_mbus_framefmt *mbus_format;
> > >       const struct sun6i_mipi_csi2_format *format;
> > >       struct phy *dphy =3D csi2_dev->dphy;
> > >       struct device *dev =3D csi2_dev->dev;
> > > @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
> > >       unsigned long pixel_rate;
> > >       int ret;
> > >
> > > -     if (!source_subdev)
> > > -             return -ENODEV;
> > > +     state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> > > +
> > > +     if (!source_subdev) {
> > > +             ret =3D -ENODEV;
> > > +             goto unlock;
> > > +     }
> > >
> > >       if (!on) {
> > >               v4l2_subdev_call(source_subdev, video, s_stream, 0);
> > > @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >
> > >       ret =3D pm_runtime_resume_and_get(dev);
> > >       if (ret < 0)
> > > -             return ret;
> > > +             goto unlock;
> > >
> > >       /* Sensor Pixel Rate */
> > >
> > > @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >               goto error_pm;
> > >       }
> > >
> > > +     mbus_format =3D v4l2_subdev_state_get_format(state,
> > > +                                                SUN6I_MIPI_CSI2_PAD_=
SINK);
> > >       format =3D sun6i_mipi_csi2_format_find(mbus_format->code);
> > >       if (WARN_ON(!format)) {
> > >               ret =3D -ENODEV;
> > > @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >
> > >       /* Controller */
> > >
> > > -     sun6i_mipi_csi2_configure(csi2_dev);
> > > +     sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
> > >       sun6i_mipi_csi2_enable(csi2_dev);
> > >
> > >       /* D-PHY */
> > > @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >       if (ret && ret !=3D -ENOIOCTLCMD)
> > >               goto disable;
> > >
> > > -     return 0;
> > > +     ret =3D 0;
> > > +     goto unlock;
> > >
> > >  disable:
> > >       phy_power_off(dphy);
> > > @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >  error_pm:
> > >       pm_runtime_put(dev);
> > >
> > > +unlock:
> > > +     v4l2_subdev_unlock_state(state);
> > >       return ret;
> > >  }
> > >
> > > @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2=
_mbus_framefmt *mbus_format)
> > >  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
> > >                                     struct v4l2_subdev_state *state)
> > >  {
> > > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata=
(subdev);
> > > -     unsigned int pad =3D SUN6I_MIPI_CSI2_PAD_SINK;
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D
> > > -             v4l2_subdev_state_get_format(state, pad);
> > > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > > +     unsigned int pad;
> > >
> > > -     mutex_lock(lock);
> > > +     /*
> > > +      * This subdev does not perform format conversion,
> > > +      * initialize both pads identically.
> > > +      */
> > > +     for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> > > +             struct v4l2_mbus_framefmt *mbus_format;
> > >
> > > -     mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_code;
> > > -     mbus_format->width =3D 640;
> > > -     mbus_format->height =3D 480;
> > > +             mbus_format =3D v4l2_subdev_state_get_format(state, pad=
);
> > >
> > > -     sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > +             mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_c=
ode;
> > > +             mbus_format->width =3D 640;
> > > +             mbus_format->height =3D 480;
> > >
> > > -     mutex_unlock(lock);
> > > +             sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > +     }
> > >
> > >       return 0;
> > >  }
> > > @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subd=
ev *subdev,
> > >       return 0;
> > >  }
> > >
> > > -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> > > -                                struct v4l2_subdev_state *state,
> > > -                                struct v4l2_subdev_format *format)
> > > -{
> > > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata=
(subdev);
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > > -
> > > -     mutex_lock(lock);
> > > -
> > > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > > -             *mbus_format =3D *v4l2_subdev_state_get_format(state,
> > > -                                                          format->pa=
d);
> > > -     else
> > > -             *mbus_format =3D csi2_dev->bridge.mbus_format;
> > > -
> > > -     mutex_unlock(lock);
> > > -
> > > -     return 0;
> > > -}
> > > -
> > >  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> > >                                  struct v4l2_subdev_state *state,
> > >                                  struct v4l2_subdev_format *format)
> > >  {
> > > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata=
(subdev);
> > > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > > +     struct v4l2_mbus_framefmt *fmt;
> > >
> > > -     mutex_lock(lock);
> > > +     /* The format on the source pad always matches the sink pad. */
> > > +     if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> > > +             return v4l2_subdev_get_fmt(subdev, state, format);
> > >
> > > -     sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > +     sun6i_mipi_csi2_mbus_format_prepare(&format->format);
> > >
> > > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > > -             *v4l2_subdev_state_get_format(state, format->pad) =3D
> > > -                     *mbus_format;
> > > -     else
> > > -             csi2_dev->bridge.mbus_format =3D *mbus_format;
> > > +     /* Set the format on the sink pad. */
> > > +     fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > > +     *fmt =3D format->format;
> > >
> > > -     mutex_unlock(lock);
> > > +     /* Propagate the format to the source pad. */
> > > +     fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD=
_SOURCE);
> > > +     *fmt =3D format->format;
> > >
> > >       return 0;
> > >  }
> > >
> > >  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops =3D =
{
> > >       .enum_mbus_code =3D sun6i_mipi_csi2_enum_mbus_code,
> > > -     .get_fmt        =3D sun6i_mipi_csi2_get_fmt,
> > > +     .get_fmt        =3D v4l2_subdev_get_fmt,
> > >       .set_fmt        =3D sun6i_mipi_csi2_set_fmt,
> > >  };
> > >
> > > @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct su=
n6i_mipi_csi2_device *csi2_dev)
> > >       bool notifier_registered =3D false;
> > >       int ret;
> > >
> > > -     mutex_init(&bridge->lock);
> > > -
> > >       /* V4L2 Subdev */
> > >
> > >       v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> > > @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct s=
un6i_mipi_csi2_device *csi2_dev)
> > >       if (ret)
> > >               return ret;
> > >
> > > +     /* V4L2 Subdev finalize */
> > > +
> > > +     ret =3D v4l2_subdev_init_finalize(subdev);
> > > +     if (ret < 0)
> > > +             goto error_media_entity_cleanup;
> > > +
> > >       /* V4L2 Async */
> > >
> > >       v4l2_async_subdev_nf_init(notifier, subdev);
> > > @@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct su=
n6i_mipi_csi2_device *csi2_dev)
> > >  error_v4l2_notifier_cleanup:
> > >       v4l2_async_nf_cleanup(notifier);
> > >
> > > +     v4l2_subdev_cleanup(subdev);
> > > +
> > > +error_media_entity_cleanup:
> > >       media_entity_cleanup(&subdev->entity);
> > >
> > >       return ret;
> > > @@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_=
csi2_device *csi2_dev)
> > >       v4l2_async_unregister_subdev(subdev);
> > >       v4l2_async_nf_unregister(notifier);
> > >       v4l2_async_nf_cleanup(notifier);
> > > +     v4l2_subdev_cleanup(subdev);
> > >       media_entity_cleanup(&subdev->entity);
> > >  }
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_=
csi2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > index 24b15e34b5e8..d72dfbd6a993 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
> > >       struct media_pad                pads[SUN6I_MIPI_CSI2_PAD_COUNT]=
;
> > >       struct v4l2_fwnode_endpoint     endpoint;
> > >       struct v4l2_async_notifier      notifier;
> > > -     struct v4l2_mbus_framefmt       mbus_format;
> > > -     struct mutex                    lock; /* Mbus format lock. */
> > >
> > >       struct v4l2_subdev              *source_subdev;
> > >  };
> > > --
> > > 2.34.1

--=20
Regards,
Arash Golgol
