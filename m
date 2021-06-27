Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56B270
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 22:18:02 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id E765A20338
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 22:18:01 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id C2118200FD
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Jun 2021 22:17:52 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 7D5653F1C5;
	Sun, 27 Jun 2021 22:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id 606242A3EB;
	Sun, 27 Jun 2021 18:17:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1624832265;
	bh=g5PP4IH71R+ZxD8h1sojdddHXWv+GkXhFSjsGEAjAtI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MoASYECD9c/YnJGpn98u6vwJ4qeH+bMpURd2339Awe4/TU7Gfadc3my0RpexYbcCX
	 nNOmMKNbvQcsfuX2qFUmvUDKJdCSPJIJgl39bJOUi4JVFkLWuFp4WB+uYbbBVk74de
	 flxIBD8aOIEzwXCNBsb8QGrHZW8gtihactTUHi6Q=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCfhBqYBzB1M; Sun, 27 Jun 2021 18:17:43 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Sun, 27 Jun 2021 18:17:43 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
	by mail20.mymailcheap.com (Postfix) with ESMTP id 42C1740C50;
	Sun, 27 Jun 2021 22:17:42 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="Eo8FnETP";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [192.168.1.216] (unknown [59.41.162.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id D064840C50;
	Sun, 27 Jun 2021 22:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1624832254; bh=g5PP4IH71R+ZxD8h1sojdddHXWv+GkXhFSjsGEAjAtI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Eo8FnETPNc9ww4WMi611B+40lnZDE4Wa8g7EYe8nbhxXPKmv9wJplLd5cfFfbAs/W
	 6DohFpNjnIuC8Y8m32QI5RHEEg51H4lh9/58imdyvaYfy2UXy+OITMgGvMmB5OAfsS
	 5JxbLpdylzy8lLsYMF2eD7YLimQuqA3PePGGG5V4=
Message-ID: <82e6dcdbb261aad200b58dd22fb776615a3724e4.camel@aosc.io>
Subject: Re: [PATCH v2 1/4] mkimage: add a flag to describe whether -A is
 specified
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Samuel Holland <samuel@sholland.org>, Tom
 Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, 
 linux-sunxi@lists.linux.dev
Date: Mon, 28 Jun 2021 06:17:27 +0800
In-Reply-To: <CAPnjgZ0CnSF_sciLCgLBJTzr5nL4qg=sYFnE34-83QMj2q_Z+Q@mail.gmail.com>
References: <20210619091838.646779-1-icenowy@aosc.io>
	 <20210619091838.646779-2-icenowy@aosc.io>
	 <CAPnjgZ3-iAng7Y9d+cjZY95vOeKfJStbVbQWYiUZURhptxZrmQ@mail.gmail.com>
	 <b2563810990da9c9ace9cc73bf70e49c4bf6e556.camel@aosc.io>
	 <CAPnjgZ0CnSF_sciLCgLBJTzr5nL4qg=sYFnE34-83QMj2q_Z+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(0.00)[aosc.io:s=default];
	 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.162.118:received];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(0.00)[aosc.io];
	 R_SPF_SOFTFAIL(0.00)[~all];
	 ML_SERVERS(-3.10)[213.133.102.83];
	 DKIM_TRACE(0.00)[aosc.io:+];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[];
	 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 42C1740C50

在 2021-06-27星期日的 13:32 -0600，Simon Glass写道：
> Hi Icenowy,
> 
> On Sat, 26 Jun 2021 at 17:57, Icenowy Zheng <icenowy@aosc.io> wrote:
> > 
> > 在 2021-06-26星期六的 12:31 -0600，Simon Glass写道：
> > > Hi Icenowy,
> > > 
> > > On Sat, 19 Jun 2021 at 03:19, Icenowy Zheng <icenowy@aosc.io>
> > > wrote:
> > > > 
> > > > The sunxi_egon type used to take no -A argument (because we
> > > > assume
> > > > sunxi
> > > > targets are all ARM). However, as Allwinner D1 appears as the
> > > > first
> > > > RISC-V sunxi target, we need to support -A; in addition, as
> > > > external
> > > > projects rely on U-Boot mkimage to generate sunxi eGON.BT0
> > > > header,
> > > > we
> > > > need to keep compatibility with command line without -A.
> > > > 
> > > > As the default value of arch in mkimage is not proper
> > > > (IH_ARCH_PPC
> > > > instead of IH_ARCH_INVALID), to keep more compatibility, add an
> > > > Aflag
> > > > field to image parameters to describe whether an architecture
> > > > is
> > > > explicitly specified.
> > > > 
> > > > Reviewed-by: Tom Rini <trini@konsulko.com>
> > > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > > ---
> > > > Changes in v2:
> > > > - Added Tom Rini's Review tag.
> > > 
> > > This is not actually a change so should not appear in the log.
> > > 
> > > Also note 'patman status' can be used to automatically collect
> > > these.
> > > 
> > > > 
> > > >  tools/imagetool.h | 1 +
> > > >  tools/mkimage.c   | 1 +
> > > >  2 files changed, 2 insertions(+)
> > > > 
> > > > diff --git a/tools/imagetool.h b/tools/imagetool.h
> > > > index e229a34ffc..5dc28312c2 100644
> > > > --- a/tools/imagetool.h
> > > > +++ b/tools/imagetool.h
> > > > @@ -51,6 +51,7 @@ struct image_tool_params {
> > > >         int pflag;
> > > >         int vflag;
> > > >         int xflag;
> > > > +       int Aflag;
> > > 
> > > aflag
> > 
> > I think a problem is that -a is a different flag than -A.
> > 
> > -a is addr, -A is architecture.
> 
> Yes OK, but the code style doesn't allow capital letters, as I
> understand it.
> 
> How about addr_flag ?

maybe we just call -a aflag, and -A arch_flag?

> 
> 
> > 
> > > 
> > > >         int skipcpy;
> > > >         int os;
> > > >         int arch;
> > > > diff --git a/tools/mkimage.c b/tools/mkimage.c
> > > > index cc7b242faf..54d8e3835a 100644
> > > > --- a/tools/mkimage.c
> > > > +++ b/tools/mkimage.c
> > > > @@ -168,6 +168,7 @@ static void process_args(int argc, char
> > > > **argv)
> > > >                                 show_valid_options(IH_ARCH);
> > > >                                 usage("Invalid architecture");
> > > >                         }
> > > > +                       params.Aflag = 1;
> > > >                         break;
> > > >                 case 'b':
> > > >                         if (add_content(IH_TYPE_FLATDT,
> > > > optarg)) {
> > > > --
> > > > 2.30.2
> 
> Regards,
> Simon

