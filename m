Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381FA628
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Jan 2023 04:08:21 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pGB6E-00H55C-R8; Fri, 13 Jan 2023 11:51:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jan 2023 11:51:26 +0800
Date: Fri, 13 Jan 2023 11:51:26 +0800
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
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: sun8i-ce: Add compatible for
 D1
Message-ID: <Y8DVPvnfShdhlVHh@gondor.apana.org.au>
References: <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231220146.646-2-samuel@sholland.org>

On Sat, Dec 31, 2022 at 04:01:43PM -0600, Samuel Holland wrote:
> D1 has a crypto engine similar to the one in other Allwinner SoCs.
> Like H6, it has a separate MBUS clock gate.
> 
> It also requires the internal RC oscillator to be enabled for the TRNG
> to return data, presumably because noise from the oscillator is used as
> an entropy source. This is likely the case for earlier variants as well,
> but it really only matters for H616 and newer SoCs, as H6 provides no
> way to disable the internal oscillator.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> I noticed that the vendor driver has code to explicitly enable IOSC when
> using the TRNG on A83T (search SS_TRNG_OSC_ADDR), but that is covered by
> a different binding/driver in mainline.
> 
> Changes in v2:
>  - Add TRNG clock
> 
>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 33 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 8 deletions(-)

This doesn't have an ack from Rob Herring.  Would you like me
to apply just the crypto patch by itself?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
