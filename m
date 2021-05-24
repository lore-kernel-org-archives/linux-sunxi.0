Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B6E2FAE
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 10:42:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r12so28021908wrp.1
        for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/eUOrn9lE2HWE5uWnHqSiVPbmorQyM5RkNMwB1g8oIs=;
        b=0yAdh939lZC+DNZj9zX08KI/2bh/2h7zmkHMSnczbPROY1mBpcwAmg0BQPTddC33YH
         4poJ7dKhhKT4R4TGNXdtorC9bI2PVGH3oXRIPpAS/DKiuIxy/TzYsazkdd3Qpzv1SG/2
         r9YwVzaeFmSJAJ3aqiEVi9Ry0XwMT4iGOOiqcC9zemBuKsWaAgalXyA5WRQrcMbcdMoY
         sOdd9GnmW7iWCEJydL+7x3rrUSV+8pYIOL2gETTo15dqXQtU/3MvCuijaryNcvW2d3fA
         DRH8il9kC3BqiomKign1XqgPFDcyL8bPJvmkWu1ndPqOrDtLgeCriIec0SZ8emwQGmU5
         IH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/eUOrn9lE2HWE5uWnHqSiVPbmorQyM5RkNMwB1g8oIs=;
        b=aJxiMEI0IjIeWLvbw8FHFJFW6X+6ToHeF1dG5shGbjnQLCioOWTZvslIAeWiSUTJS8
         Fum31LUdJS7I2tiw9KMcphncU0EYhIVdhy7f+6n1yBx1IsWrNR1g7mFoznZ5Y4IZv5D4
         xbBA3s6ciImw6WCO28cLOIoX13FcLzez36mhMTAd1jY8SCo3DVMCayiozZBs97NaRL1E
         M3BUceJJ8HyiNh0xzV3unRbXLfxgZ4/EWTdqJitDa9skjt89TsImiGfU+ZoYzGq3SCT+
         gEqQC9Sshs1K3SIAhuiQDqE7Kn1Dtv1TlERYZb3vIL2v7WALytZurs8HK1KYrk/1JC1t
         +P9w==
X-Gm-Message-State: AOAM531mU8AATUA+cBIXlAA/arPFefkA9pqBY4hpGoNl6XipbefU6Anb
	9prM9Zj6SRPupOWMBAVBcAdzF4MCGidxVWRBzsHZ4A==
X-Google-Smtp-Source: ABdhPJyWPhOVNAkgUqE7qc9+oTrs7UQSenUtFjVASUHEuOyt8RBQDzntOc1bcLlVhXlvtZH0j/l7d8a1Eumaxmy0RFw=
X-Received: by 2002:a5d:6701:: with SMTP id o1mr22084731wru.390.1621852958251;
 Mon, 24 May 2021 03:42:38 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1621839068-31738-1-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 May 2021 16:12:26 +0530
Message-ID: <CAAhSdy1QsyddHG3u=+Sv3mrVmtB15pr-hvg7+UT1evmNSwyY1g@mail.gmail.com>
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

It seems this patch is not based on the upstream kernel. The
_PAGE_CACHE seems to be from your other patch series.

Please rebase these patches on the latest upstream kernel without
dependency on any other patch series.

Regards,
Anup

>
>  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> --
> 2.7.4
>
