Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1602370
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 23:49:10 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id p8so2549755wrr.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 16:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZJmlr0V4txhb9je+Z9qV7yQb2MEcHJd9EQcKfI333f0=;
        b=YdkdBIEK4ySxaqb3dJbr05UCIKhZ5kt84AWoJohW130a16PW82+/MmgMdjO+k8v0aU
         HqS0CteIsTyvS4p9f5xAjbe5f6ihh4JAu8ZXwAf8zZrzPfcZXrUJemy/RKeKv+iBwiIj
         rzvfSegOLwgQ88S73lGZ7oGdczgsg233iYkL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZJmlr0V4txhb9je+Z9qV7yQb2MEcHJd9EQcKfI333f0=;
        b=eVVc2ijc0V8YwgVUidjIPMnFWSDRkqQC7P02KJZaLQTXHPNO0C9HdDcPJEM92y9+k3
         PEZyz7ds0X2OdEcKxBpURAWtNNnFqOj4fkVNKTP93L6sUhViUTa7pgH7h6wE29MkWDJw
         cFDas2ZeckPqwhBsWKnszXMxmwzUg32qJVSXbN+w6pGVgw+b2Byjn4hIcD0uu/fnxtKz
         lQxCCyk3zFoDAB/R28/wvdgL7mV5HQkCDMPlasdMFLYOcNwDPmRdV4k6IwvhyUJh6IyU
         tDmhGgmXStbyHf/dbnBh4Obi0u3mjkMQaJ3evuuEIgxXJ27Vw+g/csnVbt4XrJ3kDwQQ
         E7RQ==
X-Gm-Message-State: AOAM531nK0gTKXtcCCCPo0T/UDoiA9wvu185/wYUr9lVih2tuMNWyIvT
	WHUAEx0mWJgvsgYYga5HH5GtBkxDfYlWCcMeBcLtrA==
X-Google-Smtp-Source: ABdhPJygUgjNczG9lAH5+Axckw9N/G5SEtMCbriJ1MIYZnY3dPdnRGacUbv8U81nDaUp93CROQHtih+CHvnrYOGcfEQ=
X-Received: by 2002:a5d:45cc:: with SMTP id b12mr23191780wrs.43.1624837749376;
 Sun, 27 Jun 2021 16:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210619091838.646779-1-icenowy@aosc.io> <20210619091838.646779-2-icenowy@aosc.io>
 <CAPnjgZ3-iAng7Y9d+cjZY95vOeKfJStbVbQWYiUZURhptxZrmQ@mail.gmail.com>
 <b2563810990da9c9ace9cc73bf70e49c4bf6e556.camel@aosc.io> <CAPnjgZ0CnSF_sciLCgLBJTzr5nL4qg=sYFnE34-83QMj2q_Z+Q@mail.gmail.com>
 <82e6dcdbb261aad200b58dd22fb776615a3724e4.camel@aosc.io>
In-Reply-To: <82e6dcdbb261aad200b58dd22fb776615a3724e4.camel@aosc.io>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 27 Jun 2021 17:48:57 -0600
Message-ID: <CAPnjgZ1BkiWbpe=mS2babb9BKhJzCiOB4UyAxGAeOP=Td5=xug@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mkimage: add a flag to describe whether -A is specified
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Andre Przywara <andre.przywara@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Icenowy,

On Sun, 27 Jun 2021 at 16:17, Icenowy Zheng <icenowy@aosc.io> wrote:
>
> =E5=9C=A8 2021-06-27=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 13:32 -0600=EF=
=BC=8CSimon Glass=E5=86=99=E9=81=93=EF=BC=9A
> > Hi Icenowy,
> >
> > On Sat, 26 Jun 2021 at 17:57, Icenowy Zheng <icenowy@aosc.io> wrote:
> > >
> > > =E5=9C=A8 2021-06-26=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 12:31 -0600=
=EF=BC=8CSimon Glass=E5=86=99=E9=81=93=EF=BC=9A
> > > > Hi Icenowy,
> > > >
> > > > On Sat, 19 Jun 2021 at 03:19, Icenowy Zheng <icenowy@aosc.io>
> > > > wrote:
> > > > >
> > > > > The sunxi_egon type used to take no -A argument (because we
> > > > > assume
> > > > > sunxi
> > > > > targets are all ARM). However, as Allwinner D1 appears as the
> > > > > first
> > > > > RISC-V sunxi target, we need to support -A; in addition, as
> > > > > external
> > > > > projects rely on U-Boot mkimage to generate sunxi eGON.BT0
> > > > > header,
> > > > > we
> > > > > need to keep compatibility with command line without -A.
> > > > >
> > > > > As the default value of arch in mkimage is not proper
> > > > > (IH_ARCH_PPC
> > > > > instead of IH_ARCH_INVALID), to keep more compatibility, add an
> > > > > Aflag
> > > > > field to image parameters to describe whether an architecture
> > > > > is
> > > > > explicitly specified.
> > > > >
> > > > > Reviewed-by: Tom Rini <trini@konsulko.com>
> > > > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Added Tom Rini's Review tag.
> > > >
> > > > This is not actually a change so should not appear in the log.
> > > >
> > > > Also note 'patman status' can be used to automatically collect
> > > > these.
> > > >
> > > > >
> > > > >  tools/imagetool.h | 1 +
> > > > >  tools/mkimage.c   | 1 +
> > > > >  2 files changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/tools/imagetool.h b/tools/imagetool.h
> > > > > index e229a34ffc..5dc28312c2 100644
> > > > > --- a/tools/imagetool.h
> > > > > +++ b/tools/imagetool.h
> > > > > @@ -51,6 +51,7 @@ struct image_tool_params {
> > > > >         int pflag;
> > > > >         int vflag;
> > > > >         int xflag;
> > > > > +       int Aflag;
> > > >
> > > > aflag
> > >
> > > I think a problem is that -a is a different flag than -A.
> > >
> > > -a is addr, -A is architecture.
> >
> > Yes OK, but the code style doesn't allow capital letters, as I
> > understand it.
> >
> > How about addr_flag ?
>
> maybe we just call -a aflag, and -A arch_flag?

Sure if you prefer.

Regards,
Simon
