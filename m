Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E3A2FAD
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 05:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E67EC610FA;
	Wed, 26 May 2021 05:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622008207;
	bh=yg8uTrr5bqsFHycHlXp37eTENi2y2zpYczTQ5Z9dzMo=;
	h=From:To:Cc:Subject:Date:From;
	b=EK6P9VU0nqF+SfGzh9yMPK4b23HaXiiD4pfBwQHmfB3JJM3pKD7bgr3tQ8KlkVE1u
	 53h3xtq2ncsP8wTuN/tRlMrVplN8GNa3NQCD5jiyr8QBaKth4MJWo685JzbL0CCMk5
	 jl0IQwkpOuWSWygGUwj6/RrE5bRnKcZBV0iAL79+5ezzZuq44P5k5oS22o6lHJx4dl
	 5KiLoyXgvus7uB+WowOU7I8JaJen/S/T8FOfQxNOHxQJrCf0i9muqAtAenNUe7lBoQ
	 vSgKPXKmV4H7zdP3ZKJ9h7WRNEvNsRofebeLKYMBSY8NxTeV+VBK96zmBETW/GJCNv
	 SPIO2IQo4bCPQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	anup.patel@wdc.com,
	palmerdabbelt@google.com,
	arnd@arndb.de,
	hch@lst.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 0/2] riscv: Fixup asid_allocator remaining issues
Date: Wed, 26 May 2021 05:49:19 +0000
Message-Id: <1622008161-41451-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: Guo Ren <guoren@linux.alibaba.com>

The patchset fixes the remaining problems of asid_allocator.
 - Fixup _PAGE_GLOBAL for kernel virtual address mapping
 - Optimize tlb_flush with asid & range

Changes since v3:
 - Optimize coding convention for
   "riscv: Use use_asid_allocator flush TLB"

Changes since v2:
 - Remove PAGE_UP/DOWN usage in tlbflush.h
 - Optimize variable name

Changes since v1:
 - Drop PAGE_UP wrong fixup
 - Rebase on clean linux-5.13-rc2
 - Add Reviewed-by

Guo Ren (2):
  riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
  riscv: Use use_asid_allocator flush TLB

 arch/riscv/include/asm/mmu_context.h |  2 ++
 arch/riscv/include/asm/pgtable.h     |  3 ++-
 arch/riscv/include/asm/tlbflush.h    | 23 ++++++++++++++++++
 arch/riscv/mm/context.c              |  2 +-
 arch/riscv/mm/tlbflush.c             | 46 +++++++++++++++++++++++++++++++++---
 5 files changed, 71 insertions(+), 5 deletions(-)

-- 
2.7.4

