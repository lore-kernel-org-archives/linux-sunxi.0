Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315AC173
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 14:22:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id n11so2466528wmd.2
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=OidAl/do55yUvpdpYmXLHY2+V3Sv+YT3yBTaUkxEFC8=;
        b=gFfQYYAJ6yTRr25GAdy/lLRAgmvZK4QwxtQ6LMtq05JWpWTrWcQxOSY1tRDFBpAHbJ
         GbDjQmX/SNMhApGKWT7LXSwHuKrDQK0dod1vXOBkZPWF79U2XVc13+6JdTc7OW31t7QL
         L9tYyho9EjVodkQxRhU7CgM+natjKJ2BeTkkLGbe59nh6q0WxCXeCPts8c3UcVpLCgkh
         MZ8nLg3WcXaIElg1O/H+gDEl7gkFT4esdEVxWSdw6DCBewY5iSxE8nuhXXoSPTgFxcWz
         y+lPEeqP8pOoK3EqWpq6GsQ0rvYymTGtFRa6YF6coreofUxdDpF1762P3IjhAz2tOEdR
         sBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=OidAl/do55yUvpdpYmXLHY2+V3Sv+YT3yBTaUkxEFC8=;
        b=Udn0w0c8XSWpKHM80onPLuCI664HpF5bXzP4Nck0Uo0sBIyF6OBVohg/MaW30JlSHU
         j3ZmTasdbAVT30bXEl7X6FHejZnv0Edxg5OyicxEMIUwAkZlAxeXS9cYXA2J4WvOWxX8
         smqJTODJZQsHNjt+Pvuw9YshMh6kFte4CwXFBbRtpZV2GpouiLEk0JahiZf2lm0m3A9N
         hSCwLwC4MuEH0UKjki3pfhZF+Vgp9ac5hZNCL/pqKnHWtYZ+Ey1oMB74gHen5PN8g48S
         aaCb7An7ri6Bzm/aYvLGX4DuvUV3EumCjKxVlIgcoDCP4iiZZQiISQuzQqeoR0+3vMcx
         Q2hw==
X-Gm-Message-State: AOAM532tX2FyVXg5mM02dN80A8ESAgh4IbIak4wLUXjfMsrGLDAOv+HI
	OJEg8y0lDCzcWO0jLjRnxjQ=
X-Google-Smtp-Source: ABdhPJxvpu3zcNgY1ATbyrkS+0VM7dPLJ6tyK8LOF5Qxt+ReD6fS8qb6P54l9S9l9pcdLZ92j+y+qw==
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr7402502wmj.74.1627136539499;
        Sat, 24 Jul 2021 07:22:19 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id w16sm22498361wru.58.2021.07.24.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 07:22:18 -0700 (PDT)
Date: Sat, 24 Jul 2021 16:22:16 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com
Subject: Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <YPwiGB7VnzECN/jg@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <YPvjYIsu0G0HSu5I@pevik>
 <YPvrpUZ/VRc0eHvA@kroah.com>
 <YPwYlvh4DqaUsPCF@pevik>
 <YPwhAsK/rDkVeK0y@kroah.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPwhAsK/rDkVeK0y@kroah.com>

Hi Greg,

> On Sat, Jul 24, 2021 at 03:41:42PM +0200, Petr Vorel wrote:
> > > Why is this even a driver at all, it looks like you can write a small
> > > userspace program using libusb to do everything it does, right?  What
> > > exactly is this driver needed for?

> > I'm sorry for not providing more info at the beginning. This is a driver for
> > host computer (i.e. developers laptop) used by LiveSuit tool [2] to flash Images
> > to the NAND of Allwinner devices. LiveSuit itself [3] is unfortunately provided
> > only in binary form. The only open source code with GPL v2 license is awusb
> > driver. Thus I thought I could ease my life with upstreaming at least the
> > kernel driver. But maybe it's not a good idea. I'm using LiveSuit for flashing
> > Allwinner A31, but it requires quite old distro due libqtgui4. Maybe sunxi folks
> > use something newer nowadays, but I haven't found anything in their wiki.

> Ah, that's not going to be good then.  Really, this doesn't seem to need
> to be a driver at all, and the ioctls are really strange so we would
> need to change them anyway before it could be merged.  But with no
> access to userspace code, that will be quite difficult, so I would push
> back on allwinner and have them work on resolving this.
Understand, it makes sense. Thanks for your time!

@Sunxi community: am I missing something? Using LiveSuit with old distro chroot
and Xephyr with out-of-tree module isn't fun :(.

Kind regards,
Petr

> thanks,

> greg k-h
