Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C62F27
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Feb 2022 01:06:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id F0EFC5C01C8;
	Wed,  2 Feb 2022 20:06:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 02 Feb 2022 20:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; bh=tLqBrW2CKgW8ss
	1UV9T92D0A/GlyM/z+C6RKa1Yrqmk=; b=MLBghEBXz6JrB6apM0a6wiEMLWJ49a
	bpKwZeNc1XJwDRmJn1WXDC8htZ/6jci7BNndRI+s/auuVWDqZA1MNi4eJNvyBQX0
	KUmimY0KG8UbVorl8QBaz5ixss5Me1sF8lTI2mC4G4K0FKfYEcDNeHmODYP41uJ8
	FUau5cgtrt216yZJSEau6EcjCXOxYJe9bKN8DNFhZDLIJ/on3sWDz0tKZIjS6TB8
	KXDqP1WtDuOqk06J1cS34wf3LSI1IUbhjRxuQCWMT8Ltj9sw5ME+qyvZDkHSgXid
	ZOH4frOIYw+GhHElazOSUXql6Wy3SI04vrjYLNvc537kPtNRz8gmX2Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=tLqBrW2CKgW8ss1UV9T92D0A/GlyM/z+C6RKa1Yrq
	mk=; b=lPAHjGj6n7qvReMFDBLvAYc2MeC/xr0Jhxhcl0zUEfEcIp7dKuQZ96GPB
	mYwnTH+TnC7u9vo3U+s8DMTQ5I0b9NYOEVZ3ghmW7WEd4UA9Ya7YKNBz0KUtJc+e
	8IHyouf+X1WqCHqu63JlQgIxz2MAnNuSlId8r7ukRycipv9Pkyasjvk1H42XSen4
	53/as3bLvAYQGutfAEOcsehvHQdUMweZ7TR7tQTj769eT2+9I2Ub8PuMnfvZX0E9
	0jghZwfM9+2FGY3inc2XdLSu/EydkGwKoSCAonF1svy051FYGbjXsA95KG7WYOWQ
	hIJkzfvKeqEhy13bspPo5ZIknIAtQ==
X-ME-Sender: <xms:nir7Yb6QEr96WC0wG5-RnMFUA-1M8-4D74LQ0TvGgmascypDYvOZxA>
    <xme:nir7YQ5xEIRntQztirntKiQ9lFI_A3O2ldEqV1egpAdas_QkVV6CgCaYkGVg1QHsF
    S6kwcvolKg3Pf3l0A>
X-ME-Received: <xmr:nir7YScP21RWl2KI-D3OsnE-OqpQ5Fow-SBxTEVZJw8r2baK2CbIVWj63GHgQMZOpVXU0kmOmEFijAvAKC6M2bvAqUAuCEi8Erl_W3oNPjTJSBL4BwfeOfE5fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhuffvfhfkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefhheejgeffleelledvleetfeejheeggffhtdfhtdeuiefhheevieel
    udevtdejgeenucffohhmrghinhepshhtrghrthdrshgsnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:nir7YcLpuf-O5N0tFeVp4AgDumiLgGc3Zm2ciH_UjH3WpGUQe1R5MA>
    <xmx:nir7YfKXSOFNY3J0YiNNwEYj1QL2l4CLS9fJt-3GCymrROS2UFBMDw>
    <xmx:nir7YVy6apQeiBcFWsFWODGm1dlWH7X9pL0niOfotUNotf3D4RJySg>
    <xmx:nir7YW8PGPfJFxB68tu3wxoJU93gGsWYuIstUGi8hS80JN6vKPE5yw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 20:06:37 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 2/5] sunxi: move Cortex SMPEN setting into start.S
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20220201014116.25864-1-andre.przywara@arm.com>
 <20220201014116.25864-3-andre.przywara@arm.com>
Message-ID: <b63d95a1-42e9-27c7-920a-254e7d789f4d@sholland.org>
Date: Wed, 2 Feb 2022 19:06:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220201014116.25864-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/31/22 7:41 PM, Andre Przywara wrote:
> According to their TRMs, Cortex ARMv7 CPUs with SMP support require the
> ACTLR.SMPEN bit to be set as early as possible, before any cache or TLB
> maintenance operations are done. As we do those things still in start.S,
> we need to move the SMPEN bit setting there, too.
> 
> This introduces a new ARMv7 wide symbol and code to set bit 6 in ACTLR
> very early in start.S, and moves sunxi boards over to use that instead
> of the custom code we had in our board.c file (where it was called
> technically too late).
> 
> In practice we got away with this so far, because at this point all the
> other cores were still in reset, so any broadcasting would have been
> ignored anyway. But it is architecturally cleaner to do it early, and
> we move a core specific piece of code out of board.c.
> 
> This also gets rid of the ARM_CORTEX_CPU_IS_UP kludge I introduced a few
> years back, and moves the respective logic into the new Kconfig entry.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/Kconfig            |  3 ---
>  arch/arm/cpu/armv7/Kconfig  |  5 +++++
>  arch/arm/cpu/armv7/start.S  | 11 +++++++++++
>  arch/arm/mach-sunxi/Kconfig |  6 ++++--
>  arch/arm/mach-sunxi/board.c |  9 ---------
>  5 files changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 6b11c3a50d9..7893d74fab2 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -452,9 +452,6 @@ config ENABLE_ARM_SOC_BOOT0_HOOK
>  	  values, then choose this option, and create a file included as
>  	  <asm/arch/boot0.h> which contains the required assembler code.
>  
> -config ARM_CORTEX_CPU_IS_UP
> -	bool
> -
>  config USE_ARCH_MEMCPY
>  	bool "Use an assembly optimized implementation of memcpy"
>  	default y if !ARM64
> diff --git a/arch/arm/cpu/armv7/Kconfig b/arch/arm/cpu/armv7/Kconfig
> index 60bb0a9e1ec..cc4684cfed3 100644
> --- a/arch/arm/cpu/armv7/Kconfig
> +++ b/arch/arm/cpu/armv7/Kconfig
> @@ -76,4 +76,9 @@ config ARMV7_LPAE
>  	Say Y here to use the long descriptor page table format. This is
>  	required if U-Boot runs in HYP mode.
>  
> +config ARMV7_SET_CORTEX_SMPEN
> +	bool
> +	help
> +	  Enable the ARM Cortex ACTLR.SMP enable bit on startup.
> +
>  endif
> diff --git a/arch/arm/cpu/armv7/start.S b/arch/arm/cpu/armv7/start.S
> index 698e15b8e18..af87a5432ae 100644
> --- a/arch/arm/cpu/armv7/start.S
> +++ b/arch/arm/cpu/armv7/start.S
> @@ -173,6 +173,17 @@ ENDPROC(switch_to_hypervisor)
>   *
>   *************************************************************************/
>  ENTRY(cpu_init_cp15)
> +
> +#if CONFIG_IS_ENABLED(ARMV7_SET_CORTEX_SMPEN)

There is no SPL-prefixed symbol, so you probably want plain old "#if defined"
here instead. Otherwise, this code will always be omitted from SPL.

Regards,
Samuel

> +	/*
> +	 * The Arm Cortex-A7 TRM says this bit must be enabled before
> +	 * "any cache or TLB maintenance operations are performed".
> +	 */
> +	mrc	p15, 0, r0, c1, c0, 1	@ read auxilary control register
> +	orr	r0, r0, #1 << 6		@ set SMP bit to enable coherency
> +	mcr	p15, 0, r0, c1, c0, 1	@ write auxilary control register
> +#endif
> +
>  	/*
>  	 * Invalidate L1 I/D
>  	 */
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index d7f9a03152f..637b1fb79e0 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -186,7 +186,6 @@ choice
>  config MACH_SUN4I
>  	bool "sun4i (Allwinner A10)"
>  	select CPU_V7A
> -	select ARM_CORTEX_CPU_IS_UP
>  	select PHY_SUN4I_USB
>  	select DRAM_SUN4I
>  	select SUNXI_GEN_SUN4I
> @@ -197,7 +196,6 @@ config MACH_SUN4I
>  config MACH_SUN5I
>  	bool "sun5i (Allwinner A13)"
>  	select CPU_V7A
> -	select ARM_CORTEX_CPU_IS_UP
>  	select DRAM_SUN4I
>  	select PHY_SUN4I_USB
>  	select SUNXI_GEN_SUN4I
> @@ -212,6 +210,7 @@ config MACH_SUN6I
>  	select CPU_V7_HAS_NONSEC
>  	select CPU_V7_HAS_VIRT
>  	select ARCH_SUPPORT_PSCI
> +	select ARMV7_SET_CORTEX_SMPEN
>  	select DRAM_SUN6I
>  	select PHY_SUN4I_USB
>  	select SPL_I2C
> @@ -227,6 +226,7 @@ config MACH_SUN7I
>  	select CPU_V7_HAS_NONSEC
>  	select CPU_V7_HAS_VIRT
>  	select ARCH_SUPPORT_PSCI
> +	select ARMV7_SET_CORTEX_SMPEN
>  	select DRAM_SUN4I
>  	select PHY_SUN4I_USB
>  	select SUNXI_GEN_SUN4I
> @@ -315,6 +315,7 @@ config MACH_SUN8I_V3S
>  config MACH_SUN9I
>  	bool "sun9i (Allwinner A80)"
>  	select CPU_V7A
> +	select ARMV7_SET_CORTEX_SMPEN
>  	select DRAM_SUN9I
>  	select SPL_I2C
>  	select SUN6I_PRCM
> @@ -365,6 +366,7 @@ endchoice
>  # The sun8i SoCs share a lot, this helps to avoid a lot of "if A23 || A33"
>  config MACH_SUN8I
>  	bool
> +	select ARMV7_SET_CORTEX_SMPEN if !ARM64
>  	select SUN6I_PRCM
>  	default y if MACH_SUN8I_A23
>  	default y if MACH_SUN8I_A33
> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> index c932a293317..261af9d7bf4 100644
> --- a/arch/arm/mach-sunxi/board.c
> +++ b/arch/arm/mach-sunxi/board.c
> @@ -218,15 +218,6 @@ void s_init(void)
>  	/* A83T BSP never modifies SUNXI_SRAMC_BASE + 0x44 */
>  	/* No H3 BSP, boot0 seems to not modify SUNXI_SRAMC_BASE + 0x44 */
>  #endif
> -
> -#if !defined(CONFIG_ARM_CORTEX_CPU_IS_UP) && !defined(CONFIG_ARM64)
> -	/* Enable SMP mode for CPU0, by setting bit 6 of Auxiliary Ctl reg */
> -	asm volatile(
> -		"mrc p15, 0, r0, c1, c0, 1\n"
> -		"orr r0, r0, #1 << 6\n"
> -		"mcr p15, 0, r0, c1, c0, 1\n"
> -		::: "r0");
> -#endif
>  }
>  
>  #define SUNXI_INVALID_BOOT_SOURCE	-1
> 

