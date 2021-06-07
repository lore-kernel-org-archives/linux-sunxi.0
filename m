Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E2870
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 04:36:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF3AF6124B
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 04:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623040581;
	bh=im2gzm66A8fxb/16kOAjLznX7/J53Tnzbnd+6PWnKNM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OqH1Ex7NmtS7cl9CthzXzSe6tHqdPZD4kdn0wJbq0Wy2Jb35ZjabfbcPHGr2qbZ/8
	 //v4dwnpbI6zr/IsMYuFQiwClOHXJ7sbGOZ4k64ml5ch30a9uRnyx7FKgFi3kIiBPF
	 tlra+iT6djLETctNGuMsKZOjg99SbrK44y0FDFZiasyVRTpL6wcrVs7W0NvGhp0W7r
	 RVT4NtVfcFVJiU2vcVTPlGqiKsweDSIhd6v1hlTEurODxkgsh/F99k6MSM+7hez35v
	 CY4AYYEBDS7lxFbEfS+E/3VLnuuGCMKdovGM4DTAV5D9W8b/V6zxexY8D21R6bJCAo
	 /ort14V7zk5xA==
Received: by mail-lf1-f48.google.com with SMTP id a2so24015595lfc.9
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jun 2021 21:36:20 -0700 (PDT)
X-Gm-Message-State: AOAM531Zl8XIhpQlpSl3fug8qde5vf6NbVm4wJki0kIflpbfIqNtn3o7
	kDHwFEO4fQcn8JkXw2rkzi1+XWYkzssOTEMopow=
X-Google-Smtp-Source: ABdhPJzCJwuyh33/n2ptWxi8MoWxCk4WJq3GGiXzTMUpqQBQ96IZaBNQOONe348qpbkgI10hWLQulLRc/pxO3pHczqY=
X-Received: by 2002:ac2:5389:: with SMTP id g9mr10192844lfh.557.1623040579170;
 Sun, 06 Jun 2021 21:36:19 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org> <CO6PR04MB7812C5A068EEDB4D5A2348458D389@CO6PR04MB7812.namprd04.prod.outlook.com>
In-Reply-To: <CO6PR04MB7812C5A068EEDB4D5A2348458D389@CO6PR04MB7812.namprd04.prod.outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 12:36:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSBR76_6RjCxPj-k4bTnA84F9c9L-sGbO45bPnMiuvAFQ@mail.gmail.com>
Message-ID: <CAJF2gTSBR76_6RjCxPj-k4bTnA84F9c9L-sGbO45bPnMiuvAFQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] riscv: Add DMA_COHERENT support for
 Allwinner D1
To: Anup Patel <Anup.Patel@wdc.com>
Cc: "palmerdabbelt@google.com" <palmerdabbelt@google.com>, "arnd@arndb.de" <arnd@arndb.de>, 
	"wens@csie.org" <wens@csie.org>, "maxime@cerno.tech" <maxime@cerno.tech>, 
	"drew@beagleboard.org" <drew@beagleboard.org>, "liush@allwinnertech.com" <liush@allwinnertech.com>, 
	"lazyparser@gmail.com" <lazyparser@gmail.com>, "wefu@redhat.com" <wefu@redhat.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anup,

On Mon, Jun 7, 2021 at 11:44 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: guoren@kernel.org <guoren@kernel.org>
> > Sent: 06 June 2021 14:34
> > To: guoren@kernel.org; Anup Patel <Anup.Patel@wdc.com>;
> > palmerdabbelt@google.com; arnd@arndb.de; wens@csie.org;
> > maxime@cerno.tech; drew@beagleboard.org; liush@allwinnertech.com;
> > lazyparser@gmail.com; wefu@redhat.com
> > Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > arch@vger.kernel.org; linux-sunxi@lists.linux.dev; Guo Ren
> > <guoren@linux.alibaba.com>
> > Subject: [RFC PATCH v2 00/11] riscv: Add DMA_COHERENT support for
> > Allwinner D1
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
> > vendors define the custom properties of memory regions in PTE.
> >
> > This patchset helps SOC vendors to support their own custom interconnect
> > coherent solution with PTE attributes.
> >
> > For example, allwinner D1[1] uses T-HEAD C906 as main processor, C906 has
> > two modes in MMU:
> >  - Compatible mode, the same as the definitions in spec.
> >  - Enhanced mode, add custom DMA_COHERENT attribute bits in PTE which
> >    not mentioned in spec.
> >
> > Allwinner D1 needs the enhanced mode to support the DMA type device with
> > non-coherent interconnect in its SOC. C906 uses BITS(63 - 59) as custom
> > attribute bits in PTE.
> >
> > The patchset contain 4 parts (asid, pgtable, cmo, soc) which have been tested
> > on D1:
> >  - asid: T-HEAD C906 of D1 contains full asid hw facilities which has no
> >    conflict with RISC-V spec, and hope these patches soon could be
> >    approved.
> >  - pgtable: Using a image-hdr to pass vendor specific information and
> >    setup custom PTE attributes in a global struct variable during boot
> >    stage. Also it needs define custom protection_map in linux/mm.
> >  - cmo: We need deal with dma_sync & icache_sync & __vdso_icache_sync.
> >    In this patchset, I just show you how T-HEAD C9xx work, and seems Atish
> >    is working for the DMA infrustructure, please let me know the idea.
> >  - soc: Add allwinner gmac driver & dts & Kconfig for sunxi test.
> >
> > The patchset could work with linux-5.13-rc4, here is the steps for D1:
> >  - Download linux-5.13-rc4 and apply the patchset
> >  - make ARCH=riscv CROSS_COMPILE=riscv64-linux- defconfig
> >  - make ARCH=riscv CROSS_COMPILE=riscv64-linux- Image modules dtbs
> >  - mkimage -A riscv -O linux -T kernel -C none -a 0x00200000 -e 0x00200000 -
> > n Linux -d arch/riscv/boot/Image uImage
> >  - Download newest opensbi [2], build with [3], and get fw_dynamic.bin
> >  - Copy uImage, fw_dynamic.bin, allwinner-d1-nezha-kit.dtb into boot
> >    partition of TF card.
> >  - Plugin the TF card and power on D1.
> >
> > Link: https://linux-sunxi.org/D1 [1]
> > Link: https://github.com/riscv/opensbi branch:master [2]
> > Link: https://github.com/riscv/opensbi/blob/master/docs/platform/thead-
> > c9xx.md [3]
> >
> > Changes since v1:
> >  - Rebase on linux-5.13-rc4
> >  - Support defconfig for different PTE attributes
> >  - Support C906 icache_sync
> >  - Add Allwinner D1 dts & Kconfig & gmac for testing
> >  - Add asid optimization for D1 usage
> >
> > Guo Ren (10):
> >   riscv: asid: Use global mappings for kernel pages
> >   riscv: asid: Add ASID-based tlbflushing methods
> >   riscv: asid: Optimize tlbflush coding convention
> >   riscv: pgtable: Fixup _PAGE_CHG_MASK usage
> >   riscv: pgtable: Add custom protection_map init
> >   riscv: pgtable: Add DMA_COHERENT with custom PTE attributes
> >   riscv: cmo: Add dma-noncoherency support
> >   riscv: cmo: Add vendor custom icache sync
> >   riscv: soc: Initial DTS for Allwinner D1 NeZha board
> >   riscv: soc: Add Allwinner SoC kconfig option
>
> The series cover letter says DMA_COHERENT support but
> it is doing lot of stuff not related to DMA.
>
> Please keep the first three patches separate. They belong
> to your ASID series.
I just want to give out a whole view of how allwinner D1 works, which
could help soc folks run their mini system.

Christoph Hellwig has helped to update the ASID series, and I've given
the tested-by on my hardware 4*910 SMP & 906 D1
https://lore.kernel.org/linux-riscv/20210606152050.636038-1-hch@lst.de/T/#t

Ok, you won't see it in the next version patchset.

>
> I also dislike the fact that you are continuously sending
> SBI DMA sync patches without any discussion on the
> UnixPlatform mailing list for SBI spec changes.
SBI DMA sync is not critical for us, I could follow your definition
when you are ready. Even CBO trap emulation is okay for me.

>
> Regards,
> Anup
>
> >
> > liush (1):
> >   riscv: soc: Allwinner D1 GMAC driver only for temp use
> >
> >  arch/riscv/Kconfig                                 |    9 +
> >  arch/riscv/Kconfig.socs                            |   12 +
> >  arch/riscv/boot/dts/Makefile                       |    1 +
> >  arch/riscv/boot/dts/allwinner/Makefile             |    2 +
> >  .../boot/dts/allwinner/allwinner-d1-nezha-kit.dts  |   29 +
> >  arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi    |  100 +
> >  arch/riscv/configs/defconfig                       |    1 +
> >  arch/riscv/include/asm/cacheflush.h                |   48 +-
> >  arch/riscv/include/asm/mmu_context.h               |    2 +
> >  arch/riscv/include/asm/pgtable-64.h                |    8 +-
> >  arch/riscv/include/asm/pgtable-bits.h              |   20 +-
> >  arch/riscv/include/asm/pgtable.h                   |   44 +-
> >  arch/riscv/include/asm/sbi.h                       |   15 +
> >  arch/riscv/include/asm/soc.h                       |    1 +
> >  arch/riscv/include/asm/tlbflush.h                  |   22 +
> >  arch/riscv/include/asm/vendorid_list.h             |    1 +
> >  arch/riscv/kernel/sbi.c                            |   19 +
> >  arch/riscv/kernel/soc.c                            |   22 +
> >  arch/riscv/kernel/vdso/flush_icache.S              |   33 +-
> >  arch/riscv/mm/Makefile                             |    1 +
> >  arch/riscv/mm/cacheflush.c                         |    3 +-
> >  arch/riscv/mm/context.c                            |    2 +-
> >  arch/riscv/mm/dma-mapping.c                        |   53 +
> >  arch/riscv/mm/init.c                               |   26 +
> >  arch/riscv/mm/tlbflush.c                           |   57 +-
> >  drivers/net/ethernet/Kconfig                       |    1 +
> >  drivers/net/ethernet/Makefile                      |    1 +
> >  drivers/net/ethernet/allwinnertmp/Kconfig          |   17 +
> >  drivers/net/ethernet/allwinnertmp/Makefile         |    7 +
> >  drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c |  690 ++++++
> >  drivers/net/ethernet/allwinnertmp/sunxi-gmac.c     | 2240
> > ++++++++++++++++++++
> >  drivers/net/ethernet/allwinnertmp/sunxi-gmac.h     |  258 +++
> >  drivers/net/phy/realtek.c                          |    2 +-
> >  mm/mmap.c                                          |    4 +
> >  34 files changed, 3714 insertions(+), 37 deletions(-)  create mode 100644
> > arch/riscv/boot/dts/allwinner/Makefile
> >  create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-
> > kit.dts
> >  create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> >  create mode 100644 arch/riscv/mm/dma-mapping.c  create mode 100644
> > drivers/net/ethernet/allwinnertmp/Kconfig
> >  create mode 100644 drivers/net/ethernet/allwinnertmp/Makefile
> >  create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c
> >  create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac.c
> >  create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac.h
> >
> > --
> > 2.7.4
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
