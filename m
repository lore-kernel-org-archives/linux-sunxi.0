Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683ED2DE1FA
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Aug 2025 04:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754972105; cv=none; b=r7j9Qv/71AG3JlBGgtCdD3ebfQJCaN26tr9CKR4v8RyNEuYJud+B8oiBZ4t0vwOFvbNDgBpiab8I8x5rSIUqnerx7SChfngdfpEFARWmWI58VBL0Nz2GXmP+eLxDBY4e1S5hL7ZtTM+fe45efzWrs7JkdbwbQtnll4VRVh4BTGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754972105; c=relaxed/simple;
	bh=fRWGxF5lK2MuWJbDgzaURVCnCkfvJIwN0YlvHjIajvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihuxBHbVWmkmODDJSxn4wzjdFPsFww33S6T4DZjV3gThfBYm/T4iQlM1tv7NTS8XvoMvDJAxOwqt9Hk7JNVGG3gmSnkVkKVD0opxP2a68N349NVpQNw99ns8NNHmPjygxjwLKsRzi5GdcnCL1z5iOiUybbu2cyLWxlXVo6naNbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGgZeKLG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGgZeKLG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so31770985e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 21:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754972102; x=1755576902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wyyrEvPIWYqxkKqfaEfiXvSKU6QyGxQPgG2uleBOnM=;
        b=KGgZeKLGpBvkDUJThH+lf14Q0ieNvULZnv4qwFJK8H4NHBm16OmpkOHo5Ojkg+0O8H
         bnygIEJQNAm8oLr9PWcW+nmLKifTJZCxhog9qwIz7MK04KB8tMgCvin1QiDIP0+PU0xp
         SDgozhnSZuvAAm1AFnAt2nnCsJtcfmP/GO4zJ/8S5N53MpPyCIvtKxWMxFJs7xk7DW5A
         hYPt/YUtXgua19bF1B4kin43FoyGyzLSBTKnbouwIau4Eo6H9qNQ3DHI8SFOAyic6Iuo
         YW2d4MgWR09A1Oui5EvqHWEvch1JhEGOiVLOmCMW0RcWarx9WG2Ywp+zQ2dLoZDbna7H
         uVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754972102; x=1755576902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wyyrEvPIWYqxkKqfaEfiXvSKU6QyGxQPgG2uleBOnM=;
        b=tfJvz6dIkJAtaUdSMelT1BJtiFYc3qdtXCDYb7rchefUGzwHyjASW1+wFnUHz19NBZ
         4d3TNi7Cp081Nu4Csnh+IXKumR7DwH8L6T9MCTUcZOhbsAx7IfRPt0uSSFaTNENyKHaq
         Icfdj6yeOYwQNHHfq8XrxUO7gFgYBXWlIFV8Swny8Nytj6zY2dCLQIDqbko2E8av7Z2d
         nQtIqBxmLCpyG/5g7/4oUj1chAGQa/8RRN3r5VShVk4a8mko3EdD83avXyc2AJtNAEdV
         v9Tc/mA5IKQ3Pns7qqnXcP10zfshN4F7jRFL1lG9njcXUtsVD6mbwoSbwfK8CQKi34+M
         8r+g==
X-Forwarded-Encrypted: i=1; AJvYcCU9VTQQB7ZnBskYOsSxBn52qE7iydt7nOHCXLHUw3UwRzZno5LXS8sDstn6e+5CRtnAGttslshU6vu1VA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkL5S0BPLArrDN89BivwcLwDGU1MM8g8SsJ8kgKyhZlhrhwDxz
	ZWElBadqq43b5BsiF8EetOOWheZQqz4k2eGR/NCsz75V1GI9rNt62Nf4
X-Gm-Gg: ASbGnctjgDJB3vxsFBXs0L3ZSq7mjL0WKPQV7eVROE+rkXLhnYutS0BMapIl+5yO3sR
	Xs4fzeorkZHrZTVzCcx7RQ8mEQ9Nr3WXvKlzCZItU4VGV823yggQmetKljLDoor5FKuhxPvJC9f
	pr7NnYZocguERLXojD+61KWH2EgU373MpirZN7rDGNTOpqReVwSVka+2AM02OQBNhNeWQ9ep2LU
	A0X2zMiXdDfqOo7RIm1lcmHjstnGiA0nQkpVf2ZKkmkc/CW9CRGZNvyQvjokh+Z0ro2qFN1Q8kl
	UZYktF27m2OT5rpiIVZw+4jZ0PIjJ3Xr06S9M85fwpc2l086UrxHzLPG6rLmMckM38NcAgwQirT
	0WbSDufXoyRojAAlLkSdzdOU3wBiZc6YDil+vQ66Y+QsR/pH0Ubddyp7Py+Xz3Lvn4KwWECUW2b
	w1KQZNNzAQ
X-Google-Smtp-Source: AGHT+IGNJLs7NvNWteyv45ZrCOyBfvS+q3My5/6zBrqb2JWzwylxbTgUjUgIv5tcXeMXy8m+6RRMiA==
X-Received: by 2002:a05:600c:354b:b0:459:d9a2:e920 with SMTP id 5b1f17b1804b1-45a10b9ae16mr17255535e9.4.1754972101434;
        Mon, 11 Aug 2025 21:15:01 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b8aab8c0sm413149275e9.19.2025.08.11.21.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 21:15:00 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Chris Morgan <macromorgan@hotmail.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] sunxi: spl: initialise timer before clocks
Date: Tue, 12 Aug 2025 06:14:59 +0200
Message-ID: <1900891.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20250801234918.19176-3-andre.przywara@arm.com>
References:
 <20250801234918.19176-1-andre.przywara@arm.com>
 <20250801234918.19176-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 2. avgust 2025 ob 01:49:17 Srednjeevropski poletni =C4=8Das je =
Andre Przywara napisal(a):
> Recent changes in the H6 clock code added delay() calls into the SPL clock
> setup routine, which requires the timers to work. When compiling for
> AArch64, we are always using the Arm Generic Timer (aka. arch timer),
> which does not require further setup, hence having an empty timer_init()
> routine.
> However for 32-bit SoCs we use the Allwinner timers, which require some
> setup routine, and hence we need timer_init() to be called before
> clock_init().
>=20
> Swap the order of the two calls, to be more robust when compiling the H6
> clock code for AArch32 or when using the Allwinner timers for whatever
> reason.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/mach-sunxi/board.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> index fb4837c2082..432b1c10f92 100644
> --- a/arch/arm/mach-sunxi/board.c
> +++ b/arch/arm/mach-sunxi/board.c
> @@ -476,8 +476,8 @@ void board_init_f(ulong dummy)
>  	/* Enable non-secure access to some peripherals */
>  	tzpc_init();
> =20
> -	clock_init();
>  	timer_init();
> +	clock_init();
>  	gpio_init();
> =20
>  	spl_init();
>=20




