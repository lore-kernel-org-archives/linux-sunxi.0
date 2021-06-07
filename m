Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5011D70
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 06:51:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2A62B67373; Mon,  7 Jun 2021 08:51:09 +0200 (CEST)
Date: Mon, 7 Jun 2021 08:51:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Nick Kossifidis <mick@ics.forth.gr>,
	Drew Fustini <drew@beagleboard.org>,
	Anup Patel <anup.patel@wdc.com>,
	Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
	Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Benjamin Koch <snowball@c3pb.de>,
	Matteo Croce <mcroce@linux.microsoft.com>,
	Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210607065108.GA24872@lst.de>
References: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com> <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de> <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com> <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr> <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com> <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr> <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com> <20210607062701.GB24060@lst.de> <CAJF2gTRZuER5YbTD=0xWLU0Np6eD8L_z3rZH0i_WXgENUD3nbQ@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJF2gTRZuER5YbTD=0xWLU0Np6eD8L_z3rZH0i_WXgENUD3nbQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 07, 2021 at 02:41:14PM +0800, Guo Ren wrote:
> Double/Triple the size of physical memory regions can't be accepted by
> SOC vendors, because it wastes HW resources.
> Some cost-down soc interconnects only have 32bit~34bit width of
> physical address, are you sure you could force them to expand it? (I
> can't)
> 
> > or somewhat dynamic.
> How can HW implement with dynamic modifying PMA? What's the granularity?

I'm just stating the requirements from the Linux DMA perspective.  You
also do not need tripple the address space, just double.
