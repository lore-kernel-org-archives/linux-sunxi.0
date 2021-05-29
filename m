Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E34A2FAD
	for <linux-sunxi@lists.linux.dev>; Sat, 29 May 2021 23:08:18 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id k5so4548297pjj.1
        for <linux-sunxi@lists.linux.dev>; Sat, 29 May 2021 16:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=qss0x+5sHCW7H4avOnfrc4/iwaDvuVYHTQ7IXox97jI=;
        b=FwnxWJLhicCZPG6FDqH6ssQblDovkkGj63nfCN2c9eZ0cVUk2N4D5mIYhjEPJKjVfW
         NqXBY8uuErmw/KEKK+/+bx/UGMmhonkcTlT5+Hd4fBSjtzzhyAyIS/cK3f0Ctm0A04mI
         vuMman8k2T1QvcXXZGM3wsXAPEPmTwnPaC/7OIyBzY4TXCsR00+sbQkTrVKDFCunq64x
         AcQe2B4lrAaQhCj0L8xaG7DVGaoqKGw9DXaYRNARQxlwbNXMBO1wgDyKqjixfwzU3eQf
         PsytkA6CSCuDrWeWYkhaUtPnNJK1PJ4iozQ7a1nm1OPL6+zHY/URtWXfDmAaJPDsA3ld
         cavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=qss0x+5sHCW7H4avOnfrc4/iwaDvuVYHTQ7IXox97jI=;
        b=Yevb1ua7YPWu1cnUhwhtldHtsZh2h96zW7rUv+0kf7jYQ3OV5ugqXGH0Ush0P7tvlC
         x5fy1SAYyNbR/4zZSauoaQ6vCQbEcOeBC/UdHHTEUd07VRHK2GmS8da1vZgizWdVyFU0
         c/hvHfYiS+wvDc4iwocPn+GrMnlxvzok/b9NPZPnJUWpyfinXxQtB5YOVePM4you8lEJ
         U4CBxFycqP1F2aeTrlBlk5cAsBF7P/lav9/hJlROZl/3pL2w/35b02rl9nADm0pkjBt0
         zCjXTaY7g+At3HpMC/CxUeJ4/TGypJkN1SmLfTETkkGxeQYFUgAy7hqzk6YXjAHeMnNy
         TeSg==
X-Gm-Message-State: AOAM533xpsXve07RejdbtySh8Zm2iT3fkSjX5nAgGBdpEoRteEfcRMn3
	sXNfUO4KfXgFsD/rB2MB9cxOHw==
X-Google-Smtp-Source: ABdhPJzrWRNEm5ifiRm0JTVwjK2OCpXjOulal+R0YAqOyyJ2AkYsuIY448mYbv2VRTVX+ccVnODgsA==
X-Received: by 2002:a17:902:ab95:b029:ee:f899:6fe8 with SMTP id f21-20020a170902ab95b02900eef8996fe8mr13937488plr.81.1622329697639;
        Sat, 29 May 2021 16:08:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id i16sm7281143pji.30.2021.05.29.16.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 16:08:17 -0700 (PDT)
Date: Sat, 29 May 2021 16:08:17 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 16:07:41 PDT (-0700)
Subject:     Re: [PATCH] arch: Cleanup unused functions
In-Reply-To: <1621945234-37878-1-git-send-email-guoren@kernel.org>
CC: guoren@kernel.org, Anup Patel <Anup.Patel@wdc.com>,
  Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
  guoren@linux.alibaba.com, monstr@monstr.eu
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-93a12abf-0283-4ec3-a521-89b8d882654f@palmerdabbelt-glaptop>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 25 May 2021 05:20:34 PDT (-0700), guoren@kernel.org wrote:
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
>  #define ARCH_SLAB_MINALIGN	L1_CACHE_BYTES
>
> -#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
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
> -#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
> -
> -/* align addr on a size boundary - adjust address up/down if needed */
> -#define _ALIGN_UP(addr, size)	(((addr)+((size)-1))&(~((size)-1)))
> -#define _ALIGN_DOWN(addr, size)	((addr)&(~((size)-1)))
> -
> -/* align addr on a size boundary - adjust address up if needed */
> -#define _ALIGN(addr, size)	_ALIGN_UP(addr, size)
> -
>  #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
>  #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

It's generally easier if you split this sort of stuff up, as it'll be 
easier to merge if we don't have to coordinate between the trees.  I'm 
happy to take this, but I'd prefer an Ack from one of the microblaze 
folks first.
