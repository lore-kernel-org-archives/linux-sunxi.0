Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E8A7C
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 02:47:30 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id e10so9737611pgc.9
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Jan 2023 18:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=am+e+us3BLDD7QGRsiqJkjBJE7aGLxlXY/LYaOWOT8g=;
        b=I16equZNoisKW9rSvbwjnZy3fQDMW1QFcmfchN4pgkCz3jPvRFiFG2WOfoQMRreU9m
         0AdlPL+U5qLarVA2Sm6yrKI3NVv3bMqdwzk8UuqE9g5tRTCThlw9HQ9KgmDWFVQq2Nud
         34kayaNlrimIccAHm9qughkYcqHFoquxIcsi7ae3C1YyM7wuzoLTKoOmh/Z967e0JZ5q
         3wfuqGSE5ZNo3Ck49PSS4g0QcN2NF6kS6C/P8xtRUkBru7eqPoddHipl9SBQGjWvkA1X
         mItMmCB2oTMrbGZDnoktnfH4ZOfP71vfGyEHAx3VxTeUA/YOXBI2U7ppMkC9ghQ3h9ob
         IhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=am+e+us3BLDD7QGRsiqJkjBJE7aGLxlXY/LYaOWOT8g=;
        b=myBl6dPtadFCdp1zoQVy6OkaewWyyV0f7H2KyR+iJFVmV/+DleeqjIURoJvvmIQ6jJ
         bzVqWq66CbdPOGbbYa0ha9HHFU98Qepl5o75gBBdg7qtTWLCoS2uJc59zaFHqFOfHiWS
         bmhIcnqvCJFd5O4/Uq0m7X19Dr+1ADWTCXWOqZUGFacVCLaz2mKliz9GS43kJdibmQ/G
         HRNPWvtwQOznDfH0KRUIWzxD57OW/ErOPL4+A/aJYNdLYw6R3JD4jbC+3Hvg3iUHCEhE
         IC/V4gUgqFpQpZ7zJmxeMy4i5fxo1fQLMx8btJ6HLCCm6sej2HcEoOxHPsv5+u3qgzfF
         eSmg==
X-Gm-Message-State: AFqh2kqxkI5siij+Y4QnEKYNT6U1cHH5cPZNK/fsywN4zCd0ZYZUGQoA
	0JH6DfpDV9MvQ7YgQGvSl95x77xNjCuQxKaacZI=
X-Google-Smtp-Source: AMrXdXu3G+ffWQwHKkqzokgK+47HuYS3o7500TGCYPY/KvAcG+3iXpZIpXjJgHcgDsxp4EBNs2uBvzToMLv9yX3lDkc=
X-Received: by 2002:a63:f258:0:b0:479:54d0:8ca5 with SMTP id
 d24-20020a63f258000000b0047954d08ca5mr3588605pgk.563.1672886849571; Wed, 04
 Jan 2023 18:47:29 -0800 (PST)
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
 <CAKAF0m9ym7-fUre3nBF195do_fhp1PGcmiDuyYoTwNO_Lzb0_w@mail.gmail.com>
In-Reply-To: <CAKAF0m9ym7-fUre3nBF195do_fhp1PGcmiDuyYoTwNO_Lzb0_w@mail.gmail.com>
From: Kirill <kirill.zhumarin@gmail.com>
Date: Thu, 5 Jan 2023 04:47:18 +0200
Message-ID: <CAKAF0m-cGuOxhzGKtxu_hiD2XJVPwjt53dF4WFAYuAK6VisgPQ@mail.gmail.com>
Subject: Re: ddr devfreq on H3 - possible?
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh, sorry for the irrelevant report. I was really surprised when I got
pagefault even without SMC call (:
Previously I used the armbian unstable kernel (6.1.1). On stable
armbian kernel (5.15.x86) pagefault not reproduced in all cases.
It's just armbian's bugs...

I'll try to be more careful when preparing for the test environment. :)

I will continue testing.

=D1=87=D1=82, 5 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 01:26, Kirill <kiri=
ll.zhumarin@gmail.com>:
>
> Hi Samel!
>
> Sadly, it does not work stable :(
>
> I found a good way to stress-test the ddr dvfs process. Just switching
> between max/min freq every 0.5s.
> (Previously I tested with performance <-> simple ondemand, before I
> understood why not present other governors. And it wasn't enough.)
>
> My script for testing:
> ```
> #!/bin/bash
>
> while true
> do
> date
> echo "powersave" >
> /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-co=
ntroller/governor
> sleep 0.5
> echo "performance" >
> /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-co=
ntroller/governor
> sleep 0.5
> done
> ```
>
> Test cases:
> 1. Without module sun8i_a33_mbus: system stable, all works fine
> I checked my setup:
> - Every power source looks fine on oscilloscope
> - Kernel memtest (memtest=3D10) don't find any problem
> - Userspace tool memtester don't find any problem
>
> 2. Single CPU + sun8i_a33_mbus + script: Works fine for a long time
>
> 3. 2 or 4 CPUs: Page Fault! Seems to be RAM corrupting...
> ```
> [ 3890.960776] Unable to handle kernel paging request at virtual
> address 00044581
> [ 3890.968017] [00044581] *pgd=3D00000000
> [ 3890.971626] Internal error: Oops: 5 [#1] SMP THUMB2
> ```
> (full report: https://gist.github.com/Azq2/b2875ee228d1e68922d7c1f4f4e3f3=
df)
>
> I tried to implement "CPU locking in monitor mode" using SGI. But
> pagefaults still occur.
> And, also, it is too slow... I see how my input hangs on ssh...
> Code which I use:
> https://github.com/u-boot/u-boot/compare/master...Azq2:u-boot:new_test
>
> Maybe I incorrectly implemented SGI.
>
> =D0=BF=D0=BD, 2 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 04:20, Kirill <ki=
rill.zhumarin@gmail.com>:
> >
> > > Just to make sure -- is __gpio_debug declared with __secure?
> >
> > Yes
> >
> > > try calling psci_v7_flush_dcache_all() before setting PWRCTL.
> >
> > Hm... I'm not sure, but it seems to be working.... My OPi Lite works
> > ~one hour without any hangs!
> >
> > Of course, I need more time and tests to completely confirm that.
> > I will continue testing.
> >
> > Great thanks!!!
> >
> > Also, I did some extra work:
> > - Rewrited code to use u-boot registers and constants
> > - implemented enabling/disabling ODT
> > - implemented enabling/disabling self-refresh
> > - implemented custom PSCI tables for platform-specific functions in u-b=
oot
> >
> > And all of these also seem to be works.
> > My fork with changes:
> > https://github.com/Azq2/u-boot/commits/allwinner-h3-dram-dvfs
> >
> > =D0=BF=D0=BD, 2 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 00:20, Samuel H=
olland <samuel@sholland.org>:
> > >
> > > On 1/1/23 15:40, Kirill wrote:
> > > > I did a little debugging.
> > > > When hangs happens, CPU is always stuck on `writel(reg_val, PWRCTL)=
;`
> > > >
> > > > Example of my debug:
> > > > ```
> > > > /* 1. enter self-refresh and disable all master access */
> > > > reg_val =3D readl(PWRCTL);
> > > > reg_val |=3D (0x1<<0);
> > > > reg_val |=3D (0x1<<8);
> > > > __gpio_debug(2);
> > > > writel(reg_val, PWRCTL);
> > > > __gpio_debug(3);
> > > > __udelay(1);
> > > > __gpio_debug(4);
> > > > ```
> > > > __gpio_debug should not take any effect on the process, just switch=
ing GPIO's.
> > >
> > > Just to make sure -- is __gpio_debug declared with __secure?
> > >
> > > > Before hanging it can be worked for a few minutes. Hangs occur at
> > > > random manners.
> > > > Also hangs not depend on count of freq change.
> > >
> > > Hmm, the CPU hanging right when blocking access to DRAM suggests ther=
e
> > > is some asynchronous cache operation (prefetch or writeback) that is
> > > causes some DRAM traffic.
> > >
> > > I checked the U-Boot source code, and it disables both caches in the
> > > secure copy of SCTLR before setting up PSCI*. So there should not be =
any
> > > prefetching occurring while you are in monitor mode. But maybe there =
is
> > > some writeback from cache lines dirtied in non-secure state. You coul=
d
> > > try calling psci_v7_flush_dcache_all() before setting PWRCTL.
> > >
> > > If that does not help, I am not sure what else could be happening.
> > >
> > > Regards,
> > > Samuel
> > >
> > > * boot_jump_linux() -> announce_and_cleanup() -> cleanup_before_linux=
()
> > > -> cleanup_before_linux_select()
> > >
> > > > I tried something like this for fastest bug reproduction:
> > > > ```
> > > > while true
> > > > do
> > > >   echo "simple_ondemand" >
> > > > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.d=
ram-controller/governor
> > > >   sleep 5
> > > >   echo "performance" >
> > > > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.d=
ram-controller/governor
> > > >   sleep 5
> > > > done
> > > > ```
> > > >
> > > > No effect, it still happens randomly :)
> > > >
> > > >> You can send a SGI IPI to the other three CPUs and force them to
> > > >> trap into the secure monitor.
> > > >
> > > > Thanks, I will try this later.
> > > >
> > > > P.S. Sorry for the duplicate, I forgot "Answer to All" in gmail :(
> > > >
> > > > =D1=81=D0=B1, 31 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 22:45, Sam=
uel Holland <samuel@sholland.org>:
> > > >>
> > > >> Hi Kirill,
> > > >>
> > > >> On 12/31/22 05:15, Kirill wrote:
> > > >>> Hi!
> > > >>>
> > > >>> I ported your patches for armbian kernel 6.1 / u-boot and it work=
s!
> > > >>>
> > > >>>> It works, though it did lock up once after playing with the devf=
req
> > > >>>> sysfs for several minutes
> > > >>>
> > > >>> Yes, I have hangs too. And the main reason for this problem - SMP=
. :(
> > > >>>
> > > >>> By calling SMC we put only one CPU into SRAM. But other CPUs stil=
l
> > > >>> work and use DRAM!
> > > >>> I don't see any hangs, if I disable all other CPUs:
> > > >>> ```
> > > >>> echo 0 > /sys/devices/system/cpu/cpu1/online
> > > >>> echo 0 > /sys/devices/system/cpu/cpu2/online
> > > >>> echo 0 > /sys/devices/system/cpu/cpu3/online
> > > >>> ```
> > > >>
> > > >> Thanks for investigating. That's good information.
> > > >>
> > > >>> Original sunxi 3.4 kernel uses some dirty hack[2] to get around t=
his problem.
> > > >>>
> > > >>> They call mdfs_pause_cpu[1] for each CPU core (except current)
> > > >>> This function located in the SRAM and locks CPU in infinity loop,
> > > >>> until `set_paused(false)` called on CPU0
> > > >>> Also, legacy rockchip kernels use same hack[3].
> > > >>>
> > > >>> But this method is not ideal...
> > > >>> Before changing DDR freq we must make sure which each kernel is s=
tuck
> > > >>> on the SRAM function. But this is a very long process.
> > > >>> In my proof-of-concept implementation sometimes elapses *few seco=
nds*
> > > >>> between I call smp_call_function and all cores stucking in SRAM
> > > >>> function.
> > > >>> This method may be suitable for manual freq change. But not for
> > > >>> automatic governor mode. No chance to change frequency on heavy l=
oaded
> > > >>> CPUs.
> > > >>>
> > > >>> We need another way.
> > > >>>
> > > >>> I think, code on PSCI must stop/suspend any other working cpu cor=
es
> > > >>> before update freq. This is possible?
> > > >>
> > > >> It _shouldn't_ be necessary. Setting bit 8 in PWRCTL blocks the DR=
AM
> > > >> controller's host interface, which should cause the L2 cache subsy=
stem
> > > >> (and thus the other CPUs) to stall when trying to access DRAM. Thi=
s is
> > > >> what the MDFS hardware does on A64/H5, and I have seen no hangs th=
ere.
> > > >>
> > > >> Possibly the issue is that such a stall sometimes affects the CPU =
that
> > > >> is running from SRAM, even though it should not. (On the other han=
d,
> > > >> when using the MDFS hardware, it is okay if all four CPUs temporar=
ily
> > > >> stall at the same time.)
> > > >>
> > > >> One thing to check is if sunxi_dram_dvfs_req() completes successfu=
lly.
> > > >> That function contains some unbounded loops, so it is possible to =
get
> > > >> stuck. You could toggle a GPIO or something at the end of the func=
tion.
> > > >> That would distinguish between "the secure monitor hung" and "we l=
eft
> > > >> the DRAM controller in a bad state and hung when switching back to=
 code
> > > >> in DRAM" or even "we trashed the contents of DRAM".
> > > >>
> > > >> We do use the architectural timer inside sunxi_dram_dvfs_req(), bu=
t
> > > >> those registers are banked between secure/non-secure states, so th=
at
> > > >> should not interfere with Linux's use of the timer.
> > > >>
> > > >> However, your test with offlining the other CPUs suggests we may r=
eally
> > > >> need some synchronization. I would suggest doing this inside U-Boo=
t as
> > > >> well. You can send a SGI IPI to the other three CPUs and force the=
m to
> > > >> trap into the secure monitor. Not only will this be immediate, but=
 it
> > > >> will also ensure the other CPUs are running from SRAM during the
> > > >> reclocking. You can take inspiration from the existing IPI code in=
 psci.c.
> > > >>
> > > >> It is quite convenient to be truly in control, so you can do thing=
s
> > > >> behind the OS's back, and keep it blissfully unaware. :)
> > > >>
> > > >> Regards,
> > > >> Samuel
> > > >>
> > > >>> [1] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/=
master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L638
> > > >>> [2] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/=
master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1088
> > > >>> [3] https://github.com/bbelos/rk3188-kernel/blob/master/arch/arm/=
plat-rk/ddr_freq.c#L168
> > > >>>
> > > >>> P.S. sorry for duplicate, previous message declined by mlmmj
> > > >>>
> > > >>>
> > > >>> =D1=87=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 19:29, S=
amuel Holland <samuel@sholland.org>:
> > > >>>>
> > > >>>> Hi Kirill,
> > > >>>>
> > > >>>> On 12/28/22 07:10, Kirill wrote:
> > > >>>>> I'm trying to use your driver with h3, but have this result:
> > > >>>>> ```
> > > >>>>> [  387.306429] sun8i-h3-mbus 1c62000.dram-controller: Detected =
32-bit
> > > >>>>> DDRx with ODT
> > > >>>>> [  388.450262] sun8i-h3-mbus 1c62000.dram-controller: Using 155=
54/243750
> > > >>>>> (6%) at 1248 MHz
> > > >>>>> [  389.906319] sun8i-h3-mbus 1c62000.dram-controller: Using 107=
9/243750
> > > >>>>> (0%) at 1248 MHz
> > > >>>>> [  389.914314] sun8i-h3-mbus 1c62000.dram-controller: Setting D=
RAM to
> > > >>>>> 156 MHz, tREFI=3D19, tRFC=3D28, ODT=3Ddisabled
> > > >>>>> ```
> > > >>>>>
> > > >>>>> After this CPU hangs and not responding.
> > > >>>>> Is possible (at least theoretically) to use this driver with H3=
?
> > > >>>>
> > > >>>> Yes, although it will need some help from firmware. If you look =
at the
> > > >>>> vendor driver[1] (pick any random Allwinner 4.9 tree), you will =
see
> > > >>>> there is no mdfs_dfs() implementation for CONFIG_ARCH_SUN8IW7P1 =
(H3).
> > > >>>> The driver always calls mdfs_main(), which is a standalone progr=
am
> > > >>>> loaded to SRAM. The reason seems to be that the MDFS hardware is=
 broken,
> > > >>>> as you found out.
> > > >>>>
> > > >>>> Something like this standalone MDFS application is not upstreama=
ble, but
> > > >>>> conveniently we already have some firmware running from SRAM, na=
mely
> > > >>>> U-Boot's PSCI/secure monitor implementation. And Allwinner alrea=
dy has
> > > >>>> some chips where they call a SMC to do this MDFS procedure[2]. S=
o we can
> > > >>>> reuse that SMC function ID, and put the code in in the secure mo=
nitor.
> > > >>>> I've thrown together U-Boot[3] and Linux[4] patches as a proof o=
f concept.
> > > >>>>
> > > >>>> It works, though it did lock up once after playing with the devf=
req
> > > >>>> sysfs for several minutes. The contents of sunxi_dram_dvfs_req()=
 are
> > > >>>> just copied from the vendor driver; they could surely be improve=
d.
> > > >>>>
> > > >>>> The U-Boot patch is based on my series adding Crust support for =
H3, so I
> > > >>>> could have interactive peek/poke from the AR100 even when the DR=
AM
> > > >>>> controller is dead. It shouldn't be too hard to rebase that out =
and move
> > > >>>> the code to psci.c.
> > > >>>>
> > > >>>> I'm not sure the best way to upstream the changes to psci.S. Pro=
bably we
> > > >>>> need some platform callback to handle unknown function IDs.
> > > >>>>
> > > >>>> Regards,
> > > >>>> Samuel
> > > >>>>
> > > >>>> [1]:
> > > >>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/dr=
ivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1411
> > > >>>> [2]:
> > > >>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/dr=
ivers/devfreq/sunxi-mdfs.h#L38
> > > >>>> [3]: https://github.com/smaeul/u-boot/commits/patch/h3-dram-devf=
req
> > > >>>> [4]: https://github.com/smaeul/linux/commits/wip/devfreq-a83t
> > > >>>>
> > > >>
> > >
