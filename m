Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004E13FC7
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Sep 2021 15:11:50 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso2731635otp.1
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Sep 2021 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LsO7ChoiOUbdf0evlicIaWpHPtdos4bfdl0lagLpQi8=;
        b=jFFKC+7ydZD0CmfMIj9jryBDPrD8OC331sUesCkXUkA1hiHFuoUDPSZCWrdSgH/rZU
         8aoUKIifcstigpw1jhVmmxSFYcmoCPfj4jZZYLU7XucmnjLrqbEkoP2Ccck4ZIj4fClT
         ijK8rCYC19MRu8SIkQz6DWzcWxCFBBnwks0Lw/Ay8bJobzmkcTctKt5+LuqPhIe2ifH6
         /DDiFOud/V64LuiUxMbpVKRZUNl25/Wmd3HkOuS1Yj39XdpOchbKI84cvkwArXGXgmdJ
         l+LbKuVYyDAs5jt8dWUUjsAsaZh2Y+QsKhU1oXww4KaNRMVp/LTLB2o94uMVkumDZu2n
         GKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=LsO7ChoiOUbdf0evlicIaWpHPtdos4bfdl0lagLpQi8=;
        b=hf5tg/E6QvFScMfPdE9SziXKg45PX7VqmnOS8kAfPW2MRvRqpiOk6iV0JT6JqlLpPk
         c7Pyi4Io51K9o0bx1/WVf3jsbedmQE8c8i13agntJOviHJY9qR7v3T555O0oebYJEXwN
         3HV8fRd6oXQBDz/m+1CzBi5dlIN8WqSndcOpxzaYtfg9gQgEdgYnQJUYj9GRor3pj6qa
         n6VlUM5JLIjUmJQo1Lry/8uMi+7rpv+4KGdp2kZIuBieUmDR8NJBwQ6lmwF0byhaYnuA
         3JuG4cOPvOQm2Zp/PUNGJ572EEKT9OErLfcm4B9A9PALBryY2hfYrgMyT6wEfotaYXCZ
         QNRA==
X-Gm-Message-State: AOAM531ska2JSTUKz5Kiz5xLacMRRRNgqPU9F/JjK6bAaDRtbA+JoYPu
	JCId1do95jCfIy5GETyJ0iA=
X-Google-Smtp-Source: ABdhPJxq2ImOOCGgziVvhGxFIqJeuPTlcWvwwDubYXJAg+nxscgQK8iGkKUPLvx+DnC+FlKQC4Qw8Q==
X-Received: by 2002:a9d:4b86:: with SMTP id k6mr3725632otf.338.1630768310180;
        Sat, 04 Sep 2021 08:11:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c75sm531751oob.47.2021.09.04.08.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 08:11:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 4 Sep 2021 08:11:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Holland <samuel@sholland.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: watchdog: sunxi: Add compatibles for
 D1
Message-ID: <20210904151148.GA3638506@roeck-us.net>
References: <20210902225750.29313-1-samuel@sholland.org>
 <20210902225750.29313-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902225750.29313-3-samuel@sholland.org>

On Thu, Sep 02, 2021 at 05:57:49PM -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Similarly to the R329, the D1 has three watchdog instances, and only one
> of them has the "soft reset" registers. So that instance needs an extra
> compatible string.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Acked-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes v2 to v3:
>  - Add additional allwinner,sun20i-d1-wdt-reset compatible
> Changes v1 to v2:
>  - None
> 
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 877f47759814..44cad9427ae6 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -30,6 +30,10 @@ properties:
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
>            - const: allwinner,sun4i-a10-wdt
> +      - const: allwinner,sun20i-d1-wdt
> +      - items:
> +          - const: allwinner,sun20i-d1-wdt-reset
> +          - const: allwinner,sun20i-d1-wdt
>  
>    reg:
>      maxItems: 1
> @@ -62,6 +66,8 @@ if:
>      compatible:
>        contains:
>          enum:
> +          - allwinner,sun20i-d1-wdt
> +          - allwinner,sun20i-d1-wdt-reset
>            - allwinner,sun50i-r329-wdt
>            - allwinner,sun50i-r329-wdt-reset
>  
