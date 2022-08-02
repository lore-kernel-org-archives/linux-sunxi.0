Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F197F
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Aug 2022 15:06:59 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id v185so10814698ioe.11
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Aug 2022 08:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=x3XCynuR0M/TShCzZqty0IPaAPxLKscWE0q3SESViQY=;
        b=xHs1aK+EJYH1/ribX9j7opG2kRihWYghHf/QtpZvKArio6Lxyr/o2/gZG+IU1rpAul
         1yA9EGkPr79gnribYgriJ1Hyi2ttgPSRlFQbcuONdhADoplJiIAFn281Lh6ObOvhgfCE
         jf7L7RXbTxE2iwqBCxTIZwvLIlsGsy1mbdhdf8UyNPP7u3UNVsfKBl/ZsEQ3aj9fwUny
         cBQpcn1d7YGv+7G4IbOFkbJRJZPWQj+nehuS0iflYvApJefYhnwKPQ5BpMwpeolbyyIW
         4BZju0/GOv9EgWm2pyYS5oyhzNQUGJdYVUjuMaJzrsjkseFusHN/nSTZ8itlObIqoSe5
         sm1A==
X-Gm-Message-State: AJIora8Uit/YMwGODdA070DptzWOF4XOABNDc32MNX2IaLEOYzX7G4Kq
	2J4Yxv/QJN6mgSdDHOv2qA==
X-Google-Smtp-Source: AGRyM1sKUi6tiTehYE0cNjPculTasu4AM874RxolsEPrxNCFivhQUiMOpXnNKOlKQq9dYYA+GOxGFQ==
X-Received: by 2002:a05:6638:1305:b0:33f:7e59:4bc7 with SMTP id r5-20020a056638130500b0033f7e594bc7mr7940473jad.316.1659452818161;
        Tue, 02 Aug 2022 08:06:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q28-20020a02a99c000000b0033a29ec646dsm6568358jam.4.2022.08.02.08.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 08:06:57 -0700 (PDT)
Received: (nullmailer pid 112022 invoked by uid 1000);
	Tue, 02 Aug 2022 15:06:56 -0000
Date: Tue, 2 Aug 2022 09:06:56 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/4] dt-bindings: sram: sunxi-sram: Add optional
 regulators child
Message-ID: <20220802150656.GB86158-robh@kernel.org>
References: <20220802053213.3645-1-samuel@sholland.org>
 <20220802053213.3645-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802053213.3645-2-samuel@sholland.org>

On Tue, Aug 02, 2022 at 12:32:10AM -0500, Samuel Holland wrote:
> Some sunxi SoCs have in-package regulators controlled by a register in
> the system control MMIO block. Allow a child node for these regulators
> in addition to SRAM child nodes.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v2:
>  - New patch for v2
> 
>  .../bindings/sram/allwinner,sun4i-a10-system-control.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> index 1c426c211e36..cc57836b2906 100644
> --- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> +++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> @@ -56,6 +56,9 @@ properties:
>  
>    ranges: true
>  
> +  regulators:
> +    type: object

This should reference the regulator schema.

Also, it's preferred to have 1 complete example here rather than 
piecemeal examples in each child schema.

> +
>  patternProperties:
>    "^sram@[a-z0-9]+":
>      type: object
> -- 
> 2.35.1
> 
> 
