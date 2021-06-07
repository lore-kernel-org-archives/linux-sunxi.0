Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C43C70
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 06:19:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id BD91467373; Mon,  7 Jun 2021 08:19:18 +0200 (CEST)
Date: Mon, 7 Jun 2021 08:19:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
	arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
	drew@beagleboard.org, liush@allwinnertech.com, lazyparser@gmail.com,
	wefu@redhat.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 06/11] riscv: pgtable: Add DMA_COHERENT with
 custom PTE attributes
Message-ID: <20210607061918.GA24060@lst.de>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org> <1622970249-50770-10-git-send-email-guoren@kernel.org> <610849b6f66e8d5a9653c9f62f46c48d@mailhost.ics.forth.gr>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <610849b6f66e8d5a9653c9f62f46c48d@mailhost.ics.forth.gr>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, Jun 06, 2021 at 08:22:14PM +0300, Nick Kossifidis wrote:
> This patch violates the Privilege Spec section 4.4.1 that clearly states:
>
> "Bits63–54 are reserved for future standard use and must be zeroed by 
> software for forward compatibility"
>
> Standard use means that valid values can only be defined by the Priv. Spec, 
> not by the vendor (otherwise they'd be marked as "custom use" or "platform 
> use"), and since they "must" be zeroed by software we 'll be violating the 
> Privilege Spec if we do otherwise.

Yes, that is why I think it is a no-go.
