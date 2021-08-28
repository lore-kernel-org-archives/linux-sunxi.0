Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717763FC2
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Aug 2021 16:23:52 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id x10-20020a056830408a00b004f26cead745so12120779ott.10
        for <linux-sunxi@lists.linux.dev>; Sat, 28 Aug 2021 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e00tT1WGM1MeY+aTqkfLBt5Jw5xRDnXK4DZViwul0w4=;
        b=OGY7XuCS+3wQSZKNoOjPzD+Veeh9GBMavXAYkIR6oli4r+4VvzzVQMx+u26rzlJRgX
         O+FBBMBB+gmT4aX7WE4opxSP9teu9aHt27P2/Lp5njVurRNJHUT99TIs13gyOuvNBBi2
         k43kS2qfw4+zQXEh0biZdBkKDu51Nd6JCdIsAajanyQsZy8KUBuucOY8PxUILvOGUXoz
         lCmVgn/3VhvvZkd7zAxgRmj8uDsWxGqOnvEyUGfpepvn4M28vSxmiP1tjpZfs2x+nMNc
         sVXug/9z4Sgqcuj7/8Qwf7Q7VzLRMCCSOWwbnPq2g8CYH7m9M4y+SA1yxScb8jW/poOG
         DW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=e00tT1WGM1MeY+aTqkfLBt5Jw5xRDnXK4DZViwul0w4=;
        b=YAN0F9eaRd0fnG34B1KkuX8Bzyf80ULzyRiz43xfordzUK1XSOYpaSXxvnVEy5arMh
         B9rGL5WKNonE8VSeJX+bg9Jz+e81XSN6vXB85BqWz33iO21qz020iQtPIH0YsHUefS7d
         BYKMf86EYoP3aKJdZdPEm7wAQtHtN680Jw8zNHsQwDhV6RYMZddgSDJd8b5Y5FSlnv2o
         fa+8gk650+VQIoZOJJfkeXoXZTtAE+PrhfzDGqV4MGQKN/HF+hL9F4UHB+lT9zWOi/vW
         uRvxHMypZ66RSc/Fr4MdcrCDpN7VZGZ6zsDnLhTiXBMhYnKAGzijs7yNOX2yOgwqqe89
         QslQ==
X-Gm-Message-State: AOAM5330nSc6KhdMakKWXbx7oZpTp1ABfpLjcu6wWNH2oANa7bP/K8Rp
	V9xY/iRS6AH0qZcLaAhG6zw=
X-Google-Smtp-Source: ABdhPJwgheHP9xFxdiCDi0/2ty3Qhjm8CypzDW4X80tPGWRcHgx4iqDm18vlTXVU6xmvSUjtzhnsNA==
X-Received: by 2002:a9d:6c4c:: with SMTP id g12mr12465615otq.298.1630167831683;
        Sat, 28 Aug 2021 09:23:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 4sm1847076ooa.11.2021.08.28.09.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 09:23:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 28 Aug 2021 09:23:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Holland <samuel@sholland.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: watchdog: sunxi: Add compatible for
 D1
Message-ID: <20210828162349.GA824322@roeck-us.net>
References: <20210805045716.46141-1-samuel@sholland.org>
 <20210805045716.46141-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805045716.46141-2-samuel@sholland.org>

On Wed, Aug 04, 2021 at 11:57:15PM -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Acked-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes v1 to v2:
>  - None.
> 
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 8fa5b0d32381..6ef5e7caae80 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -29,6 +29,7 @@ properties:
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
>            - const: allwinner,sun4i-a10-wdt
> +      - const: allwinner,sun20i-d1-wdt
>  
>    reg:
>      maxItems: 1
> @@ -61,6 +62,7 @@ if:
>      compatible:
>        contains:
>          enum:
> +          - allwinner,sun20i-d1-wdt
>            - allwinner,sun50i-r329-wdt
>  
>  then:
