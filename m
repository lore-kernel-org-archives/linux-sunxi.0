Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4357EC
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Jan 2023 08:40:33 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pGFbi-00HA2b-73; Fri, 13 Jan 2023 16:40:15 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jan 2023 16:40:14 +0800
Date: Fri, 13 Jan 2023 16:40:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Samuel Holland <samuel@sholland.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/3] crypto: Allwinner D1 crypto support
Message-ID: <Y8EY7kALf8bYNwov@gondor.apana.org.au>
References: <20221231220146.646-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231220146.646-1-samuel@sholland.org>

On Sat, Dec 31, 2022 at 04:01:42PM -0600, Samuel Holland wrote:
> This series finishes adding crypto support for the Allwinner D1 SoC. The
> driver patch from v1 was merged, but not the binding[1]. This turned out
> to be a good thing, because I later found that the TRNG needed another
> clock reference in the devicetree. That is fixed in v2. I include the DT
> update here too, since the SoC DT has been on the list for a while[2].
> 
> [1]: https://lore.kernel.org/all/20211119051026.13049-1-samuel@sholland.org/T/
> [2]: https://lore.kernel.org/lkml/20221208090237.20572-1-samuel@sholland.org/
> 
> Changes in v2:
>  - Add TRNG clock
> 
> Samuel Holland (3):
>   dt-bindings: crypto: sun8i-ce: Add compatible for D1
>   crypto: sun8i-ce - Add TRNG clock to the D1 variant
>   riscv: dts: allwinner: d1: Add crypto engine node
> 
>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 33 ++++++++++++++-----
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 12 +++++++
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  1 +
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  2 +-
>  4 files changed, 39 insertions(+), 9 deletions(-)
> 
> -- 
> 2.37.4

Patches 1-2 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
