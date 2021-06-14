Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7872
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Jun 2021 17:51:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 827DE60FEA;
	Mon, 14 Jun 2021 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623693119;
	bh=w6yEl6RdNBce/fM+QwtQ8kaN8ZBcaj88bvIJYqQiqWE=;
	h=From:To:Cc:Subject:Date:From;
	b=CYV9czSkjRP4LdvMU9VxTMqEGCe5n1d/EBSjIvR9gHcyfwJuSRTkmVyYzxr0mPz6T
	 FIkdFELsy/LoTBt/VXXTgJwhKsOk+cUGUH4yXFcIOR4n3I3TzN8iLE7KIDNb85vGLl
	 W+ou9zfbWXYBzbPUnA+PStAK/B8qvyCt2O8SQDuOOFucnuWmHel8OcCBPIR7UhP0DV
	 mXMnXjNCSs1G9gkKBwsBkzsG292IZnCsxGDGikAyOjTvUgeuY9bxtQ/Ipb2QHQjVpy
	 LaxuWv6ITwYHAf8RY8ckaF4CYe4YehO5MntIA5z8cPL6sxLW0EI8ZJEJwiBX8+n6jz
	 rqN/opCt1ylLw==
From: guoren@kernel.org
To: guoren@kernel.org,
	anup.patel@wdc.com,
	palmerdabbelt@google.com,
	arnd@arndb.de,
	wens@csie.org,
	maxime@cerno.tech,
	drew@beagleboard.org,
	liush@allwinnertech.com,
	lazyparser@gmail.com,
	wefu@redhat.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	tech-virt-mem@lists.riscv.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH v3 0/2] riscv: pgtable: Add "PBMT" extension supported
Date: Mon, 14 Jun 2021 17:51:05 +0000
Message-Id: <1623693067-53886-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: Guo Ren <guoren@linux.alibaba.com>

These patches are a continuation of "riscv: Add DMA_COHERENT support for
Allwinner D1". Compared with the previous factory-defined hardware
implementation, it now follows the PBMT extension proposal.

V2: https://lore.kernel.org/linux-riscv/1622970249-50770-10-git-send-email-guoren@kernel.org/
V1: https://lore.kernel.org/linux-riscv/1621400656-25678-3-git-send-email-guoren@kernel.org/

Changes since v2:
 - Change to PBMT extension proposal
 - Add pbmt in dts
 - Using img hdr for custom memory types moification

Changes since v1:
 - Rebase on linux-5.13-rc4
 - Support defconfig for different PTE attributes

Guo Ren (2):
  riscv: pgtable: Add custom protection_map init
  riscv: pgtable: Add "PBMT" extension supported

 arch/riscv/Kconfig                    |  4 +++
 arch/riscv/include/asm/image.h        |  6 ++--
 arch/riscv/include/asm/pgtable-64.h   |  8 +++--
 arch/riscv/include/asm/pgtable-bits.h | 55 ++++++++++++++++++++++++++--
 arch/riscv/include/asm/pgtable.h      | 17 ++++-----
 arch/riscv/kernel/head.S              |  6 ++++
 arch/riscv/mm/init.c                  | 68 +++++++++++++++++++++++++++++++++++
 mm/mmap.c                             |  4 +++
 8 files changed, 149 insertions(+), 19 deletions(-)

-- 
2.7.4

