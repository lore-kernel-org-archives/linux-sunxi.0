Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B0C5349CD
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171695; cv=none; b=J2kskExkNlHg9DFuuWSoeQXFWs4M3Vw+GgogaNx4XVoK86RSCD3b6IqKTOLwkpIStj71yE7N6cL7XDGGcDWFUBh5rSnJA2PG3DEa3wYvgqLvPtdbTwW6ygQTzNB5RGwvFkaDL+FcrVr5GY4K7ViN1zbUsAzRTuXHm5WR47ptPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171695; c=relaxed/simple;
	bh=pcBT9zHT1D+p03B66uMDp4qvamCxtc5RSZ9WpV6l/DQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uT9rb5iS+wJ4F7twShupd+XoQbjA7DvcIw5LyXto/SMaKXxeSkiedhI1WUJt5SB9SQ8QSX1uaTA95/nGdGtOnUrPYmNFUmRQbqghyu/QaftUN/WpA6p6GWjA7JY/Sa3kbIXc0UCleUNgw1WCNzjA8xxR0+jP1VWAgWhQctfwJJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Fvy5KhrW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Fvy5KhrW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65EC51477;
	Fri, 16 Oct 2026 10:28:10 -0700 (PDT)
Received: from [10.33.8.90] (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E22513F673;
	Fri, 16 Oct 2026 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792171693; bh=pcBT9zHT1D+p03B66uMDp4qvamCxtc5RSZ9WpV6l/DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fvy5KhrWczzctkoGURksT06H7dsNSNdQre6J2qKdGtJ2H00abbO9LkyMRVuYfzQub
	 U3oGyEemBCSx0QAMC3TA9BdF6ygcDcSeR1nhAHOrf+WdHozoHSsvnK2il5UXq6MZ41
	 UFEZ7S4nzDI4NaZfTAmI7Mj1FPeeQ74LGU1mDTuc=
Message-ID: <40856b24-1767-4fda-89af-11c51d3ec816@arm.com>
Date: Fri, 16 Oct 2026 18:28:11 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] sunxi: add the Allwinner B288 and the PocketBook
 Verse
To: Pablo Mazzini <pmazzini@gmail.com>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, linux-sunxi@lists.linux.dev
References: <20261016091608.121842-1-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261016091608.121842-1-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pablo,

On 10/16/26 11:16, Pablo Mazzini wrote:
> The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
> readers. This series adds SPL and U-Boot support for it, and one board:
> the PocketBook Verse (PB629).
 > > The DT is still under review for Linux. Until it reaches
> dts/upstream, the last patch carries a copy in arch/arm/dts.

Thanks for sending this, much appreciated. I had a coarse look over 
this, and this looks fine on the first glance.
As you said, this is somewhat blocked on the DT merge on the Linux side, 
which will probably not happen this year anymore (v7.5-rc1 would be the 
earliest).
But meanwhile, in preparation for that, could you please reorder the 
patches, so you enable the devices first (clocks, pinctrl, mmc), then 
DRAM, then the general support patch, with the defconfig on top.

For the DT parts: please try to emulate the future situation, so put the 
files in the directories where they would end up eventually. You can try 
to take the Linux DT binding patch (for clock and reset), and just 
change the paths in there to point to the respective dts/upstream 
directories. This is what would happen anyway, look for those 
cherry-picks and upstream references in the dts/upstream git log.
And the patch(es) wouldn't be taken as such anyway, but they provide a 
test base and reference for other people, until the DT lands.

There is no need to send a new version now, just wait until you receive 
some review or other comments.

Cheers,
Andre

> 
> Tested on a PB629.
> 
> Pablo Mazzini (7):
>    sunxi: add support for the Allwinner B288
>    sunxi: dram: support the Allwinner B288
>    dt-bindings: clock: add the Allwinner B288 CCU
>    clk: sunxi: add the Allwinner B288 gates and resets
>    pinctrl: sunxi: add the Allwinner B288 PIO
>    mmc: sunxi: B288 mmc0/mmc1 run off PLL_PERIPH0 2x
>    sunxi: add the PocketBook Verse
> 
>   arch/arm/cpu/armv7/sunxi/psci.c              |   9 +-
>   arch/arm/dts/Makefile                        |   2 +
>   arch/arm/dts/sun8i-b288-pocketbook-verse.dts | 114 ++++++++
>   arch/arm/dts/sun8i-b288.dtsi                 | 292 +++++++++++++++++++
>   arch/arm/include/asm/arch-sunxi/cpu.h        |   1 +
>   arch/arm/include/asm/arch-sunxi/cpu_sun4i.h  |  16 +-
>   arch/arm/mach-sunxi/Kconfig                  |  14 +
>   arch/arm/mach-sunxi/board.c                  |   4 +
>   arch/arm/mach-sunxi/clock_sun6i.c            |   1 +
>   arch/arm/mach-sunxi/cpu_info.c               |   2 +
>   arch/arm/mach-sunxi/dram_sunxi_dw.c          |  97 +++++-
>   board/sunxi/MAINTAINERS                      |   6 +
>   configs/pocketbook_verse_defconfig           |  10 +
>   drivers/clk/sunxi/Kconfig                    |   7 +
>   drivers/clk/sunxi/Makefile                   |   1 +
>   drivers/clk/sunxi/clk_b288.c                 | 101 +++++++
>   drivers/clk/sunxi/clk_sunxi.c                |   5 +
>   drivers/mmc/sunxi_mmc.c                      |   7 +
>   drivers/pinctrl/sunxi/Kconfig                |   5 +
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c        |  22 ++
>   include/dt-bindings/clock/sun8i-b288-ccu.h   |  82 ++++++
>   include/dt-bindings/reset/sun8i-b288-ccu.h   |  45 +++
>   include/sunxi_gpio.h                         |   1 +
>   23 files changed, 827 insertions(+), 17 deletions(-)
>   create mode 100644 arch/arm/dts/sun8i-b288-pocketbook-verse.dts
>   create mode 100644 arch/arm/dts/sun8i-b288.dtsi
>   create mode 100644 configs/pocketbook_verse_defconfig
>   create mode 100644 drivers/clk/sunxi/clk_b288.c
>   create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
>   create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h
> 
> 
> base-commit: 65a7532545336e4b73e049a69436e255da7df961

