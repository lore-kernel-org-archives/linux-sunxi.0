Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E43717F
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l76PMWwpyUywZLSPQWxlVCkV0Gpx/Lj+papEoZT+usU=; b=nxMsfjJ56nJZsedt7pMMtsU2dQ
	s66X+UHTPW9Pvr0NZFeGrpkRebz0bVJXAj3WwNMKN4BMYNNtm7QF8q/k4gireJ5A1/O0yIe6iHpf1
	fNaEzyiT88Zio+afVonMcWw4AacHG94txCxY8e/BB9s3e1x99e5jtgaj80W/Ly5hGzqijngVgbn+4
	Gquox9i4ezhDsq0BG2/77r09PwciTdFQ3Ma19fsTqnkX2Nr3pZycMg5b37lefHHng7Hcrc0EWOx2M
	8eGIQQZ7JSsIPBCKMVMGQocha9Qv9qyzoDZPY6OJi4N8Z7ub+8+en2hmHKdgDcv8EX7Z5wBr9PUTx
	P+dJps9A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1llQeB-003C3l-RS; Tue, 25 May 2021 06:34:41 +0000
Date: Tue, 25 May 2021 07:34:35 +0100
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 2/3] riscv: Fixup PAGE_UP in asm/page.h
Message-ID: <YKyae+8O25A8vxMS@infradead.org>
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
 <1621839068-31738-2-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621839068-31738-2-git-send-email-guoren@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Mon, May 24, 2021 at 06:51:07AM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Current PAGE_UP implementation is wrong. PAGE_UP(0) should be
> 0x1000, but current implementation will give out 0.
> 
> Although the current PAGE_UP isn't used, it will soon be used in
> tlb_flush optimization.

Nak.  Please just remove the PAGE_UP/PAGE_DOWN macros just like they
have been removed from other architectures long ago and use the
generic DIV_ROUND_UP macro for your new code like everyone else.
