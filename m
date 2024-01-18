Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A1B12B71
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Jan 2024 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705568212; cv=none; b=u4Utr1HTiD6+qqocp4SjdBWgef0M44WBfrLW3yR7g7UIcQj2KOizXNxjLNNWOtvBhgAMyc0w5jdwC9f4qdDJZiXYG2/ASc0waeil9xTIQ99syXEFFB/ceo88USv+IwmRocSbqj7DRLEYyqofRP1pOgHqFgiMC3D/WniOUL3Bu2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705568212; c=relaxed/simple;
	bh=vULAl46BBydQR4ps2jMZiFaBG2168vzYuRJQjRETXmM=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=rHW63XtV3ilOE98m9JZBb7UqdI1V3LMRLGtClyIaH1rW9Z4HWkZLRp78734g3Q/Q+0imJ1n4rxSOmj1R2Gge1kBLt0bE6o/rxHAPFrwN22QXcX3N7bsL+uq9pjk8awDz9Q7ejej4iZdygQYAyD2D3e375oCkvtlot/q++nHrkdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=Gw04zt0W; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="Gw04zt0W"
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 8CA6960547;
	Thu, 18 Jan 2024 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1705568209;
	bh=vULAl46BBydQR4ps2jMZiFaBG2168vzYuRJQjRETXmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gw04zt0Wpjy9eWoxk2lS2uRHPyetKndWTDy1xt3tVGx6vKHlNkOkWIOKrTzvdlw/9
	 66hcjRDA6awFbthpcjUwMl9Ag054ol8J7CDoqS8Ylxom3qRjvEEiO42kKCJd7piKXG
	 /pBdyyWMFJWk62EFvYAkz/ET12d+9KZ1ZrUe4VIu/KG0WZBdK7YpSKhh2xshMli9/S
	 gVVlFTKdKDM0zIga8bgoPdDQsFxhXBtVWbkeetqLrliFyg9Pu7b1qV6J7RCc90wGT2
	 zl6zEaNx93DQC83AFSlIeGXIbiPEfkOHUAzePS1mHU6/9kjkvMvgRKFiAOeMPcANkR
	 mknuZHXKNV/qg==
Date: Thu, 18 Jan 2024 10:55:51 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andrew Davis <afd@ti.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Adam Ford <aford173@gmail.com>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 08/11] ARM: dts: DRA7xx: Add device tree entry for SGX GPU
Message-ID: <20240118085551.GQ5185@atomide.com>
References: <20240109171950.31010-1-afd@ti.com>
 <20240109171950.31010-9-afd@ti.com>
 <20240110082924.GA5185@atomide.com>
 <55efd488-c6a0-4dca-baea-1fa93d13dd17@ti.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55efd488-c6a0-4dca-baea-1fa93d13dd17@ti.com>

* Andrew Davis <afd@ti.com> [240117 15:52]:
> On 1/10/24 2:29 AM, Tony Lindgren wrote:
> > * Andrew Davis <afd@ti.com> [240109 17:20]:
> > > --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > > @@ -850,12 +850,19 @@ target-module@56000000 {
> > >   					<SYSC_IDLE_SMART>;
> > >   			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> > >   					<SYSC_IDLE_NO>,
> > > -					<SYSC_IDLE_SMART>;
> > > +					<SYSC_IDLE_SMART>,
> > > +					<SYSC_IDLE_SMART_WKUP>;
> > 
> > You probably checked this already.. But just in case, can you please
> > confirm this is intentional. The documentation lists the smart wakeup
> > capability bit as reserved for dra7, maybe the documentation is wrong.
> > 
> 
> It was an intentional change, although I'm not sure it is correct :)
> 
> This is how we had it in our "evil vendor tree" for years (back when it
> was hwmod based), so when converting these nodes to use "ti,sysc" I noticed
> this bit was set, but as you point out the documentation disagrees.
> 
> I'd rather go with what has worked before, but it doesn't seem to
> break anything either way, so we could also break this change out into
> its own patch if you would prefer.

I agree it's best to stick what is known to work. How about let's add
the related information to the patch description?

Regards,

Tony
