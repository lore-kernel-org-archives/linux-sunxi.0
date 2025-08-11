Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF5D2153C1
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 23:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754953455; cv=none; b=CN5bdtReOsHlPLkoLnQtS1VazA0gfZbDA63Xpc6Czf1/Ot/83xP/26SE45f3VURiKdx4xTr5LkaEkO+c27m6sLZWVXmcQ6k57+mE1Ns174vmDD3P1uwNm/bYPIpqj2ViWYl0jgHIWhGKvgILqDb7GzEaJ3P+Q+feLG9bjryAI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754953455; c=relaxed/simple;
	bh=AFuWzhF5ZHfKoi0p8XNaojngAbUoaevLOrjwXZj07tM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZaND30JdNpAfWuHDmOJlhnpsuq4+4WHa0wZeTVxCXR05vFmlJ8RglqBQfAfs2NnL3OuSnXZ8zaI3haepCnANN5/WlTqtu46Ry41uEd89QDBNafOK52B9q0B+T8mY81aqbOGyB6RwSeWEE58Hf6ufeSYmD759rl5+BVImSDb2tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5860150C;
	Mon, 11 Aug 2025 16:03:57 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2F7C3F63F;
	Mon, 11 Aug 2025 16:04:04 -0700 (PDT)
Date: Tue, 12 Aug 2025 00:01:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>, Cody Eksal
 <masterr3c0rd@epochal.quest>, Chris Morgan <macromorgan@hotmail.com>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] sunxi: spl: initialise timer before clocks
Message-ID: <20250812000114.602f53c2@minigeek.lan>
In-Reply-To: <20250811165225.2a01a93d@donnerap.manchester.arm.com>
References: <20250801234918.19176-1-andre.przywara@arm.com>
	<20250801234918.19176-3-andre.przywara@arm.com>
	<3363499.aeNJFYEL58@jernej-laptop>
	<20250811165225.2a01a93d@donnerap.manchester.arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Aug 2025 16:52:25 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> On Mon, 11 Aug 2025 17:34:47 +0200
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> > Dne sobota, 2. avgust 2025 ob 01:49:17 Srednjeevropski poletni =C4=8Das=
 je Andre Przywara napisal(a): =20
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
> > > +	clock_init();   =20
> >=20
> > I contemplated similar change in past. It works fine for 64-bit archite=
ctures,
> > but I'm unsure for 32-bit. If you take a look at A83t clock code, it us=
es
> > sdelay() exactly because timer is not initialized at that time.
> >=20
> > So, are you sure that this change has no unwanted side effects? =20
>=20
> No, I am not ;-)
> I was about to test this on some more boards. But I think with the
> change in that direction, the only issue would be if the timer_init() code
> relies on the clocks being set up already. And since timer_init() is only
> *one* rather small function, just doing MMIO accesses, I think the risk is
> quite low.
>=20
> Thanks for having a look anyway, I will report back how the test goes.

Alright, I booted this patch on:
A10, A20, A33, V40, A80, A83T, T113s3, F1C100s, H3
(/me puts the mini-USB cables back into the shelf now)

For the A83T specifically, as a test, I replaced the sdelay() calls with
udelay() ones, and it hangs with mainline, but works with this patch.

So unless someone speaks up now, I am tempted to merge this patch.

Cheers,
Andre
