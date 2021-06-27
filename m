Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50D970
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 23:50:33 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r8so4903187wrx.5
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 16:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YfTGPHmmfyv3gdtPGKeCi4sC+5NDF0JM92FrBC3MEOM=;
        b=kJ4QTqWkoVMrPv2/R566HWtO0lKpsEGK7pg1St+SruLLBDNDZmO8CbdrKpbkHtKNSl
         3Kc4INInETtjvQN3lln2UTyTXZDpERBk768J112ijz7vvI4rCyuTBNjwSu4x7swN/ioU
         CmTESNBLfBvkTvtjqpfMOgWXaageoRu22Bh/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YfTGPHmmfyv3gdtPGKeCi4sC+5NDF0JM92FrBC3MEOM=;
        b=pLXfJAr9Crwmcena8tcKKbG7j2ubYYE0Rny8uaXpDPyj+yb3ZWt7mk/vog34MtLfD0
         R2++joct5C2TknZsu88hhJ9lYCX6LHZYTz/eg6G75xWFtrGRWUlpv1I/j5nIqPu+114/
         svW2eUVRhmZsaHfRk7u2mcD1lKUXQzoMVAHMLNscCykEQS7NAzjTmo4gtMhfGIRxvkcA
         b8HWmDoqWCeClYNt9AKTFu58EqVA6JX3qF0Awc5v4Qz48wt+yE+SYFIwD6gYAwQJMGHC
         S1QvBALChz/49qXJHKdIzQxK60SxFr9+qFRUzDEn28PDLogNCRz0BbFSpXsG4eyJzn9J
         W2vw==
X-Gm-Message-State: AOAM531czNGPTWM5bNHlgM/7xmHFjIrWl/SqqiHShRGKZCtXRVfcsPUt
	2ojgXoRJBpQoxRyTUe7wgplSkqfktKRZhKEj4c0/Fg==
X-Google-Smtp-Source: ABdhPJzYctnHkv6qr3c71Gj/uruxeI94MLnTtuQajr8tk+Pb1UXxPzy6njnus4nZZNwYLmAwrKmnw+eppbVOtKzMbNo=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr25017175wri.66.1624837832025;
 Sun, 27 Jun 2021 16:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210619091838.646779-1-icenowy@aosc.io> <20210619091838.646779-2-icenowy@aosc.io>
 <CAPnjgZ3-iAng7Y9d+cjZY95vOeKfJStbVbQWYiUZURhptxZrmQ@mail.gmail.com>
 <b2563810990da9c9ace9cc73bf70e49c4bf6e556.camel@aosc.io> <CAPnjgZ0CnSF_sciLCgLBJTzr5nL4qg=sYFnE34-83QMj2q_Z+Q@mail.gmail.com>
 <82e6dcdbb261aad200b58dd22fb776615a3724e4.camel@aosc.io> <20210627234258.GX9516@bill-the-cat>
In-Reply-To: <20210627234258.GX9516@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 27 Jun 2021 17:50:20 -0600
Message-ID: <CAPnjgZ0is-urE775mkE2YJ3fyq_5MfMVbqmduKNq64S-eeNzoA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mkimage: add a flag to describe whether -A is specified
To: Tom Rini <trini@konsulko.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Andre Przywara <andre.przywara@arm.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Samuel Holland <samuel@sholland.org>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tom,

On Sun, 27 Jun 2021 at 17:43, Tom Rini <trini@konsulko.com> wrote:
>
> On Mon, Jun 28, 2021 at 06:17:27AM +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2021-06-27=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 13:32 -0600=EF=
=BC=8CSimon Glass=E5=86=99=E9=81=93=EF=BC=9A
> > > Hi Icenowy,
> > >
> > > On Sat, 26 Jun 2021 at 17:57, Icenowy Zheng <icenowy@aosc.io> wrote:
> > > >
> > > > =E5=9C=A8 2021-06-26=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 12:31 -060=
0=EF=BC=8CSimon Glass=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Hi Icenowy,
> > > > >
> > > > > On Sat, 19 Jun 2021 at 03:19, Icenowy Zheng <icenowy@aosc.io>
> > > > > wrote:
> > > > > >
> > > > > > The sunxi_egon type used to take no -A argument (because we
> > > > > > assume
> > > > > > sunxi
> > > > > > targets are all ARM). However, as Allwinner D1 appears as the
> > > > > > first
> > > > > > RISC-V sunxi target, we need to support -A; in addition, as
> > > > > > external
> > > > > > projects rely on U-Boot mkimage to generate sunxi eGON.BT0
> > > > > > header,
> > > > > > we
> > > > > > need to keep compatibility with command line without -A.
> > > > > >
> > > > > > As the default value of arch in mkimage is not proper
> > > > > > (IH_ARCH_PPC
> > > > > > instead of IH_ARCH_INVALID), to keep more compatibility, add an
> > > > > > Aflag
> > > > > > field to image parameters to describe whether an architecture
> > > > > > is
> > > > > > explicitly specified.
> > > > > >
> > > > > > Reviewed-by: Tom Rini <trini@konsulko.com>
> > > > > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - Added Tom Rini's Review tag.
> > > > >
> > > > > This is not actually a change so should not appear in the log.
> > > > >
> > > > > Also note 'patman status' can be used to automatically collect
> > > > > these.
> > > > >
> > > > > >
> > > > > >  tools/imagetool.h | 1 +
> > > > > >  tools/mkimage.c   | 1 +
> > > > > >  2 files changed, 2 insertions(+)
> > > > > >
> > > > > > diff --git a/tools/imagetool.h b/tools/imagetool.h
> > > > > > index e229a34ffc..5dc28312c2 100644
> > > > > > --- a/tools/imagetool.h
> > > > > > +++ b/tools/imagetool.h
> > > > > > @@ -51,6 +51,7 @@ struct image_tool_params {
> > > > > >         int pflag;
> > > > > >         int vflag;
> > > > > >         int xflag;
> > > > > > +       int Aflag;
> > > > >
> > > > > aflag
> > > >
> > > > I think a problem is that -a is a different flag than -A.
> > > >
> > > > -a is addr, -A is architecture.
> > >
> > > Yes OK, but the code style doesn't allow capital letters, as I
> > > understand it.
> > >
> > > How about addr_flag ?
> >
> > maybe we just call -a aflag, and -A arch_flag?
>
> Frankly I think Aflag is the most readable option here.  They're all
> literally ${FLAG_USE}flag variables, yes?  CamelCase isn't great, but
> there's times where the most readable thing isn't always what we use
> everywhere else.

I mean, sort of, but 'a' and 'A' are not that descriptive so you could
make the case that they should be named for the full flag
meaning/purpose.

Anyway, I see it has your review tag, so I'll leave it to you.

Regards,
Simon
