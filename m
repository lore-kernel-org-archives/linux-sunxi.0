Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F14689
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 09:31:30 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qWvof-005FTE-52; Fri, 18 Aug 2023 17:30:50 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Aug 2023 17:30:49 +0800
Date: Fri, 18 Aug 2023 17:30:49 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Yue Haibing <yuehaibing@huawei.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH -next] crypto: allwinner - Remove unused function
 declarations
Message-ID: <ZN86SWHintk7Aga1@gondor.apana.org.au>
References: <20230809031443.39312-1-yuehaibing@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809031443.39312-1-yuehaibing@huawei.com>

On Wed, Aug 09, 2023 at 11:14:43AM +0800, Yue Haibing wrote:
> Commit 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
> declared but never implemented sun8i_ce_enqueue().
> Commit 56f6d5aee88d ("crypto: sun8i-ce - support hash algorithms")
> declared but never implemented sun8i_ce_hash().
> Commit f08fcced6d00 ("crypto: allwinner - Add sun8i-ss cryptographic offloader")
> declared but never implemented sun8i_ss_enqueue().
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h | 3 ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h | 2 --
>  2 files changed, 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
