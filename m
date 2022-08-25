Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251F1C2E
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 21:02:54 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id t11-20020a05683014cb00b0063734a2a786so14728890otq.11
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 14:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=zlDgSVi6ybm28ADf/l4jQxot81q6KSDv8EU/4KXm+fU=;
        b=i5i9YkbLOptbG0HvMxV/j/uzJyDOzBSU3v0ozQ5m/OaPpe1byjuO4zvxqONl4u60pi
         aStcWP1U510sXY8q0pMkuDG7XXvNn5ZjE4KFF15+0H+gDwhodF0yX48ubLC6othCdmr7
         UmMGbozx7k3skT2zpoqQjOh/h+J2EoIus3HJRSAGLDw+BdbFvsh2wkPZcV/ARQsN9o6e
         B3ENDjPkJzf6SC1APKe5XpXvZC0hS8WKOT1+v/nhM56SxTApv5gwSiExAnkCTqJy3TRg
         i4qcI+xQk942f24Tv02j+LpNaZYkYCkqc2QbJkO+Q5NPuk9tsght9y06ZWMq+sgFBAbh
         J+aA==
X-Gm-Message-State: ACgBeo3V+emjRsLyjuzxX/6ZhgYBDulprEPw8aSLO48e5KgLT9yPDkVd
	TizlUT75+o6yUGfwIyWn7g==
X-Google-Smtp-Source: AA6agR6Vlp9ebEknuUxzZiq3qwYENpFauxFBuzd6t2b++gnkgaGivXI0o6LrZdEEH5fh0PFr5laTyg==
X-Received: by 2002:a9d:748a:0:b0:637:1cf2:c8c4 with SMTP id t10-20020a9d748a000000b006371cf2c8c4mr338370otk.274.1661461373789;
        Thu, 25 Aug 2022 14:02:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t5-20020a4ab585000000b00448aff53822sm142942ooo.40.2022.08.25.14.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:02:53 -0700 (PDT)
Received: (nullmailer pid 1682027 invoked by uid 1000);
	Thu, 25 Aug 2022 21:02:52 -0000
Date: Thu, 25 Aug 2022 16:02:52 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] dt-bindings: nvmem: Allow bit offsets greater than a
 byte
Message-ID: <20220825210252.GA1671168-robh@kernel.org>
References: <20220814173656.11856-1-samuel@sholland.org>
 <20220814173656.11856-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220814173656.11856-4-samuel@sholland.org>

On Sun, Aug 14, 2022 at 12:36:54PM -0500, Samuel Holland wrote:
> Some NVMEM devices contain cells which do not start at a multiple of the
> device's stride. However, the "reg" property of a cell must be aligned
> to its provider device's stride.

How is a DT author supposed to know this? 

I would lean toward it's the OS's problem to deal with (your option 1 I 
guess). I worry that one client could expect it one way and another 
client the other. Or folks making DT changes to 'fix' things.

> 
> These cells can be represented in the DT using the "bits" property if
> that property allows offsets up to the full stride. 63 is chosen
> assuming that NVMEM devices will not have strides larger than 8 bytes.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  Documentation/devicetree/bindings/nvmem/nvmem.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> index 3bb349c634cb..4f440ab6a13c 100644
> --- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> @@ -53,7 +53,7 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32-array
>          items:
>            - minimum: 0
> -            maximum: 7
> +            maximum: 63
>              description:
>                Offset in bit within the address range specified by reg.
>            - minimum: 1
> -- 
> 2.35.1
> 
> 
