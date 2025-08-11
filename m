Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009DC1F9A89
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 15:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926492; cv=none; b=uAUOvWrtv3AGCsNBJP5tDN9lz8XnMm8pjVulT5UG60p6Wxa3U4HsleGBf8pEaSrLYDe9SSxxbCvl+kE/vkVLBNVXJj094ZiKJJ/7PUZb/z/lYU+Pi43dA9P9K//Ghdf85qq8T40vsP/SGCnVLTUV7Qp6Czh+uzpQrFv43lnujs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926492; c=relaxed/simple;
	bh=FrzJ+K6tQzKLG/TeJnP4ztQDUciDLQXxdL7KhWlHduQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V/9WTQuaxoWQGiGxz/6AhRbJv2DbPf/Y3sSDmx95vAQqrZ4YRr2CfqjGEMo+Cmrd7N98CKnnU0MWWHo7DWNP9w0ZVuXmfW8IQVyZXIWNs1mQkc0JzObVPrtL7edpQ2oiGhwNuObwVrbyug1UTOi6dnJApiHR1jPq5kEXAhCJYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMeuZ89+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMeuZ89+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b783ea5014so2440020f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926489; x=1755531289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa5H7WjqtxlkYf4utEsbVoLUNd3hZDF6fSnW+rnO1uM=;
        b=aMeuZ89+B9HlFShQoubg0HgLV0Fmdb0ZTyPnWBTLgl+UYgSTg48jo7cyY1K/Xu6Y8S
         6Nc7B0Cbv6EJDOBvgrz1sSuevBQ3f6QLh1YRQeySLG3pMpF17U04jyAF0h7Bc2sLgtaT
         Gv9ZH8WxTHrOINdvRiZ4s3jOrBTDjHnBHimtRICVKxe6vCNoyoNRbRuBsBDLSEIVLV6E
         NhWl+UZ+F7Pr3hkSeGNpxf2AKVsojTKPaYVw9WUqK9bltOiuVSJEASMpzuquaW0xi3lw
         kzyW3SwXwAsQXftgdjkBka24P143brKZj9Tth2Wmy+EQmobIS2dhDYqJAzdag5ivs/Jq
         6wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926489; x=1755531289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pa5H7WjqtxlkYf4utEsbVoLUNd3hZDF6fSnW+rnO1uM=;
        b=k1F6zQrfoRHsaXq/GxoFelg7zlG/gU0dieAcBb7/jovFJAt/rkZVSRinmXIvEPfwYO
         YbGRzjRzijq5RP4DFJhfNNlvCNK4BZGmwhLCgRq24uGR3Y7sgngeuwviyt/X+RTyo2xj
         Xyi+JUXvrNcSJsMMYGn6M7AL8a5Kmc4Kc+TOKD8B29qt6pjP6BEmoBc2LWvnUTuiNoDB
         n/0GojGerff0AFfUJYtPOf1SNVtP8UgDXL8upgp6jGrRj7QY847SIMrDqGIg3LsO3vjM
         NG02zi5kd5Vb7y8ArroFRaeD6Qj4xMBK+DARvyNVyIg3DSphYlBc+QORpXgpAxYZXFrt
         TRHw==
X-Forwarded-Encrypted: i=1; AJvYcCXHwAtesMgD4+YPrjqUZ4UIECi2G1Bhc4kQMaJ4N1qpm0j5Icef43SmqicvHUr3/JVWBuDZ0QKVjea62Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRA/KSvFrH5ISW4ulSOTHqXKfkTQK+2YrpEH9X9PtwtQu/AAqF
	aaIfSWOEViu4SLdHNMcF9V5E0STWttE8vEAXtm0fS7L9L9CZUG7cKq/shlK0dw==
X-Gm-Gg: ASbGncufmpH4PQutysrnwqe5td4zK0C/WX+1IpT+LRP1wyGHIeMOYlRZfZKCz0w/pjS
	1JKeSeBMIMPLwkg/sqmN7Hg5OktQlJxd4dHsnIsrfN6fEcH34NS/0v5GPFWV/rRZQmjGhO347wZ
	9oyWAlu5GpMlIL9YWsa42PGvDGQBZbE/Jqb4dg602UrkQO1sK9D87mdbuv6rrlX8kr2+g/1UDjv
	rzux2YxyjcvItjh8fx6uMb3EzPbuM8UphKapjX/+lxR5qYwx/pm08OrVwevxs6DbGGEMfH30vUk
	Y4c0EtAATjeTb3F4i2l8F190nFVg2/8H8CUTlxjrsQf8J33bYv6rOkHP3KlE0KZ1b/zNFVV9Mgc
	8x1fDBOfH0EKohSVmcwaQzMHT6Ofch5W5Ve1fEMhn0yOSFnYKJ9ixnXremBlkmoZjaFlWaClUTw
	==
X-Google-Smtp-Source: AGHT+IETlEYVakrIWts/SDtqOPgNj2hqtRJvrQ1zlCWcYtFnXYmFrusELUL1i29Rdm37CZhkmgKa8A==
X-Received: by 2002:a05:6000:25c7:b0:3b8:ef61:bab7 with SMTP id ffacd0b85a97d-3b900b503d5mr9112004f8f.27.1754926489047;
        Mon, 11 Aug 2025 08:34:49 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459d712c386sm343161245e9.23.2025.08.11.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:34:48 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Chris Morgan <macromorgan@hotmail.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] sunxi: spl: initialise timer before clocks
Date: Mon, 11 Aug 2025 17:34:47 +0200
Message-ID: <3363499.aeNJFYEL58@jernej-laptop>
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

I contemplated similar change in past. It works fine for 64-bit architectur=
es,
but I'm unsure for 32-bit. If you take a look at A83t clock code, it uses
sdelay() exactly because timer is not initialized at that time.

So, are you sure that this change has no unwanted side effects?

Best regards,
Jernej

>  	gpio_init();
> =20
>  	spl_init();
>=20




