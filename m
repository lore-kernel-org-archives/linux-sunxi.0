Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563D1168
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 16:27:58 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id b7so5663097edu.3
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 09:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=xbfwN2jRafSV4yVNNLXMcmcEgU4xL3kWjh6wUU33+fc=;
        b=jGGxFj8aHHBGzY1xSDTvcqz0qrlrUGxBrwrmEnJzMhJB3pXBwz02i9tGeUs/h0VK17
         +yyclHYv8Kj6A+dNQegmkLD23IWA4qdM2juuXGGSbOLvYPG6OAANKUoeSXBHOfEyCzWE
         DssbWJRBZfoYHPtUYzs5NjZtgQLJstZnf8q+YHkdXXFX/LbkUK7+4rVX19FioIeWDECU
         hYenEP7cAf+AJ3EE/hvY8Xp7sgZNLb/wrDEv4Po93gxvTHpn8eFi7wPwfxMdhOExHYdb
         hh6/KjqSx7X0RZzE3GwbQLQUOVsnyhm2XbYIH76jVb282xS20g5FUclgUG17OIo/cnXb
         NPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=xbfwN2jRafSV4yVNNLXMcmcEgU4xL3kWjh6wUU33+fc=;
        b=pwxcwwgJlsNWg2MYq75wKvhnNKLBKs+ZbbzDXRyMWmDe0hFrX4UtxnM677vrELxV/Y
         qkE2fmReKRszqn9Xev6mJlGHeUUi5gOXFIWJShbvUWKqRCx9/K11IJboF9tqwgbFbrMG
         rLAoVFO4kk4WEdR3hjMhLVXj+00tQ8+HiVWhNzVrEdj7QfYvI2O8ylZJhQQ0xE5ftIvs
         zqiFfZTRwLMEADhNh0KBSClXxSYbOts2qKjRlSGqBlylQAIxevNmLMsKPqAEiSY/N/PH
         nkbykui2lJ/FtDH/eS83Dm03fdgakOcB0kkaa7DtwTf4+AzrykuPGWx3vgUQAk8SyqKF
         9mtA==
X-Gm-Message-State: AOAM530Q2oxf3NSCuwYjvyF9E/aXjJtRX3jhjFnesFRX2BUkK61nPsbi
	e9+sDNYZU4gKads1elibOtA=
X-Google-Smtp-Source: ABdhPJxwyLo8h07AhKCuQFn/BQ5jeiXq1ila9AWXWcIFlZVaopNHhjFVg8K52NAHTZFxUsddiI4PoQ==
X-Received: by 2002:aa7:c5da:: with SMTP id h26mr11832746eds.109.1627144076634;
        Sat, 24 Jul 2021 09:27:56 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id kb12sm12533659ejc.35.2021.07.24.09.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 09:27:56 -0700 (PDT)
Date: Sat, 24 Jul 2021 18:27:53 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Christopher Obbard <chris@64studio.com>
Cc: linux-sunxi@lists.linux.dev,
	mailing list linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <YPw/iTdsqggtvlKL@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <YPvjYIsu0G0HSu5I@pevik>
 <YPvrpUZ/VRc0eHvA@kroah.com>
 <YPwYlvh4DqaUsPCF@pevik>
 <YPwhAsK/rDkVeK0y@kroah.com>
 <YPwiGB7VnzECN/jg@pevik>
 <CAP03Xer3QK7gFa5szL7gQLq-=-muyPDzH-D24mhafDpUjj5=bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP03Xer3QK7gFa5szL7gQLq-=-muyPDzH-D24mhafDpUjj5=bw@mail.gmail.com>

Hi Chris, all,

[ Dropping Greg and linux-usb@vger.kernel.org ]
> Peter,

> On Sat, 24 Jul 2021 at 15:22, Petr Vorel <petr.vorel@gmail.com> wrote:

> > Hi Greg,

> > > On Sat, Jul 24, 2021 at 03:41:42PM +0200, Petr Vorel wrote:
> > > > > Why is this even a driver at all, it looks like you can write a small
> > > > > userspace program using libusb to do everything it does, right?  What
> > > > > exactly is this driver needed for?

> > > > I'm sorry for not providing more info at the beginning. This is a driver for
> > > > host computer (i.e. developers laptop) used by LiveSuit tool [2] to flash Images
> > > > to the NAND of Allwinner devices. LiveSuit itself [3] is unfortunately provided
> > > > only in binary form. The only open source code with GPL v2 license is awusb
> > > > driver. Thus I thought I could ease my life with upstreaming at least the
> > > > kernel driver. But maybe it's not a good idea. I'm using LiveSuit for flashing
> > > > Allwinner A31, but it requires quite old distro due libqtgui4. Maybe sunxi folks
> > > > use something newer nowadays, but I haven't found anything in their wiki.

> > > Ah, that's not going to be good then.  Really, this doesn't seem to need
> > > to be a driver at all, and the ioctls are really strange so we would
> > > need to change them anyway before it could be merged.  But with no
> > > access to userspace code, that will be quite difficult, so I would push
> > > back on allwinner and have them work on resolving this.
> > Understand, it makes sense. Thanks for your time!

> > @Sunxi community: am I missing something? Using LiveSuit with old distro chroot
> > and Xephyr with out-of-tree module isn't fun :(.

> Suggest you take a look at sunxi-tools - specifically the sunxi-fel
> tool. This is a libusb-based userland tool to talk to these devices.
> I'm not sure if it supports flashing to nand on A31 - never tried it -
> but have used it to flash to eMMC and SPI flash on their other chips.
Thanks for a tip. Looking into sources it does not look like sunxi-fel supports
NAND.

Also from Debian wiki [1] (which describes bootable SD Card) it looks like only
old Allwinner u-boot supported access to NAND, thus I'd be surprised if
sunxi-tools supported it. sunxi-bootinfo does not implement NAND,
sunxi-nand-image-builder (which is not built by default) creates raw NAND
images, but now word about flashing.

I wonder why NAND is (probably) not supported by sunxi? Lack of documentation?

Kind regards,
Petr

[1] https://wiki.debian.org/InstallingDebianOn/Allwinner

> hth,
> Chris


> > Kind regards,
> > Petr

> > > thanks,

> > > greg k-h

> > --
> > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/YPwiGB7VnzECN/jg%40pevik.
