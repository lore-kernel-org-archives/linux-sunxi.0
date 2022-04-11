Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960810EC
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 07:40:52 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1ndoey-001IZv-1k; Mon, 11 Apr 2022 17:40:29 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Mon, 11 Apr 2022 15:40:28 +0800
Date: Mon, 11 Apr 2022 15:40:28 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: LABBE Corentin <clabbe@baylibre.com>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, wens@csie.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 00/19] crypto: allwinner: lots of fixes
Message-ID: <YlPbbM7RurahUMn/@gondor.apana.org.au>
References: <20220317205605.3924836-1-clabbe@baylibre.com>
 <Yk/xNIjjINj9Hvki@gondor.apana.org.au>
 <YlPasmjElADX+7u5@Red>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlPasmjElADX+7u5@Red>

On Mon, Apr 11, 2022 at 09:37:22AM +0200, LABBE Corentin wrote:
>
> Coul you give me more details ?
> I do not have any sparse error.

Did you compile with C=1? Anyway, for a start hash_pad is broken as
it tries to store an le32 value into a u32.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
