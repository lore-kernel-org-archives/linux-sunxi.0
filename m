Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FA2F21
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Feb 2022 22:21:19 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id x193so10287991oix.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Feb 2022 14:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z3JMW2yZttnXWB73Kc9ilTSw1PTFSAZTZxgKEm+ViCI=;
        b=gT1bTnexstmGpyZEeRBECA6E6mayUVWO3EQG5Y1LDDRV0KmKIRBCm6DY4yHn/Yrqv7
         qkMg9lWrcMm7QZnJCI+sxIPdhTqz1pV6zahZaFCd0HFw/KTUoJLpC2srxvG1WLpM1Vt1
         O0/uNlYDfLFXS3NpzZYwdUJUxDB9YicNonSby2PyS/h243VWXE8vygJkQIhWN8axnhLZ
         vzOQoAWGusahvJJPWfqxRAbpNhM4PS05LlsqvK7mgkCdxtMcmakgHJNrbkFOVp/FkeAE
         ta8RNjjp7WkTZUIqEAwg089JzVNF+YDjx2FAJ9jaQ8fiNX/ZVqpj6XXhTwfNkISBn9t4
         kUiw==
X-Gm-Message-State: AOAM533cxge7Dc/EOaDFutgQQcp1ti6T40lXcn0vndROBQ2P5f5mzzel
	1sk2e9sUCz4+Nycma0bPug==
X-Google-Smtp-Source: ABdhPJwpZtYU6c3ypc+PbXSeyEaUfExaJMPhfDFP8M3HEfo9t/rJKUTjaRX5QhQtzj24iqPFsYn6+A==
X-Received: by 2002:a54:460e:: with SMTP id p14mr2450971oip.162.1644013279244;
        Fri, 04 Feb 2022 14:21:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x12sm1229247otq.6.2022.02.04.14.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 14:21:18 -0800 (PST)
Received: (nullmailer pid 3286046 invoked by uid 1000);
	Fri, 04 Feb 2022 22:21:17 -0000
Date: Fri, 4 Feb 2022 16:21:17 -0600
From: Rob Herring <robh@kernel.org>
To: Evgeny Boger <boger@wirenboard.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 2/3] dt-bindings: net: support for Allwinner R40 EMAC
 controller
Message-ID: <Yf2m3RwR4ZGPnS8G@robh.at.kernel.org>
References: <20220113053734.105813-1-boger@wirenboard.com>
 <20220113053734.105813-3-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113053734.105813-3-boger@wirenboard.com>

On Thu, 13 Jan 2022 08:37:33 +0300, Evgeny Boger wrote:
> R40 and A10/A20 share the same EMAC IP.
> However, on R40 the EMAC reset needs to be deasserted first,
> so resets property is required.
> 
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  .../bindings/net/allwinner,sun4i-a10-emac.yaml  | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
