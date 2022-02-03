Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF74B2F23
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Feb 2022 14:28:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63D901063;
	Thu,  3 Feb 2022 06:28:11 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 126C73F774;
	Thu,  3 Feb 2022 06:28:09 -0800 (PST)
Date: Thu, 3 Feb 2022 14:28:07 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jesse Taube
 <mr.bossman075@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] sunxi: move Cortex SMPEN setting into start.S
Message-ID: <20220203142807.76740967@donnerap.cambridge.arm.com>
In-Reply-To: <b63d95a1-42e9-27c7-920a-254e7d789f4d@sholland.org>
References: <20220201014116.25864-1-andre.przywara@arm.com>
	<20220201014116.25864-3-andre.przywara@arm.com>
	<b63d95a1-42e9-27c7-920a-254e7d789f4d@sholland.org>
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

On Wed, 2 Feb 2022 19:06:37 -0600
Samuel Holland <samuel@sholland.org> wrote:

Hi Samuel,

> On 1/31/22 7:41 PM, Andre Przywara wrote:
> > According to their TRMs, Cortex ARMv7 CPUs with SMP support require the
> > ACTLR.SMPEN bit to be set as early as possible, before any cache or TLB
> > maintenance operations are done. As we do those things still in start.S,
> > we need to move the SMPEN bit setting there, too.
> > 
> > This introduces a new ARMv7 wide symbol and code to set bit 6 in ACTLR
> > very early in start.S, and moves sunxi boards over to use that instead
> > of the custom code we had in our board.c file (where it was called
> > technically too late).
> > 
> > In practice we got away with this so far, because at this point all the
> > other cores were still in reset, so any broadcasting would have been
> > ignored anyway. But it is architecturally cleaner to do it early, and
> > we move a core specific piece of code out of board.c.
> > 
> > This also gets rid of the ARM_CORTEX_CPU_IS_UP kludge I introduced a few
> > years back, and moves the respective logic into the new Kconfig entry.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/Kconfig            |  3 ---
> >  arch/arm/cpu/armv7/Kconfig  |  5 +++++
> >  arch/arm/cpu/armv7/start.S  | 11 +++++++++++
> >  arch/arm/mach-sunxi/Kconfig |  6 ++++--
> >  arch/arm/mach-sunxi/board.c |  9 ---------
> >  5 files changed, 20 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 6b11c3a50d9..7893d74fab2 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -452,9 +452,6 @@ config ENABLE_ARM_SOC_BOOT0_HOOK
> >  	  values, then choose this option, and create a file included as
> >  	  <asm/arch/boot0.h> which contains the required assembler code.
> >  
> > -config ARM_CORTEX_CPU_IS_UP
> > -	bool
> > -
> >  config USE_ARCH_MEMCPY
> >  	bool "Use an assembly optimized implementation of memcpy"
> >  	default y if !ARM64
> > diff --git a/arch/arm/cpu/armv7/Kconfig b/arch/arm/cpu/armv7/Kconfig
> > index 60bb0a9e1ec..cc4684cfed3 100644
> > --- a/arch/arm/cpu/armv7/Kconfig
> > +++ b/arch/arm/cpu/armv7/Kconfig
> > @@ -76,4 +76,9 @@ config ARMV7_LPAE
> >  	Say Y here to use the long descriptor page table format. This is
> >  	required if U-Boot runs in HYP mode.
> >  
> > +config ARMV7_SET_CORTEX_SMPEN
> > +	bool
> > +	help
> > +	  Enable the ARM Cortex ACTLR.SMP enable bit on startup.
> > +
> >  endif
> > diff --git a/arch/arm/cpu/armv7/start.S b/arch/arm/cpu/armv7/start.S
> > index 698e15b8e18..af87a5432ae 100644
> > --- a/arch/arm/cpu/armv7/start.S
> > +++ b/arch/arm/cpu/armv7/start.S
> > @@ -173,6 +173,17 @@ ENDPROC(switch_to_hypervisor)
> >   *
> >   *************************************************************************/
> >  ENTRY(cpu_init_cp15)
> > +
> > +#if CONFIG_IS_ENABLED(ARMV7_SET_CORTEX_SMPEN)  
> 
> There is no SPL-prefixed symbol, so you probably want plain old "#if defined"
> here instead. Otherwise, this code will always be omitted from SPL.

Ouch, you are right, totally missed that. Actually we need that to be in
the SPL only. We need to enable it *once*, early on, so I changed the
symbol in the Kconfig now to have the SPL_ prefix. And I now verified that
in the objdump of the two start.o files (SPL and proper).

Do you reckon there would be problems with doing it only in the SPL? I
see that for 64-bit cores SPL and proper run in different environments,
but for v7 there should be no need to run all those cpu_init_cp15 code
again, right?
I will test it tonight with this change on some boards.

Thanks for having a look!

Cheers,
Andre

> 
> > +	/*
> > +	 * The Arm Cortex-A7 TRM says this bit must be enabled before
> > +	 * "any cache or TLB maintenance operations are performed".
> > +	 */
> > +	mrc	p15, 0, r0, c1, c0, 1	@ read auxilary control register
> > +	orr	r0, r0, #1 << 6		@ set SMP bit to enable coherency
> > +	mcr	p15, 0, r0, c1, c0, 1	@ write auxilary control register
> > +#endif
> > +
> >  	/*
> >  	 * Invalidate L1 I/D
> >  	 */
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index d7f9a03152f..637b1fb79e0 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -186,7 +186,6 @@ choice
> >  config MACH_SUN4I
> >  	bool "sun4i (Allwinner A10)"
> >  	select CPU_V7A
> > -	select ARM_CORTEX_CPU_IS_UP
> >  	select PHY_SUN4I_USB
> >  	select DRAM_SUN4I
> >  	select SUNXI_GEN_SUN4I
> > @@ -197,7 +196,6 @@ config MACH_SUN4I
> >  config MACH_SUN5I
> >  	bool "sun5i (Allwinner A13)"
> >  	select CPU_V7A
> > -	select ARM_CORTEX_CPU_IS_UP
> >  	select DRAM_SUN4I
> >  	select PHY_SUN4I_USB
> >  	select SUNXI_GEN_SUN4I
> > @@ -212,6 +210,7 @@ config MACH_SUN6I
> >  	select CPU_V7_HAS_NONSEC
> >  	select CPU_V7_HAS_VIRT
> >  	select ARCH_SUPPORT_PSCI
> > +	select ARMV7_SET_CORTEX_SMPEN
> >  	select DRAM_SUN6I
> >  	select PHY_SUN4I_USB
> >  	select SPL_I2C
> > @@ -227,6 +226,7 @@ config MACH_SUN7I
> >  	select CPU_V7_HAS_NONSEC
> >  	select CPU_V7_HAS_VIRT
> >  	select ARCH_SUPPORT_PSCI
> > +	select ARMV7_SET_CORTEX_SMPEN
> >  	select DRAM_SUN4I
> >  	select PHY_SUN4I_USB
> >  	select SUNXI_GEN_SUN4I
> > @@ -315,6 +315,7 @@ config MACH_SUN8I_V3S
> >  config MACH_SUN9I
> >  	bool "sun9i (Allwinner A80)"
> >  	select CPU_V7A
> > +	select ARMV7_SET_CORTEX_SMPEN
> >  	select DRAM_SUN9I
> >  	select SPL_I2C
> >  	select SUN6I_PRCM
> > @@ -365,6 +366,7 @@ endchoice
> >  # The sun8i SoCs share a lot, this helps to avoid a lot of "if A23 || A33"
> >  config MACH_SUN8I
> >  	bool
> > +	select ARMV7_SET_CORTEX_SMPEN if !ARM64
> >  	select SUN6I_PRCM
> >  	default y if MACH_SUN8I_A23
> >  	default y if MACH_SUN8I_A33
> > diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> > index c932a293317..261af9d7bf4 100644
> > --- a/arch/arm/mach-sunxi/board.c
> > +++ b/arch/arm/mach-sunxi/board.c
> > @@ -218,15 +218,6 @@ void s_init(void)
> >  	/* A83T BSP never modifies SUNXI_SRAMC_BASE + 0x44 */
> >  	/* No H3 BSP, boot0 seems to not modify SUNXI_SRAMC_BASE + 0x44 */
> >  #endif
> > -
> > -#if !defined(CONFIG_ARM_CORTEX_CPU_IS_UP) && !defined(CONFIG_ARM64)
> > -	/* Enable SMP mode for CPU0, by setting bit 6 of Auxiliary Ctl reg */
> > -	asm volatile(
> > -		"mrc p15, 0, r0, c1, c0, 1\n"
> > -		"orr r0, r0, #1 << 6\n"
> > -		"mcr p15, 0, r0, c1, c0, 1\n"
> > -		::: "r0");
> > -#endif
> >  }
> >  
> >  #define SUNXI_INVALID_BOOT_SOURCE	-1
> >   
> 

