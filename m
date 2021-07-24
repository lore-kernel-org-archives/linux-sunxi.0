Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF384168
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 14:54:45 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id n2so5405072eda.10
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 07:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XUo1lk4Li+vqUd9hvUn6IiMsQ2dDNJJ7BPRUlWZDlh8=;
        b=g6eRfAWvW0nrVMm35WoZBbMVMbqkTBxrN8bW0buINR1i4eGqw8Ru+jjXyUi70E6y/6
         4WIy3yr3jyLcdjiNSn+1TUKB86VYT52LPyVo37pbt+rpUB6+We2A2rBhCGb2HLXgZizJ
         9iZ3Tn9iMLGPC8TRLOLC5r7/6RA2/2h6H1dcjey8vF7Gh6y6lNdFLp/Dzu22R4VBkI79
         JUT5+lRuh9YiEE8HuNv9dn1fAmDxqrXTksR8I25t+kVi/aWj5Yx9Iri2mBi4MGcEIsRE
         91id7X0PX12Tk0MQZyr0hR/rirc+/hQNedPOhOGIOgzuEof/qOB+YkfmQuEjgubK5+vj
         PcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XUo1lk4Li+vqUd9hvUn6IiMsQ2dDNJJ7BPRUlWZDlh8=;
        b=AOByMrRyW8sxDW8pZcVajEgfK4MKUx6t2qbqfGNA1F8IFRgBfoU47qthS7UEZ9JuvB
         Agh+XllmEEmrZo86Iwd/pwyAspsZW+1oBEX+XLIsjYWLPLthjhYXqWWyPqh7WP31vbl1
         266yCGap6+lsXHyc0GHU1sJE1jOBygC5u4xuS1hc1S9+exPyWRmE2FbnwUw3xSuNSj2t
         eIVgYxrTrDkyCbhIzcG0eCcbwL1AEiq3/1oEZTM/C/1MfblFzT2lqzZP6S98C3WVdxtz
         Wt8EpkpjEPscqlMLLRD0D/UY3ZDHNcHoGB1VAEVCnoReUMvj8ALOto7QXiSunDsmwX5U
         wiQg==
X-Gm-Message-State: AOAM530AP9RHWb6tDLkq/smgykNQKKPD5QmwJCIfLjhDjEfnOD8DZ46z
	MUy5/cMEYt7ohahNmkpXCwQ=
X-Google-Smtp-Source: ABdhPJx1A2qX60pJax47DtdFdMyKLHhS7kQ5z6X+ZhLcUsy7SAlu/yLyD0FQ7aVdRJyEnbcmuE20pQ==
X-Received: by 2002:a05:6402:1707:: with SMTP id y7mr6359642edu.167.1627138484200;
        Sat, 24 Jul 2021 07:54:44 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id z27sm1384796eja.59.2021.07.24.07.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 07:54:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Petr Vorel <petr.vorel@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-sunxi@googlegroups.com
Subject: Re: Mainlining Linux Sunxi SoC AW USB
Date: Sat, 24 Jul 2021 16:54:42 +0200
Message-ID: <4183659.s5WrjGzUDR@jernej-laptop>
In-Reply-To: <YPwiGB7VnzECN/jg@pevik>
References: <YPvjYIsu0G0HSu5I@pevik> <YPwhAsK/rDkVeK0y@kroah.com> <YPwiGB7VnzECN/jg@pevik>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 24. julij 2021 ob 16:22:16 CEST je Petr Vorel napisal(a):
> Hi Greg,
> 
> > On Sat, Jul 24, 2021 at 03:41:42PM +0200, Petr Vorel wrote:
> > > > Why is this even a driver at all, it looks like you can write a small
> > > > userspace program using libusb to do everything it does, right?  What
> > > > exactly is this driver needed for?
> > > 
> > > I'm sorry for not providing more info at the beginning. This is a driver
> > > for host computer (i.e. developers laptop) used by LiveSuit tool [2] to
> > > flash Images to the NAND of Allwinner devices. LiveSuit itself [3] is
> > > unfortunately provided only in binary form. The only open source code
> > > with GPL v2 license is awusb driver. Thus I thought I could ease my
> > > life with upstreaming at least the kernel driver. But maybe it's not a
> > > good idea. I'm using LiveSuit for flashing Allwinner A31, but it
> > > requires quite old distro due libqtgui4. Maybe sunxi folks use
> > > something newer nowadays, but I haven't found anything in their wiki.> 
> > Ah, that's not going to be good then.  Really, this doesn't seem to need
> > to be a driver at all, and the ioctls are really strange so we would
> > need to change them anyway before it could be merged.  But with no
> > access to userspace code, that will be quite difficult, so I would push
> > back on allwinner and have them work on resolving this.
> 
> Understand, it makes sense. Thanks for your time!
> 
> @Sunxi community: am I missing something? Using LiveSuit with old distro
> chroot and Xephyr with out-of-tree module isn't fun :(.

Community is mostly concerned with mainline kernel nowadays and thus with 
standard tools. Few people still use vendor (BSP) kernel and most of those use 
it without LiveSuit (like custom distro images).

Now and then people ask about LiveSuit on IRC, but they usually get little 
response.

Best regards,
Jernej

> 
> Kind regards,
> Petr
> 
> > thanks,
> > 
> > greg k-h




