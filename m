Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CFD21CC5C;
	Mon, 20 Apr 2026 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776684449; cv=none; b=O4Lw7EDtRn3gCae7vgKr9YyiTsMpmvyHfni1cDH8Z2xDoFOPc8MJuEem9JeKqqcLp7jPkPiOyZjiY3rrARueU9+O1dfh02mR20y3OuF3XCxYNHX0VhNPwlH+WUx/YwNB7vuuhUNWdAstKU5iKI27CZC/A1ReE2aUtXzB7UweDA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776684449; c=relaxed/simple;
	bh=TERTCiIFZ32fS6aXGSReCbdHz3r70FRF0BazgeF316o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGAhvxQXKWMgQqqWooTbObT41iVY6kalTzn2IPmJrKqJ7GaJFwkXsVZg8k3cX2/WzqX/8O2Ay/cjO5I3ZYTg0Ao+hKrN/jZk8+G/pMZX/dJdWO8HirJwu5cwFmzDSxtKmPSKIka/cjXNrtzIfgRaFeEgHefbUTirQ/LwK3i1bsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=ganxum9C; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="ganxum9C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lO4PmKnC7RtL96EuNz/CUFLMcVWEDBDKT8ymENGeBy8=; b=ganxum9CGyKdrKnobefLwPs3nx
	va8yFYln0i0wQg6n/sHQ19tQfPRRCnupjhBrO4YdLQwVlAGw7gbQraA1DarMjNvJ9fcBIlmuFm2On
	778xQ/pKUhz5t274zVlvWqCZU7SZE/rdyZ29hpLlTbG4lqUkmCUjXlQiedNK1mrb5qOgiPAADOZrr
	Y+FWjpRb5D8LcdAuwqB4uCra2Exprf3C0dAe/wta6V4qVG+BKin9w4wLLyCfs0L8CHg5W8tuM33cw
	aBCGiLSPBe1Yshx6XRTmgnhg1AS0H7X2GlF+4iHaaWKn/5WTwm1KcOCiaqfjs7bSS5C0bEfhhTfhU
	hA8VH00g==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wEmmh-00000000c32-1qL8;
	Mon, 20 Apr 2026 13:27:23 +0200
Date: Mon, 20 Apr 2026 13:27:20 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/4] Add hstimer support for H616 and T113-S3
Message-ID: <xlvldmapdoql7nt3swube5vd6fdiosq7rt5afg246xertko5fa@4irmzupkar23>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
 <20260419225539.718367e0@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419225539.718367e0@ryzen.lan>
X-Authenticated-Id: michal.piekos@mmpsystems.pl

On Sun, Apr 19, 2026 at 10:55:39PM +0200, Andre Przywara wrote:
> On Sun, 19 Apr 2026 14:46:06 +0200
> Michal Piekos <michal.piekos@mmpsystems.pl> wrote:
> 
> Hi Michal,
> 
> > Add support for Allwinner H616 high speed timer in sun5i hstimer driver
> > and describe corresponding nodes in dts for H616 and T113-S3.
> > 
> > H616 uses same model as existing driver except register shift compared
> > to older variants. 
> > 
> > Added register layout abstraction in the driver, extended the binding
> > with new compatibles and wired up dts nodes for H616 and T113-S3 which
> > uses H616 as fallback compatible.
> 
> Can you say *why* we need this? IIUC Linux only ever uses one clock
> source, and selects the (non-optional) Generic Timer (aka arch timer)
> for that? So can you say what this hstimer clock source adds? I guess
> higher resolution, but what is your use case, so why would you need the
> 200 MHz? And does this offset the higher access cost of an MMIO
> access, compared to the arch timer's sysreg based access? Also, IIUC,
> people would need to manually select this as the clocksource, why and
> when would they do so? (Given they even know about it in the first
> place).
> Also the hstimer hasn't been used since the A20, so nobody seemed to
> have missed it meanwhile?
> 
> Cheers,
> Andre
>
I took the table from https://linux-sunxi.org/Linux_mainlining_effort as
a todo list and wanted to help with it. I do not have own use case for
this timer. If it is not needed then I will spin v2 to include your
comments and abandon it.

Michal

> > 
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> > Michal Piekos (4):
> >       dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and T113-S3
> >       clocksource/drivers/sun5i: add H616 hstimer support
> >       arm64: dts: allwinner: h616: add hstimer node
> >       arm: dts: allwinner: t113s: add hstimer node
> > 
> >  .../timer/allwinner,sun5i-a13-hstimer.yaml         |  8 +++-
> >  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 12 +++++
> >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  9 ++++
> >  drivers/clocksource/timer-sun5i.c                  | 56 +++++++++++++++++++---
> >  4 files changed, 78 insertions(+), 7 deletions(-)
> > ---
> > base-commit: faeab166167f5787719eb8683661fd41a3bb1514
> > change-id: 20260413-h616-t113s-hstimer-62939948f91c
> > 
> > Best regards,
> 
> 
