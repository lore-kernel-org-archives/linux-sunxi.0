Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8543D6494
	for <linux-sunxi@lists.linux.dev>; Wed, 27 May 2026 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882858; cv=pass; b=Gguqda0MpkAtp4SLqXZ4tRNSnMNDyxboBuO04sVHRwWb9lxOJU0DoVKqkdbKiq89BfOwqu2UfFUP/5kqd0TGY59XHs0uGfp2twiaa8RvfAASVhrkH/Swo4GdZedkNOy9Xqe9WTH5u6f126rbWQzVO4fGt7ilVShQHEPcs5WdDYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882858; c=relaxed/simple;
	bh=r7JV4Qlc/632i94GYxXPKPWstQRLKr2HGMAhVUjmiKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8mEujiKbvPN8umfNqSBilCc8d2Gp/vDPElmEZv/R+AxIoDFv1ZsfEa7uZwm2myzenNuiQjSHNDyaX7KpcmkRrUKuNWNqwAQqmm1IEqJ6jqO2uCOtAFNJcsyiHdia0wCQ6XaEAsajZmoN9988rhAHWBafaUeGpwLPUrlXqmCjjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRqDf0Qv; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRqDf0Qv"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7dcdaf06498so7507709a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 27 May 2026 04:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779882855; cv=none;
        d=google.com; s=arc-20240605;
        b=UqX6cjdi9+YNmO559EUlY8M8TgrYJGyrYZET2xKKhiU2hchDN7p2cnlSzldZNaiML5
         +YvnKUeG9UOfLNkAqFGhi5ojEWSzG8O58dvhjTBv1OiSyNyyNZd11oy5Xq+ZRLIz4IdK
         6xtumKbKA35ncS9fLNU2mgYWG/DbjlrJGk3sR+FGwBLsa2/Ke8vOLRItWazyKXiMKcZi
         rizpdxHwvlBecIcpLWhm83QeEJihavBhOI7VZTpzeWGkTQGJafW4nXkPuR8g+/BuzDtu
         zAGIInYhYW3rSoT01Pgnlxhb514+BO0oMJUD0590vMErFg9LGRS8/0iL4XxiPqsL4+iu
         Jthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        fh=sDarSsxjIONkOBo6yIDo5nT8+neOx3erZ+sbdPZ4rfo=;
        b=V/jAyTJ3+bqY5KTfRHUb7viXt2RSnGorqKX2LTSZN2uglI1VGN/k1xJ5vx1aVboEtg
         I5QEiucPR7nUHdLdqm3lCZCHhuTysmuWsHjjESi2H5XtA1cPseDv4WZTaxSe74PH/8u7
         vfU5oDN7UuuYATjpI5Ta2LoRr8NNYHuZGhhV35Wv0RVqjlGWITAf8fUUJLqyeyp3mt8C
         2LiL2jvI2LAyz0LvGuMqZNcb7fvDOQ1G0vSIHslnbMC4EdRhhTmD2CRv/lKDSU4mtJQi
         tQivM4ladZ5KXHeV82JA/nPk6ooLDewkJMBz009lo70NOFaXUbVtP5cKsLf3tYO9iWwu
         6GGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779882855; x=1780487655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        b=KRqDf0Qvpdf3PwmJpkUv27kxqZ+B3LZqWj2TOm3gwt7xSFiNzfJmdNB0pKdV1iJpJ0
         EHYPXZyk56/opN5aDpoqobh8XevvpHe1JYfO5JeohdUMZkerZfGb23AvmAZLzSK/wYfu
         ZRE0BOPv2aACwFoEdcnTNOkL4vkmEJwY6zXuGdXJ7SbevMKCGgv+E1S+plnfCK2zN89c
         K4YqtL8YWzP+H28u40yBPy/lUQt/RrYBjppdlBjbXMmQJQp81XkA040Blgm7aIqtmtFi
         aCoJ4Nt0VD7n1/nKBsgROn36mPaGGVyaB00XapmkOQ1Mx8lriGCqn44IrZgkJj5roI4V
         q9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779882855; x=1780487655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        b=qRuD4thkJRyLcaYzViodarI/dELLXtesQsFyY8yIhjsyTt0gF26EhjRKS9RMQDB4tq
         fQmcwU5AFe8lfbhaEPLB2Rmjpo3VVeynOQXhw+h59w9MXNIsCDnrAffF+p/3ECiQvFPf
         u8/QDL7qaQ7luVFSQmbxID1LawCu0Db1HR0hkIEiyyojTcCUbttfeZROdLXutpdiDINZ
         iAbYXonoyzu8lEV0MdKfoWI6ZHhReCkO2qpN1JD2HOsRvDPHEI/q6VjvtBaf1Cu1UtT2
         LdIDVAuOTLCnr5toUVkusW/Sd45jt2KHRSaRPZhuKodBVNNZim+RSWoFC5+h13CoOrpg
         mnZw==
X-Forwarded-Encrypted: i=1; AFNElJ/u948zZP5pxeb+3xCRd9Xqyd//i7rQJ+TcYt3i2ts0LvICS9EPr9gVd9r8/CCkM9NCbzee8x653jRq8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0QfL+K7DU1LB2ltG90fJyZXivDZXlL+DkGK65WrTsiDLqXthX
	M7tVzcAygi9FDixpf6YzXyc4V2qp4nQeaZOisCbPC11PzgoP4bBhgwBD/YUvmA2ktwSFLWb/FZa
	zwosKUj3dzOhQlGLH4D4HUKlJ09RFdyg=
X-Gm-Gg: Acq92OGK4T81w5CWYfibuUxRisKdJvKrYz8JIay1MaYLsdJ4Ht4WN3iDnQVfZDqmgQD
	zYIL4Pr5CT94FoUrV5Nh2ymYpFiyxJuWL94clOciqqSd30pNGaYBv0GX28bFNnRB+XpcE56Zx/Z
	Dc0ZaVg4jnj4nmyLH/8cG9lV7eI8v0AgVQhAFMaUxHHxlS5Bd3fQIhRz2KqFeJobzhkIPDSUGZE
	vHYF4CcUHu/+DI9EKlpnd67Ps0eWyUJkLwvuaurwFmBaY3hF5EXksHLwkSRcLM7s7GIH1ahLs2s
	RwZ96BYros08X87cEGuPU5jCHso8kjC+HU4hdL6ve4GUOmtwark0wyf6lrijBFhWTTc=
X-Received: by 2002:a05:6820:4dcc:b0:67e:251a:bd3e with SMTP id
 006d021491bc7-69d7eb50ef8mr12523541eaf.18.1779882855023; Wed, 27 May 2026
 04:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-11-paulk@sys-base.io>
 <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com> <ahakVq7Fv78ODicG@shepard>
In-Reply-To: <ahakVq7Fv78ODicG@shepard>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 27 May 2026 15:23:44 +0330
X-Gm-Features: AVHnY4IBJ2USZh9zewtK1mpREASscLC7umJs8sYSO8dfl7Vqb2mCAkjyaVX__p0
Message-ID: <CAMxPZkjQGFxGeafUhCSn82PnWeRpW3YQ-5ZTZUwE1psTq2hJiw@mail.gmail.com>
Subject: Re: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric format enumeration
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, May 27, 2026 at 11:29=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Arash,
>
> On Wed 27 May 26, 09:20, arash golgol wrote:
> > On Mon, May 18, 2026 at 2:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-ba=
se.io> wrote:
> > >
> > > Use the dedicated helper to check possible pixelformats against the
> > > provided mbus code in order to support MC-centric format enumeration.
> > >
> > > Note that multiple pixelformats may be returned for a given mbus code=
.
> > >
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > ---
> > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++=
--
> > >  1 file changed, 34 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture=
.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > index a836fa7f081a..409c28621093 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > @@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct fi=
le *file, void *priv,
> > >  static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
> > >                                       struct v4l2_fmtdesc *fmtdesc)
> > >  {
> > > +       const struct sun6i_csi_capture_format *capture_format;
> > > +       const struct sun6i_csi_bridge_format *bridge_format;
> > > +       u32 mbus_code =3D fmtdesc->mbus_code;
> > >         u32 index =3D fmtdesc->index;
> > > +       unsigned int index_valid =3D 0;
> > > +       unsigned int i;
> > > +
> > > +       /* Video-node-centric enumeration. */
> > > +       if (!mbus_code) {
> > > +               if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > > +                       return -EINVAL;
> > > +
> > > +               fmtdesc->pixelformat =3D
> > > +                       sun6i_csi_capture_formats[index].pixelformat;
> > > +               return 0;
> > > +       }
> > >
> > > -       if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > > +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> > > +       if (!bridge_format)
> > >                 return -EINVAL;
> > >
> > > -       fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pix=
elformat;
> > > +       for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++)=
 {
> > > +               capture_format =3D &sun6i_csi_capture_formats[i];
> > >
> > > -       return 0;
> > > +               if (!sun6i_csi_capture_format_check(capture_format,
> > > +                                                   bridge_format))
> > > +                       continue;
> > > +
> > > +               if (index_valid =3D=3D index) {
> > > +                       fmtdesc->pixelformat =3D capture_format->pixe=
lformat;
> > > +                       return 0;
> > > +               }
> > > +
> > > +               index_valid++;
> > > +       }
> > > +
> > > +       return -EINVAL;
> > >  }
> > >
> > >  static int sun6i_csi_capture_enum_framesize(struct file *file, void =
*fh,
> > > @@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_de=
vice *csi_dev)
> > >
> > >         strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
> > >                 sizeof(video_dev->name));
> > > -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_=
STREAMING;
> > > +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_=
STREAMING |
> > > +                                V4L2_CAP_IO_MC;
> > >         video_dev->vfl_dir =3D VFL_DIR_RX;
> > >         video_dev->release =3D video_device_release_empty;
> > >         video_dev->fops =3D &sun6i_csi_capture_fops;
> > > --
> > > 2.54.0
> > >
> >
> > Tested on a LicheePi Zero Dock (V3s) with the following pipeline:
> >
> > ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture
> >
> > I verified that mbus-code-based format enumeration works correctly
> > from userspace and that the reported capture formats change according
> > to the selected media bus format.
> >
> > I could also successfully start streaming with several of the
> > enumerated capture formats (e.g. YUYV and BA81)
>
> Excellent, thank-you very much for testing this!
>

Happy to help.

> > However, I could not fully validate actual format conversion behavior
> > (e.g. MEDIA_BUS_FMT_YUYV8_2X8 to NV12) because my OV7670 setup
> > currently has non-functional test patterns except for 'shifting-1'
> > mode.
>
> That's fine. I don't think I have tested it recently either.
>
> > Tested-by: Arash Golgol <arash.golgol@gmail.com>
> >
> > PS:
> >
> > While testing this patch I also noticed that
> > VIDIOC_SUBDEV_ENUM_MBUS_CODE reports duplicate entries for:
> >  - MEDIA_BUS_FMT_UYVY8_2X8
> >  - MEDIA_BUS_FMT_UYVY8_1X16
> > on sun6i-csi-bridge.
>
> I just had a look and you are definitely right, the entries are clearly
> duplicates and at the same time all the relevant formats are included, so=
 they
> are not taking the place of another format that was forgotten.
>
> You're welcome to submit a patch to remove these entries if you'd like,
> or I could do it otherwise.
>

Thanks, I'll send a small patch to remove the duplicate mbus format entries=
.

> By the way would you be interested in testing the H.264 encoder support f=
or
> V3/V3s once I send a first version for it? I had written initial support =
for
> it a while ago (did not send it to the list) and now that my work on the =
V4L2
> stateless uAPI has reached a point of usability I will probably try to up=
date
> my rework of the cedrus driver to use it.
>

Yes, I would definitely be interested in testing the H.264 encoder
support on V3s once you post it. I previously did some experiments
with Cedrus on V3s (bootlin, cedrus/h264-encoding branch).

Looking forward to it!

--=20
Regards,
Arash Golgol
