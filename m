Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7DF3FCB
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Sep 2021 02:56:00 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id y144so12989438qkb.6
        for <linux-sunxi@lists.linux.dev>; Thu, 16 Sep 2021 19:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ebVDbip47mMfYTa5g8Sa5HPe2DFSzo9dsJYPn4TR6RU=;
        b=QLpLL2rP+/XZR3FQzmjaBIm2bgtSUu32b8abkDWIy9XmRTeUtXri4sfKpBplA3lH9i
         j6wMT3qT93hhHjwaw7mcCDXKlGusI7NTl3x5dJFMIXtHs87kragT8r0ovzoljHrFOwaq
         2Omvsc/X6iL7oeGMIZ3RPUjDHKLNEHZn84Cmhla6TUOZ1UvBfMoOZQXUcEzfAJ9MYkp7
         i4TIsjAtWv8qx0yhxX6oJlI3oJSCl6hsR/fOovTavulMybDnGVA1YD+ZRXkMJ46JY+g3
         UgQRaTX9aUNjgCr3PHx2Ybjxd+SLRvDOD8GotvBPK+SrV1oA+8GnMJTujDzB+f6AtGIC
         QYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ebVDbip47mMfYTa5g8Sa5HPe2DFSzo9dsJYPn4TR6RU=;
        b=upURjCx2JGeu5Gf2Y9EPTrRCifmEetEN6aSmfG4eumicvwQR5+LJC5ukMa5tFtCYls
         KbAvfEUFkx+Ui62zTWYEf7WxxB8kXuqhyKz6OiBZgxQT8O+xTyTv6q3ZJoPKfeZ7w42L
         Kns2nb/nWeA1gUZ1wjt0YU43Ow7RbdFCo5WmDGMJ/1OC4pfN2yObMuRKjio6n7Eq1A40
         oqL9j5vu7PQxYmMWGaNXe4or3EciHQwzB8BJFjNqrj4sxengzEhgyj5yzJLcBkxD0ysE
         TJEdlqinu/t+TA1g77VjahNPELwJxoSJPqCULtNueOGGp9ligw5W8kUez1Jbh7dR0U7M
         vqFA==
X-Gm-Message-State: AOAM533jLcQ3bs/zkRiiRt1g2MnaWkxthCKj6TZRc1gBhom8b//dpn3c
	Hku8ayKu0bQeRQPaElGPZhYQgiT0ZNo+PIOHaCx48w==
X-Google-Smtp-Source: ABdhPJwcUPbpZTeQAdAxLzyPn0NY9w0d+j1/iYoBMz3JNe/tPn4fvPKvRkmfAp6Pz22v4oIobO/ZHTvdNSirxcQbvdU=
X-Received: by 2002:a25:af49:: with SMTP id c9mr10705070ybj.432.1631847358843;
 Thu, 16 Sep 2021 19:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5570111.f9yF5Hohu3@kista> <CAGETcx9_dy4qdmZ-+X+WLsezPKWfZzmRU8QmhKOu6FdZcysWDA@mail.gmail.com>
 <CAGETcx_6muHgmDAviMf-UBvriePwc+o5408nDeNd_v3zR_x9TQ@mail.gmail.com> <33995494.1UIDBzYVPQ@kista>
In-Reply-To: <33995494.1UIDBzYVPQ@kista>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 16 Sep 2021 19:55:22 -0700
Message-ID: <CAGETcx-_sNJ1Z-8Bmqh+awi-2xnQQLjnJf+Zncj23ByDmJYDJQ@mail.gmail.com>
Subject: Re: Re: Issue with fw_devlink=on on 5.14
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Android Kernel Team <kernel-team@android.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 11:59 AM Jernej =C5=A0krabec
<jernej.skrabec@gmail.com> wrote:
>
> /cc linux-kernel@vger.kernel.org
>
> Dne sreda, 15. september 2021 ob 20:36:11 CEST je Saravana Kannan napisal=
(a):
> > On Wed, Sep 15, 2021 at 11:23 AM Saravana Kannan <saravanak@google.com>
> wrote:
> > >
> > > On Wed, Sep 15, 2021 at 11:07 AM Jernej =C5=A0krabec
> > > <jernej.skrabec@gmail.com> wrote:
> > > >
> > > > Hi Saravana!
> > > >
> > > > I noticed that in kernel 5.14, at least on Allwinner H3, deinterlac=
e
> driver
> > > > doesn't load anymore if fw_devlink is set to on. If I set it to off=
,
> driver
> > > > loads and works without problems. If I remove interconnects propert=
y in
> DT
> > > > node and use driver hack instead, it also loads and work ok.
> > > >
> > > > For reference, I speak about this node:
> > > > https://elixir.bootlin.com/linux/v5.14/source/arch/arm/boot/dts/sun=
8i-h3.dtsi#L153
> >
> > Oh the dts file please. Not dtsi. I need the full picture of dependenci=
es.
>
> I just dumped DTB from the board I use for testing this:
> http://ix.io/3yZB

I was basically asking for this:
arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts

>
> >
> > -Saravana
> >
> > > >
> > > > Do you have any clue why it doesn't work?
> > >
> > > Kinda busy today and I'll take a close look later, but if you delete
> > > "interconnect" but it works, then it seems like you have no driver fo=
r
> > > your "mbus" interconnect? Is that expected?
>
> Ah, you're completely right. There is no MBUS driver (yet), since current
> purpose of that node is to determine DMA memory offsets and for that you =
don't
> need a driver.

Can you explain more how you get the DMA memory offsets in the code
from this node?

You might be able to add status=3D"disabled" to the mbus node and this
would go away as fw_devlink doesn't cause a consumer to wait on a
disabled supplier. See more below -- you have a bunch of options.

>
> There is already WIP driver for it, though:
> https://github.com/crust-firmware/linux/commit/
> db34316a0194dbf0fcb8eba677ef11085a06a340
>
> > >
> > > If you have a driver, then make it use the proper driver model (probe
> > > a platform device).
> > >
> > > If you don't have a driver for it, I'm assuming you have
> > > CONFIG_MODULES enabled. Otherwise, fw_devlink=3Don is smart enough to
> > > know not to block on devices that'll never be probed.
>
> Correct, modules are enabled.
>
> > >
> > > If you do need CONFIG_MODULES enabled, then use
> > > deferred_probe_timeout=3Dxxx so that fw_devlink doesn't wait for more
> > > modules to be loaded past xxx seconds.
>
> It's not what I want, but more that we broke default configuration and
> CONFIG_MODULES=3Dy should really work.

Well, fw_devlink=3Don can't tell if you don't have a driver or if you
are going to load it soon (since you have CONFIG_MODULES enabled). So
if it's a board you are actively bringing up, one of the other options
below might be good to use.

> Is there any other way to fix this besides
> providing dummy MBUS driver? I doubt it would be accepted for backporting=
.

You could use fw_devlink=3Dpermissive in the kernel commandline, but it
will disable a bunch of benefits of fw_devlink=3Don (no pointless
deferred probes, no suspend/resume ordering based on dependencies
listed in DT, etc).

Another option would be to use deferred_probe_timeout=3D1 in the kernel
commandline, and this will cause this to be unblocked 1 second after
late_initcall() and you'll get the benefit of fw_devlink=3Don for all
the devices that have a driver registered by then (and some more
devices too -- see commit text of
d46f3e3ed5276e756caf40f760d4902d15c12dcb).

-Saravana

>
> > >
> > > Also I like to look up emails on lore, so when emailing me about
> > > fw_devlink (or any Linux stuff in general I suppose), it'd be nice if
> > > you can cc LKML.
>
> Noted.
>
> Best regards,
> Jernej
>
> > >
> > > Thanks,
> > > Saravana
> >
>
>
