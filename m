Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973DE14C5A4
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719068628; cv=none; b=elTtnHLQq7ZlaXZeZPCVJTEoU7Im1mbZcvDAGAWIpD3y4tIiS8f798acXyqktiGWiqyETbIWmA5q6c1cA4owZlmgvwoVWDw2sd8WHCDVuFnEsi/XhWruk06tkxzsDZRIqA/dyWvPYgKgfcUummQLow9e9F7LZo93UbjUhtbLTDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719068628; c=relaxed/simple;
	bh=cjKMZmz1+T3iNBF6JIejoovikIM6tTkLPyR5PvQ3o/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/nnqhhvoKp+3/hPtf2IO8gJAcdMzlFW0JDdSfnHmJpjJBwcwQRXa5+vDLZWroVkadnA0xAWihXxjd1vB+fb1VrHnl3fLyrSrsNazno+wxcaZ6Z389BEDXR/NDnvv94FYoFl+BhRvRKTZshUPO9WohUjZBWC7kdmTsIJrNFV4b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so380572e87.2
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 08:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719068623; x=1719673423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNuj2fx5FjpZLP3qt6F+gtN+RXIt6q+vnIfAmNUtpEE=;
        b=PNjulbbIstHm+SxKjm5ySOJvHyMnJdsh+sOYkH/q25wcqzd+YMLuR1Yl53di5IqiyL
         7ZrbxKRFv891GMqRz++EHtCrlenQ0ySq5cweq5/x/PvzXp91DSdn6+scegy7EOawZjvF
         NQAvmDgnOLGgYdhTHnu2c0R3DDkC68vIogRAICsvsQl8Rm1Hvrg4R6HTzjdJpr5MVS9I
         02raaJ4vgjC+4CFXKQODZbNAOgYbhbALj1h96dDBxHBNQ+MV9kR1xo9AUuZBkgZSMC1m
         5pVrSzjpzENpRfOXRs25sRfsl1hrE/GblnOQF7n3ZacwUM/wT5xzqNyk8bWDxwPAFa0y
         HolQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdIb0rw/ach+IICRMRqfXntMR614fUqo9gkJBbilbW2dM+Rea9iPjKRuCiCmnhJLRguPQCujGbyzvSv5lHh4XptNfFbpNEe6z3rG8=
X-Gm-Message-State: AOJu0YwjO0pP77iq+YLZ5VC5PiV6UutNDOhINGWI55aAq38c1aA1wxpp
	e+iWJC7LaoxAGf5+Buf9G6cqPO1FdvBkOqsHODSTF9d/s5n/ng/9ZNWEJQqr
X-Google-Smtp-Source: AGHT+IFYg/V7ck5Zle75k7fYZttPmYoxJcYMiZ705WjlN5UH2eT54LFdDZLEhSOB92/fahhyCTeU3g==
X-Received: by 2002:ac2:597b:0:b0:52c:b329:f7eb with SMTP id 2adb3069b0e04-52ce063d6b0mr366388e87.12.1719068622793;
        Sat, 22 Jun 2024 08:03:42 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b4790sm508192e87.30.2024.06.22.08.03.41
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 08:03:42 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso31831191fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 08:03:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+CxkuJFD36Ns8tCLq4oEaDr0uaU+tnEn10wwpHHI8ty29mWNYnkIyadR+AwNyxC8RMwTWvRDJsiM2icNSBlZLjmwGcTZRciRxb1k=
X-Received: by 2002:a2e:7d11:0:b0:2ec:f68:51e0 with SMTP id
 38308e7fff4ca-2ec59526da8mr3595311fa.44.1719068621641; Sat, 22 Jun 2024
 08:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com> <20240619012356.22685-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20240619012356.22685-3-laurent.pinchart+renesas@ideasonboard.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 22 Jun 2024 23:03:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v66TeWWE+F9KXG+8_9e7rDcq2zjm6ugFiUT_bYVOTM6P-A@mail.gmail.com>
Message-ID: <CAGb2v66TeWWE+F9KXG+8_9e7rDcq2zjm6ugFiUT_bYVOTM6P-A@mail.gmail.com>
Subject: Re: [PATCH 2/8] media: sun4i_csi: Implement link validate for
 sun4i_csi subdev
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Eugen Hristev <eugen.hristev@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 9:24=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The sun4i_csi driver doesn't implement link validation for the subdev it
> registers, leaving the link between the subdev and its source
> unvalidated. Fix it, using the v4l2_subdev_link_validate() helper.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index 097a3a08ef7d..dbb26c7b2f8d 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -39,6 +39,10 @@ static const struct media_entity_operations sun4i_csi_=
video_entity_ops =3D {
>         .link_validate =3D v4l2_subdev_link_validate,
>  };
>
> +static const struct media_entity_operations sun4i_csi_subdev_entity_ops =
=3D {
> +       .link_validate =3D v4l2_subdev_link_validate,
> +};
> +
>  static int sun4i_csi_notify_bound(struct v4l2_async_notifier *notifier,
>                                   struct v4l2_subdev *subdev,
>                                   struct v4l2_async_connection *asd)
> @@ -214,6 +218,7 @@ static int sun4i_csi_probe(struct platform_device *pd=
ev)
>         subdev->internal_ops =3D &sun4i_csi_subdev_internal_ops;
>         subdev->flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS=
_EVENTS;
>         subdev->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +       subdev->entity.ops =3D &sun4i_csi_subdev_entity_ops;
>         subdev->owner =3D THIS_MODULE;
>         snprintf(subdev->name, sizeof(subdev->name), "sun4i-csi-0");
>         v4l2_set_subdevdata(subdev, csi);
> --
> Regards,
>
> Laurent Pinchart
>
>
