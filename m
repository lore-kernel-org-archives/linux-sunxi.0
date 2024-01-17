Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6061E86E
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Jan 2024 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705499582; cv=none; b=o3SB9yRFeGPzQTVqqXKCcnLe6qwz2XCtigjR5YW/WzMkki0ukAc710ohTyIApyW4Z8ocVX+TLeEYWp2ObG1I4M5dtPWEz8+uMbgEQ+c2SO5LklMKYEH4TeP+X5mrVnFKDNfVUTCFVpkEBJn2ySKxIja1TmpsY4avWKgRXLl1DSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705499582; c=relaxed/simple;
	bh=2tU5LhRm2eRtGmhV5K7NjxFEcv8ZzlO1UyFAtO3PLNY=;
	h=Received:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=k2T/Dnl48D9R7WJqLmydLVnuT80EpfnVi5IV4vp7PK3Spm+RVSQMIMEsSmmi3miWozbBFrDdKkymKF3E9X0OBXZhpqoChHxrf8zavCGtvYiVLGHWkKkiAmXaqGMehMG+zJJzYxaCRdkpCGgQXdnFHKQ+EPktqtfBEanLki8E1iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F30011FB;
	Wed, 17 Jan 2024 05:53:45 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5CC13F5A1;
	Wed, 17 Jan 2024 05:52:58 -0800 (PST)
Date: Wed, 17 Jan 2024 13:52:56 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 00/19] sunxi: SPL cleanup part 1
Message-ID: <20240117135256.66bb48ee@donnerap.manchester.arm.com>
In-Reply-To: <20240103001239.17482-1-andre.przywara@arm.com>
References: <20240103001239.17482-1-andre.przywara@arm.com>
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

On Wed,  3 Jan 2024 00:12:20 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> This is the first part of a series to clean up the Allwinner SPL a bit.

will anyone have a chance to look at this?

I compiled patches 1-4,6,7 for all sunxi boards and the resulting binaries
were identical compared to the base, so if no one screams, I would like to
merge those 6 patches ASAP.

The other patches can surely wait, though I would be glad if someone would
have a look and could confirm if that goes into the right direction in
general.

Cheers,
Andre

> One big driver for this whole clean up is to eventually accommodate the
> RISC-V chips, which share most platform devices, but cannot use any code
> that currently lives under arch/arm. So the idea is to disentangle the
> code, to get a cleaner separation between ARM specific and platform
> specific code. Another related reason is that the RISC-V port aims to
> use a DM SPL, so we want to split off code bits that won't be needed when
> we have the DM framework in the SPL.
> 
> This first part of the series is mostly preparation, and some smaller
> cleanups, of code that was around for a long time and missed some
> updates.
> We start with some removal of no longer needed definitions, in the first
> seven patches. The next seven patches tighten the SPL clock code: quite
> some functions were compiled for U-Boot proper, however were not needed
> there. Sorting this out helps to identify legacy code.
> The final five patches move the SPL pinmux setup code into separate
> functions and files, and convert the #ifdef hell into proper C "if"
> statements.
> 
> It would be great if Samuel can have a look and say whether this is
> helpful or not. For instance I don't really know how much of the SPL
> clock code will be needed for the RISC-V port, since we don't really
> model the bus clocks in the DT at all, and currently don't support PLLs
> in the DM clock code.
> 
> Much of this first series should be good regardless, for instance the
> replacement of #ifdef's with C "if" statements, since that became
> tedious to expand for new SoCs and boards. But if some parts should live
> in a different directory, or should be grouped differently, this can
> certainly be factored in.
> 
> Please have a look, review and test!
> 
> Cheers,
> Andre
> 
> Andre Przywara (19):
>   sunxi: cleanup sunxi-common.h
>   sunxi: sun50i-h6: remove unneeded base addresses from header
>   sunxi: sun4i: remove unneeded base addresses from header
>   sunxi: sun9i: remove unneeded base addresses from header
>   sunxi: move #ifdef guards around tzpc_init() to header file
>   sunxi: remove common.h inclusion
>   sunxi: simplify U-Boot proper only builds
>   sunxi: remove unneeded i2c_init_board() call for U-Boot proper
>   sunxi: compile clock.c for SPL only
>   sunxi: sun4i: make more clock functions SPL only
>   sunxi: sun6i: make more clock functions SPL only
>   sunxi: sun50i_h6: make more clock functions SPL only
>   sunxi: sun8i_a83t: make more clock functions SPL only
>   sunxi: sun9i: make more clock functions SPL only
>   sunxi: move pinmux setup into separate SPL only file
>   sunxi: SPL pinmux: rewrite without #ifdefs
>   sunxi: move UART pinmux setup into separate file
>   sunxi: SPL pinmux: split out UART pinmux per port
>   sunxi: SPL pinmux: rewrite UART setup without #ifdefs
> 
>  arch/arm/Kconfig                              |   4 +-
>  arch/arm/include/asm/arch-sunxi/clock_sun9i.h |   3 -
>  arch/arm/include/asm/arch-sunxi/cpu_sun4i.h   |  47 ---
>  .../include/asm/arch-sunxi/cpu_sun50i_h6.h    |  21 --
>  arch/arm/include/asm/arch-sunxi/cpu_sun9i.h   |  41 ---
>  arch/arm/include/asm/arch-sunxi/tzpc.h        |   6 +
>  arch/arm/mach-sunxi/Kconfig                   |  16 +-
>  arch/arm/mach-sunxi/Makefile                  |   4 +-
>  arch/arm/mach-sunxi/board.c                   | 113 +------
>  arch/arm/mach-sunxi/clock.c                   |   3 -
>  arch/arm/mach-sunxi/clock_sun4i.c             |   6 +-
>  arch/arm/mach-sunxi/clock_sun50i_h6.c         |  58 ++--
>  arch/arm/mach-sunxi/clock_sun6i.c             |   4 +-
>  arch/arm/mach-sunxi/clock_sun8i_a83t.c        |   6 +-
>  arch/arm/mach-sunxi/clock_sun9i.c             |  98 +++---
>  arch/arm/mach-sunxi/cpu_info.c                |   1 -
>  arch/arm/mach-sunxi/dram_helpers.c            |   3 +-
>  arch/arm/mach-sunxi/dram_sun4i.c              |   1 -
>  arch/arm/mach-sunxi/dram_sun50i_h6.c          |   1 -
>  arch/arm/mach-sunxi/dram_sun50i_h616.c        |   1 -
>  arch/arm/mach-sunxi/dram_sun6i.c              |   1 -
>  arch/arm/mach-sunxi/dram_sun8i_a23.c          |   1 -
>  arch/arm/mach-sunxi/dram_sun8i_a33.c          |   1 -
>  arch/arm/mach-sunxi/dram_sun8i_a83t.c         |   1 -
>  arch/arm/mach-sunxi/dram_sun9i.c              |   1 -
>  arch/arm/mach-sunxi/dram_suniv.c              |   2 +-
>  arch/arm/mach-sunxi/dram_sunxi_dw.c           |   1 -
>  arch/arm/mach-sunxi/gtbus_sun9i.c             |   1 -
>  arch/arm/mach-sunxi/pmic_bus.c                |   1 -
>  arch/arm/mach-sunxi/prcm.c                    |   1 -
>  arch/arm/mach-sunxi/spl_pinmux.c              | 312 +++++++++++++++++
>  arch/arm/mach-sunxi/spl_spi_sunxi.c           |   1 -
>  arch/arm/mach-sunxi/timer.c                   |   1 -
>  arch/arm/mach-sunxi/uart_pinmux.c             | 158 +++++++++
>  board/sunxi/board.c                           | 318 +-----------------
>  include/configs/sunxi-common.h                |  56 +--
>  36 files changed, 592 insertions(+), 702 deletions(-)
>  create mode 100644 arch/arm/mach-sunxi/spl_pinmux.c
>  create mode 100644 arch/arm/mach-sunxi/uart_pinmux.c
> 

