Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CE61D6187
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Nov 2025 00:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762563458; cv=none; b=siJHGfDp6n7ck+hFEDPDNx9mUeDQlBsC7E+X30wKhdQF1emX4Tg/Derp0VFyCy311iFIebDXi4tbRunRQJoiav3K2G9YsyxEzyDfegUAJ8s5GwFXg4AP5Qc/4xdEChZho7oP8huMTf4jsRlBb/8J2wvTupMUddEuxqUioI241sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762563458; c=relaxed/simple;
	bh=V8uuJqb2rcGQaKrq17THO6s/G0BUVC55aBw2I5HuQtU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ON11Fm8OO1sDl7krwyuaswIPUPmm1v4j/iWLN9sA74++P9m9xs2VSvMMzkkT7oJcVkzfVq+nBh+eaAKyJ7O+JlMiDOcSl4zG09dB9fOpvIEX1SuxneQpfQrRZOwm2KPrlOaCcKh3tCURb5gSRJy8U2z1NWRTW/vz0E8BBjmndtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A602212FC;
	Fri,  7 Nov 2025 16:57:21 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0902E3F694;
	Fri,  7 Nov 2025 16:57:28 -0800 (PST)
Date: Sat, 8 Nov 2025 00:56:31 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: =?UTF-8?B?SG9ydsOhdGg=?= Csaba <horvathcsabalaszlo@gmail.com>
Cc: linux-sunxi@lists.linux.dev
Subject: Re: Colorly e708q1 and AXP20x support
Message-ID: <20251108005631.75acf1c4@minigeek.lan>
In-Reply-To: <CADGuG04Bc8Dcv=GCZGsjkW7taS4VR0yTkp=BC9tC90HtkssVRw@mail.gmail.com>
References: <CADGuG04vCTWJNDj-fPaEO-dQmk_P_Z-E+AYbZBeYt+GJ8Dtqtg@mail.gmail.com>
	<DU0P190MB244572B5A5516B6BB3E053EEBC0EA@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
	<CADGuG04Bc8Dcv=GCZGsjkW7taS4VR0yTkp=BC9tC90HtkssVRw@mail.gmail.com>
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

On Thu, 11 Sep 2025 21:29:36 +0200
Horv=C3=A1th Csaba <horvathcsabalaszlo@gmail.com> wrote:

> Hi,
>=20
> Thanks!
> Strange, as i tried to compile mainline kernel half a year ago, but it
> had no support neither to display or the power chip. I don't even know
> what needs to be selected in the config in order to get them working.

I guess this is your problem: you are trying to compile a custom kernel
with apparently a made-up config, which isn't easy. As you figured, you
might miss many things, so it's best to use a well-known config as a
base, either sunxi_defconfig, multi_v7_defconfig, or probably the best:
the config from a distro kernel. The latter typically have all
drivers compiling as a module, so it would be able to load what it
needs automatically.

But for a first experiment sunxi_defconfig should be alright,
especially for old SoCs, and compiles most things into the kernel, so
you don't need to mess with modules. You might just run into issues
with distros, though, as you might miss some (new) options there.

Regarding cpufreq: that indeed requires a bunch of drivers to all work
(for instance a thermal sensor: CONFIG_MFD_SUN4I_GPADC), so try
sunxi_defconfig. To avoid running too hot quickly, you can lower the
initial frequency in U-Boot (CONFIG_SYS_CLK_FREQ), also you might want
to lower the initial voltage, for more power savings:
CONFIG_AXP_DCDC3_VOLT. Try 720 MHz at 1.1V, or 480 MHz at 1V, to be on
the safe side.

If you get it booted with that, scan dmesg for PMIC messages, or check
/sys/kernel/debug/regulator/regulator_summary. Messages about dummy
supplies in dmesg are normal, when there are no port supplies in the
DT, and are not fatal.

In general, to find a driver for a certain device:
$ git grep x-powers,axp221 drivers/
...
drivers/mfd/axp20x-i2c.c:       { .compatible =3D "x-powers,axp221", .data =
=3D (void *)AXP221_ID },
...
$ git grep axp20x-i2c.o drivers/mfd/Makefile
drivers/mfd/Makefile:obj-$(CONFIG_MFD_AXP20X_I2C)       +=3D axp20x-i2c.o
                           ^^^^^^^^^^^^^^^^^^^^^
Specifically the AXP uses several driver files, make sure you get all
the options. Refer to dmesg and /sys/kernel/debug/devices_deferred to
find missing drivers.

Hope that helps for a first step, please come back with more specific
information and questions, if needed.

Cheers,
Andre

> (Tried to compile numerous displays in it, but did not help.)
> Also, the AXP22x is referenced in the dts, and in the guide, there are
> some lines to add to the U-Boot config, but nothing to the kernel. And
> of course, does not work.
>=20
> So if anyone has any clue what to do (mostly what to compile in), i'll
> be thankful - i have done some kernel compiling before, but not an
> expert. Mostly not in devicetree objects. (It would be enough to have
> a stock kernel and OS to boot, as the device will be only a character
> display.)
>=20
> Thanks :)
>=20
> On Wed, Sep 10, 2025 at 6:33=E2=80=AFPM Subair Mullappilly <msubair@hotma=
il.com> wrote:
> >
> > Hi
> >
> > A31 has already upstream support,
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/allwinner?h=3Dv6.17-rc5
> >
> > your tablet device tree is already there, use upstream kernel, and it
> > has support for display,
> >
> > i never used a31 chip, but used r40,a20 etc..
> >
> > Subair
> >
> > On 9/10/25 20:24, Horv=C3=A1th Csaba wrote: =20
> > > Hi,
> > >
> > > I'm building a wireless display on a Colorfly e708q1 tablet. This is
> > > an A31s device, supported by Linux-Sunxi.
> > > I have managed to install Arch and get Wifi with an 5.x (stock)
> > > kernel, because with newer kernels compiled according to the guide at
> > > https://linux-sunxi.org/Colorfly_e708q1 i had no display.  Debian also
> > > works, but the device overheats, or freezes because of other cause.
> > >
> > > With this kernel, the only problem is that the AXP20x power controller
> > > is not working, therefore the device is very hot. I could not find any
> > > information about how to get the AXP working. Basically i have no BAT
> > > device, or any trace of working power management in the /dev or /sys.
> > >
> > > Can someone please guide me how to get this working...?
> > >
> > > Thanks in advance :)
> > >
> > > Cs.
> > > =20
>=20

