Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8792C82
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Nov 2021 16:13:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso2445186wml.1
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Nov 2021 08:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BqaMY4kaFXWYnw+VaMV/E8xThN/h/ADiRMd9YHdw7UA=;
        b=bgQhElR67eCSv0/YSUJi//NKt/20FDtRrJPTze0kztN3IZzyerJfd+HFn/qbBHjZYl
         i5iJb1lFpiJ9K6H5aRD4DGPcAQo0RxA4s5MkNeD9II2NfAYhFA7CZA9uvS1BOFFs5n80
         eCu6zPzyUVokM7GrAGvkuE5jdRdZn/cKyi41kO0d2mijXZZuYqD1djJv369BVS1Io+oc
         +J/wn8xR80IziRS/pXTjojcqVm9pZsVaGWIVkRPwtVO4r+5mlct8VI6ydQkVwmtg7159
         xsZJZFbt/OwYEA4pjw8YD0SYdpzJts+ta/T9qdrzbuAb60bvnNSA+u+uW6uDoyqct0vH
         9drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BqaMY4kaFXWYnw+VaMV/E8xThN/h/ADiRMd9YHdw7UA=;
        b=IW/Mw9TnBchKjX1T7486/7yD3NjpWPOpE0EKuaXdTi7N9obWs3/qhCXiIb2X3H8jsF
         zK6gP+OY9a7ZSGCsPi/hbUSH8jvP5B32TVZ9f/MA/1rh/1xThE36rYfDsZaOl+tNgI2O
         pNVgPsSYv/V8mzBYHZdtfGJQ0F9gSGaGAAsVAGEItPN9GTOg6WnpYESZqjWmm8Rz5nLz
         hTanI4OowQnNanMzPK4jSU4w8bpm0psGmio8E0wy10qA/KkD7x3Dj+XTf5do07zfsKos
         4jkb7Bv83+1CG4/kTuhOg5Wes8YY3L7HmyzS1b2t/vV2FO90auZoQGDUlrKCFM4Q2k5N
         ldlQ==
X-Gm-Message-State: AOAM533z0jUtiyX1NhRx8SITg8/KdjtB8NdzZOtu1KcLJoVxUFQ+02G6
	d1a+LEuDeYRRINYYXSBYLsw=
X-Google-Smtp-Source: ABdhPJw/XK0xa6zzZwAKYc/mRNjbCjL/N1lRyGhdIj9ustTSwbBNFtJOhwefxyiNWK9Go3z/VUXxJA==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr69273009wmi.115.1637079206153;
        Tue, 16 Nov 2021 08:13:26 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id c16sm17253971wrx.96.2021.11.16.08.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 08:13:25 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: Add optional dma properties
Date: Tue, 16 Nov 2021 17:13:24 +0100
Message-ID: <2603789.mvXUDI8C0e@kista>
In-Reply-To: <20211116143255.385480-1-maxime@cerno.tech>
References: <20211116143255.385480-1-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Maxime,

Dne torek, 16. november 2021 ob 15:32:55 CET je Maxime Ripard napisal(a):
> Some platforms, like the v3s, have DMA channels assigned to the crypto
> engine, which were in the DTSI but were never documented.
> 
> Let's make sure they are.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../bindings/crypto/allwinner,sun4i-a10-crypto.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-
crypto.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-
crypto.yaml
> index 0429fb774f10..dedc99e34ebc 100644
> --- a/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-
crypto.yaml
> +++ b/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-
crypto.yaml
> @@ -44,6 +44,16 @@ properties:
>        - const: ahb
>        - const: mod
>  
> +  dmas:
> +    items:
> +      - description: RX DMA Channel
> +      - description: TX DMA Channel
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
>    resets:
>      maxItems: 1
>  
> -- 
> 2.33.1
> 
> 


