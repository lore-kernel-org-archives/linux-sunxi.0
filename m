Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0CA346795
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Feb 2026 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548032; cv=pass; b=Glqe/yQN44VxpT9HteykHZY0g9b3M5Zof635NtrPSJ/cWID4kxUEG8Gf+e1TTgmbU6cbG12SvZ279qE+ZwRTzwFBKJqkgmhcoGP68ARkl6fWuLJNekSYY0yUmCO3vbQkMudIbo+9dhzDZh5Tj28XQTNvpWT4R6nbrENNI1c8oiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548032; c=relaxed/simple;
	bh=yQ86aM7WJA3vbQSAqqOczu6BnsXgtTk2c9IIjhQc714=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkWa1T5uy6CKWt4aC4feFB2PtIwnBpWFBozI52Xw2rbv1GRjCiuadcW1rqlbhc65gFMHIHAEtvg4/Bha+dyxgvMdo980yxiqASe8jdxfJLI3hJozNogwhuyHVwETESwcRqphYnfF+Uwzrlx0tMB0/Z1W+A4ftVn1HMqP+ynV5nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQeuR/HC; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQeuR/HC"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c6dd0ec465aso809055a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Feb 2026 02:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770548032; cv=none;
        d=google.com; s=arc-20240605;
        b=LB7NbkGa5yyiKBvf22mInMNSvCnPaSlvfymr1oUMpPMD9ybfdQA6iaHnHpFLyoJs6J
         yof9ppZeUzQHL8y0UEdInkBV/GLv55GAiNeUnNaNpii/tfJX0i5l0dudfWMeuute8rDC
         UWRQkOYGilBsjskotCMTlfmiKaaZuUk4Mn2d8R2j1fFFeJJ4EkAFDauuGr5TsrXFWXpo
         nlPZAasiPpxWK5U05hPG4OsRn6LLMkoeFvvCmrBnx9sHimxk6bM2oRBUX02jlb2185lQ
         dF+dYMMus5sU/i6P2lwKq886i1HzVRJYcNerSd1FvUR+WJPvMAjP6qXEUFX9/p7fgwo3
         rIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lbWREekEUKc0o+juWWQnSpNNBw/5g/h3GGPxh8XmVPU=;
        fh=75f88wWBfyX4TvP2rTbT9nnlltugw0rQhjzJypjNVg0=;
        b=djDqaPebqJt2mP/0PwxAL0A278mQdKCJQc0NQljL8aGeT6Hku187Y/I5++hmntpamI
         /IgXbaiKxvIj005dbbTPGmAEDUev9N1RWl37k9jQZhMg3zpWjssUupfvpS4FYQtRonsM
         X+8x7rFiDoiNEZZXXkjztXXxGSRN3CBINmSa95424ogyVudy/hZ8AOJFie9VzWy5eCLR
         F+kwRSjRofqmP/KImeCaG8Bm7hUof24RoQs0AbyVzEGO11ARbNJxGwusPJTBAH+xSWdY
         XUmSIKM7pU9dOAupDVY5MRWsa3DZC4JcqV3IDvGVOs5UztFTuSs4CZjIh/TRAVWt+ex0
         mbrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770548032; x=1771152832; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbWREekEUKc0o+juWWQnSpNNBw/5g/h3GGPxh8XmVPU=;
        b=VQeuR/HCU5nYnHUOqtIUBdOFVLasfyH9oQVDqD1zTE0SMPkScn4KLYtDM0kXovTDcE
         Iv907U1ir1/G+aMmqFXBHhBksgaB87HwCacv/aDD+XmCWMUXYJG/dY6wLhxlVVk8jXBl
         hW1ski+tGjwX1MCMXkniww9KYPg6FK5v7D44SzNy4CbCkBMcoR/S2ouHzzs5064y6fzg
         jWYzxmZIEdHez1YgZRWRnxtjiZgxgwGAHY0m7Z36/Mbly5ARpaQNBRCwPEQo8SCjCjtj
         LmYppr5Zm2ShrJvgYwsjyaJZFXtqDEekKEJCEhDG4ANW902tFZK4PYeYsYU+ZRqRhoUu
         isRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770548032; x=1771152832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lbWREekEUKc0o+juWWQnSpNNBw/5g/h3GGPxh8XmVPU=;
        b=qv/XMdvdvck0LLhFqmVU4Tzbp5v/4LVtunDBK0Ve9zGZTAwDJLa6CQwjoWLGYHIwID
         bCkCcG2aoA3YWoumuEVy7Op0lRgrvrnQXrh2nK3gyCjmfsicQzRj7zmRS3Mynw2FkU0W
         yL6saICu8xHvcEC1DvXxB1bwa9/QNsF4ICnzWUdbo0TAv5gOGx903ZSe3GemEzk+XnFh
         shR5OACi67Z3M2pYjvjodTSZfPq6jMhezy8MRCKOfKjGLJA14/3vWNjfwg11w/n1dM/D
         cbK0Ns5Nyd11VPF3R7jKZiaqTvVKbSR11sLlN7H7eCUc2/YA8/LcW8MyI/3SpD2YtnTh
         rmlA==
X-Forwarded-Encrypted: i=1; AJvYcCVP6C/p/FkN5mZCvs79whONffg7zq3rgZUnzIiV9KdiVQzTgPaj+UnzwaM2M1dWmFy0S0wQSnjCKbRpjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxeGWDB+9Aqp3FmXaxw7qti3v2Z3o0KjkEaWWvEUFADincAvwr
	qxRCjg81OKPwwfvgimXOO2WXtBfktUQr1t3P98DyQNeP26horbnKkeNFbZchOjLackFKWphz7wc
	GWCVq/rnMOUZnjx9FbsAjtxq2mAgxics=
X-Gm-Gg: AZuq6aKBUJZAsQuRQk/2FmbVHtrPSxn4p9SCbI+O7pkIvW3MYYKx5JcwratnL1al4NV
	lmalNyaew0mRYWuja2dc7a0ql1BxOmDnfGK8rG2ca4DpvGdvmStc9LrXwQvPHL+xXZfnxwy2dbO
	rpuVlCsG4fjkQAyQaV0HGSov4PRi5wxo2w3BAR+5Q7ZArhv1iKi8ZvJY/XNOkShMomnRVnuC37z
	hUmCljrhK1C0HujM8mT4uVNvCa5a+v9eXE9Jgzr2VWkzYw8WEpbBfxrqCYozYWTNPJR1iviNxdJ
	JUFzuzpbHOKmCbSkoT47CmrJHeWf0v7db/XzGz0xPhFEapEJzeX8BdBkmXoLhsKO7YA=
X-Received: by 2002:a17:902:c947:b0:2aa:e1f0:5481 with SMTP id
 d9443c01a7336-2aae1f05702mr13710315ad.30.1770548031656; Sun, 08 Feb 2026
 02:53:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260206123455.46476-1-arash.golgol@gmail.com> <20260207214932.GO1376807@killaraus.ideasonboard.com>
In-Reply-To: <20260207214932.GO1376807@killaraus.ideasonboard.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Sun, 8 Feb 2026 14:23:39 +0330
X-Gm-Features: AZwV_QjOXIuvXJxVHuDmHTEQ39FsIEmBbsDjbPj4qPnQrH9Gdvq_EZxZoaCiQvg
Message-ID: <CAMxPZkid_QP2Q0wk9wBJi3RnfzbZ38CRso+BkT+srQTYwEmfOw@mail.gmail.com>
Subject: Re: [PATCH] media: sun6i-mipi-csi2: Use V4L2 subdev active state
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the careful review and the detailed comments.

On Sun, Feb 8, 2026 at 1:19=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Arash,
>
> Thank you for the patch.
>
> On Fri, Feb 06, 2026 at 04:04:55PM +0330, Arash Golgol wrote:
...
>
> You can drop the else and write
>
>         ret =3D v4l2_subdev_call(source_subdev, video, s_stream, 1);
>         if (ret && ret !=3D -ENOIOCTLCMD)
>                 goto disable;
>
>         ret =3D 0;
>         goto unlock;
>

Sure, I'll do this in v2.

>
> Error paths below should call v4l2_subdev_cleanup(), which should be ...
> ... introduced here:
>
> error_v4l2_subdev_cleanup:
>         v4l2_subdev_cleanup(subdev);

Yes, you're right about error handling.
I was checking the code for the proper place to jump to the
error_v4l2_subdev_cleanup label.
Consider this section of code, trying to set up the bridge upstream
source (in middle of
 sun6i_mipi_csi2_bridge_setup()).

        ret =3D sun6i_mipi_csi2_bridge_source_setup(csi2_dev);
        if (ret && ret !=3D -ENODEV)
                 goto error_v4l2_notifier_cleanup;

        (rest of the code)

        error_v4l2_notifier_cleanup:
                v4l2_async_nf_cleanup(notifier);

I was wondering whether jumping to error_v4l2_notifier_cleanup on failure o=
f
sun6i_mipi_csi2_bridge_source_setup() is meaningful, as in that case no
async connection has been added to the notifier yet.

So I guess failure of sun6i_mipi_csi2_bridge_source_setup() could be a
proper place to jump to
error_v4l2_subdev_cleanup label. In this model, failure to set up the
upstream source means
the bridge cannot function at all, so I unwind back to subdev_cleanup().

Something like this:

        ret =3D v4l2_subdev_init_finalize(subdev);
        if (ret < 0)
                goto error_media_entity_cleanup;

        /* V4L2 Async */

        v4l2_async_subdev_nf_init(notifier, subdev);
        notifier->ops =3D &sun6i_mipi_csi2_notifier_ops;

        ret =3D sun6i_mipi_csi2_bridge_source_setup(csi2_dev);
        if (ret && ret !=3D -ENODEV)
                goto error_v4l2_subdev_cleanup;

       (rest of the code ... )

        error_v4l2_subdev_cleanup:
                v4l2_subdev_cleanup(subdev);

        error_media_entity_cleanup:
                media_entity_cleanup(&subdev->entity);

Is my understanding correct?
If yes, should I add this change to v2 too?

> Those are only small issues, overall the patch is very nice. Thank you
> for taking the extra step to convert the driver to the V4L2 subdev
> active state. I expect we'll merge the next version once the comments
> are addressed.
>

Thank you for your kind words.
I've prepared v2 and addressed your comments, but I wanted to clarify
the correct error handling approach here before sending it.

>
> --
> Regards,
>
> Laurent Pinchart

--=20
Regards,

Arash Golgol
