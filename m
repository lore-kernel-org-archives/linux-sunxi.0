Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E5A2917
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 20:28:44 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id d3so12204857ioi.9
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 13:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VB8ohulxGJw/3gfUW0YzwYFtWNanlD/OW6g8qh8iMm8=;
        b=z2mF0G4hPIGyEwoI9dRInAwCjKVLJ9Gj7l8fi+FXV8b+Vh0osIH8cp2hh/uld1X8BC
         4w5u6GEz5BypH+B6fuJIP/Tibiou3qnk66Y6tAfC2HDZUMgrOWHU5dUfy6SMsRFqO2Rk
         XuRRDdLP4aw4pzp2nbl3E+FxabsPu81M9E+C+z9gLm9IkDvyJvJi0KRiwpuF2npnc8Qi
         4Pbr3Yayiqznft7O9R/7/IuWGfkZhDkR76kEwZt5EvVURSnBNsl89Z5/rwj6zEri1Ugr
         cGsJf8vG+ltnM0mPmtU+Qu4mXp2Qyu5+479hpVhobSz5x0nV0pRtXyJaKMk5idoZQGFt
         9HqQ==
X-Gm-Message-State: AJIora/ecta4zsa5wzTqc+77rAHLDgHJPzyiHm4Er36ErExeUTVQwG6K
	8j7rKh72ytOgEOos1hq2Dw==
X-Google-Smtp-Source: AGRyM1t/6jrKHfXmUGua2XcbKRa40KMbkZHlN4pybq69FIdjiz0yKozsXIHZLJCaSGa75SjE2+4hUg==
X-Received: by 2002:a05:6638:2514:b0:33e:d925:efe8 with SMTP id v20-20020a056638251400b0033ed925efe8mr7329632jat.202.1657052924068;
        Tue, 05 Jul 2022 13:28:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q15-20020a02a98f000000b0033ee1e67c6esm1959787jam.79.2022.07.05.13.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:28:43 -0700 (PDT)
Received: (nullmailer pid 2570063 invoked by uid 1000);
	Tue, 05 Jul 2022 20:28:41 -0000
Date: Tue, 5 Jul 2022 14:28:41 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: allwinner,sun50i-a64-dma: Fix min/max
 typo
Message-ID: <20220705202841.GA2570015-robh@kernel.org>
References: <20220702031903.21703-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702031903.21703-1-samuel@sholland.org>

On Fri, 01 Jul 2022 22:19:02 -0500, Samuel Holland wrote:
> The conditional block for variants with a second clock should have set
> minItems, not maxItems, which was already 2. Since clock-names requires
> two items, this typo should not have caused any problems.
> 
> Fixes: edd14218bd66 ("dt-bindings: dmaengine: Convert Allwinner A31 and A64 DMA to a schema")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
