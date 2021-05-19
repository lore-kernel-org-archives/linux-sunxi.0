Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DE872
	for <linux-sunxi@lists.linux.dev>; Wed, 19 May 2021 06:09:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFDB261364
	for <linux-sunxi@lists.linux.dev>; Wed, 19 May 2021 06:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621404570;
	bh=+tng9KOkJ4vGrdnFxKm0TZVfhTzW5k68odPKowCsvhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qF4xfOt1jDthuAgTrYAXK5cXu/zjuNg4rW1XzACRs9Dl3LVj8Oqga++SH6/dYLNq1
	 MFJ1kMoeQ3CLTPuLh7FXXHrgLm1i3+QeyDLAL9xlEV2azlbZynB3gxaxwa3rl+G5Lg
	 fhc0YhitE6RWcCTD/dyboUwFeF4Y9UwocwXN8ZJnZIDQdbLZn+iQEUP0F2cO2lPPFd
	 kifN6vvUS6iKCYt0P84E5d7/PXMrXsuHZVqzzvO6Kk9djzYR2J0+rqzIAy9j6ZGAta
	 JEXn84LtwbnxWFeia0/mK8S0bYZHFjFC2Rfo+UHSKjl9Zn48bB45BmRP/jkmmXAuSm
	 tTR0PoWCWy4Sg==
Received: by mail-lj1-f180.google.com with SMTP id o8so14268319ljp.0
        for <linux-sunxi@lists.linux.dev>; Tue, 18 May 2021 23:09:30 -0700 (PDT)
X-Gm-Message-State: AOAM533TpPt+GD4PHI6uWOrwAVBio7eERukhoUDJ4fXKjhLCvPm89NjG
	7x5OU1Gpx/MOmkXuPrU7RU0iQZy4vF+HH6mnsLs=
X-Google-Smtp-Source: ABdhPJxCD9AU161BNjQRQBYs1nLF1LGkl0Ty6pHsGbdXuhweqLk1xlX6xD5rGyODMFf4KqToUL2wB7X/Dnv9SWicVUo=
X-Received: by 2002:a2e:9d82:: with SMTP id c2mr7361177ljj.508.1621404569271;
 Tue, 18 May 2021 23:09:29 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de> <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519055555.GA27451@lst.de>
In-Reply-To: <20210519055555.GA27451@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 May 2021 14:09:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSg0TqAzmdzf7B_xASXLO-z4yVvCDnaUV4brP7tCpCdvQ@mail.gmail.com>
Message-ID: <CAJF2gTSg0TqAzmdzf7B_xASXLO-z4yVvCDnaUV4brP7tCpCdvQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, drew@beagleboard.org, 
	wefu@redhat.com, lazyparser@gmail.com, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 19, 2021 at 1:55 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 19, 2021 at 01:48:23PM +0800, Guo Ren wrote:
> > The patchset just leaves a configuration chance for vendors. Before
> > RISC-V ISA fixes it, we should give the chance to let vendor solve
> > their real chip issues.
>
> No.  The vendors need to work to get a feature standardized before
> implementing it.  There is other way to have a sane kernel build that
> supports all the different SOCs.

I've said the patchset doesn't define any features, It just leaves the
chance for vendors.

It's not in conflict with any standardized riscv ISA.


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
