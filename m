Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22175320B
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 20:57:47 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so3186171pjg.5
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Jan 2023 12:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVjsFlBvfF10jolKUP9afbzhuAvIgRQcnXNhUKyHY9Y=;
        b=XRTtR2KcKq06dz+ibuPzaUXBlbQGqxGrwFTV50HVvhJGp03snRToLY40LSwOWt3n5e
         ypzo5K9xE5C8+lNpwiuoSZe6qT2eF8OI6zlnDyTsHvasOYa4GelnAaptrIVlzmHULrbI
         vJ5/ZjpcQSOYepPlLNai/uZjVxl/VR0X9fot1OHS9WrJIukyygdazOiyeP9pYO4bxfD/
         apA7za/Sm/OCdLCUcrVCJaEc2HDD8Vcx2mMGckgPc64B/X1MT2re5p9eMaPjQTT3xWK0
         OScq3zhRAg0i9aoT/CxWNZG8z+nQIoFZFB8xstvi1XU+FUI5tq7uhDK5ORg/qWUmghzP
         KuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVjsFlBvfF10jolKUP9afbzhuAvIgRQcnXNhUKyHY9Y=;
        b=5hkB11CguGw3zUb4hkTl1UekmoL0u5wU259XiDOWCAWvmJNKqFGyN2KCsSF1SveezV
         IFzG3pPw4CNOS3y3Dk+UtXOSypIpFKp6uReukjTh9tMsf4QxlnIQhYHXwJ2J+60t231W
         xnNe9xCJcB92Y+IDgQMnNYfwXGh7+o2tKlkjBKTTpCCy4/N5DE/IkAbHLqMKtn8fi3vR
         EOralQoDvNFJMsypQuQwdfNNrsb5lsAuqBSsGa3sgFUrG7Cgnmce9qX/rC+31NepJfVs
         V02cUUe2izMAIIU08t+hEhtir6mjzPiA3qZRb+JGlRusiv1VZXQd//g40BRGNLAVIpbx
         t0VQ==
X-Gm-Message-State: AFqh2kqkbJIF0+z0A/yK6mXbhCxWT1NE9lPiY+Yt2267TMoor5SJ+hlX
	k9BVZEgdPjAUWVuNeOkp25ORBhA/3TBzxQVA6uo=
X-Google-Smtp-Source: AMrXdXsPfMvLnlb5og2RE79nZcBklVEnhhLg5zgcqe3E7hzUYDfeZxskcPE0YHsc3ECt0G/YXnnUotSJk+3Zzs3nlzg=
X-Received: by 2002:a17:90a:bd0e:b0:225:cd98:1651 with SMTP id
 y14-20020a17090abd0e00b00225cd981651mr3782308pjr.93.1672952266255; Thu, 05
 Jan 2023 12:57:46 -0800 (PST)
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
 <CAKAF0m9ym7-fUre3nBF195do_fhp1PGcmiDuyYoTwNO_Lzb0_w@mail.gmail.com> <CAKAF0m-cGuOxhzGKtxu_hiD2XJVPwjt53dF4WFAYuAK6VisgPQ@mail.gmail.com>
In-Reply-To: <CAKAF0m-cGuOxhzGKtxu_hiD2XJVPwjt53dF4WFAYuAK6VisgPQ@mail.gmail.com>
From: Kirill <kirill.zhumarin@gmail.com>
Date: Thu, 5 Jan 2023 22:57:34 +0200
Message-ID: <CAKAF0m-JVGH7dUGwWdFQQKT2UhTdpB4=h_u6H4Wbdux9_fQc6A@mail.gmail.com>
Subject: Re: ddr devfreq on H3 - possible?
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Samuel!

Now I can confidently say - psci_v7_flush_dcache_all() only partially helps=
.
On low-loaded RAM it can work for a long time. But, usually, after a
few hours it still hangs on PWRCTL.

Previously, this bug was heavily testable for me, because of its random nat=
ure.
But now I found a 100% method for reproducing this problem.

First ssh:
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

Second ssh:
```
$ sudo memtester 300M
```

On 2-4 CPUs: I have hung on PWRCTL after every run of the `memtester`
tool (after a few seconds).
On 1 CPU: Never hangs and works fine.

On Thu, Jan 5, 2023 at 4:47 AM Kirill <kirill.zhumarin@gmail.com> wrote:
>
> Oh, sorry for the irrelevant report. I was really surprised when I got
> pagefault even without SMC call (:
> Previously I used the armbian unstable kernel (6.1.1). On stable
> armbian kernel (5.15.x86) pagefault not reproduced in all cases.
> It's just armbian's bugs...
>
> I'll try to be more careful when preparing for the test environment. :)
>
> I will continue testing.
>
> =D1=87=D1=82, 5 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 01:26, Kirill <ki=
rill.zhumarin@gmail.com>:
> >
> > Hi Samel!
> >
> > Sadly, it does not work stable :(
> >
> > I found a good way to stress-test the ddr dvfs process. Just switching
> > between max/min freq every 0.5s.
> > (Previously I tested with performance <-> simple ondemand, before I
> > understood why not present other governors. And it wasn't enough.)
> >
> > My script for testing:
> > ```
> > #!/bin/bash
> >
> > while true
> > do
> > date
> > echo "powersave" >
> > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-=
controller/governor
> > sleep 0.5
> > echo "performance" >
> > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-=
controller/governor
> > sleep 0.5
> > done
> > ```
> >
> > Test cases:
> > 1. Without module sun8i_a33_mbus: system stable, all works fine
> > I checked my setup:
> > - Every power source looks fine on oscilloscope
> > - Kernel memtest (memtest=3D10) don't find any problem
> > - Userspace tool memtester don't find any problem
> >
> > 2. Single CPU + sun8i_a33_mbus + script: Works fine for a long time
> >
> > 3. 2 or 4 CPUs: Page Fault! Seems to be RAM corrupting...
> > ```
> > [ 3890.960776] Unable to handle kernel paging request at virtual
> > address 00044581
> > [ 3890.968017] [00044581] *pgd=3D00000000
> > [ 3890.971626] Internal error: Oops: 5 [#1] SMP THUMB2
> > ```
> > (full report: https://gist.github.com/Azq2/b2875ee228d1e68922d7c1f4f4e3=
f3df)
> >
> > I tried to implement "CPU locking in monitor mode" using SGI. But
> > pagefaults still occur.
> > And, also, it is too slow... I see how my input hangs on ssh...
> > Code which I use:
> > https://github.com/u-boot/u-boot/compare/master...Azq2:u-boot:new_test
> >
> > Maybe I incorrectly implemented SGI.
> >
> > =D0=BF=D0=BD, 2 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 04:20, Kirill <=
kirill.zhumarin@gmail.com>:
> > >
> > > > Just to make sure -- is __gpio_debug declared with __secure?
> > >
> > > Yes
> > >
> > > > try calling psci_v7_flush_dcache_all() before setting PWRCTL.
> > >
> > > Hm... I'm not sure, but it seems to be working.... My OPi Lite works
> > > ~one hour without any hangs!
> > >
> > > Of course, I need more time and tests to completely confirm that.
> > > I will continue testing.
> > >
> > > Great thanks!!!
> > >
> > > Also, I did some extra work:
> > > - Rewrited code to use u-boot registers and constants
> > > - implemented enabling/disabling ODT
> > > - implemented enabling/disabling self-refresh
> > > - implemented custom PSCI tables for platform-specific functions in u=
-boot
> > >
> > > And all of these also seem to be works.
> > > My fork with changes:
> > > https://github.com/Azq2/u-boot/commits/allwinner-h3-dram-dvfs
> > >
> > > =D0=BF=D0=BD, 2 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 00:20, Samuel=
 Holland <samuel@sholland.org>:
> > > >
> > > > On 1/1/23 15:40, Kirill wrote:
> > > > > I did a little debugging.
> > > > > When hangs happens, CPU is always stuck on `writel(reg_val, PWRCT=
L);`
> > > > >
> > > > > Example of my debug:
> > > > > ```
> > > > > /* 1. enter self-refresh and disable all master access */
> > > > > reg_val =3D readl(PWRCTL);
> > > > > reg_val |=3D (0x1<<0);
> > > > > reg_val |=3D (0x1<<8);
> > > > > __gpio_debug(2);
> > > > > writel(reg_val, PWRCTL);
> > > > > __gpio_debug(3);
> > > > > __udelay(1);
> > > > > __gpio_debug(4);
> > > > > ```
> > > > > __gpio_debug should not take any effect on the process, just swit=
ching GPIO's.
> > > >
> > > > Just to make sure -- is __gpio_debug declared with __secure?
> > > >
> > > > > Before hanging it can be worked for a few minutes. Hangs occur at
> > > > > random manners.
> > > > > Also hangs not depend on count of freq change.
> > > >
> > > > Hmm, the CPU hanging right when blocking access to DRAM suggests th=
ere
> > > > is some asynchronous cache operation (prefetch or writeback) that i=
s
> > > > causes some DRAM traffic.
> > > >
> > > > I checked the U-Boot source code, and it disables both caches in th=
e
> > > > secure copy of SCTLR before setting up PSCI*. So there should not b=
e any
> > > > prefetching occurring while you are in monitor mode. But maybe ther=
e is
> > > > some writeback from cache lines dirtied in non-secure state. You co=
uld
> > > > try calling psci_v7_flush_dcache_all() before setting PWRCTL.
> > > >
> > > > If that does not help, I am not sure what else could be happening.
> > > >
> > > > Regards,
> > > > Samuel
> > > >
> > > > * boot_jump_linux() -> announce_and_cleanup() -> cleanup_before_lin=
ux()
> > > > -> cleanup_before_linux_select()
> > > >
> > > > > I tried something like this for fastest bug reproduction:
> > > > > ```
> > > > > while true
> > > > > do
> > > > >   echo "simple_ondemand" >
> > > > > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000=
.dram-controller/governor
> > > > >   sleep 5
> > > > >   echo "performance" >
> > > > > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000=
.dram-controller/governor
> > > > >   sleep 5
> > > > > done
> > > > > ```
> > > > >
> > > > > No effect, it still happens randomly :)
> > > > >
> > > > >> You can send a SGI IPI to the other three CPUs and force them to
> > > > >> trap into the secure monitor.
> > > > >
> > > > > Thanks, I will try this later.
> > > > >
> > > > > P.S. Sorry for the duplicate, I forgot "Answer to All" in gmail :=
(
> > > > >
> > > > > =D1=81=D0=B1, 31 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 22:45, S=
amuel Holland <samuel@sholland.org>:
> > > > >>
> > > > >> Hi Kirill,
> > > > >>
> > > > >> On 12/31/22 05:15, Kirill wrote:
> > > > >>> Hi!
> > > > >>>
> > > > >>> I ported your patches for armbian kernel 6.1 / u-boot and it wo=
rks!
> > > > >>>
> > > > >>>> It works, though it did lock up once after playing with the de=
vfreq
> > > > >>>> sysfs for several minutes
> > > > >>>
> > > > >>> Yes, I have hangs too. And the main reason for this problem - S=
MP. :(
> > > > >>>
> > > > >>> By calling SMC we put only one CPU into SRAM. But other CPUs st=
ill
> > > > >>> work and use DRAM!
> > > > >>> I don't see any hangs, if I disable all other CPUs:
> > > > >>> ```
> > > > >>> echo 0 > /sys/devices/system/cpu/cpu1/online
> > > > >>> echo 0 > /sys/devices/system/cpu/cpu2/online
> > > > >>> echo 0 > /sys/devices/system/cpu/cpu3/online
> > > > >>> ```
> > > > >>
> > > > >> Thanks for investigating. That's good information.
> > > > >>
> > > > >>> Original sunxi 3.4 kernel uses some dirty hack[2] to get around=
 this problem.
> > > > >>>
> > > > >>> They call mdfs_pause_cpu[1] for each CPU core (except current)
> > > > >>> This function located in the SRAM and locks CPU in infinity loo=
p,
> > > > >>> until `set_paused(false)` called on CPU0
> > > > >>> Also, legacy rockchip kernels use same hack[3].
> > > > >>>
> > > > >>> But this method is not ideal...
> > > > >>> Before changing DDR freq we must make sure which each kernel is=
 stuck
> > > > >>> on the SRAM function. But this is a very long process.
> > > > >>> In my proof-of-concept implementation sometimes elapses *few se=
conds*
> > > > >>> between I call smp_call_function and all cores stucking in SRAM
> > > > >>> function.
> > > > >>> This method may be suitable for manual freq change. But not for
> > > > >>> automatic governor mode. No chance to change frequency on heavy=
 loaded
> > > > >>> CPUs.
> > > > >>>
> > > > >>> We need another way.
> > > > >>>
> > > > >>> I think, code on PSCI must stop/suspend any other working cpu c=
ores
> > > > >>> before update freq. This is possible?
> > > > >>
> > > > >> It _shouldn't_ be necessary. Setting bit 8 in PWRCTL blocks the =
DRAM
> > > > >> controller's host interface, which should cause the L2 cache sub=
system
> > > > >> (and thus the other CPUs) to stall when trying to access DRAM. T=
his is
> > > > >> what the MDFS hardware does on A64/H5, and I have seen no hangs =
there.
> > > > >>
> > > > >> Possibly the issue is that such a stall sometimes affects the CP=
U that
> > > > >> is running from SRAM, even though it should not. (On the other h=
and,
> > > > >> when using the MDFS hardware, it is okay if all four CPUs tempor=
arily
> > > > >> stall at the same time.)
> > > > >>
> > > > >> One thing to check is if sunxi_dram_dvfs_req() completes success=
fully.
> > > > >> That function contains some unbounded loops, so it is possible t=
o get
> > > > >> stuck. You could toggle a GPIO or something at the end of the fu=
nction.
> > > > >> That would distinguish between "the secure monitor hung" and "we=
 left
> > > > >> the DRAM controller in a bad state and hung when switching back =
to code
> > > > >> in DRAM" or even "we trashed the contents of DRAM".
> > > > >>
> > > > >> We do use the architectural timer inside sunxi_dram_dvfs_req(), =
but
> > > > >> those registers are banked between secure/non-secure states, so =
that
> > > > >> should not interfere with Linux's use of the timer.
> > > > >>
> > > > >> However, your test with offlining the other CPUs suggests we may=
 really
> > > > >> need some synchronization. I would suggest doing this inside U-B=
oot as
> > > > >> well. You can send a SGI IPI to the other three CPUs and force t=
hem to
> > > > >> trap into the secure monitor. Not only will this be immediate, b=
ut it
> > > > >> will also ensure the other CPUs are running from SRAM during the
> > > > >> reclocking. You can take inspiration from the existing IPI code =
in psci.c.
> > > > >>
> > > > >> It is quite convenient to be truly in control, so you can do thi=
ngs
> > > > >> behind the OS's back, and keep it blissfully unaware. :)
> > > > >>
> > > > >> Regards,
> > > > >> Samuel
> > > > >>
> > > > >>> [1] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blo=
b/master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L638
> > > > >>> [2] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blo=
b/master/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1088
> > > > >>> [3] https://github.com/bbelos/rk3188-kernel/blob/master/arch/ar=
m/plat-rk/ddr_freq.c#L168
> > > > >>>
> > > > >>> P.S. sorry for duplicate, previous message declined by mlmmj
> > > > >>>
> > > > >>>
> > > > >>> =D1=87=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 19:29,=
 Samuel Holland <samuel@sholland.org>:
> > > > >>>>
> > > > >>>> Hi Kirill,
> > > > >>>>
> > > > >>>> On 12/28/22 07:10, Kirill wrote:
> > > > >>>>> I'm trying to use your driver with h3, but have this result:
> > > > >>>>> ```
> > > > >>>>> [  387.306429] sun8i-h3-mbus 1c62000.dram-controller: Detecte=
d 32-bit
> > > > >>>>> DDRx with ODT
> > > > >>>>> [  388.450262] sun8i-h3-mbus 1c62000.dram-controller: Using 1=
5554/243750
> > > > >>>>> (6%) at 1248 MHz
> > > > >>>>> [  389.906319] sun8i-h3-mbus 1c62000.dram-controller: Using 1=
079/243750
> > > > >>>>> (0%) at 1248 MHz
> > > > >>>>> [  389.914314] sun8i-h3-mbus 1c62000.dram-controller: Setting=
 DRAM to
> > > > >>>>> 156 MHz, tREFI=3D19, tRFC=3D28, ODT=3Ddisabled
> > > > >>>>> ```
> > > > >>>>>
> > > > >>>>> After this CPU hangs and not responding.
> > > > >>>>> Is possible (at least theoretically) to use this driver with =
H3?
> > > > >>>>
> > > > >>>> Yes, although it will need some help from firmware. If you loo=
k at the
> > > > >>>> vendor driver[1] (pick any random Allwinner 4.9 tree), you wil=
l see
> > > > >>>> there is no mdfs_dfs() implementation for CONFIG_ARCH_SUN8IW7P=
1 (H3).
> > > > >>>> The driver always calls mdfs_main(), which is a standalone pro=
gram
> > > > >>>> loaded to SRAM. The reason seems to be that the MDFS hardware =
is broken,
> > > > >>>> as you found out.
> > > > >>>>
> > > > >>>> Something like this standalone MDFS application is not upstrea=
mable, but
> > > > >>>> conveniently we already have some firmware running from SRAM, =
namely
> > > > >>>> U-Boot's PSCI/secure monitor implementation. And Allwinner alr=
eady has
> > > > >>>> some chips where they call a SMC to do this MDFS procedure[2].=
 So we can
> > > > >>>> reuse that SMC function ID, and put the code in in the secure =
monitor.
> > > > >>>> I've thrown together U-Boot[3] and Linux[4] patches as a proof=
 of concept.
> > > > >>>>
> > > > >>>> It works, though it did lock up once after playing with the de=
vfreq
> > > > >>>> sysfs for several minutes. The contents of sunxi_dram_dvfs_req=
() are
> > > > >>>> just copied from the vendor driver; they could surely be impro=
ved.
> > > > >>>>
> > > > >>>> The U-Boot patch is based on my series adding Crust support fo=
r H3, so I
> > > > >>>> could have interactive peek/poke from the AR100 even when the =
DRAM
> > > > >>>> controller is dead. It shouldn't be too hard to rebase that ou=
t and move
> > > > >>>> the code to psci.c.
> > > > >>>>
> > > > >>>> I'm not sure the best way to upstream the changes to psci.S. P=
robably we
> > > > >>>> need some platform callback to handle unknown function IDs.
> > > > >>>>
> > > > >>>> Regards,
> > > > >>>> Samuel
> > > > >>>>
> > > > >>>> [1]:
> > > > >>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/=
drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1411
> > > > >>>> [2]:
> > > > >>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/=
drivers/devfreq/sunxi-mdfs.h#L38
> > > > >>>> [3]: https://github.com/smaeul/u-boot/commits/patch/h3-dram-de=
vfreq
> > > > >>>> [4]: https://github.com/smaeul/linux/commits/wip/devfreq-a83t
> > > > >>>>
> > > > >>
> > > >
