Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0A7C
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 19:43:30 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so7328320otb.8
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 12:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uIj8F7o3xWdPkZPlyBxdDMdHvNd/oWAtYl8AntcMkY=;
        b=gN5qNquFu9C4RkDwLVrSMdQwQRLcGaaCrBp0tWbGmMnQ5bYMiq+w80y9TptDOxA4sP
         Mc1Ep6WAKbxsAWbK7pTKUPwiN0O/3MJfvv7TeEqcWpWr65Zhw+aZhBpRz4UUbRpvDf7f
         Ez7aOE08xiy+sAEryywzQDHhkfb1ayDSNrDLB3APL/JoEDXT6SUUYkUA0gms07uGc4tv
         bixiKHT97+uVqtdn+QOd2wGwdZnDpmSbdtSDyzMwEqa2iWrhS1KFyqT/ixWCcTe0z3Uz
         muCJ1oAaAdr2SeqMWxc6u/pRvGr0LcnQfgcXdvDxZILU05kLh71cJvf+/3uR2TmBmKfc
         /ueQ==
X-Gm-Message-State: ACrzQf2m65q3qEnt3dRTscpvlGB1Uzub9/gOJDxZvC2pL/qA0v66rrGT
	2LuoCpUQ6nRZmFPKcA5zag==
X-Google-Smtp-Source: AMsMyM5g7KTSYGxrZRcKyiAux4UsYqX+I25nfP9WEslETBfWyT/AE2QXqBuAEAt4tQmd0TLlfMb3Gw==
X-Received: by 2002:a9d:4109:0:b0:66c:5346:4505 with SMTP id o9-20020a9d4109000000b0066c53464505mr3136867ote.224.1667245409784;
        Mon, 31 Oct 2022 12:43:29 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p22-20020a4a8156000000b0049052c66126sm2711866oog.2.2022.10.31.12.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:43:29 -0700 (PDT)
Received: (nullmailer pid 3304763 invoked by uid 1000);
	Mon, 31 Oct 2022 19:43:30 -0000
Date: Mon, 31 Oct 2022 14:43:30 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 01/12] dt-bindings: mtd: Clarify all partition subnodes
Message-ID: <20221031194330.GA3299482-robh@kernel.org>
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

Also, this node needs 'additionalProperties: false'. Unless there cases 
of custom properties here. If so, then it gets more complicated and 
we'll need a partitions.yaml schema instead so we can do:

$ref: partitions.yaml
properties:
  my-extra-custom-property: true

unevaluatedProperties: false

(Multiple node levels doesn't work for that as child nodes from 2 
different schemas can't 'see' each other.)

> +    properties:
> +      '#address-cells': true
> +      '#size-cells': true
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
