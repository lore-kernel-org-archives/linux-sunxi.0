Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34CE19DF40
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Apr 2025 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017973; cv=none; b=Se1WuWjx9A+BOnrlsWSvLzAapWoo6iO2eplcZDMZQPzsO/S3S+RQ7muS3x52xsYFLSWBaWNP0fNB5XG3KNXvGQEwDU8azN64OvXrTec9S4udX8ef1GJ3gjf9n6+sCB6XNZhMbWTmod4Exa1wUn5FWwBM9kSpFupEWKoEC+/bXoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017973; c=relaxed/simple;
	bh=71fNEv7nXUHMIzJUswZ4MG2WXxTHQBFervw2qaf+vU8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwjBxMA13//k/x8eU9Jn2MWujNNKg9uHkzScIZun8LrlJeNMszue3mMePO/lPoT7Kf13KwIIEjsh1Mo5e2QyiysvIxT7sP/1CXdw9LjQFSIiLB6AMY7IpqCM0ff9sVVPHroxjfe2nQailrp61EA1Cm1Yl3rUjE6ObpF0lnC+gaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CAB3106F;
	Mon,  7 Apr 2025 02:26:12 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 342D93F59E;
	Mon,  7 Apr 2025 02:26:10 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:26:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Mikhail Kalashnikov
 <iuncuim@gmail.com>, <u-boot@lists.denx.de>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 30/34] sunxi: A523: add DRAM initialisation routine
Message-ID: <20250407102606.604fa0a6@donnerap.manchester.arm.com>
In-Reply-To: <20250405215823-GYA11067@gentoo>
References: <20250323113544.7933-1-andre.przywara@arm.com>
	<20250323113544.7933-31-andre.przywara@arm.com>
	<20250405215823-GYA11067@gentoo>
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

On Sat, 5 Apr 2025 22:01:50 +0000
Yixun Lan <dlan@gentoo.org> wrote:

Hi,

> Hi Andre:
> 
> On 11:35 Sun 23 Mar     , Andre Przywara wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > 
> > DRAM init code, as per reverse engineering and matching against
> > previous SoCs.
> > Supports LPDDR4 for now only.
> > ---
> >  arch/arm/include/asm/arch-sunxi/dram.h        |    2 +
> >  .../include/asm/arch-sunxi/dram_sun55i_a523.h |  183 ++
> >  arch/arm/mach-sunxi/Kconfig                   |   31 +-
> >  arch/arm/mach-sunxi/Makefile                  |    2 +
> >  arch/arm/mach-sunxi/dram_sun55i_a523.c        | 1468 +++++++++++++++++
> >  arch/arm/mach-sunxi/dram_timings/Makefile     |    1 +
> >  .../arm/mach-sunxi/dram_timings/a523_lpddr4.c |  119 ++
> >  7 files changed, 1804 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/arm/include/asm/arch-sunxi/dram_sun55i_a523.h
> >  create mode 100644 arch/arm/mach-sunxi/dram_sun55i_a523.c
> >  create mode 100644 arch/arm/mach-sunxi/dram_timings/a523_lpddr4.c
> > 
[ ... ]

> > diff --git a/arch/arm/mach-sunxi/dram_sun55i_a523.c b/arch/arm/mach-sunxi/dram_sun55i_a523.c
> > new file mode 100644
> > index 00000000000..fae02062547
> > --- /dev/null
> > +++ b/arch/arm/mach-sunxi/dram_sun55i_a523.c
> > @@ -0,0 +1,1468 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * sun55i A523/A527/T527/H728 platform DRAM controller driver
> > + *
> > + * This driver supports DDR3 and LPDDR4 memory.
> > + *
> > + * (C) Copyright 2024 Jernej Skrabec <jernej.skrabec@gmail.com>
> > + *
> > + */
> > +#include <init.h>
> > +#include <log.h>
> > +#include <asm/io.h>
> > +#include <asm/arch/clock.h>
> > +#include <asm/arch/dram.h>
> > +#include <asm/arch/cpu.h>
> > +#include <asm/arch/prcm.h>
> > +#include <linux/bitops.h>
> > +#include <linux/delay.h>
> > +  
> ...snip
> > +static void mctl_auto_detect_dram_size(const struct dram_para *para,
> > +				       struct dram_config *config)
> > +{
> > +	/* detect row address bits */
> > +	config->cols = 8;
> > +	config->rows = 16;
> > +	mctl_core_init(para, config);
> > +
> > +	for (config->rows = 13; config->rows < 16; config->rows++) {
> > +		/* 8 banks, 8 bit per byte and 16/32 bit width */
> > +		if (mctl_mem_matches((1 << (config->rows + config->cols +
> > +					    4 + config->bus_full_width))))
> > +			break;
> > +	}
> > +
> > +	/* detect column address bits */
> > +	config->cols = 11;
> > +	mctl_core_init(para, config);
> > +  
> ...
> > +	for (config->cols = 8; config->cols < 11; config->cols++) {
> > +		/* 8 bits per byte and 16/32 bit width */
> > +		if (mctl_mem_matches(1 << (config->cols + 1 +
> > +					   config->bus_full_width)))
> > +			break;
> > +	}  
> on radxa a5e, I've got occasionally wrong dram size, roughly 2/10 rate
> in the wrong case it got 8192M, while actually should be 4096M..
> 
> spent a few time to debug, found it got config->cols = 11 while should be 10
> and above for loop has been skipped, thus fail to detect correct cols value..

Ah yes, we were already suspecting that. We had those "double detection"
issues on H616 for a while, and Jernej fixed them there recently:
https://lore.kernel.org/u-boot/20250309063143.62859-1-jernej.skrabec@gmail.com/T/#u

So we were already thinking of folding a similar fix into this (and
other SoCs') DRAM code, ideally by sharing some code.

Thanks for the test and the report!

Cheers,
Andre
