Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABB3481
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Jul 2021 04:24:52 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id x3so4666160qkl.6
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Jul 2021 21:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7Oqj3DttJ5RhEJCqZkn0/WMVhGGM0rTesKNmkQoAdSg=;
        b=l+w5qTrAUfiJGPqP+BIKupqZOTbFZyq9f2ChgMbFZrCOSpM7nb2S+o1Jy99HoSLAdl
         V/4RzbWceiywjoYdXUD27eRMLKoexStLUvEZX5SYtpfBZq05+YnRmNqQlSkOqhZySKnT
         6E8/GOKw9GNKPz8H+oalgsmKb+Vj8BuC1zHsD8EtoCKAOFfpeKj7ZRFz8QDna0NDxth6
         kDQr5hVQyxYnyI+f8++f8xx/9IKwDitR/d2tSmQarVLoQ2at/zWYRQPNlzEoBYMCnN2e
         9C4JoLg4Y/yUnkCXmaRfcAwRVKKY+mD687U3PR6WQ8pNPSC+CamJUvs7IR5UBBaibUVs
         NSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=7Oqj3DttJ5RhEJCqZkn0/WMVhGGM0rTesKNmkQoAdSg=;
        b=pNEVflhhC5et5mfGJgl5cSooB/ZrBI2X3jr9SD3LQ+NMDy1DSM2uD18yOT+uRJE3bX
         m4RXcRNEd+2Qdzk0P/+VH1z9c8xTdAk0sssya9slka8jAe+7QnbIsJC2G5y7IfxwGtgL
         cMlk9pGygD3h/5r1H7bLYnMnXF88f7bEe0ZR73DB0GwigRWI5LsTCwRQCP8UlPtUMeiQ
         pE4WIzu0d4veixQAFoyoGjHzLTjq6z5rYQ9MCaxw+Fd/vT8a8JjK8Q/Y+L4qdrYP0+T3
         KeTGzh3Sn3+EOnycjTPRK+pvyfvaaO+OHtLPWsnQcvoLObQgvwhHrepurHuQ1js6xc3J
         vijA==
X-Gm-Message-State: AOAM530R4Gybi/dTfMZhCGs2j01H8QWEUc/RFqRRiwZVxRKelKzPS56x
	x/EtCa9z+qR5k+9GdpHHoco=
X-Google-Smtp-Source: ABdhPJz4GevoejyfdnOCq1g5/zuOuNU2b/OD8GiMc+U3hhNU0CHPpZcIgdplnlu3wFkebxkhJY/O0A==
X-Received: by 2002:a05:620a:204c:: with SMTP id d12mr3279206qka.417.1627532691260;
        Wed, 28 Jul 2021 21:24:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n14sm846138qti.47.2021.07.28.21.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:24:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 28 Jul 2021 21:24:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Holland <samuel@sholland.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: sunxi: Add compatible for D1
Message-ID: <20210729042449.GA1716994@roeck-us.net>
References: <20210726035143.53132-1-samuel@sholland.org>
 <20210726035143.53132-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726035143.53132-2-samuel@sholland.org>

On Sun, Jul 25, 2021 at 10:51:42PM -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 853ceb1b7c0f..756e6ab99860 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -29,6 +29,7 @@ properties:
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
>            - const: allwinner,sun4i-a10-wdt
> +      - const: allwinner,sun20i-d1-wdt

Alignment is off.

Guenter

>  
>    reg:
>      maxItems: 1
> @@ -59,6 +60,7 @@ if:
>      compatible:
>        contains:
>          enum:
> +          - allwinner,sun20i-d1-wdt
>            - allwinner,sun50i-r329-wdt
>  
>  then:
