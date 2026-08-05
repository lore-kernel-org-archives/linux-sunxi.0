Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D21A3DDAE0
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Aug 2026 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785957167; cv=none; b=VihGFV/DSLLnzgraJg4AJJGegNZ+4bT/amM2tCMt1VECixTM6eFWScbUd2wuhSR8H9mlOrpKLGL+dgaM2mD9VjUZ0l9VnxSstp8SU4FvpEtajrZ17oVcri8gEYcPSGUZHdd/f+wvhiW194Er8desYbofe+Nx2mYz9ZF/S4nVxbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785957167; c=relaxed/simple;
	bh=lDT7FdGY2Nawl9QrfcHfV2XAF+4ejy8Hdvw2oQGXBP0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sGIgRHVDGtDXUxPudt55ae/uEqqiLkvQg+ijEjEtTWBUo8sbCxObgw8LLxaVaM8qUatfyaciTxtn15q+4shDabn5cCPSlRH5baqZFjr4/s90fvv1cxbRbFKbV4M1NacoYkbqPEznDOTNFpyfq4H4kIEUPeQPNJrOMmfctU3Hywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HckXOgkC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HckXOgkC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBCC6153B;
	Wed,  5 Aug 2026 12:12:38 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00CF63F86F;
	Wed,  5 Aug 2026 12:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785957162; bh=lDT7FdGY2Nawl9QrfcHfV2XAF+4ejy8Hdvw2oQGXBP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HckXOgkCfhf4HJOjzr50vRBkFepF0fqCy7W8Cy1Xuyzh6BEJCKnCJd18jEG6P8iVg
	 on9QhTJR4q9FfxRhUsYjYhW2ibAPQUO/ofs+rUND/Nm8jgJglz9WBp1gaBnpYTRi4h
	 dyuwAhk/7F3BaO4gJJvDgHOLEkLOoGxGCfBYGSa8=
Date: Wed, 5 Aug 2026 21:08:27 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
Message-ID: <20260805210739.6da82d16@ryzen.lan>
In-Reply-To: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
References: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 05 Aug 2026 15:53:26 +0200
Jerome Brunet <jbrunet@baylibre.com> wrote:

> The A733 has six SPI controllers with the same IP as the A523.
> Like the A523, one of them (spi1) also supports DBI mode.
> 
> Add SoC specific compatible strings, falling back to the A523 ones.

Has this been tested? Can someone confirm? We should avoid adding
bindings prematurely, not that it bites us again as it did for the H616
DE bindings, for instance.

Cheers,
Andre


> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index 6af4ff233158..be47c6e00409 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -36,6 +36,13 @@ properties:
>        - items:
>            - const: allwinner,sun55i-a523-spi-dbi
>            - const: allwinner,sun55i-a523-spi
> +      - items:
> +          - const: allwinner,sun60i-a733-spi
> +          - const: allwinner,sun55i-a523-spi
> +      - items:
> +          - const: allwinner,sun60i-a733-spi-dbi
> +          - const: allwinner,sun55i-a523-spi-dbi
> +          - const: allwinner,sun55i-a523-spi
>  
>    reg:
>      maxItems: 1
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3
> 
> Best regards,
> --  
> Jerome
> 
> 

