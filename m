Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440451DFDAB
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754929893; cv=none; b=tYeYet09lHnCg8zsCju0slPDlLPaS1LZ1FZ/YSnMgVZ9n1MXhkXsGQdk9ExJa+wU2TSlEnHQHSBM3JsJ2IHUTUHmWTcXA1KVlI2ly1YdMv2qxegc0q9H6nwnijl/R2XVT4jL6x6CAlPFQfubxgLwkNANMpLA38n2wSqBKL0Ln1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754929893; c=relaxed/simple;
	bh=iTU0hCRfrYNePRSR6S0VdB0XaaEcw2V1GNF8BMBxjDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5LKdp5rh03PcXahmAp0XGiseKwAXX2KA262T+sV6QVTe0+cNTWWYjyh7QnQ2M+TCulOh2xynCteS07LY+6cgpTEgjof0dVb99MxmxgGmjDh3VsFRTKPwTFT7nVCtnDJderaIK5JYQP2RDAjDvbvf+oO8DEqmKPY6NMcViUK82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbRsT4CT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbRsT4CT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459d4d7c745so42478835e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754929891; x=1755534691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YdRLPIMZH2swK7BCy4B9kH/zLDhhL0HbXD3QPuD768=;
        b=YbRsT4CTbRUYJaFVQpYtOEBjda1f4OGbrcTS3CRmIh7OSPyHnr06g4T/nKU5rWMZ4u
         x/mcw6VGhsWOs/ZD5UyMnErjByztLQ8dOJ6jXO83C8GqUB9RGMx81UpU6fa+PMYKSgF5
         BxWxh7GgpCOrGd7dNG+r22NSXXKoghDHcH6xRODZ1IpA0Z9P1+gE45HJJg+gho3anaod
         dgQ0P641V6oly2T3w3gSHiUUKRX/UpF7pD+WNC7fXQUq+kWyFDrEwnYFtWm8oWeK668J
         e3UJ96QTXXjGcO+n6doHGTz/zGAYjotBz+WxfB2CVI2Rm0RCRnvb2n8AAT5GOQWuabUt
         B2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754929891; x=1755534691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YdRLPIMZH2swK7BCy4B9kH/zLDhhL0HbXD3QPuD768=;
        b=odjNmzXYo42VJAgtXd1JcpxKCqShUP3ie9dvTXSb/D+ZNczb5xVq/PEuDABmBpEyxy
         j3ijxMe9MlAHLiVffD0l3gxXDaYx5KsYwyJdTzuLipmNdHRTsDE9K4goGOyyZyWRXvNa
         tUCybbpJhr1AVEVihuHV8JS3ekHjuxFNqKTMEHfY2c4TUcbgGHPb9Eu9+LWOjh7ctPDG
         aOqkpnaB9ByNFUU+nKtoxZzIzY90nhnyti9UBn6Ek5ZHNpB2Wb2c25WWdp8nBPoUEEvK
         3trm0vrzvkNdPv+aKAior6OIRHdOJMmCrebHftX07xTM1fwgx4bN0qtBv3C/5clg2wmr
         T/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFuREVapz64pe2ZAVvrU7fWI3N1vGYyxIEaYtVEI1QuoC2mchO3WS30a/eTj6UfaPMHshCBv+72drPuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRtueSzNAlzfoOXjzafBXRDePmkMDCqWRFlvghoAKtyJd8WhHa
	YTQsEac6Q1VJuwDncYB+Icc/uzn0hTeZtX4yQlHZX4tUcddUuNKzuCbx
X-Gm-Gg: ASbGncui5EVYGTFlQT2xQR9qyVZ8ir85ylMXgBHGaWh9loNuaXQOIipVyG1WvzrshpX
	yvLNfO6HFZxO2yLyrui6ETrWium2E5HXFIBPf5WKM2BvaKsGb5GwfhE0QuUO7QS68ANkh9HYzQM
	1bcjZ3774pFnYLrVSlvc0+o+p5mhrBZM1R32lYp4cD5/HovaCUfafH4RVGEkz5Mjd7HDQjIBnJA
	IGHlBZBJex/XoB9Ge2wbDbSQFxxiNN/lGh1Q3BsC4ICoUWrHevAPwagPzXEgcXnx43G34T5t3Ve
	7kRq9hk3uI3mTGA6RGbaoUj6/TePW3PAEbNhgZ7nskRLnm4pdWNUaECw9qkVlkoC+KvcKMMY1FE
	cRQNAnXQ4EdPPFhmmMkYWdd4T3DH8tG+XUp+FuaY1TGJUcxTcHuEBZgzPdsYdGhwpXT3AJuEqZA
	==
X-Google-Smtp-Source: AGHT+IE53jQO2Jsf14EJEngccMbARbtEBpmtlTdNVRzZP1NPhRrZiYXWdGSYahnKSkh6G+rabtvmTA==
X-Received: by 2002:a05:600c:4fc2:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-459f4f04140mr103754445e9.20.1754929890591;
        Mon, 11 Aug 2025 09:31:30 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e0e70218sm289411705e9.20.2025.08.11.09.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:31:30 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
 Cody Eksal <masterr3c0rd@epochal.quest>,
 Chris Morgan <macromorgan@hotmail.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] sunxi: spl: initialise timer before clocks
Date: Mon, 11 Aug 2025 18:31:29 +0200
Message-ID: <3833295.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20250811165225.2a01a93d@donnerap.manchester.arm.com>
References:
 <20250801234918.19176-1-andre.przywara@arm.com>
 <3363499.aeNJFYEL58@jernej-laptop>
 <20250811165225.2a01a93d@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. avgust 2025 ob 17:52:25 Srednjeevropski poletni =C4=8Da=
s je Andre Przywara napisal(a):
> On Mon, 11 Aug 2025 17:34:47 +0200
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> > Dne sobota, 2. avgust 2025 ob 01:49:17 Srednjeevropski poletni =C4=8Das=
 je Andre Przywara napisal(a):
> > > Recent changes in the H6 clock code added delay() calls into the SPL =
clock
> > > setup routine, which requires the timers to work. When compiling for
> > > AArch64, we are always using the Arm Generic Timer (aka. arch timer),
> > > which does not require further setup, hence having an empty timer_ini=
t()
> > > routine.
> > > However for 32-bit SoCs we use the Allwinner timers, which require so=
me
> > > setup routine, and hence we need timer_init() to be called before
> > > clock_init().
> > >=20
> > > Swap the order of the two calls, to be more robust when compiling the=
 H6
> > > clock code for AArch32 or when using the Allwinner timers for whatever
> > > reason.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  arch/arm/mach-sunxi/board.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> > > index fb4837c2082..432b1c10f92 100644
> > > --- a/arch/arm/mach-sunxi/board.c
> > > +++ b/arch/arm/mach-sunxi/board.c
> > > @@ -476,8 +476,8 @@ void board_init_f(ulong dummy)
> > >  	/* Enable non-secure access to some peripherals */
> > >  	tzpc_init();
> > > =20
> > > -	clock_init();
> > >  	timer_init();
> > > +	clock_init(); =20
> >=20
> > I contemplated similar change in past. It works fine for 64-bit archite=
ctures,
> > but I'm unsure for 32-bit. If you take a look at A83t clock code, it us=
es
> > sdelay() exactly because timer is not initialized at that time.
> >=20
> > So, are you sure that this change has no unwanted side effects?
>=20
> No, I am not ;-)
> I was about to test this on some more boards. But I think with the
> change in that direction, the only issue would be if the timer_init() code
> relies on the clocks being set up already. And since timer_init() is only
> *one* rather small function, just doing MMIO accesses, I think the risk is
> quite low.

As long as clock function doesn't need to enable bus or module clock,
everything should be fine. Quick check didn't show any such code so
it is probably safe to switch.

Best regards,
Jernej

>=20
> Thanks for having a look anyway, I will report back how the test goes.
>=20
> Cheers,
> Andre
>=20
> >=20
> > >  	gpio_init();
> > > =20
> > >  	spl_init();
> > >  =20
> >=20
> >=20
> >=20
> >=20
>=20
>=20




