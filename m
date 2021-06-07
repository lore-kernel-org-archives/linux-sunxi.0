Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E2670
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 07:46:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DB876124B
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623051972;
	bh=aKh9TrwohntWukPeb8eXG9QkpL0E7zlN5CxzbKaesVk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AQqPz/xdXabEyCypW5iV8x+ZQjmQJ3JYdPZ1/ERiY4MRQVB7z0XY3bt0kmrqADDl7
	 QAQ52nTSWW5U3gyaQ2uHlr+z9Juebvnrs745xGIe17jY9R7k+rdqUOmXJiqoaUhuHa
	 DNhdfXkJI9UNPbU0+TF0XgOdFM+Bwy5v8s+BZ5P1LFWTE+BSv7CJjQ9uXtjeCSdXXF
	 S/+PRqSjoiu6Ylb3/u6FocwnENvXx8NZKzReJxdbYOe2u14HF8L88s1YuT5u80LDqv
	 KOIFDgs8NBMk7oeJlac/AvSYxR6yG/C2FnCPCAxbYQo+RUWClFlHLNewbSRcX4o/U1
	 5E5GijghcFuxw==
Received: by mail-lj1-f177.google.com with SMTP id x14so6536741ljp.7
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 00:46:12 -0700 (PDT)
X-Gm-Message-State: AOAM531g0vzym+LyiPko3AAhQnGjxG0dTkNQ0iDKk0jWGF+K/pjxM8wu
	Ap5hx+vNycVPsm80zeNP8TLO+5DGZtIowFsJPM8=
X-Google-Smtp-Source: ABdhPJzxueGqIP4yyWtEMyoXRqvhk8OiKmBujjKQ9JamOA13E8TTZrWry7LLQ9qEzkhD8kBUPmRAPlNuYHUWxcCixZU=
X-Received: by 2002:a05:651c:502:: with SMTP id o2mr13832361ljp.105.1623051970623;
 Mon, 07 Jun 2021 00:46:10 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-14-git-send-email-guoren@kernel.org> <20210607071916.kwdbtafbqp3icgia@gilmour>
 <CAK8P3a0YVh5T8MmUcAAjhxGBhNm_OeZq9S=rwAsZVMJNAttyOw@mail.gmail.com>
In-Reply-To: <CAK8P3a0YVh5T8MmUcAAjhxGBhNm_OeZq9S=rwAsZVMJNAttyOw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 15:45:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQxVHYS8m4pWekttRCSbE8O6g7ySDs5YJ=-BtqXZwvYBQ@mail.gmail.com>
Message-ID: <CAJF2gTQxVHYS8m4pWekttRCSbE8O6g7ySDs5YJ=-BtqXZwvYBQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/11] riscv: soc: Add Allwinner SoC kconfig option
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maxime Ripard <maxime@cerno.tech>, Anup Patel <anup.patel@wdc.com>, 
	Palmer Dabbelt <palmerdabbelt@google.com>, Chen-Yu Tsai <wens@csie.org>, 
	Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com, 
	=?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, wefu@redhat.com, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 3:29 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jun 7, 2021 at 9:20 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Sun, Jun 06, 2021 at 09:04:08AM +0000, guoren@kernel.org wrote:
>
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index ed96376..055fb3e 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -69,4 +69,16 @@ config SOC_CANAAN_K210_DTB_SOURCE
> > >
> > >  endif
> > >
> > > +config SOC_SUNXI
> > > +     bool "Allwinner SoCs"
> > > +     depends on MMU
> > > +     select DWMAC_GENERIC
> > > +     select SERIAL_8250
> > > +     select SERIAL_8250_CONSOLE
> > > +     select SERIAL_8250_DW
> > > +     select SIFIVE_PLIC
> > > +     select STMMAC_ETH
> > > +     help
> > > +       This enables support for Allwinner SoC platforms like the D1.
> > > +
> >
> > We probably don't want to select DWMAC, STMMAC_ETH and the 8250 options,
> > looks good otherwise.
>
> Correct: those subsystems may be completely disabled, which would lead to a
> build failure, and a platform should not force-enable drivers or
> subsystems unless
> those are build time dependencies.
>
>        Arnd

I see, thx. how about just leave. I think the user would make mistakes
and waste time here.
select SERIAL_8250_DW if SERIAL_8250

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
