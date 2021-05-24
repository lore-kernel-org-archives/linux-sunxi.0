Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568BC17F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 08:03:22 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso10907980wmm.3
        for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 01:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l+lXZOkJT9ztp2JCl1bPRf8G039aIWHo+Vabd2KIAvY=;
        b=hE15bhqpuXbPdzqAazrfGMf6jpdb7Plfzzuf8Tg3BA6zCx8evuNi5OahN0lBSi6jy0
         gmL2pDkRxR+V6YGQV9V5IG0mTSsDV2iuox0/5/1IQawdULfqWvOg6DWh4BJg4fEGeK2E
         J2AQpGvMaXThT16y4SiEJuhqSbiUyYR3D+56Ik012/2/YQXTxBpjo/ebQAUY/pqFLjxY
         BcdjFYg6YKXxY2YcIZEYYwL+gRPsD5CEaNAlKZvfXvlhshNwe8bLJc/Nr73JUMDjdOQK
         ParA5bj6PXKxhEZ0fHTy1lfN+l7xXY9cQCLdHYnZ95OIjte1+fWjOUXB5M0A8iL1NkqS
         qU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+lXZOkJT9ztp2JCl1bPRf8G039aIWHo+Vabd2KIAvY=;
        b=EXl8Qik57b7yMv9QTGB5tOmXgKPabReHc/vO9716SY0TL09/oHqkmRduDq+UEuc3yT
         ccbMh8EG8RVfewskeDK+pyrGvMwqZPBJEGSjSythtlEVMn4J16DVpPKLLjduzOB/N5G8
         YBQDy5ZzehtZJU45fo+wJIT6hrp6X3y83roUXN1IpzRiKR30kXeMx7W6w6lf+2d9arm+
         pb8wtEufJKxiHe2Hw5fRCyk0zjCWdPyZrwjHW6I2GBF5qmiMjq4NYodEZx2j6Sm7QIjx
         c68rK5vAsyN/WZ3H6oN8CmQHTh585B4BlFk5S/vAaoN8/FP+oxffynRj8z1Pz3Q2HNqE
         NO4w==
X-Gm-Message-State: AOAM532c1KV1u0aPYI8qpJU78uHVKvFDprjMwgKXAbWBGMCGc3flS29W
	Cr8iiPyB6Naa0S6XR6GoZTFlrNoQ2znEI8J2rIo5rA==
X-Google-Smtp-Source: ABdhPJyeURrTyE53pS9rjIrF1XyAYSlM5EIDZxsof/N3+lCkEYOm64yTb06OT7Z706TpnIKNx0pnoQ13EAD6f/Q4bPA=
X-Received: by 2002:a05:600c:b44:: with SMTP id k4mr19148969wmr.152.1621843400672;
 Mon, 24 May 2021 01:03:20 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1621839068-31738-1-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 May 2021 13:33:08 +0530
Message-ID: <CAAhSdy3ORUGqyL-9oMQCKYCXnG8M=xrZ8q+AiWg8s+v6zsk=_A@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 24, 2021 at 12:22 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Kernel virtual address translation should avoid care asid or it'll
> cause more TLB-miss and TLB-refill. Because the current asid in satp
> belongs to the current process, but the target kernel va TLB entry's
> asid still belongs to the previous process.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>

First of all thanks for doing this series, I had similar changes in mind
as follow-up to the ASID allocator.

I went through all three patches and at least I don't see any
obvious issue but I think we should try testing it more on a few
existing platforms.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/pgtable.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 78f2323..017da15 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -135,6 +135,7 @@
>                                 | _PAGE_PRESENT \
>                                 | _PAGE_ACCESSED \
>                                 | _PAGE_DIRTY \
> +                               | _PAGE_GLOBAL \
>                                 | _PAGE_CACHE)
>
>  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> --
> 2.7.4
>
