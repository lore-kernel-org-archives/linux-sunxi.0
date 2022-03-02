Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0246153
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Mar 2022 23:31:51 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1nPXvM-0006CD-2F; Thu, 03 Mar 2022 09:58:25 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Thu, 03 Mar 2022 10:58:24 +1200
Date: Thu, 3 Mar 2022 10:58:23 +1200
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: jernej.skrabec@gmail.com, linus.walleij@linaro.org,
	narmstrong@baylibre.com, ulli.kroll@googlemail.com, wens@csie.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/5] crypto: completion should be ran with BH disabled
Message-ID: <Yh/2j+hxUs/+1BXB@gondor.apana.org.au>
References: <20220221120833.2618733-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221120833.2618733-1-clabbe@baylibre.com>

On Mon, Feb 21, 2022 at 12:08:28PM +0000, Corentin Labbe wrote:
> Hello
> 
> This is the follow up of https://lore.kernel.org/lkml/Yd1SIHUNdLIvKhzz@Red/
> and https://patchwork.kernel.org/project/linux-crypto/patch/20220127133332.4011509-1-clabbe@baylibre.com/
> This serie fix all drivers which do not call completion with BH disabled
> and add the check in crypto/engine asked by Herbert.
> I have verified that this check does not generate warnings on all other crypto
> hardware I got (omap, ccree, rockchip)
> 
> Regards
> 
> Corentin Labbe (5):
>   crypto: sun8i-ss: call finalize with bh disabled
>   crypto: sun8i-ce: call finalize with bh disabled
>   crypto: amlogic: call finalize with bh disabled
>   crypto: gemini: call finalize with bh disabled
>   crypto: engine: check if BH is disabled during completion
> 
>  crypto/crypto_engine.c                              | 1 +
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 +++
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 3 +++
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 3 +++
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c   | 3 +++
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c         | 2 ++
>  drivers/crypto/gemini/sl3516-ce-cipher.c            | 2 ++
>  7 files changed, 17 insertions(+)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
