Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D6B4424
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 21:10:08 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13bd19c3b68so14817912fac.7
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 14:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byO+eVFbmi2JQ5E3MJb1RGvLIDktwgzVitZO6ouN7wo=;
        b=nWSnONfLoW72WmTWaFlRc3+XLTIkAJakH8zPppwr02KqhV41Iev5suvGtr2CdvMayQ
         Mav9QwT8T4KG8oRhoSA6rYFB8RrKcgo2NOuMRRJdSFbi4hM71pWQoPFZzqeHEHgRGAq/
         F05HStney/hn6WIrhP5uLGY0nCFOkGcNzqI+H7ULrU9AyqyYTBHQK/c9raUCAS5zcOxK
         TvnXoszh5ar6NvHME2Y/tF1QaQ4Ie3UFM8LH5x0LIIPwHrJgxq/sa8IZxcsaEtBYixyN
         j2kNwwuzfPKYzVbFsc5kiKl+K59bJGBwKTUy7dtXYlV6spqqewg9a1vgFK03pnpVk+Lg
         IlZQ==
X-Gm-Message-State: ACrzQf0T7K/WJ/LvwFenpuT3h744OxsohFUcOl5jXVZUHnjBkFyxN42H
	BmMk+m4MRm0K8p3CSsJ+aQ==
X-Google-Smtp-Source: AMsMyM7dZOYdOCb1mto/Idcngckl/1c+JFp3aBXRCuJUrrtvUu24JUA3N2jFdQRjes/90Wb2FlzIkw==
X-Received: by 2002:a05:6870:e3d1:b0:13c:9dbb:7e95 with SMTP id y17-20020a056870e3d100b0013c9dbb7e95mr8929109oad.43.1667250607134;
        Mon, 31 Oct 2022 14:10:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r7-20020a4acb07000000b00494ed04f500sm2779419ooq.27.2022.10.31.14.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 14:10:06 -0700 (PDT)
Received: (nullmailer pid 3585087 invoked by uid 1000);
	Mon, 31 Oct 2022 21:10:08 -0000
Date: Mon, 31 Oct 2022 16:10:08 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 12/12] dt-bindings: mtd: Constrain the list of parsers
Message-ID: <20221031211008.GA3512582-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-13-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-13-miquel.raynal@bootlin.com>

On Sat, Oct 29, 2022 at 01:59:33AM +0200, Miquel Raynal wrote:
> Parser compatibles cannot be used anywhere, and the list is limited. In
> order to constrain this list, enumerate them all under the top
> "partitions" subnode. New parsers will have to add their own compatible
> here as well.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index bddb7bdf441b..29db0b5c115e 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -27,13 +27,29 @@ properties:
>    partitions:
>      type: object
>      properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - fixed-partitions
> +            - arm,arm-firmware-suite
> +            - brcm,bcm4908-partitions
> +            - brcm,bcm947xx-cfe-partitions
> +            - nksys,ns-partitions
> +            - nvmem-cells
> +            - qcom,smem-part
> +            - redboot-fis
> +
>        '#address-cells': true
> +
>        '#size-cells': true

Alternatively, you could add a 'oneOf' with $ref's to each partition 
type. Then we don't have the same compatible in 2 places. If you do, 
then the partition schemas should have a 'select: false' so we don't 
apply the schema twice.

Or keeping it like this is fine too.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
