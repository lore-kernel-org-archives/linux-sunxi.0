Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4720570
	for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 00:36:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1D7561400
	for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 00:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621643781;
	bh=HaoAEb5QnxGwVYmtRURFgpSmH16cCBITcqMVRG2/0Gg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MPqbJhBH3RstH9EWKnNxymskz2Pl/C3W0gZMrlE5YCNKDUTrUUl6zCvDVB5k5XAYV
	 Y9reX8ayEACS9y0c/FUtyyh/u4B9uR1QqFmPsWzjNryQn+mrf9sJS0gsybWWjctN+6
	 8t3HtRVEAhAQbtaZt0m0Y2ipK9Ky6/a///tbh5LM0ggxxkxKSCYeUmhmxi04t5zUHH
	 3VoiVihlCbU5yRaTI00Hz9NhwohX5X6bXsnRYyv2VKYnPnCyVijAyx6eVeIE/4yuTU
	 2Obo3xiF4iJYCtUfU9lO4WLwiZEypzFDL6/ggllWhgtf/ABAN9PNqOCTmfMo2TyWaN
	 ElcxbVijfWhjQ==
Received: by mail-lj1-f173.google.com with SMTP id 131so25987632ljj.3
        for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 17:36:21 -0700 (PDT)
X-Gm-Message-State: AOAM533qWgNkO2Law/zWabg6Gcoqv1YgjwQ71q3uADVcKqbympjugVOs
	swsXh4Mt/HtrSKDPHfiAd9h7oisVgiajl563bd4=
X-Google-Smtp-Source: ABdhPJw+FdoqB7wdUwCy62OFrQ1DY0Cf6ne6oubJWNeuhIRENTiVKgOFAcEA/5SJUwdF8GiK/Z3FCxIVMCSO7UivrSQ=
X-Received: by 2002:a05:651c:502:: with SMTP id o2mr8602037ljp.105.1621643779980;
 Fri, 21 May 2021 17:36:19 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de> <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
 <20210519060617.GA28397@lst.de> <20210519065431.GB3076809@x1> <CAAhSdy3C1owsbY_9gkxkhWfCXnL_noow7F4t=5+j7q+AJO3pZQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3C1owsbY_9gkxkhWfCXnL_noow7F4t=5+j7q+AJO3pZQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 22 May 2021 08:36:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBAKTBY5AF9jd8tfT-33Y+McyFis_xk_aMvZZpLsvVxw@mail.gmail.com>
Message-ID: <CAJF2gTTBAKTBY5AF9jd8tfT-33Y+McyFis_xk_aMvZZpLsvVxw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Anup Patel <anup@brainfault.org>
Cc: Drew Fustini <drew@beagleboard.org>, Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>, 
	Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com, 
	=?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 19, 2021 at 3:15 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, May 19, 2021 at 12:24 PM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig wrote:
> > > On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
> > > > Since the existing RISC-V ISA cannot solve this problem, it is better
> > > > to provide some configuration for the SOC vendor to customize.
> > >
> > > We've been talking about this problem for close to five years.  So no,
> > > if you don't manage to get the feature into the ISA it can't be
> > > supported.
> >
> > Isn't it a good goal for Linux to support the capabilities present in
> > the SoC that a currently being fab'd?
> >
> > I believe the CMO group only started last year [1] so the RV64GC SoCs
> > that are going into mass production this year would not have had the
> > opporuntiy of utilizing any RISC-V ISA extension for handling cache
> > management.
>
> The current Linux RISC-V policy is to only accept patches for frozen or
> ratified ISA specs.
> (Refer, Documentation/riscv/patch-acceptance.rst)
>
> This means even if emulate CMO instructions in OpenSBI, the Linux
> patches won't be taken by Palmer because CMO specification is
> still in draft stage.
Before CMO specification release, could we use a sbi_ecall to solve
the current problem? This is not against the specification, when CMO
is ready we could let users choose to use the new CMO in Linux.

From a tech view, CMO trap emulation is the same as sbi_ecall.

>
> Also, we all know how much time it takes for RISCV international
> to freeze some spec. Judging by that we are looking at another
> 3-4 years at minimum.
>
> Regards,
> Anup



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
