Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ADD72
	for <linux-sunxi@lists.linux.dev>; Wed, 19 May 2021 05:20:58 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2DEDA67373; Wed, 19 May 2021 07:20:49 +0200 (CEST)
Date: Wed, 19 May 2021 07:20:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, drew@beagleboard.org,
	hch@lst.de, wefu@redhat.com, lazyparser@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519052048.GA24853@lst.de>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621400656-25678-1-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 19, 2021 at 05:04:13AM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
> vendors define the custom properties of memory regions in PTE.

Err, hell no.   The ISA needs to gets this fixed first.  Then we can
talk about alternatives patching things in or trapping in the SBI.
But if the RISC-V ISA can't get these basic done after years we can't
support it in Linux at all.
