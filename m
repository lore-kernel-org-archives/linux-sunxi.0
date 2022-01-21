Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58242173
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jan 2022 16:44:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77B2E101E;
	Fri, 21 Jan 2022 08:44:00 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AA693F73D;
	Fri, 21 Jan 2022 08:43:59 -0800 (PST)
Date: Fri, 21 Jan 2022 16:43:56 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Chris Morgan
 <macroalpha82@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH v2 2/2] sunxi: Add option to prevent booting on power
 plug-in
Message-ID: <20220121164356.735defb0@donnerap.cambridge.arm.com>
In-Reply-To: <SN6PR06MB5342B270F3679AC56A297553A55B9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220121133732.2397273-1-andre.przywara@arm.com>
	<20220121133732.2397273-3-andre.przywara@arm.com>
	<SN6PR06MB5342B270F3679AC56A297553A55B9@SN6PR06MB5342.namprd06.prod.outlook.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Jan 2022 10:35:33 -0600
Chris Morgan <macromorgan@hotmail.com> wrote:

Hi Chris,

> On Fri, Jan 21, 2022 at 01:37:32PM +0000, Andre Przywara wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > For sunxi boards with the AXP209, AXP221, AXP809, and AXP818 PMICs
> > (plus possibly others, I only confirmed the datasheets for these),
> > it is sometimes desirable to not boot whenever the device is
> > plugged in. An example would be when using the NTC CHIP inside a
> > PocketCHIP.
> > This provides a configurable option to check if bit 0 of
> > register 0 of the PMIC says it was powered because of a power button
> > press (0) or a plug-in event (1). If the value is 1 and this option
> > is selected, the device shuts down shortly after printing a message
> > to console stating the reason why it's shutting down. Powering up the
> > board with the power button is not affected.  
> 
> Tested-By: Chris Morgan <macromorgan@hotmail.com>

Thanks (although please refrain from using this tag if it's actually
broken, as you point out below)

> 
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > [Andre: reword to speak of boot, remove #ifdefs]
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > 
> > adapt board.c to generic AXP symbols
> > ---
> >  arch/arm/mach-sunxi/Kconfig | 10 ++++++++++
> >  board/sunxi/board.c         | 11 +++++++++++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index 2c18cf02d1..d7f9a03152 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -785,6 +785,16 @@ config AXP_GPIO
> >  	---help---
> >  	Say Y here to enable support for the gpio pins of the axp PMIC ICs.
> >  
> > +config AXP_DISABLE_BOOT_ON_POWERON
> > +	bool "Disable device boot on power plug-in"
> > +	depends on AXP209_POWER || AXP221_POWER || AXP809_POWER || AXP818_POWER
> > +	default n
> > +	---help---
> > +	  Say Y here to prevent the device from booting up because of a plug-in
> > +	  event. When set, the device will boot into the SPL briefly to
> > +	  determine why it was powered on, and if it was determined because of
> > +	  a plug-in event instead of a button press event it will shut back off.
> > +
> >  config VIDEO_SUNXI
> >  	bool "Enable graphical uboot console on HDMI, LCD or VGA"
> >  	depends on !MACH_SUN8I_A83T
> > diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> > index fdbcd40269..3b5e7f3cdc 100644
> > --- a/board/sunxi/board.c
> > +++ b/board/sunxi/board.c
> > @@ -27,6 +27,7 @@
> >  #include <asm/arch/dram.h>
> >  #include <asm/arch/mmc.h>
> >  #include <asm/arch/prcm.h>
> > +#include <asm/arch/pmic_bus.h>
> >  #include <asm/arch/spl.h>
> >  #include <asm/global_data.h>
> >  #include <linux/delay.h>
> > @@ -601,6 +602,16 @@ void sunxi_board_init(void)
> >  	defined CONFIG_AXP809_POWER || defined CONFIG_AXP818_POWER
> >  	power_failed = axp_init();
> >  
> > +	if (IS_ENABLED(AXP_DISABLE_BOOT_ON_POWERON) && !power_failed) {  
> 
> This doesn't work for me unless I change this to
> IS_ENABLED(CONFIG_AXP_DISABLE_BOOT_ON_POWERON)

Argh, of course, the usual mix up between CONFIG_IS_ENABLED and IS_ENABLED
;-)
I guess you meant with the rest of the line (&& !power_failed) as well?

I will give it some testing tonight, then queue this, if nobody screams.

Cheers,
Andre.


> 
> With this change though, it works just fine on my use case.
> 
> > +		u8 boot_reason;
> > +
> > +		pmic_bus_read(AXP_POWER_STATUS, &boot_reason);
> > +		if (boot_reason & AXP_POWER_STATUS_ALDO_IN) {
> > +			printf("Power on by plug-in, shutting down.\n");
> > +			pmic_bus_write(0x32, BIT(7));
> > +		}
> > +	}
> > +
> >  #if defined CONFIG_AXP221_POWER || defined CONFIG_AXP809_POWER || \
> >  	defined CONFIG_AXP818_POWER
> >  	power_failed |= axp_set_dcdc1(CONFIG_AXP_DCDC1_VOLT);
> > -- 
> > 2.25.1
> >   

