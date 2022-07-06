Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7504833C6
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Jul 2022 11:58:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A49B868AA6; Wed,  6 Jul 2022 13:58:07 +0200 (CEST)
Date: Wed, 6 Jul 2022 13:58:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Christoph Hellwig <hch@lst.de>, LABBE Corentin <clabbe@baylibre.com>,
	herbert@gondor.apana.org.au, heiko@sntech.de,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <20220706115807.GA16222@lst.de>
References: <20220701132735.1594822-1-clabbe@baylibre.com> <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk> <YsP0eekTthD4jWGV@Red> <20220705164213.GA14484@lst.de> <ec401a51-5895-fce7-1075-a2c964466d2b@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec401a51-5895-fce7-1075-a2c964466d2b@codethink.co.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jul 06, 2022 at 10:47:24AM +0100, Ben Dooks wrote:
> I'm not sure that the dma-mapping code for non-coherent riscv systems
> did get sorted. I couldn't find any when looking in 5.17.

Yes, none of that is upstream.  But as supporting it is essential for
the allwinner SOCs I'm pretty sure Corentin is not actually using an
upstream kernel anyway.
