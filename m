Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E350B2FAD
	for <linux-sunxi@lists.linux.dev>; Sat, 29 May 2021 23:42:36 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y15so2169347pfl.4
        for <linux-sunxi@lists.linux.dev>; Sat, 29 May 2021 16:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
         :content-transfer-encoding;
        bh=nCF8S4c2UqVaSQfWVl5eT5cODWPKUpixcjFKEGaEBsg=;
        b=E5j3/R9jGWjyCkfveb2hFi3KRV59el0pmSmh+8jttzaEE49YnjYfWQrISUX64DQTYD
         CYRdBqqAhVie9tBk2A+r2dzPZRJyuQP4ps6vdHoJucMBqoeUE4mUuxgptKEKmked618I
         L7Ab8AynI+ph9zaO9IkGNdX1bYp7Nxg5H2TbkY/SYhwpws1R9fVlrkrE1LHF5r+cqVLS
         U7DxNqsMin6gbEHkEqcnymxvPahPMJwWPB5nKL8bBBKQQyP9ayWCz6441HZ8LELXsyxN
         MazOBw7l0X7C3ebInAujp8DqGA1qKg6P393sKCixoqXtj6RnfI8kVG4RTuL5Jyr88dRY
         n0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
         :mime-version:content-transfer-encoding;
        bh=nCF8S4c2UqVaSQfWVl5eT5cODWPKUpixcjFKEGaEBsg=;
        b=Izbc9O/C+IMbjrTxA0D6X0naEbDGQ3K9cpaU+7NvxFLH/T8f6iplK4cSun88ClI08E
         suN/Zd4PJVY7ldMu6xyyScXYvPlwmmNbUMEZ+AobVkv3DybJpj6sWPzYOrpVGtzsV2ns
         pcjeZUy1H9nHlrybwRWEZwZJ2cguXCASlgmPFMKNlYbx20+/VrDx8CG+MXvkgMeJtyrS
         eEjQOUxMkLV5wajF5pJuq6qCGgLqfo4RHsPwMm8U9EpGpHx/nHYRGH0RDPNGxHRBcftN
         6pz9WujcFtr3PosYvgB8PRmn+ixWBa7C/3bG35Nv9/JPALpur0YJAZaD/M+Neapaz12v
         ThYA==
X-Gm-Message-State: AOAM532ECV9TSAbj8IbfmbmXAhod9MrUR74eGYzBjGnY3rz3hzpDhrrm
	XjohUvLj4gC5V2Vib+qKCgpTqw==
X-Google-Smtp-Source: ABdhPJyBM9qTLEBjQIl1kZoPH7198QqOL+uALfz0g+QnABTxRKo7JOcZf9HC769u0b3OkMLMhkHXdQ==
X-Received: by 2002:a65:584d:: with SMTP id s13mr16053871pgr.97.1622331756137;
        Sat, 29 May 2021 16:42:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id k20sm7843994pgl.72.2021.05.29.16.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 16:42:35 -0700 (PDT)
Date: Sat, 29 May 2021 16:42:35 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 16:16:36 PDT (-0700)
From: palmerdabbelt@google.com
X-Google-Original-From: palmer@dabbelt.com
Subject:     Re: [PATCH V4 1/2] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
In-Reply-To: <1622008161-41451-2-git-send-email-guoren@kernel.org>
CC: guoren@kernel.org, Anup Patel <Anup.Patel@wdc.com>,
  Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
  guoren@linux.alibaba.com
To: guoren@kernel.org
Message-ID: <mhng-60806045-5ac7-4057-b596-a4d9cb79b7be@palmerdabbelt-glaptop>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 25 May 2021 22:49:20 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Kernel virtual address translation should avoid to use ASIDs or it'll
> cause more TLB-miss and TLB-refill. Because the current ASID in satp
> belongs to the current process, but the target kernel va TLB entry's
> ASID still belongs to the previous process.

Sorry, I still can't quite figure out what this is trying to say.  I 
went ahead and re-wrote the commit text to

    riscv: Use global mappings for kernel pages

    We map kernel pages into all addresses spages, so they can be marked as
    global.  This allows hardware to avoid flushing the kernel mappings when
    moving between address spaces.

LMK if I'm misunderstanding something here, it's on for-next.

>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 9469f46..346a3c6 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -134,7 +134,8 @@
>  				| _PAGE_WRITE \
>  				| _PAGE_PRESENT \
>  				| _PAGE_ACCESSED \
> -				| _PAGE_DIRTY)
> +				| _PAGE_DIRTY \
> +				| _PAGE_GLOBAL)
>
>  #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
>  #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
