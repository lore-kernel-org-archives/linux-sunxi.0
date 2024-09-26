Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F41715820C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727369311; cv=none; b=df5LzAvuLPCtUWTDaBMnufTecPRamsQalR4zfZ6Re9Vc7B0yVt9odS8LM2eZH8DX1oh3c0GfWAd8k8sjW26knuyWVAeJRuvr1Osm3pD/tJ9oV65ZrRohGVZJmq12BmTSpMQPCzWlcxnu6gogo/aoQM+A0osn35SNE7yq5EVHdz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727369311; c=relaxed/simple;
	bh=3iLcjQkH5GQa4HPTVULpyY5LszmMUqJ2M/ZQuLeKLO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m44rX3aU1rRQPtpEHW8GZ95i6fZcywkJ0bcnZHD6858c9f0IVFAFr8Y0QNiv0jAwQCBovXYG9hgnE6rgYlRxb3+VCay/O2p49W6vL0CtqNh3keI+iikEmfY9jnixzbz21cntyz6Nhx5qTot4OrGJgr9v6vChT6fyraIJxHEsW68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365cc68efaso1154653e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 09:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727369304; x=1727974104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HubwtGXoHYycyyJ/DTpsXcKHTqyuvb2GHfcFka+zhbM=;
        b=SWh4FfXhSDPng//PErbeu98jKVC02/6aTQa99ehNcok9iRVXR54pEzCKwZQ3gUjBMf
         CZskgpDRCzbJtOKx+TdOzbaWBrN5DgHjv612RLqwyZZgQMeZXxyX1mT453bmt0F4k+L1
         uCD3c83BsBQR6h+P/LbTwc/9038KOujxxRQejMZL8TuArItTL3Rlf7FZC2kb3jwUdx6d
         WkgIVaxs9iSt63u9FeGgPM5XfQApdrEU1xqJxt7sB3jZdfsi7KmP/UunloAFGH+KVRL8
         UWqpffGplfJY9UAD2BTIoQXreVqGeZuKYWvZJIDvnmbKG9zK47LwfFBKkqFOHVsb5aht
         bQSg==
X-Forwarded-Encrypted: i=1; AJvYcCU4CGRVZ+4UziNlFEOPBMDX90JqhRHu5FX89oJ6L9wf5NWhc5klrMMUA3wJ4M58o5QHES6XLbTwzOamJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwK4HMt6s4vvQQwv/jMjgPTh2TYmRhQ0+UjLiT2MTqBh7Fak6ro
	sIC6tqChJRu+pHtx5mJ03ABTkjvjvikIsKDX6ujDYgtdz9B2rpYo6EE7oe9U
X-Google-Smtp-Source: AGHT+IGjv3CJri1FNGCR8XdY1mjMdX9tDfrssXXg6sFg8DGxpFhGtK0eOht10wPtQjHKkMY5UkxwgQ==
X-Received: by 2002:a05:6512:12d1:b0:536:55cc:9642 with SMTP id 2adb3069b0e04-5389fc44dbamr193894e87.26.1727369304238;
        Thu, 26 Sep 2024 09:48:24 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5dfafsm10118e87.100.2024.09.26.09.48.23
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 09:48:23 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75c205e4aso14347191fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 09:48:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3DP0zkddi4kN8LSteGKc40BMINFlYhEFt48LTUbQ9WwHYCOsCGe8ArDzIKtbSMalSIuM9kOmx7G6F3w==@lists.linux.dev
X-Received: by 2002:a2e:be93:0:b0:2f4:f279:36d3 with SMTP id
 38308e7fff4ca-2f9d3e3b935mr2254021fa.4.1727369303029; Thu, 26 Sep 2024
 09:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240926-iio_device_for_each_child_node_scoped-v1-0-64ca8a424578@gmail.com>
 <20240926-iio_device_for_each_child_node_scoped-v1-3-64ca8a424578@gmail.com>
In-Reply-To: <20240926-iio_device_for_each_child_node_scoped-v1-3-64ca8a424578@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 27 Sep 2024 00:48:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v673tM84R=ixndabTmwane_dC+bu5YbNKHi1i+sd+tJksA@mail.gmail.com>
Message-ID: <CAGb2v673tM84R=ixndabTmwane_dC+bu5YbNKHi1i+sd+tJksA@mail.gmail.com>
Subject: Re: [PATCH 3/4] iio: adc: sun20i-gpadc: use scoped device_for_each_child_node()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 12:08=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error path.
>
> This prevents possible memory leaks if new error paths are added without
> the required call to fwnode_handle_put().
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/iio/adc/sun20i-gpadc-iio.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index 6a893d484cf7..136b8d9c294f 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> @@ -155,7 +155,6 @@ static int sun20i_gpadc_alloc_channels(struct iio_dev=
 *indio_dev,
>         unsigned int channel;
>         int num_channels, i, ret;
>         struct iio_chan_spec *channels;
> -       struct fwnode_handle *node;
>
>         num_channels =3D device_get_child_node_count(dev);
>         if (num_channels =3D=3D 0)
> @@ -167,12 +166,10 @@ static int sun20i_gpadc_alloc_channels(struct iio_d=
ev *indio_dev,
>                 return -ENOMEM;
>
>         i =3D 0;
> -       device_for_each_child_node(dev, node) {
> +       device_for_each_child_node_scoped(dev, node) {
>                 ret =3D fwnode_property_read_u32(node, "reg", &channel);
> -               if (ret) {
> -                       fwnode_handle_put(node);
> +               if (ret)
>                         return dev_err_probe(dev, ret, "invalid channel n=
umber\n");
> -               }
>
>                 channels[i].type =3D IIO_VOLTAGE;
>                 channels[i].indexed =3D 1;
>
> --
> 2.43.0
>
