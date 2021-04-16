Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6029CA
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Apr 2021 11:52:07 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1lXMhI-0003Rk-B3; Fri, 16 Apr 2021 21:31:41 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 16 Apr 2021 21:31:40 +1000
Date: Fri, 16 Apr 2021 21:31:40 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Shixin Liu <liushixin2@huawei.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next 1/7] crypto: sun4i-ss - Fix PM reference leak when
 pm_runtime_get_sync() fails
Message-ID: <20210416113140.GI16633@gondor.apana.org.au>
References: <20210408071831.836638-1-liushixin2@huawei.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408071831.836638-1-liushixin2@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 08, 2021 at 03:18:31PM +0800, Shixin Liu wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Signed-off-by: Shixin Liu <liushixin2@huawei.com>
> ---
>  drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c | 2 +-
>  drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c   | 2 +-
>  drivers/crypto/allwinner/sun4i-ss/sun4i-ss-hash.c   | 2 +-
>  drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
