Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B84BA2E
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Jan 2023 23:26:48 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id e21so14493616pfl.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Jan 2023 15:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQKNxKej2KmkTi99FT52UhW4VorIkY9NoXQQHCJwDYg=;
        b=NdSH/edaw/+NLim/9100DRYLZZlIE/pngXySuLoRSHVRurSC6EEg2hIXxUnZGRcuV+
         6v7Zz7Ce/ve5FBg4c3axGdFYLttdnzxXWQ9TEYUc28VpxeTLcroFfzohNhP6ohKJ49+S
         FXsc3fN3aLn+c4r10mTN2zdlXYsYziwa/jVM4FlxrgmJW5ld3Srgib4MRTaOQhzkuEK+
         QFN3gcoRtpB6RRRq69c9OQbAqCclto1uQD87TJ0jIrkRnrJYBegXWdn9qaAWHxROXyWb
         pDSZBHBEh+JpVwayzgoeipwcXytg34521t+aVG38LfMGCKLH48ifdXXmpFWzeSxhpVf1
         4wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQKNxKej2KmkTi99FT52UhW4VorIkY9NoXQQHCJwDYg=;
        b=LPc6yabrMZa9sUXtaoOlv6j4RPfss5lHk9wbIfcTjcO1T0+vFcD9r/E+fBBXpouwzH
         CLv9hEx2ISylqVP2bvYPHuKoRS/8fSMIzuen3QaTB+skbYzPHhMMaB+jzanXyuQJKFKD
         GCguXNG+MP+uysnl9Yd6M5LDlh7jYpGNNZE/UXE1j16d/f+xDNNGL0Oru9ZPWcRGxJUt
         NF7UaJK9RLhhgcXbioQXt0ovyXbuqst6F+eywNCgFturo3sqAhj5vZZd9kiy8e4N5Syd
         hay12SCaPoZtKRWlhpcX64rZpBXfAubvkR9vRccSqTIcL92NCOBw8y0UHrB1tT6ad9wJ
         Ymfw==
X-Gm-Message-State: AFqh2kqHldX+lGey3pypFSPxQHafWNWrdx98kBPyqTcKve0g9novkVlz
	hk546/xzC3e6sLiyfG0nlC0kiMt+AU6/NjDKOesJ9x4sSghrZA==
X-Google-Smtp-Source: AMrXdXvg/8WjAVJQEySAdtrVihAmbWAFgHua81rgCat51HOBYp7SjBtMoFEOWPvSSpDE4gdlbhW4HUK1n4DUpZ6KoSw=
X-Received: by 2002:a63:48d:0:b0:46e:bcc1:28df with SMTP id
 135-20020a63048d000000b0046ebcc128dfmr3244319pge.187.1672874807901; Wed, 04
 Jan 2023 15:26:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKAF0m9DqPjB6C39ZbrRHFrJOodm7WQGTL0x1jduQjNU=JpQ2g@mail.gmail.com>
 <d49cb79d-1405-c2cc-0c33-a768c5bbde91@sholland.org> <CAKAF0m984-tY+r+NXdND5hTHAQ55mk_XLjr2y+OBjKMNhS+e1g@mail.gmail.com>
 <8e7e9d95-a3c1-059d-1e13-20e69c23da46@sholland.org> <CAKAF0m-DQKBc-mfDsQESAA1NvZ1bAWfo-sp4tWqfWWaGhKUwww@mail.gmail.com>
 <6cffb621-8ba2-957e-9cbb-3b139448fd12@sholland.org> <CAKAF0m9SnNx=cutfGc7Mw+n6YLtrJQAP+kRe+VwX1WqRHiWbnQ@mail.gmail.com>
In-Reply-To: <CAKAF0m9SnNx=cutfGc7Mw+n6YLtrJQAP+kRe+VwX1WqRHiWbnQ@mail.gmail.com>
From: Kirill <kirill.zhumarin@gmail.com>
Date: Thu, 5 Jan 2023 01:26:36 +0200
Message-ID: <CAKAF0m9ym7-fUre3nBF195do_fhp1PGcmiDuyYoTwNO_Lzb0_w@mail.gmail.com>
Subject: Re: ddr devfreq on H3 - possible?
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Samel!

Sadly, it does not work stable :(

I found a good way to stress-test the ddr dvfs process. Just switching
between max/min freq every 0.5s.
(Previously I tested with performance <-> simple ondemand, before I
understood why not present other governors. And it wasn't enough.)

My script for testing:
```
#!/bin/bash

while true
do
date
echo "powersave" >
/sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-cont=
roller/governor
sleep 0.5
echo "performance" >
/sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-cont=
roller/governor
sleep 0.5
done
```

Test cases:
1. Without module sun8i_a33_mbus: system stable, all works fine
I checked my setup:
- Every power source looks fine on oscilloscope
- Kernel memtest (memtest=3D10) don't find any problem
- Userspace tool memtester don't find any problem

2. Single CPU + sun8i_a33_mbus + script: Works fine for a long time

3. 2 or 4 CPUs: Page Fault! Seems to be RAM corrupting...
```
[ 3890.960776] Unable to handle kernel paging request at virtual
address 00044581
[ 3890.968017] [00044581] *pgd=3D00000000
[ 3890.971626] Internal error: Oops: 5 [#1] SMP THUMB2
```
(full report: https://gist.github.com/Azq2/b2875ee228d1e68922d7c1f4f4e3f3df=
)

I tried to implement "CPU locking in monitor mode" using SGI. But
pagefaults still occur.
And, also, it is too slow... I see how my input hangs on ssh...
Code which I use:
https://github.com/u-boot/u-boot/compare/master...Azq2:u-boot:new_test

Maybe I incorrectly implemented SGI.

=D0=BF=D0=BD, 2 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 04:20, Kirill <kiri=
ll.zhumarin@gmail.com>:
>
> > Just to make sure -- is __gpio_debug declared with __secure?
>
> Yes
>
> > try calling psci_v7_flush_dcache_all() before setting PWRCTL.
>
> Hm... I'm not sure, but it seems to be working.... My OPi Lite works
> ~one hour without any hangs!
>
> Of course, I need more time and tests to completely confirm that.
> I will continue testing.
>
> Great thanks!!!
>
> Also, I did some extra work:
> - Rewrited code to use u-boot registers and constants
> - implemented enabling/disabling ODT
> - implemented enabling/disabling self-refresh
> - implemented custom PSCI tables for platform-specific functions in u-boo=
t
>
> And all of these also seem to be works.
> My fork with changes:
> https://github.com/Azq2/u-boot/commits/allwinner-h3-dram-dvfs
>
> =D0=BF=D0=BD, 2 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 00:20, Samuel Hol=
land <samuel@sholland.org>:
> >
> > On 1/1/23 15:40, Kirill wrote:
> > > I did a little debugging.
> > > When hangs happens, CPU is always stuck on `writel(reg_val, PWRCTL);`
> > >
> > > Example of my debug:
> > > ```
> > > /* 1. enter self-refresh and disable all master access */
> > > reg_val =3D readl(PWRCTL);
> > > reg_val |=3D (0x1<<0);
> > > reg_val |=3D (0x1<<8);
> > > __gpio_debug(2);
> > > writel(reg_val, PWRCTL);
> > > __gpio_debug(3);
> > > __udelay(1);
> > > __gpio_debug(4);
> > > ```
> > > __gpio_debug should not take any effect on the process, just switchin=
g GPIO's.
> >
> > Just to make sure -- is __gpio_debug declared with __secure?
> >
> > > Before hanging it can be worked for a few minutes. Hangs occur at
> > > random manners.
> > > Also hangs not depend on count of freq change.
> >
> > Hmm, the CPU hanging right when blocking access to DRAM suggests there
> > is some asynchronous cache operation (prefetch or writeback) that is
> > causes some DRAM traffic.
> >
> > I checked the U-Boot source code, and it disables both caches in the
> > secure copy of SCTLR before setting up PSCI*. So there should not be an=
y
> > prefetching occurring while you are in monitor mode. But maybe there is
> > some writeback from cache lines dirtied in non-secure state. You could
> > try calling psci_v7_flush_dcache_all() before setting PWRCTL.
> >
> > If that does not help, I am not sure what else could be happening.
> >
> > Regards,
> > Samuel
> >
> > * boot_jump_linux() -> announce_and_cleanup() -> cleanup_before_linux()
> > -> cleanup_before_linux_select()
> >
> > > I tried something like this for fastest bug reproduction:
> > > ```
> > > while true
> > > do
> > >   echo "simple_ondemand" >
> > > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dra=
m-controller/governor
> > >   sleep 5
> > >   echo "performance" >
> > > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dra=
m-controller/governor
> > >   sleep 5
> > > done
> > > ```
> > >
> > > No effect, it still happens randomly :)
> > >
> > >> You can send a SGI IPI to the other three CPUs and force them to
> > >> trap into the secure monitor.
> > >
> > > Thanks, I will try this later.
> > >
> > > P.S. Sorry for the duplicate, I forgot "Answer to All" in gmail :(
> > >
> > > =D1=81=D0=B1, 31 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 22:45, Samue=
l Holland <samuel@sholland.org>:
> > >>
> > >> Hi Kirill,
> > >>
> > >> On 12/31/22 05:15, Kirill wrote:
> > >>> Hi!
> > >>>
> > >>> I ported your patches for armbian kernel 6.1 / u-boot and it works!
> > >>>
> > >>>> It works, though it did lock up once after playing with the devfre=
q
> > >>>> sysfs for several minutes
> > >>>
> > >>> Yes, I have hangs too. And the main reason for this problem - SMP. =
:(
> > >>>
> > >>> By calling SMC we put only one CPU into SRAM. But other CPUs still
> > >>> work and use DRAM!
> > >>> I don't see any hangs, if I disable all other CPUs:
> > >>> ```
> > >>> echo 0 > /sys/devices/system/cpu/cpu1/online
> > >>> echo 0 > /sys/devices/system/cpu/cpu2/online
> > >>> echo 0 > /sys/devices/system/cpu/cpu3/online
> > >>> ```
> > >>
> > >> Thanks for investigating. That's good information.
> > >>
> > >>> Original sunxi 3.4 kernel uses some dirty hack[2] to get around thi=
s problem.
> > >>>
> > >>> They call mdfs_pause_cpu[1] for each CPU core (except current)
> > >>> This function located in the SRAM and locks CPU in infinity loop,
> > >>> until `set_paused(false)` called on CPU0
> > >>> Also, legacy rockchip kernels use same hack[3].
> > >>>
> > >>> But this method is not ideal...
> > >>> Before changing DDR freq we must make sure which each kernel is stu=
ck
> > >>> on the SRAM function. But this is a very long process.
> > >>> In my proof-of-concept implementation sometimes elapses *few second=
s*
> > >>> between I call smp_call_function and all cores stucking in SRAM
> > >>> function.
> > >>> This method may be suitable for manual freq change. But not for
> > >>> automatic governor mode. No chance to change frequency on heavy loa=
ded
> > >>> CPUs.
> > >>>
> > >>> We need another way.
> > >>>
> > >>> I think, code on PSCI must stop/suspend any other working cpu cores
> > >>> before update freq. This is possible?
> > >>
> > >> It _shouldn't_ be necessary. Setting bit 8 in PWRCTL blocks the DRAM
> > >> controller's host interface, which should cause the L2 cache subsyst=
em
> > >> (and thus the other CPUs) to stall when trying to access DRAM. This =
is
> > >> what the MDFS hardware does on A64/H5, and I have seen no hangs ther=
e.
> > >>
> > >> Possibly the issue is that such a stall sometimes affects the CPU th=
at
> > >> is running from SRAM, even though it should not. (On the other hand,
> > >> when using the MDFS hardware, it is okay if all four CPUs temporaril=
y
> > >> stall at the same time.)
> > >>
> > >> One thing to check is if sunxi_dram_dvfs_req() completes successfull=
y.
> > >> That function contains some unbounded loops, so it is possible to ge=
t
> > >> stuck. You could toggle a GPIO or something at the end of the functi=
on.
> > >> That would distinguish between "the secure monitor hung" and "we lef=
t
> > >> the DRAM controller in a bad state and hung when switching back to c=
ode
> > >> in DRAM" or even "we trashed the contents of DRAM".
> > >>
> > >> We do use the architectural timer inside sunxi_dram_dvfs_req(), but
> > >> those registers are banked between secure/non-secure states, so that
> > >> should not interfere with Linux's use of the timer.
> > >>
> > >> However, your test with offlining the other CPUs suggests we may rea=
lly
> > >> need some synchronization. I would suggest doing this inside U-Boot =
as
> > >> well. You can send a SGI IPI to the other three CPUs and force them =
to
> > >> trap into the secure monitor. Not only will this be immediate, but i=
t
> > >> will also ensure the other CPUs are running from SRAM during the
> > >> reclocking. You can take inspiration from the existing IPI code in p=
sci.c.
> > >>
> > >> It is quite convenient to be truly in control, so you can do things
> > >> behind the OS's back, and keep it blissfully unaware. :)
> > >>
> > >> Regards,
> > >> Samuel
> > >>
> > >>> [1] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/ma=
ster/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L638
> > >>> [2] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/ma=
ster/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1088
> > >>> [3] https://github.com/bbelos/rk3188-kernel/blob/master/arch/arm/pl=
at-rk/ddr_freq.c#L168
> > >>>
> > >>> P.S. sorry for duplicate, previous message declined by mlmmj
> > >>>
> > >>>
> > >>> =D1=87=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 19:29, Sam=
uel Holland <samuel@sholland.org>:
> > >>>>
> > >>>> Hi Kirill,
> > >>>>
> > >>>> On 12/28/22 07:10, Kirill wrote:
> > >>>>> I'm trying to use your driver with h3, but have this result:
> > >>>>> ```
> > >>>>> [  387.306429] sun8i-h3-mbus 1c62000.dram-controller: Detected 32=
-bit
> > >>>>> DDRx with ODT
> > >>>>> [  388.450262] sun8i-h3-mbus 1c62000.dram-controller: Using 15554=
/243750
> > >>>>> (6%) at 1248 MHz
> > >>>>> [  389.906319] sun8i-h3-mbus 1c62000.dram-controller: Using 1079/=
243750
> > >>>>> (0%) at 1248 MHz
> > >>>>> [  389.914314] sun8i-h3-mbus 1c62000.dram-controller: Setting DRA=
M to
> > >>>>> 156 MHz, tREFI=3D19, tRFC=3D28, ODT=3Ddisabled
> > >>>>> ```
> > >>>>>
> > >>>>> After this CPU hangs and not responding.
> > >>>>> Is possible (at least theoretically) to use this driver with H3?
> > >>>>
> > >>>> Yes, although it will need some help from firmware. If you look at=
 the
> > >>>> vendor driver[1] (pick any random Allwinner 4.9 tree), you will se=
e
> > >>>> there is no mdfs_dfs() implementation for CONFIG_ARCH_SUN8IW7P1 (H=
3).
> > >>>> The driver always calls mdfs_main(), which is a standalone program
> > >>>> loaded to SRAM. The reason seems to be that the MDFS hardware is b=
roken,
> > >>>> as you found out.
> > >>>>
> > >>>> Something like this standalone MDFS application is not upstreamabl=
e, but
> > >>>> conveniently we already have some firmware running from SRAM, name=
ly
> > >>>> U-Boot's PSCI/secure monitor implementation. And Allwinner already=
 has
> > >>>> some chips where they call a SMC to do this MDFS procedure[2]. So =
we can
> > >>>> reuse that SMC function ID, and put the code in in the secure moni=
tor.
> > >>>> I've thrown together U-Boot[3] and Linux[4] patches as a proof of =
concept.
> > >>>>
> > >>>> It works, though it did lock up once after playing with the devfre=
q
> > >>>> sysfs for several minutes. The contents of sunxi_dram_dvfs_req() a=
re
> > >>>> just copied from the vendor driver; they could surely be improved.
> > >>>>
> > >>>> The U-Boot patch is based on my series adding Crust support for H3=
, so I
> > >>>> could have interactive peek/poke from the AR100 even when the DRAM
> > >>>> controller is dead. It shouldn't be too hard to rebase that out an=
d move
> > >>>> the code to psci.c.
> > >>>>
> > >>>> I'm not sure the best way to upstream the changes to psci.S. Proba=
bly we
> > >>>> need some platform callback to handle unknown function IDs.
> > >>>>
> > >>>> Regards,
> > >>>> Samuel
> > >>>>
> > >>>> [1]:
> > >>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/driv=
ers/devfreq/dramfreq/sunxi-ddrfreq.c#L1411
> > >>>> [2]:
> > >>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/driv=
ers/devfreq/sunxi-mdfs.h#L38
> > >>>> [3]: https://github.com/smaeul/u-boot/commits/patch/h3-dram-devfre=
q
> > >>>> [4]: https://github.com/smaeul/linux/commits/wip/devfreq-a83t
> > >>>>
> > >>
> >
