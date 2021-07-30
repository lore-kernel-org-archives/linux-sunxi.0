Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBAF3483
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Jul 2021 03:30:06 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
	id 1m9Iv0-0000f3-Gp; Fri, 30 Jul 2021 11:10:38 +0800
Received: from herbert by gondobar with local (Exim 4.92)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1m9Iuv-0003BC-GZ; Fri, 30 Jul 2021 11:10:33 +0800
Date: Fri, 30 Jul 2021 11:10:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jason Wang <wangborong@cdjrlc.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net, mripard@kernel.org,
	wens@csie.org, jernej.skrabec@gmail.com, colin.king@canonical.com,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss - Use kfree_sensitive
Message-ID: <20210730031033.GC12121@gondor.apana.org.au>
References: <20210720130104.42867-1-wangborong@cdjrlc.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720130104.42867-1-wangborong@cdjrlc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jul 20, 2021 at 09:01:04PM +0800, Jason Wang wrote:
> The kfree_sensitive is a kernel API to clear sensitive information
> that should not be leaked to other future users of the same memory
> objects and free the memory. Its function is the same as the
> combination of memzero_explicit and kfree. Thus, we can replace the
> combination APIs with the single kfree_sensitive API.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
