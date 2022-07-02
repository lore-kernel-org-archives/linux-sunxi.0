Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5201FA8
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 19:34:44 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id e40so6785198eda.2
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kQg/6LkplffkCtimKzzt2q4A7biDvqAW9bm94VihuCI=;
        b=ilHiV1DsRo62TeKfx/Leh964ynrDoJGg7hw1VZVZlHnRA6PbhpUF4bBqIEDDWemeC4
         1Mq/vzh0TJAQUFcs3dZrtlUIR9lQzl5Z5J55QWvpv/CTvB4mbN5LqyM2TabdDZ9rElc2
         FwAWQdEKokrizvedaoXzLlbBc2lFRJVZpkIoBmbaRp/vvHiNBJWYuSIpWDN0mVpBzJ/8
         xCSZ8JBfAGpTHT5ZLxqKFUNRNUxFShVIonBkF2TDIjpqd7jNze4PuXFpX2SIPLPnTWr6
         cAI+49bbOLzTk+mBrP+vp0p8ovK1tXSMNd/Tld/DaZedKuZbAjADjgyy1rtiupA0aOSG
         Pmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kQg/6LkplffkCtimKzzt2q4A7biDvqAW9bm94VihuCI=;
        b=LwR6yYbCgYA4a1XwIQa/OW06D3w/0dNGpk8llNESlqnq3K8sEnfL24c+j+0ypSE41z
         xS8mPYIpCPgExnL/Cpa0NWq9XEQFtLyi5+Ii5Q5B0GN7vVnK+HauxWDxiv4Yq6V2yK5l
         q1Y8RGKXmh7PEG8TmRWpBZRoOMlvw6M7sBtmZdA0wdgWkMWDn0mcW+/FKxNxs+r9p1AW
         qNbG+JrHlCkEqLLFRAZjUZyuocQ7QVydD9fFN4viEfw1omEwuHJdlhAJN0zVlyCQm4D+
         3gzu6rRXhI8NbSMOiqOF9qqWPJobrw9iyCJux7o/Y2LrIGwuZT6n58/mvg3DmgE7MsNJ
         j9YQ==
X-Gm-Message-State: AJIora+GjhoEJmLaZhV1WUSjynSkB8CfFE74JZOsw0T79GsnDdPGRGW/
	7F24177S/lM7LZPI6DW4YG8=
X-Google-Smtp-Source: AGRyM1tJaOo4gaMbRsM/Ka5hQ7A7XL3QHtzUGEJFHAy5Ouvh5Z+F78XIbfTG3AzW46xXj8DRsTXrZA==
X-Received: by 2002:a05:6402:368f:b0:437:be5d:6617 with SMTP id ej15-20020a056402368f00b00437be5d6617mr27066806edb.187.1656790483189;
        Sat, 02 Jul 2022 12:34:43 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id p16-20020a05640210d000b0043a1bc2ebbcsm123066edu.3.2022.07.02.12.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 12:34:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: dma: allwinner,sun50i-a64-dma: Fix min/max typo
Date: Sat, 02 Jul 2022 21:34:41 +0200
Message-ID: <22696538.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20220702031903.21703-1-samuel@sholland.org>
References: <20220702031903.21703-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 05:19:02 CEST je Samuel Holland napisal(a):
> The conditional block for variants with a second clock should have set
> minItems, not maxItems, which was already 2. Since clock-names requires
> two items, this typo should not have caused any problems.
> 
> Fixes: edd14218bd66 ("dt-bindings: dmaengine: Convert Allwinner A31 and A64
> DMA to a schema") Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml index
> ff0a5c58d78c..e712444abff1 100644
> --- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> @@ -67,7 +67,7 @@ if:
>  then:
>    properties:
>      clocks:
> -      maxItems: 2
> +      minItems: 2

These specific variants have exactly 2 clocks. Having both limits seems right.

Best regards,
Jernej

> 
>    required:
>      - clock-names




