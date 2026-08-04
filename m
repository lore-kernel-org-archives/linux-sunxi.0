Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4C3F4DE2
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 02:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785809629; cv=none; b=uTwLj+uWMSVwjH+Xx8GKgtG2Eh/1T5f2xtINl+ezZ2rgJAKCREmN+fXomy49KIzS97swz4PnAACk8snOx2TP++Sa4aUxSMBm3ukRotMGYIwyPTPl+5zMld7zgLUnFmQDtqHNNl9CrD2AIkX1Tbw3tcEdBrsKLbpyAZzBk0j7mbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785809629; c=relaxed/simple;
	bh=ghueuy9E2dN74CMYyvcSEEq6VJOz6njdy7gCAvbj0uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=famK/iu86QNNzvCCB8G81jhGpSKUXfilW30P6eTkfq10m18L9GRU/e5HI9Io/0EjHyfLsY+WE3Z8h/Cd2TZXYAurPGoRT5yUWKhm+8U/H++RFfWQKSsZ2NrMZwbQyDGgOzqAiyS06ollI1zI6RscHl8xfYy4Nn66LVjeKQmPdlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNOUURBf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNOUURBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9F51F00A3F
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 02:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785809625;
	bh=HaH2PNL0DzB1AiDFqofOUl87+ejDXdlDada/f8nrt/U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=HNOUURBfRpELrfysdDPrxP6ldTC/Pmj5hsD//FMTGVE8qL8Ok8aXoX3/DitE/MbkH
	 FDliIANBc+buY4D3BZib4lsM1x0tDFgk+5HVNBzteaOQb2tipdpolhXZqtefef572p
	 Xj8Y4iMvx8NsptAFwSKkBHuW+3awkDTLRWD22axs6FZe+PaKf5IKjj3wU6gszjzh/l
	 SDW4h0EiQXGBexBoFdLfCtKQv6UAJey+uo1USjuQE5ir1wbnGnQwax+pIN5JWlkBQE
	 hfN5GfCKAcvTmUvC0LgIs4jGly9w+bYK+QddvyL3M1AHtlyMhU6gTLV3OidAGk/3g9
	 9C8opPJr8PlyA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c74722e27so6751191fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 19:13:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoJ7bAVHgWDL4Y4TlqRBohVPBhCWBuwkgYU5MaUcD01pwm0Op7DCy6N4A7AwzgOM2eWci5rorqno8P4pw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFRFYIrODq7wXYlU56Et0TZdi9zkBypaPgoZ/CIrk7QqNDAzs6
	KVCRfmDrHsQiDZAp6E64V0u1bcPN3oMhQxkFAx0go2e5jxUTZqf6/IQCkNmxHGMnaM1LNuGhzkK
	H+88DPFWIaF9FTbCISQYYf8i4FnHiTWg=
X-Received: by 2002:a05:651c:198f:b0:39c:797e:bc8a with SMTP id
 38308e7fff4ca-39fb3308f32mr609461fa.16.1785809623988; Mon, 03 Aug 2026
 19:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <263a4a41442a3c8b072b170256b72658f1b90802.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <263a4a41442a3c8b072b170256b72658f1b90802.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 10:13:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v66x0gt665ZKGTvi37j5quYLpn1YMhrRcd-naD4j83tZ4Q@mail.gmail.com>
X-Gm-Features: AUfX_mymhMOdQmpPOxedWcFtrz_hfHN0-KPCg_ZnLW8-t4yrJhRM5wzU5pS1ZNk
Message-ID: <CAGb2v66x0gt665ZKGTvi37j5quYLpn1YMhrRcd-naD4j83tZ4Q@mail.gmail.com>
Subject: Re: [PATCH 02/13] drm/sun4i: vi scaler: Fix coefficient selection
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Currently, vertical coefficients are selected based on horizontal
> scaling, which is wrong. Additionally, chroma coefficients should be
> selected based on format subsampling.
>
> Fix all that.
>
> Fixes: b862a648de3b ("drm/sun4i: Add support for HW scaling to DE2")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


Somehow having the two fixes together made the diff much harder for me
to understand.

> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/su=
n4i/sun8i_vi_scaler.c
> index 3dec4eeb1ba2..d4412a62c2f0 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> @@ -894,20 +894,26 @@ static void sun8i_vi_scaler_set_coeff(struct regmap=
 *map, u32 base,
>                              lan3coefftab32_left[offset + i]);
>                 regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, i),
>                              lan3coefftab32_right[offset + i]);
> +       }
> +       offset =3D sun8i_vi_scaler_coef_index(vstep) *
> +                       SUN8I_VI_SCALER_COEFF_COUNT;
> +       for (i =3D 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++)
> +               regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
> +                            lan2coefftab32[offset + i]);
> +
> +       offset =3D sun8i_vi_scaler_coef_index(hstep / format->hsub) *
> +                       SUN8I_VI_SCALER_COEFF_COUNT;
> +       for (i =3D 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
>                 regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, i),
>                              ch_left[offset + i]);
>                 regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, i),
>                              ch_right[offset + i]);
>         }
> -
> -       offset =3D sun8i_vi_scaler_coef_index(hstep) *
> +       offset =3D sun8i_vi_scaler_coef_index(vstep / format->vsub) *
>                         SUN8I_VI_SCALER_COEFF_COUNT;
> -       for (i =3D 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
> -               regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
> -                            lan2coefftab32[offset + i]);
> +       for (i =3D 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++)
>                 regmap_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, i),
>                              cy[offset + i]);
> -       }
>  }
>
>  void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
> --
> 2.43.0
>
