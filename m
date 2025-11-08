Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4F10F1
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Nov 2025 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762634007; cv=none; b=Xz8ShKELL5/wZe9P6qF8e+aWAMmzvsliItM/8N0PtOjJCxW5OzJ2kgXXRGD2EIJT3OP1pGxYaIZ5u0hY8o3d7YRXV7RVdQsnv67f3zodxN1rs03NIhe+r7TDA4q5hm94QUixwuLNejkzWI88AmCacdX5nMWDkZMB4mLtPQlevFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762634007; c=relaxed/simple;
	bh=c2LWraakpmg3mxV0+edqWBI7rHcddCmpwtIkCH9QOsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=AOFMPa9RVZ/0SPDzPuk9hx5juozEQbyKmN9lv5WT5b4xMdThhoZj956DJow/rh/VVxQSnVHRRb77Bh/DrRhFyz9r92EFUYeLWmdB4CRd0HwdvaXtnJXAqh86CDedIuNiuR4gfJ8eViSXo6htNkrP3P/kdQa7wanftckh5AmPoyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANJ4DMEc; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANJ4DMEc"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso1460033b3a.0
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Nov 2025 12:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762634005; x=1763238805; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnutrFNnADuElPkCgRYGMwgD00Rvo5g7BR50q/+9OiE=;
        b=ANJ4DMEc2VxTOXKacd3L68HutWg5WG21dV5r41/Wxo1GMQYod+QvUF8XLAAIj9ebp4
         vq0szYk4oWv4TvEEM9hYfBj29aHxMZIVea1bFtuumg88k3DAgEIPoBMbeDDiENVWr3Qx
         TWx2fge+6QsdbLQEObnofXfH4HJApBaVeyVHVM4fb2llsaD30ia4TYP0qZmA5PtLSfWL
         64f1fwcNISIRj7Z5Rr9r7D9sZU3Jm8520ADpWXVk6Vh+E766BKYfJa5o5O0eK4FCwP5E
         1AHzLPUkOOckEb7/uvcUiqNAW96jgEipBjXqYbsvYmmsSloOe4YaLrh1qN2QH10gO2gP
         Oy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762634005; x=1763238805;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xnutrFNnADuElPkCgRYGMwgD00Rvo5g7BR50q/+9OiE=;
        b=rnUdqmbN4AhLy+VZVDtbSmdbM58ZGuFWgjL/3eJDdmWaj7tx0mzh9CSx6/8lCNE96w
         uC3RA82LI+sbb3Ci5fVatxrErfmrC/xd0k5elW7YIGp8+7HZ/vMYO6CCfvyRC1LQOeIM
         27ErpKLOdjBPmGLJ1iJeHufkiWdD8spyaMu9VjQ6EEXnM+scHjm2t6iuZ9+V/E9Ew7cy
         9i6uypMhMDCFv/3Rf7iEiq7elw4ZWeeVa44Kh8ah6JbhFXGxQGJcNLJAhsB99sti6IYB
         kOAX+S8c7dvYkWDwXwX9SpA+00B0lEsDEehFmB+mytyTQ2BB9020LWzHDupFpXCXlgBZ
         a+tA==
X-Forwarded-Encrypted: i=1; AJvYcCWFfiRjKg3zYnAJ4xl3JrM6FSrprVUVgJALyRtO9y9ijq45yL0WcqLEb5dj011VL0iXQY66AVtUdi/p9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPk0m94YYdYearp1bSCDb0VSjAacZTvj0j/ZV3aunRYTdQPeQv
	5ybREi0U0jq8blKl0UEugLeTZ3fMsT88t4xRzH+uLY1CH+f6J/ry+VADTaCywcFBVYE+eruOvw/
	N3KCbN1UtN9dLww60swTAU7iLzWVrYj8=
X-Gm-Gg: ASbGnctKtfyPzizaN11rUa7P3jsqW18OLsi7pNF5Ufbjse9KprglI/n7laYN6+jdl8U
	PQEoarqbCQeXJUgLAuGuq5i3xKHrfzBY93XM4Cl4DajNvp7Di+0DSMR9QnQdar03sPmtzl7Fb04
	yVUgG7QtgsnWhHHHbts94jVIvaDZMMUebv3AA4B0lcWeuyMg47ON+Fq/I056hciDAob8nKzUEOC
	XXa74Pil+pmHqaC7zVpy6O9QZ6MIT30hpNqAILX7cW12MmUXwgpGD40LyUtdLKFLb/xJp9/9DXr
	HZW/XEHjvbYFnfw=
X-Google-Smtp-Source: AGHT+IFNbI9yH8LVT/3XDv5tV0M/SgLQiny44jkJR7Q9j1J/9pJfDm0lgreKbaZI6uab30D0ZBxSJYmE4Z+lNMISsCU=
X-Received: by 2002:a17:903:41d2:b0:297:e231:f410 with SMTP id
 d9443c01a7336-297e56448fbmr52941895ad.13.1762634005135; Sat, 08 Nov 2025
 12:33:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADGuG04vCTWJNDj-fPaEO-dQmk_P_Z-E+AYbZBeYt+GJ8Dtqtg@mail.gmail.com>
 <DU0P190MB244572B5A5516B6BB3E053EEBC0EA@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
 <CADGuG04Bc8Dcv=GCZGsjkW7taS4VR0yTkp=BC9tC90HtkssVRw@mail.gmail.com> <20251108005631.75acf1c4@minigeek.lan>
In-Reply-To: <20251108005631.75acf1c4@minigeek.lan>
From: =?UTF-8?Q?Horv=C3=A1th_Csaba?= <horvathcsabalaszlo@gmail.com>
Date: Sat, 8 Nov 2025 21:32:48 +0100
X-Gm-Features: AWmQ_bneYnPt_9Gfszegfa7M00HvsGQjz206__3qVaLU4IQ2EpBinlGnUShq8aA
Message-ID: <CADGuG05CMpcZBC45fJHV4iqdsD8+x2c6yNzfBUnYKErCZrJYrA@mail.gmail.com>
Subject: Re: Colorly e708q1 and AXP20x support
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your answer! :) I'll have a lot of questions, as i rarely
did a successful kernel compilation in the past, but definitely want
to learn.

Now i managed to try the defconfig only option with latest kernel.
Does not even boot i think, but at least  there is no output to LCD or
HDMI at all. (I tried to do some autologin and output dmesg stuff to a
file, but nothing happened.)
I followed this guide, which seems to be partially outdated.
https://linux-sunxi.org/Colorfly_e708q1 A lot of config changed in the
kernel since it was written, and for example i think this is why i
don't get display and PMIC. (So i don't know which displays to select
to compile in, and so on.)

I have managed to boot the device with an 5.5 stock kernel and Arch
during the summer, get network, and can collect information from that
instance.
I tried to set frequency in U-Boot settings, but seems it did nothing.
But, i did not tried with U-Boot compile options... so i'll give it a
try, thanks.
As a matter of interest, with the 5.5 kernel, there is no
/sys/kernel/debug/regulator/regulator_summary .
I have these  :
[root@alarm alarm]# ls /sys/kernel/debug/regulator/
0-0068-ldo_io0  dldo4                      rtc_ldo     vcc-pg    vdd-cpus
0-0068-ldo_io1  eldo1                      supply_map  vcc-wifi  vdd-gpu
aldo1           eldo2                      usb0-vbus   vcc3v0    vdd-sys-dl=
l
aldo2           eldo3                      vcc-3v0     vcc3v3
avcc            reg-dummy-regulator-dummy  vcc-dram    vcc5v0
dldo3           regulator_summary          vcc-lcd     vdd-cpu

But as soon as i try to set something, it frrezes or does nothing
(echoing freq to file, using cpufreq, etc.)

dmesg contains only this regarding to AXP20x
[root@alarm alarm]# dmesg |grep -i  axp
[    2.120467] axp20x-i2c 0-0068: AXP20x variant AXP221 found
[    2.150559] axp20x-usb-power-supply axp20x-usb-power-supply: DMA mask no=
t set
[    2.163684] axp20x-i2c 0-0068: AXP20X driver loaded
[   10.652559] input: axp20x-pek as
/devices/platform/soc/1f03400.i2c/i2c-0/0-0068/axp221-pek/input/input1
[   10.720847] axp20x-adc axp22x-adc: DMA mask not set

And a lot of dummy regulators. To be more accurate, only dummy regulators :=
D
[root@alarm alarm]# dmesg |grep dummy
[    0.002712] Console: colour dummy device 80x30
[    2.035323] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
supply vcc-pf not found, using dummy regulator
[    2.111902] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
supply vcc-pa not found, using dummy regulator
[    2.119381] sun6i-a31-r-pinctrl 1f02c00.pinctrl: 1f02c00.pinctrl
supply vcc-pl not found, using dummy regulator
[    2.129470] dcdc1: supplied by regulator-dummy
[    2.130898] dcdc2: supplied by regulator-dummy
[    2.131746] dcdc3: supplied by regulator-dummy
[    2.132585] dcdc4: supplied by regulator-dummy
[    2.133448] dcdc5: supplied by regulator-dummy
[    2.135439] aldo1: supplied by regulator-dummy
[    2.136268] aldo2: supplied by regulator-dummy
[    2.137123] aldo3: supplied by regulator-dummy
[    2.138508] eldo1: supplied by regulator-dummy
[    2.139374] eldo2: supplied by regulator-dummy
[    2.140217] eldo3: supplied by regulator-dummy
[    2.141077] dldo1: supplied by regulator-dummy
[    2.141907] dldo2: supplied by regulator-dummy
[    2.143906] dldo3: supplied by regulator-dummy
[    2.144762] dldo4: supplied by regulator-dummy
[    2.145619] rtc_ldo: supplied by regulator-dummy
[    2.145905] ldo_io0: supplied by regulator-dummy
[    2.146762] ldo_io1: supplied by regulator-dummy
[    2.166336] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
supply vcc-pf not found, using dummy regulator
[    2.167370] sun6i-a31-pinctrl 1c20800.pinctrl: 1c20800.pinctrl
supply vcc-pa not found, using dummy regulator
[    2.230116] usb_phy_generic usb_phy_generic.1.auto:
usb_phy_generic.1.auto supply vcc not found, using dummy regulator

Thanks in advance :)

Cs.

On Sat, Nov 8, 2025 at 1:57=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Thu, 11 Sep 2025 21:29:36 +0200
> Horv=C3=A1th Csaba <horvathcsabalaszlo@gmail.com> wrote:
>
> > Hi,
> >
> > Thanks!
> > Strange, as i tried to compile mainline kernel half a year ago, but it
> > had no support neither to display or the power chip. I don't even know
> > what needs to be selected in the config in order to get them working.
>
> I guess this is your problem: you are trying to compile a custom kernel
> with apparently a made-up config, which isn't easy. As you figured, you
> might miss many things, so it's best to use a well-known config as a
> base, either sunxi_defconfig, multi_v7_defconfig, or probably the best:
> the config from a distro kernel. The latter typically have all
> drivers compiling as a module, so it would be able to load what it
> needs automatically.
>
> But for a first experiment sunxi_defconfig should be alright,
> especially for old SoCs, and compiles most things into the kernel, so
> you don't need to mess with modules. You might just run into issues
> with distros, though, as you might miss some (new) options there.
>
> Regarding cpufreq: that indeed requires a bunch of drivers to all work
> (for instance a thermal sensor: CONFIG_MFD_SUN4I_GPADC), so try
> sunxi_defconfig. To avoid running too hot quickly, you can lower the
> initial frequency in U-Boot (CONFIG_SYS_CLK_FREQ), also you might want
> to lower the initial voltage, for more power savings:
> CONFIG_AXP_DCDC3_VOLT. Try 720 MHz at 1.1V, or 480 MHz at 1V, to be on
> the safe side.
>
> If you get it booted with that, scan dmesg for PMIC messages, or check
> /sys/kernel/debug/regulator/regulator_summary. Messages about dummy
> supplies in dmesg are normal, when there are no port supplies in the
> DT, and are not fatal.
>
> In general, to find a driver for a certain device:
> $ git grep x-powers,axp221 drivers/
> ...
> drivers/mfd/axp20x-i2c.c:       { .compatible =3D "x-powers,axp221", .dat=
a =3D (void *)AXP221_ID },
> ...
> $ git grep axp20x-i2c.o drivers/mfd/Makefile
> drivers/mfd/Makefile:obj-$(CONFIG_MFD_AXP20X_I2C)       +=3D axp20x-i2c.o
>                            ^^^^^^^^^^^^^^^^^^^^^
> Specifically the AXP uses several driver files, make sure you get all
> the options. Refer to dmesg and /sys/kernel/debug/devices_deferred to
> find missing drivers.
>
> Hope that helps for a first step, please come back with more specific
> information and questions, if needed.
>
> Cheers,
> Andre
>
> > (Tried to compile numerous displays in it, but did not help.)
> > Also, the AXP22x is referenced in the dts, and in the guide, there are
> > some lines to add to the U-Boot config, but nothing to the kernel. And
> > of course, does not work.
> >
> > So if anyone has any clue what to do (mostly what to compile in), i'll
> > be thankful - i have done some kernel compiling before, but not an
> > expert. Mostly not in devicetree objects. (It would be enough to have
> > a stock kernel and OS to boot, as the device will be only a character
> > display.)
> >
> > Thanks :)
> >
> > On Wed, Sep 10, 2025 at 6:33=E2=80=AFPM Subair Mullappilly <msubair@hot=
mail.com> wrote:
> > >
> > > Hi
> > >
> > > A31 has already upstream support,
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/boot/dts/allwinner?h=3Dv6.17-rc5
> > >
> > > your tablet device tree is already there, use upstream kernel, and it
> > > has support for display,
> > >
> > > i never used a31 chip, but used r40,a20 etc..
> > >
> > > Subair
> > >
> > > On 9/10/25 20:24, Horv=C3=A1th Csaba wrote:
> > > > Hi,
> > > >
> > > > I'm building a wireless display on a Colorfly e708q1 tablet. This i=
s
> > > > an A31s device, supported by Linux-Sunxi.
> > > > I have managed to install Arch and get Wifi with an 5.x (stock)
> > > > kernel, because with newer kernels compiled according to the guide =
at
> > > > https://linux-sunxi.org/Colorfly_e708q1 i had no display.  Debian a=
lso
> > > > works, but the device overheats, or freezes because of other cause.
> > > >
> > > > With this kernel, the only problem is that the AXP20x power control=
ler
> > > > is not working, therefore the device is very hot. I could not find =
any
> > > > information about how to get the AXP working. Basically i have no B=
AT
> > > > device, or any trace of working power management in the /dev or /sy=
s.
> > > >
> > > > Can someone please guide me how to get this working...?
> > > >
> > > > Thanks in advance :)
> > > >
> > > > Cs.
> > > >
> >
>
