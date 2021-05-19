Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB782FB6
	for <linux-sunxi@lists.linux.dev>; Wed, 19 May 2021 06:44:38 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id gm21so6811913pjb.5
        for <linux-sunxi@lists.linux.dev>; Tue, 18 May 2021 23:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=crJApTk0fR8CS3cRDbB3V67gscNvYMiJEHMFrBZfWUo=;
        b=zDGZZs/er8Q9IuA9Imgu2QK64TdNwRQPa6zLFs3OWErIjQOBeBTCV7kAFI8XkEVKBr
         7bimA/liFg+A8v/bCayXSehaSTT0F7V13I/Q44TYvfDL10K/hpHYxVbbzgQSr9Ocp1KW
         OjhyTVZqfbu6yFKgiafgqAFXyy8hw1jzKdN/Qpnb81hAz+pcdvz1+YxUEqVBvhNjLBfp
         uZPrxYwQiNSc0Udlc4+QVfWruZN81uje9iEir53nWlq/lfHmC7bWlKHsBxeRdqXjIVFp
         LnRvKqglalyIDwsrVoT/VOk+EEY/tiruqS+80tcJK3sSdDz0WMgb/5lbceYP6Gsiljpb
         Ycgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=crJApTk0fR8CS3cRDbB3V67gscNvYMiJEHMFrBZfWUo=;
        b=YtaW4YHXaKaYUzGqw8tq8XTBIb4GKGnLKfnFfDuHZfSHBxwUIryXyZSh3Hg8Vrwiuy
         m5VyiKkuSbzwDP2TCJrIKdYdBBOR0pnD5z6NCcWv54UuledFtsnioJhHjDpJIkaUH9T0
         fzSEOO5v7zhe90qYZbDLtAUicNUgit8ku+ylEbz+GlAdqkHmfAr4PrjS4SkskEZWuZN8
         UzTcqHJjSrDtPu4KPq6QEwPTFtWUI0mt7kio6kEFhnfIhu+2sjA2T/HdHVYU211JC89X
         73Ap4VebxXZJpMRqPcMtIb4zKPYr4XPflV5ZpcQuA2lQ3qqVIcdxUqze48TViKRIumNv
         X1PQ==
X-Gm-Message-State: AOAM531kJ9FXcKMKxXFOnWKBqMhu0OqihGj/SK79Rnt+e8SqQbei5hlT
	jZY5QgJ2tShO7BPJC6GwGiMleA==
X-Google-Smtp-Source: ABdhPJy9tsWxCDo/o3R7ta1owz+e2PxTX//mYRmicr9Nz+qbfH9zpmvYaQDcpfama4JkK8fiYfECwQ==
X-Received: by 2002:a17:902:e8cb:b029:ee:f963:4fd8 with SMTP id v11-20020a170902e8cbb02900eef9634fd8mr9185136plg.40.1621406677878;
        Tue, 18 May 2021 23:44:37 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:9384:8c4b:dc2b:c4d0])
        by smtp.gmail.com with ESMTPSA id v14sm8823848pfi.25.2021.05.18.23.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 23:44:37 -0700 (PDT)
Date: Tue, 18 May 2021 23:44:35 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>,
	Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
	lazyparser@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
	paul.walmsley@sifive.com, Nick Kossifidis <mick@ics.forth.gr>,
	Benjamin Koch <snowball@c3pb.de>,
	Matteo Croce <mcroce@linux.microsoft.com>,
	Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519064435.GA3076809@x1>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>

On Wed, May 19, 2021 at 01:48:23PM +0800, Guo Ren wrote:
> On Wed, May 19, 2021 at 1:20 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Wed, May 19, 2021 at 05:04:13AM +0000, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
> > > vendors define the custom properties of memory regions in PTE.
> >
> > Err, hell no.   The ISA needs to gets this fixed first.  Then we can
> > talk about alternatives patching things in or trapping in the SBI.
> > But if the RISC-V ISA can't get these basic done after years we can't
> > support it in Linux at all.
> 
> The patchset just leaves a configuration chance for vendors. Before
> RISC-V ISA fixes it, we should give the chance to let vendor solve
> their real chip issues.

This patch series looks like it might be useful for the StarFive JH7100
[1] [2] too as it has peripherals on a non-coherent interconnect. GMAC,
USB and SDIO require that the L2 cache must be manually flushed after
DMA operations if the data is intended to be shared with U74 cores [2].

There is the RISC-V Cache Management Operation, or CMO, task group [3]
but I am not sure if that can help the SoC's that have already been
fabbed like the the D1 and the JH7100.

thanks,
drew

[1] https://github.com/starfive-tech/beaglev_doc/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
[2] https://github.com/starfive-tech/beaglev_doc/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf
[3] https://github.com/riscv/riscv-CMOs
