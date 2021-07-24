Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F986173
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 13:41:47 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id v21so8063702ejg.1
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 06:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=OJT5/sSP5Mjt2oaeVC9S2V4Pc2oQHFo/oq6wx4ILIG0=;
        b=VaVJ1mpPMVkcbBeqeyYq6ZceD2gdrQWo1dlbtHem1O669VnplDHKQGAIB8pCz4C0g+
         UvK5FkmkX7RJUPYqdRbHAeaDjsz9F1j37c5AiBIAgVLwLl7LlOYeYeLAUIs+2uuIIBQX
         KaLRbHKvvFm0JXXcXfBPKQwYrTxBQ4VvXa5LC0lzhKDVopqGSQK+u9/pYNScG7yi4djq
         /7zcJlzYK8BETm/ovcGh65+9tX0+vx7Ne/hvWeunZzTZhY23hfAIsC8anjB4HzUMzsna
         lXEQqWgJEr0ANPPE5D497j84oWrXFr872p7+pnN5SqJRojeci0h1YuyPqALQ9uKCQsvP
         RWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=OJT5/sSP5Mjt2oaeVC9S2V4Pc2oQHFo/oq6wx4ILIG0=;
        b=OhwxSHyaHW4rHFeBy6QS9WAiCjUxkJAcgsuDszbJOE6rpiM5qF2/Inj9SRmL/HWeC7
         Eg9wexiuHrFxzXrSj4dzKOzFGEoXN+DZLYqY+6hIpVaFGd0vFN8znV2iSe7uWTU1jH9p
         Yxe0FkzcN6WyX73MDQZ0bGVEvQnxOryLEdGUT1XL8Fg4vMYE7m8oXejqKzVnn9UYFuva
         HpoFv2qIEpZ5RbkSzUtWUHSX/S7cTgEMRsIj8IR8P8VgwK2hMw2vAtmWwVTrc3jWD18D
         XQncf480pLoGF/eZ2gLeraBWNYvO2sI3JX9NGEaYNyQXULn4nSNQX2Krba9kf3Dl/SDO
         awmA==
X-Gm-Message-State: AOAM531buZuaLQkuC9Q1Tf7QYq+qKnbmoy9Q8tnRlViIStoR0HJgCyun
	0zm16RgIiP09oTUcxDz/lXM=
X-Google-Smtp-Source: ABdhPJwsi30sBhw7WaxheY8jkgbLPh2/9nF2lHzrHFwplBZhh5FSrwl4eshLyqPD9ImbQBUO0PVi9A==
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr8768686ejc.264.1627134105806;
        Sat, 24 Jul 2021 06:41:45 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id i11sm1720266eds.72.2021.07.24.06.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 06:41:45 -0700 (PDT)
Date: Sat, 24 Jul 2021 15:41:42 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com
Subject: Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <YPwYlvh4DqaUsPCF@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <YPvjYIsu0G0HSu5I@pevik>
 <YPvrpUZ/VRc0eHvA@kroah.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPvrpUZ/VRc0eHvA@kroah.com>

Hi Greg,

[ Cc: linux-sunxi@lists.linux.dev and linux-sunxi@googlegroups.com, which I
should have done before ]

> On Sat, Jul 24, 2021 at 11:54:40AM +0200, Petr Vorel wrote:
> > Hi,

> > I'd like to cleanup and mainline Linux Sunxi SoC AW USB host driver [1].

> Great!

> > What are the most ugly parts which should be replaced? Loading module does not
> > complain about anything?
> > [267044.912155] awusb: loading out-of-tree module taints kernel.

> That will be fixed by moving it into the tree.

> > [267044.912257] awusb: module verification failed: signature and/or required key missing - tainting kernel

> That shows a mis-match between you building a kernel and what keys were
> used to build the distro kernel you are using.

> > [267044.913399] usbcore: registered new interface driver allwinner
> > [267044.913401] awusb: v0.5:AW USB driver

> Looks fine.
Yep, I meant by this, that I see nothing serious (i.e. agree with you).

> > BTW should it go to the host/Kconfig or misc/Kconfig or elsewhere?

> No idea, is this a host driver or does it control a USB device you plug
> into the system?

> > [1] https://github.com/linux-sunxi/sunxi-livesuite/blob/master/awusb/awusb.c

> I looked at this, and it's a device driver, not a host controller
> driver.

> But it looks to need a userspace program for the ioctls, where is that
> code at?  And why does it need any ioctls at all?

> Why is this even a driver at all, it looks like you can write a small
> userspace program using libusb to do everything it does, right?  What
> exactly is this driver needed for?

I'm sorry for not providing more info at the beginning. This is a driver for
host computer (i.e. developers laptop) used by LiveSuit tool [2] to flash Images
to the NAND of Allwinner devices. LiveSuit itself [3] is unfortunately provided
only in binary form. The only open source code with GPL v2 license is awusb
driver. Thus I thought I could ease my life with upstreaming at least the
kernel driver. But maybe it's not a good idea. I'm using LiveSuit for flashing
Allwinner A31, but it requires quite old distro due libqtgui4. Maybe sunxi folks
use something newer nowadays, but I haven't found anything in their wiki.

Kind regards,
Petr

[2] https://github.com/linux-sunxi/sunxi-livesuite
[3] https://github.com/linux-sunxi/sunxi-livesuite/tree/master/x86-64

> thanks,

> greg k-h
