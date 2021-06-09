Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BA670
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Jun 2021 00:18:39 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id l184so2395602pgd.8
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jun 2021 17:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=BL8LYfLiW97gYs50mMRPWFDzO43ZPs/0nLhvyiI1l9k=;
        b=TwN6pJqmDjnw1jUF78frKPE3sQLHszqGjFRAVBbsP15o7eht+rzG9v0aT4xjB7Oi4y
         4KHRy6xnA6ntzPCsKiXtaqInCJv35Uyvk1ntGoSG3vg6Cc595QGvVlcaFvyFV5/tMfnv
         4laIKokxgf6or5+ToPBfFxXd8B3bxeVCslRrte5JKXpVEJ6w5vGi2o0atO52gEC74K4w
         Ay4VVIqMRCU+owvvl21mgw5JLyAFwyBKGKvEfV0KAMDi1ps/z1jCvHMZGd+AxmmRc7sl
         j6rbVn6PQgNDpk0YEyqBG42n5dOsYMvc+Sm59ws7BqIKaEUb2AZF5wpkpvszBOpvpa8D
         r6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=BL8LYfLiW97gYs50mMRPWFDzO43ZPs/0nLhvyiI1l9k=;
        b=FewKlc+QCIQUTnIClcVKLctNxnlH2de5KnZ/76+6Ov/Xon/25iVs6+iVMEk3aPJr3e
         Fl0QDxlKR5kmZubgt/evs2GJT8HrnwgZcl7czYV4xkMyroh7mATjFTGW3DS97dxsMcIU
         aEXO+F5UCzQrbjZp2fxceYSxb9iSxliqup0x5p0LL2WfRWSAaIsj4MVp7Qy/KrHlkcwH
         QEsAecWIgZxPc5ozYMk0qXyQaUH32Oglu1VYlr9OI/Lxp5FnFpBKIpRE6Dh1VHncCk7P
         yYFH6FhdFwaXNncdZi2vTqB9GvoNrZwbC152eNNVz6jFsuE97ZE8ShzNtLdr7UXZKmH5
         3qwA==
X-Gm-Message-State: AOAM533s7g0z4A/SG9Q746c9h/dbj8hM839SWfFj1RejSpwktoApaS/F
	5d0zjurensDrTY529mIHf/2MBQ==
X-Google-Smtp-Source: ABdhPJwmp1Lk7bsoywWHJKG1fB6e9hWnUEMNIoCQ52jVaFnQVitNhNkU5zua3Ug1Kgzuz7vqyQvFPA==
X-Received: by 2002:a65:520a:: with SMTP id o10mr920386pgp.172.1623197918663;
        Tue, 08 Jun 2021 17:18:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id j5sm10143402pgl.70.2021.06.08.17.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 17:18:38 -0700 (PDT)
Date: Tue, 08 Jun 2021 17:18:38 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Jun 2021 17:18:24 PDT (-0700)
Subject:     Re: [PATCH V2 1/2] riscv: Cleanup unused functions
In-Reply-To: <1622350408-44875-2-git-send-email-guoren@kernel.org>
CC: guoren@kernel.org, Anup Patel <Anup.Patel@wdc.com>,
  Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-c8795d34-beda-4ef5-85fc-932ac36a726e@palmerdabbelt-glaptop>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sat, 29 May 2021 21:53:27 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These functions haven't been used, so just remove them. The patch
> has been tested with riscv.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/include/asm/page.h | 10 ----------
>  1 file changed, 10 deletions(-)
>
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

Thanks, this is on for-next.  I'm assuming you want the other one to go 
through the microblaze tree, and it looks like it's already been picked 
up.
