Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433913290DC
	for <linux-sunxi@lists.linux.dev>; Thu, 28 May 2026 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953751; cv=pass; b=t9jyFJXZ8YMsgvUglVCTIexdqSttgcGCFzNZJDb/JyBXyinAL4g71403//2OUM9O+lADMQ0kfQ/WWsyLCbCCuHYJ8QKb+SrQnW4nm5JWVDhnDTQmCGZhY17ojmDux8J6tHep/edFUUOk3OYnTZvsX9gWaKvEym+qR0bm9+0PQ1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953751; c=relaxed/simple;
	bh=8Nvv30A+3WElDIyVWIGJ6U51jBycEW5osp0TGNnbCqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hv03vpjrC+ZTCoh1mpmKudPg8TTcQiFycFHu0YX0fU6JnagsqBspzeaY8OU9ECyKFdjZfbGpypsFljkny7JrRF6Cs7U+lcdxk7fvMMsZcQ4U/cFnics1O150IzAGwZnjH/LhIF7suCuznzf6nem5ENLh1HNDkL+Zw8yNQpmAt+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TihDamj8; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TihDamj8"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e613b4f268so3570033a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 28 May 2026 00:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779953748; cv=none;
        d=google.com; s=arc-20240605;
        b=LdWOBMx3vY8DC0E5G57wGdoDyTeUGQFFUPxRw9/QODXj+PsY9iEPGygDRAc4vjlwXD
         x4WXEjA8OCUbQePEml9/W0iQLskR0BYm++acwDHEByK7rJ8OcM/AThpY+sQogi65xUqK
         Nt99UIwjwUcz3Nw1aP4E5Eg0/52CxpdQ6oQW8ZinJO3+8NkwSE2gVx83muAc+7ovJq+U
         vkdFbeo+M+UO2XooemSAfZTQbbA9wva92JJCijyqch/HV67zVVv6Z8JfnPAZ+gUIlTTE
         UMdraXdv1Tn++C7LoaH6qjfjraI/QD81cgyK6xBVw/75mJW4LUwZ5wGjz/1L2Doagajm
         JzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        fh=VC2gRw0I0tlrb+rcNVdvzSvZRElNlHcTuv4nt3Q0oDQ=;
        b=X2EDzKTYXuGuW8ax0B33OCp7xJGO0+kT7gJlRrSiRooh/w8Ha/A8PPoYTupP3i1Qjh
         8EjpVTR3LNCmVZj4GJdHLOioYvNCbRxby/Uqm3uAutL0dYL/8jlMbWXkTdjAqZWdjPeF
         Xc1j4ifszN1hdOKe+uw1VuIQxvclUzqTnbRx4ryV46fmWqh/kuK9jo4NYzqPGr10Ar5T
         lhV9Gev1zqcYWHWdoNl3ywbXQPyi3sPpjKxuKrNvuFCdXVS2U5YTQ/1PQmKy54wgI427
         vQu1CvpHGI3B6aO2PidwwmgzP8z4HiiP0wImrMGhGEqdAMc0PT/jWojcg9KS0voGQFFj
         e6sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779953748; x=1780558548; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        b=TihDamj8O5bng0V+D2K3gwCq1s2nh2YmGut3tqt0Bqi3RlT/SDszgMKpSbWspOXIOH
         kEsI4SW9N6SkhzwzfLmqynm2ZELZkPAPz+RN6YtCIzTMfkXB/KqoMLCKyaxAc1uZo6nT
         z/tUuse0FgQsvOkHf3h33zjZGzsuFu+QmWyzl1oSLE35s7vptH4AR74jrQbchHiWfJHN
         TR+plRjO2jjY8jIIYX9R6iTKpjmXUQTMzoP4gwNYwNep5tgBdpEuPWk8kXKuItUQe84h
         8Lds0TiVjzX9jOd/fLM2Uk8P/bmaQFQMpirBnMyYjBpM54hQYExvUmf4Pen56VdL5lCi
         VT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953748; x=1780558548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        b=UExSpPZGG1c7wiffsWqbHor5DrH3x+8yYQ2V0LRpPv1Vq1akerDrosCOqsJD9cAkOY
         7sYa2aW5Sazq0qFZMRnd+lSYIjDQ5WuQAr4pIO8sP58B6EkKVpLW2SQ4UvwJa67jsoom
         PRk4o7oAwEuywK8pWsBRf9Zb/Nc2XieyKL4C6gSyA3Y15PhVFsMt/fwVAeS7PE8tS0zk
         LRxIiCzC73PVPY5RcqSQct+uynKWWOy6hk0Ikwm/wCivBUXFZJTnM3g2gyHGpYba6u5K
         w6rKuEEHXp3rzJJMzjZGPuJ2zkgymocO/Wn9hwoJq0l1W2YWfIPXzSZAn3xlj69PKaVM
         ZXvg==
X-Forwarded-Encrypted: i=1; AFNElJ9FjhVfpApXCeTkM//JV7AQGzOSrjF6NnYVaVyKgBO0AzbyXl79hQDk3kwYscBHK0jL2FwhP60ZKx0uGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYft6XnlRSHcfNkljtNPRwu9EkqOcQs4NyuWm3z1A26sVC4JJa
	WJw4UQj6k6ctUkJhVvBGMwFIw6ugfMe46zFvnxnd5QKoAj3yHpR9RfnO8EilNDgByyRbaTx2k2Z
	tvBz+WZpL90dNr55cwQSYxR1iY3keCoU=
X-Gm-Gg: Acq92OHyxa5aZFJjSzBafyBKLgeo3nCMz9qOEc/8tTgE/tzdnLuMIBnW0S1tAXhktDg
	XNCYRhmBQnhZMTiNpHim+DIzf3ROaO1Lm1gvHKl7vY4UZEeoeYCWDH0ZWRywFuip37Apr6GUcSL
	lPsEZtdbpfQdqpaRnyEW8IiiIOrwi7CN869EE/M0eJLKdkZRrv/vQn2b75UnAu73+HgxkXuEOGO
	PKbPSRAOiydhbk1yO4U50Mw8uujnSFQdmmDX5VSgR5JnnWUu9rK9zbSjQIcsti7hzfHOsoZzS9f
	VPbx6J6/ZdYOKc7jbue8XbcPBX/pI6ehmXE4DaigMnuQBAnX0BVkvh0W5/9TdRT80ZyoC7OnRqj
	m2Hj/
X-Received: by 2002:a05:6820:1f12:b0:696:72e9:f92e with SMTP id
 006d021491bc7-69dfa6b3709mr148717eaf.10.1779953748060; Thu, 28 May 2026
 00:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-16-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-16-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 28 May 2026 11:05:17 +0330
X-Gm-Features: AVHnY4IhmJJCXbj-tzl_ytWMhmyKPHjpmYamO2huuqsWLPnQ9-WnNbsuHTjiYbE
Message-ID: <CAMxPZkjhxJQ3ST6HrcwudkMzqwtvtVizng-PkiZd=xU4rrSxeA@mail.gmail.com>
Subject: Re: [PATCH 15/16] media: sun6i-isp: Add support for MC-centric format enumeration
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

On Mon, May 18, 2026 at 2:02=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Just make sure the provided mbus code is supported and carry on with the
> existing implementation since the pixelformat is independent from the
> mbus code.
>
> The params video node only supports a single format and does not care
> about the mbus format, but we can still report MC-centric support.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 9 ++++++++-
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c | 3 ++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 24e731bcabe9..372b9331bd6d 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -436,8 +436,14 @@ static int sun6i_isp_capture_querycap(struct file *f=
ile, void *priv,
>  static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
>                                       struct v4l2_fmtdesc *fmtdesc)
>  {
> +       u32 mbus_code =3D fmtdesc->mbus_code;
>         u32 index =3D fmtdesc->index;
>
> +       if (mbus_code && !sun6i_isp_proc_format_find(mbus_code))
> +               return -EINVAL;
> +
> +       /* Capture format is independent from proc format. */
> +
>         if (index >=3D ARRAY_SIZE(sun6i_isp_capture_formats))
>                 return -EINVAL;
>
> @@ -697,7 +703,8 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *=
isp_dev)
>
>         strscpy(video_dev->name, SUN6I_ISP_CAPTURE_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING;
> +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_RX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_isp_capture_fops;
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 0cc48e2bc8c6..2622e5a07817 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -531,7 +531,8 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *i=
sp_dev)
>
>         strscpy(video_dev->name, SUN6I_ISP_PARAMS_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAM=
ING;
> +       video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAM=
ING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_TX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_isp_params_fops;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified MC-centric format enumeration on the ISP capture node with
multiple mbus codes supported by sun6i-isp-proc.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol
