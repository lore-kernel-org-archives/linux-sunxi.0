Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4491C5F28
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Mar 2025 21:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743111841; cv=none; b=InE0ztrJGku1UVecVzDComf47+brRJVYq556t7nOSFoWpoF2OzNG3CjomINeafesMxNPK0q9lGrF8s5QYstJYkxelZEgrNB1tFVOX8IN//fUfq4sGnmkRPTDacgGOO5rLC/KnHS+9JVCeCurAPs4u4CGEK+Zkc1Z4/Kz1mNVBnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743111841; c=relaxed/simple;
	bh=3a//GjCo7WKlnQIQeu9siU4n2Y1SdXKN3Z066bM9ixo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YOaLoM3k3VwpDO8bx9LAwPB8SNB/MaXLevDAjdSFVsKsEXycW99e9KjxhEnSU+GWqeRLrAmzvMaZnGd5W661FmLr+AFHjrV8ElIXW20XlbRT5bzYxXOg4zV9VDIBQKOlogFxrMhImv+f/DUhHVeLjQ3kkwzCynczKKy3DTIWBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhNHEIaF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhNHEIaF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-391342fc148so919762f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Mar 2025 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743111836; x=1743716636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cev1h5zWPn8O3YGwwOJS0uoWqT2s8ZiKeMyS4YSkEqw=;
        b=bhNHEIaFkgRVnf5ua1/xXTpsTPFva9PK+K+93V6W2fhLFb3uArArhJllEb4itWihpy
         VSM2ko9DB/4rrRFNiXbg2U/zbURTOSQ5/DKr2Rx4/EkHSWjihxcSBdCn86BXHdhTPJ0C
         eoR0/4foq4ug7fM5ey2nlTrcuPGM1Qrs4xnmVMvw0Vtnaw2tji+8Ds/PECHRBKdgbd/q
         78YTRxrX3vOdxOtwO4PANXuV0tZYV1YE0Ic5rANdwFZG0B1eUmssxRjyG6+gzwwTgRGb
         KQqrVg9Ykyr5i3pQM/AF+73MNNKNkvr3AaYBQEpSGcaIAVSE/jpa39gOcfhKntGYP/6z
         uEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743111836; x=1743716636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cev1h5zWPn8O3YGwwOJS0uoWqT2s8ZiKeMyS4YSkEqw=;
        b=HYXQIzn1JpIajhuqJxwxbG9b9sRswme86QESnKhzLdPE+fnDRZ9uoeqsvePN0P5WJx
         OOdOr3O9gGM0IUZOa7zotnLxJnQNXpx6Cc8qHCck1Kf/bz/l2+TWNDo54uSARW96Q8JF
         n38vMvL5vT+LGqlIeHZtB1YqhEptt4OQmBIHZh6jJJ0NwdxgsZeIKPt3ma/lWkTDNGrh
         LzVwZkbeHuo4lVS2dpidZpLWvDtw3t+OJBTbpSETC0hI9GtFrZh4F1/EzNZ4NyiX5Lwf
         v0XvKzHDJwT5FzWgnGIIRTqc6l/ynol4hron/jsbqOwG7MibEhW+H2mSa63wa1z+17NY
         +L8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzFyYcC50bCanZEs/9JUU96ip0uzmnSYpCVfGCpBmbgJtNa+cUoDf4VLWgACtR0GrPbT6Hgw8tZDTy2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YweTt7ebM7j9DyRl1TkMS3sT1GWxh/fUcVvIN9TWv9fSQqbNfwU
	jSA7cLqGxS+WFhC5c6nN++GGl6npyQtJ5U+XF4WTLhMsB3Lx2giFw8o9Gw==
X-Gm-Gg: ASbGncsTd7oKAJjIoD6vlBABJWkFCkIM++TBDUApCHpdEhFolQn9beZsNDtPsG7I3Yv
	YszDgDG+mHq9fmpm0iQGJRcEkDFuW+ruDMzXe2MsyUg01BRM4fuhldAdu9oGVSDz0Frn/x4HViH
	j56bsId4vzLBU2QDxObPg/ZJKONQ6i7B60OQ04YcplZDMx4zNdW9C3HgEn8L0oxSOc+q9oKzSFx
	2kz+/Im5o6DwyLY/CystilDkOwM6MsfLjKexOsmJEftwHU4TBb0EZtB1HLm6Uvj257gJy+rP1Fx
	4SEG4jgK6u9XbhSw+wNpt61yMuHrdyO+MT8R8/Ii/lp4JDxjhD/mvYU5UT0Z9rzOW1Z+Ut/Axs7
	9kXu37zocUSk2QhwBYmMg
X-Google-Smtp-Source: AGHT+IFaNdszCoMZj8jqW19YSWSH2PETw+Q8/TrV7NdwqP8xcBJnwsloiU66eKnil0Jl8p7SqjJvUw==
X-Received: by 2002:a05:6000:1a8d:b0:390:e1c5:fe2 with SMTP id ffacd0b85a97d-39ad177b8f8mr5466252f8f.38.1743111835994;
        Thu, 27 Mar 2025 14:43:55 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4181sm640512f8f.83.2025.03.27.14.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:43:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: h616: defconfigs: enable eMMC
Date: Thu, 27 Mar 2025 22:43:54 +0100
Message-ID: <2772843.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250327212102.26893-1-andre.przywara@arm.com>
References: <20250327212102.26893-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 27. marec 2025 ob 22:21:02 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> Now that eMMC is working properly on H616 devices, it became apparent
> that some boards were missing the right defconfig bits to enable eMMC
> access.
>=20
> Add the eMMC device number to the Tanix TX1 and the X96 Mate defconfig,
> also the eMMC boot option to the TX1. Oddly enough the X96 Mate had
> just this bit already.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Expected consequence of the fix :)

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  configs/tanix_tx1_defconfig | 2 ++
>  configs/x96_mate_defconfig  | 1 +
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/configs/tanix_tx1_defconfig b/configs/tanix_tx1_defconfig
> index 28cf9513c30..00e34dc5ad9 100644
> --- a/configs/tanix_tx1_defconfig
> +++ b/configs/tanix_tx1_defconfig
> @@ -14,11 +14,13 @@ CONFIG_MACH_SUN50I_H616=3Dy
>  CONFIG_SUNXI_DRAM_H616_LPDDR3=3Dy
>  CONFIG_R_I2C_ENABLE=3Dy
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> +CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
>  CONFIG_SPL_I2C=3Dy
>  CONFIG_SPL_SYS_I2C_LEGACY=3Dy
>  CONFIG_SYS_I2C_MVTWSI=3Dy
>  CONFIG_SYS_I2C_SLAVE=3D0x7f
>  CONFIG_SYS_I2C_SPEED=3D400000
> +CONFIG_SUPPORT_EMMC_BOOT=3Dy
>  CONFIG_AXP313_POWER=3Dy
>  CONFIG_AXP_DCDC3_VOLT=3D1200
>  CONFIG_USB_EHCI_HCD=3Dy
> diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
> index bd9b611d6f5..c0628370df9 100644
> --- a/configs/x96_mate_defconfig
> +++ b/configs/x96_mate_defconfig
> @@ -11,6 +11,7 @@ CONFIG_DRAM_SUNXI_TPR11=3D0xffffdddd
>  CONFIG_DRAM_SUNXI_TPR12=3D0xfedf7557
>  CONFIG_MACH_SUN50I_H616=3Dy
>  CONFIG_SUNXI_DRAM_H616_DDR3_1333=3Dy
> +CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
>  CONFIG_R_I2C_ENABLE=3Dy
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SPL_I2C=3Dy
>=20




