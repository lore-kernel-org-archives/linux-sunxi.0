Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F650184
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jan 2025 23:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737330230; cv=none; b=bhZKcXSLVn6LINSHS8QuljYwpTHzOUvT20H8lrBGc8PLdJLfFhxs8A0O24l38z/rmaswAkbBkdJlI2G/Vjrb7ZyK+oa+yKhCWsdrxZSa9QOt2dLZQl+eWAOySSoFeBovoesCOtzrPClA1bUHl7QBAkabHRZW9egcvWXVAmcoQ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737330230; c=relaxed/simple;
	bh=1xCD0KmSnLnFi6mQyYongDuGDsQ/aWHGr7vvEY/5R5g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lGJ9vtFNJM1c51XNn4K4NI0clBMO68y+iNdyGFK95e9UFiLEFQsG7UUxj6ua+V6rAUDaOmTSRALmR0HWs36ZrFqtVzd0qz7AWxPppBR6ZRh1fCv41g4Y9xY9Ch5+EpJDet7O6R9rO6H9Ux35wakE34U2f8hKixQuyzfQyirtIeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A9CF339;
	Sun, 19 Jan 2025 15:44:14 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D6913F5A1;
	Sun, 19 Jan 2025 15:43:44 -0800 (PST)
Date: Sun, 19 Jan 2025 23:42:19 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: u-boot@lists.denx.de, Sumit Garg <sumit.garg@linaro.org>,
 linux-sunxi@lists.linux.dev, Tom Rini <trini@konsulko.com>, Simon Glass
 <sjg@chromium.org>
Subject: Re: [PATCH 1/3] suniv: switch Allwinner F1Cx00 boards to
 OF_UPSTREAM
Message-ID: <20250119234219.1773070e@minigeek.lan>
In-Reply-To: <5850974.DvuYhMxLoT@jernej-laptop>
References: <20250119164157.23648-1-andre.przywara@arm.com>
	<20250119164157.23648-2-andre.przywara@arm.com>
	<5850974.DvuYhMxLoT@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 19 Jan 2025 20:45:43 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Dne nedelja, 19. januar 2025 ob 17:41:54 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> > In contrast to some other Allwinner SoCs, there is no difference between
> > the DTs for the Allwinner F1C100/F1C200 SoCs (sunvi) between the U-Boot
> > and the Linux kernel repository.
> >=20
> > Remove the old copies of the F1Cx00 related .dts and .dtsi files, and
> > switch the whole suniv SoC over to use OF_UPSTREAM.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/dts/Makefile                        |   2 -
> >  arch/arm/dts/suniv-f1c100s-licheepi-nano.dts |  73 ----
> >  arch/arm/dts/suniv-f1c100s.dtsi              | 330 -------------------
> >  arch/arm/dts/suniv-f1c200s-lctech-pi.dts     |  76 -----
> >  arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts |  81 -----
> >  arch/arm/mach-sunxi/Kconfig                  |   1 +
> >  configs/lctech_pi_f1c200s_defconfig          |   2 +-
> >  configs/licheepi_nano_defconfig              |   2 +-
> >  8 files changed, 3 insertions(+), 564 deletions(-)
> >  delete mode 100644 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
> >  delete mode 100644 arch/arm/dts/suniv-f1c100s.dtsi
> >  delete mode 100644 arch/arm/dts/suniv-f1c200s-lctech-pi.dts
> >  delete mode 100644 arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts
> >=20
> > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > index aef0425c967..5627daa94db 100644
> > --- a/arch/arm/dts/Makefile
> > +++ b/arch/arm/dts/Makefile
> > @@ -530,8 +530,6 @@ dtb-$(CONFIG_STM32H7) +=3D stm32h743i-disco.dtb \
> >  	stm32h743i-eval.dtb \
> >  	stm32h750i-art-pi.dtb
> > =20
> > -dtb-$(CONFIG_MACH_SUNIV) +=3D \
> > -	suniv-f1c100s-licheepi-nano.dtb
> >  dtb-$(CONFIG_MACH_SUN4I) +=3D \
> >  	sun4i-a10-a1000.dtb \
> >  	sun4i-a10-ba10-tvbox.dtb \


> > diff --git a/arch/arm/dts/suniv-f1c100s-licheepi-nano.dts b/arch/arm/dt=
s/suniv-f1c100s-licheepi-nano.dts
> > deleted file mode 100644
> > index 43896723a99..00000000000
> > --- a/arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
> > +++ /dev/null

 ....

> > diff --git a/arch/arm/dts/suniv-f1c100s.dtsi b/arch/arm/dts/suniv-f1c10=
0s.dtsi
> > deleted file mode 100644
> > index 3c61d59ab5f..00000000000
> > --- a/arch/arm/dts/suniv-f1c100s.dtsi
> > +++ /dev/null

...

> > diff --git a/arch/arm/dts/suniv-f1c200s-lctech-pi.dts b/arch/arm/dts/su=
niv-f1c200s-lctech-pi.dts
> > deleted file mode 100644
> > index 2d2a3f026df..00000000000
> > --- a/arch/arm/dts/suniv-f1c200s-lctech-pi.dts
> > +++ /dev/null

...

> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index 8065161e61e..866b55833c0 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -279,6 +279,7 @@ config MACH_SUNIV
> >  	select SUPPORT_SPL
> >  	select SKIP_LOWLEVEL_INIT_ONLY
> >  	select SPL_SKIP_LOWLEVEL_INIT_ONLY
> > +	imply OF_UPSTREAM
> > =20
> >  config MACH_SUN4I
> >  	bool "sun4i (Allwinner A10)"
> > diff --git a/configs/lctech_pi_f1c200s_defconfig b/configs/lctech_pi_f1=
c200s_defconfig
> > index e1e8d3aaaa3..1588b3b4955 100644
> > --- a/configs/lctech_pi_f1c200s_defconfig
> > +++ b/configs/lctech_pi_f1c200s_defconfig
> > @@ -1,6 +1,6 @@
> >  CONFIG_ARM=3Dy
> >  CONFIG_ARCH_SUNXI=3Dy
> > -CONFIG_DEFAULT_DEVICE_TREE=3D"suniv-f1c200s-lctech-pi"
> > +CONFIG_DEFAULT_DEVICE_TREE=3D"allwinner/suniv-f1c200s-lctech-pi" =20
>=20
> What's with this board? I don't see it being removed from Makefile. If it
> is not there, then this board has been broken all along?

No, all defconfigs build fine, that's tested with CI on every PR merged.

As it turns out, the build system builds the DTs as listed in the
CONFIG_DEFAULT_DEVICE_TREE variable, but also in CONFIG_OF_LIST
automatically, so those lists in the Makefile are actually somewhat
redundant. I am not entirely sure if there are corner case when they
are needed, though, but even removing the whole Makefile stanza for
A64, for instance, builds those boards fine.

So the LCTech Pi build is fine, both with and without this patch.

Thanks,
Andre

>=20
> Best regards,
> Jernej
>=20
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUNIV=3Dy
> >  CONFIG_DRAM_CLK=3D156
> > diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_de=
fconfig
> > index d59affb0d9c..051b1901f20 100644
> > --- a/configs/licheepi_nano_defconfig
> > +++ b/configs/licheepi_nano_defconfig
> > @@ -1,6 +1,6 @@
> >  CONFIG_ARM=3Dy
> >  CONFIG_ARCH_SUNXI=3Dy
> > -CONFIG_DEFAULT_DEVICE_TREE=3D"suniv-f1c100s-licheepi-nano"
> > +CONFIG_DEFAULT_DEVICE_TREE=3D"allwinner/suniv-f1c100s-licheepi-nano"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUNIV=3Dy
> >  CONFIG_DRAM_CLK=3D156
> >  =20
>=20
>=20
>=20
>=20
>=20

