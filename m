Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A417C2FAE
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 12:01:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4999461370
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621857691;
	bh=veNGvYxcLl+vDYUz1SMH3CGwccZ8IWRdI0wIqqjpXHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nD8gwroafsuYGdv9NfLO0Co93IMx/me0F4AAZKDIR4kw849gUWF0ueVG7PLAVzHEq
	 zul3q6dM9dUQ93Urx1vFQceK7M3j6tH6+N6bMr98eBb6rMOndl+c7Dh5hf88g4yblk
	 Q5d5dTF1w8GnDEklR70EJBmKE80ZA49d2FyeYOOZnUgJP/MgVzoJqSp6l++emo3Ftd
	 9urpVUBIYqyaSzEQ/+/5T0kOmIi9Iou86kq+VsyhNwQUtA+/dXmVzzDRg00f623Ypk
	 tTvCTu/v3jHt7kYXvnz1aukazjAxtGZKYMA0znBQasdoA5LvhqXEAyQ46zx9ASMX16
	 8hVMtlTLi1iDw==
Received: by mail-lf1-f54.google.com with SMTP id c10so19288209lfm.0
        for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 05:01:31 -0700 (PDT)
X-Gm-Message-State: AOAM531sFflEG79NRgNvzGUt752R9efk4WG3tvdi3IAOBhwi8caee+3N
	OMRqIAhpb8aUPdST7FNOF+sLLdWNFFOTsXHSBkc=
X-Google-Smtp-Source: ABdhPJx/oJ+jz4mGUBNUVDukdZUBydqmcR8FyJX8ZFV9ulMABT6jX8AjToYzvFvtvNgaeYZh3zITll0SsnnwsObfXs4=
X-Received: by 2002:a05:6512:36c5:: with SMTP id e5mr10330380lfs.41.1621857689496;
 Mon, 24 May 2021 05:01:29 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1621839068-31738-1-git-send-email-guoren@kernel.org> <CAAhSdy1QsyddHG3u=+Sv3mrVmtB15pr-hvg7+UT1evmNSwyY1g@mail.gmail.com>
In-Reply-To: <CAAhSdy1QsyddHG3u=+Sv3mrVmtB15pr-hvg7+UT1evmNSwyY1g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 May 2021 20:01:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTzEko6Qdt80gDJP6yFaomYa5SqA+onfbm_khnRFV0L-w@mail.gmail.com>
Message-ID: <CAJF2gTTzEko6Qdt80gDJP6yFaomYa5SqA+onfbm_khnRFV0L-w@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 24, 2021 at 6:42 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, May 24, 2021 at 12:22 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Kernel virtual address translation should avoid care asid or it'll
> > cause more TLB-miss and TLB-refill. Because the current asid in satp
> > belongs to the current process, but the target kernel va TLB entry's
> > asid still belongs to the previous process.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 78f2323..017da15 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -135,6 +135,7 @@
> >                                 | _PAGE_PRESENT \
> >                                 | _PAGE_ACCESSED \
> >                                 | _PAGE_DIRTY \
> > +                               | _PAGE_GLOBAL \
> >                                 | _PAGE_CACHE)
>
> It seems this patch is not based on the upstream kernel. The
> _PAGE_CACHE seems to be from your other patch series.
>
> Please rebase these patches on the latest upstream kernel without
> dependency on any other patch series.
Yes, it based on DMA_COHERENT. I'll rebase in PATCH V2, thx.

>
> Regards,
> Anup
>
> >
> >  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> > --
> > 2.7.4
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
