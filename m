Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1028A1D1
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 16:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513880; cv=none; b=pN+xziZJTEFwAE2SH6y2L4jNNFmvXDsAKBiwmZEWg93LmlyvuHO9SGJo0iXVlYtYoso0GZ9u0JQit/QINoX02tAvpWNcn5EJC/dRWbjzTiwvfrNr4MzdgZoK8UCKd1QaRU73X2xRDhTRPNqPwO0m5IutegW0SwxCTTWWjoXavWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513880; c=relaxed/simple;
	bh=j1MfpPRWqhfX/2KQfilannHBewLFWL4iLNkee7p1jNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKG6lokvfVRcYICfwJmI7SMB+eU4Gr8XR0V7qbGMKCWPUODMAh+pzYf2M0PVDYTC8yDFTl/U98nXkBbADyGnV2fDBdon2spx/sLgY6HUJ8rcyczK3gBQWXZDFtbzvd9OCTtE/U1CNSoYk9Jzne47ahaOXc0Is0AS5kTznpepbUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGvWjMsC; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGvWjMsC"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e73120cc26fso137706276.0
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 09:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513878; x=1746118678; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CC8QXc9LsvxTqtPlPIyO29AB2sQN6RDFy5sekBxfX70=;
        b=yGvWjMsCaNcDU5Dnj2EDZO0id8UALfP+pOWK9Go6gGJWl4lyKW9huqomEhk9Dm4Kjs
         n9X8iBVkJKPRvKn5inhzFJ33t6zMOlhp0FQbmsANsk/ph8b4w0ICWD25H8TQNFh9i0sM
         Y+uRL5ZJiHqi5a4q4IQ0L52JMWPFBjwUNusKGWMFc6a/zOANURdqCY0uIdi4i7WW4dUV
         egQsSqUsVKmvyOSiyDzE8GnKBhJs9DDXhqAySC5j51SF+NtIK/MoFQcOVtwHf8Vey0f3
         ApMy9GpfMEFeUkdeHkO5eKRRjl165/rP+ueTm/VrQNRm9OCwUeXErTpThIS/dbWde91q
         /q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513878; x=1746118678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CC8QXc9LsvxTqtPlPIyO29AB2sQN6RDFy5sekBxfX70=;
        b=JBTemXCKlQw2p19n1TSHId2ku4hQa5oyWKd34GexAQ6WR+k+uNRGq6sdnl2dM5X369
         UhWHfP7Merd9DvXWTUxfDAU0mDhOdutSywFWgX6ZAhEzT8Vx+dDBNcfVG6Qc3EKaI1Rl
         kt1oRAyyhym9KUMZZA/nHmuIxfMg0pKo6mWx84WP6rROdHOylBDUPyNzPKpX1zE9wJnQ
         SJhoCkY06teWKPRZ0lebtrIiv5c8rt1x9+1riWsUtAD1LTAX2S7P3Dyov7wFJiOCRyCx
         O43T5LULPTCdFFi4iAR4VFpBMtR0QJsCQIEruaab88AoWOlv8NXh//BOvLaL9OjCf96A
         fAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQXOcxlTGBsxJQVFhCkzh/WmPMaBBTVKjx2ouNIYDahXX+w+J6w0dmOoLEiibbtho0OihRD1V0t8CT1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yya+lyqZbMWiCmwuQj7n8U1j3lPgLeZTjdF3AS+J/emjK7aUUdM
	eJWfSVDIIp8jHvVxLJ4V2H/vkEhu/DF1D3RYLuZQGKuMuiDr3UfdLy1fguZeP1tY4tYpFaEJoBF
	f+hXuFLf5TF4KrDNJfMwOvGvl2jJ76pcGKuQkqg==
X-Gm-Gg: ASbGncudxM4BGdWYN3yNBsFJTmeDA8ml2MNIEnggda7FEz7uFiUdYwg9ZQdnno57Nl2
	83Qi9IX4flXq0eEGX83WjHphddkHrmM2glayk9dgBhm+u2C63RWor9pqUW9kO78DuxukPYVkYVt
	TIhjZc65HdZ42CfKPhHk2CKFU=
X-Google-Smtp-Source: AGHT+IGUSO5FK4cTNY1s8aCOE0QjJA5+ZdVnwWYHpoNAMpE1vPT98E65H3GN3XHKq0FMUPOvfV/2uwmg/47o7Q3uAQg=
X-Received: by 2002:a05:6902:1b12:b0:e72:d449:72ed with SMTP id
 3f1490d57ef6-e7312d6905emr175202276.24.1745513878058; Thu, 24 Apr 2025
 09:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416224839.9840-1-andre.przywara@arm.com> <20250416224839.9840-2-andre.przywara@arm.com>
In-Reply-To: <20250416224839.9840-2-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:22 +0200
X-Gm-Features: ATxdqUFsZ4jKzTVE_MqQW5hWNU9yilyI4trLvJSpUG2toFoex3HtMd6XPhqZ5bI
Message-ID: <CAPDyKFop9gAUq3kG4-hs358y=N48rLQSvJaRveXo_ebVTf8gEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 00:49, Andre Przywara <andre.przywara@arm.com> wrote:
>
> The Allwinner H6 and some later SoCs contain some bits in the PRCM (Power
> Reset Clock Management) block that control some power domains.
> Those power domains include the one for the GPU, the PLLs and some
> analogue circuits.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next by amending the example according to ChenYu's comment, thanks!

Note this patch is also available on the immutable dt branch, for SoC
maintainers to pull.

Kind regards
Uffe



> ---
>  .../power/allwinner,sun50i-h6-prcm-ppu.yaml   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
>
> diff --git a/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
> new file mode 100644
> index 0000000000000..7eaff9baf7268
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/allwinner,sun50i-h6-prcm-ppu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner SoCs PRCM power domain controller
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +description:
> +  The Allwinner Power Reset Clock Management (PRCM) unit contains bits to
> +  control a few power domains.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun50i-h6-prcm-ppu
> +      - allwinner,sun50i-h616-prcm-ppu
> +      - allwinner,sun55i-a523-prcm-ppu
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    prcm_ppu: power-controller@7010210 {
> +        compatible = "allwinner,sun50i-h616-prcm-ppu";
> +        reg = <0x07010250 0x10>;
> +        #power-domain-cells = <1>;
> +    };
> --
> 2.46.3
>
