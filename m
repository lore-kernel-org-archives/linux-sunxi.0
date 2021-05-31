Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B427F173
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 12:33:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A1EA61364
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 12:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622464387;
	bh=0Ao6p/tCN0lLmwFOL3ikaLa3kNQR3rdJ0oGyStE28vw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ikpLtgpys9PI219jFN9/zG2VA6HBESrTqKXixKRNifYGrKNzw+9HTW4jScV6coQ9l
	 GxCum1F3zUexqoinnBNB3moHoKndL0VgktA6yHCkKyvs16ocIhQvbTkiV52bD9cwPk
	 8e2vHK0XgSYaL/qmV6aaaX3SyIkz/IBNV1Bhv1IzzZ0dujtoF5uvaeVpjhgYuuGX2y
	 9FfRROisMpKMSVVD6ZMDZsyMQnOddUNrGAFBK8yVyMFgncEbNwEywBtFu+Y2QjBGFo
	 n+shdHlioqm6XRi4/OOdEJ8o2SFjiyTcUDa5Fi883xQJJDm8GupqLNBA3M4A9bWpKB
	 owiFQRPkFkxhQ==
Received: by mail-lf1-f52.google.com with SMTP id b18so12521035lfv.11
        for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 05:33:07 -0700 (PDT)
X-Gm-Message-State: AOAM531bllZHPwTClejx5qJZH/e84bmbb5+jU1StMl2CMLz2LTWuzDKy
	IZMslpPSb41yIY6kdJRkJ69gGPvcpngWvYCZU1o=
X-Google-Smtp-Source: ABdhPJxfkfBwOVqzBzMgxibHiDT1eCvcg1+7OdH3J/JTWXYDq1/MYIQ0oSYnpIXJuwWXjFhu1rxoF7vHe+4jY/JSOXk=
X-Received: by 2002:a19:5209:: with SMTP id m9mr3806497lfb.24.1622464385463;
 Mon, 31 May 2021 05:33:05 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1622350408-44875-1-git-send-email-guoren@kernel.org>
 <1622350408-44875-3-git-send-email-guoren@kernel.org> <73bf48c1-6692-795c-ba16-b7baeb11d3b9@monstr.eu>
In-Reply-To: <73bf48c1-6692-795c-ba16-b7baeb11d3b9@monstr.eu>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 May 2021 20:32:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ6vVHYpw8WVJZqHjkm3gxNkGev9Cq+AzDcOiueSZTA6w@mail.gmail.com>
Message-ID: <CAJF2gTQ6vVHYpw8WVJZqHjkm3gxNkGev9Cq+AzDcOiueSZTA6w@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] microblaze: Cleanup unused functions
To: Michal Simek <monstr@monstr.eu>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 31, 2021 at 8:25 PM Michal Simek <monstr@monstr.eu> wrote:
>
>
>
> On 5/30/21 6:53 AM, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > These functions haven't been used, so just remove them. The patch
> > just uses grep to verify.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Michal Simek <monstr@monstr.eu>
> > ---
> >  arch/microblaze/include/asm/page.h | 3 ---
> >  1 file changed, 3 deletions(-)
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
> >
>
> Ah ok. you have sent v2. Will take this version instead of previous one.
No need, they are the same, Thx.

>
> Thanks,
> Michal
>
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Xilinx Microblaze
> Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
> U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
