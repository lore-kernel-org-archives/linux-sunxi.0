Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCDC7C
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jun 2022 09:27:04 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1nzaif-005MTJ-FD; Fri, 10 Jun 2022 19:14:18 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 10 Jun 2022 17:14:17 +0800
Date: Fri, 10 Jun 2022 17:14:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-crypto@vger.kernel.org,
	linux-sunxi@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss - Fix error codes for
 dma_mapping_error()
Message-ID: <YqMLabu/Xtf2nGxq@gondor.apana.org.au>
References: <YoUuAsJndw7aLn+S@kili>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoUuAsJndw7aLn+S@kili>

On Wed, May 18, 2022 at 08:33:54PM +0300, Dan Carpenter wrote:
> If there is a dma_mapping_error() then return negative error codes.
> Currently this code returns success.
> 
> Fixes: 801b7d572c0a ("crypto: sun8i-ss - add hmac(sha1)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
