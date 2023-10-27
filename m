Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91F18631
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Oct 2023 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qwKTD-00BeWq-N9; Fri, 27 Oct 2023 18:53:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 27 Oct 2023 18:53:45 +0800
Date: Fri, 27 Oct 2023 18:53:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, kernel@pengutronix.de,
	Yu Zhe <yuzhe@nfschina.com>, Corentin Labbe <clabbe@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>, linux-arm-kernel@axis.com,
	Arnd Bergmann <arnd@arndb.de>,
	Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Weili Qian <qianweili@huawei.com>,
	Antoine Tenart <atenart@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Prabhjot Khurana <prabhjot.khurana@intel.com>,
	Mark Gross <mgross@linux.intel.com>,
	Declan Murphy <declan.murphy@intel.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team 
Subject: Re: [PATCH 00/42] crypto: Convert to platform remove callback
 returning void
Message-ID: <ZTuWuZuNIE28O+4+@gondor.apana.org.au>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>

On Fri, Oct 20, 2023 at 09:55:22AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/crypto to use
> .remove_new(). Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver
> core doesn't (and cannot) cope for errors during remove. The only effect
> of a non-zero return value in .remove() is that the driver core emits a
> warning. The device is removed anyhow and an early return from .remove()
> usually yields resource leaks and/or use-after-free bugs.
> 
> There are three drivers that got that wrong and potentially returned an
> error code (caam/jr.c, stm32/stm32-crc32.c, stm32/stm32-cryp.c). These
> are fixed accordingly. The other drivers could be transformed trivially.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> There are no interdependencies in this series. As there are still quite
> a few drivers to convert, I'm happy about every patch that makes it in.
> So even if there is a merge conflict with one patch until you apply (or
> a different concern that doesn't apply to all patches), please apply the
> remainder of this series anyhow. I'll come back to the part that you
> (maybe) skipped at a later point.
> 
> Best regards and thanks
> Uwe
> 
> Uwe Kleine-König (42):
>   crypto: sun4i-ss - Convert to platform remove callback returning void
>   crypto: sun8i-ce - Convert to platform remove callback returning void
>   crypto: sun8i-ss - Convert to platform remove callback returning void
>   crypto: amcc/crypto4xx - Convert to platform remove callback returning void
>   crypto: amlogic-gxl-core - Convert to platform remove callback returning void
>   crypto: aspeed-acry - Convert to platform remove callback returning void
>   crypto: aspeed-hace - Convert to platform remove callback returning void
>   crypto: atmel-aes - Convert to platform remove callback returning void
>   crypto: atmel-sha - Convert to platform remove callback returning void
>   crypto: atmel-tdes - Convert to platform remove callback returning void
>   crypto: axis/artpec6 - Convert to platform remove callback returning void
>   crypto: bcm/cipher - Convert to platform remove callback returning void
>   crypto: caam/jr - Convert to platform remove callback returning void
>   crypto: ccp/sp - Convert to platform remove callback returning void
>   crypto: ccree/cc - Convert to platform remove callback returning void
>   crypto: exynos-rng - Convert to platform remove callback returning void
>   crypto: gemini/sl3516-ce - Convert to platform remove callback returning void
>   crypto: hisilicon/sec - Convert to platform remove callback returning void
>   crypto: hisilicon/trng - Convert to platform remove callback returning void
>   crypto: img-hash - Convert to platform remove callback returning void
>   crypto: inside-secure/safexcel - Convert to platform remove callback returning void
>   crypto: intel/ixp4xx-crypto - Convert to platform remove callback returning void
>   crypto: intel/keembay-ocs-aes - Convert to platform remove callback returning void
>   crypto: intel/keembay-ocs-ecc - Convert to platform remove callback returning void
>   crypto: intel/keembay-ocs-hcu - Convert to platform remove callback returning void
>   crypto: marvell/cesa - Convert to platform remove callback returning void
>   crypto: mxs-dcp - Convert to platform remove callback returning void
>   crypto: n2_core - Convert to platform remove callback returning void
>   crypto: omap-aes - Convert to platform remove callback returning void
>   crypto: omap-des - Convert to platform remove callback returning void
>   crypto: omap-sham - Convert to platform remove callback returning void
>   crypto: qce - Convert to platform remove callback returning void
>   crypto: qcom-rng - Convert to platform remove callback returning void
>   crypto: rockchip/rk3288 - Convert to platform remove callback returning void
>   crypto: s5p-sss - Convert to platform remove callback returning void
>   crypto: sa2ul - Convert to platform remove callback returning void
>   crypto: sahara - Convert to platform remove callback returning void
>   crypto: stm32/crc32 - Convert to platform remove callback returning void
>   crypto: stm32/cryp - Convert to platform remove callback returning void
>   crypto: talitos - Convert to platform remove callback returning void
>   crypto: xilinx/zynqmp-aes-gcm - Convert to platform remove callback returning void
>   crypto: xilinx/zynqmp-sha - Convert to platform remove callback returning void
> 
>  .../crypto/allwinner/sun4i-ss/sun4i-ss-core.c |  5 ++---
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  5 ++---
>  .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  6 ++---
>  drivers/crypto/amcc/crypto4xx_core.c          |  6 ++---
>  drivers/crypto/amlogic/amlogic-gxl-core.c     |  5 ++---
>  drivers/crypto/aspeed/aspeed-acry.c           |  6 ++---
>  drivers/crypto/aspeed/aspeed-hace.c           |  6 ++---
>  drivers/crypto/atmel-aes.c                    |  6 ++---
>  drivers/crypto/atmel-sha.c                    |  6 ++---
>  drivers/crypto/atmel-tdes.c                   |  6 ++---
>  drivers/crypto/axis/artpec6_crypto.c          |  5 ++---
>  drivers/crypto/bcm/cipher.c                   |  5 ++---
>  drivers/crypto/caam/jr.c                      | 22 ++++++++-----------
>  drivers/crypto/ccp/sp-platform.c              |  6 ++---
>  drivers/crypto/ccree/cc_driver.c              |  6 ++---
>  drivers/crypto/exynos-rng.c                   |  6 ++---
>  drivers/crypto/gemini/sl3516-ce-core.c        |  6 ++---
>  drivers/crypto/hisilicon/sec/sec_drv.c        |  6 ++---
>  drivers/crypto/hisilicon/trng/trng.c          |  6 ++---
>  drivers/crypto/img-hash.c                     |  6 ++---
>  drivers/crypto/inside-secure/safexcel.c       |  6 ++---
>  drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c   |  6 ++---
>  .../intel/keembay/keembay-ocs-aes-core.c      |  6 ++---
>  .../crypto/intel/keembay/keembay-ocs-ecc.c    |  6 ++---
>  .../intel/keembay/keembay-ocs-hcu-core.c      |  6 ++---
>  drivers/crypto/marvell/cesa/cesa.c            |  6 ++---
>  drivers/crypto/mxs-dcp.c                      |  6 ++---
>  drivers/crypto/n2_core.c                      | 12 ++++------
>  drivers/crypto/omap-aes.c                     |  6 ++---
>  drivers/crypto/omap-des.c                     |  6 ++---
>  drivers/crypto/omap-sham.c                    |  6 ++---
>  drivers/crypto/qce/core.c                     |  5 ++---
>  drivers/crypto/qcom-rng.c                     |  6 ++---
>  drivers/crypto/rockchip/rk3288_crypto.c       |  5 ++---
>  drivers/crypto/s5p-sss.c                      |  6 ++---
>  drivers/crypto/sa2ul.c                        |  6 ++---
>  drivers/crypto/sahara.c                       |  6 ++---
>  drivers/crypto/stm32/stm32-crc32.c            | 15 +++++--------
>  drivers/crypto/stm32/stm32-cryp.c             | 16 +++++---------
>  drivers/crypto/talitos.c                      |  6 ++---
>  drivers/crypto/xilinx/zynqmp-aes-gcm.c        |  6 ++---
>  drivers/crypto/xilinx/zynqmp-sha.c            |  6 ++---
>  42 files changed, 99 insertions(+), 187 deletions(-)
> 
> base-commit: 4230ea146b1e64628f11e44290bb4008e391bc24
> -- 
> 2.42.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
