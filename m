Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769A17B
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Apr 2022 00:23:28 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-df26ea5bfbso1100740fac.1
        for <linux-sunxi@lists.linux.dev>; Thu, 31 Mar 2022 17:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fOE48022hc3x2gliekkxOTZif4fFeGF8GjZh2xBtXt4=;
        b=Z1qK+1NjhlltB/JbtV8s3NJs6uQLm4YZ1szg188Wu44Htmm1k3/VnS1Mylkn7x1nGN
         6kpH/3kbXt+VENdVQgdnHdmEFhbrh/3kB0uW2THIbLaBP9UAulrwxHUrw7Ec639MpuzI
         pTms/8OCQ35JMt6NXroXsq13qbSqB52JJCsQZDVMZnYiava/vEYug3WV+J8QPO7RUyh8
         RbF4eRVfUMb/RO2NizJHTZH2g8tBRtO1UQ28XFhnE8q87IfrY57tnS1A8bmibIDFmlAu
         rKUV5Cb69A5aFfeKng5LY6m0tpq3UoJrIWrRt8t9iOfaibeXU7bjOxrbsR47BEPHmoe2
         b0Xw==
X-Gm-Message-State: AOAM533IDu/GqC2YH6H2Ymk3z6CbkUYr4sbrAi/sFsMFiGPubsCHtdrm
	DZhYwSKnxrnOH/JbYMzmpw==
X-Google-Smtp-Source: ABdhPJwXfYSy4UVEgOmFowj/6TwnmGvQgex34BICM0iH5iTXjzsfi8KjQFplYq0mWrD5dTSk3o6wOQ==
X-Received: by 2002:a05:6871:85:b0:d9:ac7a:7a5a with SMTP id u5-20020a056871008500b000d9ac7a7a5amr3969928oaa.9.1648772607461;
        Thu, 31 Mar 2022 17:23:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t14-20020a05683014ce00b005b23657f66esm483609otq.31.2022.03.31.17.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 17:23:26 -0700 (PDT)
Received: (nullmailer pid 1773996 invoked by uid 1000);
	Fri, 01 Apr 2022 00:23:25 -0000
Date: Thu, 31 Mar 2022 19:23:25 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, jernej.skrabec@gmail.com, krzk+dt@kernel.org, samuel@sholland.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: crypto: sun8i-ce: remove extra line
Message-ID: <YkZF/STFg9u1g1BZ@robh.at.kernel.org>
References: <20220324144233.1119495-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324144233.1119495-1-clabbe@baylibre.com>

On Thu, Mar 24, 2022 at 02:42:33PM +0000, Corentin Labbe wrote:
> yamllint complains about this extra line.

It does? Where?

Or maybe we already fixed...

> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> index 00648f9d9278..026a9f9e1aeb 100644
> --- a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> @@ -82,4 +82,3 @@ examples:
>        clock-names = "bus", "mod";
>        resets = <&ccu RST_BUS_CE>;
>      };
> -
> -- 
> 2.34.1
> 
> 
