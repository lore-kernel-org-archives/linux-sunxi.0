Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC16A1C862D
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Mar 2025 17:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741972366; cv=none; b=POzCGu0BVNEa4Pcvy6sEYmcYbVIeH2sBPV+l81oJwI2H+4GfqmcRU67WUUweh7E3ZKNA4mJbPy3q52yRg9RAGKLnEIYoffBF+Y9PcRI++W0j9ORrgbfO3e22KswUy4dqh3p56BJXAf8NJFPC53XSDVkb0gUAP726WfpRZAE4/XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741972366; c=relaxed/simple;
	bh=oMRf5D9xED76AloBmylBsBKYgSUDihyoTcfIWxoaKyc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b8z8XtQdGxM9Of3fQsE7OV2X/EF5Rp/ucO6JAVT9at994K4oCpq+ZSETy2Klgkx6utgxDTWR3Ue3bKZBXX2Mrbq5g5X6UKgRY2Fblvt84i7eR5XrCkZwIxJYPhyux2W6CMG/kD13GX2tjVe6oKnordCwBdlFr8hwxcGXkkVnraE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B18E1424;
	Fri, 14 Mar 2025 10:12:52 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 251433F673;
	Fri, 14 Mar 2025 10:12:40 -0700 (PDT)
Date: Fri, 14 Mar 2025 17:12:35 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 03/15] dt-bindings: watchdog: sunxi: add Allwinner
 A523 compatible string
Message-ID: <20250314171235.25db7044@donnerap.manchester.arm.com>
In-Reply-To: <20250307005712.16828-4-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
	<20250307005712.16828-4-andre.przywara@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Mar 2025 00:57:00 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi Wim, Guenter,

> The Allwinner A523 SoC features a watchdog similar to the one used in
> previous SoCs, but moves some registers around (by just one word), making
> it incompatible to existing IPs.
> 
> Add the new name to the list of compatible string, and also to the list
> of IP requiring two clock inputs.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

is there any chance that this DT binding patch (and patch 04/15, touching
the actual driver) would make it into -next any time soon, and hopefully
into v6.15? From what I can see it's the only binding left before the
sunxi maintainers can merge the devicetree patches for this new SoC (most
others are in, pinctrl and NMI should show up in the next days).

Let me know if I can help with anything or if you need more information!

Thanks,
Andre

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 64c8f73938099..b35ac03d51727 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - const: allwinner,sun20i-d1-wdt-reset
>            - const: allwinner,sun20i-d1-wdt
> +      - const: allwinner,sun55i-a523-wdt
>  
>    reg:
>      maxItems: 1
> @@ -60,6 +61,7 @@ if:
>            - allwinner,sun20i-d1-wdt-reset
>            - allwinner,sun50i-r329-wdt
>            - allwinner,sun50i-r329-wdt-reset
> +          - allwinner,sun55i-a523-wdt
>  
>  then:
>    properties:

