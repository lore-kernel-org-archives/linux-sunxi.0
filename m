Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A356F066
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Oct 2024 04:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729573053; cv=none; b=oCZCIDBu8BJ+TzUfb7AG6sDaQ4CKCz986mHf3y+pUooUPe4mqsmCvAb6pvFnURYHVsJcjqfKwWEvX9kPXBwwD3PPeHABG+ruMdlbtPD3o37eVASRGLcFIET91xz0JbY2A3fh8q5EV8oVwmL7YNz543BKx5BAi1UqCb7oKz8Q8Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729573053; c=relaxed/simple;
	bh=5bT90VHYpTm313NrIpd4fKVtZ40irZW3FExZLtrjQQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ixxs+Snv88VPHcG3JB641KEEy7QMajk+LaMeeZT+YHHTBsvi0+br3cZ1v9sp0ORy+QJ6ea9hMmTSEqbjfb7GysNbA+cdLg8beQvOa9LvtyW+75P/VB8D+10pY8d3o+eDUjoXrwgUrU+AuMXVhPCdSeIDrN9vJGRmLdM73xeljcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e690479cso5454810e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Oct 2024 21:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729573047; x=1730177847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MtKhiSbi539gpYrHXAAkHxczz0yx9HoWEP1SfArti/I=;
        b=gHz6qw+xcYYFoR8C+BK7ukRtCydBeZwwIbF0nFRXRkKIal1Makt/VgO7kRt5dt9hFB
         dt3/P/u0BgonboDlcw25PmPz281qCXsZrgVVQbRfzJQtOYA+uFFtR4tfHgxsTX1QbAjk
         oW83k5e5k8RZhmIDGdw2PTDsS1yhjg+QlYfNoPTEMkHiM5xuM9ag2qRpx2HJ84If3OSl
         XzFysMj+ABrpySg2zqYIP7IVdND0yJ7Q0G/YrBv6PU80WMsMeA1P72pTaG7xlMdvik32
         3Y9myRXVgp5HypTxcy8QU4K40KYYvz61Tp6U2P+jfEhQEeZcFdPvkldecZRPmVeG0AG0
         oROw==
X-Forwarded-Encrypted: i=1; AJvYcCW4QuVVt7Ku/8ytVXsr/7a8dOWQz2Pf/Os5pixuyakHqIB+4AzmmEsaXzSYz3UJDkVv65bL5E4Qwgvdsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNWAesYaxv2bTOdM5+KxaKb9E/5Vx0jpNYf4u/iD7nv+18HyL8
	sN3vlRBDdrAHhrZEO9FUNSxgCtKjN4yHfGv8sg+HeHyjRQ0H8FsXV1QHo6xh
X-Google-Smtp-Source: AGHT+IEkutJrbi9Net+kTCW68bQFRMhiFif1Aa9MS2vN6PGEGZn9Or5YR4AhfQqlP/dZ53oi6zy29g==
X-Received: by 2002:a05:6512:691:b0:52c:9468:c991 with SMTP id 2adb3069b0e04-53a15459cefmr7086002e87.14.1729573047212;
        Mon, 21 Oct 2024 21:57:27 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223eff63sm652409e87.92.2024.10.21.21.57.25
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 21:57:26 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb3110b964so45334151fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Oct 2024 21:57:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUatw0Qsls34lV/Qae3mnMZ4VaUvxELGa0w4CG1m7e7tVHEOO57icJf+QKVuNfaAXLaJjPzvARtU8VdIg==@lists.linux.dev
X-Received: by 2002:a05:651c:551:b0:2fa:d4ef:f222 with SMTP id
 38308e7fff4ca-2fb8320b662mr54455541fa.38.1729573045773; Mon, 21 Oct 2024
 21:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com> <20241021-input_automate_of_node_put-v3-2-cc73f636e1bc@gmail.com>
In-Reply-To: <20241021-input_automate_of_node_put-v3-2-cc73f636e1bc@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 22 Oct 2024 12:57:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v66b60moJjOP9Fo6NRAC=WA3fTBd-EJ0JifTsgz2Kocq0A@mail.gmail.com>
Message-ID: <CAGb2v66b60moJjOP9Fo6NRAC=WA3fTBd-EJ0JifTsgz2Kocq0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Input: sparcspkr - use cleanup facility for device_node
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans de Goede <hdegoede@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 4:28=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Use the 'free(device_node)' macro to simplify the code by automatically
> freeing the device node, which removes the need for explicit calls to
> 'of_node_put()'.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Not sure why I received this patch, but given my recent experience
with the cleanup stuff,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/input/misc/sparcspkr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspk=
r.c
> index e484d79b5597..8d7303fc13bc 100644
> --- a/drivers/input/misc/sparcspkr.c
> +++ b/drivers/input/misc/sparcspkr.c
> @@ -182,7 +182,6 @@ static int bbc_beep_probe(struct platform_device *op)
>  {
>         struct sparcspkr_state *state;
>         struct bbc_beep_info *info;
> -       struct device_node *dp;
>         int err;
>
>         state =3D devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
> @@ -193,13 +192,12 @@ static int bbc_beep_probe(struct platform_device *o=
p)
>         state->event =3D bbc_spkr_event;
>         spin_lock_init(&state->lock);
>
> -       dp =3D of_find_node_by_path("/");
> +       struct device_node *dp __free(device_node) =3D of_find_node_by_pa=
th("/");
>         if (!dp)
>                 return -ENODEV;
>
>         info =3D &state->u.bbc;
>         info->clock_freq =3D of_getintprop_default(dp, "clock-frequency",=
 0);
> -       of_node_put(dp);
>         if (!info->clock_freq)
>                 return -ENODEV;
>
>
> --
> 2.43.0
>
