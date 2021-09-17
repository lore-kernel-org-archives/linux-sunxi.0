Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BC53FC0
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Sep 2021 04:32:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so6761607wmh.1
        for <linux-sunxi@lists.linux.dev>; Thu, 16 Sep 2021 21:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CuxZghyhVhMfnxIfYloUb+CTfop3eq4J/ICJFqbMMf8=;
        b=SXEqjhF4dGbOnoYgk6/eDdrnHGP0EOWuZ08dsjC3oU+gYKO0eqB5H2jZN7CB+cVVeY
         Z7bPfXrI+zaDLZIgN7chkJS2OBhndXjM7ZGoEzc6pPePazSmSMzwWI8VCCFf76OZw71l
         HB7gpBWyLM823GM1yDbvTphpaYXxb4GagPikhluZAn5GdQxP054glYh692BSw1a84NMN
         FXujPWlJqqULT2XZRHApmvT82J60JZW06gUuWKtV27bKO/QPiTn6Cnfw5QoFOdl06WWq
         OZ0EwzQDgnF7ZPPl1Vc+TT9yLEd7TMb+96COTjMj/PuRJPSnYWRXwLI/NlH2epWWr46a
         c9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CuxZghyhVhMfnxIfYloUb+CTfop3eq4J/ICJFqbMMf8=;
        b=XcJD7J2AcwIKjxbmKe8hzXBkHUvKpDprhFerP8KNprqaiQxItaCZEsqCY2LIa9l70+
         9508miK98zItd+iOWkpeRb8yVz07Jn6A2ARpLVhD699kxK3hCU7evrT0zDGsw8aq2YJg
         K9IocRBDz8TkzSxrjT+3cPtHGpMImg+YxTxiFjAdqf0M9CzTyx3iyJF5Vj50nnmefjCF
         NwZANxzhlL3b/YRuweKWFtRiBWqzC6SisPtN1yYpMuIa1YNjiixVN1XarQV/X80j5KEJ
         0ncqPmUULSgq4r5PAvG68iXzSpWbEl/1HkZdq7Louyx0m4w/A+HymY2LPiTMV6/4Gl7X
         MloQ==
X-Gm-Message-State: AOAM531fmT1TsVebilAMJX3fytwgp+5WeXUFs6BMYQVZx3QJpVsZujNu
	RpKYyKQit19kaJLyw+/LD9o=
X-Google-Smtp-Source: ABdhPJwX1EqPGztau07ROAQJGqZUGfnzWPLY3DF8DLxiE1yiX1YTIbCFB4a1VCbv76W7od5h2VARvQ==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr8349770wmi.31.1631853167032;
        Thu, 16 Sep 2021 21:32:47 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id b188sm5289640wmd.39.2021.09.16.21.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 21:32:46 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Saravana Kannan <saravanak@google.com>
Cc: linux-sunxi@lists.linux.dev, Android Kernel Team <kernel-team@android.com>, linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: Re: Issue with fw_devlink=on on 5.14
Date: Fri, 17 Sep 2021 06:32:45 +0200
Message-ID: <1757257.sNEdEUkno9@jernej-laptop>
In-Reply-To: <CAGETcx-_sNJ1Z-8Bmqh+awi-2xnQQLjnJf+Zncj23ByDmJYDJQ@mail.gmail.com>
References: <5570111.f9yF5Hohu3@kista> <33995494.1UIDBzYVPQ@kista> <CAGETcx-_sNJ1Z-8Bmqh+awi-2xnQQLjnJf+Zncj23ByDmJYDJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

/cc Maxime

Dne petek, 17. september 2021 ob 04:55:22 CEST je Saravana Kannan napisal(a=
):
> On Wed, Sep 15, 2021 at 11:59 AM Jernej =C5=A0krabec
>=20
> <jernej.skrabec@gmail.com> wrote:
> > /cc linux-kernel@vger.kernel.org
> >=20
> > Dne sreda, 15. september 2021 ob 20:36:11 CEST je Saravana Kannan=20
napisal(a):
> > > On Wed, Sep 15, 2021 at 11:23 AM Saravana Kannan <saravanak@google.co=
m>
> >=20
> > wrote:
> > > > On Wed, Sep 15, 2021 at 11:07 AM Jernej =C5=A0krabec
> > > >=20
> > > > <jernej.skrabec@gmail.com> wrote:
> > > > > Hi Saravana!
> > > > >=20
> > > > > I noticed that in kernel 5.14, at least on Allwinner H3, deinterl=
ace
> >=20
> > driver
> >=20
> > > > > doesn't load anymore if fw_devlink is set to on. If I set it to o=
ff,
> >=20
> > driver
> >=20
> > > > > loads and works without problems. If I remove interconnects prope=
rty
> > > > > in
> >=20
> > DT
> >=20
> > > > > node and use driver hack instead, it also loads and work ok.
> > > > >=20
> > > > > For reference, I speak about this node:
> > > > > https://elixir.bootlin.com/linux/v5.14/source/arch/arm/boot/dts/s=
un8
> > > > > i-h3.dtsi#L153> >=20
> > > Oh the dts file please. Not dtsi. I need the full picture of
> > > dependencies.
> >=20
> > I just dumped DTB from the board I use for testing this:
> > http://ix.io/3yZB
>=20
> I was basically asking for this:
> arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
>=20
> > > -Saravana
> > >=20
> > > > > Do you have any clue why it doesn't work?
> > > >=20
> > > > Kinda busy today and I'll take a close look later, but if you delete
> > > > "interconnect" but it works, then it seems like you have no driver =
for
> > > > your "mbus" interconnect? Is that expected?
> >=20
> > Ah, you're completely right. There is no MBUS driver (yet), since curre=
nt
> > purpose of that node is to determine DMA memory offsets and for that you
> > don't need a driver.
>=20
> Can you explain more how you get the DMA memory offsets in the code
> from this node?

Maxime, can you help with this?

>=20
> You might be able to add status=3D"disabled" to the mbus node and this
> would go away as fw_devlink doesn't cause a consumer to wait on a
> disabled supplier. See more below -- you have a bunch of options.
>=20
> > There is already WIP driver for it, though:
> > https://github.com/crust-firmware/linux/commit/
> > db34316a0194dbf0fcb8eba677ef11085a06a340
> >=20
> > > > If you have a driver, then make it use the proper driver model (pro=
be
> > > > a platform device).
> > > >=20
> > > > If you don't have a driver for it, I'm assuming you have
> > > > CONFIG_MODULES enabled. Otherwise, fw_devlink=3Don is smart enough =
to
> > > > know not to block on devices that'll never be probed.
> >=20
> > Correct, modules are enabled.
> >=20
> > > > If you do need CONFIG_MODULES enabled, then use
> > > > deferred_probe_timeout=3Dxxx so that fw_devlink doesn't wait for mo=
re
> > > > modules to be loaded past xxx seconds.
> >=20
> > It's not what I want, but more that we broke default configuration and
> > CONFIG_MODULES=3Dy should really work.
>=20
> Well, fw_devlink=3Don can't tell if you don't have a driver or if you
> are going to load it soon (since you have CONFIG_MODULES enabled). So
> if it's a board you are actively bringing up, one of the other options
> below might be good to use.
>=20
> > Is there any other way to fix this besides
> > providing dummy MBUS driver? I doubt it would be accepted for backporti=
ng.
>=20
> You could use fw_devlink=3Dpermissive in the kernel commandline, but it
> will disable a bunch of benefits of fw_devlink=3Don (no pointless
> deferred probes, no suspend/resume ordering based on dependencies
> listed in DT, etc).

I tried this one, but for some reason network driver didn't show up and the=
re=20
was crash when doing reboot. Even if it would work, I don't consider it as=
=20
proper solution because... (see below)

>=20
> Another option would be to use deferred_probe_timeout=3D1 in the kernel
> commandline, and this will cause this to be unblocked 1 second after
> late_initcall() and you'll get the benefit of fw_devlink=3Don for all
> the devices that have a driver registered by then (and some more
> devices too -- see commit text of
> d46f3e3ed5276e756caf40f760d4902d15c12dcb).

That would probably work (can't test atm), but as I said, I want solution=20
without adding any argument. Users are not familiar with any of this. From=
=20
their perspective, it looks like as the driver (not just this one, but also=
=20
others which use interconnects) was never enabled in kernel config in first=
=20
place.

So, if "status =3D disabled" works, then great. If not, something else must=
 be=20
found.=20

Note: I won't be able to test anything until next week.

Best regards,
Jernej

>=20
> -Saravana
>=20
> > > > Also I like to look up emails on lore, so when emailing me about
> > > > fw_devlink (or any Linux stuff in general I suppose), it'd be nice =
if
> > > > you can cc LKML.
> >=20
> > Noted.
> >=20
> > Best regards,
> > Jernej
> >=20
> > > > Thanks,
> > > > Saravana




