Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5261815AC
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Apr 2023 10:46:47 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1psKyb-003E2l-EJ; Fri, 28 Apr 2023 18:05:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 28 Apr 2023 18:05:18 +0800
Date: Fri, 28 Apr 2023 18:05:18 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] crypto: sun8i-ss - Fix a test in sun8i_ss_setup_ivs()
Message-ID: <ZEuaXi5LCCSYa/ll@gondor.apana.org.au>
References: <bedaeefc8e2099ab255e7542e7d671889678de86.1681763086.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bedaeefc8e2099ab255e7542e7d671889678de86.1681763086.git.christophe.jaillet@wanadoo.fr>

On Mon, Apr 17, 2023 at 10:25:09PM +0200, Christophe JAILLET wrote:
> SS_ENCRYPTION is (0 << 7 = 0), so the test can never be true.
> Use a direct comparison to SS_ENCRYPTION instead.
> 
> The same king of test is already done the same way in sun8i_ss_run_task().
> 
> Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Untested
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
