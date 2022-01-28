Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397C629CA
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Jan 2022 06:59:38 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1nDKgp-00014U-8l; Fri, 28 Jan 2022 17:24:56 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 28 Jan 2022 17:24:55 +1100
Date: Fri, 28 Jan 2022 17:24:55 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: davem@davemloft.net, jernej.skrabec@gmail.com, mripard@kernel.org,
	wens@csie.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] crypto: sun8i-ss: really disable hash on A80
Message-ID: <YfOMNy1kiI4gvePu@gondor.apana.org.au>
References: <20220115100714.3016838-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220115100714.3016838-1-clabbe@baylibre.com>

On Sat, Jan 15, 2022 at 10:07:14AM +0000, Corentin Labbe wrote:
> When adding hashes support to sun8i-ss, I have added them only on A83T.
> But I forgot that 0 is a valid algorithm ID, so hashes are enabled on A80 but
> with an incorrect ID.
> Anyway, even with correct IDs, hashes do not work on A80 and I cannot
> find why.
> So let's disable all of them on A80.
> 
> Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 2 ++
>  1 file changed, 2 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
