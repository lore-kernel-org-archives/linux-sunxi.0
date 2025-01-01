Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6061149C64
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Jan 2025 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735721926; cv=none; b=uMmbCVqkKrIt18hWkuNJqlilcUGW7tg3It3NUOf855666N/ygB9qITL3d2jFuDG4ukUhdIDXxYJ322HgJyj5hIOP3Oy0hSJ3I4tnJYyuohaLXvL44+W4uVuibNhqHRBiQGGADxVlksuTiBnghnPCYNJ9B4/iJLtklR32/aPdHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735721926; c=relaxed/simple;
	bh=dB3jhpzgRuWSQJQmfNuBsTOKheK4ecmNIZCeSfdLBzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgvUAbFL3kHbEnRm2asChZ1ZOOrEBcum6iUdr2BlSaPDN1iZpKs5touPTw7tRRq9lwW6pfbsWiMau57O/KghWFzeB+nrn3gXBT7afOg4tqvL40a8kO8LOqTxytRzWwJHZdoUxAeOzKdJL1nMCfRkr3O1rkePgXQyB+nA9bWOCc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3035046d4bfso98176361fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Jan 2025 00:58:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735721921; x=1736326721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03r1MUnoANbps6OakqIBWa8kGI5iV3U0tsXfTI9VdjQ=;
        b=LGtLpwF1TKsTpbwXmkR6NcfSjW/hO2KHWahdJKpo8TKyz6nlnLeiEIiNYPDYTjTBcS
         ROpwbqemiO2A1NSsXxVBePN+VSDyCc1jSR49RAjPZCu/Cgi4+8yRqdjuM9CNuNr0hvd8
         m8XWct3oLHDNXvYtmcOlwtlWd/mgU3x2yOV2CdUypB1WRPB4R9piuanezFtrAu/Yu75A
         jEKIPGlM+hB+A/KZ3Mvj2Z1RY9zoXp9i9Php8GL3IVKlmS3qTAyYpj7lpUU5Zn5QZ1JN
         JnUS3pho2iewrFpIdZlJrF2A93vQ+sxlwt+6uSMf7s8TSgfSJ4mJeOorZX/QozLs1bAJ
         0icQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSGhZ/9ueTWHZKzs/hdCRdRC8dnc9Mt7oispjB7Hp58muAOqQikP/Xqt/xz/P3K20Z7+UnEfypEdxZLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx/MZXEwTGcxw5Lc4HkyGFtscf4g61gRj3HRyaDNBEpFskOACS
	zBRXRaariLMgwObiHVkhrNIQp3jBHBKLaKboxf33/E9IbkZuazdeUSwB9svb
X-Gm-Gg: ASbGncsCHI6m/9tjY6Uuu4Z4seSZJ51Vs805CVYan/AFGXHJbPsIkypHE1LL0ErVf6E
	hHAAeNl3b2TfqpYb5Utm9/FlAWHiLdSopqiKxLbdipn1rCb661WD51S9GO+9KgvLHsb20cKd05o
	vjwXgYO2YucaRzx8Ep8gAriXdTFpg2WSrs/69jgexMmRwu/RNM94NAvc0VqvqaMLLeqw3ZX0pcQ
	Hn3SPjUed9hrzd83pSDvstMckZlMfuHXVYVuj8G+Zdu8gyqNiaNuLH104c/1Ub7wUjeoweYLHNr
	U3LBqS/druU/cg==
X-Google-Smtp-Source: AGHT+IF1BdzvGyf8A15DWh2bUg7CXla1m6Nejz7JNq5hZLcAc8XFcyQ1w9oJprFsBd66L6eCwlOE6Q==
X-Received: by 2002:a05:651c:602:b0:2ff:d075:2408 with SMTP id 38308e7fff4ca-30468608a47mr103645121fa.40.1735721920830;
        Wed, 01 Jan 2025 00:58:40 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cfe8sm39377751fa.6.2025.01.01.00.58.40
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2025 00:58:40 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30229d5b22fso126408121fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Jan 2025 00:58:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWe3BvDGp9Yf130vLjKptHWnUViS4Eq/GTj/ZL912nIr54O+fxP+Ww5XmYwdSLnwqE5/lILXwc9Xav24g==@lists.linux.dev
X-Received: by 2002:a2e:a58c:0:b0:300:1aa5:4967 with SMTP id
 38308e7fff4ca-304685c1985mr174943451fa.25.1735721920308; Wed, 01 Jan 2025
 00:58:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241219105622.13691-2-code@stefan-gloor.ch>
In-Reply-To: <20241219105622.13691-2-code@stefan-gloor.ch>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 1 Jan 2025 16:58:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v67dBhL3-AhLeHg3xOgbNZ3qu0aj9+kA+MoOMRYfr_Z_zQ@mail.gmail.com>
Message-ID: <CAGb2v67dBhL3-AhLeHg3xOgbNZ3qu0aj9+kA+MoOMRYfr_Z_zQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Add MMC alias for consistent enumeration
To: Stefan Gloor <code@stefan-gloor.ch>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 6:58=E2=80=AFPM Stefan Gloor <code@stefan-gloor.ch>=
 wrote:
>
> Add explicit alias for MMC devices, so that (e)MMC and micro SD cards
> are enumerated consistently. This should fix spurious boot failures when
> specifying a hard-coded root partition, e.g., mmcblk0p2.

IIRC we have chosen against adding explicit MMC aliases for the sunxi
platforms. Please try using UUID=3D or PARTUUID=3D for root partition
references.

ChenYu

> Link: https://github.com/linux-sunxi/meta-sunxi/pull/431
> Signed-off-by: Stefan Gloor <code@stefan-gloor.ch>
> ---
>  arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts b/=
arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
> index a1b89b2a2999..9cd1eb690134 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
> @@ -60,6 +60,8 @@ aliases {
>                 serial2 =3D &uart7;
>                 spi0 =3D &spi1;
>                 spi1 =3D &spi2;
> +               mmc0 =3D &mmc0;
> +               mmc1 =3D &mmc3;
>         };
>
>         chosen {
> --
> 2.45.2
>
>
