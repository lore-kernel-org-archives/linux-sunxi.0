Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70962C9A
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Nov 2021 03:07:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B78DE5C0118;
	Fri,  5 Nov 2021 23:07:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 05 Nov 2021 23:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	to:cc:references:from:subject:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=O
	z9FjvzDpPhPB8YqJoKPbrTu9bGL0kLj0e9yTR0S8Xc=; b=kyPC2EBICkQzbxBZX
	BT7aya1pvpAmaIGMrTkqK4hhoK1fDFz4pa7+5bevpPYLbA4DQ79pp/KzXbU3yA+Z
	voQZGmv6C0Ld/GWE61gWNSBXXNbH8922BfcKrOESywRWTxkGBlGQ81DENQj5piw9
	fZKizruuub/88BuihVkfzbUrVISavj6LoiLULZKF/kG73CKAH5/46razHy+LpqFf
	+WtabQS3DVw12b2yr4f4nDDBiDdZ6LZbcgzS8IaX+QbwCDy4bBMJFpKj3aIRgwCF
	+T67iszHN++fQp2FIJxt800iMnNC3IkAVlsxAq7mPsyQdfQ9m9vJJpx7HPgFPa8b
	phEvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=Oz9FjvzDpPhPB8YqJoKPbrTu9bGL0kLj0e9yTR0S8
	Xc=; b=duThD5lkmYPcdtH3oq8mWf4hxctxbfovK/tdFU8kQkTcYJ84EWfoQOaKy
	7hZZ1rlJCp2AzfbeDu98kHhVVUfZ4akaULYJvPqgm/G3NB7lLlrfpd22xpzHBduC
	Gk+3VTApndRTXdsV3uCib5QiOVrh4UzyTRZaXqxlMZeJNo/N6KSZaHZFMurYegxH
	3fUiHcRuO4Z7nE4Bz9MKzr6Dnwyu/T+0qvn7XU92UDVd2t68yEsFUn3PsLXlB07e
	LQf776f2sFj+zc+yOA0WpvTbnT/twyEYXHB30dIy2+Y/diwzpoWiUni017Si8BNv
	Oh0+hu5U9CSZWMz34ZiX9mV004X/w==
X-ME-Sender: <xms:YPGFYTvD_DgrBMupG9mDVYUkFB_bt8HjZCY5zY3ujyaScDFEogRc6g>
    <xme:YPGFYUc-YMcR9h-gIj72QgvL1SnmrfuYE6W62ycTs7ELJLbL9Pae-WZyGl5qA2l98
    u3pbf0A7TPmYoPDPA>
X-ME-Received: <xmr:YPGFYWymwk7gbdZjoUAHxhb_cZDLaJ_S5IFch4AASd6FFhcQaZrxa1LL7jWFsyvDJUR4mAMjBpVbrk_JGLEjr5SdRzT2jporEAhkdvoW3BYcvBpWALH4kDJeSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdejgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefvfhfhuffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedvtddtjeeiuddugfffveetkeffgeffgedutdfgfeekudevudekffeh
    tdefveeuvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:YPGFYSNQ2cJe2DOuNGygiGj2ktuFyCCPeVQAt1cYhqI2YDyCKGURUg>
    <xmx:YPGFYT9VDqst6dlpmkxp-92vzXRreVbhfHW1idJWCS7PZG1ngwtHow>
    <xmx:YPGFYSWCq2720GQuDIzJMIzRRaAgH3Ere2kK9NWvnhpYMXmDue-N3A>
    <xmx:YPGFYfYJHBrgpHf6ObQRdF2BKSwVOb3jOUKIg09YjLI6K3uNSL3-ww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 23:07:12 -0400 (EDT)
To: Icenowy Zheng <icenowy@sipeed.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20210722063015.421923-1-icenowy@sipeed.com>
 <20210722063015.421923-9-icenowy@sipeed.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 08/13] sunxi: add Kconfig option for R329
Message-ID: <89fb8491-3ee6-7659-33b3-11b8b23a6706@sholland.org>
Date: Fri, 5 Nov 2021 22:07:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210722063015.421923-9-icenowy@sipeed.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/22/21 1:30 AM, Icenowy Zheng wrote:
> As most code are ready for basic R329 support, let's add a Kconfig
> option for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>

with one minor comment below.

> ---
>  arch/arm/mach-sunxi/Kconfig    | 14 +++++++++++++-
>  arch/arm/mach-sunxi/cpu_info.c |  2 ++
>  common/spl/Kconfig             |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index c9bb47a8bd..9d3ec82497 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -128,6 +128,7 @@ config SUN8I_RSB
>  config SUNXI_SRAM_ADDRESS
>  	hex
>  	default 0x10000 if MACH_SUN9I || MACH_SUN50I || MACH_SUN50I_H5
> +	default 0x100000 if MACH_SUN50I_R329
>  	default 0x20000 if SUN50I_GEN_H6
>  	default 0x0
>  	---help---
> @@ -371,6 +372,12 @@ config MACH_SUN50I_H616
>  	select DRAM_SUN50I_H616
>  	select SUN50I_GEN_H6
>  
> +config MACH_SUN50I_R329
> +	bool "sun50i (Allwinner R329)"
> +	select ARM64
> +	select DRAM_SUN50I_R329
> +	select SUN50I_GEN_H6
> +
>  endchoice
>  
>  # The sun8i SoCs share a lot, this helps to avoid a lot of "if A23 || A33"
> @@ -420,7 +427,8 @@ config SUNXI_DRAM_LPDDR3
>  
>  choice
>  	prompt "DRAM Type and Timing"
> -	default SUNXI_DRAM_DDR3_1333 if !MACH_SUN8I_V3S
> +	default SUNXI_DRAM_DDR3_1333 if !MACH_SUN8I_V3S && !MACH_SUN50I_R329
> +	default SUNXI_DRAM_DDR3_R329 if MACH_SUN50I_R329
>  	default SUNXI_DRAM_DDR2_V3S if MACH_SUN8I_V3S

The first matching line is used, so you can reorder these to remove the
negations.

Regards,
Samuel

>  
>  config SUNXI_DRAM_DDR3_1333
> @@ -488,6 +496,7 @@ config DRAM_CLK
>  		       MACH_SUN8I_V3S
>  	default 672 if MACH_SUN50I
>  	default 744 if MACH_SUN50I_H6
> +	default 775 if MACH_SUN50I_R329
>  	default 720 if MACH_SUN50I_H616
>  	---help---
>  	Set the dram clock speed, valid range 240 - 480 (prior to sun9i),
> @@ -510,6 +519,7 @@ config DRAM_ZQ
>  		       MACH_SUN8I_A23 || MACH_SUN8I_A33 || MACH_SUN8I_A83T
>  	default 127 if MACH_SUN7I
>  	default 14779 if MACH_SUN8I_V3S
> +	default 3067 if MACH_SUN50I_R329
>  	default 3881979 if MACH_SUNXI_H3_H5 || MACH_SUN8I_R40 || MACH_SUN50I_H6
>  	default 4145117 if MACH_SUN9I
>  	default 3881915 if MACH_SUN50I
> @@ -616,6 +626,7 @@ config SYS_CLK_FREQ
>  	default 1008000000 if MACH_SUN9I
>  	default 888000000 if MACH_SUN50I_H6
>  	default 1008000000 if MACH_SUN50I_H616
> +	default 1008000000 if MACH_SUN50I_R329
>  
>  config SYS_CONFIG_NAME
>  	default "sun4i" if MACH_SUN4I
> @@ -627,6 +638,7 @@ config SYS_CONFIG_NAME
>  	default "sun50i" if MACH_SUN50I
>  	default "sun50i" if MACH_SUN50I_H6
>  	default "sun50i" if MACH_SUN50I_H616
> +	default "sun50i" if MACH_SUN50I_R329
>  
>  config SYS_BOARD
>  	default "sunxi"
> diff --git a/arch/arm/mach-sunxi/cpu_info.c b/arch/arm/mach-sunxi/cpu_info.c
> index ba33ef2430..8021f4c307 100644
> --- a/arch/arm/mach-sunxi/cpu_info.c
> +++ b/arch/arm/mach-sunxi/cpu_info.c
> @@ -101,6 +101,8 @@ int print_cpuinfo(void)
>  	puts("CPU:   Allwinner H6 (SUN50I)\n");
>  #elif defined CONFIG_MACH_SUN50I_H616
>  	puts("CPU:   Allwinner H616 (SUN50I)\n");
> +#elif defined CONFIG_MACH_SUN50I_R329
> +	puts("CPU:   Allwinner R329 (SUN50I)\n");
>  #else
>  #warning Please update cpu_info.c with correct CPU information
>  	puts("CPU:   SUNXI Family\n");
> diff --git a/common/spl/Kconfig b/common/spl/Kconfig
> index 2df3e5d869..ed4477ff93 100644
> --- a/common/spl/Kconfig
> +++ b/common/spl/Kconfig
> @@ -150,6 +150,7 @@ config SPL_TEXT_BASE
>  	hex "SPL Text Base"
>  	default ISW_ENTRY_ADDR if AM43XX || AM33XX || OMAP54XX || ARCH_KEYSTONE
>  	default 0x10060 if MACH_SUN50I || MACH_SUN50I_H5 || MACH_SUN9I
> +	default 0x100060 if MACH_SUN50I_R329
>  	default 0x20060 if SUN50I_GEN_H6
>  	default 0x00060 if ARCH_SUNXI
>  	default 0xfffc0000 if ARCH_ZYNQMP
> 

