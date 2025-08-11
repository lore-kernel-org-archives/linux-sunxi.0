Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9478717993
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927551; cv=none; b=r+TB4FG7T46xgQMf7xVDuPhID+S0kxyjz6rJ58sF/47eBbdT5TYFcFuXuraudPhfd5DhHiY6lY8TBbqx53MfMRKFP8tXJKtuepYEU2FY2FVDxTWGxOr9a4D2baLpQYuCoUFljNqZoXSBUK5/0/MdrUbtCU5XOv7xgkjwj9wlC6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927551; c=relaxed/simple;
	bh=8WkOJAuHxWuCanzgwbQlz2qvFb5VrERd5ZhVSHoQVXM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xp7UH9+181dI+oXR6VoXJa67orUsE03qU/ziaJgJUZ8Je6/WKONmu46tYl3lIzEVqcbrtm2ymS9scpQ0Brkg5gh/5UZ0LJEXmSISVjoDmBm0QFGW+zBQpWL+FlYgz6sNiRKKCS7jlfv6xceODC7JOfuHHQV8qDt8VwS8kB6CjrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98CB42661;
	Mon, 11 Aug 2025 08:52:20 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A04283F738;
	Mon, 11 Aug 2025 08:52:27 -0700 (PDT)
Date: Mon, 11 Aug 2025 16:52:25 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>, Cody Eksal
 <masterr3c0rd@epochal.quest>, Chris Morgan <macromorgan@hotmail.com>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] sunxi: spl: initialise timer before clocks
Message-ID: <20250811165225.2a01a93d@donnerap.manchester.arm.com>
In-Reply-To: <3363499.aeNJFYEL58@jernej-laptop>
References: <20250801234918.19176-1-andre.przywara@arm.com>
	<20250801234918.19176-3-andre.przywara@arm.com>
	<3363499.aeNJFYEL58@jernej-laptop>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Aug 2025 17:34:47 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Dne sobota, 2. avgust 2025 ob 01:49:17 Srednjeevropski poletni =C4=8Das j=
e Andre Przywara napisal(a):
> > Recent changes in the H6 clock code added delay() calls into the SPL cl=
ock
> > setup routine, which requires the timers to work. When compiling for
> > AArch64, we are always using the Arm Generic Timer (aka. arch timer),
> > which does not require further setup, hence having an empty timer_init()
> > routine.
> > However for 32-bit SoCs we use the Allwinner timers, which require some
> > setup routine, and hence we need timer_init() to be called before
> > clock_init().
> >=20
> > Swap the order of the two calls, to be more robust when compiling the H6
> > clock code for AArch32 or when using the Allwinner timers for whatever
> > reason.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/mach-sunxi/board.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> > index fb4837c2082..432b1c10f92 100644
> > --- a/arch/arm/mach-sunxi/board.c
> > +++ b/arch/arm/mach-sunxi/board.c
> > @@ -476,8 +476,8 @@ void board_init_f(ulong dummy)
> >  	/* Enable non-secure access to some peripherals */
> >  	tzpc_init();
> > =20
> > -	clock_init();
> >  	timer_init();
> > +	clock_init(); =20
>=20
> I contemplated similar change in past. It works fine for 64-bit architect=
ures,
> but I'm unsure for 32-bit. If you take a look at A83t clock code, it uses
> sdelay() exactly because timer is not initialized at that time.
>=20
> So, are you sure that this change has no unwanted side effects?

No, I am not ;-)
I was about to test this on some more boards. But I think with the
change in that direction, the only issue would be if the timer_init() code
relies on the clocks being set up already. And since timer_init() is only
*one* rather small function, just doing MMIO accesses, I think the risk is
quite low.

Thanks for having a look anyway, I will report back how the test goes.

Cheers,
Andre

>=20
> >  	gpio_init();
> > =20
> >  	spl_init();
> >  =20
>=20
>=20
>=20
>=20

