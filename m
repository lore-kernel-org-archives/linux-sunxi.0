Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901982E06DC
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Jul 2025 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180248; cv=none; b=ISZmLAII1Er7RsHZyI/b4fwke8tEsa0nKj2f4TtkENpCwD7sFWjB9ZMYvXST5Otc1VYl2exdH5frfWzYtDpcHh2h4wHeWSmpbVATmywhxP2L81MvTJy+f7FgS/DA3crdtXRSJOTzYSvMD4dDpi9Ybeb6GHTf5oOzaMflYFM2BTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180248; c=relaxed/simple;
	bh=gXMVkyk4JsU0g50rc9Kt10SjC5H3yjNHSEKNwkZXVTw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ogGIR54A4eQudt/Ry3i7u39NoRp7mviPd0TghjeuYsGNHB4r3MPZLQRkqer0qvK3QfgCtuW0V3fWcorMzEsNH1twZKQ6HHckBpfvSsXeV7BxjwCFy3yazyn019Lb69xiuTNiyS5bUBYq6p/eDg6pgXt0AuAkn/atggFzl+gJwIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A3BD152B;
	Tue, 22 Jul 2025 03:30:40 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9256B3F59E;
	Tue, 22 Jul 2025 03:30:44 -0700 (PDT)
Date: Tue, 22 Jul 2025 11:30:36 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: <u-boot@lists.denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Mikhail Kalashnikov <iuncuim@gmail.com>, Paul Kocialkowski
 <paulk@sys-base.io>, <linux-sunxi@lists.linux.dev>, Tom Rini
 <trini@konsulko.com>
Subject: Re: [PATCH v2 20/20] sunxi: A523: add defconfigs for three boards
Message-ID: <20250722113036.790447c0@donnerap.manchester.arm.com>
In-Reply-To: <20250722024932-GYA724801@gentoo>
References: <20250717235455.32528-1-andre.przywara@arm.com>
	<20250717235455.32528-21-andre.przywara@arm.com>
	<20250722013526.6297858c@minigeek.lan>
	<20250722024932-GYA724801@gentoo>
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

On Tue, 22 Jul 2025 10:49:32 +0800
Yixun Lan <dlan@gentoo.org> wrote:

Hi!

> On 01:35 Tue 22 Jul     , Andre Przywara wrote:
> > On Fri, 18 Jul 2025 00:54:55 +0100
> > Andre Przywara <andre.przywara@arm.com> wrote:
> > 
> > Hi Yixun,
> > 
> > see below for a comment on the missing eMMC support for the Radxa
> > defconfig. My board doesn't have eMMC, so can you please check this on
> > your end?
> >   
> sure
>
> > > So far developers seem to use three popular boards:
> > > - Avaota A1: dev board with USB 3.0, dual Ethernet, small display
> > > - X96QPro+: TV box with Gigabit Ethernet, USB 3.0, eMMC
> > > - Radxa A5E: small dev board with USB3/M.2 2230 (muxed), dual Ethernet
> > > 
> > > Add the defconfig files for those boards, containing the DRAM parameters
> > > and the usual Kconfig options.
> > > 
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  board/sunxi/MAINTAINERS         | 15 +++++++++++++++
> > >  configs/avaota-a1_defconfig     | 31 +++++++++++++++++++++++++++++++
> > >  configs/radxa-a5e_defconfig     | 30 ++++++++++++++++++++++++++++++
> > >  configs/x96q_pro_plus_defconfig | 32 ++++++++++++++++++++++++++++++++
> > >  4 files changed, 108 insertions(+)
> > >  create mode 100644 configs/avaota-a1_defconfig
> > >  create mode 100644 configs/radxa-a5e_defconfig
> > >  create mode 100644 configs/x96q_pro_plus_defconfig
> > >   
> ...
> > > diff --git a/configs/radxa-a5e_defconfig b/configs/radxa-a5e_defconfig
> > > new file mode 100644
> > > index 00000000000..012e7b4eeaf
> > > --- /dev/null
> > > +++ b/configs/radxa-a5e_defconfig
> > > @@ -0,0 +1,30 @@
> > > +CONFIG_ARM=y
> > > +CONFIG_ARCH_SUNXI=y
> > > +CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun55i-a527-cubie-a5e"
> > > +CONFIG_SPL=y
> > > +CONFIG_DRAM_SUNXI_DX_ODT=0x07070707
> > > +CONFIG_DRAM_SUNXI_DX_DRI=0x0d0d0d0d
> > > +CONFIG_DRAM_SUNXI_CA_DRI=0x0e0e
> > > +CONFIG_DRAM_SUNXI_ODT_EN=0x84848484
> > > +CONFIG_DRAM_SUNXI_TPR0=0x80808080
> > > +CONFIG_DRAM_SUNXI_TPR1=0x06060606
> > > +CONFIG_DRAM_SUNXI_TPR6=0x38000000
> > > +CONFIG_DRAM_SUNXI_TPR10=0x802f3333
> > > +CONFIG_DRAM_SUNXI_TPR11=0xc7c5c4c2
> > > +CONFIG_DRAM_SUNXI_TPR12=0x3533302f
> > > +# BSP value: CONFIG_DRAM_SUNXI_TPR11=0xc6c4c2c0
> > > +# BSP value: CONFIG_DRAM_SUNXI_TPR12=0x3a373233
> > > +CONFIG_MACH_SUN55I_A523=y
> > > +CONFIG_R_I2C_ENABLE=y
> > > +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > > +CONFIG_SPL_I2C=y
> > > +CONFIG_SPL_SYS_I2C_LEGACY=y
> > > +CONFIG_SYS_I2C_MVTWSI=y
> > > +CONFIG_SYS_I2C_SLAVE=0x7f
> > > +CONFIG_SYS_I2C_SPEED=400000
> > > +CONFIG_REGULATOR_AXP=y
> > > +CONFIG_AXP717_POWER=y
> > > +CONFIG_AXP_DCDC2_VOLT=920
> > > +CONFIG_AXP_DCDC3_VOLT=1100
> > > +CONFIG_USB_EHCI_HCD=y
> > > +CONFIG_USB_OHCI_HCD=y  
> > 
> > This is missing CONFIG_MMC_SUNXI_SLOT_EXTRA=2 and
> > CONFIG_SUPPORT_EMMC_BOOT=y, as there are Radxa boards with eMMC.  
> confirmed, the two configs are exactly what I've added to make eMMC work

Many thanks for testing!

> > The DT describes this, so we should follow suit here, to allow eMMC
> > booting. Should not harm boards without the eMMC chip.
> >   
> agree!
> 
> I'd assume you would take care of the config? and send out an updated
> version next time?

Yes, I will now include those two lines in the version I will merge.

Cheers,
Andre
