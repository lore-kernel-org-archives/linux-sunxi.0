Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B37727CB2C
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Apr 2025 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323890; cv=none; b=Ho6P/Ywj1RBPbRqDvELnHzBfk+0SQoXDjjrpG7Pw8yVtsiIU1qi4KOWhys7qbEhYx4SutgFyjdAn9XTBYQ13VVASMPgWk+PtHBuNs8y6JMI7S+iePTiKANZOHCgNcTX5yBVjdnT1hD4TE/W2eIzw68kKH2pkw/hezsVvij+CvAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323890; c=relaxed/simple;
	bh=ncbPxWN1XG2klURysCmMiapz+hRkEhgDis6AlnJOE/o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ImMnQP/0qE3Rh7ah/hP/kkFWT7Ky8WMqZeiQI/wNxwRjve2zOnr0tHFfxXUxSF2IRah13i6SWvrYSAqo1q7cpq+JInIWVo7a6No1O4CxyeSxTEtN71qjb4U0R0nXtOZwMQUaUj8DTlZTsqwjVstXuHFHp0Y1Ye7tWp59cvVDOSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFAB3152B;
	Tue, 22 Apr 2025 05:11:21 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2289E3F66E;
	Tue, 22 Apr 2025 05:11:25 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:11:21 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>, <u-boot@lists.denx.de>, Yixun
 Lan <dlan@gentoo.org>, Tom Rini <trini@konsulko.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v2 2/3] sunxi: add "fake" FEL pin support
Message-ID: <20250422131121.7a491909@donnerap.manchester.arm.com>
In-Reply-To: <e2d354dd-4be6-45b0-b263-7112b9320692@cherry.de>
References: <20250417000539.3709-1-andre.przywara@arm.com>
	<20250417000539.3709-3-andre.przywara@arm.com>
	<b7ffc468-1970-4eba-85e1-47aaced0161a@cherry.de>
	<20250421222939.69832f73@minigeek.lan>
	<e2d354dd-4be6-45b0-b263-7112b9320692@cherry.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 12:49:40 +0200
Quentin Schulz <quentin.schulz@cherry.de> wrote:

Hi,

> Hi Andre and Yixun Lan,
> 
> On 4/21/25 11:29 PM, Andre Przywara wrote:
> > On Fri, 18 Apr 2025 13:28:23 +0200
> > Quentin Schulz <quentin.schulz@cherry.de> wrote:
> > 
> > Hi Quentin,
> > 
> > thanks for having a look!
> >   
> >> Hi Andre,
> >>
> >> On 4/17/25 2:05 AM, Andre Przywara wrote:  
> >>> Some boards with Allwinner SoCs feature a "FEL" key, sometimes also
> >>> labelled "uboot", which triggers the BootROM FEL mode, when pressed upon
> >>> power-on or reset. This allows to access the SoC's memory via USB OTG,
> >>> and to upload and execute code. There is a tool to upload our U-Boot image
> >>> and immediately boot it, when the SoC is in FEL mode.
> >>>
> >>> To mimic this convenient behaviour on boards without such a dedicated key,
> >>> we can query a GPIO pin very early in the SPL boot, then trigger the
> >>> BootROM FEL routine.  There has not been much of a SoC or board setup at
> >>> this point, so we enter the BROM in a rather pristine state still. On
> >>> 64-bit SoCs the required AArch32 reset guarantees a clean CPU state anyway.
> >>>
> >>> Any GPIO can be used for that, the signal is expected to be active low,
> >>> consequently we enable the pull-up resistors for that pin. A board (or a
> >>> user) is expected to specify the GPIO name using the
> >>> CONFIG_SUNXI_FAKE_FEL_PIN Kconfig variable. When this variable is not set,
> >>> the compiler will optimise away the call.
> >>>
> >>> Call the code first thing in board_init_f(), which is the first sunxi
> >>> specific C routine.
> >>>
> >>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >>> ---
> >>>    arch/arm/mach-sunxi/Kconfig | 10 ++++++++++
> >>>    arch/arm/mach-sunxi/board.c | 31 +++++++++++++++++++++++++++++++
> >>>    2 files changed, 41 insertions(+)
> >>>
> >>> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> >>> index ab432390d3c..f1cfdb548bc 100644
> >>> --- a/arch/arm/mach-sunxi/Kconfig
> >>> +++ b/arch/arm/mach-sunxi/Kconfig
> >>> @@ -825,6 +825,16 @@ config USB3_VBUS_PIN
> >>>    	---help---
> >>>    	See USB1_VBUS_PIN help text.
> >>>    
> >>> +config SUNXI_FAKE_FEL_PIN
> >>> +	string "fake FEL GPIO pin"
> >>> +	default ""
> >>> +	---help---
> >>> +	Define a GPIO that shall force entering FEL mode when a button
> >>> +	connected to this pin is pressed at boot time. This must be an
> >>> +	active low signal, the internal pull-up resistors are activated.
> >>> +	This takes a string in the format understood by sunxi_name_to_gpio,
> >>> +	e.g. PH1 for pin 1 of port H.
> >>> +  
> >>
> >> Why not use the DT for that? Then you wouldn't even need to assume the
> >> polarity of the signal or whether pull-up/downs need to be activated, etc.  
> > 
> > As Yixun Lan already pointed out, the DT is not available at this
> > point, and doing several pull-ups to get this information from the DT
> > into the SPL image are really over the top for this purpose.  
> 
> OK, we do have something "similar" for Rockchip boards, via the 
> sysreset-gpio DT property in /config, see 
> arch/arm/mach-rockchip/rk3399/rk3399.c and 
> arch/arm/dts/rk3399-puma-haikou-u-boot.dtsi.
> 
> I guess something similar could be implemented IFF there's an actual DT 
> in SPL (or even TPL). We for sure have DT in SPL for most if not all 
> Rockchip devices, and probably in TPL as well. Hence why I sometimes 
> forget other Arm boards may not have DT in those stages :)

Yeah, I know, there is some push for DT anywhere, but it would be quite
some pain for sunxi, for very little benefit. We are very tight in the SPL
code size for some SoCs, up to the point where for instance enabling this
code here made the build break on some SoCs (I found something to free
some code space elsewhere, might send that later). So pulling libfdt and
DM code in would require going TPL, I guess. But I don't see the reason,
really, as I tend to see the SPL more as the continuation of the BootROM,
which manages without board specific knowledge at all. And for the small
bits of info we need, we can happily use Kconfig. Most of it is actually
SoC specific, not board specific, so users don't get bothered normally,
and it just works (TM).
There is tons of work and cleanup to do on the sunxi side, and were
already have quite some backlog, so I want to avoid introducing more
construction sites.

> > This is more a sweet hacker device: I often have devices with eMMC and
> > SPI flash, but without a FEL button. So the idea was to just pick a
> > GPIO and use menuconfig to set it. Then I could just connect this pin
> > to GND during boot, to get into FEL and test-boot firmware. "Connect to
> > GND" could really be a jumper or even the tip of a screwdriver ;-)
> > So I don't think this qualifies to being defined in the DT, really.
> >   
> 
> If I understood correctly, this GPIO is essentially not fixed, you just 
> pick a random one that you like and have access to and it may differ 
> depending on the user I guess?

Depends, for some boards which have this button (X96 Mate) it's more
obvious, but yeah, I wanted to keep this hackable, so DT wouldn't be a
good place anyway.

> Then yeah, I understand.
> 
> Can you please specify this in the commit log and also why we are not 
> going the DT route (if I read correctly, in addition to it not being 
> suitable for DT due to the ability to the function being available on 
> any unused GPIO, there's also no DT available in the stage when this 
> needs to be done?).

Sure, will do.

> >> You can have the property in the -u-boot.dtsi then if you want?
> >>
> >> While the FEL button on the X96 is "fake", it does what it says, just in
> >> software, maybe that is close enough to "hardware definition" which
> >> would make it suitable for the DT (well, we also store binman nodes in  
> > 
> > Yes, I have a patch to add this particular button as a GPIO button into
> > the DT, so people can use it for whatever they want in Linux (trigger
> > reboot, update, you name it). But this is rather orthogonal to this
> > problem, as mentioned above.
> >   
> 
> Mmmmm but this will be in the Linux kernel DT and I assume you want the 
> same GPIO to be used in U-Boot and in Linux, so it would probably be 
> best to make sure they stay in sync? How are you planning to do that?

On the Allwinner side we were syncing the DTs regularly for years already,
and had no conflicting or different bindings at all. So I prefer to think
of "the DT", with Linux or U-Boot just carrying slightly different
versions for some time.

Some SoCs (and all upcoming ones) use OF_UPSTREAM now, but I cannot roll
this out to everyone, because there was one compatibility break in the DT
in the past, and I want to keep support for older kernels with the U-Boot
copy of the DT, so that the Debian Bullseye kernel on an installer USB
drive would still work, for instance.

Cheers,
Andre
