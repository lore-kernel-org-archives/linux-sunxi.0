Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02EB33CF
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jan 2023 21:41:03 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id jl4so21336387plb.8
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Jan 2023 13:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zy0ManU4K/yYcwk52wn21t/mKG2Oru+oIPYi3Nlmfk=;
        b=LGcYQqGz+zy+3UipZYN52gDzcUGJf+5aHKUd51gt7hDZRqTwaj1z81XMN0tBB8Lclq
         Vhq2+0qQif4Xt+c4n7zNJQJu7fd8nvbzePh/h4nNBiFnf8dn5LmRu7qIW42diITT7W0f
         THG0dlmife+wbciTKIeVX+zPVyPa5C7RzYPifjmKfJcbWTszz8XUzGKlVxDeS4OsEF5v
         B61dDIq1uld4fOoCziae1oVn8wL6PaEBLDgR5Kl90NJ7Wbgpw352G5kjl3x3zeytUaCw
         JeCsdoo+AOfDYKmilNaPpAm07QjusaO90oCC7kZSRvIjAhDJoedLd0Kgb7Tw936n0W+f
         31ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zy0ManU4K/yYcwk52wn21t/mKG2Oru+oIPYi3Nlmfk=;
        b=3KBvLz+2qQm2MFCoKDzgbzICNAv2jyyy8hnt0qAmxUB5iKSLJ66AGzTPfA+dq3FLQY
         yqbWL8a8CGOLymk0ziPtDccNFUq6vdieqyxN3AkKtZrO73szNSt2V5VG57n4w5iUtjhA
         GJohTbAeSXYkoS86t5jTpBnf2S5CDSU+0HrOi57FmFWLnM+tKPn7vT2/9dNebG3v8Ttn
         Tpnhrj2Ci3IaQpvUKQidXnht8Ad7n1TNbNuyxJbGDVmzlqnH2js+WUawoS/cNxM4B26h
         mlWO58YwlhOQCYEdF+PNG/sH0rSizm5GaDPei2y1ijdjDLo5pDz+JEk72sy7oRbRrIvg
         6z0Q==
X-Gm-Message-State: AFqh2kpXeEPE5GXpubWximWBOmXJUn6o/HDFF0WcBwBkcfA6zk5kfmL3
	XZA2tGqFnlYEIU/7m4Ip94f/00GP07172DHlo3w=
X-Google-Smtp-Source: AMrXdXvUsz0rF6oYH/gJQ+kLIchp9LQR4jmpiQTEFKaFzeKjxTBwJa6yCkkVq00xUTvrW8McvQL1bitXqR1CrVguEUM=
X-Received: by 2002:a17:902:be09:b0:189:1366:fba7 with SMTP id
 r9-20020a170902be0900b001891366fba7mr1996543pls.45.1672609263004; Sun, 01 Jan
 2023 13:41:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKAF0m9DqPjB6C39ZbrRHFrJOodm7WQGTL0x1jduQjNU=JpQ2g@mail.gmail.com>
 <d49cb79d-1405-c2cc-0c33-a768c5bbde91@sholland.org> <CAKAF0m984-tY+r+NXdND5hTHAQ55mk_XLjr2y+OBjKMNhS+e1g@mail.gmail.com>
 <8e7e9d95-a3c1-059d-1e13-20e69c23da46@sholland.org>
In-Reply-To: <8e7e9d95-a3c1-059d-1e13-20e69c23da46@sholland.org>
From: Kirill <kirill.zhumarin@gmail.com>
Date: Sun, 1 Jan 2023 23:40:51 +0200
Message-ID: <CAKAF0m-DQKBc-mfDsQESAA1NvZ1bAWfo-sp4tWqfWWaGhKUwww@mail.gmail.com>
Subject: Re: ddr devfreq on H3 - possible?
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I did a little debugging.
When hangs happens, CPU is always stuck on `writel(reg_val, PWRCTL);`

Example of my debug:
```
/* 1. enter self-refresh and disable all master access */
reg_val =3D readl(PWRCTL);
reg_val |=3D (0x1<<0);
reg_val |=3D (0x1<<8);
__gpio_debug(2);
writel(reg_val, PWRCTL);
__gpio_debug(3);
__udelay(1);
__gpio_debug(4);
```
__gpio_debug should not take any effect on the process, just switching GPIO=
's.

Before hanging it can be worked for a few minutes. Hangs occur at
random manners.
Also hangs not depend on count of freq change.

I tried something like this for fastest bug reproduction:
```
while true
do
  echo "simple_ondemand" >
/sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-cont=
roller/governor
  sleep 5
  echo "performance" >
/sys/devices/platform/soc/1c62000.dram-controller/devfreq/1c62000.dram-cont=
roller/governor
  sleep 5
done
```

No effect, it still happens randomly :)

> You can send a SGI IPI to the other three CPUs and force them to
> trap into the secure monitor.

Thanks, I will try this later.

P.S. Sorry for the duplicate, I forgot "Answer to All" in gmail :(

=D1=81=D0=B1, 31 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 22:45, Samuel Holl=
and <samuel@sholland.org>:
>
> Hi Kirill,
>
> On 12/31/22 05:15, Kirill wrote:
> > Hi!
> >
> > I ported your patches for armbian kernel 6.1 / u-boot and it works!
> >
> >> It works, though it did lock up once after playing with the devfreq
> >> sysfs for several minutes
> >
> > Yes, I have hangs too. And the main reason for this problem - SMP. :(
> >
> > By calling SMC we put only one CPU into SRAM. But other CPUs still
> > work and use DRAM!
> > I don't see any hangs, if I disable all other CPUs:
> > ```
> > echo 0 > /sys/devices/system/cpu/cpu1/online
> > echo 0 > /sys/devices/system/cpu/cpu2/online
> > echo 0 > /sys/devices/system/cpu/cpu3/online
> > ```
>
> Thanks for investigating. That's good information.
>
> > Original sunxi 3.4 kernel uses some dirty hack[2] to get around this pr=
oblem.
> >
> > They call mdfs_pause_cpu[1] for each CPU core (except current)
> > This function located in the SRAM and locks CPU in infinity loop,
> > until `set_paused(false)` called on CPU0
> > Also, legacy rockchip kernels use same hack[3].
> >
> > But this method is not ideal...
> > Before changing DDR freq we must make sure which each kernel is stuck
> > on the SRAM function. But this is a very long process.
> > In my proof-of-concept implementation sometimes elapses *few seconds*
> > between I call smp_call_function and all cores stucking in SRAM
> > function.
> > This method may be suitable for manual freq change. But not for
> > automatic governor mode. No chance to change frequency on heavy loaded
> > CPUs.
> >
> > We need another way.
> >
> > I think, code on PSCI must stop/suspend any other working cpu cores
> > before update freq. This is possible?
>
> It _shouldn't_ be necessary. Setting bit 8 in PWRCTL blocks the DRAM
> controller's host interface, which should cause the L2 cache subsystem
> (and thus the other CPUs) to stall when trying to access DRAM. This is
> what the MDFS hardware does on A64/H5, and I have seen no hangs there.
>
> Possibly the issue is that such a stall sometimes affects the CPU that
> is running from SRAM, even though it should not. (On the other hand,
> when using the MDFS hardware, it is okay if all four CPUs temporarily
> stall at the same time.)
>
> One thing to check is if sunxi_dram_dvfs_req() completes successfully.
> That function contains some unbounded loops, so it is possible to get
> stuck. You could toggle a GPIO or something at the end of the function.
> That would distinguish between "the secure monitor hung" and "we left
> the DRAM controller in a bad state and hung when switching back to code
> in DRAM" or even "we trashed the contents of DRAM".
>
> We do use the architectural timer inside sunxi_dram_dvfs_req(), but
> those registers are banked between secure/non-secure states, so that
> should not interfere with Linux's use of the timer.
>
> However, your test with offlining the other CPUs suggests we may really
> need some synchronization. I would suggest doing this inside U-Boot as
> well. You can send a SGI IPI to the other three CPUs and force them to
> trap into the secure monitor. Not only will this be immediate, but it
> will also ensure the other CPUs are running from SRAM during the
> reclocking. You can take inspiration from the existing IPI code in psci.c=
.
>
> It is quite convenient to be truly in control, so you can do things
> behind the OS's back, and keep it blissfully unaware. :)
>
> Regards,
> Samuel
>
> > [1] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/master=
/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L638
> > [2] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/master=
/drivers/devfreq/dramfreq/sunxi-ddrfreq.c#L1088
> > [3] https://github.com/bbelos/rk3188-kernel/blob/master/arch/arm/plat-r=
k/ddr_freq.c#L168
> >
> > P.S. sorry for duplicate, previous message declined by mlmmj
> >
> >
> > =D1=87=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 19:29, Samuel =
Holland <samuel@sholland.org>:
> >>
> >> Hi Kirill,
> >>
> >> On 12/28/22 07:10, Kirill wrote:
> >>> I'm trying to use your driver with h3, but have this result:
> >>> ```
> >>> [  387.306429] sun8i-h3-mbus 1c62000.dram-controller: Detected 32-bit
> >>> DDRx with ODT
> >>> [  388.450262] sun8i-h3-mbus 1c62000.dram-controller: Using 15554/243=
750
> >>> (6%) at 1248 MHz
> >>> [  389.906319] sun8i-h3-mbus 1c62000.dram-controller: Using 1079/2437=
50
> >>> (0%) at 1248 MHz
> >>> [  389.914314] sun8i-h3-mbus 1c62000.dram-controller: Setting DRAM to
> >>> 156 MHz, tREFI=3D19, tRFC=3D28, ODT=3Ddisabled
> >>> ```
> >>>
> >>> After this CPU hangs and not responding.
> >>> Is possible (at least theoretically) to use this driver with H3?
> >>
> >> Yes, although it will need some help from firmware. If you look at the
> >> vendor driver[1] (pick any random Allwinner 4.9 tree), you will see
> >> there is no mdfs_dfs() implementation for CONFIG_ARCH_SUN8IW7P1 (H3).
> >> The driver always calls mdfs_main(), which is a standalone program
> >> loaded to SRAM. The reason seems to be that the MDFS hardware is broke=
n,
> >> as you found out.
> >>
> >> Something like this standalone MDFS application is not upstreamable, b=
ut
> >> conveniently we already have some firmware running from SRAM, namely
> >> U-Boot's PSCI/secure monitor implementation. And Allwinner already has
> >> some chips where they call a SMC to do this MDFS procedure[2]. So we c=
an
> >> reuse that SMC function ID, and put the code in in the secure monitor.
> >> I've thrown together U-Boot[3] and Linux[4] patches as a proof of conc=
ept.
> >>
> >> It works, though it did lock up once after playing with the devfreq
> >> sysfs for several minutes. The contents of sunxi_dram_dvfs_req() are
> >> just copied from the vendor driver; they could surely be improved.
> >>
> >> The U-Boot patch is based on my series adding Crust support for H3, so=
 I
> >> could have interactive peek/poke from the AR100 even when the DRAM
> >> controller is dead. It shouldn't be too hard to rebase that out and mo=
ve
> >> the code to psci.c.
> >>
> >> I'm not sure the best way to upstream the changes to psci.S. Probably =
we
> >> need some platform callback to handle unknown function IDs.
> >>
> >> Regards,
> >> Samuel
> >>
> >> [1]:
> >> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/=
devfreq/dramfreq/sunxi-ddrfreq.c#L1411
> >> [2]:
> >> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/=
devfreq/sunxi-mdfs.h#L38
> >> [3]: https://github.com/smaeul/u-boot/commits/patch/h3-dram-devfreq
> >> [4]: https://github.com/smaeul/linux/commits/wip/devfreq-a83t
> >>
>
