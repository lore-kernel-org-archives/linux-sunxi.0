Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380962AE8A
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Dec 2024 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734250518; cv=none; b=HQQmhHvenLT5EA6vrfvE36x6gd2tpogABEwX9/MiWvEhou8AkFj4wCpXe1R7DRrD5z4iXB4Xwoo4wlsKECRJVTgUiVbWiwNjaVWpekdeUuH/uiGHya3AN9YWyUpq6U+faSGgY1+MYbGdJrIUDdCAYAUKSBIWy4yNf0AQAYz5+Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734250518; c=relaxed/simple;
	bh=MfzlMTD2QL4BZMnKQKMZj1xTmWxcCa0w/vAtL5LJle4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4/WUpDHJYyN6fH6poRvqjTlpGGT4YjdQ5zQ6bcPQyl23B5qIaqRx1G3GWtO+lL++a9PntsWughl/AmYrYRPrg5Gf6k+SP9XazvvDihi3CY2s3kJxkDRpy26r+xPlcwVjc1H0Y2PfT/jJmTNm/YiBQWnkVmxXZhT2r1mhBo/Lx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e384e3481so2882843e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Dec 2024 00:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734250512; x=1734855312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbW+PaUOzCwCbF61CRYPi7XMG3ao6Wxw90lcjAtKDFs=;
        b=fKRE3uB3pASbNeC0y4BFB4II5SPaM2q7li+V/XXPWP2xYUQdNHHaH0B5DzY7ot6NWM
         PunPTwtFvLyr+EIn85t4bazJ0oC9QAZAndObaG6D2doqm1dN3NnjFddxhpKW4yc0zmxE
         GERVdryvFMD+FQ6d/VkyaRN9WpWKjW+RGMJQQnY02JcLZ+KuaLKeZZY6O+v5a0XdPn9x
         YBUIta78/ygFxeCoqpLW7L2Fk4JSts6BTm0fRh1mY6XK2ZssSTr76MoIoHUWA8Hh35+7
         IgadRvnX/sD7JjBNrW0FCoYwsRsTkHTKovaPNXFsHyiBYYzuZunCxVBrXMb2ElNR411q
         fv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVT3EFY1l6SwqTLpvaHB2+r4O2/C5TlcNXG0UJUiuwAIb7TWa3NWaKOnyZgrArmFtLawCIf+c7zRqyDXA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl/xkLY97iowoRf1i/eLaihqfldbqzpatbvxffOgfOl0dQHCeZ
	aenRKQcSTLfEDD3BarbMfwT3+xzoeBhPuMGHDnmszOLrB/S2AlV6bGZXZ/VM
X-Gm-Gg: ASbGncvjkS2AKst5FciEQPbPiTga4rCrC1KvaglZ0gYp6MA3fDhGLcxluIIGagDThgE
	pczbbSVt1z6fTZeg2ZRIASM2xjw0fqEBYHzVy29tDFQkKS2DfWuLeSVCdULFOP9e1jGmkI/WkeT
	SDiRLZPOQlQzjAO8Rf2z/OyL+95CRdxEv4SzbUhfYhu+CD2QYK/vC4hACGlOHcVX5YiXFHtixxB
	/oOPlxM3kaBYU+e5HoYl4g/MrXS3yl3z+ewp3v496JM3cnrIcytbdPINo4pv19daQEERjDPzLc1
	rPaPmPDxC1eeYw==
X-Google-Smtp-Source: AGHT+IGk6k/fCeZZPiSqEM3nh+eQDYchkvc/MXsahhxwsY9wcMK40ZrjUuCv8ZIxKVBor4bl+ke0mA==
X-Received: by 2002:a05:6512:1191:b0:540:2022:e3c6 with SMTP id 2adb3069b0e04-540916d736bmr2969920e87.35.1734250512276;
        Sun, 15 Dec 2024 00:15:12 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344061d5dsm5138211fa.52.2024.12.15.00.15.11
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2024 00:15:11 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso38006391fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Dec 2024 00:15:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4ElQUYE3unKIj6ewGeTITtd5VDqq/7TckSipIfdyAfFXz+Yd2VAX/hLU/wGimHxKdZuLI7iWL8l9XfQ==@lists.linux.dev
X-Received: by 2002:a05:651c:198b:b0:300:3de4:ff7f with SMTP id
 38308e7fff4ca-3025456691dmr30121161fa.6.1734250511023; Sun, 15 Dec 2024
 00:15:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241215053639.738890-1-anarsoul@gmail.com>
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 15 Dec 2024 16:14:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v65odTCjkC493e=q57ikeKHWrKYS26N7-0Hjc=S_d6ELyQ@mail.gmail.com>
Message-ID: <CAGb2v65odTCjkC493e=q57ikeKHWrKYS26N7-0Hjc=S_d6ELyQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: allwinner: a64: fix video output on Pinebook
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 1:36=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmail.c=
om> wrote:
>
> Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in =
TCON0 mux"),
> TCON0 clock parent is always set to PLL_MIPI, but unfortunately it breaks
> video output on Pinebook.
>
> I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
> to the same clock rate and flipped the switch with devmem. Experiment cle=
arly
> showed that whenever PLL_MIPI is selected as TCON0 clock parent, the vide=
o
> output stops working.
>
> To fix the issue, I partially reverted mentioned commit and added explici=
t
> TCON0 clock parent assignment to device tree. By default, it will be
> PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
> override it in their dts.
>
> Vasily Khoruzhick (3):
>   dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
>   arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
>   clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent

Looks good to me.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

I'll wait for a bit for Andre to comment.

>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         |  2 ++
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c                 | 11 -----------
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h                 |  2 --
>  include/dt-bindings/clock/sun50i-a64-ccu.h            |  2 ++
>  6 files changed, 8 insertions(+), 13 deletions(-)
>
> --
> 2.47.1
>
