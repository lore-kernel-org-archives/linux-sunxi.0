Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C931168
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Jul 2021 23:31:08 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id hp25so13548620ejc.11
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Jul 2021 16:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=iIxxdvWq0XIX74TH3MPswP/KUuDsN0lqQNXxrIu3WX0=;
        b=DL6Cpmazz6BWjNByPNBS+cc89xD5u0Qtja9MlvX0Y/DJHL42o4xDemzG6dTbJsP3x9
         PfncpUm6hDMNCIvsPcnZawbeCCPG9vxAcGykZjCHbXN4SXkMWgQx9Sie1wS/2erBuheA
         9aEsT9sS60/WVzNwX9arNSVZjxf/JtCT/bYQESGT9N6S3B94K+UHdx2i3S70GzO1Y9IV
         KgR1QMLbbSafXOLW5GbAP1fNB1N3wComdkdkAwb7nQOWSTcJ9syeVuqMhej7azuN6tEy
         Os70E5AjjtDzdneDSrNXOkJBR48H5IAy4v4PdLBy2kcc17MPZU2/0c5RA9+4ejLVD458
         nkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=iIxxdvWq0XIX74TH3MPswP/KUuDsN0lqQNXxrIu3WX0=;
        b=mDK+JN36btxFQNaomGG4EnknP1BGjhdks5lSVFJwitPvkRFta0OCF7mQ8dk6tcV/KI
         SMV8l/BDjmZhpKqxQu2Ljxzc434/DuEq9uuHsXNEVfgQQeBJqWx/8AjN1cI9khxE3cWv
         KCbtKAnmVmp5LkvDmlLek/sgtW/rZ1HZ3kCh+NRxZ8PPcxyyuwSwGZyPrJI1tug0Uojs
         coV5m2sPkvfCEJz/XHwBn+CKwlunY5dxjNTdKinzrwqgJa6T6sINhYlfCYluNmijdENt
         KzYlhRBg3kO4dUMybYAjiGn1+GUxxoN8c/HJGOz0o/Sz7wSFBGcNZjHb+Ybnq1mIU1un
         wb0g==
X-Gm-Message-State: AOAM530NwKEVuEMEzJ4s8TRRqxTqmBGUIndf6Z65pq6Nc/OnErMygCZ7
	UUSazyaIJN9SehBfLkq3GHA=
X-Google-Smtp-Source: ABdhPJxjO1H5up4lsYdwgbkWhjOgImsY7/WUWU6Wp5iV6/tV20J2kvs8RLevwWKekaLf0o2+POqb3g==
X-Received: by 2002:a17:906:8281:: with SMTP id h1mr6091957ejx.352.1627255867366;
        Sun, 25 Jul 2021 16:31:07 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id g23sm8613005ejm.26.2021.07.25.16.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 16:31:06 -0700 (PDT)
Date: Mon, 26 Jul 2021 01:31:04 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Christopher Obbard <chris@64studio.com>, linux-sunxi@lists.linux.dev,
	mailing list linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <YP30OCLkjRfqtOOg@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <YPvjYIsu0G0HSu5I@pevik>
 <YPvrpUZ/VRc0eHvA@kroah.com>
 <YPwYlvh4DqaUsPCF@pevik>
 <YPwhAsK/rDkVeK0y@kroah.com>
 <YPwiGB7VnzECN/jg@pevik>
 <CAP03Xer3QK7gFa5szL7gQLq-=-muyPDzH-D24mhafDpUjj5=bw@mail.gmail.com>
 <YPw/iTdsqggtvlKL@pevik>
 <20210724180432.4423b9e3@slackpad.fritz.box>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724180432.4423b9e3@slackpad.fritz.box>

Hi Andre,

> On Sat, 24 Jul 2021 18:27:53 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> Hi Petr,

> > [ Dropping Greg and linux-usb@vger.kernel.org ]
> > > Peter,  

> > > On Sat, 24 Jul 2021 at 15:22, Petr Vorel <petr.vorel@gmail.com> wrote:  

> > > > Hi Greg,  

> > > > > On Sat, Jul 24, 2021 at 03:41:42PM +0200, Petr Vorel wrote:  
> > > > > > > Why is this even a driver at all, it looks like you can write a small
> > > > > > > userspace program using libusb to do everything it does, right?  What
> > > > > > > exactly is this driver needed for?  

> > > > > > I'm sorry for not providing more info at the beginning. This is a driver for
> > > > > > host computer (i.e. developers laptop) used by LiveSuit tool [2] to flash Images
> > > > > > to the NAND of Allwinner devices. LiveSuit itself [3] is unfortunately provided
> > > > > > only in binary form. The only open source code with GPL v2 license is awusb
> > > > > > driver. Thus I thought I could ease my life with upstreaming at least the
> > > > > > kernel driver. But maybe it's not a good idea. I'm using LiveSuit for flashing
> > > > > > Allwinner A31, but it requires quite old distro due libqtgui4. Maybe sunxi folks
> > > > > > use something newer nowadays, but I haven't found anything in their wiki.  

> > > > > Ah, that's not going to be good then.  Really, this doesn't seem to need
> > > > > to be a driver at all, and the ioctls are really strange so we would
> > > > > need to change them anyway before it could be merged.  But with no
> > > > > access to userspace code, that will be quite difficult, so I would push
> > > > > back on allwinner and have them work on resolving this.  
> > > > Understand, it makes sense. Thanks for your time!  

> > > > @Sunxi community: am I missing something? Using LiveSuit with old distro chroot
> > > > and Xephyr with out-of-tree module isn't fun :(.  

> > > Suggest you take a look at sunxi-tools - specifically the sunxi-fel
> > > tool. This is a libusb-based userland tool to talk to these devices.
> > > I'm not sure if it supports flashing to nand on A31 - never tried it -
> > > but have used it to flash to eMMC and SPI flash on their other chips.  
> > Thanks for a tip. Looking into sources it does not look like sunxi-fel supports
> > NAND.

> > Also from Debian wiki [1] (which describes bootable SD Card) it looks like only
> > old Allwinner u-boot supported access to NAND, thus I'd be surprised if
> > sunxi-tools supported it. sunxi-bootinfo does not implement NAND,
> > sunxi-nand-image-builder (which is not built by default) creates raw NAND
> > images, but now word about flashing.

> > I wonder why NAND is (probably) not supported by sunxi? Lack of documentation?

> Pure NAND is getting rarer these days, on modern boards we see mostly
> eMMC now (maybe SPI NAND). So NAND is only a concern for older SoCs.

> There is (limited) NAND support for mainline U-Boot on the C.H.I.P.
> boards[1], which use an A13 (derivative). But reliable operation is
> only possible with SLC NAND, which means only on the Chip Pro board,
> IIUC. Most boards will probably utilise MLC (or worse) NAND these days,
> where effects like write and read disturb make operation more
> complicated. Maxime has some stories to tell about this.
> So it would be first good to know if you have SLC NAND or not.

I have no idea which type of NAND device has.
It's device based on low end tablet. Can I find this info on running system
(sysfs, /proc, ...). dmesg does not say anything special.

Or is it possible to find it in source code? nand.ko module is some out of tree
code in modules/nand (kernel 3.3):
description:    Generic NAND flash driver code
author:         nand flash groups

But nothing mentions SLC or MLC. Or do I have to have HW spec?


> Because of this direct support for NAND in the tools is understandably
> "limited" (as in: non-existent). Except for SPI NOR flash there is no
> "direct" flashing support (for eMMC) in the tools anyway, it just relies
> on U-Boot support.
> How this works is that you use sunxi-fel to upload a (mainline) U-Boot
> binary directly into DRAM, and launch that. Then you can use the full
> functionality of U-Boot to load your image. Most popular for NAND
> support seems to be U-Boot's Android Fastboot implementation over a USB
> gadget device, so you can use the off-the-shelf fastboot tool on your
> host computer to flash the NAND. Other possibilities would be to use
> USB host support or TFTP to first load an image into DRAM, then use
> U-Boot commands to write that into the NAND flash.
> To my knowledge NAND flash in U-Boot *only* works on the A13/R8/GR8
> chips with SLC NAND, and is only enabled and tested on the Chip boards.
> Every other combination would require some work; much more work the
> farther you move from there (other SoC, MLC, ...).

Thanks for detailed info. It seems I'll just accept that for mainline my A31
needs sd-card.

Kind regards,
Petr

> Cheers,
> Andre

> [1] https://linux-sunxi.org/NextThingCo_CHIP
