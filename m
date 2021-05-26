Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8A70
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 02:06:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C9326117A
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 02:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621994806;
	bh=yRr75FXBDkkX6XLpZgf/r8ILJmMAe0Rn0jw76SQB5fU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HxqB9QXadza+92feVmfiJr0l8ONPm4BbzOMPBgsjDVHEaJq73542HPp1zGpMa1HgU
	 9cAUCVmpj3/FJxdaXrwE3o7Id+LEuVoCaT6jOwAGcOHzJl0/UpfqivPhGNVRpVaLIv
	 EvEI9sPIJRY1N2iivViNbS02uvoRV+M1vlW14Y1pavPqAD8BcB0LECLj7tV/hUYUvT
	 K2hHNTg6nPy5N+ZpGLqixXKirhUOhVwjyO139vMlCAXGUUkFzSybJwQUxm+GFoGJnD
	 e0Jttoe6+ywFvlOx05GKX79atc7ohdY5+PKY7M2IgUvXpF9nZonpR9VDcVg75QxeLU
	 XHUkIWlfVUjaQ==
Received: by mail-lj1-f176.google.com with SMTP id a4so25886371ljd.5
        for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 19:06:46 -0700 (PDT)
X-Gm-Message-State: AOAM532yRxPR3OxClbUXYDc45e+KDqO2MVJ7QiYEOnL04tnwvnyUfy6e
	Ntp98c47gjqh9g0FhLh4Xe21sknAPDQJ8/FoABE=
X-Google-Smtp-Source: ABdhPJxvzHi5wR2bxJ1FRaG/UA35jIYFHUzKTYzsu/MTRD8c5prpdij+urvuWwGp7gCfRvxKrhFG98Rfggw/X7Q+Y7Y=
X-Received: by 2002:a2e:1416:: with SMTP id u22mr386289ljd.498.1621994804881;
 Tue, 25 May 2021 19:06:44 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1621945234-37878-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1621945234-37878-1-git-send-email-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 26 May 2021 10:06:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTaw3WyFoSyK9O6WOxJwsxphX+xu3C+dSFVH6F6fQa3Ww@mail.gmail.com>
Message-ID: <CAJF2gTTaw3WyFoSyK9O6WOxJwsxphX+xu3C+dSFVH6F6fQa3Ww@mail.gmail.com>
Subject: Re: [PATCH] arch: Cleanup unused functions
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Michal Simek <monstr@monstr.eu>, Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>, 
	Palmer Dabbelt <palmerdabbelt@google.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

Could you help add the patch to your next-tree?

Also, please append below:

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anup Patel <anup@brainfault.org>

Thx

On Tue, May 25, 2021 at 8:21 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These functions haven't been used, so just remove them. The patch
> has been tested with riscv, but I only use grep to check the
> microblaze's.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Christoph Hellwig <hch@lst.de>
> ---
>  arch/microblaze/include/asm/page.h |  3 ---
>  arch/riscv/include/asm/page.h      | 10 ----------
>  2 files changed, 13 deletions(-)
>
> diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> index bf681f2..ce55097 100644
> --- a/arch/microblaze/include/asm/page.h
> +++ b/arch/microblaze/include/asm/page.h
> @@ -35,9 +35,6 @@
>
>  #define ARCH_SLAB_MINALIGN     L1_CACHE_BYTES
>
> -#define PAGE_UP(addr)  (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)        ((addr)&(~((PAGE_SIZE)-1)))
> -
>  /*
>   * PAGE_OFFSET -- the first address of the first page of memory. With MMU
>   * it is set to the kernel start address (aligned on a page boundary).
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 6a7761c..a1b888f 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -37,16 +37,6 @@
>
>  #ifndef __ASSEMBLY__
>
> -#define PAGE_UP(addr)  (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)        ((addr)&(~((PAGE_SIZE)-1)))
> -
> -/* align addr on a size boundary - adjust address up/down if needed */
> -#define _ALIGN_UP(addr, size)  (((addr)+((size)-1))&(~((size)-1)))
> -#define _ALIGN_DOWN(addr, size)        ((addr)&(~((size)-1)))
> -
> -/* align addr on a size boundary - adjust address up if needed */
> -#define _ALIGN(addr, size)     _ALIGN_UP(addr, size)
> -
>  #define clear_page(pgaddr)                     memset((pgaddr), 0, PAGE_SIZE)
>  #define copy_page(to, from)                    memcpy((to), (from), PAGE_SIZE)
>
> --
> 2.7.4
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
