Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892A22C82
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Nov 2021 05:58:33 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
	id 1mqTpm-0008R7-9g; Fri, 26 Nov 2021 13:31:42 +0800
Received: from herbert by gondobar with local (Exim 4.92)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1mqTpi-0004Z1-TO; Fri, 26 Nov 2021 13:31:38 +0800
Date: Fri, 26 Nov 2021 13:31:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Samuel Holland <samuel@sholland.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] crypto: sun8i-ce: Add support for the D1 variant
Message-ID: <20211126053138.GC17477@gondor.apana.org.au>
References: <20211119051026.13049-1-samuel@sholland.org>
 <20211119051026.13049-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119051026.13049-2-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Nov 18, 2021 at 11:10:25PM -0600, Samuel Holland wrote:
> From: Corentin Labbe <clabbe.montjoie@gmail.com>
> 
> The Allwinner D1 SoC has a crypto engine compatible with sun8i-ce.
> Add support for it.
> 
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 21 +++++++++++++++++++
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  1 +
>  2 files changed, 22 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
