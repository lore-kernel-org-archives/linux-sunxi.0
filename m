Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFBE26F293
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 17:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762190457; cv=none; b=atMCnZtU0zQ6rD9z43jiGbuQlel/s4ZGj/+iIz8rS71LNNob8rj5YU+PQyGl9nIU0AxYAKv4NPYznkkTtnJUdJ3bYnuSN9UeCIlsIGZr4b1Z65tmwcAp1SdTy9lLeLlW5mMuN/OYxwlBzbA+qbVnXqJG05F5FJcsAj5DOqlSa5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762190457; c=relaxed/simple;
	bh=Cw8Tr0pt0izwPilVv5nGs/i4ufdA9dFbRs4VQY6zikM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iu59oiSTrEk/5bwUZK4Dvmwp40RTQfCRT574Tz8kilpGOOS7RFr2i7DnGdoLu4A9axf5Uk+8CI1CALVf2d3+VbhBiKV/zWB/JrMWBNv617knHR1LNWsXdBtG8vFXPknNKhVcsJPbm5EvGuQbImK3ZKOnPNW7PqGdgDVX5XoGZ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMmcAhiB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMmcAhiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06DBC4AF0D
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 17:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762190456;
	bh=Cw8Tr0pt0izwPilVv5nGs/i4ufdA9dFbRs4VQY6zikM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=gMmcAhiBsVSyCkOM0mRYgkYZA9tJDSvK2wgh3qZwFULWhvuXi8erf2rkr/MwaAaKA
	 fw2ML9KSCqXlPeZgkwSyurKcuqLMA35nwK2qQ0C+4tXt6DCRv6SBnvnR3Y0ZzRJ2is
	 xEMh5Fex5rWkiAKYDk1zV0DJro/oYmo46qNlrrule9GFz1EZ2d+i9bGQhCeC76L2cR
	 LSaGQGR0st+3+0WNqNJbdF2+qKzGRo9WavHL/e95h245XBEB2hF+uuN2wWEAWpdWKg
	 bFcHCnLRxBqbLvNmg4iYxqhyRLpJbGgWx3uKZI/NAhWbpgI8Beyv1bk0jQe5hkUZSh
	 UxBEpH8miuwgw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37a2d9cf22aso19812601fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Nov 2025 09:20:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGpgSlJ1NmpV8SDlLRApTOdUXTUuMg4860W03sAtmrJAE+jgNscDREF+I3loIdDpCxcNg8WyRbERCepQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyinE9Nhw076JRgsij6bu0rFvgkgYm8O3jr65TeA8SMoWqWOwXL
	NlgsEGdWzvF3jHGpUrJY0+xoYuodCANHTjCHl8dR6WzWD5HGVlYcSsuB+NSg5TSeX18g+91/K3t
	lwqxe6N7x2RAZmTjloe2ae1I8GSxeiSY=
X-Google-Smtp-Source: AGHT+IHRUi6EAD6pMQNRdNYhSlcQIuKYSqaTxdXDqRJl9lmDDHFEVrdVEd5CRyApfZOE2sDZkcCOjtV9/2hQgNU4yLg=
X-Received: by 2002:a05:651c:23d3:10b0:378:f3b6:f762 with SMTP id
 38308e7fff4ca-37a430aa81amr317571fa.8.1762190455235; Mon, 03 Nov 2025
 09:20:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-28-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-28-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:20:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v65x+b8FXUfM_XbaSxKbKb2bMydmwAHZCm+AMd5f1gW1Aw@mail.gmail.com>
X-Gm-Features: AWmQ_bkmnwYwJfDQIAiND4eRiNPut9jjWdyj2va-IjgdPAkREnfrJWQqH0QGSVs
Message-ID: <CAGb2v65x+b8FXUfM_XbaSxKbKb2bMydmwAHZCm+AMd5f1gW1Aw@mail.gmail.com>
Subject: Re: [PATCH 27/30] drm/sun4i: mixer: split out layer config
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Later special plane only driver for DE33 will provide separate
> configuration. This change will also help layer driver migrate away from
> mixer structure.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---

[...]

> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index 40b800022237..8629e21f9cf6 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -164,34 +164,44 @@ enum sun8i_mixer_type {
>  };
>
>  /**
> - * struct sun8i_mixer_cfg - mixer HW configuration
> - * @vi_num: number of VI channels
> - * @ui_num: number of UI channels
> + * struct sun8i_layer_cfg - layer configuration
>   * @scaler_mask: bitmask which tells which channel supports scaling
>   *     First, scaler supports for VI channels is defined and after that,=
 scaler
>   *     support for UI channels. For example, if mixer has 2 VI channels =
without
>   *     scaler and 2 UI channels with scaler, bitmask would be 0xC.
>   * @ccsc: select set of CCSC base addresses from the enumeration above.
> - * @mod_rate: module clock rate that needs to be set in order to have
> - *     a functional block.
>   * @de_type: sun8i_mixer_type enum representing the display engine gener=
ation.
>   * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
>   * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
>   *     Most DE2 cores has FCC. If number of VI planes is one, enable thi=
s.
>   * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
> - * @map: channel map for DE variants processing YUV separately (DE33)
>   */
> -struct sun8i_mixer_cfg {
> -       int             vi_num;
> -       int             ui_num;
> +struct sun8i_layer_cfg {
>         int             scaler_mask;
>         int             ccsc;
> -       unsigned long   mod_rate;
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
>         unsigned int    de2_fcc_alpha : 1;
>         unsigned int    vi_scaler_num;
> -       unsigned int    map[6];
> +};
> +
> +/**
> + * struct sun8i_mixer_cfg - mixer HW configuration
> + * @lay_cfg: layer configuration
> + * @vi_num: number of VI channels
> + * @ui_num: number of UI channels

Missing kerneldoc for .de_type field.

Once fixed,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
