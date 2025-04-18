Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F3D22F17B
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Apr 2025 22:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745016679; cv=none; b=Hjt9mJrKKiRtjSsjjThVRh+dr7/56IExLItW3YeC3POOTZAAJsJ2oP8C4t7YPu7TJ9jlYtaOT70E4uo97+fQFERsb7a6XGm8Wpc/WBDrrlg2qVFY0gQb3RFYdIQ9BzbUUnn7lmUa+zLw8eFZlnvg8R9pQWQQitIoQgMIv4nPFbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745016679; c=relaxed/simple;
	bh=emV3dKaOYasoNpwY47tGAaU3+OcbfsDYs73KayC6BcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoZ9roUmzIb078sVUBE42j3naaV7Pq+4otLZ6+s46A8ULwPtGChVBvnB6FnBmd+e4J98bGPe5YNftg5FGw1G1W3U1H0hiNihPG44MJtm5pX5rzIhWSfkyqR8dBZznUwdrWeD/dMeAN2AXOt5mlZBYI5v+QhopVGAPzNJghfhXHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 30DD0342FF8;
	Fri, 18 Apr 2025 22:51:13 +0000 (UTC)
Date: Fri, 18 Apr 2025 22:51:04 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] sunxi: add "fake" FEL pin support
Message-ID: <20250418225104-GYA37749@gentoo>
References: <20250417000539.3709-1-andre.przywara@arm.com>
 <20250417000539.3709-3-andre.przywara@arm.com>
 <b7ffc468-1970-4eba-85e1-47aaced0161a@cherry.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7ffc468-1970-4eba-85e1-47aaced0161a@cherry.de>

Hi

On 13:28 Fri 18 Apr     , Quentin Schulz wrote:
> Hi Andre,
> 
> On 4/17/25 2:05 AM, Andre Przywara wrote:
> > Some boards with Allwinner SoCs feature a "FEL" key, sometimes also
> > labelled "uboot", which triggers the BootROM FEL mode, when pressed upon
> > power-on or reset. This allows to access the SoC's memory via USB OTG,
> > and to upload and execute code. There is a tool to upload our U-Boot image
> > and immediately boot it, when the SoC is in FEL mode.
> > 
> > To mimic this convenient behaviour on boards without such a dedicated key,
> > we can query a GPIO pin very early in the SPL boot, then trigger the
> > BootROM FEL routine.  There has not been much of a SoC or board setup at
> > this point, so we enter the BROM in a rather pristine state still. On
> > 64-bit SoCs the required AArch32 reset guarantees a clean CPU state anyway.
> > 
> > Any GPIO can be used for that, the signal is expected to be active low,
> > consequently we enable the pull-up resistors for that pin. A board (or a
> > user) is expected to specify the GPIO name using the
> > CONFIG_SUNXI_FAKE_FEL_PIN Kconfig variable. When this variable is not set,
> > the compiler will optimise away the call.
> > 
> > Call the code first thing in board_init_f(), which is the first sunxi
> > specific C routine.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >   arch/arm/mach-sunxi/Kconfig | 10 ++++++++++
> >   arch/arm/mach-sunxi/board.c | 31 +++++++++++++++++++++++++++++++
> >   2 files changed, 41 insertions(+)
> > 
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index ab432390d3c..f1cfdb548bc 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -825,6 +825,16 @@ config USB3_VBUS_PIN
> >   	---help---
> >   	See USB1_VBUS_PIN help text.
> >   
> > +config SUNXI_FAKE_FEL_PIN
> > +	string "fake FEL GPIO pin"
> > +	default ""
> > +	---help---
> > +	Define a GPIO that shall force entering FEL mode when a button
> > +	connected to this pin is pressed at boot time. This must be an
> > +	active low signal, the internal pull-up resistors are activated.
> > +	This takes a string in the format understood by sunxi_name_to_gpio,
> > +	e.g. PH1 for pin 1 of port H.
> > +
> 
> Why not use the DT for that? Then you wouldn't even need to assume the 
> polarity of the signal or whether pull-up/downs need to be activated, etc.
> 
> You can have the property in the -u-boot.dtsi then if you want?
> 
I've raised similar question in v1, but it's in SPL which has no DT available
see Andre's commment
https://lore.kernel.org/all/20250409110126.2cc59d30@donnerap.manchester.arm.com/

maybe better add a SPL prefix to config? or some info in help docs to
state clearly it should only work in SPL phase?

> While the FEL button on the X96 is "fake", it does what it says, just in 
> software, maybe that is close enough to "hardware definition" which 
> would make it suitable for the DT (well, we also store binman nodes in 
> the DT, which aren't strictly speaking hardware definition either :) ).
> 
> Cheers,
> Quentin

-- 
Yixun Lan (dlan)
