Received: from web2.default.djames.uk0.bigv.io (web2.default.djames.uk0.bigv.io [213.138.101.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30385168
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=64studio.com; s=default; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hBAWzjHE1DuRSCF6S8CdD0ePFRz8UoK8Thexch+Tc/w=; b=ewfTBsVL1N4Dwbv87lqX/knVoP
	wr5ht/KQ4bwnkJiQkKE/kNVGGVuXuTXh2UF9KIVReVXKzRusXejLgL6gKFfRnOf3ZUiyHDzP4QqD5
	uyjTWUBTX4FwaNiFBCqlOnmAAfor/dEATFQNp69v7tjO91eklnDzqVOJix2GLhLBSpQiS9WmXY7tJ
	Afj3tpdT9hatgsETLKHmL7NFUMJnKUhBiBw0ZYUn5I4ZNRY9JiEwgxFBZjyOhQzjcSYfhFg8uo+Jn
	ckLojQ01FO6dV0LyR6yHFewsbQZgTAb96DW7ZAaZzNf+kygv1Gg20TPX+MQExPkC2J6oGFXCqwHR3
	lgAZMiHA==;
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by web2.default.djames.uk0.bigv.io with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <chris@64studio.com>)
	id 1m7Itz-0005av-Ln
	for linux-sunxi@lists.linux.dev; Sat, 24 Jul 2021 15:45:19 +0100
Received: by mail-yb1-f181.google.com with SMTP id w17so6966414ybl.11
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 07:45:19 -0700 (PDT)
X-Gm-Message-State: AOAM532wEQqyP9Txhtd/bKAumglHsBDiq7in91mE6YX62p+Iv0sLi24k
	SXlnd1K6d9CnxidKKIHQ3/NO2LBktVsYuZqcGDk=
X-Google-Smtp-Source: ABdhPJyUYL4RS59E0vIPLcXP42s9bowePD+XmKhZuhJ03m7uB1RZucQQ6FrJiHko/bA4JT6GHWmxXSM+Y8ywb6TH6yk=
X-Received: by 2002:a25:dbce:: with SMTP id g197mr13539511ybf.152.1627137918410;
 Sat, 24 Jul 2021 07:45:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YPvjYIsu0G0HSu5I@pevik> <YPvrpUZ/VRc0eHvA@kroah.com>
 <YPwYlvh4DqaUsPCF@pevik> <YPwhAsK/rDkVeK0y@kroah.com> <YPwiGB7VnzECN/jg@pevik>
In-Reply-To: <YPwiGB7VnzECN/jg@pevik>
From: Christopher Obbard <chris@64studio.com>
Date: Sat, 24 Jul 2021 15:45:06 +0100
X-Gmail-Original-Message-ID: <CAP03Xer3QK7gFa5szL7gQLq-=-muyPDzH-D24mhafDpUjj5=bw@mail.gmail.com>
Message-ID: <CAP03Xer3QK7gFa5szL7gQLq-=-muyPDzH-D24mhafDpUjj5=bw@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: Mainlining Linux Sunxi SoC AW USB
To: petr.vorel@gmail.com
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, 
	mailing list linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

Peter,

On Sat, 24 Jul 2021 at 15:22, Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi Greg,
>
> > On Sat, Jul 24, 2021 at 03:41:42PM +0200, Petr Vorel wrote:
> > > > Why is this even a driver at all, it looks like you can write a small
> > > > userspace program using libusb to do everything it does, right?  What
> > > > exactly is this driver needed for?
>
> > > I'm sorry for not providing more info at the beginning. This is a driver for
> > > host computer (i.e. developers laptop) used by LiveSuit tool [2] to flash Images
> > > to the NAND of Allwinner devices. LiveSuit itself [3] is unfortunately provided
> > > only in binary form. The only open source code with GPL v2 license is awusb
> > > driver. Thus I thought I could ease my life with upstreaming at least the
> > > kernel driver. But maybe it's not a good idea. I'm using LiveSuit for flashing
> > > Allwinner A31, but it requires quite old distro due libqtgui4. Maybe sunxi folks
> > > use something newer nowadays, but I haven't found anything in their wiki.
>
> > Ah, that's not going to be good then.  Really, this doesn't seem to need
> > to be a driver at all, and the ioctls are really strange so we would
> > need to change them anyway before it could be merged.  But with no
> > access to userspace code, that will be quite difficult, so I would push
> > back on allwinner and have them work on resolving this.
> Understand, it makes sense. Thanks for your time!
>
> @Sunxi community: am I missing something? Using LiveSuit with old distro chroot
> and Xephyr with out-of-tree module isn't fun :(.

Suggest you take a look at sunxi-tools - specifically the sunxi-fel
tool. This is a libusb-based userland tool to talk to these devices.
I'm not sure if it supports flashing to nand on A31 - never tried it -
but have used it to flash to eMMC and SPI flash on their other chips.

hth,
Chris

>
> Kind regards,
> Petr
>
> > thanks,
>
> > greg k-h
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/YPwiGB7VnzECN/jg%40pevik.
