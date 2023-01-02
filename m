Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D72B7E
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 02:20:22 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so19010354pjq.1
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Jan 2023 18:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzpo0YhM0wtCfSmfJiCNzP/XrwshYZ2GdpArRdD0ft0=;
        b=jlxOKpuHURtBpbNWFZo2akw9DnRveH5P+McOkfWjWWBtHCZkwQCYIbRBthbIt6i2wz
         9afoFQ7mFDAVdvxko+sT0Bkg5tkEbx6778QYoaw/+1fuXxfh9aJTnAblKLyWHlSIzsAo
         oezt1Q90fq9tYjMhnL9FGXIRC3qZlDMGxmYGTLNkHSuQgrQZMF5ubCmpwFTYXofQoZ4T
         ihR5o7s8bpXTOUMEE3Tozp2VOlqtXWuyP4rHMRKXFSEI5O61c39Xxk4UD2AFWLaagEw6
         Ol1KwZB11AoSVtR+0uEYecqjzg07a/9Y3v0P36to5qiukj4vHkr+fTU0L0+53zDa45mz
         Rg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzpo0YhM0wtCfSmfJiCNzP/XrwshYZ2GdpArRdD0ft0=;
        b=cCCYgQv4EGUzjzVOBp5n9JNZaS68Mpo0xPVtukH0pl+ZjxvYv2sWHvk6zVhfupewSt
         hAJ4komsNugP1HIlvPqgpTiAMnsXebr+PIkQsTF7aEFzRdjH4ZWvrY+HU0pbih30pxQI
         7alOUrrIt4XOZRT/Q79ZhSvE0BWtBvmYfpUG2pAmwtGsuLTpKqEP5dNJo7ZotQKvvVAQ
         Md4oty5cC9exyzUZEivf5fEoTyESUFy0g9e7COS4l18IV3Jrja3LOeai8Ry/auTuf8Rx
         frI8bvPtUZsCK7+gFCzoJFmZbrc+P4XDdosp3HaPAgByckE69S7KumsfpEoTUQOBwOWt
         TzNw==
X-Gm-Message-State: AFqh2kok4tTdtETPT4x2PxZHzNPOhTQnTFLans4RpTkLkt6pERvHwimT
	BAM29UrGUDtJQfycRZuUKpPlFn01h5furYrUUXhisKP4F/r8VQ==
X-Google-Smtp-Source: AMrXdXvfyiZUPM3CN4N4n56hHzPZyQZRGD9fG90dJygiRHsQKVzVa65zzgrsh8rFITmN2xzrJmRz3+QjZ2K1LIYOgJk=
X-Received: by 2002:a17:90a:d0c1:b0:219:65c0:619f with SMTP id
 y1-20020a17090ad0c100b0021965c0619fmr3431587pjw.150.1672626021575; Sun, 01
 Jan 2023 18:20:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKAF0m9DqPjB6C39ZbrRHFrJOodm7WQGTL0x1jduQjNU=JpQ2g@mail.gmail.com>
 <d49cb79d-1405-c2cc-0c33-a768c5bbde91@sholland.org> <CAKAF0m984-tY+r+NXdND5hTHAQ55mk_XLjr2y+OBjKMNhS+e1g@mail.gmail.com>
 <8e7e9d95-a3c1-059d-1e13-20e69c23da46@sholland.org> <CAKAF0m-DQKBc-mfDsQESAA1NvZ1bAWfo-sp4tWqfWWaGhKUwww@mail.gmail.com>
 <6cffb621-8ba2-957e-9cbb-3b139448fd12@sholland.org>
In-Reply-To: <6cffb621-8ba2-957e-9cbb-3b139448fd12@sholland.org>
From: Kirill <kirill.zhumarin@gmail.com>
Date: Mon, 2 Jan 2023 04:20:10 +0200
Message-ID: <CAKAF0m9SnNx=cutfGc7Mw+n6YLtrJQAP+kRe+VwX1WqRHiWbnQ@mail.gmail.com>
Subject: Re: ddr devfreq on H3 - possible?
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Just to make sure -- is __gpio_debug declared with __secure?

Yes

> try calling psci_v7_flush_dcache_all() before setting PWRCTL.

Hm... I'm not sure, but it seems to be working.... My OPi Lite works
~one hour without any hangs!

Of course, I need more time and tests to completely confirm that.
I will continue testing.

Great thanks!!!

Also, I did some extra work:
- Rewrited code to use u-boot registers and constants
- implemented enabling/disabling ODT
- implemented enabling/disabling self-refresh
- implemented custom PSCI tables for platform-specific functions in u-boot

And all of these also seem to be works.
My fork with changes:
https://github.com/Azq2/u-boot/commits/allwinner-h3-dram-dvfs

=D0=BF=D0=BD, 2 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 00:20, Samuel Holla=
nd <samuel@sholland.org>:
>
> On 1/1/23 15:40, Kirill wrote:
> > I did a little debugging.
> > When hangs happens, CPU is always stuck on `writel(reg_val, PWRCTL);`
> >
> > Example of my debug:
> > ```
> > /* 1. enter self-refresh and disable all master access */
> > reg_val =3D readl(PWRCTL);
> > reg_val |=3D (0x1<<0);
> > reg_val |=3D (0x1<<8);
> > __gpio_debug(2);
> > writel(reg_val, PWRCTL);
> > __gpio_debug(3);
> > __udelay(1);
> > __gpio_debug(4);
> > ```
> > __gpio_debug should not take any effect on the process, just switching =
GPIO's.
>
> Just to make sure -- is __gpio_debug declared with __secure?
>
> > Before hanging it can be worked for a few minutes. Hangs occur at
> > random manners.
> > Also hangs not depend on count of freq change.
>
> Hmm, the CPU hanging right when blocking access to DRAM suggests there
> is some asynchronous cache operation (prefetch or writeback) that is
> causes some DRAM traffic.
>
> I checked the U-Boot source code, and it disables both caches in the
> secure copy of SCTLR before setting up PSCI*. So there should not be any
> prefetching occurring while you are in monitor mode. But maybe there is
> some writeback from cache lines dirtied in non-secure state. You could
> try calling psci_v7_flush_dcache_all() before setting PWRCTL.
>
> If that does not help, I am not sure what else could be happening.
>
> Regards,
> Samuel
>
> * boot_jump_linux() -> announce_and_cleanup() -> cleanup_before_linux()
> -> cleanup_before_linux_select()
>
> > I tried something like this for fastest bug reproduction:
> > ```
> > while true
> > do
> >   echo "simple_ondemand" >
> > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-=
controller/governor
> >   sleep 5
> >   echo "performance" >
> > /sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-=
controller/governor
> >   sleep 5
> > done
> > ```
> >
> > No effect, it still happens randomly :)
> >
> >> You can send a SGI IPI to the other three CPUs and force them to
> >> trap into the secure monitor.
> >
> > Thanks, I will try this later.
> >
> > P.S. Sorry for the duplicate, I forgot "Answer to All" in gmail :(
> >
> > =D1=81=D0=B1, 31 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 22:45, Samuel =
Holland <samuel@sholland.org>:
> >>
> >> Hi Kirill,
> >>
> >> On 12/31/22 05:15, Kirill wrote:
> >>> Hi!
> >>>
> >>> I ported your patches for armbian kernel 6.1 / u-boot and it works!
> >>>
> >>>> It works, though it did lock up once after playing with the devfreq
> >>>> sysfs for several minutes
> >>>
> >>> Yes, I have hangs too. And the main reason for this problem - SMP. :(
> >>>
> >>> By calling SMC we put only one CPU into SRAM. But other CPUs still
> >>> work and use DRAM!
> >>> I don't see any hangs, if I disable all other CPUs:
> >>> ```
> >>> echo 0 > /sys/devices/system/cpu/cpu1/online
> >>> echo 0 > /sys/devices/system/cpu/cpu2/online
> >>> echo 0 > /sys/devices/system/cpu/cpu3/online
> >>> ```
> >>
> >> Thanks for investigating. That's good information.
> >>
> >>> Original sunxi 3.4 kernel uses some dirty hack[2] to get around this =
problem.
> >>>
> >>> They call mdfs_pause_cpu[1] for each CPU core (except current)
> >>> This function located in the SRAM and locks CPU in infinity loop,
> >>> until `set_paused(false)` called on CPU0
> >>> Also, legacy rockchip kernels use same hack[3].
> >>>
> >>> But this method is not ideal...
> >>> Before changing DDR freq we must make sure which each kernel is stuck
> >>> on the SRAM function. But this is a very long process.
> >>> In my proof-of-concept implementation sometimes elapses *few seconds*
> >>> between I call smp_call_function and all cores stucking in SRAM
> >>> function.
> >>> This method may be suitable for manual freq change. But not for
> >>> automatic governor mode. No chance to change frequency on heavy loade=
d
> >>> CPUs.
> >>>
> >>> We need another way.
> >>>
> >>> I think, code on PSCI must stop/suspend any other working cpu cores
> >>> before update freq. This is possible?
> >>
> >> It _shouldn't_ be necessary. Setting bit 8 in PWRCTL blocks the DRAM
> >> controller's host interface, which should cause the L2 cache subsystem
> >> (and thus the other CPUs) to stall when trying to access DRAM. This is
> >> what the MDFS hardware does on A64/H5, and I have seen no hangs there.
> >>
> >> Possibly the issue is that such a stall sometimes affects the CPU that
> >> is running from SRAM, even though it should not. (On the other hand,
> >> when using the MDFS hardware, it is okay if all four CPUs temporarily
> >> stall at the same time.)
> >>
> >> One thing to check is if sunxi_dram_dvfs_req() completes successfully.
> >> That function contains some unbounded loops, so it is possible to get
> >> stuck. You could toggle a GPIO or something at the end of the function=
.
> >> That would distinguish between "the secure monitor hung" and "we left
> >> the DRAM controller in a bad state and hung when switching back to cod=
e
> >> in DRAM" or even "we trashed the contents of DRAM".
> >>
> >> We do use the architectural timer inside sunxi_dram_dvfs_req(), but
> >> those registers are banked between secure/non-secure states, so that
> >> should not interfere with Linux's use of the timer.
> >>
> >> However, your test with offlining the other CPUs suggests we may reall=
y
> >> need some synchronization. I would suggest doing this inside U-Boot as
> >> well. You can send a SGI IPI to the other three CPUs and force them to
> >> trap into the secure monitor. Not only will this be immediate, but it
> >> will also ensure the other CPUs are running from SRAM during the
> >> reclocking. You can take inspiration from the existing IPI code in psc=
i.c.
> >>
> >> It is quite convenient to be truly in control, so you can do things
> >> behind the OS's back, and keep it blissfully unaware. :)
> >>
> >> Regards,
> >> Samuel
> >>
> >>> [1] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/mast=
er/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L638
> >>> [2] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/mast=
er/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1088
> >>> [3] https://github.com/bbelos/rk3188-kernel/blob/master/arch/arm/plat=
-rk/ddr_freq.c#L168
> >>>
> >>> P.S. sorry for duplicate, previous message declined by mlmmj
> >>>
> >>>
> >>> =D1=87=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 19:29, Samue=
l Holland <samuel@sholland.org>:
> >>>>
> >>>> Hi Kirill,
> >>>>
> >>>> On 12/28/22 07:10, Kirill wrote:
> >>>>> I'm trying to use your driver with h3, but have this result:
> >>>>> ```
> >>>>> [  387.306429] sun8i-h3-mbus 1c62000.dram-controller: Detected 32-b=
it
> >>>>> DDRx with ODT
> >>>>> [  388.450262] sun8i-h3-mbus 1c62000.dram-controller: Using 15554/2=
43750
> >>>>> (6%) at 1248 MHz
> >>>>> [  389.906319] sun8i-h3-mbus 1c62000.dram-controller: Using 1079/24=
3750
> >>>>> (0%) at 1248 MHz
> >>>>> [  389.914314] sun8i-h3-mbus 1c62000.dram-controller: Setting DRAM =
to
> >>>>> 156 MHz, tREFI=3D19, tRFC=3D28, ODT=3Ddisabled
> >>>>> ```
> >>>>>
> >>>>> After this CPU hangs and not responding.
> >>>>> Is possible (at least theoretically) to use this driver with H3?
> >>>>
> >>>> Yes, although it will need some help from firmware. If you look at t=
he
> >>>> vendor driver[1] (pick any random Allwinner 4.9 tree), you will see
> >>>> there is no mdfs_dfs() implementation for CONFIG_ARCH_SUN8IW7P1 (H3)=
.
> >>>> The driver always calls mdfs_main(), which is a standalone program
> >>>> loaded to SRAM. The reason seems to be that the MDFS hardware is bro=
ken,
> >>>> as you found out.
> >>>>
> >>>> Something like this standalone MDFS application is not upstreamable,=
 but
> >>>> conveniently we already have some firmware running from SRAM, namely
> >>>> U-Boot's PSCI/secure monitor implementation. And Allwinner already h=
as
> >>>> some chips where they call a SMC to do this MDFS procedure[2]. So we=
 can
> >>>> reuse that SMC function ID, and put the code in in the secure monito=
r.
> >>>> I've thrown together U-Boot[3] and Linux[4] patches as a proof of co=
ncept.
> >>>>
> >>>> It works, though it did lock up once after playing with the devfreq
> >>>> sysfs for several minutes. The contents of sunxi_dram_dvfs_req() are
> >>>> just copied from the vendor driver; they could surely be improved.
> >>>>
> >>>> The U-Boot patch is based on my series adding Crust support for H3, =
so I
> >>>> could have interactive peek/poke from the AR100 even when the DRAM
> >>>> controller is dead. It shouldn't be too hard to rebase that out and =
move
> >>>> the code to psci.c.
> >>>>
> >>>> I'm not sure the best way to upstream the changes to psci.S. Probabl=
y we
> >>>> need some platform callback to handle unknown function IDs.
> >>>>
> >>>> Regards,
> >>>> Samuel
> >>>>
> >>>> [1]:
> >>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/driver=
s/devfreq/dramfreq/sunxi-ddrfreq.c#L1411
> >>>> [2]:
> >>>> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/driver=
s/devfreq/sunxi-mdfs.h#L38
> >>>> [3]: https://github.com/smaeul/u-boot/commits/patch/h3-dram-devfreq
> >>>> [4]: https://github.com/smaeul/linux/commits/wip/devfreq-a83t
> >>>>
> >>
>
