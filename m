Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735C72
	for <linux-sunxi@lists.linux.dev>; Wed, 19 May 2021 06:06:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CC0B767373; Wed, 19 May 2021 08:06:17 +0200 (CEST)
Date: Wed, 19 May 2021 08:06:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>,
	Palmer Dabbelt <palmerdabbelt@google.com>, drew@beagleboard.org,
	wefu@redhat.com, lazyparser@gmail.com,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519060617.GA28397@lst.de>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org> <20210519052048.GA24853@lst.de> <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
> Since the existing RISC-V ISA cannot solve this problem, it is better
> to provide some configuration for the SOC vendor to customize.

We've been talking about this problem for close to five years.  So no,
if you don't manage to get the feature into the ISA it can't be
supported.
