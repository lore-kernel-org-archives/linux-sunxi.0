Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDA47C
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 19:33:48 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-13bd2aea61bso14631249fac.0
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 12:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahMyyoN83BTbMMrhkPxnMNFzT+CMI4++uXPUE/MdHpM=;
        b=zt+zMjtqz3Oa5obrvEHsmNaKB8O+ignmropXODedIuKi3FIDgvJWbt9WKq2yVF8Y8p
         vB3oaYp0jETsZMBC3KS5Wj9/RVdOuX5UMEM9d9s7VxMiHBVxpJy9TwenUKKBZGXch2Ia
         YkAbKEf31vLh5GgOkt/Ap/ln7RL/NPAIH9tqzlIYMeSdkMwz5wmNaMhx6ppSmezoMxki
         V2uNrTY5MEgD20zIArFKw/sb29xDGx6N9p7cLRbAMgBzXf4vLSMFz0tidE3VGRLRTAfF
         mjYNoJxua8xlwyQj22NERdmSw7PpIJksp1/XXWkL1i4pmSrj1osmP7DsFLH+wad+2unR
         U5dQ==
X-Gm-Message-State: ACrzQf3/zab0ny5aHZsDMgxBCAxTtGC1teaMS2rOUgMgont+z9rF5dSi
	OOUrI/PcB1dKV4N84vAurQ==
X-Google-Smtp-Source: AMsMyM4l+TcsCdFGnvR3QaiG9UCl2pWcUZK2fq3fnZnqeQiOFRnod/8llhOVvWw3ORc5uoJnulLmDQ==
X-Received: by 2002:a05:6870:96a7:b0:13b:ceea:baf8 with SMTP id o39-20020a05687096a700b0013bceeabaf8mr18519996oaq.88.1667244825301;
        Mon, 31 Oct 2022 12:33:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bj23-20020a056808199700b00353ef11d6c9sm2656248oib.19.2022.10.31.12.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:33:44 -0700 (PDT)
Received: (nullmailer pid 3294529 invoked by uid 1000);
	Mon, 31 Oct 2022 19:33:46 -0000
Date: Mon, 31 Oct 2022 14:33:46 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 02/12] dt-bindings: mtd: Mention basic properties
Message-ID: <20221031193346.GB3291000-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-3-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-3-miquel.raynal@bootlin.com>

On Sat, Oct 29, 2022 at 01:59:23AM +0200, Miquel Raynal wrote:
> there to avoid the need to do it in each and every file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 9fcaa61b046c..10684b233ae3 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -21,6 +21,9 @@ properties:
>        based name) in order to ease flash device identification and/or
>        describe what they are used for.
>  
> +  '#address-cells': true
> +  '#size-cells': true
> +

These are only for 'partition' nodes, right? If so, they should be 
marked deprecated too.

>    partitions:
>      type: object
>      properties:
> -- 
> 2.34.1
> 
> 
