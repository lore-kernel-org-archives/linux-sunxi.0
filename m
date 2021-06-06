Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A5E70
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jun 2021 09:05:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFA9B61420;
	Sun,  6 Jun 2021 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622970306;
	bh=0HrILH6BshJfMkD9I3tL+9zxsVQ6ho2ivjftGmjwtWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N90/WwTU6WhPC9U30UcYf27IOC8d5m4doJgaeeestAHAmvIyOstbJz4mT2f/rA6R/
	 f15t/Reh0HGQdFq/dg9McimNK5kLvkglPUtnx1ZPQ96cBWw5NaRyky6154M2iTheSa
	 4rUwMx1MVZWpenz8Y8jbErI/+cIYQ98zklcOEdJ0CKQS7DLve+9ibPumgvhKoZmuRc
	 P6APOvW6oj6YVi/GpZSlzOpXdS/yM+E0NwzzsvobAb1UjEgxb+H6fOXGxT4eIuTaog
	 CM8/slp3fgrHYRrj5ss5okLE/6dl2OZfxpnvJ5jYhBS3tBFE5M7tHeCyycL+nNFVan
	 YWGafNt2GPEsQ==
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
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 1/3] riscv: Use global mappings for kernel pages
Date: Sun,  6 Jun 2021 09:03:57 +0000
Message-Id: <1622970249-50770-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622970249-50770-1-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: Guo Ren <guoren@linux.alibaba.com>

We map kernel pages into all addresses space, so they can be marked as
global. This allows hardware to avoid flushing the kernel mappings when
moving between address spaces.

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

