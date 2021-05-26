Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0371B2F80
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 05:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93CA1613F6;
	Wed, 26 May 2021 05:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622008209;
	bh=inTZKABnBrUQ84H4gADlk73DnbiHL4nyjoNWVqTyW0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQvJYjozsY+wiG56YStah9peEx+ppXBeI/guU6j0EpYckdBAU0TPLT2PxyKsMAsV5
	 5jH49GETghaDZhrwJAFsLSlSMK7TNWJYYKlOweCbKjkBMgBOW2gpgSYTxwv208pTH0
	 9vwSp3oPFMPWyeEr/fAcesWRZF5TwmhWJmpFBWSFOBtD0MWaSgPZnVZN+HdWV6UoQK
	 PzKxKC4L3umMW1z4nxyTk/o7SkvijnO5RJKn1fZRj6cQF2txPlvgFWysJYq/T4gOKs
	 6aupWYLToU7ljMwYgEARhnviMx1EX6DUfyNPH0Lgt4K7WpCBxgkZH7NcDkmg1/PtjI
	 TWOOwcbx1zu6w==
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
Subject: [PATCH V4 1/2] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
Date: Wed, 26 May 2021 05:49:20 +0000
Message-Id: <1622008161-41451-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622008161-41451-1-git-send-email-guoren@kernel.org>
References: <1622008161-41451-1-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: Guo Ren <guoren@linux.alibaba.com>

Kernel virtual address translation should avoid to use ASIDs or it'll
cause more TLB-miss and TLB-refill. Because the current ASID in satp
belongs to the current process, but the target kernel va TLB entry's
ASID still belongs to the previous process.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9469f46..346a3c6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -134,7 +134,8 @@
 				| _PAGE_WRITE \
 				| _PAGE_PRESENT \
 				| _PAGE_ACCESSED \
-				| _PAGE_DIRTY)
+				| _PAGE_DIRTY \
+				| _PAGE_GLOBAL)
 
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
 #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
-- 
2.7.4

