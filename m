Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2919870
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 07:46:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDF1E61244
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 07:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623051989;
	bh=2HlV8yHs2q1qjoHRDtJoVGUfxTgO4byPz6D2uYNRljQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FxmLOZM5r4Z7GtFixysiILFJTjRWbjbsEs7+jojonhIuOUMLae2X86XjlksRQ5ItZ
	 Kp2HLKf3hcq7htEBpNBiljaaA0b8EQt5akMDMCJIotNGyl5UPwG+jI6yUpPh3et0b2
	 Nr4zEMKyO2dzXmvFuISpk7OjS+IoUa1mw+c32lciZ1Yz69tEKRHYivY0wXJB8VvxuV
	 2KACYptzrizLvKJH8Ke9yVZ7BXy3dT1r+E+my3CVoV61LYAgNUm5oWIMfGhVgRNc1l
	 GDHIoWE7a8/w4ZcUjJJZHCGPyL6q7GBOTQsOP+QqXJzGgdW7CR6Ol3csV4KeLNJqw8
	 aWtYQYO0/o0yg==
Received: by mail-lj1-f181.google.com with SMTP id bn21so20917504ljb.1
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 00:46:29 -0700 (PDT)
X-Gm-Message-State: AOAM531tIH+af0aYUmp4Ouz8APPsMYP5yrYf+iT/+1pA7RJ9V1S2k2GY
	fMrqvobaWtqpR9QT3WQ6pAG+Vgi2+AKUiH4vYzo=
X-Google-Smtp-Source: ABdhPJxL4zA7EQ2YHPHcUCPx8//5Y1q0itGfKI8bjok0Q3XogGDj6ywZVtGkP4ihvSlwi8LNJxqiz/MEyp7tBn9b04E=
X-Received: by 2002:a2e:900f:: with SMTP id h15mr12585106ljg.285.1623051988136;
 Mon, 07 Jun 2021 00:46:28 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr> <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
 <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr> <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com>
 <20210607062701.GB24060@lst.de> <CAJF2gTRZuER5YbTD=0xWLU0Np6eD8L_z3rZH0i_WXgENUD3nbQ@mail.gmail.com>
 <20210607065108.GA24872@lst.de>
In-Reply-To: <20210607065108.GA24872@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 15:46:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2koLW2si-VsYDh5D9DCX=1e-tGvwgj=MExva94+gC4Q@mail.gmail.com>
Message-ID: <CAJF2gTR2koLW2si-VsYDh5D9DCX=1e-tGvwgj=MExva94+gC4Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Christoph Hellwig <hch@lst.de>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Drew Fustini <drew@beagleboard.org>, 
	Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com, 
	=?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>, 
	Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 2:51 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jun 07, 2021 at 02:41:14PM +0800, Guo Ren wrote:
> > Double/Triple the size of physical memory regions can't be accepted by
> > SOC vendors, because it wastes HW resources.
> > Some cost-down soc interconnects only have 32bit~34bit width of
> > physical address, are you sure you could force them to expand it? (I
> > can't)
> >
> > > or somewhat dynamic.
> > How can HW implement with dynamic modifying PMA? What's the granularity?
>
> I'm just stating the requirements from the Linux DMA perspective.  You
> also do not need tripple the address space, just double.

With double, you only got "strong order + non-cache" for the DMA
descriptor. How about write-combine scenario?

Even, double physical memory address space also wastes HW resources.




--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
