Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF667194132
	for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730374621; cv=none; b=j3QnxE7KxgliRK8uAoFZc8vlmlpM7Y4HAsbZvqtIKanf4eWqy+Athn4i2HXAyiLNSnXMZ7nxiwC4uf078v8jIp4xYJ1SOW0mhT9pvz5/vF50aT4Dn/brwBte5x8Y03NxCqN2ec5/Yfyv+VxLa8ByzWs0KeqfTKhCvKjg1ecXSBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730374621; c=relaxed/simple;
	bh=M+BdbzfIgqQ7peFmhkfFL9WnqYMdvqlY8WR1XO/LIso=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MxCU8orfX4+SlB20kijxFYW74my1j4PzV6eoS+j1sL8bGi6lsv3cedriAO4V8ksb3uO49BQsXPPFNTmvHmZT33f5Z+hUCZSLugGKocPVPj7We99V7ebdcCr/F4405plq1RIxq12Id7vA/E9qOtSjOE0zv3N+FNUUaHpjJMtZ/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D78D11063;
	Thu, 31 Oct 2024 04:37:27 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 276883F73B;
	Thu, 31 Oct 2024 04:36:54 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:36:51 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette
 <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar
 <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li
 <tiny.windzz@gmail.com>, Parthiban <parthiban@linumiz.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/13] dt-bindings: phy: sun50i-a64: add a100
 compatible
Message-ID: <20241031113651.4ab4f8c7@donnerap.manchester.arm.com>
In-Reply-To: <20241031070232.1793078-4-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
	<20241031070232.1793078-4-masterr3c0rd@epochal.quest>
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

On Thu, 31 Oct 2024 04:02:16 -0300
Cody Eksal <masterr3c0rd@epochal.quest> wrote:

> The USB PHY found in the A100 is similar to that found in the D1. Add a
> compatible for the A100.
> 
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Careful with that: you made quite some changes compared to v1, which Rob
ACKed, so I wouldn't carry over his tag here.

Cheers,
Andre

> ---
> Changes in V2:
>  - Update binding to allow using the D1 as a compatible.
> 
>  .../bindings/phy/allwinner,sun50i-a64-usb-phy.yaml     | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> index f557feca9763..21209126ed00 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> @@ -15,9 +15,13 @@ properties:
>      const: 1
>  
>    compatible:
> -    enum:
> -      - allwinner,sun20i-d1-usb-phy
> -      - allwinner,sun50i-a64-usb-phy
> +    oneOf:
> +      - enum:
> +          - allwinner,sun20i-d1-usb-phy
> +          - allwinner,sun50i-a64-usb-phy
> +      - items:
> +          - const: allwinner,sun50i-a100-usb-phy
> +          - const: allwinner,sun20i-d1-usb-phy
>  
>    reg:
>      items:

