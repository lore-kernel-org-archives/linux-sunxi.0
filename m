Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC858F46
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 20:55:12 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id v81so5347325oie.5
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 13:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCSN6Z+0y4J22903M64Zf4+jbjsk7cN/Snw9CD4bul8=;
        b=XL2SnEpk/J4B3gaIlLOXasQhjMSyE/0orZqcA3HW0aFENZAhhTWv0RElvVT2lFeUUV
         frxAuT84unsQTwSANEmNutER3w3OQjzgodxWNVvh5oteH+jkcxv1JdaG2Y+erVdXeEPr
         cXpkMpTQWF0sssrglO+poauJdcA6Poj3HTxXGVJ7Ik1WpsI0NiyhCBULuIv98LYkl+6k
         u7R+LVETElsOsqLmq693OQGwLhZjEDZN71OSecfLCggikdrxnvVancIw63yJFwXcVH3A
         xRnrq6E8cJWaWNTd272OzTx69Hwv1Ey5ekSLsrLVJCfxs43NWpF6gHJ5hdPGxFGYJWuS
         i8Sw==
X-Gm-Message-State: ACrzQf2zFkc1TzzJw7Req4oiUBzWyKkx6epv8H45x2Qk3X8/29H2MsIM
	kmJB8peYiLwwY9PBfR/N8w==
X-Google-Smtp-Source: AMsMyM7XjXOlecZaxEkia4ZmEGJQotcenwAVinqsz6x6j+hsDlruF/WE8oHbdwgzxZc0aE6fkaNnfg==
X-Received: by 2002:a05:6808:f09:b0:359:b15d:349c with SMTP id m9-20020a0568080f0900b00359b15d349cmr14725300oiw.57.1667249711409;
        Mon, 31 Oct 2022 13:55:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fp42-20020a05687065aa00b0013bc95650c8sm3541051oab.54.2022.10.31.13.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:55:10 -0700 (PDT)
Received: (nullmailer pid 3505400 invoked by uid 1000);
	Mon, 31 Oct 2022 20:55:12 -0000
Date: Mon, 31 Oct 2022 15:55:12 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Walle <michael@walle.cc>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 06/12] dt-bindings: mtd: nand-chip: Reference mtd.yaml
Message-ID: <166724971189.3505343.6716916963356990521.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-7-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-7-miquel.raynal@bootlin.com>


On Sat, 29 Oct 2022 01:59:27 +0200, Miquel Raynal wrote:
> A NAND chip is an MTD device. mtd.yaml already defines many useful and
> relevant properties, let's reference this file here to get access to
> these additional property definitions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
