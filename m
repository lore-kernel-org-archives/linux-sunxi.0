Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6981991CB
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 20:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763323982; cv=none; b=Bfv0lgqE1e1VQsB38OZsRqZm08lIDv/1xTN059tbm0V46h2gMPRPT5yukKVrGU44FgaOugfF9iCWQzrH0+8SYJ7NiX8T7KVngKzLBfxvWz6JLYoSjwHMaSeEdhwdaaGk/K7RbVKNIDa3CS2ennXqVu0jHupUnewV1K9E+CeT30Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763323982; c=relaxed/simple;
	bh=esdr2qDVKUI7jjAX4drg3GaE26oPprzoDaZg4bLlYOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=cQ9jz8LePfvCo5si8tOfaGQ/Ei/TnhqpIDkrLE+j0a3Wis2mLTRF9672nlg7vWBo5d+Qri3mHlYdY53ylm7+no0IGuhzXlcwhVYS3cz1FSyGLq/+kzk/fKoRTyyfM3lkGBqszUPmpCh2Byk70d3z4BtCFdGakt76PHN8QlDAUbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INlkJY4a; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INlkJY4a"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bc8ceb76c04so1325056a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 12:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763323980; x=1763928780; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWl/tMzqUruDN+cjoQH162k7127fasz52R3bsVxsmqE=;
        b=INlkJY4alMeJDlpw8O8Z4sCroOs6SWZV6uUGT3/iJHu2nCxeuplIaGqZX+xFjCNaUm
         bUpuQyJoNoYPdmP/8O+B4+JjPdDCWmnTA1vL9mUd8iFWzJVaajWf5zh1qJny3zy1JNEW
         2N01Fwi4rmuyq0yroCpogyYYDmeq5Z+oLTsirvWHpPMVdNDg5Szo+7c0TX2BKIVlNLkJ
         g+3yKun5fmeCGyLVACy6cKToxtsNiUyaI/O7KKsQyEI7eHw3kb5srY0b41aO2k37DVv+
         e1wWy2fl4TqkCGiH80oUuJXxiXaGV9kblCUozn9p297+f0ktp904b0vqHeZZCelJiF0L
         tzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763323980; x=1763928780;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWl/tMzqUruDN+cjoQH162k7127fasz52R3bsVxsmqE=;
        b=KOB1wr2bag6Eo78M/uG8ATUpHiS4NrFhUmiyPf+O7pZk707ZfVLYMiqHBnVPbWxKad
         cUoOz0CjzIj97J5RWoIUlXEC7Ol2rUPeWNP5wrP9bTZBuZd/dq9dtRz9/uMSuyfdoTnx
         5QtCEXKl09Jj+aZ3NQLjVYgJ8CB3KyX3Ytb55vHgYL9hbfH+b+7fC8szoj3DHEJBe5bh
         gQl6W4KJ4lppLUBmoGzCGHSUdqd768VVYW2aNOXXKkw8fstB0e0+Pw0IhO9BP9P5sei5
         4RMOefMIBXAKvJxWwxYjWQ0rWG7V6S9odv+JkeI4BeZDzQchcGjCy93hZblwsIYW9SkJ
         hPAg==
X-Forwarded-Encrypted: i=1; AJvYcCXLC/5hTJJVMFKb3ASiO6gA9i7AcqlE/w9XXmllT8F+QOg3P3dRyffd9lrBTQ5Q/15JQiuGQ3CkNk3fsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDpcOnu0vdIz6jCmr5hljQ+ipuUbgMlN0FPWt+zQhR+n6D9r4P
	YrBDzhUSv3Kk0eaiXpF79vfQ7YnpjZkX/OCu2/q0zG/FoTsiDKexzWZthPr8e51D+Wx9N458g3e
	KTPgUeM7oC9PSe/myMQdxm8W9GQrWNSujVibxNYqVug==
X-Gm-Gg: ASbGncucKxC3GNASL7OuMnUWyH4erctmdVtc7xIawrZqWZs887yMuUvr5fV8N5xHgKZ
	vqo4VSeauOOOwVaJu4PKLF8LWe0YfiXTdTnPtqDobh5lgzMAIsMfQAD0k7YSsGFZttvRwuIhc1m
	SpiOgRfmj3sS3WHx4+nLuFipteRW2DLGwdklX0hngsDrhi3moPYk1Z5CZ7qb1QbNkbXfLlDrX8k
	WDyws56Hyiz68adSgVu+m4f4DEo/X0A74rk+whXxTROhSWuIZY+lXfJuAUz4wmB9Npc0c8vaFKs
	+H+xXzsIT69KHZM=
X-Google-Smtp-Source: AGHT+IEgYV2NGeStWc4Xqq/OZBMk2zDNoFSBmkTrSoM/YZIvrDzXj9iV+NAkvcM7kwaRLzm3T9ml+26cOB11pLNS5Ac=
X-Received: by 2002:a05:7301:db0a:b0:2a4:3593:c7d5 with SMTP id
 5a478bee46e88-2a4abb32e23mr4814270eec.21.1763323979908; Sun, 16 Nov 2025
 12:12:59 -0800 (PST)
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
Date: Sun, 16 Nov 2025 21:12:23 +0100
X-Gm-Features: AWmQ_bmHpPVxPa5Xs3d3ftPKgqlcFOnI51UomVNVhivHRDUliJ7fg5jXi-KJzAg
Message-ID: <CADGuG04GsM9Jpz0MfX+gHUnpNbH9Ff0fY_n3r+GX-tuVQz4R7g@mail.gmail.com>
Subject: Re: Colorly e708q1 and AXP20x support
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry, i was down with flu for a week.

Now i had time to play around, and tried the U-Boot method. While
successfully compiled it with the modified frequency and voltage, it
had no effect. I think no effect for the U-Boot itself (this latest
U-Boot doesn't have an option for cpu list command to display CPU info
at boot). Neither the booted OS.

"I guess this is your problem: you are trying to compile a custom kernel
with apparently a made-up config, which isn't easy."
I have used the Colorfly manual, so it's made-up, but also it's the
config what should work.

I tried with the sunxi-defconfig, but it does not boot (OK, in fact
is, but no display at all)

Will try the options you mentioned with mainline kernel soon :)

Thanks!

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
