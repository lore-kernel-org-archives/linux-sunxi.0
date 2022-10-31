Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6874A7C
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 19:32:25 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13ae8117023so14555710fac.9
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 12:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVVqsExfMH5y/nVKQLe7SB8sVIcEpxDpkI7AXNSICDk=;
        b=z9HAKKZoMj7/bT1S9xQ1P4QoaVXIfNCwSRS3l7laMgjNEW7GeqnGkpXQb8QXkeFVtK
         MMmBM30ZrOY0Dl0nZkr1mSy/+4TRZVXswBO7Z2aj/BLr+2pBW31m8ppYv2r5jqR7tiWy
         WduoIXknN4mro0N7iZViGRDhUcBEMaDMFVHaX0eM84JNx/BPQCbCkRlDIq7zIjnY5Orc
         BbQishZ5P3YwIJfmLqrLvOnznOaZuerqkCegsKCIM6s4ILVaQG3+CGHlj0dDwrLQLRas
         r6oS/sqz8pzHDY0N4IGh4yZcmCiZTRnQc2nIkmha7U0jY54D855ZOV7XjUQiNJEMcJvT
         XGQw==
X-Gm-Message-State: ACrzQf1FPvNAKrlz678Vv1zvfNS0y0vj6Y7204Vj3jrpKku+XjEZJxTp
	Q5chJ5hS7hI7TzENyFiznQ==
X-Google-Smtp-Source: AMsMyM51Ay/CK4pAwfGf+l/L2CO2NolCQmH5Ou1KvFFhPO09DUo2mDuk+qqH803TerpG8A6bPcDstw==
X-Received: by 2002:a05:6870:d78c:b0:136:ddfe:bf16 with SMTP id bd12-20020a056870d78c00b00136ddfebf16mr8358187oab.86.1667244744371;
        Mon, 31 Oct 2022 12:32:24 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m33-20020a056870562100b0012779ba00fesm3512244oao.2.2022.10.31.12.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:32:23 -0700 (PDT)
Received: (nullmailer pid 3293099 invoked by uid 1000);
	Mon, 31 Oct 2022 19:32:25 -0000
Date: Mon, 31 Oct 2022 14:32:25 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 01/12] dt-bindings: mtd: Clarify all partition subnodes
Message-ID: <20221031193225.GA3291000-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-2-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-2-miquel.raynal@bootlin.com>

On Sat, Oct 29, 2022 at 01:59:22AM +0200, Miquel Raynal wrote:
> Over time the various ways to define MTD partitions has evolved. Most of
> the controllers support several different bindings. Let's define all
> possible choices in one file and mark the legacy ones deprecated. This
> way, we can just reference this file and avoid dupplicating these
> definitions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 25b91f25fcf4..9fcaa61b046c 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -21,7 +21,25 @@ properties:
>        based name) in order to ease flash device identification and/or
>        describe what they are used for.
>  
> +  partitions:
> +    type: object
> +    properties:
> +      '#address-cells': true
> +      '#size-cells': true

These should only be 1 or 2 which I don't think is defined anywhere 
else.

> +
> +    patternProperties:
> +      "partition@[0-9a-f]+":
> +        $ref: partitions/partition.yaml
> +
>  patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: partitions/partition.yaml
> +    deprecated: true
> +
> +  "^partition@[0-9a-f]+":
> +    $ref: partitions/partition.yaml
> +    deprecated: true
> +
>    "^otp(-[0-9]+)?$":
>      type: object
>      $ref: ../nvmem/nvmem.yaml#
> -- 
> 2.34.1
> 
> 
