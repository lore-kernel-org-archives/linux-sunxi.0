Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5A70
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 07:43:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAFD761359
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623051797;
	bh=hTteHEOJ6fuVn0bUEkVjfhKcTXY/fr6KaN9hPRGCRE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JUCKgKzJpgawXxCeOb164gkQgVpmD+sXsXdlr6x2gJ1XJrHrbqdWG7v/gFv280sAh
	 OCyiOCnKQ+0aHS66EPuvOMEwXDMCZP/XPa/Y/6TjW5QxjESIE8MGs/2ITDbrMALi4E
	 ebbnT2G5q4sANnf8b0KsIvRHTQaRDgAMiIp0qgPpMzJZwY1fFsGavjPktU8vdw1p4U
	 PxwqSQgE7BngwdD1iGLSvQJDYGAjWw1Ih87XqHGv0xN6x5Yptf/EUkWmRPjZJpUQQZ
	 aLw0Qad0UNIiy7DEm3Zdv71oa+3maWlNy2Pyhc2sw++Mph8pTGIYimZab01xlxCvFc
	 st8Hh31wKbapw==
Received: by mail-lj1-f172.google.com with SMTP id r14so1710250ljd.10
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 00:43:16 -0700 (PDT)
X-Gm-Message-State: AOAM533TOlEuYgKVAQuSABQ0TqXh8p1X5G1q2XL7D3O8RlMzQWbVqR11
	Zd+9xJWqgVrjC3AbMas1oI5r2GPQh3VXH5Lfm7w=
X-Google-Smtp-Source: ABdhPJyKxzhukXaYzHu0eSbGrCR3t7tIBy0TIpuvAKNAzu0/rYsPgtX7UElk34zL12D4zBA67MfFr81fmeJmAptKvvA=
X-Received: by 2002:a05:651c:502:: with SMTP id o2mr13824567ljp.105.1623051795168;
 Mon, 07 Jun 2021 00:43:15 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-14-git-send-email-guoren@kernel.org> <20210607071916.kwdbtafbqp3icgia@gilmour>
In-Reply-To: <20210607071916.kwdbtafbqp3icgia@gilmour>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 15:43:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT=aLNpwuQmOPw=L8eoezwX8DmGOunmPx0H_WzbaOpO+g@mail.gmail.com>
Message-ID: <CAJF2gTT=aLNpwuQmOPw=L8eoezwX8DmGOunmPx0H_WzbaOpO+g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/11] riscv: soc: Add Allwinner SoC kconfig option
To: Maxime Ripard <maxime@cerno.tech>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, Drew Fustini <drew@beagleboard.org>, 
	liush@allwinnertech.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
	wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Sun, Jun 06, 2021 at 09:04:08AM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add Allwinner kconfig option which selects SoC specific and common
> > drivers that is required for this SoC.
> >
> > Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
> > interconnect issues for dma synchronization, so we set the default
> > value when SOC_SUNXI selected.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Co-Developed-by: Liu Shaohua <liush@allwinnertech.com>
> > Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Drew Fustini <drew@beagleboard.org>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Wei Fu <wefu@redhat.com>
> > Cc: Wei Wu <lazyparser@gmail.com>
> > ---
> >  arch/riscv/Kconfig.socs      | 12 ++++++++++++
> >  arch/riscv/configs/defconfig |  1 +
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index ed96376..055fb3e 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -69,4 +69,16 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >
> >  endif
> >
> > +config SOC_SUNXI
> > +     bool "Allwinner SoCs"
> > +     depends on MMU
> > +     select DWMAC_GENERIC
> > +     select SERIAL_8250
> > +     select SERIAL_8250_CONSOLE
> > +     select SERIAL_8250_DW
> > +     select SIFIVE_PLIC
> > +     select STMMAC_ETH
> > +     help
> > +       This enables support for Allwinner SoC platforms like the D1.
> > +
>
> We probably don't want to select DWMAC, STMMAC_ETH and the 8250 options,
> looks good otherwise.
>
> Maxime
Remove DWMAC, STMMAC_ETH is okay.

But I think we still need:
select SERIAL_8250_DW if SERIAL_8250
-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
