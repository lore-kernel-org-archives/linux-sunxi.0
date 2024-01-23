Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F88454BE3
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 00:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705970465; cv=none; b=B0gsGFkhqqBxK1Edo0rqREbDVfeFZWKtJsGLgoJErueXWfPtdVGjefinxCaFBdgHyf2rF5sGTOQ0WUH0W7HVyDI4iCJSLuRagjYOf9xd2xuWmjhtwj3Uf07YJ38jULVsfRnRbpGZlYQJrXLkIIunLW4I0DsUTha+uFMff0hZIu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705970465; c=relaxed/simple;
	bh=UbGceyRiBi7uZH0lDWNsttwvZ5/EMF3MFYFsi+KKQ4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FLJXgVHnb2pPIlOpx/zTxsdM++lnSHuSNxKlXglyZu90lLn2fRKBIogVjrwoJwf20QcBDy6sn8sgXGma89qIWdUE7vv4UO3744ea4G1ufRDcvyrYiFRloNcmyyx6rLwjClODVCqi0S7jniXPj0zJeQRRwsDQtfq6wyzB4grg9JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A490D1FB;
	Mon, 22 Jan 2024 16:41:47 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A41813F73F;
	Mon, 22 Jan 2024 16:40:59 -0800 (PST)
Date: Tue, 23 Jan 2024 00:40:10 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: dma: allwinner,sun50i-a64-dma: Add
 compatible for H616
Message-ID: <20240123004010.59cac5ad@minigeek.lan>
In-Reply-To: <20240122170518.3090814-5-wens@kernel.org>
References: <20240122170518.3090814-1-wens@kernel.org>
	<20240122170518.3090814-5-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Jan 2024 01:05:15 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The DMA controllers found on the H616 and H618 are the same as the one
> found on the H6. The only difference is the DMA endpoint (DRQ) layout.

That does not seem to be entirely true: The H616 encodes the two lowest
bits in DMA_DESC_ADDR_REG differently: on the H6 they must be 0 (word
aligned), on the H616 these contain bits [33:32] of the address of the
DMA descriptor. The manual doesn't describe the descriptor format in
much detail, but ec31c5c59492 suggests that those two bits are put in
the "para" word of the descriptor.

The good thing it that this encoding is backwards compatible, so I
think the fallback string still holds: Any driver just implementing the
H6 encoding would be able to drive the H616.

I think the A100 was mis-described, as mentioned here:
https://lore.kernel.org/linux-arm-kernel/29e575b6-14cb-73f1-512d-9f0f934490ea@arm.com/
I think we should:
- make the A100 use: "allwinner,sun50i-a100-dma", "sun50i-h6-dma"
- make the H616 use: "allwinner,sun50i-h616-dma", "allwinner,sun50i-a100-dma", "sun50i-h6-dma"

Does that make sense?

Cheers,
Andre

> Since the number of channels and endpoints are described with additional
> generic properties, just add a new H616-specific compatible string and
> fallback to the H6 one.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../bindings/dma/allwinner,sun50i-a64-dma.yaml    | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> index ec2d7a789ffe..e5693be378bd 100644
> --- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> @@ -28,6 +28,9 @@ properties:
>        - items:
>            - const: allwinner,sun8i-r40-dma
>            - const: allwinner,sun50i-a64-dma
> +      - items:
> +          - const: allwinner,sun50i-h616-dma
> +          - const: allwinner,sun50i-h6-dma
>  
>    reg:
>      maxItems: 1
> @@ -59,10 +62,14 @@ required:
>  if:
>    properties:
>      compatible:
> -      enum:
> -        - allwinner,sun20i-d1-dma
> -        - allwinner,sun50i-a100-dma
> -        - allwinner,sun50i-h6-dma
> +      oneOf:
> +        - enum:
> +            - allwinner,sun20i-d1-dma
> +            - allwinner,sun50i-a100-dma
> +            - allwinner,sun50i-h6-dma
> +        - items:
> +            - const: allwinner,sun50i-h616-dma
> +            - const: allwinner,sun50i-h6-dma
>  
>  then:
>    properties:

