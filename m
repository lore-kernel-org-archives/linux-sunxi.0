Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73AC72
	for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 04:54:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 562836102A;
	Sun, 30 May 2021 04:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622350460;
	bh=8j+beZJ0vT46mk9agllfdVUQIeq9LdNVKMDsT+pMEyM=;
	h=From:To:Cc:Subject:Date:From;
	b=dGK9IodYmYsvRq6EdXsOx0R9PtXpqZGztRk5dWD9VL1jwIKUg6X5uR2wEpriiLlJr
	 4x5AtcaEd4lzQSygyjwrocwEFeJ9i2BYGLJH6CQzMXn4GB5lAfHZdxvudJWbj5q11N
	 wsRaCWCX3uXt+wuvYCS9ioBp8VOdRi3q2tl+HtgZ3+IGORcFpyfSuNPRR12fsnCAV0
	 cF+2aZJ5ClCdeSjw/i4qrxpMCR5UtOXzk8ovPhmfIx4GC6mH0b8xlhxVBztqNfOxo1
	 0wsA2+W4I8H7fLxg2YZCrvLtq3cc2nT6d9TI1CyaKZylLOBS63ZkL3pyN8cog+KdU5
	 Gqg1vdkMernRw==
From: guoren@kernel.org
To: guoren@kernel.org,
	anup.patel@wdc.com,
	palmerdabbelt@google.com,
	arnd@arndb.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/2] arch: Cleanup unused functions
Date: Sun, 30 May 2021 04:53:26 +0000
Message-Id: <1622350408-44875-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: Guo Ren <guoren@linux.alibaba.com>

These functions haven't been used, so just remove them. The patch
has been tested with riscv, but I only use grep to check the
microblaze's.

Changes since v1:
 - Separate into two patches
 - Add Reviewed-by & Acked-by

Guo Ren (2):
  riscv: Cleanup unused functions
  microblaze: Cleanup unused functions

 arch/microblaze/include/asm/page.h |  3 ---
 arch/riscv/include/asm/page.h      | 10 ----------
 2 files changed, 13 deletions(-)

-- 
2.7.4

