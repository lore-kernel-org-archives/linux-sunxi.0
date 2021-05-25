Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D7E2F80
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 12:32:44 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id j14so30291295wrq.5
        for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sFy/LCaXB1SRilva8CJ6mi6jxkEQV+dWKl9QiGNHUsg=;
        b=s2myp/MyFCHOHtpxco8bZqGgOkPGygWKSZEMO5NAtVwE7ob5u1K956l3GFDdI8BvXp
         6huP+HAe5CK3gwN1qVuy1yHJgr5u1dVVw844eZ4sUbKonuWYdz7uDbugoZn7ZPs1Pijh
         RbxX8EkV57WppSRghckgfI2u2zN49d7zF0mrxQWOQevslGVYdY+W5vNXe/K6tY41C+GL
         4gD18WUuLnhhTN19n0BJxOF6Z2aY/EJ2Gqed5nPh6W1riNawh/tLQcBEp/+rhWKYfs2Z
         Uk+XNOTGlJ3BlTkWJnbNqo1hdeDOAb78BDm7BZsf2uwGyjXnG1AwvQ0MsayaKfHJ+tEQ
         KYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sFy/LCaXB1SRilva8CJ6mi6jxkEQV+dWKl9QiGNHUsg=;
        b=uVYzAYoFeGLP5OF3Mpe8G0UhEAi4hr/ZyCap0NKQfxfN5reusVCAWPsyR8qVqxWxht
         EPZO47Kmh/+Q3u+FP9S28ejOfQOiohiB+hgF3KLNvcfDgSk2uMSe2WwetcgKR6pNTyfo
         eSrPk7w+X+xyoLmjVdfdd+SMDtMf38r/QCUN0nOSUhD9xJBXliDg+OFkOLsCrwLiAWb3
         5Pfx3LxmS6bVryXPCkrDMsXstT4+5UdBwQZe4shtLuh8QsaF7RgMh7bf8FJFSK0aWfXa
         lb2YHA1l5sJVZQZM28cTJrtKPI+IcBEZT+ZaIotRTSFH5chuto4AAU+fcJuUnNlVRKDj
         XZkQ==
X-Gm-Message-State: AOAM532yh9UJR+vNBF4ZNPNFDq4qDXJCeV9fUyHLexkKzk0YyRnOWJUB
	aMQGge18WI3Hq5qtp0H2Qepb4CLIcCoJCZE7S+d+uw==
X-Google-Smtp-Source: ABdhPJwmnDH3iFAvmCNe+NjWKkYYKkEISVmzhPeoZ89aTiS5cvv29wco+Is3CTtZH/UHKJezW1DX4vg3l9OBcF2kkmY=
X-Received: by 2002:adf:e38c:: with SMTP id e12mr26636946wrm.128.1621945963328;
 Tue, 25 May 2021 05:32:43 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1621945234-37878-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1621945234-37878-1-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 25 May 2021 18:02:31 +0530
Message-ID: <CAAhSdy3b455vEhsMtL_swSnt1udP_z_dM_zcXvRfLN5ikjY8_A@mail.gmail.com>
Subject: Re: [PATCH] arch: Cleanup unused functions
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Michal Simek <monstr@monstr.eu>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 25, 2021 at 5:52 PM <guoren@kernel.org> wrote:
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

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

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
