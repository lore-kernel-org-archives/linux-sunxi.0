Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C589A9474
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Jul 2024 23:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721000431; cv=none; b=L7MZ7m/SO3NwkPSQOu+1bK7emURuP4uDpxiPAPAGub5WT7j/sNxmzu+83JigK/bK7KjdfqRmKAtuiS8Z5Fuoy1UvnzU2dFthNSAI5cxZxRv+5y968uDXrEOEmSg32M6JjadNRuEQw/ockwJnVIOLzNHbc+HnEWhTJlGPWekbcJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721000431; c=relaxed/simple;
	bh=m2M6Y81O7MsOZk6G7a1a3v25Zq+p3VRTCTVig1xybCw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FsUMUCXix5tQqXpJI2b1Xh8tVxWkgTs3zm9uwT2WuJUkYtzXkJNTIGo833VoxhZ7X8TNNGBsHIG+vuqT9YWlccFWUSk63OxOM0xrKjYp+6zL5WOPZMps1bj+fREKs2TANGLJrpLVBlKaohbPvGA/NRrMQScFp3QuUqttiUrg9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CED17FEC;
	Sun, 14 Jul 2024 16:40:47 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 365B53F762;
	Sun, 14 Jul 2024 16:40:21 -0700 (PDT)
Date: Mon, 15 Jul 2024 00:38:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: "Ryan Walklin" <ryan@testtoast.com>
Cc: "Tom Rini" <trini@konsulko.com>, "Jaehoon Chung"
 <jh80.chung@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, "Chris Morgan" <macromorgan@hotmail.com>, "Philippe
 Simons" <simons.philippe@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 4/6] power: pmic: sunxi: add AXP717 SPL support
Message-ID: <20240715003811.2892c08d@minigeek.lan>
In-Reply-To: <f970326b-3763-4179-a6ca-fd30a27fc793@app.fastmail.com>
References: <20240712165352.3767166-1-andre.przywara@arm.com>
	<20240712165352.3767166-5-andre.przywara@arm.com>
	<f970326b-3763-4179-a6ca-fd30a27fc793@app.fastmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 14 Jul 2024 20:20:44 +1200
"Ryan Walklin" <ryan@testtoast.com> wrote:

Hi Ryan,

> On Sat, 13 Jul 2024, at 4:53 AM, Andre Przywara wrote:
> 
> >  #define AXP209_I2C_ADDR			0x34
> > +#define AXP717_I2C_ADDR			0x34
> > 
> >  #define AXP305_I2C_ADDR			0x36
> >  #define AXP313_I2C_ADDR			0x36
> > @@ -36,6 +37,8 @@ static int pmic_i2c_address(void)
> >  		return AXP305_I2C_ADDR;
> >  	if (IS_ENABLED(CONFIG_AXP313_POWER))
> >  		return AXP313_I2C_ADDR;
> > +	if (IS_ENABLED(CONFIG_AXP717_POWER))
> > +		return AXP717_I2C_ADDR;
> > 
> >  	/* Other AXP2xx and AXP8xx variants */
> >  	return AXP209_I2C_ADDR;  
> 
> Small point, but is this check strictly necessary, given that the AXP717 uses the same I2C address as the AXP209? If CONFIG_AXP717_POWER is not checked here, this logic will still fall through to the default AXP209 address, which will also be correct for the 717.

I consider the fact that the AXP209 and the AXP717 use the same I2C
address a sheer coincidence, so would like to keep the code readable
and maintainable. This "IS_ENABLED(AXPyyy) return AXPyyy_I2C_ADDR"
patterns seems to be easy to understand and copy, IMHO. If you are
concerned about generated code size: this whole function is optimised
away, and is replaced with a single "mov w0, #0x34" assembly
instruction, just before the respective i2c function calls. This is due
to the fact that those "if" statements have compile-time constant
input, so the compiler knows the final result already, and just
replaces the function call with this constant load. That's a neat
feature of IS_ENABLED(), and a pattern we are exercising in U-Boot for
years, to keep the code both readable, but also minimal.

Thanks for the Tested-by: tag!

Cheers,
Andre

> 
> > diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> > index ed86f1df5dc..9928069c0eb 100644
> > --- a/board/sunxi/board.c
> > +++ b/board/sunxi/board.c
> > @@ -562,7 +562,7 @@ void sunxi_board_init(void)
> >  #if defined CONFIG_AXP152_POWER || defined CONFIG_AXP209_POWER || \
> >  	defined CONFIG_AXP221_POWER || defined CONFIG_AXP305_POWER || \
> >  	defined CONFIG_AXP809_POWER || defined CONFIG_AXP818_POWER || \
> > -	defined CONFIG_AXP313_POWER
> > +	defined CONFIG_AXP313_POWER || defined CONFIG_AXP717_POWER
> >  	power_failed = axp_init();
> > 
> >  	if (IS_ENABLED(CONFIG_AXP_DISABLE_BOOT_ON_POWERON) && !power_failed) {
> > diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
> > index 33b8bc1214d..5556a22cf69 100644
> > --- a/drivers/power/Kconfig
> > +++ b/drivers/power/Kconfig
> > @@ -109,6 +109,13 @@ config AXP313_POWER
> >  	Select this to enable support for the AXP313 PMIC found on some
> >  	H616 boards.
> > 
> > +config AXP717_POWER
> > +	bool "axp717 pmic support"
> > +	select AXP_PMIC_BUS
> > +	select CMD_POWEROFF
> > +	---help---
> > +	Select this to enable support for the AXP717 PMIC found on some boards.
> > +
> >  config AXP809_POWER
> >  	bool "axp809 pmic support"
> >  	depends on MACH_SUN9I
> > @@ -151,10 +158,11 @@ config AXP_DCDC1_VOLT
> > 
> >  config AXP_DCDC2_VOLT
> >  	int "axp pmic dcdc2 voltage"
> > -	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || 
> > AXP809_POWER || AXP818_POWER || AXP313_POWER
> > +	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || 
> > AXP809_POWER || AXP818_POWER || AXP313_POWER || AXP717_POWER
> >  	default 900 if AXP818_POWER
> >  	default 1400 if AXP152_POWER || AXP209_POWER
> >  	default 1000 if AXP313_POWER
> > +	default 1000 if AXP717_POWER
> >  	default 1200 if MACH_SUN6I
> >  	default 1100 if MACH_SUN8I
> >  	default 0 if MACH_SUN9I
> > @@ -167,11 +175,11 @@ config AXP_DCDC2_VOLT
> >  	On A80 boards dcdc2 powers the GPU and can be left off.
> >  	On A83T boards dcdc2 is used for VDD-CPUA(cluster 0) and should be 
> > 0.9V.
> >  	On R40 boards dcdc2 is VDD-CPU and should be 1.1V
> > -	On boards using the AXP313 it's often VDD-CPU.
> > +	On boards using the AXP313 or AXP717 it's often VDD-CPU.
> > 
> >  config AXP_DCDC3_VOLT
> >  	int "axp pmic dcdc3 voltage"
> > -	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || 
> > AXP809_POWER || AXP818_POWER || AXP313_POWER
> > +	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || 
> > AXP809_POWER || AXP818_POWER || AXP313_POWER || AXP717_POWER
> >  	default 900 if AXP809_POWER || AXP818_POWER
> >  	default 1500 if AXP152_POWER
> >  	default 1250 if AXP209_POWER
> > @@ -188,7 +196,8 @@ config AXP_DCDC3_VOLT
> >  	On A80 boards dcdc3 is used for VDD-CPUA(cluster 0) and should be 
> > 0.9V.
> >  	On A83T boards dcdc3 is used for VDD-CPUB(cluster 1) and should be 
> > 0.9V.
> >  	On R40 boards dcdc3 is VDD-SYS and VDD-GPU and should be 1.1V.
> > -	On boards using the AXP313 it's often VDD-DRAM and should be 1.1V for 
> > LPDDR4.
> > +	On boards using the AXP313 or AXP717 it's often VDD-DRAM and should
> > +	be 1.1V for LPDDR4.
> > 
> >  config AXP_DCDC4_VOLT
> >  	int "axp pmic dcdc4 voltage"
> > diff --git a/drivers/power/Makefile b/drivers/power/Makefile
> > index 0f39459dec4..6df23a81c29 100644
> > --- a/drivers/power/Makefile
> > +++ b/drivers/power/Makefile
> > @@ -14,6 +14,7 @@ obj-$(CONFIG_AXP209_POWER)	+= axp209.o
> >  obj-$(CONFIG_AXP221_POWER)	+= axp221.o
> >  obj-$(CONFIG_AXP305_POWER)	+= axp305.o
> >  obj-$(CONFIG_AXP313_POWER)	+= axp313.o
> > +obj-$(CONFIG_AXP717_POWER)	+= axp_spl.o
> >  obj-$(CONFIG_AXP809_POWER)	+= axp809.o
> >  obj-$(CONFIG_AXP818_POWER)	+= axp818.o
> >  endif
> > -- 
> > 2.25.1  
> 
> Tested with RG35XX-H and RG35XX-Plus boards (Allwinner H700 with AXP717). Confirmed both DCDC2 and DCDC3 are set correctly in SPL, allowing successful DRAM init and boot.
> 
> Tested-by: Ryan Walklin <ryan@testtoast.com>
> 
> Regards,
> 
> Ryan
> 

