Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E54D443D
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 20:54:42 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13c569e5ff5so14402883fac.6
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 13:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlLgdjn9D1YIceaBfkfEVV7Xu0o6/DdkHOK6FWg7DXs=;
        b=BiOmwGFEiy1AjiuzpGjLmRM4eespHUKlUiVrex1I3lPvmMiNytl/xiNMpLmWOQh1tN
         uhTxmy61RX05O22M8sIEyCylTBrAiPhk7E40I8JKs4mznX1Pn7nBMY3rrTuxxj427GHo
         rMoLHQnKy2rHttpg2SH4FVePqDfLil+cTNz2cdPfaAMR/mu/O9jIYBj+dpkRcX2/AFZT
         OoYo0dUN34Hys427NmWqaiZZyJhSnzgJXH9g/pR0LXBlkzC1fSdBeuAmPX4y72cIMhK/
         I3A7edfPncfTC5b5ruiVADaUoBtoNeYt9YPBka/il9WBjoinN6ct2jlG5Aj0QCNgU1ff
         FeZA==
X-Gm-Message-State: ACrzQf0amIGCj2+rYt2JywpfZSAyTcmYB8F95Ca+kognUwWnpS4YSfQT
	EhbClrxo46ZBfjUy2PqP4A==
X-Google-Smtp-Source: AMsMyM7vTUsE4Eu/4WH4ujPZbj5pkakgbRyAll6n+tNS+7ne5KKzHQQXzNKYvu6fsABenaccKwfl4Q==
X-Received: by 2002:a05:6870:a7a5:b0:125:76da:1bc1 with SMTP id x37-20020a056870a7a500b0012576da1bc1mr19209128oao.272.1667249681241;
        Mon, 31 Oct 2022 13:54:41 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d94-20020a9d2967000000b0066b9a6bf3bcsm3152995otb.12.2022.10.31.13.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:54:40 -0700 (PDT)
Received: (nullmailer pid 3504734 invoked by uid 1000);
	Mon, 31 Oct 2022 20:54:42 -0000
Date: Mon, 31 Oct 2022 15:54:42 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 05/12] dt-bindings: mtd: onenand: Mention the expected
 node name
Message-ID: <20221031205442.GA3307775-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-6-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-6-miquel.raynal@bootlin.com>

On Sat, Oct 29, 2022 at 01:59:26AM +0200, Miquel Raynal wrote:
> The chip node name in this driver is expected to be different and should
> be prefixed with onenand instead of the regular "flash" string, so
> mention it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> index a953f7397c40..8a79ad300216 100644
> --- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> @@ -15,6 +15,9 @@ description:
>    as child nodes of the GPMC controller.
>  
>  properties:
> +  $nodename:
> +    pattern: "^onenand@[0-9],[0,9]$"

I don't think it is worth enforcing node names that we 
haven't defined in the spec. Wouldn't 'nand-controller' be appropriate?

> +
>    compatible:
>      const: ti,omap2-onenand
>  
> -- 
> 2.34.1
> 
> 
