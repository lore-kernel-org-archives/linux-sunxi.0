Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935092599
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Dec 2022 11:16:11 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 60-20020a17090a0fc200b002264ebad204so2100898pjz.1
        for <linux-sunxi@lists.linux.dev>; Sat, 31 Dec 2022 03:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B8Mv9Ptt+K0dk3IhZ0X+nAoAMOeoQapgyV5EbK7ipE=;
        b=faCmx0DFRhtudhipJe1k5gNCkYnQOvSbS8/UyUQoHUl87UNAkm7Ku/1AbZgIj6nAUK
         0MJpbuvDQa2PGIqlx35j73+ufrXhTctUJYP7kS6OUS+8ZnyfREpZiDIY1xsWfQReagTO
         4mpoRx/vde7KTvikcyeK7KCvqNVXv0C7YRBzT9+e1Hj2vOSFYTBgozjKxkBMhqOCX7j3
         gGRzM9VH/6XD+B74NAQYvLT+Mm76mExdLDP4acPj3eMOjehHvXc1lFUUuhhQT5BCwueu
         x3mrajWK936otmcVr5C0GoUV9pE7QbtBCTwnr+j77c+4Z/nALVloVNMvMUDn76Tj1KQl
         cReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B8Mv9Ptt+K0dk3IhZ0X+nAoAMOeoQapgyV5EbK7ipE=;
        b=nB9CsFocH+AF7jBOME0ffDRDtBv6p1BpFr72WQbvLiM+Yb6qzclgyZ57bIprzsFh/4
         bAHaWHJuBK9cBNvPYXj2R2r0hcxTfZdEsXZWvODl086AEk8KmOgH4fdEkjGSedCEmvHV
         yj9bNMBfEWbI3KmPwAK8uzZjUOGM3iJzePu8h3fu7omYduJHFPU3CP6cUL9FBHixZOJ6
         EmEUrDnLfjziKhjjgCb8c2Q0xILqHdLPPQEDpnC//eqAG/Ua4VLI1CZermVh9UnENj/f
         KP0+cmyFNYIcdXzLeBERKec7tdmde5X0GtkuCj1BQXjcpdn2Qxbmn/fq+lYl91zqIJkW
         vdwg==
X-Gm-Message-State: AFqh2kqGuEMBKZ0SRATl2QyxYEOBJ8D8sRyD68HeVeq78ZmVqsCbgtRJ
	MUQk3S3fw1xSCsqxqY5ull3vhNkxyU2D+fTv3li6OYccNLqKFg==
X-Google-Smtp-Source: AMrXdXuUeq9UR9Jq9jCU+SGZY6aYc1Llz1a5cRxZN78QkPbiSmpMuxLqbhFhYth0Rnp5b9bKgNlOm0wUeUyIdz5dhAs=
X-Received: by 2002:a17:902:be09:b0:189:1366:fba7 with SMTP id
 r9-20020a170902be0900b001891366fba7mr1797106pls.45.1672485370872; Sat, 31 Dec
 2022 03:16:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKAF0m9DqPjB6C39ZbrRHFrJOodm7WQGTL0x1jduQjNU=JpQ2g@mail.gmail.com>
 <d49cb79d-1405-c2cc-0c33-a768c5bbde91@sholland.org>
In-Reply-To: <d49cb79d-1405-c2cc-0c33-a768c5bbde91@sholland.org>
From: Kirill <kirill.zhumarin@gmail.com>
Date: Sat, 31 Dec 2022 13:15:59 +0200
Message-ID: <CAKAF0m984-tY+r+NXdND5hTHAQ55mk_XLjr2y+OBjKMNhS+e1g@mail.gmail.com>
Subject: Re: ddr devfreq on H3 - possible?
To: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

I ported your patches for armbian kernel 6.1 / u-boot and it works!

> It works, though it did lock up once after playing with the devfreq
sysfs for several minutes

Yes, I have hangs too. And the main reason for this problem - SMP. :(

By calling SMC we put only one CPU into SRAM. But other CPUs still
work and use DRAM!
I don't see any hangs, if I disable all other CPUs:
```
echo 0 > /sys/devices/system/cpu/cpu1/online
echo 0 > /sys/devices/system/cpu/cpu2/online
echo 0 > /sys/devices/system/cpu/cpu3/online
```

Original sunxi 3.4 kernel uses some dirty hack[2] to get around this proble=
m.

They call mdfs_pause_cpu[1] for each CPU core (except current)
This function located in the SRAM and locks CPU in infinity loop,
until `set_paused(false)` called on CPU0
Also, legacy rockchip kernels use same hack[3].

But this method is not ideal...
Before changing DDR freq we must make sure which each kernel is stuck
on the SRAM function. But this is a very long process.
In my proof-of-concept implementation sometimes elapses *few seconds*
between I call smp_call_function and all cores stucking in SRAM
function.
This method may be suitable for manual freq change. But not for
automatic governor mode. No chance to change frequency on heavy loaded
CPUs.

We need another way.

I think, code on PSCI must stop/suspend any other working cpu cores
before update freq. This is possible?

[1] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/master/dri=
vers/devfreq/dramfreq/sunxi-ddrfreq.c#L638
[2] https://github.com/Hasiergo/Allwinner-A33-linux-3.4.113/blob/master/dri=
vers/devfreq/dramfreq/sunxi-ddrfreq.c#L1088
[3] https://github.com/bbelos/rk3188-kernel/blob/master/arch/arm/plat-rk/dd=
r_freq.c#L168

P.S. sorry for duplicate, previous message declined by mlmmj


=D1=87=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 19:29, Samuel Holl=
and <samuel@sholland.org>:
>
> Hi Kirill,
>
> On 12/28/22 07:10, Kirill wrote:
> > I'm trying to use your driver with h3, but have this result:
> > ```
> > [  387.306429] sun8i-h3-mbus 1c62000.dram-controller: Detected 32-bit
> > DDRx with ODT
> > [  388.450262] sun8i-h3-mbus 1c62000.dram-controller: Using 15554/24375=
0
> > (6%) at 1248 MHz
> > [  389.906319] sun8i-h3-mbus 1c62000.dram-controller: Using 1079/243750
> > (0%) at 1248 MHz
> > [  389.914314] sun8i-h3-mbus 1c62000.dram-controller: Setting DRAM to
> > 156 MHz, tREFI=3D19, tRFC=3D28, ODT=3Ddisabled
> > ```
> >
> > After this CPU hangs and not responding.
> > Is possible (at least theoretically) to use this driver with H3?
>
> Yes, although it will need some help from firmware. If you look at the
> vendor driver[1] (pick any random Allwinner 4.9 tree), you will see
> there is no mdfs_dfs() implementation for CONFIG_ARCH_SUN8IW7P1 (H3).
> The driver always calls mdfs_main(), which is a standalone program
> loaded to SRAM. The reason seems to be that the MDFS hardware is broken,
> as you found out.
>
> Something like this standalone MDFS application is not upstreamable, but
> conveniently we already have some firmware running from SRAM, namely
> U-Boot's PSCI/secure monitor implementation. And Allwinner already has
> some chips where they call a SMC to do this MDFS procedure[2]. So we can
> reuse that SMC function ID, and put the code in in the secure monitor.
> I've thrown together U-Boot[3] and Linux[4] patches as a proof of concept=
.
>
> It works, though it did lock up once after playing with the devfreq
> sysfs for several minutes. The contents of sunxi_dram_dvfs_req() are
> just copied from the vendor driver; they could surely be improved.
>
> The U-Boot patch is based on my series adding Crust support for H3, so I
> could have interactive peek/poke from the AR100 even when the DRAM
> controller is dead. It shouldn't be too hard to rebase that out and move
> the code to psci.c.
>
> I'm not sure the best way to upstream the changes to psci.S. Probably we
> need some platform callback to handle unknown function IDs.
>
> Regards,
> Samuel
>
> [1]:
> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/dev=
freq/dramfreq/sunxi-ddrfreq.c#L1411
> [2]:
> https://github.com/Tina-Linux/tina-v83x-linux-4.9/blob/master/drivers/dev=
freq/sunxi-mdfs.h#L38
> [3]: https://github.com/smaeul/u-boot/commits/patch/h3-dram-devfreq
> [4]: https://github.com/smaeul/linux/commits/wip/devfreq-a83t
>
