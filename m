Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0170
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 16:46:28 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id v21so8578155ejg.1
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 09:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=KS7LqRa61ZiOYJE456QYqQdZ3oXvDoDBkRuUB4uquzc=;
        b=mwTDDJOq4mStbVrbUZHXe1VEiGEmjJy7fcEivyPe55+Hx/rRbqvcGafPPSV32AWCXy
         l1hoBQLRPf4untwsCtGjpzBgBlMfZr+85eSv92uxJV9rlrdDZNagGA6wQBZar6FAB3n/
         uJYSiUg/JJEHUL2acYOx/Z9sMvmUNtiucahmfov09N2hQYT2LoZmPyHuRyWJktkMQG4W
         SMZqat6Ol8aDDxNJqo254DWtT/YrJsYUM5e/4aT10KGhMoBFyp03nz/zdFrhltpPPPLC
         +zkYSoBEhYUv6PWSv7vsNNQJAHjoPVBBQDqjz3GdR46vcfwHIMro93eZocTFFRO4Y282
         rN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=KS7LqRa61ZiOYJE456QYqQdZ3oXvDoDBkRuUB4uquzc=;
        b=Hgsg4vCGUbRSVOhjVQyQ2w9FEQWpXDMIAJ3JaeD0QYTXtnAnRh/XdAn7oPk8XgyWGF
         ievpVv/lGMYjmgLQuRoLB0zBZ5jd1LjP1lodqnQUVs4u7nl1LCcbihgBwsnS9pac7chJ
         M4xlDVtnmeYnehdzzyjy4IPV79t53L+H3KMojWdS0CKtiecC4nYdr6FAN8K50Lx56KvL
         9BRSlKZj62DZGmk2MX9pvHvxRGpAIjyFHCx0gQNaM9228ezxLhOtdPlFQl7yid4hJsHu
         w2CWmElxgR6aT72T5at27Vx2VMcj70Yj/zWi4K7jdsXUGvuFM9bxdZfvMeadc6NstzYl
         S5TQ==
X-Gm-Message-State: AOAM531GUUY5y2PgUBfJHfsdWgSdccfb1T7veYetYEqDg5KOhFmI0FsN
	Eg1GfxYP289OEjfeuvVToweoF0/CRyjYsw==
X-Google-Smtp-Source: ABdhPJx5j52oxCXLrbufhe9G897Z+alQjRSnM938i3JtyaBjCyVpK1bgt18s/RRryFNyPT2XbCvz/A==
X-Received: by 2002:a17:906:4dcf:: with SMTP id f15mr9586119ejw.400.1627145186968;
        Sat, 24 Jul 2021 09:46:26 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id gw8sm12498704ejb.44.2021.07.24.09.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 09:46:26 -0700 (PDT)
Date: Sat, 24 Jul 2021 18:46:24 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Jernej =?iso-8859-2?Q?=A9krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-sunxi@googlegroups.com
Subject: Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <YPxD4J3u2jo319JY@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <YPvjYIsu0G0HSu5I@pevik>
 <YPwhAsK/rDkVeK0y@kroah.com>
 <YPwiGB7VnzECN/jg@pevik>
 <4183659.s5WrjGzUDR@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4183659.s5WrjGzUDR@jernej-laptop>

Hi Jernej,

[ Dropping Greg and linux-usb@vger.kernel.org ]

> Dne sobota, 24. julij 2021 ob 16:22:16 CEST je Petr Vorel napisal(a):
> > Hi Greg,

> > > On Sat, Jul 24, 2021 at 03:41:42PM +0200, Petr Vorel wrote:
> > > > > Why is this even a driver at all, it looks like you can write a small
> > > > > userspace program using libusb to do everything it does, right?  What
> > > > > exactly is this driver needed for?

> > > > I'm sorry for not providing more info at the beginning. This is a driver
> > > > for host computer (i.e. developers laptop) used by LiveSuit tool [2] to
> > > > flash Images to the NAND of Allwinner devices. LiveSuit itself [3] is
> > > > unfortunately provided only in binary form. The only open source code
> > > > with GPL v2 license is awusb driver. Thus I thought I could ease my
> > > > life with upstreaming at least the kernel driver. But maybe it's not a
> > > > good idea. I'm using LiveSuit for flashing Allwinner A31, but it
> > > > requires quite old distro due libqtgui4. Maybe sunxi folks use
> > > > something newer nowadays, but I haven't found anything in their wiki.> 
> > > Ah, that's not going to be good then.  Really, this doesn't seem to need
> > > to be a driver at all, and the ioctls are really strange so we would
> > > need to change them anyway before it could be merged.  But with no
> > > access to userspace code, that will be quite difficult, so I would push
> > > back on allwinner and have them work on resolving this.

> > Understand, it makes sense. Thanks for your time!

> > @Sunxi community: am I missing something? Using LiveSuit with old distro
> > chroot and Xephyr with out-of-tree module isn't fun :(.

> Community is mostly concerned with mainline kernel nowadays and thus with 
> standard tools. Few people still use vendor (BSP) kernel and most of those use 
> it without LiveSuit (like custom distro images).
Understand. LiveSuit is for me a way back to original firmware.

Kind regards,
Petr

> Now and then people ask about LiveSuit on IRC, but they usually get little 
> response.

> Best regards,
> Jernej
