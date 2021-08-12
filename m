Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0670
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Aug 2021 10:28:31 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
	id 1mE7Zz-0002tI-K9; Thu, 12 Aug 2021 18:04:51 +0800
Received: from herbert by gondobar with local (Exim 4.92)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1mE7Zl-0001K7-WA; Thu, 12 Aug 2021 18:04:38 +0800
Date: Thu, 12 Aug 2021 18:04:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: sun8i-ce: fix multiple memory leaks in
 sun8i_ce_hash_run
Message-ID: <20210812100437.GA5055@gondor.apana.org.au>
References: <20210803063149.2821093-1-mudongliangabcd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803063149.2821093-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Aug 03, 2021 at 02:31:38PM +0800, Dongliang Mu wrote:
>
> -theend:
> -	kfree(buf);
> +err_result:
>  	kfree(result);
> -	crypto_finalize_hash_request(engine, breq, err);
> +err_buf:
> +	kfree(buf);
> +out:
> +	if (!err)
> +		crypto_finalize_hash_request(engine, breq, err);
>  	return 0;

This does not look right.  You're returning zero in case of an error

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
