Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572D871
	for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 00:26:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD46F61104
	for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 00:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622334392;
	bh=WO4AvDQOErMivEJBVOiXhGXr5BkKrXIWDEGphngSgbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i/Pw+IYthyq+6HSTuiPvfqKj0VEF9TAJjD4ATVR0yZ0TtflaZ0n3IGq9ltH2zOTBF
	 tajB4cUozkLkH3ZItczvs7cviBB4p+aT1GppQl25j1xVZc+HvUFR4A3qVgfxKT2nvu
	 +BVQm0brOFXf92ZIS0o3wPp4W3+VLUX2MxnBDXWHKxqKyplUHGDp4wR3jqbfyjv+Kx
	 HUo66HaMomE6mknJEBM9U0RC8Lk7RiK19GIIbJAh/DIvOIHkAmxQyW0U6NAc/Ue1XS
	 y87nW3YwYHqm4hZLwwWOwcgwe9rbvvBXM7UU4TTU6xGdpx6JsWFm/ur1nfzK4cZrUc
	 fJqJmuFxUv3NQ==
Received: by mail-lj1-f176.google.com with SMTP id w15so10048509ljo.10
        for <linux-sunxi@lists.linux.dev>; Sat, 29 May 2021 17:26:32 -0700 (PDT)
X-Gm-Message-State: AOAM532baN/nQR5fXUrU6900AoezapCFbuCzP6/Rbz75hRv/UWtJL04P
	A+2WbIsQonYeRv50p98oQXoolgXi6dYUXI4pMbo=
X-Google-Smtp-Source: ABdhPJzAv7KxOF4cW+l6E6gE3uAhvDSqrsRPGJzs6vvDaU7PttVLgVopNfDeoPAKiteBVSoM5AoDZDhtiWO9RVnzXQk=
X-Received: by 2002:a05:651c:2d0:: with SMTP id f16mr3853539ljo.18.1622334391183;
 Sat, 29 May 2021 17:26:31 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1621945234-37878-1-git-send-email-guoren@kernel.org> <mhng-93a12abf-0283-4ec3-a521-89b8d882654f@palmerdabbelt-glaptop>
In-Reply-To: <mhng-93a12abf-0283-4ec3-a521-89b8d882654f@palmerdabbelt-glaptop>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 May 2021 08:26:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTMYi-fr2kz5PHBtZ17iJdq0gN5UWT+eRV7ODwNfUcqrw@mail.gmail.com>
Message-ID: <CAJF2gTTMYi-fr2kz5PHBtZ17iJdq0gN5UWT+eRV7ODwNfUcqrw@mail.gmail.com>
Subject: Re: [PATCH] arch: Cleanup unused functions
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Michal Simek <monstr@monstr.eu>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 30, 2021 at 7:08 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Tue, 25 May 2021 05:20:34 PDT (-0700), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > These functions haven't been used, so just remove them. The patch
> > has been tested with riscv, but I only use grep to check the
> > microblaze's.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Michal Simek <monstr@monstr.eu>
> > Cc: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/microblaze/include/asm/page.h |  3 ---
> >  arch/riscv/include/asm/page.h      | 10 ----------
> >  2 files changed, 13 deletions(-)
> >
> > diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> > index bf681f2..ce55097 100644
> > --- a/arch/microblaze/include/asm/page.h
> > +++ b/arch/microblaze/include/asm/page.h
> > @@ -35,9 +35,6 @@
> >
> >  #define ARCH_SLAB_MINALIGN   L1_CACHE_BYTES
> >
> > -#define PAGE_UP(addr)        (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> > -#define PAGE_DOWN(addr)      ((addr)&(~((PAGE_SIZE)-1)))
> > -
> >  /*
> >   * PAGE_OFFSET -- the first address of the first page of memory. With MMU
> >   * it is set to the kernel start address (aligned on a page boundary).
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index 6a7761c..a1b888f 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -37,16 +37,6 @@
> >
> >  #ifndef __ASSEMBLY__
> >
> > -#define PAGE_UP(addr)        (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> > -#define PAGE_DOWN(addr)      ((addr)&(~((PAGE_SIZE)-1)))
> > -
> > -/* align addr on a size boundary - adjust address up/down if needed */
> > -#define _ALIGN_UP(addr, size)        (((addr)+((size)-1))&(~((size)-1)))
> > -#define _ALIGN_DOWN(addr, size)      ((addr)&(~((size)-1)))
> > -
> > -/* align addr on a size boundary - adjust address up if needed */
> > -#define _ALIGN(addr, size)   _ALIGN_UP(addr, size)
> > -
> >  #define clear_page(pgaddr)                   memset((pgaddr), 0, PAGE_SIZE)
> >  #define copy_page(to, from)                  memcpy((to), (from), PAGE_SIZE)
>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> It's generally easier if you split this sort of stuff up, as it'll be
> easier to merge if we don't have to coordinate between the trees.  I'm
> happy to take this, but I'd prefer an Ack from one of the microblaze
> folks first.
Em ... I'll separate it. Thx for reply.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
