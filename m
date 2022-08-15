Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5677E
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Aug 2022 17:06:44 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNdY2-00059r-3h; Mon, 15 Aug 2022 19:06:42 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 01/12] MAINTAINERS: Match the sun20i family of Allwinner SoCs
Date: Mon, 15 Aug 2022 19:06:41 +0200
Message-ID: <3784577.fW5hKsROvD@diego>
In-Reply-To: <20220815050815.22340-2-samuel@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 15. August 2022, 07:08:04 CEST schrieb Samuel Holland:
> Allwinner sunxi SoCs with a RISC-V CPU use the sun20i designator. Match
> that pattern in addition to the designators for 32 and 64-bit ARM SoCs.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a5012ba6ff9..59bcaa405a6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1800,7 +1800,7 @@ F:	drivers/pinctrl/sunxi/
>  F:	drivers/soc/sunxi/
>  N:	allwinner
>  N:	sun[x456789]i
> -N:	sun50i
> +N:	sun[25]0i
>  
>  ARM/Amlogic Meson SoC CLOCK FRAMEWORK
>  M:	Neil Armstrong <narmstrong@baylibre.com>
> 

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




