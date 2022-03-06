Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AEB10E1
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Mar 2022 14:30:21 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id ED59C206D3
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Mar 2022 14:30:12 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 4E88F3F1C5;
	Sun,  6 Mar 2022 14:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by filter2.mymailcheap.com (Postfix) with ESMTP id A6D852A7E4;
	Sun,  6 Mar 2022 14:30:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
	by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tntXedwPyQn; Sun,  6 Mar 2022 14:30:02 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter2.mymailcheap.com (Postfix) with ESMTPS;
	Sun,  6 Mar 2022 14:30:02 +0000 (UTC)
Received: from edelgard.icenowy.info (unknown [59.41.161.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id BA57D4062C;
	Sun,  6 Mar 2022 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1646577002; bh=gAFyPFBfd1joA5748Ofvm4gLi2Xg5UkwvU08kggGu8o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AjGE57vVBdoyrkcFWIt7H56XrdGZbDbV/jYkPFMN9X1hGknUzQeZeHB6Cuo8LT1fO
	 saRrWXz6ZkVTQI7enZD1D0uCGAVRbW6CZSqm15vXg1LOEU2KeMMdgfTcT0R1gD0NIV
	 8L8GFJ1/n6SYPaoA1SzxClL67aCX4MG0iEwqR1/Q=
Message-ID: <7f1b8b678e6b7788dc3ccc44a2b89f8c629093ca.camel@aosc.io>
Subject: Re: [PATCH] sunxi: fix build when CONFIG_UART0_PORT_F is selected
From: Icenowy Zheng <icenowy@aosc.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Hans de Goede
 <hdegoede@redhat.com>,  u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Samuel Holland <samuel@sholland.org>, Jernej =?gb2312?Q?=810=947krabec?=
 <jernej.skrabec@gmail.com>
Date: Sun, 06 Mar 2022 22:29:50 +0800
In-Reply-To: <20220305193651.432e21d8@slackpad.lan>
References: <20220304160601.181155-1-icenowy@aosc.io>
	 <20220305193651.432e21d8@slackpad.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

在 2022-03-05星期六的 21:33 +0000，Andre Przywara写道：
> On Sat,  5 Mar 2022 00:06:01 +0800
> Icenowy Zheng <icenowy@aosc.io> wrote:
> 
> Hi Icenowy,
> 
> > Currently CONFIG_UART0_PORT_F will forbid the build of sunxi-mmc
> > driver,
> > which leads calls to it in board/sunxi/board.c a undefined
> > reference.
> > 
> > Guard that code in #ifndef to fix build.
> 
> That's indeed a problem.
> 
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > ---
> >  board/sunxi/board.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> > index 82c52b28f8..8a003d8559 100644
> > --- a/board/sunxi/board.c
> > +++ b/board/sunxi/board.c
> > @@ -539,6 +539,7 @@ int board_mmc_init(struct bd_info *bis)
> >  {
> >         __maybe_unused struct mmc *mmc0, *mmc1;
> >  
> > +#ifndef CONFIG_UART0_PORT_F
> 
> Shouldn't it be "#ifdef CONFIG_MMC_SUNXI" instead, which is the
> actual
> reason for the build fail?
> And furthermore, this is just a link failure, and I think we rely on
> toolchain garbage collection anyway, so I managed with:

Well I think we finally shouldn't let CONFIG_UART0_PORT_F conflicts
with CONFIG_MMC_SUNXI, because we should be able to at least use
CONFIG_MMC_SUNXI_SLOT_EXTRA when CONFIG_UART0_PORT_F.

In addition, I don't think toolchain GC is smart enough to remove a
reference.

> 
>         if (!CONFIG_IS_ENABLED(MMC_SUNXI))
>                 return 0;
> 
> which avoids the nested #ifdef.
> Shall we go with this instead?
> 
> >         mmc_pinmux_setup(CONFIG_MMC_SUNXI_SLOT);
> >         mmc0 = sunxi_mmc_init(CONFIG_MMC_SUNXI_SLOT);
> >         if (!mmc0)
> > @@ -549,6 +550,7 @@ int board_mmc_init(struct bd_info *bis)
> >         mmc1 = sunxi_mmc_init(CONFIG_MMC_SUNXI_SLOT_EXTRA);
> >         if (!mmc1)
> >                 return -1;
> > +#endif
> >  #endif
> >  
> >         return 0;
> 


