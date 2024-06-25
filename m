Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5399846F
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Jun 2024 00:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719275952; cv=none; b=H0bNcj1loLudeaav+Q9eaVOCe0DnNVJNbdILRCCGprGOpZzDzj+6et93Khd5xFrwgZ4kVZz9nqqCBcFmY2o8ivPJpmXdGJYReOL80LlkM6IRAVA7iIue7PROuYbtx0ztc0k08KqM9uynNzLhz7vh++AGy+qK6ynWrXNpvCmtDVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719275952; c=relaxed/simple;
	bh=p2n334UNdruZ6KKG3jJXEblFwhf8ypH8DxOBtDAQ2PY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FbVGXUtNTT0CT79brTQN9J0n/tZvx1L3Xti7ZKtT+zYwKX2Y8HKdeGs1JXSXZ0wcvQpDaGoYO9Wnpk9KILwvYMciq1CdrGiTd1DKoitmCjU4AbuQ+CoD4Ict0rDch5oZi5d7a8e3VkhEXBWHUZy+7QJ2oVxDaXq9Yl4xVxTHNvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91F6D339;
	Mon, 24 Jun 2024 17:39:33 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 272C03F6A8;
	Mon, 24 Jun 2024 17:39:06 -0700 (PDT)
Date: Tue, 25 Jun 2024 01:37:25 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chris
 Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 18/23] dt-bindings: allwinner: add H616 DE33 bus, clock
 and display bindings
Message-ID: <20240625013725.4c5a3e7c@minigeek.lan>
In-Reply-To: <20240620113150.83466-19-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
	<20240620113150.83466-19-ryan@testtoast.com>
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

On Thu, 20 Jun 2024 23:29:56 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add display engine bus, clock and mixer bindings for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 ++++---
>  .../bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml       | 1 +
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml   | 1 +
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> index 9845a187bdf65..631027375e33b 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -23,9 +23,10 @@ properties:
>    compatible:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
> -      - items:
> -          - const: allwinner,sun50i-h6-de3
> -          - const: allwinner,sun50i-a64-de2
> +      - enum:
> +        - allwinner,sun50i-h6-de3
> +        - allwinner,sun50i-h616-de33
> +      - const: allwinner,sun50i-a64-de2

That doesn't look right, that would allow:
- h6-de
- h616-de33
- a64-de2

which is not what we want, right? It's more:
- h6-de, a64-de2
- h616-de, a64-de2
- a64-de2

I think allwinner,sun8i-a23-rsb.yaml uses the pattern you are after.

Cheers,
Andre



>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> index 70369bd633e40..7fcd55d468d49 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> @@ -25,6 +25,7 @@ properties:
>        - const: allwinner,sun50i-a64-de2-clk
>        - const: allwinner,sun50i-h5-de2-clk
>        - const: allwinner,sun50i-h6-de3-clk
> +      - const: allwinner,sun50i-h616-de33-clk
>        - items:
>            - const: allwinner,sun8i-r40-de2-clk
>            - const: allwinner,sun8i-h3-de2-clk
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index b75c1ec686ad2..c37eb8ae1b8ee 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -24,6 +24,7 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0
>  
>    reg:
>      maxItems: 1

