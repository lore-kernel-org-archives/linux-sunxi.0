Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBCF301010
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Feb 2026 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770185748; cv=pass; b=rwjk9cYF7KMHQi9FkCvGlmNzpSAljAhbETPLJbigWV2bicIdSOfUh/RmGLd2Q63jXuRnIIQZNaRuND1qvPAaV9vlQpKhbmTc0XGglI3ynytejm+WmZ+yi554B4AqNUuGlJ9YphVuG/mhirc0HQM3C85W86WZ5Ud3hlrmCCgenf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770185748; c=relaxed/simple;
	bh=O8Bgm+PU8NEwTnn56VFmltoyrQYXuuS4HnAhQ5pG5rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJ+2D3pMliswmQdrGC9C/ZukwFtSVBOQSFtAJdJPN8i/8yC8VQZmcllo+fDhQqIlQes/92rTdKkGukSMZ/I51KApx79ACMF5PcGehICBfTe0z/MFieakmx3r0EMmkrD53PFdUhbRKd8tB525EWskuZdQ4QyEZxaFjtgx4qTvTD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dprd/NKc; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dprd/NKc"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35338b3dd31so3001130a91.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Feb 2026 22:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770185747; cv=none;
        d=google.com; s=arc-20240605;
        b=gAob+vnjVQN3iJlhI4wcN/Izyq+uSHZDbIKZuyiNfYEmROaQtKW/4RWdrkf4hdPH7k
         7R8v+1OJquksMJeYKrlBx11Pc8fj0WErQtwn2fao+88l7npiiHw/da/qpdQs323ktLQV
         nu9SWcTfl6Fm8lydybT2ykcerPGJ9w1qdrus0//s7Op/8w/j+ZfvZnWJgQwPgmmifjn1
         G/qmvsSWueBhNv3OYeXjQQNZy65mFWNWt8bQoC/WxI4yiyVd+LKUkZ36UslamZj9GvPw
         lPIrtD6ZqznUkfJpTNVK6Qoz42jspH6+L3dbEZ3bgPr3bOnYifYWB/1DGsdfofHDa/ux
         Gv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H1Ulw7MvS/Ox4lmHUrtosohiucmr3Rh2tszw/cgBa80=;
        fh=1dVzm8OBMq2TRNJkRbGr4uvt1JN2LnajGGC3DnbOQQU=;
        b=gShm64TgAG+Y75NsvK/QA6A14o571XWGuTfvhgLup2FQw4EsV+69V7VT9CDO+DPScn
         vev3AIfPS3kcUExYRhLZtL6PYBOiCYjfwfvPU2Xs6DvlWQaVhMjbXZ7aW6sH0g1wR2h1
         b8xQ5ewJdjzkEJgAY3sJKwdHPoD7oZj/QMZQsbtpUdMj0LIt9c+/Cz8mec6UEulSilLO
         l/rcc/TVLF6oRwVBwv+SzdDAWTOI/VKxqmJIEW7Spz5+A6ti4EgiXFtOcs+PSWMLMBkY
         m/q1Tq7whLc5tFETEFbzTlhfUlHx1OMZqiXojoB/8g8tRAkAEbze2EY6xtPsvufjA/yP
         minA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770185747; x=1770790547; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1Ulw7MvS/Ox4lmHUrtosohiucmr3Rh2tszw/cgBa80=;
        b=Dprd/NKcSKDVcCKfv6u7Z7P0IbopdPYl1k1C9l6/tzWwTk0Ms6QA1uWRdY8FD9XB4W
         Y9wRqUKklRh0zXfmzVlY3hrv2gVyZhAnmtC9/a9BMzl9A4RxwOGhLaDDLKAiPCL6npc0
         WoPZyKsl9EQD1+5tHo/AdhPp+Uy2FEG3z9eK1LkFKDC16QUZzdzv4Dshwz0swhSuWuME
         pxAIK1L7aNF+Hz4fvCSmPY9kFU8CNMH2eOels3caokD42onGFcg9ww/QfjE5pfxuuSSL
         10q4qSfiHl4VT3cloYCQBtUsnOK6pw/JFjYruiRCYjmhQ1a+gdE52pWqksSCw8vN1qeO
         i4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770185747; x=1770790547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H1Ulw7MvS/Ox4lmHUrtosohiucmr3Rh2tszw/cgBa80=;
        b=vbeJ/H5mDDDnCMs49F7OTAd3gQ9bI4tT20Aj8vLG/koMiuc7OwwU2B5EfPSIw6P3qz
         Qw348IWs187EOkeRCdWTdTqO5PufId/4O27RZt9EkmRg2sDpPRwR+yAfsdJyFppYuPuK
         zqUFw6DowslxKGhzAgHxZGXVcNNgBHT1yKmUdHRad0rDeYje27owNBxI1Ny9yaFb2OhZ
         lDlFUZOV3aaDiYBiTEzmoqHT/xkocJdsm/pgF/xCcWfn7iUPyHhfufW5zJxPdYOaKggV
         MECAo4c1Lm7t65bKJ8rBjtaXofYAZktHWlZSQvaxip2fpYM3JBTqUZkgAuWxSL2pxyTd
         wV1g==
X-Forwarded-Encrypted: i=1; AJvYcCX0LZ0Z0o37ywLB6VRxLqeW7YnRrG3uXVT5T7FvIiu5MPtLHuK0HuHjr7i5n7q4uJPpJuMxhCB/aBoRRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNMBukZKP1mpTId1lDtKi+n9ENw1T8czi2lqZ0EILWNtFIrt9w
	MqfSQDn3sAbD3LVyKrGLkJharabSasmift4Lz3RkDENtm5kYMJmNBvP22XC892a9LkvJ2Eu1aZH
	0FRUvztgfWqJ7XNJ9Ha+LWg+PulfkyCya7cdb/6guaE2h65Y=
X-Gm-Gg: AZuq6aLz2zcxVxoRQpMvCn5PeFiXeORFxHVhh4/aLK1ypFzUNycT5QbgHhMN9U6G7x6
	1+Ya9N6Tq7K4FlLt6Km3NbQBdtGkiU6beIePpELZ8pVZvyKu1i9pSCbOEQ/YoNPzSGQHptPz7NY
	Z4sVYSRAqwkvXttyRhrIMxXPUI9LY2LUIOzI91gXrzn1DYrntNsnkCbeKqAf5IiAI69l1kwn7Am
	jYzYa5dsK4dUz4mb2vEIfqdeEkXPPuUvZ9Q4oLvySeASjMlMDgRS6mEReJW/zjZrpo33JRXB7X1
	3J4AngDtRO1tU81gd4vX3cokaLKXvZMQ5qEMUYt0uT5x+V9JWcuPzcY=
X-Received: by 2002:a17:90b:510d:b0:33f:eca0:47c6 with SMTP id
 98e67ed59e1d1-35487207d93mr1644811a91.30.1770185747171; Tue, 03 Feb 2026
 22:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126102149.39563-1-arash.golgol@gmail.com> <20260204000228.GA154910@killaraus>
In-Reply-To: <20260204000228.GA154910@killaraus>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 4 Feb 2026 09:45:34 +0330
X-Gm-Features: AZwV_QiOLyyyqZYi36b9zwJo_kRswaAExFQWcQM5OlLMLY28cazkE4nljSwiVI8
Message-ID: <CAMxPZkgXjusgapPSUvJCaCuMrR5xPsKiooJ+ZczzsF7x-pSH-Q@mail.gmail.com>
Subject: Re: [PATCH] media: sun6i-mipi-csi2: Propagate format to source pad in
 TRY mode
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thanks for the review and the detailed feedback.

On Wed, Feb 4, 2026 at 3:32=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Arash,
>
> Thank you for the patch.
>
> On Mon, Jan 26, 2026 at 01:51:49PM +0330, Arash Golgol wrote:
> > sun6i-mipi-csi2 does not support any format conversion. So the format
> > on sink and source pad must always match. This limitation is handled fo=
r
> > ACTIVE state via mbus_format member of bridge private structure.
>
> It's not even handled correctly though, the sun6i_mipi_csi2_set_fmt()
> function will accept setting the ACTIVE format on the source pad, when
> it shouldn't. You also fix this in your patch. This should be explained
> in the commit message.
>

Yes, you're right.

> > To enforce this limitation in TRY state, user space should only be able
> > to set format on sink pad. The sink format must be propagated to source
> > pad to ensure consistent behavior.
> >
> > This also aligns the driver with userspace relying on media controller
> > based format negotiation.
> >
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > ---
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_cs=
i2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > index b06cb73015cd..6ee0f6685663 100644
> > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > @@ -369,15 +369,26 @@ static int sun6i_mipi_csi2_set_fmt(struct v4l2_su=
bdev *subdev,
> >       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> >       struct mutex *lock =3D &csi2_dev->bridge.lock;
> >
> > +     /* The format on the source pad always matches the sink pad. */
> > +     if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> > +             return v4l2_subdev_get_fmt(subdev, state, format);
> > +
> >       mutex_lock(lock);
> >
> >       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> >
> > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -             *v4l2_subdev_state_get_format(state, format->pad) =3D
> > -                     *mbus_format;
> > -     else
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +             struct v4l2_mbus_framefmt *fmt;
> > +
> > +             fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > +             *fmt =3D *mbus_format;
> > +
> > +             /* Propagate the format to the source pad. */
> > +             fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CS=
I2_PAD_SOURCE);
> > +             *fmt =3D *mbus_format;
> > +     } else {
> >               csi2_dev->bridge.mbus_format =3D *mbus_format;
> > +     }
>
> If you have a bit more time, could I ask you to take it one step further
> and convert the driver to framework-managed V4L2 subdev active ? This
> will simplify the implementation by dropping bridge.mbus_format.
>

Sure, I'll do that and submit a new patch converting the driver
to framework-managed V4L2 subdev.

> You can find an example of the conversion in commit a2514b9a634a
> ("media: i2c: imx290: Use V4L2 subdev active state"). In a nutshell, you
> need to
>
> - Call v4l2_subdev_init_finalize() at probe time and
>   v4l2_subdev_cleanup() at remove time
> - Drop the mutex (locking is now handled by the framework)
> - Use v4l2_subdev_get_fmt() as the .get_fmt() handler
> - Drop bridge.mbus_format and always use v4l2_subdev_get_pad_format() on
>   the state passed to the subdev functions (which will be the ACTIVE or
>   TRY state depending on the .which argument passed by userspace)
> - In .s_stream(), access the state with
>   v4l2_subdev_lock_and_get_active_state() as it's the only subdev
>   operation that doesn't get the state as a parameter
>
> You can ignore the control handler changes in commit a2514b9a634a, and
> you can leave subdev.state_lock NULL (the framework will then use an
> internal lock).
>

Thanks a lot for the example and roadmap of the changes.

> >
> >       mutex_unlock(lock);
> >
>
> --
> Regards,
>
> Laurent Pinchart

--
Regards,

Arash Golgol
