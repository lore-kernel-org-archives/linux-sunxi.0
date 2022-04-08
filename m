Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7263623
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Apr 2022 08:57:14 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1ncjul-000S71-SA; Fri, 08 Apr 2022 18:24:21 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 08 Apr 2022 16:24:20 +0800
Date: Fri, 8 Apr 2022 16:24:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, wens@csie.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	clabbe@baylibre.com
Subject: Re: [PATCH 00/19] crypto: allwinner: lots of fixes
Message-ID: <Yk/xNIjjINj9Hvki@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317205605.3924836-1-clabbe@baylibre.com>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel

Corentin Labbe <clabbe@baylibre.com> wrote:
> Hello
> 
> This series is all fixes which I found on allwinner crypto drivers.

This doesn't compile cleanly with sparse.  Please fix and resubmit.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
