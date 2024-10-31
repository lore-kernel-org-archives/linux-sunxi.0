Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DA119994D
	for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730376639; cv=none; b=Vvn1nXKbnLhPu9YQJyyBwn8rl+Zu2V+u1qiyYTk1UhRb3WFbLKoRKYUwIXzJL38m9gfkLHNj2DbKLe69iANlqwpPgMo3Ejv1L21AS9CmQpgPZWJ56nMGMqb7yg+1z0LCbhlv/XXYyktlbSqbMF6vic1hTTYH7tzzVFxcx3q10kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730376639; c=relaxed/simple;
	bh=v+GFapRcuIgRaWTWqmWiHxyJW99cGUvwV95nSLXuFWM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOw6UQ4BN0dnKVGQjBLblTLBzW3MmyxRSyXztZ1PBFxl1tRXBxLJPxTw6GoHMzp7G7Z7jB6YNm9HWLjErfaZUKvW2+UwSbqC1d1lnWZ2BZ4EtajVZybRiFrOm9hz8n1s9Fc1qnalRRockSRXwgCl7y9mZS6+hNAg7GrzFzNGfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 027171063;
	Thu, 31 Oct 2024 05:11:05 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D3153F66E;
	Thu, 31 Oct 2024 05:10:31 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:10:28 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Ripard <mripard@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Parthiban <parthiban@linumiz.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/13] dt-bindings: opp: h6: Add A100 operating
 points
Message-ID: <20241031121028.5624c6e4@donnerap.manchester.arm.com>
In-Reply-To: <20241031070232.1793078-12-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
	<20241031070232.1793078-12-masterr3c0rd@epochal.quest>
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

On Thu, 31 Oct 2024 04:02:24 -0300
Cody Eksal <masterr3c0rd@epochal.quest> wrote:

> The A100, similar to the H6 and H616, use an NVMEM value to determine
> speed binnings. The method used is similar to that of the H6. However,
> the information is stored at a slightly different bit offset.
> 
> Add a new compatible for the A100.
> 
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Changes in V2:
>  - Fix ordering of compatibles
> 
>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> index ec5e424bb3c8..75ab552f6ecd 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> @@ -22,6 +22,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - allwinner,sun50i-a100-operating-points
>        - allwinner,sun50i-h6-operating-points
>        - allwinner,sun50i-h616-operating-points
>  

