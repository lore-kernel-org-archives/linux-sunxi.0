Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3A2FAE
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 12:24:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CD1A6141B;
	Tue, 25 May 2021 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621945498;
	bh=AVRcXtmLCIJi5XnfF9tb6jrsuH0Q2wdP15ACb5u8w4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FNVZJPsAfA0x+sFfdIgWJpH5zJUF9ZI3f8G+JqF8Clw0aTgpe7lfMii+hnfCs380m
	 vBVhYRR2d92eAYpPpdArfOTXlsVdVKiEVdR7XlJQs1EuxuVLZKDsNRWu2V9Ar8wfmo
	 VcYLVAynxBlirnakLIu8NoIMbWevMeXZt/nSHIWlTVlytka5JXQjPuhQJ+xg7HorA/
	 jOdex5EFDmLXlY315GRXyRYmZOwcYjqt0oRuqblQ/5W39yxx67Kww35MqXJPMBDE4Z
	 LxhWiWxSYRKpGAwgbznwFvKVreBJrIcW6KNvKhW/hrLOT61v/Yae4TniFfYAvqXbXk
	 T7KmuY3i0Nrxg==
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
Subject: [PATCH V3 1/2] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
Date: Tue, 25 May 2021 12:24:06 +0000
Message-Id: <1621945447-38820-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621945447-38820-1-git-send-email-guoren@kernel.org>
References: <1621945447-38820-1-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: Guo Ren <guoren@linux.alibaba.com>

Kernel virtual address translation should avoid care asid or it'll
cause more TLB-miss and TLB-refill. Because the current asid in satp
belongs to the current process, but the target kernel va TLB entry's
asid still belongs to the previous process.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
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

