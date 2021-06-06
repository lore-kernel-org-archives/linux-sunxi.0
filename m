Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B603470
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jun 2021 14:39:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 774BC68AFE; Sun,  6 Jun 2021 16:39:41 +0200 (CEST)
Date: Sun, 6 Jun 2021 16:39:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de,
	wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
	liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Guo Ren <guoren@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 06/11] riscv: pgtable: Add DMA_COHERENT with
 custom PTE attributes
Message-ID: <20210606143941.GA6032@lst.de>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org> <1622970249-50770-10-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622970249-50770-10-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

NAK, no SOC must ever mess with pagetable attributes.
