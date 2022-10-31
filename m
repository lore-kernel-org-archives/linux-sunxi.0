Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27001443D
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 21:01:21 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id d18-20020a05683025d200b00661c6f1b6a4so7455355otu.1
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 14:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=987jdJA0Irwu+IZt+ZSzTaDZw4daVI3hNs/okiLh6vM=;
        b=IZmIKutdh9WbPltEFiPE7cBno0ImtZ1VXaoAHB4Rw3eTCVQzIHcDSqRMU5RSJl3AsA
         uh6SZ8gPCdotakP0yeEI00hNEWxmJl2b8ueyX6GZI9UgosyXVxSXC85eSbFVgsGPMEoI
         V26mGvHYD4fkbu2j8O7xEReFGsmJwmnIrn0kb8LuPZeQu/zu10QSFI6VPIE+873HBQ13
         ToR52lA4x3OYDTu3EVS5DTSfVFM+nqL8XFEXOHUTS9jafMINCQlcVtLzkjtDm9PVlA0u
         NPnPf/H4C5K+9Z1wjv/i2NiX+bcjdMeFiU72JdYtSFECCwm4kFtbus1MT7OvyjekKiMR
         PFXQ==
X-Gm-Message-State: ACrzQf2JoaxjX5XRCqKjJX0p8iM6rXxY4ejmwyfaasblhbtnwSf66Mze
	NmV6heYi/2qJ7XfrT2EF7w==
X-Google-Smtp-Source: AMsMyM6jt4nH7hVXWH5OCQjRysxBsStJNZ3rr+kyfIzYoof8j3D7438kxcV2e885MttFwNCwrGNN3w==
X-Received: by 2002:a9d:22a5:0:b0:66c:358b:3931 with SMTP id y34-20020a9d22a5000000b0066c358b3931mr7533751ota.79.1667250080171;
        Mon, 31 Oct 2022 14:01:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ej32-20020a056870f72000b0013b9ee734dcsm3586697oab.35.2022.10.31.14.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 14:01:19 -0700 (PDT)
Received: (nullmailer pid 3512396 invoked by uid 1000);
	Mon, 31 Oct 2022 21:01:21 -0000
Date: Mon, 31 Oct 2022 16:01:21 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 11/12] dt-bindings: mtd: Argue in favor of keeping
 additionalProperties set to true
Message-ID: <20221031210121.GA3510754-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-12-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-12-miquel.raynal@bootlin.com>

On Sat, Oct 29, 2022 at 01:59:32AM +0200, Miquel Raynal wrote:
> In most cases we try to avoidit but in some cases this is

avoid it

> needed. Clarify why by adding a small comment.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml                  | 1 +
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml            | 1 +
>  Documentation/devicetree/bindings/mtd/partitions/partition.yaml | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
