Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E3D71
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Apr 2021 09:43:44 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id c22so5516837edn.7
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Apr 2021 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AtbxnIvNnZf+vfl+wzA63QYVdo2NIS5mDE8BWD88Lbs=;
        b=MPOxwg0FBZDyQv75MxT4QFLkBD1HmAMH4CCHByX5kQ/gnjXD7K9k3NVgnKg8MJYj9X
         f8AZpbV5zHnR1rp4bfYFI8ccQ5boR6k4WZJgavY/C62ePLBTB6iWe9KPjbNgTpcuqgnp
         AWcND9C83GrdPKEDamvf9UcLR/ZeL1Sh1Kl1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AtbxnIvNnZf+vfl+wzA63QYVdo2NIS5mDE8BWD88Lbs=;
        b=KakK78ldTi2U/vbhkLIZ09Mida5Mh+SX5wNinqWTqviMGukU97FmMscqpkFs/jRDfM
         bUwluxJUK0ERkAN5VcDTgcF+VMDMxRDerQ0ZlsRNzkmgfU9jUagn6+BTOJExEGfnmRlm
         gTxwBzMRKtZkmaGzbhwdbiE0vGMMR7NakOfbtF6N1Jy+RQQmSkOCgEH3HNWBiEoQWyME
         DXTjBA9/aHVPOo/XHh0mf2/XpqG2NyBd7cJs0IJ8wX8z2kapnhfEmEUJ6BegdbYP8s5A
         lAqlIa2Qjf2EJseTiDKf3YfxPx1QucyaEv81bi51KszqWGUp3B8o3rkCF9mU9GeJWd43
         ryuA==
X-Gm-Message-State: AOAM532Dl8B+pLRJXiJZmR0JiRy5JTyteYs/splgKd45bfHN7Ih9hgcO
	MDNcw1ztDaA9pwxdsryYQtngHu/gx1UIad5T/zz9VQ==
X-Google-Smtp-Source: ABdhPJzVDq09VAne3WBRuF2IDvSsJs+DtH+8lxq+me2nVMCrYQ4lm4BTmzcOhS+RC+AuvaavtdIzqVluoavxt8nCSZk=
X-Received: by 2002:a05:6402:3079:: with SMTP id bs25mr3208587edb.369.1619516623358;
 Tue, 27 Apr 2021 02:43:43 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210427000323.18285-1-andre.przywara@arm.com>
 <fece3df8-b2d5-ab42-13b6-94d4f04bfc4a@denx.de> <20210427091032.045d079d@slackpad.fritz.box>
In-Reply-To: <20210427091032.045d079d@slackpad.fritz.box>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 27 Apr 2021 15:13:31 +0530
Message-ID: <CAMty3ZB0twvNAu40D-2Sn5Z_6WYYNBB8c=t-kmHfV-djM=WcKw@mail.gmail.com>
Subject: Re: [PATCH] usb: musb-new: Extend Allwinner quirk to newer SoCs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@siol.net>, 
	Samuel Holland <samuel@sholland.org>, U-Boot-Denx <u-boot@lists.denx.de>, 
	linux-sunxi <linux-sunxi@googlegroups.com>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 1:41 PM Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Tue, 27 Apr 2021 02:37:20 +0200
> Marek Vasut <marex@denx.de> wrote:
>
> Hi,
>
> > On 4/27/21 2:03 AM, Andre Przywara wrote:
> > > As the comment in musb_regs.h describes, Allwinner saves the
> > > MUSB_CONFIGDATA register, which always return 0 on those SoCs.
> > >
> > > This is also true for the H6 and H616, so extend the quirk to those
> > > controllers as well.
> > >
> > > This fixes USB peripheral mode on H6 and H616 boards.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >   drivers/usb/musb-new/musb_regs.h | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/musb-new/musb_regs.h b/drivers/usb/musb-new/musb_regs.h
> > > index c4d7203b851..bee1b715a95 100644
> > > --- a/drivers/usb/musb-new/musb_regs.h
> > > +++ b/drivers/usb/musb-new/musb_regs.h
> > > @@ -432,7 +432,8 @@ static inline u8 musb_read_ulpi_buscontrol(void __iomem *mbase)
> > >   static inline u8 musb_read_configdata(void __iomem *mbase)
> > >   {
> > >   #if defined CONFIG_MACH_SUN8I_A33 || defined CONFIG_MACH_SUN8I_A83T || \
> > > -           defined CONFIG_MACH_SUNXI_H3_H5 || defined CONFIG_MACH_SUN50I
> > > +   defined CONFIG_MACH_SUNXI_H3_H5 || defined CONFIG_MACH_SUN50I || \
> > > +   defined CONFIG_SUN50I_GEN_H6
> >
> > Isn't there some better solution then ever-growing list of macros to
> > check, like e.g. a single CONFIG_MACH_SUNXI ?
>
> I was wondering the same, but I think this does not apply to the older
> SoCs (we use ARCH_SUNXI in the two functions above and below, so I
> guess the differentiation here is deliberate). I will test this later.
>
> So we could probably use the quirk also for the older, working(?) SoCs,
> but I am not sure we should do that. CONFIG_SUN50I_GEN_H6 is already a
> symbol covering multiple SoCs, so ideally we won't need to add many
> more.
> I can have a look if we have other checks like that in the code, then
> maybe define a collective symbol for newer SoCs?

The better approach is to support config_read via musb_platform_ops.
If so, we can identify the offsets to endpoint registers using SoC
musb reg space and return the relevant 16-bit config value.

Jagan.
