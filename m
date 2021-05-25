Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52972FAE
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 12:28:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5CC3068AFE; Tue, 25 May 2021 14:28:09 +0200 (CEST)
Date: Tue, 25 May 2021 14:28:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de, hch@lst.de,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V3 1/2] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
Message-ID: <20210525122809.GA4842@lst.de>
References: <1621945447-38820-1-git-send-email-guoren@kernel.org> <1621945447-38820-2-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621945447-38820-2-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, May 25, 2021 at 12:24:06PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Kernel virtual address translation should avoid care asid or it'll

s/care aisd/to use ASIDs/ ?

> cause more TLB-miss and TLB-refill. Because the current asid in satp

s/asid/ASID/ ?

> belongs to the current process, but the target kernel va TLB entry's
> asid still belongs to the previous process.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>

Otherwise looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
