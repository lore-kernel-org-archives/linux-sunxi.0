Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E12E0404
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925923; cv=none; b=T9qIKpfF2LvJGk7eTuvem490k/Na/4H1KXVOwTbqbtM3HN+9rkIQBwSPnsg7H6qblrFSont257aYCGaAgIZQzhr09vUkluJ4NiRcRHqVhdoBUhBWlt8gBroklBscZIEiAL0rI1ZvpKCPpL/CWPNRoj6O76w0A9Pv2MzDyy4BVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925923; c=relaxed/simple;
	bh=agIT07CqRU7VmdGP2KR9Mx1MXLKmwaLdYNPBI9rElCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wm5W2ItN/ggM1Kclpi3YrbfTzFuyyO0P/BZid/Uz4lM4tFYGDsm9OYF/ca7XjX9vtiWNqM13Su11uk7aJbnYPkJjszh/BmQCAbifEk7KIk0lUnTJiBvM+8baj/GquXfl1bCJQt0jAVea0nyG8SZvaCJzN44fX41eZBY0aLQIMf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yday9UcE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yday9UcE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso30548805e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754925919; x=1755530719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWqasxKHxlPA09Szn0r5vmdtzPqapyvktVmaOeG4oRI=;
        b=Yday9UcESx3/KJfAOvgIU168BXjbw+8lJZTKTvohvnTY2zHlbNBrNTrbYGR2mUEzBO
         uVsSnBqHXWkdfWVtaE/9crEVjIhVG4rFR+iCz0trZ8aKJ5JT0tJrrz5QQB+Z+OF/2For
         Gm1q6l+HdFusPFMyjfJ7YWecm8wCaRuXUdq2NyFvsVPjD8lgWz8CdgfFOwJCS/IKZs+H
         YDMEj1PV2obzYs7ggES/LhXfT899YCx+RTrUe7JN6eKrwAyrt5yQrqnTvgYU8ZGjc5+Q
         E1xH1MC/II1d22Pmf4CmT168Zm2Gc8J+LRnLcR195lEt8SuwLfzdiHJOFTLb+apu0lry
         gjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925919; x=1755530719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWqasxKHxlPA09Szn0r5vmdtzPqapyvktVmaOeG4oRI=;
        b=WGf3SOmSNL5VaFTsdt2q5DZotZjSdiHOl+jgYBZ/jIecF2pm9BhxEwEVDqypzSbypr
         b7pvFzoiqIR5FD6QR5E2gWHZbypds/Ubm9LW0iHPSRjUTf35TjHeMXVeoe1nIBDvlwkU
         wux1JUW+j1JSjnIKUgonE/q8/lGVf50OvrpLBhyjo5ZC+sftN1HkDkcb8FoPMT29smwG
         ChUvi14S297czjb/bZgtDi8QBwT2B33hH0yDQsZUg/kN4HYb7eF6ERINbS5bDIQaqzOW
         IuHC5d1b5LsrAN7a33kUMu90BHOsZcHNspZzI92unvBJH6D7SWI1+GcFkoceFqU0TCSh
         Aa/g==
X-Forwarded-Encrypted: i=1; AJvYcCUKLtduMLD+ZoZPx+RohBFWDf/jPsyA0l1kYKkqcbsuSZr5eYtwjfb8c6DNIjNEqUGSMxrdyuwKMd24lA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy64lS1oUU2/9Iwq4pkz/xa7Yq+75N4+mVtfo0YqltfBrQGWWiz
	LuAskSr40XyWgcS+LXcjP68nFzstobhyi+0dZ0N2NB2Bcy5oxWvOh/2u
X-Gm-Gg: ASbGncskdbaz46Z0lnxuRzjMiY0qIhHyA2wZ2SqEakc7nKtFbbMwThe6VaFI+ssuE+8
	1Dgy409Tcw2EA124+Vkb4A+SWfZrxnHll0GxVi1/BpJNYm8o34yaA9pL9rLV9vmmm2Z8fSduwCP
	MHD7tVQiMEkIzAmeX4D+XwD+88a7MrzND7SOMtFE2hP6rCq91tgYg3RdzakUbklTWHCBL7kQAtU
	KW5EUJgmDsj1hcZrqdjzlqgrUitZndT2/GfkblyBWGeFuTMyFMBe/l2cv1mRr4A7Ym/wMa77HoA
	qBWpD/7InjdxjQwwjUK3wx0K0LDT+9sqfW9cnFxETmi5xZmZfYrVVzyirqadepBWojEd2Mre9qJ
	bo1gNdqJfE68F6MdKlHfL139OeNiaeModJjEVSS49w08VLsOExRm/oj7rP7a0wbNS4TqD3k8g9g
	==
X-Google-Smtp-Source: AGHT+IEcUX3iCjh2QpYFQipY2wnUYWpLpi3xJnhB/8ZjADct2G8pOqxPy4ZSCSS4G6iuXm+cRKZbMA==
X-Received: by 2002:a05:600c:4f4f:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-45a10baf652mr1440215e9.12.1754925919190;
        Mon, 11 Aug 2025 08:25:19 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm254803195e9.2.2025.08.11.08.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:25:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rudi Horn <dyn-git@rudi-horn.de>
Cc: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH] Fix detection of odd memory configurations on sunxi
Date: Mon, 11 Aug 2025 17:25:15 +0200
Message-ID: <1927944.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <56f44755-fca8-4364-905e-685e79fd1aea@rudi-horn.de>
References: <56f44755-fca8-4364-905e-685e79fd1aea@rudi-horn.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

CC: Andre, Jagan, linux-sunxi (maintainers and customary linux-sunxi ML)

Dne ponedeljek, 11. avgust 2025 ob 09:35:19 Srednjeevropski poletni =C4=8Da=
s je Rudi Horn napisal(a):
> Hello,
>=20
> I encountered a bug where u-boot detects that my OrangePI zero 3 (with=20
> 1.5GB)
> has 2GB and crashes.=20

This is known missing feature, but you can also call it a bug. Anyway...

> The orangepi u-boot source code contains an additional
> modification in the `mctl_calc_size` which removes a quarter of the=20
> memory the
> calculated last address cannot be written to:
>=20
> https://github.com/orangepi-xunlong/u-boot-orangepi/blob/v2024.01/arch/ar=
m/mach-sunxi/dram_sun50i_h616.c#L1365-L1368
>=20
> I'm not entirely sure if there is some specific logic that applies to this
> modifier, but it does fix the issue on my system.
>=20
> I propose the following patch, but am open to any further suggestions.

This is pretty neat solution. Please send proper submission according to ru=
les
with fixes below.

>=20
> Thanks,
> Rudi Horn
>=20
> Note: Submitted in my personal capacity and is not affiliated with my=20
> employer.
>=20
>=20
>  From 2199f3b28e5fc853ed1921586358c33f3f1502d3 Mon Sep 17 00:00:00 2001
> From: Rudi Horn <dyn-git@rudi-horn.de>
> Date: Mon, 11 Aug 2025 08:58:34 +0200
> Subject: [PATCH] arch: arm: mach-sonxi: Fix detection of odd memory
>   configurations

sonxi -> sunxi

However, better prefix would be "sunxi: H616: dram:" (based on git log.)

>=20
> Fix detection of odd memory configurations. Previously 1.5GB devices were
> incorrectly detected as 2GB devices, causing u-boot to crash.
>=20
> Signed-off-by: Rudi Horn <dyn-git@rudi-horn.de>
> ---
>   arch/arm/include/asm/arch-sunxi/dram.h |  1 +
>   arch/arm/mach-sunxi/dram_dw_helpers.c  | 10 +++++++++-
>   arch/arm/mach-sunxi/dram_helpers.c     |  8 ++++++++
>   3 files changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/include/asm/arch-sunxi/dram.h=20
> b/arch/arm/include/asm/arch-sunxi/dram.h
> index 0eccb1e6c28..7580421ca77 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram.h
> @@ -44,6 +44,7 @@
>   unsigned long sunxi_dram_init(void);
>   void mctl_await_completion(u32 *reg, u32 mask, u32 val);
>   bool mctl_mem_matches(u32 offset);
> +bool mctl_mem_matches_upto(u32 offset);

I don't see a benefit for public function here, since it's unlikely to be
used anywhere else. Just mark it static. Compiler can optimize it better.

>   bool mctl_mem_matches_base(u32 offset, ulong base);
>=20
>   #endif /* _SUNXI_DRAM_H */
> diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c=20
> b/arch/arm/mach-sunxi/dram_dw_helpers.c
> index 24767354935..5bcd2672465 100644
> --- a/arch/arm/mach-sunxi/dram_dw_helpers.c
> +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> @@ -146,5 +146,13 @@ unsigned long mctl_calc_size(const struct=20
> dram_config *config)
>          u8 width =3D config->bus_full_width ? 4 : 2;
>=20
>          /* 8 banks */
> -       return (1ULL << (config->cols + config->rows + 3)) * width *=20
> config->ranks;
> +       unsigned long size =3D (1ULL << (config->cols + config->rows + 3)=
)=20
> * width * config->ranks;
> +
> +       /* some memory configurations such as 1.5GB rely on this to=20
> compute the correct size */
> +       if (!mctl_mem_matches_upto(size)) {
> +               size =3D (size * 3) / 4;
> +               debug("capping memory at 0x%lx\n", size);

Maybe test again? It seems to me a bit dangerous to just assume that it
will work. If it fails, panic() should be called.

Best regards,
Jernej

> +       }
> +
> +  return size;
>   }
> diff --git a/arch/arm/mach-sunxi/dram_helpers.c=20
> b/arch/arm/mach-sunxi/dram_helpers.c
> index 83dbe4ca98f..68c75fa07a6 100644
> --- a/arch/arm/mach-sunxi/dram_helpers.c
> +++ b/arch/arm/mach-sunxi/dram_helpers.c
> @@ -61,4 +61,12 @@ bool mctl_mem_matches(u32 offset)
>   {
>          return mctl_mem_matches_base(offset, CFG_SYS_SDRAM_BASE);
>   }
> +
> +/*
> + * Test if memory at offset matches memory at end of DRAM
> + */
> +bool mctl_mem_matches_upto(u32 offset)
> +{
> +       return mctl_mem_matches_base(offset - sizeof(u32),=20
> CFG_SYS_SDRAM_BASE);
> +}
>   #endif
> --
> 2.43.0
>=20
>=20




