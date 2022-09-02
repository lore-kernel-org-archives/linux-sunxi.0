Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B8B111E
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Sep 2022 10:55:55 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oU3ku-000Kds-Rx; Fri, 02 Sep 2022 20:18:33 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 02 Sep 2022 18:18:32 +0800
Date: Fri, 2 Sep 2022 18:18:32 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jack Wang <jinpu.wang@ionos.com>
Cc: linux-crypto@vger.kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Minghao Chi <chi.minghao@zte.com.cn>, Peng Wu <wupeng58@huawei.com>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] crypto: allwinner: Fix dma_map_sg error check
Message-ID: <YxHYeCSwfAEgMngX@gondor.apana.org.au>
References: <20220825072421.29020-1-jinpu.wang@ionos.com>
 <20220825072421.29020-6-jinpu.wang@ionos.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825072421.29020-6-jinpu.wang@ionos.com>

On Thu, Aug 25, 2022 at 09:24:20AM +0200, Jack Wang wrote:
> dma_map_sg return 0 on error.
> 
> Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Minghao Chi <chi.minghao@zte.com.cn>
> Cc: Peng Wu <wupeng58@huawei.com>
> Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
> Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 6 +++---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 +-
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 4 ++--
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c   | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index 74b4e910a38d..be7f46faef7e 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -208,7 +208,7 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
>  
>  	if (areq->src == areq->dst) {
>  		nr_sgs = dma_map_sg(ce->dev, areq->src, ns, DMA_BIDIRECTIONAL);
> -		if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
> +		if (!nr_sgs || nr_sgs > MAX_SG) {

This is also less robust than the original code and I'll be
reverting it.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
