Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6182556E
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731229465; cv=none; b=Hf3D8oekR6g3X92fcYXXQrbeecv37/HMLjmv7ToHpcrA7y//6fSvT22n+fQoqVjkkoyY9Wl2qNnd7KljNu83+FDgvA8J49zN3smBlChtVchWnQqVJUBe4SB1X+JpuzHfwPySPDo0jvEMBzTEutRxVg+ZgtOnjsdmkzRJHtNt6Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731229465; c=relaxed/simple;
	bh=9D76VTSvQj4qIs157AAY7CHs1PwRQ61N7EvhyoBYfm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krZkpJIL7OCgIkVTsylE4Bw0vvxB9xrihpWvZRZYTykBoh8pau1NnAveYLlswwLNGKVjUvVknOICrsE9XJHoJWrq0ejp9VyHemYXHUGxOCzx+dH13IiAPsJeR+uYtjyr9Dnw50vf9Sr3amGGggEN3bvvWnTpHO91IFat0abflas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso3827230e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 01:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731229461; x=1731834261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wtpfkEmN9TnpSt9kWyIfHjD/NJzBYrneyOwbFIleHc=;
        b=l3M8hLDWstuxlAi+vH/obnpk/KEMpc7w3dYy7zlizG96G1TTkqm9mGd4uMDSyoNeq2
         x58hCu3RUA1WQ9Xq5SptM+83IvW5kx037pqaq4fPZXT9pAibzC87gAqbWMBWSOb0xDVw
         HS+6FeLp41taCciW6Bg7oE2VauujtGwl2dgGNTsZ9mH+J7VrEPYZKFyXItjD2OVggyHq
         MDSVXxfmu6e53j/W/Ymumze+wdXLf8YWe3FBPF60g915BYFEKgPCywdWVCFqF8jgaL6h
         ef2Ze3fEJ5OVd6qnw8BjAvjZsFTFHdMvrO7Y+D9y9uQOftRhZc8BGHgR4aVcGrH8AW7x
         ONag==
X-Forwarded-Encrypted: i=1; AJvYcCVp1P12am+Ce/KDAq0qkuSWuhOD8h850i48VROfYpBnianrNFLhi4YL4V/neDwuQVXgflqNdAQoq1PvOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBvv+Mr5hlcC3BM9Q1TS+A4/VXQodN5WbbI+gNiDGGMGYXCMYs
	N2oviiOgB/npU3YFWtPa3cBu2R2J4Nlm9HvN/7wxkYDp0FHztL9zYUZJghCH
X-Google-Smtp-Source: AGHT+IEEbbO6PmzNO5SwC7Dvisskb/a1vxWzbYt1Wo2cAKXKVqR4Cnc2OxLM57Nb1ZvyIViFqmr7pQ==
X-Received: by 2002:a05:6512:2393:b0:539:dc87:fd3a with SMTP id 2adb3069b0e04-53d8627cec1mr3554339e87.6.1731229460935;
        Sun, 10 Nov 2024 01:04:20 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826aefa6sm1152260e87.249.2024.11.10.01.04.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 01:04:20 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso25159031fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 01:04:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGjxDQOF0sREGaX2O9HoLeHjjo0Vag+eclbCC3tjLhAV4dd0rujmUIZD1HfDKHQKlYaZjeXyLbgV50pQ==@lists.linux.dev
X-Received: by 2002:a2e:a552:0:b0:2f7:58bc:f497 with SMTP id
 38308e7fff4ca-2ff202e1810mr39484121fa.28.1731229460191; Sun, 10 Nov 2024
 01:04:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107014240.24669-1-andre.przywara@arm.com>
In-Reply-To: <20241107014240.24669-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 10 Nov 2024 17:04:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64HUp4Xwgc3fw1fMVTBQFV2kHSVbs7=XBufzJpQ9hkuzg@mail.gmail.com>
Message-ID: <CAGb2v64HUp4Xwgc3fw1fMVTBQFV2kHSVbs7=XBufzJpQ9hkuzg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix A100 compatible description
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Yangtao Li <tiny.windzz@gmail.com>, Cody Eksal <masterr3c0rd@epochal.quest>, 
	Parthiban <parthiban@linumiz.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 9:43=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> It turns out that the Allwinner A100/A133 SoC only supports 8K DMA
> blocks (13 bits wide), for both the SD/SDIO and eMMC instances.
> And while this alone would make a trivial fix, the H616 falls back to
> the A100 compatible string, so we have to now match the H616 compatible
> string explicitly against the description advertising 64K DMA blocks.

Would be nice to know how this was discovered, and how the correct size
was determined. As far as I could find, the A133 user manual says its
64K.

ChenYu

> As the A100 is now compatible with the D1 description, let the A100
> compatible string point to that block instead, and introduce an explicit
> match against the H616 string, pointing to the old description.
> Also remove the redundant setting of clk_delays to NULL on the way.
>
> Fixes: 3536b82e5853 ("mmc: sunxi: add support for A100 mmc controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/mmc/host/sunxi-mmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index d3bd0ac99ec46..e0ab5fd635e6c 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1191,10 +1191,9 @@ static const struct sunxi_mmc_cfg sun50i_a64_emmc_=
cfg =3D {
>         .needs_new_timings =3D true,
>  };
>
> -static const struct sunxi_mmc_cfg sun50i_a100_cfg =3D {
> +static const struct sunxi_mmc_cfg sun50i_h616_cfg =3D {
>         .idma_des_size_bits =3D 16,
>         .idma_des_shift =3D 2,
> -       .clk_delays =3D NULL,
>         .can_calibrate =3D true,
>         .mask_data0 =3D true,
>         .needs_new_timings =3D true,
> @@ -1217,8 +1216,9 @@ static const struct of_device_id sunxi_mmc_of_match=
[] =3D {
>         { .compatible =3D "allwinner,sun20i-d1-mmc", .data =3D &sun20i_d1=
_cfg },
>         { .compatible =3D "allwinner,sun50i-a64-mmc", .data =3D &sun50i_a=
64_cfg },
>         { .compatible =3D "allwinner,sun50i-a64-emmc", .data =3D &sun50i_=
a64_emmc_cfg },
> -       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun50i_=
a100_cfg },
> +       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun20i_=
d1_cfg },
>         { .compatible =3D "allwinner,sun50i-a100-emmc", .data =3D &sun50i=
_a100_emmc_cfg },
> +       { .compatible =3D "allwinner,sun50i-h616-mmc", .data =3D &sun50i_=
h616_cfg },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);
> --
> 2.46.2
>
