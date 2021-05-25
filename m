Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7EE2FAE
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 12:22:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9D8596736F; Tue, 25 May 2021 14:22:24 +0200 (CEST)
Date: Tue, 25 May 2021 14:22:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de, hch@lst.de,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Guo Ren <guoren@linux.alibaba.com>, Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] arch: Cleanup unused functions
Message-ID: <20210525122224.GA4474@lst.de>
References: <1621945234-37878-1-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621945234-37878-1-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, May 25, 2021 at 12:20:34PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> These functions haven't been used, so just remove them. The patch
> has been tested with riscv, but I only use grep to check the
> microblaze's.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
