Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8F168
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 19:33:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id u11so17951189wrw.11
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 12:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mX3S92F/FdyA8Sjgj9o7aI10NG+Os0l/j74Ga94CPu4=;
        b=cLW/oMR3xzi+JLJDsSZLs6fhlGgWekW2N6U/aNEWcdwMF91wznKzauJsmeIWecu4co
         xrReXmg4raGAPeupKfPfIiNtceBfw2LfRGeYPB2jjvB2Gnx34KPD7C2e/l1g6I19OrC4
         bGPEwYGUmTQQR5n7Im8S1Lqsctd6cCJ4F4w7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mX3S92F/FdyA8Sjgj9o7aI10NG+Os0l/j74Ga94CPu4=;
        b=KSMeK3ubwm7qqAYpcw31XSdPCVGUwD6pvb99iyvq1+PvHjlUDKwvhvr5zGYQYDDjvM
         v58HHjFU8x3YAmwykrEbayUrceE/MZr7RLG3zpluzivaq4ZZr+EVs+Nd+EeEdxnN3HAY
         GBllXtJr3hy2wWR0jIc8RJLQPL1z/+wKPBgl3RoOOIx3rixle2p9jBI5YsV8yjP6ALQC
         nofP0GxmZDFu9L/hABTF6F74HYBxThK5kC+BBQpL9U3d1PvprdKp8eQ+xpRl7UycgW6V
         EKppiIFo6B2KzflzQUUZ+yGwWZzjHRMtWT243Ozyi2utNTFM2JTssKQbxHbBlyRiyAxS
         pWpg==
X-Gm-Message-State: AOAM533fBYgwp1yI9sPpIvtZxmwWsl0fNZfuSopKfH4YjxTBhd+QUqJ3
	acEGJHLkdOyN3WGuzK64zxlfILr0ZQ6Q8vehmOHBUA==
X-Google-Smtp-Source: ABdhPJwf0veKi11GeDWSBj08h8YfU9v19dXtDVTPgufOVG2CRRXbZ2BJWdVNCQdRhNPfGHGeW4pR0wclekYIgcFzWhE=
X-Received: by 2002:a5d:4f0b:: with SMTP id c11mr23410809wru.56.1624822382939;
 Sun, 27 Jun 2021 12:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210619091838.646779-1-icenowy@aosc.io> <20210619091838.646779-2-icenowy@aosc.io>
 <CAPnjgZ3-iAng7Y9d+cjZY95vOeKfJStbVbQWYiUZURhptxZrmQ@mail.gmail.com> <b2563810990da9c9ace9cc73bf70e49c4bf6e556.camel@aosc.io>
In-Reply-To: <b2563810990da9c9ace9cc73bf70e49c4bf6e556.camel@aosc.io>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 27 Jun 2021 13:32:51 -0600
Message-ID: <CAPnjgZ0CnSF_sciLCgLBJTzr5nL4qg=sYFnE34-83QMj2q_Z+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mkimage: add a flag to describe whether -A is specified
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Andre Przywara <andre.przywara@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Icenowy,

On Sat, 26 Jun 2021 at 17:57, Icenowy Zheng <icenowy@aosc.io> wrote:
>
> =E5=9C=A8 2021-06-26=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 12:31 -0600=EF=
=BC=8CSimon Glass=E5=86=99=E9=81=93=EF=BC=9A
> > Hi Icenowy,
> >
> > On Sat, 19 Jun 2021 at 03:19, Icenowy Zheng <icenowy@aosc.io> wrote:
> > >
> > > The sunxi_egon type used to take no -A argument (because we assume
> > > sunxi
> > > targets are all ARM). However, as Allwinner D1 appears as the first
> > > RISC-V sunxi target, we need to support -A; in addition, as
> > > external
> > > projects rely on U-Boot mkimage to generate sunxi eGON.BT0 header,
> > > we
> > > need to keep compatibility with command line without -A.
> > >
> > > As the default value of arch in mkimage is not proper (IH_ARCH_PPC
> > > instead of IH_ARCH_INVALID), to keep more compatibility, add an
> > > Aflag
> > > field to image parameters to describe whether an architecture is
> > > explicitly specified.
> > >
> > > Reviewed-by: Tom Rini <trini@konsulko.com>
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > ---
> > > Changes in v2:
> > > - Added Tom Rini's Review tag.
> >
> > This is not actually a change so should not appear in the log.
> >
> > Also note 'patman status' can be used to automatically collect these.
> >
> > >
> > >  tools/imagetool.h | 1 +
> > >  tools/mkimage.c   | 1 +
> > >  2 files changed, 2 insertions(+)
> > >
> > > diff --git a/tools/imagetool.h b/tools/imagetool.h
> > > index e229a34ffc..5dc28312c2 100644
> > > --- a/tools/imagetool.h
> > > +++ b/tools/imagetool.h
> > > @@ -51,6 +51,7 @@ struct image_tool_params {
> > >         int pflag;
> > >         int vflag;
> > >         int xflag;
> > > +       int Aflag;
> >
> > aflag
>
> I think a problem is that -a is a different flag than -A.
>
> -a is addr, -A is architecture.

Yes OK, but the code style doesn't allow capital letters, as I understand i=
t.

How about addr_flag ?


>
> >
> > >         int skipcpy;
> > >         int os;
> > >         int arch;
> > > diff --git a/tools/mkimage.c b/tools/mkimage.c
> > > index cc7b242faf..54d8e3835a 100644
> > > --- a/tools/mkimage.c
> > > +++ b/tools/mkimage.c
> > > @@ -168,6 +168,7 @@ static void process_args(int argc, char **argv)
> > >                                 show_valid_options(IH_ARCH);
> > >                                 usage("Invalid architecture");
> > >                         }
> > > +                       params.Aflag =3D 1;
> > >                         break;
> > >                 case 'b':
> > >                         if (add_content(IH_TYPE_FLATDT, optarg)) {
> > > --
> > > 2.30.2

Regards,
Simon
