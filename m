Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A3A7F
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Jan 2023 01:15:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E406E1063;
	Tue,  3 Jan 2023 17:16:19 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46AA43F663;
	Tue,  3 Jan 2023 17:15:37 -0800 (PST)
Date: Wed, 4 Jan 2023 01:13:57 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/4] sunxi: move arch timer setup out of board/
 directory
Message-ID: <20230104011357.6b804946@slackpad.lan>
In-Reply-To: <a479d1eb-5652-b8b1-f449-fff4fb1a2448@sholland.org>
References: <20221214002244.31479-1-andre.przywara@arm.com>
	<20221214002244.31479-5-andre.przywara@arm.com>
	<a479d1eb-5652-b8b1-f449-fff4fb1a2448@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Dec 2022 00:14:49 -0600
Samuel Holland <samuel@sholland.org> wrote:

Hi Samuel,

thanks for having a look!

> On 12/13/22 18:22, Andre Przywara wrote:
> > At the moment we have an #ifdef-protected routine in
> > board/sunxi/board.c, which sets up the arch timer CNTFRQ register, if
> > that hasn't been done already.
> > This only applies to ARMv7 SoCs running in secure state, and so is
> > much better located in the arch/arm/mach-sunxi directory.
> > 
> > Move that routine into a separate function and file in said directory,
> > which also allows to trigger the compilation for ARMv7 in the Makefile.
> > Also move the call to it into the arch/arm version of board.c.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/mach-sunxi/Makefile     |  4 ++++
> >  arch/arm/mach-sunxi/arch_timer.c | 39 ++++++++++++++++++++++++++++++++
> >  arch/arm/mach-sunxi/board.c      | 14 ++++++++----
> >  board/sunxi/board.c              | 34 +---------------------------
> >  4 files changed, 54 insertions(+), 37 deletions(-)
> >  create mode 100644 arch/arm/mach-sunxi/arch_timer.c
> > 
> > diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
> > index 58f807cb82d..335c44476e9 100644
> > --- a/arch/arm/mach-sunxi/Makefile
> > +++ b/arch/arm/mach-sunxi/Makefile
> > @@ -26,8 +26,12 @@ obj-$(CONFIG_MACH_SUN8I)	+= clock_sun6i.o
> >  endif
> >  obj-$(CONFIG_MACH_SUN9I)	+= clock_sun9i.o gtbus_sun9i.o
> >  obj-$(CONFIG_SUN50I_GEN_H6)	+= clock_sun50i_h6.o
> > +
> >  ifndef CONFIG_ARM64
> >  obj-y	+= timer.o
> > +ifndef CONFIG_MACH_SUNIV  
> 
> Probably Allwinner will not release any new ARMv5 SoC, but would it be
> more future-proof (and a bit more meaningful) to condition this on
> CONFIG_CPU_V7A?

Ah, of course, I forgot about that symbol, and just saw !CONFIG_ARM64.

> Alternatively, would it make sense to put this code inside
> arch/arm/cpu/armv7/arch_timer.c? I don't know why we wouldn't want to
> enable CONFIG_SYS_ARCH_TIMER on sunxi SoCs where it is available. And
> making this generic could eventually remove the need for the version in
> arch/arm/cpu/armv7/nonsec_virt.S. But this patch is still an improvement
> as-is.

Yeah, that indeed sounds even better, I will give it a try. I guess
sunxi will stay the only user for now, but we can extend this later on.

Thanks for the suggestion!

Cheers,
Andre

> Tested-by: Samuel Holland <samuel@sholland.org>
> 
> > +obj-y	+= arch_timer.o
> > +endif
> >  endif
> >  
> >  ifdef CONFIG_SPL_BUILD
> > diff --git a/arch/arm/mach-sunxi/arch_timer.c b/arch/arm/mach-sunxi/arch_timer.c
> > new file mode 100644
> > index 00000000000..c0e4310741f
> > --- /dev/null
> > +++ b/arch/arm/mach-sunxi/arch_timer.c
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * ARM Generic Timer CNTFRQ setup
> > + *
> > + * (C) Copyright 2013 Oliver Schinagl <oliver@schinagl.nl>  
> 
> `git blame` points to cba69eeeaa67d3fb93ec6f3abab1f653abf895a9 and
> d96ebc468d0dff6eb6f069bba03b3f0e33aa22de as the source for this code, so
> this authorship is incorrect.
> 
> > + */
> > +
> > +#include <stdint.h>  
> 
> This does not do what you expect, or really anything at all. The comment
> there suggests using linux/types.h.
> 
> Regards,
> Samuel
> 
> > +#include <log.h>
> > +#include <asm/armv7.h>
> > +
> > +void setup_arch_timer(void)
> > +{
> > +	uint32_t id_pfr1, freq;
> > +
> > +	asm volatile("mrc p15, 0, %0, c0, c1, 1" : "=r"(id_pfr1));
> > +	debug("id_pfr1: 0x%08x\n", id_pfr1);
> > +	/* Generic Timer Extension available? */
> > +	if (((id_pfr1 >> CPUID_ARM_GENTIMER_SHIFT) & 0xf) == 0)
> > +		return;
> > +
> > +	/*
> > +	 * CNTFRQ is a secure register, so we will crash if we try to
> > +	 * write this from the non-secure world (read is OK, though).
> > +	 * In case some bootcode has already set the correct value,
> > +	 * we avoid the risk of writing to it.
> > +	 */
> > +	asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r"(freq));
> > +	if (freq == CONFIG_COUNTER_FREQUENCY)
> > +		return;
> > +
> > +	debug("arch timer frequency is %d Hz, should be %d, fixing ...\n",
> > +	      freq, CONFIG_COUNTER_FREQUENCY);
> > +	if (IS_ENABLED(CONFIG_NON_SECURE))
> > +		printf("arch timer frequency is wrong, but cannot adjust it\n");
> > +	else
> > +		asm volatile("mcr p15, 0, %0, c14, c0, 0"
> > +			     : : "r"(CONFIG_COUNTER_FREQUENCY));
> > +}
> > diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> > index 0c4b6dd1ca3..943f89eaa78 100644
> > --- a/arch/arm/mach-sunxi/board.c
> > +++ b/arch/arm/mach-sunxi/board.c
> > @@ -347,10 +347,6 @@ u32 spl_boot_device(void)
> >  	return sunxi_get_boot_device();
> >  }
> >  
> > -__weak void sunxi_sram_init(void)
> > -{
> > -}
> > -
> >  /*
> >   * When booting from an eMMC boot partition, the SPL puts the same boot
> >   * source code into SRAM A1 as when loading the SPL from the normal
> > @@ -434,10 +430,20 @@ u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
> >  	return result;
> >  }
> >  
> > +__weak void sunxi_sram_init(void)
> > +{
> > +}
> > +
> > +__weak void setup_arch_timer(void)
> > +{
> > +}
> > +
> >  void board_init_f(ulong dummy)
> >  {
> >  	sunxi_sram_init();
> >  
> > +	setup_arch_timer();
> > +
> >  #if defined CONFIG_MACH_SUN6I || defined CONFIG_MACH_SUN8I_H3
> >  	/* Enable non-secure access to some peripherals */
> >  	tzpc_init();
> > diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> > index 827e545032e..55501fafc38 100644
> > --- a/board/sunxi/board.c
> > +++ b/board/sunxi/board.c
> > @@ -34,9 +34,6 @@
> >  #include <asm/global_data.h>
> >  #include <linux/delay.h>
> >  #include <u-boot/crc.h>
> > -#ifndef CONFIG_ARM64
> > -#include <asm/armv7.h>
> > -#endif
> >  #include <asm/gpio.h>
> >  #include <asm/io.h>
> >  #include <u-boot/crc.h>
> > @@ -187,39 +184,10 @@ enum env_location env_get_location(enum env_operation op, int prio)
> >  /* add board specific code here */
> >  int board_init(void)
> >  {
> > -	__maybe_unused int id_pfr1, ret, satapwr_pin, macpwr_pin;
> > +	int ret, satapwr_pin, macpwr_pin;
> >  
> >  	gd->bd->bi_boot_params = (PHYS_SDRAM_0 + 0x100);
> >  
> > -#if !defined(CONFIG_ARM64) && !defined(CONFIG_MACH_SUNIV)
> > -	asm volatile("mrc p15, 0, %0, c0, c1, 1" : "=r"(id_pfr1));
> > -	debug("id_pfr1: 0x%08x\n", id_pfr1);
> > -	/* Generic Timer Extension available? */
> > -	if ((id_pfr1 >> CPUID_ARM_GENTIMER_SHIFT) & 0xf) {
> > -		uint32_t freq;
> > -
> > -		debug("Setting CNTFRQ\n");
> > -
> > -		/*
> > -		 * CNTFRQ is a secure register, so we will crash if we try to
> > -		 * write this from the non-secure world (read is OK, though).
> > -		 * In case some bootcode has already set the correct value,
> > -		 * we avoid the risk of writing to it.
> > -		 */
> > -		asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r"(freq));
> > -		if (freq != CONFIG_COUNTER_FREQUENCY) {
> > -			debug("arch timer frequency is %d Hz, should be %d, fixing ...\n",
> > -			      freq, CONFIG_COUNTER_FREQUENCY);
> > -#ifdef CONFIG_NON_SECURE
> > -			printf("arch timer frequency is wrong, but cannot adjust it\n");
> > -#else
> > -			asm volatile("mcr p15, 0, %0, c14, c0, 0"
> > -				     : : "r"(CONFIG_COUNTER_FREQUENCY));
> > -#endif
> > -		}
> > -	}
> > -#endif /* !CONFIG_ARM64 && !CONFIG_MACH_SUNIV */
> > -
> >  	ret = axp_gpio_init();
> >  	if (ret)
> >  		return ret;  
> 

