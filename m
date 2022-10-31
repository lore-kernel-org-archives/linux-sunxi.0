Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3F8F46
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 20:59:44 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-12c8312131fso14822914fac.4
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 13:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/c2XNU9qCi0/SIq7JxxxUeiJFklOM1fPVnjo5nHEOw=;
        b=5vIjYzwh0+ocvPjmlEyrlL5G1Rgvs55r/JQJUWWLlqrMzDcx5V4TLVb7jOav8Njshd
         VyWkd204MTZLf2tWQVTJgH5nkw0V7AkMRCzG+KzjDXx7fmxkGcUmQJtSEcJzJk+h7jG2
         SjCeCgjZ3URBO6lFOt19/AB5HOGAKgTR+MlTNFRFDOCAcjDuvVtSOxDH0UthnSH5r1SN
         4J0UALx0hDvD0hAj7gv07pxV98XlLXZFK3tg51Jki7XvRfS7ZgopZhJNz2gpUgCCRS9+
         5iQHbuKNhUJaEO4YAgnM2orqyDR7EpUcwce5GCnhuDxeu43EZ0+X+fx+DAWdVGEg5zx9
         pLqQ==
X-Gm-Message-State: ACrzQf36bKRDXwWRoc29Lo5mqPB4eD14LTXXtjLrZCm2OwrSSdMTZl2G
	uDOF7WLrtbJgef1GxKPUGw==
X-Google-Smtp-Source: AMsMyM7LswAnDKtLB5pnbZtOd1oJ1fXaUx7UPx0vVt58JL1FF2qxUk756+yv8MotVg8+NLv9lFOOTg==
X-Received: by 2002:a05:6870:2043:b0:13c:f48b:7ca8 with SMTP id l3-20020a056870204300b0013cf48b7ca8mr4428052oad.169.1667249983817;
        Mon, 31 Oct 2022 13:59:43 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y12-20020a4ae70c000000b00492f9f46aa4sm2746051oou.36.2022.10.31.13.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:59:43 -0700 (PDT)
Received: (nullmailer pid 3510647 invoked by uid 1000);
	Mon, 31 Oct 2022 20:59:44 -0000
Date: Mon, 31 Oct 2022 15:59:44 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Manivannan Sadhasivam <mani@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-sunxi@lists.linux.dev, Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH 10/12] dt-bindings: mtd: Drop object types when
 referencing other files
Message-ID: <166724998418.3510591.18309655417406556730.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-11-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-11-miquel.raynal@bootlin.com>


On Sat, 29 Oct 2022 01:59:31 +0200, Miquel Raynal wrote:
> Setting an object type is redundant when a reference is made, so drop
> these useless lines.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml             | 1 -
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 1 -
>  2 files changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
