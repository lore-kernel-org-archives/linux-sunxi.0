Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2753C13B
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742732152; cv=none; b=lPCe6frMr1YmVd6Zi6sHH/zj0KExEGTP2Y3IgMdvbU4unzrVvlafxhKxcQbPM6rZjSH3B5npjGjRD4WCQ84drgL/Re6uVtcyfgHov/wlWTGYlCEgmo8wAXpEIIHiH+R+vgwsPrXttfQ5wm+Hoahsxarj5t/jKyjo7z1LI1Y8/b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742732152; c=relaxed/simple;
	bh=2IX6Gc4HXz5dcG79Zh5hk2rws9riOMiScyyVYPOGghg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GX7XLeGvyMqR0zdROyZSc6WjvWfLsEsXcFr5g1PYcJnA6a+RltKH9ehb/Y3UcgJgt/df7fVe2mmdSSohIv4Z6F5QDuZ/AK5LQ7ujoXJxEvmqgICRhscl7oY7FGyuzzPZOCXkPysJXOhXDznRSFyrpmpQTZ3JHNIHYhPqVlpvF2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bd7nAvva; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bd7nAvva"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so498066d6.2
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742732149; x=1743336949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tb1mvFP2lGRkiznc149z3tKA9A75A3HPaTIb1rD6G3c=;
        b=bd7nAvvamase1ojj7pKatj895kXeRyfX8jgGF2vdhuBxQPJhV1OVH8I2ERQ2IAzHPn
         JavIvJvjZKKrN//YrReZPqbfXFOTkuFrS1zYY9EpFhlLWRxE2NuAhGTMjq0k6pQc7huk
         BZBpnrb9sMmAutV4VtpRj1gkL2ycczkt7/DZ1gLsFBkBdfsVCxCr8VjVZ8qrPAYshEE+
         +ZKKtOYlHW41YUcm0EISPqqvLMwRDYFugYs9mhJT1fuZHvK/ztmPZj4KkQnTD6ncMS0u
         nl6tDdDeXZhIDOmZon9fuF5ujG7jJyPA+4935ilRqZbxaXb28N2RgCwRlJ8Vb1T8zSPr
         MB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742732149; x=1743336949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tb1mvFP2lGRkiznc149z3tKA9A75A3HPaTIb1rD6G3c=;
        b=T5RIleBgMtMEXiW2Lbd8WN/q8owbWbpxZ34bNqmoMj14+EiI6kl3SjZZP36vaNown1
         X/JQQJGePWF3ufZjP19tqpdwNyJTSXn9F0+Qh4x1xZOMmegDOv2EMeMJcYTj2FGLgOyK
         Ms8DHfzmvf0lX9xmRLF0E3QI8VcrG4JahA/XR6+UR6ZyH7gR20MfPwmQzvENyVRo4GjR
         bTw6UPF0nvwqdBSeATON/s1DAmRvEOcQ/QzBPm5wxczvDua7kqSFQyvsa67o5EtaROeM
         qBo727234a4tyBue0gYZ/sXIgkuHcqsrcrttOua4l2Kgyt1mSmpribIE4uIw98ffBmjn
         LeTg==
X-Forwarded-Encrypted: i=1; AJvYcCVPmMJDWNgbRw5inXMnVy1kLmSB6B6lyhTFaaLn3ew1IwuiODopwcYn08eDQ5caEJUafG9hNZBYWSKN9w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyynx7qiV3Luhy/BoWL4ecr/QNbqlfHT79cgvhNUOqikfUoOkzc
	0MuqBLxVwWGAzIZQJs4hGW9Cl2eTEqVOU0bULzmEAFLj5ZtkfuYF
X-Gm-Gg: ASbGncsEpwjzOKsQ/TfFPY8ncYassuTgb07VQqqInmQ1BN1vbnBIo0vdi6/HLBwmvJ0
	mBm0SDggn/khU2OYQPhhuHt+2W/KeBgcqIm2xHk9X1RyAYoIKNgkgWuEV7mfc+uwQHi0nPZHPtW
	7yuEFAh07NI/6SF6Huddu1M7tXzFI1D8pzrFTOkDkr1ZJ+A6oQbiX6wiXV9MgtZqzaZTzOJ7IBV
	cFvoxceQL+TNilhbAlvaosqOaVEULBfKZs+T+/W40ztlvscrySdaPzIc3mKfuPQoz3pgNznyA1V
	t2CBPud5wb0vFUR/cIz1ihP/qDwF2kP90BbvwoW8pQz7QwbPhZsqAZzziB4F2SlM8yy6McaDBc5
	82ojAlcKa9P96gyHMgP4X
X-Google-Smtp-Source: AGHT+IH55rxZr3I5xwuhzw+Sd6vVT7ck6sOx5bdvALxBSmpLBk4xYTXNYaEpyFa104EZRNwdb+Bxuw==
X-Received: by 2002:a05:6214:d64:b0:6e8:9e8f:cfb with SMTP id 6a1803df08f44-6eb3f2e309bmr105818336d6.24.1742732149487;
        Sun, 23 Mar 2025 05:15:49 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efe0c9csm31660146d6.95.2025.03.23.05.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:15:49 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 13/34] sunxi: spl: add support for Allwinner A523 watchdog
Date: Sun, 23 Mar 2025 13:15:46 +0100
Message-ID: <13723892.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20250323113544.7933-14-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-14-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:23 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The watchdog in the Allwinner A523 SoC differs a bit from the one in the
> previous SoCs: it lives in a separate register frame, so no longer
> inside some timer device, and it manages to shuffle around some
> registers a bit.
>=20
> Provide a new struct describing the register layout, and adjust the
> address calculation in the SPL code accoringly. This is guarded by the
> MACH_SUN55I_A523 Kconfig variable.

This one is missing SoB, apparently by me :)

> ---
>  arch/arm/include/asm/arch-sunxi/watchdog.h | 12 ++++++++++++
>  arch/arm/mach-sunxi/board.c                |  6 ++++++
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/include/asm/arch-sunxi/watchdog.h b/arch/arm/includ=
e/asm/arch-sunxi/watchdog.h
> index 38e2ef2aca3..96d5725141e 100644
> --- a/arch/arm/include/asm/arch-sunxi/watchdog.h
> +++ b/arch/arm/include/asm/arch-sunxi/watchdog.h
> @@ -26,6 +26,18 @@ struct sunxi_wdog {
>  	u32 res[2];
>  };
> =20
> +#elif defined(CONFIG_MACH_SUN55I_A523)
> +
> +struct sunxi_wdog {
> +	u32 irq_en;		/* 0x00 */
> +	u32 irq_sta;		/* 0x04 */
> +	u32 srst;		/* 0x08 */
> +	u32 ctl;		/* 0x0c */
> +	u32 cfg;		/* 0x10 */
> +	u32 mode;		/* 0x14 */
> +	u32 ocfg;		/* 0x18 */
> +};

Anyway, since you announced battle against C structures for register
layout, it seems contraproductive to add it here. What do you think?

Best regards,
Jernej

> +
>  #else
> =20
>  #define WDT_CFG_RESET		(0x1)
> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> index 701899ee4b2..89aea61e8e8 100644
> --- a/arch/arm/mach-sunxi/board.c
> +++ b/arch/arm/mach-sunxi/board.c
> @@ -495,6 +495,12 @@ void reset_cpu(void)
>  		/* sun5i sometimes gets stuck without this */
>  		writel(WDT_MODE_RESET_EN | WDT_MODE_EN, &wdog->mode);
>  	}
> +#elif defined(CONFIG_MACH_SUN55I_A523)
> +	static const struct sunxi_wdog *wdog =3D
> +		(struct sunxi_wdog *)SUNXI_TIMER_BASE;
> +
> +	writel(WDT_CTRL_KEY | WDT_CTRL_RESTART, &wdog->srst);
> +	while (1) { }
>  #elif defined(CONFIG_SUNXI_GEN_SUN6I) || defined(CONFIG_SUN50I_GEN_H6) |=
| defined(CONFIG_SUNXI_GEN_NCAT2)
>  #if defined(CONFIG_MACH_SUN50I_H6)
>  	/* WDOG is broken for some H6 rev. use the R_WDOG instead */
>=20




