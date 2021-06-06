Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121C70
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jun 2021 17:14:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id i94so9658033wri.4
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jun 2021 10:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t0ngfq8v4GDUgFESlrE0JELVOjRgUmmBaP6fcNBr54I=;
        b=uWrJ+arILlxT7ZwHMghPIzGKOCH6iid96CZIwxC/S5EClYcLbU8ECWa+j/LqE5fiXs
         Z56awwob2HCfTl6fzAYc37lQfBRjiSDTxEduhD15o5JOPzNeXQg/3f4/yhAAtTEYOGl9
         7zUDUp3uZTwJ6UNpK6qwbWIC9jRmOLyF45Ry/6DEtr26llfqZc0eA89WJzixTeuXNfHk
         QBzS8cHFX9MOmpp/AUktuc0hqI45DQRORCJIOV0jI7q4mGS69g+fVsSAcwraP/kXf2M1
         ulcvHVSlAdgw88aoSZTdGCniDRfpzW1MrNRGwlDIOyUMGEQDsdUEWZSVKKTgvz1Nxq9A
         H4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t0ngfq8v4GDUgFESlrE0JELVOjRgUmmBaP6fcNBr54I=;
        b=F0TlXet3V/yBPanxcLsgT5/vVy5aJRhnPZ+9JSMBv4po4mTmLJcpM5yBAn6UK1hwuV
         DqkTCzP6c+37IivUPVTjY+nR8fDHlQGcVuZQixs/e34QAm6ZkY3UHLrZMXXhxJ2cpe/R
         gNfD75vugBpOLmSxbEXJvRPqeKFsHNRMe4ftBu2X+BtLQmd3cGjdCd1al3Q2Kmoy9aKD
         tVx5UrUojPuzKi8FuYiFUyckwsldNnZwzbAkBQH4pu/zw+eAnnKa2APBu6fagVm1T/GG
         +eC+LB1U3J5uLqaqM8SU4WhYH3utdjAddDJOT7i/KI5+BucUVGfimQEfLF8k5YN7C/X9
         CczA==
X-Gm-Message-State: AOAM533lol6RuT1kRj4w8f1p52TmqoR59ShNsUvGr9LVEeiIXTtB8+5k
	Uoxcp/cp3T374ALpSQMKn1w=
X-Google-Smtp-Source: ABdhPJz8CAyOeyOFrSeMZEwE9Secrxj8SxDI4wHQJzhlpIGI+BLpzrACIWxuIhOY9CX+GwwQ8KbewQ==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr13309222wrn.117.1622999644208;
        Sun, 06 Jun 2021 10:14:04 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id k11sm14529330wmj.1.2021.06.06.10.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 10:14:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>, wens@csie.org, maxime@cerno.tech, Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com, Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>, wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH v2 00/11] riscv: Add DMA_COHERENT support for Allwinner D1
Date: Sun, 06 Jun 2021 19:14:02 +0200
Message-ID: <1664140.l4xsYfQU8q@jernej-laptop>
In-Reply-To: <CAJF2gTQ1yvSNthJ2yJkqaYGaJ6OYmf0vbG=hm4ocgnw4DiZbOw@mail.gmail.com>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org> <3110420.cQCZQDpDj9@jernej-laptop> <CAJF2gTQ1yvSNthJ2yJkqaYGaJ6OYmf0vbG=hm4ocgnw4DiZbOw@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 06. junij 2021 ob 18:54:05 CEST je Guo Ren napisal(a):
> V5 is not related to the patch series.

Don't top post.

If that's the case, then your e-mail client messed things up. I got V5 patc=
hes=20
in the same thread as board enablement patches and so did mailing list [1].

Best regards,
Jernej

[1] https://lore.kernel.org/linux-sunxi/
CAJF2gTQ1yvSNthJ2yJkqaYGaJ6OYmf0vbG=3Dhm4ocgnw4DiZbOw@mail.gmail.com/T/#t

>=20
> On Mon, Jun 7, 2021 at 12:29 AM Jernej =C5=A0krabec <jernej.skrabec@gmail=
=2Ecom>=20
wrote:
> > Hi!
> >=20
> > Dne nedelja, 06. junij 2021 ob 11:03:55 CEST je guoren@kernel.org=20
napisal(a):
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >=20
> > > The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
> > > vendors define the custom properties of memory regions in PTE.
> > >=20
> > > This patchset helps SOC vendors to support their own custom interconn=
ect
> > > coherent solution with PTE attributes.
> > >=20
> > > For example, allwinner D1[1] uses T-HEAD C906 as main processor, C906
> > > has
> > >=20
> > > two modes in MMU:
> > >  - Compatible mode, the same as the definitions in spec.
> > >  - Enhanced mode, add custom DMA_COHERENT attribute bits in PTE which
> > > =20
> > >    not mentioned in spec.
> > >=20
> > > Allwinner D1 needs the enhanced mode to support the DMA type device w=
ith
> > > non-coherent interconnect in its SOC. C906 uses BITS(63 - 59) as cust=
om
> > > attribute bits in PTE.
> > >=20
> > > The patchset contain 4 parts (asid, pgtable, cmo, soc) which have been
> > >=20
> > > tested on D1:
> > >  - asid: T-HEAD C906 of D1 contains full asid hw facilities which has=
 no
> > > =20
> > >    conflict with RISC-V spec, and hope these patches soon could be
> > >    approved.
> > > =20
> > >  - pgtable: Using a image-hdr to pass vendor specific information and
> > > =20
> > >    setup custom PTE attributes in a global struct variable during boot
> > >    stage. Also it needs define custom protection_map in linux/mm.
> > > =20
> > >  - cmo: We need deal with dma_sync & icache_sync & __vdso_icache_sync.
> > > =20
> > >    In this patchset, I just show you how T-HEAD C9xx work, and seems
> > >    Atish
> > >    is working for the DMA infrustructure, please let me know the idea.
> > > =20
> > >  - soc: Add allwinner gmac driver & dts & Kconfig for sunxi test.
> > >=20
> > > The patchset could work with linux-5.13-rc4, here is the steps for D1:
> > >  - Download linux-5.13-rc4 and apply the patchset
> > >  - make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux- defconfig
> > >  - make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux- Image modules dtbs
> > >  - mkimage -A riscv -O linux -T kernel -C none -a 0x00200000 -e
> > >  0x00200000
> > >=20
> > > -n Linux -d arch/riscv/boot/Image uImage - Download newest opensbi [2=
],
> > > build with [3], and get fw_dynamic.bin - Copy uImage, fw_dynamic.bin,
> > > allwinner-d1-nezha-kit.dtb into boot partition of TF card.
> > >=20
> > >  - Plugin the TF card and power on D1.
> > >=20
> > > Link: https://linux-sunxi.org/D1 [1]
> > > Link: https://github.com/riscv/opensbi branch:master [2]
> > > Link:
> > > https://github.com/riscv/opensbi/blob/master/docs/platform/thead-c9xx=
=2Emd
> > > [3]
> >=20
> > Some patches are marked with v2 and some V5. It's very confusing. Mark
> > them
> > with same version in next revision.
> >=20
> > Best regards,
> > Jernej
> >=20
> > > Changes since v1:
> > >  - Rebase on linux-5.13-rc4
> > >  - Support defconfig for different PTE attributes
> > >  - Support C906 icache_sync
> > >  - Add Allwinner D1 dts & Kconfig & gmac for testing
> > >  - Add asid optimization for D1 usage
> > >=20
> > > Guo Ren (10):
> > >   riscv: asid: Use global mappings for kernel pages
> > >   riscv: asid: Add ASID-based tlbflushing methods
> > >   riscv: asid: Optimize tlbflush coding convention
> > >   riscv: pgtable: Fixup _PAGE_CHG_MASK usage
> > >   riscv: pgtable: Add custom protection_map init
> > >   riscv: pgtable: Add DMA_COHERENT with custom PTE attributes
> > >   riscv: cmo: Add dma-noncoherency support
> > >   riscv: cmo: Add vendor custom icache sync
> > >   riscv: soc: Initial DTS for Allwinner D1 NeZha board
> > >   riscv: soc: Add Allwinner SoC kconfig option
> > >=20
> > > liush (1):
> > >   riscv: soc: Allwinner D1 GMAC driver only for temp use
> > > =20
> > >  arch/riscv/Kconfig                                 |    9 +
> > >  arch/riscv/Kconfig.socs                            |   12 +
> > >  arch/riscv/boot/dts/Makefile                       |    1 +
> > >  arch/riscv/boot/dts/allwinner/Makefile             |    2 +
> > >  .../boot/dts/allwinner/allwinner-d1-nezha-kit.dts  |   29 +
> > >  arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi    |  100 +
> > >  arch/riscv/configs/defconfig                       |    1 +
> > >  arch/riscv/include/asm/cacheflush.h                |   48 +-
> > >  arch/riscv/include/asm/mmu_context.h               |    2 +
> > >  arch/riscv/include/asm/pgtable-64.h                |    8 +-
> > >  arch/riscv/include/asm/pgtable-bits.h              |   20 +-
> > >  arch/riscv/include/asm/pgtable.h                   |   44 +-
> > >  arch/riscv/include/asm/sbi.h                       |   15 +
> > >  arch/riscv/include/asm/soc.h                       |    1 +
> > >  arch/riscv/include/asm/tlbflush.h                  |   22 +
> > >  arch/riscv/include/asm/vendorid_list.h             |    1 +
> > >  arch/riscv/kernel/sbi.c                            |   19 +
> > >  arch/riscv/kernel/soc.c                            |   22 +
> > >  arch/riscv/kernel/vdso/flush_icache.S              |   33 +-
> > >  arch/riscv/mm/Makefile                             |    1 +
> > >  arch/riscv/mm/cacheflush.c                         |    3 +-
> > >  arch/riscv/mm/context.c                            |    2 +-
> > >  arch/riscv/mm/dma-mapping.c                        |   53 +
> > >  arch/riscv/mm/init.c                               |   26 +
> > >  arch/riscv/mm/tlbflush.c                           |   57 +-
> > >  drivers/net/ethernet/Kconfig                       |    1 +
> > >  drivers/net/ethernet/Makefile                      |    1 +
> > >  drivers/net/ethernet/allwinnertmp/Kconfig          |   17 +
> > >  drivers/net/ethernet/allwinnertmp/Makefile         |    7 +
> > >  drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c |  690 ++++++
> > >  drivers/net/ethernet/allwinnertmp/sunxi-gmac.c     | 2240
> > >=20
> > > ++++++++++++++++++++ drivers/net/ethernet/allwinnertmp/sunxi-gmac.h  =
 =20
> > > |
> > > 258 +++
> > >=20
> > >  drivers/net/phy/realtek.c                          |    2 +-
> > >  mm/mmap.c                                          |    4 +
> > >  34 files changed, 3714 insertions(+), 37 deletions(-)
> > >  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
> > >  create mode 100644
> > >  arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> > >=20
> > > create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> > > create
> > > mode 100644 arch/riscv/mm/dma-mapping.c
> > >=20
> > >  create mode 100644 drivers/net/ethernet/allwinnertmp/Kconfig
> > >  create mode 100644 drivers/net/ethernet/allwinnertmp/Makefile
> > >  create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c
> > >  create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac.c
> > >  create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac.h




