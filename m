Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFD072
	for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 04:54:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4499611AE;
	Sun, 30 May 2021 04:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622350464;
	bh=GkThTms33HMIKQO6b4SaeQi3+r70EMZPQhD7XOMYSa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R+8pw7pfX1Bw/7vR9PVJ5quXPDC++4xVfnCDm9Z22XgRP76X0UiWSFioceOfUvsh2
	 nerdYLMpw0ugG0bR6QkVghQ39aUcBNmRf9xcymBLUEH+j/nlVy8V4+FBppjEruS+/P
	 aQ4SBqXpIqTbZLhbfwyX3u7jel+HVnXPPl0ezufIkVWA790ppbWfntetP38q+AnhjP
	 pQwAstutgkt0bqnWrCOlAnt44lMQUucHW2mMPO0Lzhz1v+7MCkByAyljXqhV0x4FQx
	 3Wi+LKPTsa6F+piFyg58UA7Tv+gTicu8vF34LW16fowlJfIduR8+4yYcwAtz5BlqTF
	 fWAu8La1iwgwg==
From: guoren@kernel.org
To: guoren@kernel.org,
	anup.patel@wdc.com,
	palmerdabbelt@google.com,
	arnd@arndb.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Guo Ren <guoren@linux.alibaba.com>,
	Michal Simek <monstr@monstr.eu>
Subject: [PATCH V2 2/2] microblaze: Cleanup unused functions
Date: Sun, 30 May 2021 04:53:28 +0000
Message-Id: <1622350408-44875-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622350408-44875-1-git-send-email-guoren@kernel.org>
References: <1622350408-44875-1-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: Guo Ren <guoren@linux.alibaba.com>

These functions haven't been used, so just remove them. The patch
just uses grep to verify.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Simek <monstr@monstr.eu>
---
 arch/microblaze/include/asm/page.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
index bf681f2..ce55097 100644
--- a/arch/microblaze/include/asm/page.h
+++ b/arch/microblaze/include/asm/page.h
@@ -35,9 +35,6 @@
 
 #define ARCH_SLAB_MINALIGN	L1_CACHE_BYTES
 
-#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
-#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
-
 /*
  * PAGE_OFFSET -- the first address of the first page of memory. With MMU
  * it is set to the kernel start address (aligned on a page boundary).
-- 
2.7.4

