Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD25C7C
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jun 2022 09:17:12 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1nzalN-005MgJ-Nu; Fri, 10 Jun 2022 19:17:07 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 10 Jun 2022 17:17:06 +0800
Date: Fri, 10 Jun 2022 17:17:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Peng Wu <wupeng58@huawei.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	liwei391@huawei.com
Subject: Re: [PATCH] crypto: sun8i-ss - fix a NULL vs IS_ERR() check in
 sun8i_ss_hashkey
Message-ID: <YqMMEsIDhqKcZmhr@gondor.apana.org.au>
References: <20220602072234.54593-1-wupeng58@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602072234.54593-1-wupeng58@huawei.com>

On Thu, Jun 02, 2022 at 07:22:34AM +0000, Peng Wu wrote:
> The crypto_alloc_shash() function never returns NULL. It returns error
> pointers.
> 
> Fixes: 801b7d572c0a ("crypto: sun8i-ss - add hmac(sha1)")
> Signed-off-by: Peng Wu <wupeng58@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
