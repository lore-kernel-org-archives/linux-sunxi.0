Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610E31D72E
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Jan 2026 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768736072; cv=none; b=MgDa4cH3drznGdksTsz/sB2aenb9mv81kA5E2iWA7G1PrH9dLcbQrnH0T5PqZ5xK1Fy/pcHo5IJqrP4/CZK9APawdd0fhcR46MCmna4n23IR/MmJr2B/OEXkysw3yQcorxouy0xS6rCnkk4cfPoD/ll3t6fwOkSb99QXHZqIi1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768736072; c=relaxed/simple;
	bh=fWl7HU6rbRuewUeDc1Vla9UGLhE5/NShE1c1s/aTj4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFwJ6IHsaB5TdMLw2YqZAs/kGf0wMmDwximAO60epcIBfiuYkEnP4vP3jugJFD8RFSYxxjsEj3itmFeA06R5D5cYXsvrvAwZDw+ygm4kNpDEF2UbW3PxnNfQTxR4DGLqcavpXQed0hMRXBlZfAyIhucrBdCF7e0DbYKERfLd/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=hyFljquD; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="hyFljquD"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CC414240028
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Jan 2026 12:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1768736061; bh=Oca1gbM5KrAW2b8mP94lqaYAakJjfHh5z/L4bin4dPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=hyFljquDIrQK1NOIR6o09Na08HWtbWxFOqX0WS0ITrOoPuPR9x23tnzy6iDewxCAW
	 UVErSzEUQTj6hfGdEUeKsOzWGZSHRCM71TfL2YsdWPCPJGAKhkSEbo3h23VXE4psUX
	 qMhnq1Cxgaof06DnBzqXm5IQL+jMfLgY8ECDQKvlPP/w7oko1lB3lD3zGNh9sCTkhJ
	 +SXr6sZVPH1pHsbCEL0a4GDfh2HaKTjFD/9u0Rb5B0JUzH+LqVKacNm/N4ZbK/W7GN
	 YpLdoNNCZSvF0/JloMJje+4/GjlKg+4Jl2eU7Z83qG8WhUYXKCVgv86nAJjOWIOy3P
	 zlzNajK2ygl4w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dvBLt6pyWz6tsf;
	Sun, 18 Jan 2026 12:34:14 +0100 (CET)
Date: Sun, 18 Jan 2026 11:34:21 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	j.ne@posteo.net, u-boot@lists.denx.de,
	Tom Rini <trini@konsulko.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Leo Yu-Chi Liang <ycliang@andestech.com>,
	Peter Geis <pgwipeout@gmail.com>, Lukasz Majewski <lukma@denx.de>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH next v2] board: amediatech: Add X96Q support
Message-ID: <aWzFNrTmfP7Lr2rd@probook>
References: <20260110-x96q-v2-1-1d6a725eb825@posteo.net>
 <20260110012313.6fa04c9e@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260110012313.6fa04c9e@minigeek.lan>

On Sat, Jan 10, 2026 at 01:23:13AM +0100, Andre Przywara wrote:
> On Sat, 10 Jan 2026 00:10:32 +0100
> J. Neuschäfer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrote:
> 
> Hi,
> 
> many thanks for sending this!
> CC:ing the sunxi list for better visibility.
> New board support is mostly a matter for the people interested in the
> SoC family, less so for the general U-Boot audience.

Good point. I just followed get_maintainer.pl, which couldn't add the
linux-sunxi list for two reasons:

 - U-Boot's MAINTAINERS file doesn't use keyword tags and none of the
   filenames in this patch match the sunxi entry
 - it doesn't list linux-sunxi mailing list

Anyway, I'll Cc it on the next revision.

> 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
> > 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> > output, and infrared input.
> > 
> >   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
> > 
> > This commit adds a defconfig and some documentation. The devicetree is
> > already in dts/upstream.
> > 
> > The CONFIG_DRAM_SUNXI_* settings are chosen such that the register
> > values in the DRAM PHY's MMIO space are as close as possible to those
> > observed when booting with the preinstalled vendor U-Boot. The DRAM
> > clock frequency of 600 MHz was reported in the vendor U-Boot's output.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > Changes in v2:
> > - Add missing Signed-off-by
> > - Re-generate x96q_defconfig with 'make savedefconfig'
> > - Move DRAM frequency comment to commit message
> > - Use GPL-2.0-or-later instead of deprecated GPL-2.0+
> > - Link to v1: https://lore.kernel.org/r/20251231-x96q-v1-1-316d703b8f03@posteo.net
> > ---
> >  configs/x96q_defconfig         | 31 +++++++++++++++++++++++
> >  doc/board/amediatech/index.rst |  9 +++++++
> >  doc/board/amediatech/x96q.rst  | 57 ++++++++++++++++++++++++++++++++++++++++++
> >  doc/board/index.rst            |  1 +
> >  4 files changed, 98 insertions(+)
> > 
> > diff --git a/configs/x96q_defconfig b/configs/x96q_defconfig
> > new file mode 100644
> > index 00000000000..b74a1b61f3c
> > --- /dev/null
> > +++ b/configs/x96q_defconfig
> > @@ -0,0 +1,31 @@
> > +CONFIG_ARM=y
> > +CONFIG_ARCH_SUNXI=y
> > +CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun50i-h313-x96q"
> > +CONFIG_DRAM_CLK=600
> > +CONFIG_SPL=y
> > +CONFIG_DRAM_SUNXI_DX_ODT=0x03030303
> > +CONFIG_DRAM_SUNXI_DX_DRI=0x0e0e0e0e
> > +CONFIG_DRAM_SUNXI_CA_DRI=0x1f12
> > +CONFIG_DRAM_SUNXI_TPR0=0xc0001002
> > +CONFIG_DRAM_SUNXI_TPR2=0x00000100
> > +CONFIG_DRAM_SUNXI_TPR10=0x002f0107
> > +CONFIG_DRAM_SUNXI_TPR11=0xddddcccc
> > +CONFIG_DRAM_SUNXI_TPR12=0xeddc7665
> > +CONFIG_MACH_SUN50I_H616=y
> > +CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
> > +CONFIG_R_I2C_ENABLE=y
> > +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > +CONFIG_FIT_BEST_MATCH=y
> 
> What is this for, exactly?

The purpose was to boot FIT images as generated by the Linux kernel
build system.

> 
> > +CONFIG_SPL_I2C=y
> > +CONFIG_CMD_UFETCH=y
> > +CONFIG_CMD_CAT=y
> 
> Can you please drop those two commands? A defconfig is meant to provide
> some low level common configuration, enabling the features that are
> needed to boot. Command support should only be selected in the
> defconfig if it has a special meaning or requirement for this
> board.

Since this and the previous point are deployment characteristics (how a
board is used) rather than a characteristics of the board itself, I'll
remove them.

> 
> > +CONFIG_SPL_SYS_I2C_LEGACY=y
> > +CONFIG_SYS_I2C_MVTWSI=y
> > +CONFIG_SYS_I2C_SLAVE=0x7f

The SYS_I2C_SLAVE setting is also unnecessary for this board.

> > +CONFIG_SYS_I2C_SPEED=400000
> > +CONFIG_SUPPORT_EMMC_BOOT=y
> > +CONFIG_SUN8I_EMAC=y
> > +CONFIG_AXP305_POWER=y
> > +CONFIG_USB_EHCI_HCD=y
> > +CONFIG_USB_OHCI_HCD=y
> > +CONFIG_SPL_USE_TINY_PRINTF_POINTER_SUPPORT=y
> 
> What is this needed for?

It turns out to be unnecessary.

> 
> > diff --git a/doc/board/amediatech/index.rst b/doc/board/amediatech/index.rst
> 
> What does this file add on top of doc/board/allwinner/sunxi.rst?

 - A mention that this board in particular is supported
 - The information that PLAT=sun50i_h616 should be used when building TF-A

I guess both of these could be derived from the defconfig too.

> In general we do not use board/<vendor> directories for Allwinner
> boards, not for code, and not for documentation.
> So can you please just drop this file and the amediatech entry below?

Ok.

I suppose it makes sense to change the patch title to "board: sunxi: ..." too.

> But you would need to add an entry into board/sunxi/MAINTAINERS,
> otherwise the U-Boot CI will fail.

Will do.


Thanks for your review!
J. Neuschäfer
